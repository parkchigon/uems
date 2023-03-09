package com.flk.mng.data.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.util.CellReference;
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

import com.flk.batch.mapper.BatchTaskMapper;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.main.service.DashboardService;
import com.flk.mng.data.domain.Data;
import com.flk.mng.data.mapper.DataMapper;
import com.flk.mng.report.domain.Report;
import com.flk.mng.report.mapper.ReportMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;

@Service
public class DataServiceImpl implements DataService {
	
	private static final Logger logger = LoggerFactory.getLogger(DataServiceImpl.class);
	
	@Value("#{config['report.file.path']}")
    private String reportFilePath;
	
	@Autowired 
	private DataMapper dataMapper;
	
	@Autowired
	private SiteMapper siteMapper;
	
	@Autowired
	private DashboardService dashboardService;
	
	@Autowired
	private ReportMapper reportMapper;
	
	@Autowired
	private BatchTaskMapper batchTaskMapper;
	
	
	//월별운영데이터관리 리스트조회
	@Override
	public List<FlkMap> searchDataList(Data data) throws Exception {
		return dataMapper.selectDataList(data);
	}
	
	//월별운영데이터관리 등록
	@Override
	public void addData(Data data) throws Exception {
		
		// 요금적용전력 빈값일 경우 null 세팅
		if(StringUtils.isBlank(data.getChargeApplyPower())) {
			data.setChargeApplyPower(null);
		}
		
		// 통계 시작/종료일 계산
		String reportDateRange = getDateDay(data.getSiteCd(), data.getMonth());
		String startDate = reportDateRange.split(",")[0];
		String endDate = reportDateRange.split(",")[1];
		data.setStatStartDate(startDate);
		data.setStatEndDate(endDate);
		
		// 월별운영데이터 화면에서는 심야전기와일반전기는 이미 배율이 적용된 상태이므로 재계산을 위해 다시 배율로 나누어준다 // 2018-03-06 수정
		Double dNightelecDayAmountRaw;		// (심야전기)주간사용량 [배율적용 안된값]
		Double dNightelecNightAmountRaw;	// (심야전기)야간사용량 [배율적용 안된값]
		String strNightelecDayAmount;		// (심야전기)주간사용량 [배율적용된값]
		String strNightelecNightAmount;		// (심야전기)야간사용량 [배율적용된값]
		
		Data elecRate = dataMapper.selectElecRate(data);
		//String dayFactor = elecRate.getElecDayFactor();
		String nightFactor;
		if(StringUtils.equals(data.getSgCd(), "GE001")) {	// 이마트일 경우 보고서항목 데이터 get
			nightFactor = elecRate.getElecNightFactor();
		} else {	// 이마트가 아닐 경우 임의의 값
			nightFactor = "0";
		}
		
		strNightelecDayAmount = data.getNightelecDayAmount();
		strNightelecNightAmount = data.getNightelecNightAmount();
		
		//double dDayFactor = Double.parseDouble(dayFactor);
		double dNightFactor = Double.parseDouble(nightFactor);
		
		// 배율이 적용안된 원래의 사용량 계산
		dNightelecDayAmountRaw = Double.parseDouble(strNightelecDayAmount) / dNightFactor;
		dNightelecNightAmountRaw = Double.parseDouble(strNightelecNightAmount) / dNightFactor;
		
		data.setNightelecDayAmount(Double.toString(dNightelecDayAmountRaw));
		data.setNightelecNightAmount(Double.toString(dNightelecNightAmountRaw));
		
		// 일반전기 : dayelec_amount 쿼리계산
		String dayelecAmount = dataMapper.selectDayelecAmount(data);
		data.setDayelecAmount(dayelecAmount);
		
		// 이마트일 경우 : 프로시저 컬럼 계산
		if(StringUtils.equals(data.getSgCd(), "GE001")) {
			// 1. 냉방사용요금(기존)
			dataMapper.selectPrevCoolCharge(data);
			// 2. 냉방사용요금(빙축)
			dataMapper.selectPresCoolCharge(data);
			// 3. 에너지사용량(기존)
			dataMapper.selectPrevEnergyAmount(data);
			// 4. 에너지사용량(빙축)
			dataMapper.selectPresEnergyAmount(data);
			// 5. 탄소배출량(기존)
			dataMapper.selectPrevTcoAmount(data);
			// 6. 탄소배출량(빙축)
			dataMapper.selectPresTcoAmount(data);
			// 7. 냉방부하량
			dataMapper.selectCoolingLoadAmount(data);
		}
		// 배율이 적용된 값으로 변경하여 저장
		data.setNightelecDayAmount(strNightelecDayAmount);
		data.setNightelecNightAmount(strNightelecNightAmount);
		
		dataMapper.insertData(data);
	}
	
	//월별운영데이터관리 상세
	@Override
	public FlkMap searchDataInfo(Data data) throws Exception {
		return dataMapper.selectDataInfo(data);
	}
	
	//월별운영데이터관리 수정
	@Override
	public void modifyData(Data data) throws Exception {
		
		// 요금적용전력 빈값일 경우 null 세팅
		if(StringUtils.isBlank(data.getChargeApplyPower())) {
			data.setChargeApplyPower(null);
		}
		
		// 통계 시작/종료일 계산
		String reportDateRange = getDateDay(data.getSiteCd(), data.getMonth());
		String startDate = reportDateRange.split(",")[0];
		String endDate = reportDateRange.split(",")[1];
		data.setStatStartDate(startDate);
		data.setStatEndDate(endDate);
		
		//System.out.println("startDate:"+startDate);
		//System.out.println("endDate:"+endDate);
		
		// 월별운영데이터 화면에서는 심야전기와일반전기는 이미 배율이 적용된 상태이므로 재계산을 위해 다시 배율로 나누어준다 // 2018-03-06 수정
		Double dNightelecDayAmountRaw;		// (심야전기)주간사용량 [배율적용 안된값]
		Double dNightelecNightAmountRaw;	// (심야전기)야간사용량 [배율적용 안된값]
		String strNightelecDayAmount;		// (심야전기)주간사용량 [배율적용된값]
		String strNightelecNightAmount;		// (심야전기)야간사용량 [배율적용된값]
		
		Data elecRate = dataMapper.selectElecRate(data);
		//String dayFactor = elecRate.getElecDayFactor();
		String nightFactor;
		if(StringUtils.equals(data.getSgCd(), "GE001")) {	// 이마트일 경우 보고서항목 데이터 get
			nightFactor = elecRate.getElecNightFactor();
		} else {	// 이마트가 아닐 경우 임의의 값
			nightFactor = "0";
		}
		
		strNightelecDayAmount = data.getNightelecDayAmount();
		strNightelecNightAmount = data.getNightelecNightAmount();
		
		//double dDayFactor = Double.parseDouble(dayFactor);
		double dNightFactor = Double.parseDouble(nightFactor);
		
		// 배율이 적용안된 원래의 사용량 계산
		dNightelecDayAmountRaw = Double.parseDouble(strNightelecDayAmount) / dNightFactor;
		dNightelecNightAmountRaw = Double.parseDouble(strNightelecNightAmount) / dNightFactor;
		
		data.setNightelecDayAmount(Double.toString(dNightelecDayAmountRaw));
		data.setNightelecNightAmount(Double.toString(dNightelecNightAmountRaw));
		
		// 일반전기 : dayelec_amount 쿼리계산
		String dayelecAmount = dataMapper.selectDayelecAmount(data);
		data.setDayelecAmount(dayelecAmount);
		
		// 이마트일 경우 : 프로시저 컬럼 계산
		if(StringUtils.equals(data.getSgCd(), "GE001")) {
			// 1. 냉방사용요금(기존)
			dataMapper.selectPrevCoolCharge(data);
			// 2. 냉방사용요금(빙축)
			dataMapper.selectPresCoolCharge(data);
			// 3. 에너지사용량(기존)
			dataMapper.selectPrevEnergyAmount(data);
			// 4. 에너지사용량(빙축)
			dataMapper.selectPresEnergyAmount(data);
			// 5. 탄소배출량(기존)
			dataMapper.selectPrevTcoAmount(data);
			// 6. 탄소배출량(빙축)
			dataMapper.selectPresTcoAmount(data);
			// 7. 냉방부하량
			dataMapper.selectCoolingLoadAmount(data);
		}
		
		// 배율이 적용된 값으로 변경하여 저장
		data.setNightelecDayAmount(strNightelecDayAmount);
		data.setNightelecNightAmount(strNightelecNightAmount);
		
		dataMapper.updateData(data);
	}
	
	//월별운영데이터관리 삭제
	@Override
	public void removeData(Data data) throws Exception {
		dataMapper.deleteData(data);
	}
	
	//월별운영데이터관리 리스트조회
	@Override
	public int searchDataCount(Data data) throws Exception {
		return dataMapper.selectDataCount(data);
	}
	
	
	/**
	 * 통계 시작/종료일 계산
	 * @param siteCd
	 * @return
	 * @throws Exception
	 */
	private String getDateTime(String siteCd, String month) throws Exception {
		
		// 지점정보 > 통계시작일 / 익월종료일 조회
		Site site = new Site();
		site.setSiteCd(siteCd);
		FlkMap siteInfo = siteMapper.selectSiteView(site);
		String startDay = (String) siteInfo.get("statStartDay");
		String endDay = (String) siteInfo.get("statEndDay");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
		Date nDate = dateFormat.parse(month+"01");
		Calendar start = Calendar.getInstance();
		start.setTime(nDate);
		Calendar end = Calendar.getInstance();
		end.setTime(nDate);
		SimpleDateFormat sdf_yyyyMMddHHmm = new SimpleDateFormat("yyyyMMddHHmm");
		
		// 1일 시작인 경우에는 매달 31일
		if(StringUtils.equals(startDay, "01")) {
			//start.add(Calendar.MONTH, -2);
			start.add(Calendar.MONTH, -1);		// 2018-03-06 수정
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
	 * 통계 시작/종료일 계산
	 * @param siteCd
	 * @return
	 * @throws Exception
	 */
	private String getDateDay(String siteCd, String month) throws Exception {
		
		// 지점정보 > 통계시작일 / 익월종료일 조회
		Site site = new Site();
		site.setSiteCd(siteCd);
		FlkMap siteInfo = siteMapper.selectSiteView(site);
		String startDay = (String) siteInfo.get("statStartDay");
		String endDay = (String) siteInfo.get("statEndDay");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd") ;
		Date nDate = dateFormat.parse(month+"01");
		Calendar start = Calendar.getInstance();
		start.setTime(nDate);
		Calendar end = Calendar.getInstance();
		end.setTime(nDate);
		SimpleDateFormat sdf_yyyyMMddHHmm = new SimpleDateFormat("yyyyMMddHHmm");
		
		// 1일 시작인 경우에는 매달 31일
		if(StringUtils.equals(startDay, "01")) {
			//start.add(Calendar.MONTH, -2);
			//start.add(Calendar.MONTH, -1);		// 2018-03-06 수정
			//int preMaxEndDay = start.getActualMaximum(Calendar.DAY_OF_MONTH);
			//start.set(Calendar.DAY_OF_MONTH, preMaxEndDay);
			//end.add(Calendar.MONTH, -1);
			
			int maxEndDay = 0;
			
			maxEndDay = end.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			start.set(Calendar.HOUR_OF_DAY, Math.abs(0));
			start.set(Calendar.MINUTE, 00);
			
			end.set(Calendar.DAY_OF_MONTH, maxEndDay);
			end.set(Calendar.HOUR_OF_DAY, 23);
			end.set(Calendar.MINUTE, 59);

			if(end.getActualMaximum(Calendar.DAY_OF_MONTH) != end.get(Calendar.DAY_OF_MONTH)) {
				end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH));
			}
			
		} else {
			start.set(Calendar.DAY_OF_MONTH, Math.abs(Integer.parseInt(startDay)));
			//start.add(Calendar.MONTH, -1);
			start.set(Calendar.HOUR_OF_DAY, Math.abs(0));
			start.set(Calendar.MINUTE, 00);
			
			end.add(Calendar.MONTH, 1);
			end.set(Calendar.DAY_OF_MONTH, Math.abs(Integer.parseInt(endDay)));
			end.set(Calendar.HOUR_OF_DAY, 22);
			end.set(Calendar.MINUTE, 59);
		}
		
		String result =  sdf_yyyyMMddHHmm.format(start.getTime())+","+ sdf_yyyyMMddHHmm.format(end.getTime());
		
		//System.out.println("result:"+result);
		return result;
		
	}

	//@Value("#{config['report.templete.file.path']}")		//로컬테스트시 사용
	//private String templatePath;               //보고서 템플릿 파일 저장 경로  //로컬테스트시 사용
	/**
	 * 기술운영보고서 생성
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Report makeReportFile(Data data) throws Exception {
		
		// 보고서 생성
		Report report = new Report();
		report.setLastIndex(1);
		report.setReportSubType("00");
		report.setSearchType("M");
		report.setSearchSite(data.getSiteId());
		List<FlkMap> templeteList = reportMapper.selectReportTempleteList(report);
		Map<String, Object> configMap = new HashMap<>();
		FlkMap templateMap = templeteList.get(0);	// 해당 사이트별 템플릿은 하나씩
		report.setRtId(String.valueOf(templateMap.get("rtId")));
		String filePath = (String) templateMap.get("fileServerPath");
		//String filePath = templatePath;	//로컬테스트시 사용
		String fileName = (String) templateMap.get("fileName");
		//String fileName = "이마트 양주점 기술운영 보고서_템플릿.xlsx";		//로컬테스트시 사용
		XSSFWorkbook excelTempleteWorkbook = readExcelTempleteFile(filePath + fileName);
		configMap = makeReportConfigMap(excelTempleteWorkbook); 
		
		Map<String, Object> dateMap = (Map<String, Object>) configMap.get("dateMap");
		String buildingId = (String) configMap.get("buildingId");
		
		Map<String, Object> paramMap = new HashMap<>();
		Map<String, Object> reportInsertMap = new HashMap<>();	//파일 생성 완료 후 DB에 정보 등록을 위한 맵

		String reportDateRange = getDateTime(data.getSiteCd(), data.getMonth());	
		String startDate = reportDateRange.split(",")[0];
		String endDate = reportDateRange.split(",")[1];
		
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		paramMap.put("buildingId", buildingId);
		
		//편의를 위해 날짜 정보 추가 저장
		dateMap.put("startDate", startDate);
		dateMap.put("endDate", endDate);
		configMap.put("dateMap", dateMap);
		
		Calendar reportInsert = Calendar.getInstance();
		reportInsert.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(startDate));
		if(reportInsert.get(Calendar.HOUR_OF_DAY) > 0) {
			reportInsert.add(Calendar.DAY_OF_MONTH, 1);
		}
		reportInsertMap.put("reportStartDate", new SimpleDateFormat("yyyyMMdd").format(reportInsert.getTime()));
		reportInsertMap.put("reportEndDate", endDate.substring(0, 8));

		reportInsertMap.put("rtId", templateMap.get("rtId"));
		//템플릿 파일 min 시트에 남아 있는 기존 데이터 삭제
		clearReportTempleteFile(excelTempleteWorkbook, configMap);

		/** 
		 * 보고서 파일 작성
		 */
		makeReportFile(excelTempleteWorkbook, configMap, paramMap, "");								//상용 호출 방식

		/** 
		 * 보고서 파일 생성 & DB에 등록
		 */
		writeReportFile(data, templateMap, excelTempleteWorkbook, reportInsertMap, "");					//상용 호출 방식
		report.setRfId(String.valueOf(reportInsertMap.get("rfId")));
		
		return report;
		
	}
	
	
	/**
	 * 리포트 템플릿 파일 읽기
	 * @param templateFilePath
	 * @return
	 * @throws Exception
	 */
	public XSSFWorkbook readExcelTempleteFile(String templateFilePath) throws Exception {
		
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
	 * 리포트 템플릿 파일 config 시트에 있는 데이터를 읽어 Map 형태로 변환하여 반환하는 함수
	 * @param workbook
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> makeReportConfigMap(XSSFWorkbook workbook) throws Exception {

		Map<String, Object> configMap = new HashMap<>();
		
		try {
			
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			
			Map<String, Object> dateMap = new HashMap<>();
			Map<String, Object> tagMap = new HashMap<>();
			Map<String, Object> uniqMap = new HashMap<>();	// 기본세팅값 map
			List<String> tagIdList = new ArrayList<String>();	// 실시간 데이터 조회 map
			List<String> tagMinIdList = new ArrayList<String>();	// 실시간 데이터 조회 map

			//config 시트 read
			curSheet = workbook.getSheet("config");
			for(int rowIndex=0; rowIndex<curSheet.getPhysicalNumberOfRows(); rowIndex++) {
				
				curRow = curSheet.getRow(rowIndex);
				curCell = curRow.getCell(0);
				
				String configType = curCell.getStringCellValue();
				switch (configType) {
				case "날짜":
					curCell = curRow.getCell(1);
					dateMap.put("startDay", curCell.getStringCellValue());
					curCell = curRow.getCell(2);
					dateMap.put("endDay", curCell.getStringCellValue());
					break;
				case "시간":
					curCell = curRow.getCell(1);
					dateMap.put("startTime", curCell.getStringCellValue());
					curCell = curRow.getCell(2);
					dateMap.put("endTime", curCell.getStringCellValue());
					break;
				case "빌딩ID":
					curCell = curRow.getCell(1);
					configMap.put("buildingId", curCell.getStringCellValue());
					break;
				case "지점":
					curCell = curRow.getCell(1);
					configMap.put("buildingId", curCell.getStringCellValue());
					break;
				case "대항목":
					break;
				default:
					Map<String, Object> subTagMap = new HashMap<>();
					
					String category = "";
					String subCategory = "";
					String tagId = "";
					String startLoc = "";
					
					category = curCell.getStringCellValue();
					
					curCell = curRow.getCell(1);
					subCategory = curCell.getStringCellValue();
					
					curCell = curRow.getCell(3);
					if(curCell != null) {
						if(curCell.getCellType() == curCell.CELL_TYPE_STRING) {
							tagId = curCell.getStringCellValue();
						}
					}
					
					curCell = curRow.getCell(4);
					startLoc = curCell.getStringCellValue();
					curCell = curRow.getCell(5);
					String cellNum = String.valueOf(curCell.getNumericCellValue());
					startLoc += cellNum.substring(0, cellNum.lastIndexOf("."));
					
					curCell = curRow.getCell(6);
					String sheetName = curCell.getStringCellValue();
					
					if(StringUtils.isNotBlank(tagId)  && StringUtils.equals(sheetName, "2.종합보고")) {
						if(!tagIdList.contains(tagId)) {
							tagIdList.add(tagId);
						}
					}
					
					curCell = curRow.getCell(8);
					String uniqNo = curCell.getStringCellValue();
					
					subTagMap.put("category", category);
					subTagMap.put("subCategory", subCategory);
					subTagMap.put("cellAddress", startLoc);
					subTagMap.put("sheetName", sheetName);
					subTagMap.put("uniqNo", uniqNo);
					subTagMap.put("tagId", tagId);
					
					if(StringUtils.isNotBlank(tagId)  && StringUtils.equals(sheetName, "min")) {
						if(!tagMinIdList.contains(tagId)) {
							tagMinIdList.add(tagId);
						}
					}
					
					if(StringUtils.equals(sheetName, "min")) {
						tagMap.put(tagId, subTagMap);
					} else {
						// 기존 config Sheet
						uniqMap.put(uniqNo, subTagMap);
					}
					break;
				}
				
			}
			configMap.put("dateMap", dateMap);
			configMap.put("tagMap", tagMap);
			configMap.put("uniqMap", uniqMap);
			configMap.put("tagIdList", tagIdList);
			configMap.put("tagMinIdList", tagMinIdList);
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Report Config Read Error");
		}
		return configMap;
	}
	
	/**
	 * 템플릿 파일 min 시트에 남아 있는 기존 데이터를 삭제하는 함수
	 * @param workbook
	 * @param configMap
	 */
	@SuppressWarnings("unchecked")
	public void clearReportTempleteFile(XSSFWorkbook workbook, Map<String, Object> configMap) {

		try {
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			
			HashMap<String, Object> tagMap = new HashMap<String, Object>((HashMap<String, Object>) configMap.get("tagMap"));
			Set<String> tagMapKeyset = tagMap.keySet();
			int minCell = 1;
			int maxCell = 0;
			
			/** s: 'min'시트에 1분데이터입력과는 틀리게 상단날짜입력과 1분일자입력을 config정보에서 읽지 않는 오류로 틀린 위치에 입력이 되어 아래 추가 */  
			String regex = "(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)";
			List<String> tagMinIdList = new ArrayList<String>((List<String>) configMap.get("tagMinIdList"));
			HashMap<String, String> hMinMap = (HashMap<String, String>)tagMap.get(tagMinIdList.get(0));
			String sTimeAddress = (String)hMinMap.get("cellAddress");
			// min 임의태그의 임의 셀주소에서 숫자만 추출, row시작값
			int sTimeRow = Integer.valueOf(sTimeAddress.split(regex)[1]);
			/** e: */			
			
			
			//데이터가 들어갈 셀의 min, max 값 구하기
			for(String key : tagMapKeyset) {
				Map<String, Object> tag = (Map<String, Object>) tagMap.get(key);
				String cellAddress = (String) tag.get("cellAddress");
				
				CellReference cr = new CellReference(cellAddress);
				if(cr.getCol() < minCell) {
					minCell = cr.getCol();
				}
				if(cr.getCol() > maxCell) {
					maxCell = cr.getCol();
				}
			}
			
			for(int sheetIndex=0; sheetIndex<workbook.getNumberOfSheets(); sheetIndex++) {
				curSheet = workbook.getSheetAt(sheetIndex);
				String sheetName = curSheet.getSheetName();
				if(sheetName.indexOf("min") > -1) {
					for(int i=0; i<=maxCell; i++) {
						for(int j=0; j<60*48; j++) {
							curRow = curSheet.getRow((sTimeRow-1)+j);
							if (curRow == null) {
								continue;
							}
							curCell = curRow.getCell(i);
							if (curCell != null) {
								curCell.setCellValue("");
							}
						}
					}
				}
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
	}
	
	/**
	 * 보고서 파일 생성 & DB 등록
	 * @param templateMap
	 * @param workbook
	 * @param reportInsertMap
	 * @param tempSetTime
	 * @throws ParseException
	 */
	public void writeReportFile(Data data, FlkMap templateMap, XSSFWorkbook workbook, Map<String, Object> reportInsertMap, String tempSetTime) throws ParseException {
		
		//리포트 템플릿에 있는 함수들 갱신
		XSSFFormulaEvaluator.evaluateAllFormulaCells(workbook);
		StringBuffer fileName = new StringBuffer();
		
		fileName.append(templateMap.get("sgName"));
		fileName.append(" ").append(templateMap.get("siteName"));
		fileName.append(" ").append("월간정기");
		fileName.append("("+ data.getMonth().substring(0, 4) + "년" +data.getMonth().substring(4)+ "월" + ").xlsx");
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
			reportInsertMap.put("siteId", data.getSiteId());
			
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
	/**
	 * 리포트 파일 작성 
	 * @param workbook
	 * @param configMap
	 * @param paramMap
	 * @param tempSetTime
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> makeReportFile(XSSFWorkbook workbook, Map<String, Object> configMap, Map<String, Object> paramMap, String tempSetTime) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		
		SimpleDateFormat sdf_default = new SimpleDateFormat("yyyyMMddHHmm");
		SimpleDateFormat sdf_sheetTitleTime = new SimpleDateFormat("yyyy년 MM월 dd일 E요일", Locale.KOREAN);
		SimpleDateFormat sdf_rowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat sdf_rowTime2 = new SimpleDateFormat("yyyyMMddHHmm");
		

		String regex = "(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)"; 
		try {
				
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			
			// 추가된 config 항목 데이터 처리
			HashMap<String, Object> uniqMap = new HashMap<String, Object>((HashMap<String, Object>) configMap.get("uniqMap"));
			List<String> tagIdList = new ArrayList<String>((List<String>) configMap.get("tagIdList"));
			List<String> tagMinIdList = new ArrayList<String>((List<String>) configMap.get("tagMinIdList"));
			workbook = defaultValueSetting(uniqMap, tagIdList, paramMap, workbook);
			
			HashMap<String, Object> dateMap = (HashMap<String, Object>) configMap.get("dateMap");
			HashMap<String, Object> tagMap = new HashMap<String, Object>((HashMap<String, Object>) configMap.get("tagMap"));
			String sheetStartDate = (String) dateMap.get("startDate");
			String sheetEndDate = (String) dateMap.get("startDate");
			
			int sheetCount = 0;
			String sheetName = "";
			HashMap<String, Object> tagMapCopy = null;
			Calendar sheetStartDateCalendar = null;
			Calendar sheetLastDateCalendar = null;
			List<FlkMap> reportData = null;
			

			/** s: 'min'시트에 1분데이터입력과는 틀리게 상단날짜입력과 1분일자입력을 config정보에서 읽지 않는 오류로 틀린 위치에 입력이 되어 아래 추가 */  
			HashMap<String, String> hMinMap = (HashMap<String, String>)tagMap.get(tagMinIdList.get(0));
			String sTimeAddress = (String)hMinMap.get("cellAddress");
			// min 임의태그의 임의 셀주소에서 숫자만 추출, row시작값
			int sTimeRow = Integer.valueOf(sTimeAddress.split(regex)[1]);
			/** e: */
			
			for(int sheetIndex=0; sheetIndex<workbook.getNumberOfSheets(); sheetIndex++) {
				curSheet = workbook.getSheetAt(sheetIndex);
				sheetName = curSheet.getSheetName();
				HashMap<String, Integer> rowTimeMap = new HashMap<>();
				
				if(sheetName.indexOf("min") > -1) {
					
					sheetCount++;
					tagMapCopy = new HashMap<>(tagMap); 
					
					//시트 변경에 따른 날짜 범위 조정
					sheetStartDateCalendar = Calendar.getInstance();
					sheetLastDateCalendar = Calendar.getInstance();
					
					if(sheetCount == 1) {
						//첫번째 시트(start 범위는 그대로, end만 최초 start에 1439분(23시간59분) 추가
						sheetStartDateCalendar.setTime(sdf_default.parse(sheetStartDate));
						sheetStartDate = sdf_default.format(sheetStartDateCalendar.getTime());

						
						sheetLastDateCalendar.setTime(sdf_default.parse(sheetEndDate));
						sheetLastDateCalendar.add(Calendar.MINUTE, 1439);
						sheetEndDate = sdf_default.format(sheetLastDateCalendar.getTime());
						paramMap.put("endDate", sheetEndDate);
						
					} else {
						//첫번째 이후 시트(start, end 모두 24시간씩 추가)
						sheetStartDateCalendar.setTime(sdf_default.parse(sheetStartDate));
						sheetStartDateCalendar.add(Calendar.HOUR_OF_DAY, 24);
						sheetStartDate = sdf_default.format(sheetStartDateCalendar.getTime());
			
						//직전에 조회한 날짜 범위 endDate가 전체 endDate와 동일한 경우 반복문 중단
						if(sheetEndDate.equals(dateMap.get("endDate"))) {
							break;
						}
						
						sheetLastDateCalendar.setTime(sdf_default.parse(sheetEndDate));
						sheetLastDateCalendar.add(Calendar.HOUR_OF_DAY, 24);
						sheetEndDate = sdf_default.format(sheetLastDateCalendar.getTime());

						paramMap.put("startDate", sheetStartDate);
						paramMap.put("endDate", sheetEndDate);
					}
					
					paramMap.put("tagMinIdList", tagMinIdList);
					reportData = batchTaskMapper.selectReportData(paramMap);
					
					
					/** s:각 시트별 상단에 날짜 입력 */
					if (sTimeRow > 4)	//분당 DateTime입력란이 4째줄 이상에서 시작할 경우에만
					{
						CellReference cellReference = new CellReference("A4");
						curRow = curSheet.getRow(cellReference.getRow());
						curCell = curRow.getCell(cellReference.getCol());
						if(sheetStartDateCalendar.get(Calendar.HOUR_OF_DAY) > 0) {
							Calendar titleCalendar = Calendar.getInstance();
							
							titleCalendar.setTime(sheetStartDateCalendar.getTime());
							titleCalendar.add(Calendar.DAY_OF_MONTH, 1);
							curCell.setCellValue(sdf_sheetTitleTime.format(titleCalendar.getTime()));
						} else {
							curCell.setCellValue(sdf_sheetTitleTime.format(sheetStartDateCalendar.getTime()));
						}
					}
					/** e:각 시트별 상단에 날짜 입력 */
					
					
					Calendar timeCalendar = Calendar.getInstance();
					
					
					/** s:시트내 각 Row에 날짜 입력 */
					timeCalendar.setTime(sdf_default.parse(sheetStartDate));
					for(int i=0; i<60*24; i++) {
						XSSFRow row = curSheet.getRow((sTimeRow-1)+i);
						XSSFCell cell = row.getCell(0);
						cell.setCellValue(sdf_rowTime.format(timeCalendar.getTime()));
						
						// 각각 DateTime의 row위치값 입력
						rowTimeMap.put(sdf_rowTime2.format(timeCalendar.getTime()), sTimeRow+i);
						
						timeCalendar.add(Calendar.MINUTE, 1);
					}
					/** e:시트내 각 Row에 날짜 입력 */
					
					String statDateTime = "";
					String tagId = "";
					BigDecimal tagValue;
					HashMap<String, Object> tag = null;
					String cellAddress = "";
					CellReference cr = null;
					int order = 0;
					
					//System.out.println("tagMapCopy.toString():"+tagMapCopy.toString());
					
					for(FlkMap data : reportData) {
						statDateTime = (String) data.get("statDateTime");
						tagId = (String) data.get("tagId");
						tagValue = (BigDecimal) data.get("tagValue");
						
						//System.out.println("!tagId:::"+tagId);
						
						if (tagMapCopy.containsKey(tagId))
						{
							tag = new HashMap<String, Object>((HashMap<String, Object>)tagMapCopy.get(tagId));

							if(tag != null && rowTimeMap.containsKey(statDateTime)) {
								// 맨촤측 'DateTime'을 입력한 row위치를 가져온다
								order = rowTimeMap.get(statDateTime);
								
								
								//System.out.println("##########"+order+"@@@@@@@@@@@@@@@@"+tagValue+"#####");
								
								cellAddress = (String) tag.get("cellAddress");
								cellAddress = cellAddress.split(regex)[0] + order;	// 실제 입력할 셀위치
								
								cr = new CellReference(cellAddress);
								curRow = curSheet.getRow(cr.getRow());
								curCell = curRow.getCell(cr.getCol());
								if(tagValue == null) {	// 해당 셀에 넣어야 할 값이 DB에 없는 경우 로그만 출력 후 값 입력하지 않음
									logger.error("tagValue is null Error");
									logger.error("sheetName : " + sheetName + ", cellAddress : " + cellAddress + ", tagId : " + tagId + ", statDate : " + statDateTime);
									curCell.setCellValue("");
								} else {
									try {
										curCell.setCellValue(tagValue.doubleValue());
									} catch (Exception e) {
										curCell.setCellValue("");
										logger.error(e.getMessage(), e);
										//continue;
									}
								}
								//tag.put("cellAddress", cellAddress.split(regex)[0] + (Integer.valueOf(cellAddress.split(regex)[1])+1)); // 영문+숫자 되어 있는 Excel 좌표에서 영문제외 숫자만 추출 후 1 증가 시킴
								//tagMapCopy.put(tagId, tag);
							}
						}
					}
				}
			}
		} catch (ParseException e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Make Report File error");
		}	
		
		return result;
	}


	@SuppressWarnings("unchecked")
	private XSSFWorkbook defaultValueSetting(Map<String, Object> uniqMap, List<String> tagIdList, Map<String, Object> paramMap, XSSFWorkbook workbook) throws Exception {
		
		XSSFSheet curSheet;
		XSSFRow curRow;
		XSSFCell curCell;
		// 1. 월별운영데이터관리 조회
		List<FlkMap> manageData = batchTaskMapper.selectManageData(paramMap);
		// 2. 공통단가관리 > 일반전기요금 조회
		List<FlkMap> commPriceData01 = batchTaskMapper.selectCommPriceData(paramMap);
		// 3. 지점단가관리 > 일반전기요금 조회
		paramMap.put("energyType", "02");	
		FlkMap sitePriceData01 = batchTaskMapper.selectSitePriceData(paramMap);
		// 4. 지점단가관리 > 심야전기요금 조회
		paramMap.put("energyType", "02");
		FlkMap sitePriceData02 = batchTaskMapper.selectSitePriceData(paramMap);
		// 5. 지점단가관리 > 가스요금 조회 (현재기준 적용일 및 공급사이름)
		paramMap.put("energyType", "03");
		FlkMap sitePriceData03 = batchTaskMapper.selectSitePriceData(paramMap);
		
		// 6. 지점단가관리 > 가스요금 조회 (5~10월 별로)
		String curYear = ((String) paramMap.get("endDate")).substring(0, 4);
		paramMap.put("searchMonth", curYear+"0501");
		FlkMap sitePriceData03_5 = batchTaskMapper.selectSitePriceData(paramMap);
		paramMap.put("searchMonth", curYear+"0601");
		FlkMap sitePriceData03_6 = batchTaskMapper.selectSitePriceData(paramMap);
		paramMap.put("searchMonth", curYear+"0701");
		FlkMap sitePriceData03_7 = batchTaskMapper.selectSitePriceData(paramMap);
		paramMap.put("searchMonth", curYear+"0801");
		FlkMap sitePriceData03_8 = batchTaskMapper.selectSitePriceData(paramMap);
		paramMap.put("searchMonth", curYear+"0901");
		FlkMap sitePriceData03_9 = batchTaskMapper.selectSitePriceData(paramMap);
		paramMap.put("searchMonth", curYear+"1001");
		FlkMap sitePriceData03_10 = batchTaskMapper.selectSitePriceData(paramMap);
		
		// 7. 보고서 항목 조회
		FlkMap rateData = batchTaskMapper.selectFacilityRateData(paramMap);
		FlkMap specData = batchTaskMapper.selectFacilitySpecData(paramMap);
		
		// 8. 1분 실시간 통계 데이터 조회
		paramMap.put("tagIdList", tagIdList);
		List<FlkMap> runStatData = null;
		List<FlkMap> runNightStatData = null;
		if (tagIdList.size() > 0) {
			runStatData = batchTaskMapper.selectRunStatData(paramMap);
			runNightStatData = batchTaskMapper.selectRunNightStatData(paramMap);
		}
		

		Set<String> keySet = uniqMap.keySet();
		
		HashMap<String, Object> subMap = null;
		String sheetName;
		String cellAddress;
		String tagId;
		CellReference cr;
		String blank = "";
		
		for( String uniqNo : keySet ){
		    subMap = new HashMap<String, Object>((HashMap<String, Object>)uniqMap.get(uniqNo));
		    
		    sheetName = (String) subMap.get("sheetName");
	    	curSheet = workbook.getSheet(sheetName);
	    	cellAddress = (String) subMap.get("cellAddress");
	    	tagId = (String) subMap.get("tagId");
			cr = new CellReference(cellAddress);
			curRow = curSheet.getRow(cr.getRow());
			curCell = curRow.getCell(cr.getCol());
			int no = Integer.parseInt(uniqNo.substring(1, uniqNo.length()));
			Object cellValue = null;
			
			if(no == 28) {	// N28 운영기간
				String startDate = (String) paramMap.get("startDate");
				String endDate = (String) paramMap.get("endDate");
				Calendar start = Calendar.getInstance();
				start.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(startDate));
				if(start.get(Calendar.HOUR_OF_DAY) > 0) {
					start.add(Calendar.DAY_OF_MONTH, 1);
				}
				Calendar end = Calendar.getInstance();
				end.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(endDate));
				
				StringBuffer sb = new StringBuffer();
				sb.append(new SimpleDateFormat("yyyy년 MM월 dd일").format(start.getTime()));
				sb.append(" ~ ");
				sb.append(new SimpleDateFormat("yyyy년 MM월 dd일").format(end.getTime()));
				cellValue = sb.toString();
				
			} else if(no == 30 || no == 32 || no == 34 || no == 226 || no == 228 || no == 36 || no == 240 || no == 38 || no == 242 || no == 40 || no == 230 || no == 250) {	// (주간) N29 ~ N40 / N225 ~ N230 / N250 1분 실시간 통계 데이터
				for(FlkMap data : runStatData) {
					String sumTagId = (String) data.get("tagId");
					if(StringUtils.equals(sumTagId, tagId)) {
						cellValue = data.get("data");
						break;
					}
				}
			} else if(no == 29 || no == 31 || no == 33 || no == 225 || no == 227 || no == 35 || no == 239 || no == 37 || no == 241 || no == 39 || no == 229 || no == 251){	// (야간) N29 ~ N40 / N225 ~ N230 / N251 1분 실시간 통계 데이터
				for(FlkMap data : runNightStatData) {
					String sumTagId = (String) data.get("tagId");
					if(StringUtils.equals(sumTagId, tagId)) {
						cellValue = data.get("data");
						break;
					}
				}
			} else if(no >= 41 && no <= 70) {	// N41 ~ N70 일반전기요금 Tab
				for(FlkMap data : commPriceData01) {
					String pciId = (String) data.get("pciId");
					if(StringUtils.equals(pciId, "1")) {	// 일반용전력(을) 고압A 선택 Ⅰ
						if(StringUtils.equals(uniqNo, "N41")){
							cellValue = data.get("data10");
							break;
						} else if(StringUtils.equals(uniqNo, "N42")){
							cellValue = data.get("data01");
							break;
						} else if(StringUtils.equals(uniqNo, "N43")){
							cellValue = data.get("data04");
							break;
						} else if(StringUtils.equals(uniqNo, "N44")){
							cellValue = data.get("data07");
							break;
						} else if(StringUtils.equals(uniqNo, "N45")){
							cellValue = data.get("data02");
							break;
						} else if(StringUtils.equals(uniqNo, "N46")){
							cellValue = data.get("data05");
							break;
						} else if(StringUtils.equals(uniqNo, "N47")){
							cellValue = data.get("data08");
							break;
						} else if(StringUtils.equals(uniqNo, "N48")){
							cellValue = data.get("data03");
							break;
						} else if(StringUtils.equals(uniqNo, "N49")){
							cellValue = data.get("data06");
							break;
						} else if(StringUtils.equals(uniqNo, "N50")){
							cellValue = data.get("data09");
							break;
						}
					} else if(StringUtils.equals(pciId, "2")) {	// 일반용전력(을) 고압A 선택 Ⅱ
						if(StringUtils.equals(uniqNo, "N51")){
							cellValue = data.get("data10");
							break;
						} else if(StringUtils.equals(uniqNo, "N52")){
							cellValue = data.get("data01");
							break;
						} else if(StringUtils.equals(uniqNo, "N53")){
							cellValue = data.get("data04");
							break;
						} else if(StringUtils.equals(uniqNo, "N54")){
							cellValue = data.get("data07");
							break;
						} else if(StringUtils.equals(uniqNo, "N55")){
							cellValue = data.get("data02");
							break;
						} else if(StringUtils.equals(uniqNo, "N56")){
							cellValue = data.get("data05");
							break;
						} else if(StringUtils.equals(uniqNo, "N57")){
							cellValue = data.get("data08");
							break;
						} else if(StringUtils.equals(uniqNo, "N58")){
							cellValue = data.get("data03");
							break;
						} else if(StringUtils.equals(uniqNo, "N59")){
							cellValue = data.get("data06");
							break;
						} else if(StringUtils.equals(uniqNo, "N60")){
							cellValue = data.get("data09");
							break;
						}
					} else if(StringUtils.equals(pciId, "3")) {	// 일반용전력(을) 고압A 선택 Ⅲ
						if(StringUtils.equals(uniqNo, "N61")){
							cellValue = data.get("data10");
							break;
						} else if(StringUtils.equals(uniqNo, "N62")){
							cellValue = data.get("data01");
							break;
						} else if(StringUtils.equals(uniqNo, "N63")){
							cellValue = data.get("data04");
							break;
						} else if(StringUtils.equals(uniqNo, "N64")){
							cellValue = data.get("data07");
							break;
						} else if(StringUtils.equals(uniqNo, "N65")){
							cellValue = data.get("data02");
							break;
						} else if(StringUtils.equals(uniqNo, "N66")){
							cellValue = data.get("data05");
							break;
						} else if(StringUtils.equals(uniqNo, "N67")){
							cellValue = data.get("data08");
							break;
						} else if(StringUtils.equals(uniqNo, "N68")){
							cellValue = data.get("data03");
							break;
						} else if(StringUtils.equals(uniqNo, "N69")){
							cellValue = data.get("data06");
							break;
						} else if(StringUtils.equals(uniqNo, "N70")){
							cellValue = data.get("data09");
							break;
						}
					}
				}
			} else if(no >= 77 && no <= 84 || no >= 203 && no <= 214) {	// N77 ~ N84 / N203 ~ N214 가스요금 Tab
				if(sitePriceData03 != null) {
					if(StringUtils.equals(uniqNo, "N77")){
						cellValue = sitePriceData03.get("priceName");
					} else if(StringUtils.equals(uniqNo, "N78")){
						cellValue = sitePriceData03.get("applyDate");
					} else if(StringUtils.equals(uniqNo, "N79")){
						cellValue = sitePriceData03_5.get("data01");
					} else if(StringUtils.equals(uniqNo, "N80")){
						cellValue = sitePriceData03_5.get("data02");
					} else if(StringUtils.equals(uniqNo, "N81")){
						cellValue = sitePriceData03_5.get("data03");
					} else if(StringUtils.equals(uniqNo, "N82")){
						cellValue = sitePriceData03_6.get("data01");
					} else if(StringUtils.equals(uniqNo, "N83")){
						cellValue = sitePriceData03_6.get("data02");
					} else if(StringUtils.equals(uniqNo, "N84")){
						cellValue = sitePriceData03_6.get("data03");
					} else if(StringUtils.equals(uniqNo, "N203")){
						cellValue = sitePriceData03_7.get("data01");
					} else if(StringUtils.equals(uniqNo, "N204")){
						cellValue = sitePriceData03_7.get("data02");
					} else if(StringUtils.equals(uniqNo, "N205")){
						cellValue = sitePriceData03_7.get("data03");
					} else if(StringUtils.equals(uniqNo, "N206")){
						cellValue = sitePriceData03_8.get("data01");
					} else if(StringUtils.equals(uniqNo, "N207")){
						cellValue = sitePriceData03_8.get("data02");
					} else if(StringUtils.equals(uniqNo, "N208")){
						cellValue = sitePriceData03_8.get("data03");
					} else if(StringUtils.equals(uniqNo, "N209")){
						cellValue = sitePriceData03_9.get("data01");
					} else if(StringUtils.equals(uniqNo, "N210")){
						cellValue = sitePriceData03_9.get("data02");
					} else if(StringUtils.equals(uniqNo, "N211")){
						cellValue = sitePriceData03_9.get("data03");
					} else if(StringUtils.equals(uniqNo, "N212")){
						cellValue = sitePriceData03_10.get("data01");
					} else if(StringUtils.equals(uniqNo, "N213")){
						cellValue = sitePriceData03_10.get("data02");
					} else if(StringUtils.equals(uniqNo, "N214")){
						cellValue = sitePriceData03_10.get("data03");
					} 
				}
			} else if(no >= 85 && no <= 89) {	// N85 ~ N89 심야전기요금 Tab
				if(sitePriceData02 != null) {
					if(StringUtils.equals(uniqNo, "N85")){
						cellValue = sitePriceData02.get("data04");
					} else if(StringUtils.equals(uniqNo, "N86")){
						cellValue = sitePriceData02.get("data05");
					} else if(StringUtils.equals(uniqNo, "N87")){
						cellValue = sitePriceData02.get("data01");
					} else if(StringUtils.equals(uniqNo, "N88")){
						cellValue = sitePriceData02.get("data02");
					} else if(StringUtils.equals(uniqNo, "N89")){
						cellValue = sitePriceData02.get("data03");
					} 
				}
			} else if(no >= 90 && no <= 132) {	// N90 ~ N132 보고서항목 > SPEC
				keySet = specData.keySet();
				for( String key : keySet ){
					if(StringUtils.equals(uniqNo, StringUtils.upperCase(key))){
						cellValue = specData.get(key);
						break;
					}
				}
			} else if(no == 134 || no == 135 || no == 137 || no == 138 || no == 140 || no == 141 || no == 143 || no == 144 || 
					no == 146 || no == 147 || no >= 149 && no <= 170 || no == 202) {	// N133 ~ N170, N202 보고서항목 > RATE
				keySet = rateData.keySet();
				for( String key : keySet ){
					if(StringUtils.equals(uniqNo, StringUtils.upperCase(key))){
						cellValue = rateData.get(key);
						break;
					}
				}
			} else if(no == 171) {	// 계약전력(N171)
				if(sitePriceData01 != null && StringUtils.equals(uniqNo, "N171")){
					cellValue = sitePriceData01.get("elecPower");
				}
			} else {
				for(FlkMap data : manageData) {
					String month = (String) data.get("month");
					if(StringUtils.equals(month, "05")) {
						if(StringUtils.equals(uniqNo, "N71")){
							cellValue = data.get("gasAverageCalorie");
							break;
						} else if(StringUtils.equals(uniqNo, "N133")){
							cellValue = data.get("coolingLoadAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N172")){
							cellValue = data.get("dayelecAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N173")){
							cellValue = data.get("nightelecDayAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N174")){
							cellValue = data.get("nightelecNightAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N190")){
							cellValue = data.get("elecPowerfactorCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N191")){
							cellValue = data.get("elecDiscountCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N233")){
							cellValue = data.get("chargeApplyPower");
							break;
						}
					} else if(StringUtils.equals(month, "06")) {
						if(StringUtils.equals(uniqNo, "N72")){
							cellValue = data.get("gasAverageCalorie");
							break;
						} else if(StringUtils.equals(uniqNo, "N136")){
							cellValue = data.get("coolingLoadAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N175")){
							cellValue = data.get("dayelecAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N176")){
							cellValue = data.get("nightelecDayAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N177")){
							cellValue = data.get("nightelecNightAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N192")){
							cellValue = data.get("elecPowerfactorCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N193")){
							cellValue = data.get("elecDiscountCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N234")){
							cellValue = data.get("chargeApplyPower");
							break;
						}
					} else if(StringUtils.equals(month, "07")) {
						if(StringUtils.equals(uniqNo, "N73")){
							cellValue = data.get("gasAverageCalorie");
							break;
						} else if(StringUtils.equals(uniqNo, "N139")){
							cellValue = data.get("coolingLoadAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N178")){
							cellValue = data.get("dayelecAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N179")){
							cellValue = data.get("nightelecDayAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N180")){
							cellValue = data.get("nightelecNightAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N194")){
							cellValue = data.get("elecPowerfactorCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N195")){
							cellValue = data.get("elecDiscountCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N235")){
							cellValue = data.get("chargeApplyPower");
							break;
						}
					} else if(StringUtils.equals(month, "08")) {
						if(StringUtils.equals(uniqNo, "N74")){
							cellValue = data.get("gasAverageCalorie");
							break;
						} else if(StringUtils.equals(uniqNo, "N142")){
							cellValue = data.get("coolingLoadAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N181")){
							cellValue = data.get("dayelecAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N182")){
							cellValue = data.get("nightelecDayAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N183")){
							cellValue = data.get("nightelecNightAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N196")){
							cellValue = data.get("elecPowerfactorCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N197")){
							cellValue = data.get("elecDiscountCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N236")){
							cellValue = data.get("chargeApplyPower");
							break;
						}
					} else if(StringUtils.equals(month, "09")) {
						if(StringUtils.equals(uniqNo, "N75")){
							cellValue = data.get("gasAverageCalorie");
							break;
						} else if(StringUtils.equals(uniqNo, "N145")){
							cellValue = data.get("coolingLoadAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N184")){
							cellValue = data.get("dayelecAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N185")){
							cellValue = data.get("nightelecDayAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N186")){
							cellValue = data.get("nightelecNightAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N198")){
							cellValue = data.get("elecPowerfactorCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N199")){
							cellValue = data.get("elecDiscountCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N237")){
							cellValue = data.get("chargeApplyPower");
							break;
						}
					} else if(StringUtils.equals(month, "10")) {
						if(StringUtils.equals(uniqNo, "N76")){
							cellValue = data.get("gasAverageCalorie");
							break;
						} else if(StringUtils.equals(uniqNo, "N148")){
							cellValue = data.get("coolingLoadAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N187")){
							cellValue = data.get("dayelecAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N188")){
							cellValue = data.get("nightelecDayAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N189")){
							cellValue = data.get("nightelecNightAmount");
							break;
						} else if(StringUtils.equals(uniqNo, "N200")){
							cellValue = data.get("elecPowerfactorCharge");
							break;
						} else if(StringUtils.equals(uniqNo, "N201")){
							cellValue = data.get("elecDiscountCharge");
							break;
						}  else if(StringUtils.equals(uniqNo, "N238")){
							cellValue = data.get("chargeApplyPower");
							break;
						}
					}
				}
			}
			
			if(cellValue == null) {
				curCell.setCellValue(blank);
			} else if(cellValue instanceof BigDecimal) {
				curCell.setCellValue(((BigDecimal) cellValue).doubleValue());
			} else if(cellValue instanceof Integer) {
				curCell.setCellValue((Integer) cellValue);
			} else if(cellValue instanceof Double) {
				curCell.setCellValue((Double) cellValue);
			} else {
				curCell.setCellValue((String) cellValue);
			}
		}
		
		return workbook;
	}
}
