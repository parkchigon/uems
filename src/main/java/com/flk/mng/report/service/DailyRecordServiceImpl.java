package com.flk.mng.report.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.flk.batch.mapper.BatchTaskMapper;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.LogUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.report.domain.DailyRecord;
import com.flk.mng.report.domain.Report;
import com.flk.mng.report.mapper.DailyRecordMapper;
import com.flk.mng.report.mapper.ReportMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;

@Service
public class DailyRecordServiceImpl implements DailyRecordService{

	private static final Logger logger = LoggerFactory.getLogger(DailyRecordServiceImpl.class);
	
	@Autowired
	private DailyRecordMapper dailyRecordMapper;
	
	@Autowired
	private ReportMapper reportMapper;
	
	@Autowired
	private SiteMapper siteMapper;
	
	@Autowired
	private BatchTaskMapper batchTaskMapper;
	
	@Value("#{config['report.file.path']}")
    private String reportFilePath;
	

	/**
	 * ??????????????? > ???????????? ?????? ????????? ??????
	 * @param dailyRecord
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectDailyRecordList(DailyRecord dailyRecord) throws Exception {
		return dailyRecordMapper.selectDailyRecordList(dailyRecord);
	}

	/**
	 * ??????????????? > ???????????? ?????? ??????
	 * @param dailyRecord
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional
	public int addDailyRecord(DailyRecord dailyRecord) throws Exception {
		int result = 1;
		try {
			
			if(!StringUtils.isEmpty(dailyRecord.getInsertDailyRecordList())){
				dailyRecord.getInsertDailyRecordList().add(dailyRecord.getRegId());
				dailyRecord.getInsertDailyRecordList().add(dailyRecord.getUpdateId());
				dailyRecord.getInsertDailyRecordList().set(0, dailyRecord.getInsertDailyRecordList().get(0).replace(":", ""));
				dailyRecordMapper.insertDailyRecord(dailyRecord.getInsertDailyRecordList());
			}
			
			if(!StringUtils.isEmpty(dailyRecord.getUpdateDailyRecordList())){
				for(int i=0 ; i<dailyRecord.getUpdateDailyRecordList().size() ; i+=4){
					DailyRecord updateRecords = new DailyRecord();
					updateRecords.setDrId(dailyRecord.getUpdateDailyRecordList().get(i));
					updateRecords.setReason(dailyRecord.getUpdateDailyRecordList().get(i+1));
					updateRecords.setResult(dailyRecord.getUpdateDailyRecordList().get(i+2));
					updateRecords.setEtc(dailyRecord.getUpdateDailyRecordList().get(i+3));
					updateRecords.setUpdateId(dailyRecord.getUpdateId());
					dailyRecordMapper.updateDailyRecord(updateRecords);
				}
			}
			
			if(!StringUtils.isEmpty(dailyRecord.getDeleteDailyRecordList())){
				dailyRecordMapper.updateDailyRecordNotUse(dailyRecord);
			}
			
		} catch (Exception e) {
			result = 0;
			logger.error("addDailyRecord error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}

	/*@Value("#{config['report.templete.file.path']}")		//?????????????????? ??????
	private String templatePath;               //????????? ????????? ?????? ?????? ??????  //?????????????????? ??????
*/	
	/**
	 * ???????????? ????????? ??????
	 */
	@Override
	public Map<String, Object> createSituationReport(HttpServletRequest request, DailyRecord dailyRecord) throws Exception{
	
		Map<String, Object> resultMap = new HashMap<String, Object>();

		/**
		 * 1. DB?????? ????????? ???????????? ????????? ?????? ??????
		 * 2. ?????? ????????? ?????? ?????? ?????? ??????
		 * 3. ????????? ?????? config ?????? ?????? -> map??? ??????
		 * 4. ????????? ?????? ?????? ?????? ??????
		 * 5. DB?????? ????????? ??????
		 * 5-2. ???????????? header ???????????? DB ????????? ?????? ???????????? ????????????
		 * 6. excel ????????? ??????
		 * 7. DB??? ????????? ????????? ?????? ??????
		 *  
		 */
		
		Report report = new Report();
		report.setLastIndex(1);
		report.setReportSubType("02");
		report.setSearchType("M"); // ??????????????? ????????? ??????
		report.setSiteId(dailyRecord.getSiteId());
		List<FlkMap> templeteList = reportMapper.selectReportTempleteList(report);
		
		//Map<String, Object> configMap = new HashMap<>();
		FlkMap siteInfo = reportMapper.selectReportSiteList(report);
		
		for(FlkMap templateMap : templeteList) {
			//String filePath = templatePath;	//?????????????????? ??????
			//String fileName = "????????? ????????????_????????????_tobe.xlsx";
			String filePath = (String) templateMap.get("fileServerPath");
			String fileName = (String) templateMap.get("fileName");
			
			
			/** ?????? ?????? */
			XSSFWorkbook excelTempleteWorkbook = readExcelTempleteFile(filePath + fileName);
			//configMap = makeReportConfigMap(excelTempleteWorkbook);
			
			//Map<String, Object> dateMap = (Map<String, Object>) configMap.get("dateMap");
			//int startDay = Integer.parseInt(String.valueOf(dateMap.get("startDay")));
			//int endDay = Integer.parseInt(String.valueOf(dateMap.get("endDay")));
			String reportType = ((String)templateMap.get("reportType")).toUpperCase();
			
			Map<String, Object> paramMap = new HashMap<>();
			Map<String, Object> reportInsertMap = new HashMap<>();	//?????? ?????? ?????? ??? DB??? ?????? ????????? ?????? ???

			//??? ?????? ???????????? ??????
			Calendar cal = Calendar.getInstance();
			String nowDate = (new SimpleDateFormat("yyyyMMddHHmm").format(cal.getTime()));
			//cal.add(Calendar.MONTH, -1);
			//Date date = cal.getTime();
			
			//String startDate = (new SimpleDateFormat("yyyyMM").format(date))+String.format("%02d", startDay);
			//String endDate = (new SimpleDateFormat("yyyyMM").format(date))+String.format("%02d", endDay);

			String buildingId = (String) siteInfo.get("siteCd");
			String reportDateRange = getDateTime(buildingId, dailyRecord.getCheckMonth(), dailyRecord.getCheckYear());	
			String startDate = reportDateRange.split(",")[0];
			String endDate = reportDateRange.split(",")[1];
			
			paramMap.put("startDate", startDate);
			paramMap.put("endDate", endDate);
			
			//????????? ?????? ?????? ?????? ?????? ??????
			//dateMap.put("startDate", startDate);
			//dateMap.put("endDate", endDate);
			//configMap.put("dateMap", dateMap);
			
			Calendar reportInsert = Calendar.getInstance();
			reportInsert.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(startDate));
			if(reportInsert.get(Calendar.HOUR_OF_DAY) > 0) {
				reportInsert.add(Calendar.DAY_OF_MONTH, 1);
			}
			reportInsertMap.put("reportStartDate", new SimpleDateFormat("yyyyMMdd").format(reportInsert.getTime()));
			reportInsertMap.put("reportEndDate", endDate.substring(0, 8));
			reportInsertMap.put("rtId", templateMap.get("rtId"));
			
			/** ?????? ????????? ????????? ?????? ??????????????? ?????? ?????? ????????? ?????? ??????
			 *  ??????????????? ????????? ?????? ????????? ???????????????, ????????? ????????? ???????????? ?????? ?????? ???????????? ??????
			Calendar cur = Calendar.getInstance();
			Calendar end = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			
			end.setTime(sdf.parse(endDate));
			
			if(cur.before(end)) {
				continue;
			}
			 */
			
			//????????? ???????????? ?????? ???????????? ?????? ?????? ????????? ?????? ??????
			paramMap.put("rtId", templateMap.get("rtId"));
			paramMap.put("startDateForCheck", reportInsertMap.get("reportStartDate"));
			paramMap.put("endDateForCheck", reportInsertMap.get("reportEndDate"));
			paramMap.put("siteId", dailyRecord.getSiteId());
			paramMap.put("sitedesc", siteInfo.get("siteDesc"));
			int checkReport = batchTaskMapper.checkReport(paramMap);
			if(checkReport >= 1) {
				// TODO JAR continue;
			}
			paramMap.put("chkYear", dailyRecord.getCheckYear());
			paramMap.put("chkMonth", dailyRecord.getCheckMonth());
			paramMap.put("buildingId", siteInfo.get("siteCd"));
			
			//????????? ?????? ??????
			makeDailyRecordFile(excelTempleteWorkbook, paramMap, nowDate, templateMap, reportInsertMap, resultMap);
			
			
		}

		return resultMap;
	}
	
	/**
	 * ????????? ????????? ?????? ??????
	 * @param templateFilePath
	 * @return
	 * @throws Exception
	 */
	public static XSSFWorkbook readExcelTempleteFile(String templateFilePath) throws Exception {
		
		File file = new File(templateFilePath);
		
		if(!file.exists()) {
			logger.error("Report Templete File is not exist");
			logger.error("Req templateFilePath : " + templateFilePath);
			throw new Exception("Report Templete File is not exist");
		}
		FileInputStream is = null;
		XSSFWorkbook workbook = null;
		try {
			is = new FileInputStream(file);
			workbook = new XSSFWorkbook(is);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		} finally {
			try {
				is.close();
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		
		return workbook;
	}
	
	/**
	 * ?????? ??????/????????? ??????
	 * @param siteCd
	 * @return
	 * @throws Exception
	 */
	private String getDateTime(String siteCd, String month, String year) throws Exception {
		
		// ???????????? > ??????????????? / ??????????????? ??????
		Site site = new Site();
		site.setSiteCd(siteCd);
		FlkMap siteInfo = siteMapper.selectSiteView(site);
		String startDay = (String) siteInfo.get("statStartDay");
		String endDay = (String) siteInfo.get("statEndDay");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
		Date nDate = dateFormat.parse(year + month+"01");
		Calendar start = Calendar.getInstance();
		start.setTime(nDate);
		Calendar end = Calendar.getInstance();
		end.setTime(nDate);
		SimpleDateFormat sdf_yyyyMMddHHmm = new SimpleDateFormat("yyyyMMddHHmm");
		
		// 1??? ????????? ???????????? ?????? 31???
		if(StringUtils.equals(startDay, "01")) {
			//start.add(Calendar.MONTH, -2);
			start.add(Calendar.MONTH, -1);		// 2018-03-06 ??????
			int preMaxEndDay = start.getActualMaximum(Calendar.DAY_OF_MONTH);
			start.set(Calendar.DAY_OF_MONTH, preMaxEndDay);
			//end.add(Calendar.MONTH, -1);
			
			int maxEndDay = 0;
			
			maxEndDay = end.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			start.set(Calendar.HOUR_OF_DAY, Math.abs(23));
			start.set(Calendar.MINUTE, 00);
			
			end.set(Calendar.DAY_OF_MONTH, maxEndDay);
			end.set(Calendar.HOUR_OF_DAY, 22);
			end.set(Calendar.MINUTE, 59);

			if(end.getActualMaximum(Calendar.DAY_OF_MONTH) != end.get(Calendar.DAY_OF_MONTH)) {
				end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH));
			}
			
		} else {
			start.set(Calendar.DAY_OF_MONTH, Math.abs(Integer.parseInt(startDay)-1));
			
			start.set(Calendar.HOUR_OF_DAY, Math.abs(23));
			start.set(Calendar.MINUTE, 00);
			
			end.add(Calendar.MONTH, +1);
			end.set(Calendar.DAY_OF_MONTH, Math.abs(Integer.parseInt(endDay)));
			end.set(Calendar.HOUR_OF_DAY, 22);
			end.set(Calendar.MINUTE, 59);
		}
		
		String result =  sdf_yyyyMMddHHmm.format(start.getTime())+","+ sdf_yyyyMMddHHmm.format(end.getTime());
		
		//System.out.println("result:"+result);
		
		return result;
		
	}
	
	/**
	 * ????????? ??????(????????????) ?????? 
	 * @param workbook
	 * @param configMap
	 * @param paramMap
	 * @param tempSetTime
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> makeDailyRecordFile(XSSFWorkbook workbook,
			Map<String, Object> paramMap, String tempSetTime, FlkMap templateMap, Map<String, Object> reportInsertMap, Map<String, Object> resultMap ) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
				
			//DB?????? ???????????? ????????? ????????????
			List<FlkMap> reportData = batchTaskMapper.selectDailyRecordExcelList(paramMap);
			
			if(!reportData.isEmpty()){
				//column ??????
				int colArray[] = new int[]{1,3,5,6,13,20,27};
				Map<String, String> dataMap = new HashMap<String, String>();
				dataMap.put(Integer.toString(colArray[0]), "date");
				dataMap.put(Integer.toString(colArray[1]), "time");
				dataMap.put(Integer.toString(colArray[2]), "recordTypeNm");
				dataMap.put(Integer.toString(colArray[3]), "recordName");
				dataMap.put(Integer.toString(colArray[4]), "reason");
				dataMap.put(Integer.toString(colArray[5]), "result");
				dataMap.put(Integer.toString(colArray[6]), "etc");
				
				XSSFSheet sheettest = workbook.getSheetAt(0);
				workbook.setSheetName(0, (String) reportData.get(0).get("siteName"));
				
				/**
				 * 1. data??? 29??? ????????? ??? ??? ??????
				 * 2. ????????? ?????? ????????? ??????
				 * 3. ????????? cell??? ????????? ??????
				 */
				
				//Sheet Cells Data
				/*int totalRowCnt = reportData.size();
				int totalPageCnt = totalRowCnt / 29;
				if(totalRowCnt % 29 > 0){
					totalPageCnt += 1;
				}*/
	
				//Sheet Title
				
				/*Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.MONTH, 0);*/
				
				String sheetTitle = "?????????????????????("+(String) reportData.get(0).get("siteName")+") " + paramMap.get("chkYear") +"??? "+ paramMap.get("chkMonth") + "???";
				
				XSSFRow titleRow = sheettest.getRow(0);
				XSSFCell titleCell = titleRow.getCell(29);
				if(titleCell == null){
					titleCell = titleRow.createCell(29);
				}
				titleCell.setCellType(titleCell.CELL_TYPE_STRING);
				titleCell.setCellValue(sheetTitle);
				
				/*if(totalPageCnt > 1){
					for(int j = 1 ; j < totalPageCnt ; j ++){
						for(int m = 0 ; m<38 ; m++){
							XSSFRow row = sheettest.getRow(m);
							XSSFRow addRow = sheettest.createRow(m+38*j);
							addRow.setHeight((short) 600);
							
							for(int l=0 ; l<28 ; l++){
								XSSFCell addCell = addRow.getCell(l);
								if(addCell == null){
									addCell = addRow.createCell(l);
								}
								XSSFCell cell = row.getCell(l);
								if(cell == null){
									cell = row.createCell(l);
								}
								addCell.setCellType(cell.getCellType());
								addCell.setCellStyle(cell.getCellStyle());
								
								String value = "";
								switch (addCell.getCellType()) 
								{
								   case XSSFCell.CELL_TYPE_FORMULA : // ??????????????? ??? ???(A1+B1)??? ??????????????? ????????? ????????????.  
									   value = cell.getCellFormula();
								       break;
								   case XSSFCell.CELL_TYPE_NUMERIC : // ?????????????????? ???????????? ????????? ????????????.
									   value = cell.getNumericCellValue()+""; //double
								        break;    // ?????????????????? ???????????? ????????????.
								   case XSSFCell.CELL_TYPE_STRING :
									   value = cell.getStringCellValue(); //String
								        break; // ?????? ?????? ????????? ??????
								   case XSSFCell.CELL_TYPE_BLANK :
									   value = null;
								        break; // BOOLEAN?????? ??????
								   case XSSFCell.CELL_TYPE_BOOLEAN :
									   value = cell.getBooleanCellValue()+""; //boolean
								        break; // ?????? ???????????? ????????????.
								   case XSSFCell.CELL_TYPE_ERROR :
									   value = cell.getErrorCellValue()+""; // byte
								        break;
								   default :
								 }
								
								if(m==0 && l==1){
									addCell.setCellValue(sheetTitle + "-("+(j+1)+")");
								}else{
									addCell.setCellValue(value);
								}
								
							}
						}
						*//** ?????? ??? ?????? ?????? *//*
						//1. ????????????
						sheettest.addMergedRegion(new CellRangeAddress(0+38*j, 2+38*j, 1, 27));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 1, 2));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 3, 3));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 4, 4));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 6, 12));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 13, 19));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 20, 26));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 27, 27));
						//2. ????????? ?????? ??????
						for(int h=1 ; h<=29 ; h++){
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 1, 2));
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 6, 12));
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 13, 19));
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 20, 26));
						}
					}
	
				}*/
						
				int i = 9; // ?????? data ?????? low
				int rowCnt = 1;
				List<String> dateArray = new ArrayList<String>();
				for(FlkMap data : reportData) {
					XSSFRow row = sheettest.getRow(i);
					for(int j=0 ; j<colArray.length ; j++){
						XSSFCell cell = row.getCell(colArray[j]);
						if(cell == null){
							cell = row.createCell(colArray[j]);
						}
						cell.setCellType(cell.CELL_TYPE_STRING);
						if(j==0 && rowCnt > 1 && dateArray.contains(data.get(dataMap.get(Integer.toString(colArray[j]))))){
								cell.setCellValue("");
						}else{
							cell.setCellValue((String) data.get(dataMap.get(Integer.toString(colArray[j]))));
						}
					}
					if(rowCnt<29){
						i++;
						rowCnt++;
					}else{
						rowCnt = 1;
						i+=10;
					}
					dateArray.add((String) data.get(dataMap.get(Integer.toString(colArray[0]))));
				}
				
				//?????????(????????????) ?????? ?????? & DB??? ??????
				writeDailyRecordFile(paramMap, templateMap, workbook, reportInsertMap, tempSetTime);
			
				resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
				resultMap.put(Constants.RESULT_MSG, "success.report.situation");
				
			}else{
				logger.error("daily records are null Error");
				logger.error("search conditions are siteCd : "+paramMap.get("buildingId")+", startDate : "+paramMap.get("startDate")+", endDate : "+paramMap.get("endDate"));
				resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
				resultMap.put(Constants.RESULT_MSG, "fail.report.situation");
				return resultMap;
			}
			
			
		} catch (ParseException e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Make DailyRecord File error");
		}	
		
		return result;
	}
	
	/**
	 * ????????? ???????????? ?????? ????????? ?????? ??? DB??? ?????? ?????? ???????????? ??????
	 * @param templateMap
	 * @param workbook
	 * @param reportInsertMap
	 * @param tempSetTime
	 * @throws ParseException
	 */
	public void writeDailyRecordFile(Map<String, Object> paramMap, FlkMap templateMap, XSSFWorkbook workbook, Map<String, Object> reportInsertMap, String tempSetTime) throws ParseException {
		
		//????????? ???????????? ?????? ????????? ??????
		XSSFFormulaEvaluator.evaluateAllFormulaCells(workbook);
		StringBuffer fileName = new StringBuffer();
		
		if("M".equals(((String)templateMap.get("reportType")).toUpperCase())) {
			fileName.append("?????????????????????");
		} else {
			fileName.append("????????????????????????");
		}
		
		Calendar calendar = Calendar.getInstance();
		
		//?????? ????????? ?????? ????????? ?????? ?????????
		calendar.add(Calendar.MONTH, 0);
		fileName.append("("+ paramMap.get("chkYear") +"??? "+ paramMap.get("chkMonth") + "???)");
		fileName.append(paramMap.get("sitedesc")+".xlsx");
		FileOutputStream os = null;
		
		try {
			
			File reportFolder = new File(reportFilePath);
			if(!reportFolder.exists()){
				reportFolder.mkdirs();
			}
			os = new FileOutputStream(reportFilePath + fileName.toString());
			workbook.write(os);
			
			File reportFile = new File(reportFilePath + fileName.toString());
			reportInsertMap.put("reportName", fileName.toString().substring(0, fileName.lastIndexOf(".")));
			reportInsertMap.put("reportFilePath", reportFilePath + fileName.toString());
			reportInsertMap.put("reportFileName", fileName.toString());
			reportInsertMap.put("reportFileSize", reportFile.length());
			reportInsertMap.put("siteId", paramMap.get("siteId"));
			
			batchTaskMapper.insertReport(reportInsertMap);
			
		} catch (FileNotFoundException e) {
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		} finally {
			try {
				workbook.close();
				os.close();
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		

	}
	
}
