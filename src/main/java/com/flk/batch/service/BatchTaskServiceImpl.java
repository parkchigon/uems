package com.flk.batch.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URI;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.util.CellReference;
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
import org.springframework.web.client.RestTemplate;

import com.flk.batch.mapper.BatchTaskMapper;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.DateFormatUtils;
import com.flk.mng.report.domain.Report;
import com.flk.mng.report.mapper.ReportMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class BatchTaskServiceImpl implements BatchTaskService {

	private static final Logger logger = LoggerFactory.getLogger(BatchTaskServiceImpl.class);
	
    @Value("#{comm['forecast.api.url']}")
    private String apiUrl;
    @Value("#{comm['forecast.api.serviceKey']}")
    private String apiServiceKey;
    @Value("#{comm['forecast.api.forecastGrib']}")
    private String forecastGrib;
    @Value("#{comm['forecast.api.forecastSpaceData']}")
    private String forecastSpaceData;
    @Value("#{comm['forecast.api.baseTime']}")
    private String baseTime;

    @Value("#{config['report.file.path']}")
    private String reportFilePath;
    
	RestTemplate restTemplate = new RestTemplate();
	
	@Autowired
	private SiteMapper siteMapper;
	
	@Autowired
	private BatchTaskMapper batchTaskMapper;
	
	@Autowired
	private ReportMapper reportMapper;
	
	/**
	 * 초단기 실황조회
	 */
	@Override
	public Map<String, Object> getForecastGrib() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 1. 지점 리스트 조회
		Site site = new Site(1, Constants.YES);
		List<FlkMap> siteAllList = siteMapper.selectSiteList(site);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("baseDate", DateFormatUtils.getDateFormat("yyyyMMdd"));
		param.put("baseTime", DateFormatUtils.getMillisecondsTime().substring(8, 10));
		param.put("regId", Constants.SYSTEM);
		param.put("updateId", Constants.SYSTEM);
		
		if (CollectionUtils.isNotEmpty(siteAllList)){
			for(FlkMap siteVO : siteAllList) {
				try {
					// 2. 각 지점 별로 API 호출
					StringBuilder sb = new StringBuilder();
					sb.append("?ServiceKey=" + apiServiceKey);
					sb.append("&base_date=" + DateFormatUtils.getDateFormat("yyyyMMdd"));
					sb.append("&base_time=" + DateFormatUtils.getMillisecondsTime().substring(8, 10)+"00");
					sb.append("&numOfRows=300");
					sb.append("&_type=json");
					sb.append("&nx="+ siteVO.get("weatherX"));
					sb.append("&ny="+ siteVO.get("weatherY"));
					
					if(StringUtils.isNotBlank((String) siteVO.get("weatherX")) && StringUtils.isNotBlank((String) siteVO.get("weatherY"))) {	
						logger.info( siteVO.get("siteName") + " request ===> " + apiUrl + forecastGrib + sb.toString());
						// 초단기실황예보 API 호출
						URI uri = new URI(apiUrl + forecastGrib + sb.toString());
						JSONObject response = restTemplate.getForObject(uri, JSONObject.class);
						
						// 초단기실황예보 응답값
						logger.info( siteVO.get("siteName") + " response ===> " + response);
						
						JSONObject res = response.getJSONObject("response");
						JSONObject header = res.getJSONObject("header");
						JSONObject body = res.getJSONObject("body");
						
						if(StringUtils.equals(header.getString("resultCode"), Constants.SUCCESS)) {
							if((Integer) body.get("totalCount") > 0) {
								// 3. 날씨정보 추출
								Map<String, Object> weatherInfo = addWeater(body);
								param.put("siteId", siteVO.get("siteId"));
								param.put("weatherInfo", weatherInfo);
								
								// 4. 지점별로 DB UPDATE
								batchTaskMapper.updateWeather(param);
							} 
						} else {
							throw new Exception(header.getString("resultMsg"));  
						}
					}
				} catch(Exception e) {
					logger.error("##### 초단기실황예보 API 스케줄러 처리 중 에러 발생");
					logger.error(e.getMessage(), e);
					//throw new Exception("getForecastGrib API ERROR");
				}
			}
			
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
			resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
		}
		
		return resultMap;
	}
	
	
	/**
	 * 초단기 실황조회 날씨정보 추출
	 * 
	 * @param body
	 * @return
	 * @throws Exception
	 */
	private Map<String, Object> addWeater(JSONObject body) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		JSONArray items = (body.getJSONObject("items")).getJSONArray("item");
		
		for(int i = 0; i < items.size(); i++) {
			JSONObject obj = items.getJSONObject(i);
			if(i == 0) {
				String baseDate = obj.getString("baseDate"); 
				String baseTime = obj.getString("baseTime"); 
				map.put("date", baseDate);
				map.put("hour", baseTime.substring(0, 2));
			}
			
			map.put(obj.getString("category").toLowerCase(), obj.getString("obsrValue"));
		}
		return map;
	}


	/**
	 * 기상청API -> 동네예보
	 * 
	 * ServiceKey	서비스 키
	 * base_date		발표일자
	 * base_time		발표시각
	 * numOfRows		한 페이지 결과 수
	 * _type			타입		
	 * nx			예보지점 X 좌표
	 * ny			예보지점 Y 좌표
	 */
	@Override
	public Map<String, Object> getForecastSpaceData() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 1. 지점 리스트 조회
		Site site = new Site(1, Constants.YES);
		List<FlkMap> siteAllList = siteMapper.selectSiteList(site);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("baseDate", DateFormatUtils.getDateFormat("yyyyMMdd"));
		param.put("baseTime", String.format("%02d",Integer.parseInt(baseTime.substring(0, 2))+ 3));
		param.put("regId", Constants.SYSTEM);
		param.put("updateId", Constants.SYSTEM);
		
		
		if (CollectionUtils.isNotEmpty(siteAllList)){
			for(FlkMap siteVO : siteAllList) {
				try {
					// 2. 각 지점 별로 API 호출
					StringBuilder sb = new StringBuilder();
					sb.append("?ServiceKey=" + apiServiceKey);
					sb.append("&base_date=" + DateFormatUtils.getDateFormat("yyyyMMdd"));
					sb.append("&base_time=" + baseTime);
					sb.append("&numOfRows=300");
					sb.append("&_type=json");
					sb.append("&nx="+ siteVO.get("weatherX"));
					sb.append("&ny="+ siteVO.get("weatherY"));
					
					if(StringUtils.isNotBlank((String) siteVO.get("weatherX")) && StringUtils.isNotBlank((String) siteVO.get("weatherY")) ) {
						logger.info( siteVO.get("siteName") + " request ===> " + apiUrl + forecastSpaceData + sb.toString());
						// 동네예보 API 호출
						URI uri = new URI(apiUrl + forecastSpaceData + sb.toString());
						JSONObject response = restTemplate.getForObject(uri, JSONObject.class);
						
						// 동네예보 응답값
						logger.info( siteVO.get("siteName") + " response ===> " + response);
						
						JSONObject res = response.getJSONObject("response");
						JSONObject header = res.getJSONObject("header");
						JSONObject body = res.getJSONObject("body");
						
						if(StringUtils.equals(header.getString("resultCode"), Constants.SUCCESS)) {
							if((Integer) body.get("totalCount") > 0) {
								// 3. 날씨정보 리스트 추출
								List<Map<String, Object>> list = addWeaterList(body);
								
								param.put("siteId", siteVO.get("siteId"));
								param.put("weatherList", list);
								// 4. 지점별로 DB DELETE 후 INSERT
								batchTaskMapper.deleteWeather(param);
								batchTaskMapper.insertWeather(param);
							}
						} else {
							throw new Exception(header.getString("resultMsg"));  
						}
					
					}
				} catch(Exception e) {
					logger.error("##### 동네예보 API 스케줄러 처리 중 에러 발생");
					logger.error(e.getMessage(), e);
					//throw new Exception("getForecastSpaceData API ERROR");
				}
			}

			// 5. TMX / TMN : 날짜 별 최저/최고기온 NULL값 수정
			batchTaskMapper.updateTmxWeather(param);
			batchTaskMapper.updateTmnWeather(param);
			// 6. R06 / S06 : 시간 별 6시간 강수량/신적설 NULL값 수정
			batchTaskMapper.updateRinSnwWeather(param);
			
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
			resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
		}
		
		return resultMap;
	}
	
	/**
	 * 동네예보 날씨정보 리스트 추출
	 * 
	 * @param list
	 * @param body
	 * @return
	 */
	private List<Map<String, Object>> addWeaterList(JSONObject body) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		String currDate = "";
		String currTime = "";
		Map<String, Object> map = null;
		JSONArray items = (body.getJSONObject("items")).getJSONArray("item");
		
		for(int i = 0; i < items.size(); i++) {

			JSONObject obj = items.getJSONObject(i);
			String fcstDate = obj.getString("fcstDate"); 
			String fcstTime = obj.getString("fcstTime"); 
			
			if(!StringUtils.equals(currDate, fcstDate) || !StringUtils.equals(currTime, fcstTime)) {
				currDate = fcstDate;
				currTime = fcstTime;
				
				map = new HashMap<String, Object>();
				map.put("date", fcstDate);
				map.put("hour", fcstTime.substring(0, 2));
			}
			
			map.put(obj.getString("category").toLowerCase(), obj.getString("fcstValue"));
			
			if(i < items.size()-1) {
				JSONObject nextObj = items.getJSONObject(i+1);
				if(!StringUtils.equals(fcstDate, nextObj.getString("fcstDate")) || !StringUtils.equals(fcstTime, nextObj.getString("fcstTime"))) {
					list.add(map);
					
					// 3시간 단위이므로 +1 / +2 시간대 함께 넣어주도록 LIST 추가
					Map<String, Object> map1 = new HashMap<String, Object>();
					map1.putAll(map);
					map1.put("hour", String.format("%02d",Integer.parseInt(fcstTime.substring(0, 2))+ 1));
					list.add(map1);
					
					Map<String, Object> map2 = new HashMap<String, Object>();
					map2.putAll(map);
					map2.put("hour", String.format("%02d",Integer.parseInt(fcstTime.substring(0, 2))+ 2));
					list.add(map2);
				}	
			} else {
				list.add(map);
			}
			
		}
		
		return list;
	}
	
	/**
	 * 상황일지 생성
	 */
	@Override
	public Map<String, Object> createDailyRecord() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		/**
		 * 1. DB에서 등록된 상황일지 템플릿 전체 조회
		 * 2. 각각 템플릿 파일 존재 여부 확인
		 * 3. 템플릿 파일 config 시트 분석 -> map에 저장
		 * 4. 리포트 생성 대상 여부 검토
		 * 5. DB에서 데이터 조회
		 * 5-2. 템플릿의 header 복사해서 DB 데이터 일정 갯수마다 붙여넣기
		 * 6. excel 보고서 생성
		 * 7. DB에 생성된 보고서 정보 저장
		 *  
		 */
		
		Report report = new Report();
		report.setLastIndex(1);
		report.setReportSubType("02");
		report.setSearchType("M"); // 상황일지는 월별로 생성
		List<FlkMap> templeteList = reportMapper.selectReportTempleteList(report);
		Map<String, Object> configMap = new HashMap<>();
		
		for(FlkMap templateMap : templeteList) {
			String filePath = (String) templateMap.get("fileServerPath");
			String fileName = (String) templateMap.get("fileName");
			
			/** 임시 경로 */
			XSSFWorkbook excelTempleteWorkbook = readExcelTempleteFile(filePath + fileName);
			configMap = makeReportConfigMap(excelTempleteWorkbook); 
			
			Map<String, Object> dateMap = (Map<String, Object>) configMap.get("dateMap");
			//int startDay = Integer.parseInt(String.valueOf(dateMap.get("startDay")));
			//int endDay = Integer.parseInt(String.valueOf(dateMap.get("endDay")));
			String reportType = ((String)templateMap.get("reportType")).toUpperCase();
			
			Map<String, Object> paramMap = new HashMap<>();
			Map<String, Object> reportInsertMap = new HashMap<>();	//파일 생성 완료 후 DB에 정보 등록을 위한 맵

			//전 달의 상황일지 조회
			Calendar cal = Calendar.getInstance();
			String nowDate = (new SimpleDateFormat("yyyyMMddHHmm").format(cal.getTime()));
			//cal.add(Calendar.MONTH, -1);
			//Date date = cal.getTime();
			
			//String startDate = (new SimpleDateFormat("yyyyMM").format(date))+String.format("%02d", startDay);
			//String endDate = (new SimpleDateFormat("yyyyMM").format(date))+String.format("%02d", endDay);

			String buildingId = (String) configMap.get("buildingId");
			String reportDateRange = getDateTime(buildingId, reportType);	
			String startDate = reportDateRange.split(",")[0];
			String endDate = reportDateRange.split(",")[1];
			
			paramMap.put("startDate", startDate);
			paramMap.put("endDate", endDate);
			
			//편의를 위해 날짜 정보 추가 저장
			dateMap.put("startDate", startDate);
			dateMap.put("endDate", endDate);
			configMap.put("dateMap", dateMap);
			
			reportInsertMap.put("reportStartDate", startDate.substring(0, 8));
			reportInsertMap.put("reportEndDate", endDate.substring(0, 8));
			reportInsertMap.put("rtId", templateMap.get("rtId"));
			
			/** 현재 시간이 리포트 범위 종료일보다 전일 경우 리포트 생성 패스
			 *  상황일지는 전달의 모든 일지를 가져오므로, 정책이 바뀌지 않는다면 아래 코드 사용하지 않음
			Calendar cur = Calendar.getInstance();
			Calendar end = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			
			end.setTime(sdf.parse(endDate));
			
			if(cur.before(end)) {
				continue;
			}
			 */
			
			//기존에 생성되어 있는 리포트가 있는 경우 리포트 생성 패스
			paramMap.put("rtId", templateMap.get("rtId"));
			paramMap.put("startDateForCheck", reportInsertMap.get("reportStartDate"));
			paramMap.put("endDateForCheck", reportInsertMap.get("reportEndDate"));
			int checkReport = batchTaskMapper.checkReport(paramMap);
			if(checkReport >= 1) {
				// TODO JAR continue;
			}
			
			paramMap.put("buildingId", configMap.get("buildingId"));
			
			//보고서 파일 작성
			makeDailyRecordFile(excelTempleteWorkbook, configMap, paramMap, nowDate, templateMap, reportInsertMap);
			
		}
		
		resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
		resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
		
		return resultMap;
	}
	
	/**
	 * 리포트 파일(상황일지) 작성 
	 * @param workbook
	 * @param configMap
	 * @param paramMap
	 * @param tempSetTime
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> makeDailyRecordFile(XSSFWorkbook workbook, Map<String, Object> configMap, 
			Map<String, Object> paramMap, String tempSetTime, FlkMap templateMap, Map<String, Object> reportInsertMap) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
				
			//DB에서 상황일지 데이터 가져온다
			List<FlkMap> reportData = batchTaskMapper.selectDailyRecordExcelList(paramMap);
			
			if(!reportData.isEmpty()){
				//column 적용
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
				 * 1. data가 29개 이상일 시 표 복사
				 * 2. 복사한 표를 아래에 추가
				 * 3. 추가한 cell로 데이터 삽입
				 */
				
				//Sheet Cells Data
				int totalRowCnt = reportData.size();
				int totalPageCnt = totalRowCnt / 29;
				if(totalRowCnt % 29 > 0){
					totalPageCnt += 1;
				}
	
				//Sheet Title
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.MONTH, -1);
				
				String sheetTitle = "월별상황기록지("+(String) reportData.get(0).get("siteName")+") " + new SimpleDateFormat("yyyy년 MM월").format(calendar.getTime());
				
				XSSFRow titleRow = sheettest.getRow(0);
				XSSFCell titleCell = titleRow.getCell(1);
				if(titleCell == null){
					titleCell = titleRow.createCell(1);
				}
				titleCell.setCellType(titleCell.CELL_TYPE_STRING);
				titleCell.setCellValue(sheetTitle+"-(1)");
				
				if(totalPageCnt > 1){
					for(int j = 1 ; j < totalPageCnt ; j ++){
						for(int m = 0 ; m<38 ; m++){
							XSSFRow row = sheettest.getRow(m);
							XSSFRow addRow = sheettest.createRow(m+38*j);
							
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
								   case XSSFCell.CELL_TYPE_FORMULA : // 수식처리를 한 셀(A1+B1)을 가져올경우 이것을 이용한다.  
									   value = cell.getCellFormula();
								       break;
								   case XSSFCell.CELL_TYPE_NUMERIC : // 엑셀타입에서 숫자형의 경우를 받아온다.
									   value = cell.getNumericCellValue()+""; //double
								        break;    // 엑셀타입에서 문자형을 받아온다.
								   case XSSFCell.CELL_TYPE_STRING :
									   value = cell.getStringCellValue(); //String
								        break; // 값이 없을 경우의 처리
								   case XSSFCell.CELL_TYPE_BLANK :
									   value = null;
								        break; // BOOLEAN형의 처리
								   case XSSFCell.CELL_TYPE_BOOLEAN :
									   value = cell.getBooleanCellValue()+""; //boolean
								        break; // 에러 바이트를 출력한다.
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
						/** 복사 후 병합 처리 */
						//1. 헤더병합
						sheettest.addMergedRegion(new CellRangeAddress(0+38*j, 2+38*j, 1, 27));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 1, 2));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 3, 3));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 4, 4));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 6, 12));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 13, 19));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 20, 26));
						sheettest.addMergedRegion(new CellRangeAddress(7+38*j, 8+38*j, 27, 27));
						//2. 데이터 영역 병합
						for(int h=1 ; h<=29 ; h++){
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 1, 2));
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 6, 12));
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 13, 19));
							sheettest.addMergedRegion(new CellRangeAddress(8+38*j+h, 8+38*j+h, 20, 26));
						}
					}
	
				}
						
				int i = 9; // 최초 data 적용 low
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
				
				//보고서(상황일지) 파일 생성 & DB에 등록
				writeDailyRecordFile(templateMap, workbook, reportInsertMap, tempSetTime);
			
			}else{
				logger.error("daily records are null Error");
				logger.error("search conditions are siteCd : "+paramMap.get("buildingId")+", startDate : "+paramMap.get("startDate")+", endDate : "+paramMap.get("endDate"));
			}
			
			
		} catch (ParseException e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Make DailyRecord File error");
		}	
		
		return result;
	}
	
	/**
	 * 작성된 보고서를 실제 파일로 생성 후 DB에 생성 이력 등록하는 함수
	 * @param templateMap
	 * @param workbook
	 * @param reportInsertMap
	 * @param tempSetTime
	 * @throws ParseException
	 */
	public void writeDailyRecordFile(FlkMap templateMap, XSSFWorkbook workbook, Map<String, Object> reportInsertMap, String tempSetTime) throws ParseException {
		
		//리포트 템플릿에 있는 함수들 갱신
		XSSFFormulaEvaluator.evaluateAllFormulaCells(workbook);
		StringBuffer fileName = new StringBuffer();
		
		if("M".equals(((String)templateMap.get("reportType")).toUpperCase())) {
			fileName.append("월별상황기록지");
		} else {
			fileName.append("연도별상황기록지");
		}
		
		Calendar calendar = Calendar.getInstance();
		
		//배치 실행일 기준 전달에 대한 보고서
		calendar.add(Calendar.MONTH, -1);
		fileName.append("("+new SimpleDateFormat("yyyy년 MM월").format(calendar.getTime())+")");
		fileName.append(" - "+templateMap.get("sgName")+" ");
		fileName.append(templateMap.get("siteName")+".xlsx");
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
			reportInsertMap.put("siteId", templateMap.get("siteId"));
			
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
	 * 보고서 생성
	 */
	@Override
	public Map<String, Object> createReport() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		
		/**
		 * 1. DB에서 등록된 템플릿 전체 조회
		 * 2. 각각 템플릿 파일 존재 여부 확인
		 * 3. 템플릿 파일 config 시트 분석 -> map에 저장
		 * 4. 리포트 생성 대상 여부 검토
		 * 5. DB에서 데이터 조회
		 * 6. excel 보고서 생성
		 * 7. DB에 생성된 보고서 정보 저장
		 *  
		 */
		
		Report report = new Report();
		report.setLastIndex(1);
		report.setReportSubType("00");
		List<FlkMap> templeteList = reportMapper.selectReportTempleteList(report);
		Map<String, Object> configMap = new HashMap<>();
		for(FlkMap templateMap : templeteList) {
			String filePath = (String) templateMap.get("fileServerPath");
			String fileName = (String) templateMap.get("fileName");
			XSSFWorkbook excelTempleteWorkbook = readExcelTempleteFile(filePath + fileName);
			configMap = makeReportConfigMap(excelTempleteWorkbook); 
			
			
			Map<String, Object> dateMap = (Map<String, Object>) configMap.get("dateMap");
			String buildingId = (String) configMap.get("buildingId");
			/*int startDay = Integer.parseInt(String.valueOf(dateMap.get("startDay")));
			int endDay = Integer.parseInt(String.valueOf(dateMap.get("endDay")));
			int startHour = Integer.parseInt(String.valueOf(dateMap.get("startTime")).split(":")[0]);
			int startMin = Integer.parseInt(String.valueOf(dateMap.get("startTime")).split(":")[1]);
			int endHour = Integer.parseInt(String.valueOf(dateMap.get("endTime")).split(":")[0]);
			int endMin = Integer.parseInt(String.valueOf(dateMap.get("endTime")).split(":")[1]);*/
			String reportType = ((String)templateMap.get("reportType")).toUpperCase();
			
			Map<String, Object> paramMap = new HashMap<>();
			Map<String, Object> reportInsertMap = new HashMap<>();	//파일 생성 완료 후 DB에 정보 등록을 위한 맵

			
			/**
			 * config 시트 기준 start, end 날짜를 구하는 함수
			 * 상용 적용시엔 호출시 날짜부분을 공백으로 호출해야 정상 작동함
			 */
			//String reportDateRange = getDate(startDay, endDay, startHour, startMin, endHour, endMin, reportType, "");					//상용 호출 방식
			//String reportDateRange = getDate(startDay, endDay, startHour, startMin, endHour, endMin, reportType, "201611150200");     //개발 테스트 호출 방식
			String reportDateRange = getDateTime(buildingId, reportType);	
			String startDate = reportDateRange.split(",")[0];
			String endDate = reportDateRange.split(",")[1];
			
			paramMap.put("startDate", startDate);
			paramMap.put("endDate", endDate);
			
			//편의를 위해 날짜 정보 추가 저장
			dateMap.put("startDate", startDate);
			dateMap.put("endDate", endDate);
			configMap.put("dateMap", dateMap);
			
			Calendar reportInsert = Calendar.getInstance();
			reportInsert.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(startDate));
			if(reportInsert.get(Calendar.HOUR_OF_DAY) > 0) {
				reportInsert.add(Calendar.DAY_OF_MONTH, 1);
			}
			
			
			if("M".equals(reportType)) {		//월간 리포트
				reportInsertMap.put("reportStartDate", new SimpleDateFormat("yyyyMMdd").format(reportInsert.getTime()));
				reportInsertMap.put("reportEndDate", endDate.substring(0, 8));
			} else if("Y".equals(reportType)) {	//연간 리포트
				reportInsertMap.put("reportStartDate", new SimpleDateFormat("yyyyMM").format(reportInsert.getTime()));
				reportInsertMap.put("reportEndDate", endDate.substring(0, 6));
			}

			reportInsertMap.put("rtId", templateMap.get("rtId"));
			
			
			Calendar cur = Calendar.getInstance();
			Calendar end = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			
			end.setTime(sdf.parse(endDate));

			//현재 시간이 리포트 범위 종료일보다 전일 경우 리포트 생성 패스
			if(cur.before(end)) {
				continue;
			}
			 
			
			//기존에 생성되어 있는 리포트가 있는 경우 리포트 생성 패스
			paramMap.put("rtId", templateMap.get("rtId"));
			paramMap.put("startDateForCheck", reportInsertMap.get("reportStartDate"));
			paramMap.put("endDateForCheck", reportInsertMap.get("reportEndDate"));
			int checkReport = batchTaskMapper.checkReport(paramMap);
			if(checkReport >= 1) {
				continue;
			}
			
			paramMap.put("buildingId", configMap.get("buildingId"));

			//템플릿 파일 min 시트에 남아 있는 기존 데이터 삭제
			clearReportTempleteFile(excelTempleteWorkbook, configMap);

			
			/** 
			 * 보고서 파일 작성
			 * 상용 적용시엔 호출시 날짜부분을 공백으로 호출해야 정상 작동함 
			 */
			makeReportFile(excelTempleteWorkbook, configMap, paramMap, "");								//상용 호출 방식
			//makeReportFile(excelTempleteWorkbook, configMap, paramMap, "201611150200");				//개발 테스트 호출 방식

			/** 
			 * 보고서 파일 생성 & DB에 등록
			 * 상용 적용시엔 호출시 날짜부분을 공백으로 호출해야 정상 작동함 
			 */
			writeReportFile(templateMap, excelTempleteWorkbook, reportInsertMap, "");					//상용 호출 방식
			//writeReportFile(templateMap, excelTempleteWorkbook, reportInsertMap, "201611150200");		//개발 테스트 호출 방식
			
		}
		
		
		resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
		resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
		
		
		
		
		return resultMap;
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
	 * 작성된 보고서를 실제 파일로 생성 후 DB에 생성 이력 등록하는 함수
	 * @param templateMap
	 * @param workbook
	 * @param reportInsertMap
	 * @param tempSetTime
	 * @throws ParseException
	 */
	public void writeReportFile(FlkMap templateMap, XSSFWorkbook workbook, Map<String, Object> reportInsertMap, String tempSetTime) throws ParseException {
		
		//리포트 템플릿에 있는 함수들 갱신
		XSSFFormulaEvaluator.evaluateAllFormulaCells(workbook);
		StringBuffer fileName = new StringBuffer();
		
		fileName.append(templateMap.get("sgName"));
		fileName.append(" ").append(templateMap.get("siteName"));
		
		if("M".equals(((String)templateMap.get("reportType")).toUpperCase())) {
			fileName.append(" ").append("월간정기");
		} else {
			fileName.append(" ").append("연간정기");
		}
		
		Calendar calendar = Calendar.getInstance();
		
		/** s:개발시 테스트용 셋팅
		 * 상용 적용시엔 호출시 공백으로 호출해야 정상 작동함 
		 */
		/*if(StringUtils.isNotBlank(tempSetTime)) {
			calendar.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(tempSetTime));	
		}*/
		/** e:개발시 테스트용 셋팅 */ 
		
		
		//배치 실행일 기준 전달에 대한 보고서
		calendar.add(Calendar.MONTH, -1);
		fileName.append("("+new SimpleDateFormat("yyyy년MM월").format(calendar.getTime())+ ").xlsx");
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
			reportInsertMap.put("siteId", templateMap.get("siteId"));
			
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
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Report Config Read Error");
		}
		return configMap;
	}
	
	/**
	 * 지점 정보의 통계월시작일 리포트 날짜 기간을 구하는 함수
	 * @param buildingId - 지점코드
	 * @param reportType - 리포트 형식(M:월간, Y:연간)
	 * @return	startDate,endDate (DateFormat -> yyyyMMddHHmm)
	 * @throws ParseException
	 */
	private String getDateTime(String buildingId, String reportType) throws ParseException {
		
		// 지점정보 > 통계시작일 / 익월종료일 조회
		Site site = new Site();
		site.setSiteCd(buildingId);
		FlkMap siteInfo = siteMapper.selectSiteView(site);
		String startDay = (String) siteInfo.get("statStartDay");
		String endDay = (String) siteInfo.get("statEndDay");
		
		Calendar start = Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		SimpleDateFormat sdf_yyyyMMddHHmm = new SimpleDateFormat("yyyyMMddHHmm");
		
		// 1일 시작인 경우에는 매달 31일
		if(StringUtils.equals(startDay, "01")) {
			start.add(Calendar.MONTH, -2);
			int preMaxEndDay = start.getActualMaximum(Calendar.DAY_OF_MONTH);
			start.set(Calendar.DAY_OF_MONTH, preMaxEndDay);
			end.add(Calendar.MONTH, -1);
			
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
			start.add(Calendar.MONTH, -1);
			
			start.set(Calendar.HOUR_OF_DAY, Math.abs(23));
			start.set(Calendar.MINUTE, 00);
			
			end.set(Calendar.DAY_OF_MONTH, Math.abs(Integer.parseInt(endDay)));
			end.set(Calendar.HOUR_OF_DAY, 22);
			end.set(Calendar.MINUTE, 59);
		}
		
		String result =  sdf_yyyyMMddHHmm.format(start.getTime())+","+ sdf_yyyyMMddHHmm.format(end.getTime());
		return result;
		
	}
	
	
	/**
	 * 리포트 템플릿 파일 config 시트에 있는 데이터 기반으로 리포트 날짜 기간을 구하는 함수
	 * @param sDay	- 시작일
	 * @param eDay	- 종료일
	 * @param sHour	- 시작시
	 * @param sMin	- 시작분
	 * @param eHour	- 종료시
	 * @param eMin	- 종료분
	 * @param reportType - 리포트 형식(M:월간, Y:연간)
	 * @return	startDate,endDate (DateFormat -> yyyyMMddHHmm)
	 * @throws ParseException
	 */
	public String getDate(int sDay, int eDay, int sHour, int sMin, int eHour, int eMin, String reportType, String tempSetTime) throws ParseException {
		
		/**
		 * 1. 매달(1일~말일)까지 인지 아닌지 여부 확인
		 * 	
		 * 	case1. 매달(ex. 2017.05.01 ~ 04.31)
		 * 		2-1. 시작시간 확인(음수면 전일부터, 양수면 1일 부터)
		 * 		
		 * 	
		 * 	case2. 중간에 걸친경우(ex. 2017.04.15 ~ 05.14)
		 * 		2-1. 시작시간 확인(음수면 전일부터, 양수면 설정된 일 부터)
		 */

		Calendar start = Calendar.getInstance();
		Calendar end = Calendar.getInstance();
		SimpleDateFormat sdf_yyyyMMddHHmm = new SimpleDateFormat("yyyyMMddHHmm");
		
		
		
		// 개발 테스트용 임시 셋팅
		if(StringUtils.isNotBlank(tempSetTime)) {
			start.setTime(sdf_yyyyMMddHHmm.parse(tempSetTime));	
			end.setTime(sdf_yyyyMMddHHmm.parse(tempSetTime));	
		}
		// 개발 테스트용 임시 셋팅

		if("M".equals(reportType.toUpperCase())) {
			
			if(sDay > 0) {
				// 매달(
				
				//배치 실행시각 기준에서 시작일 셋팅 후 한달전으로 변경
				start.set(Calendar.DAY_OF_MONTH, sDay);
				start.add(Calendar.MONTH, -1);
				end.add(Calendar.MONTH, -1);
				
				int maxEndDay = 0;
				
				maxEndDay = start.getActualMaximum(Calendar.DAY_OF_MONTH);
				
				if(sHour < 0) {
					//시작 시간이 - 이면 하루 전일로 변경, + 이면 날짜 변경없음
					start.add(Calendar.DAY_OF_MONTH, -1);
				}
				//시간 셋팅
				start.set(Calendar.HOUR_OF_DAY, Math.abs(sHour));
				start.set(Calendar.MINUTE, sMin);
				
				end.set(Calendar.DAY_OF_MONTH, maxEndDay);
				end.set(Calendar.HOUR_OF_DAY, eHour);
				end.set(Calendar.MINUTE, eMin);
	
				if(end.getActualMaximum(Calendar.DAY_OF_MONTH) != end.get(Calendar.DAY_OF_MONTH)) {
					end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH));
				}
			} else {
				// 걸친경우
				
				//배치 실행시각 기준에서 시작일 셋팅 후 두달전으로 변경
				start.set(Calendar.DAY_OF_MONTH, Math.abs(sDay));
				start.add(Calendar.MONTH, -1);
				
				if(sHour < 0) {
					//시작 시간이 - 이면 하루 전일로 변경, + 이면 날짜 변경없음
					start.add(Calendar.DAY_OF_MONTH, -1);
				}
				//시간 셋팅
				start.set(Calendar.HOUR_OF_DAY, Math.abs(sHour));
				start.set(Calendar.MINUTE, sMin);
				
				end.set(Calendar.DAY_OF_MONTH, eDay);
				end.set(Calendar.HOUR_OF_DAY, eHour);
				end.set(Calendar.MINUTE, eMin);
				
			}
		} else if("Y".equals(reportType.toUpperCase())) {
			
			if(sDay > 0) {
				
				// 시작일 셋팅 후 배치 실행일 기준 전년도, 1월로 셋팅
				start.set(Calendar.DAY_OF_MONTH, sDay);
				start.set(Calendar.YEAR, start.get(Calendar.YEAR)-1);
				start.set(Calendar.MONTH, 0);
				end.set(Calendar.YEAR, end.get(Calendar.YEAR)-1);
				end.set(Calendar.MONTH, 0);
				
				int maxEndDay = 0;

				maxEndDay = start.getActualMaximum(Calendar.DAY_OF_MONTH);
				
				if(sHour < 0) {
					//시작 시간이 - 이면 하루 전일로 변경, + 이면 날짜 변경없음
					start.add(Calendar.DAY_OF_MONTH, -1);
				}
				//시간 셋팅
				start.set(Calendar.HOUR_OF_DAY, Math.abs(sHour));
				start.set(Calendar.MINUTE, sMin);
				
				end.set(Calendar.DAY_OF_MONTH, maxEndDay);
				end.set(Calendar.HOUR_OF_DAY, eHour);
				end.set(Calendar.MINUTE, eMin);

				if(end.getActualMaximum(Calendar.DAY_OF_MONTH) != end.get(Calendar.DAY_OF_MONTH)) {
					end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH));
				}
				
			} else {
				
				// 시작일 셋팅 후 배치 실행일 기준 start는 전전년도, 12월 end는 전년도 12월로 셋팅
				start.set(Calendar.DAY_OF_MONTH, Math.abs(sDay));
				start.set(Calendar.YEAR, start.get(Calendar.YEAR)-2);
				start.set(Calendar.MONTH, 11);
				end.set(Calendar.YEAR, end.get(Calendar.YEAR)-1);
				end.set(Calendar.MONTH, 11);
				
				
				if(sHour < 0) {
					//시작 시간이 - 이면 하루 전일로 변경, + 이면 날짜 변경없음
					start.add(Calendar.DAY_OF_MONTH, -1);
				}
				//시간 셋팅
				start.set(Calendar.HOUR_OF_DAY, Math.abs(sHour));
				start.set(Calendar.MINUTE, sMin);
				
				end.set(Calendar.DAY_OF_MONTH, eDay);
				end.set(Calendar.HOUR_OF_DAY, eHour);
				end.set(Calendar.MINUTE, eMin);				
			}
		}
		String result =  sdf_yyyyMMddHHmm.format(start.getTime())+","+ sdf_yyyyMMddHHmm.format(end.getTime());
		
		return result;
		
	}
	
	/**
	 * 템플릿 파일 min 시트에 남아 있는 기존 데이터를 삭제하는 함수
	 * @param workbook
	 * @param configMap
	 */
	public void clearReportTempleteFile(XSSFWorkbook workbook, Map<String, Object> configMap) {
		
		try {
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			
			HashMap<String, Object> tagMap = new HashMap<String, Object>((HashMap<String, Object>) configMap.get("tagMap"));
			Set<String> tagMapKeyset = tagMap.keySet();
			int minCell = 1;
			int maxCell = 0;
			
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
					for(int i=minCell; i<=maxCell; i++) {
						for(int j=0; j<60*24; j++) {
							curRow = curSheet.getRow(7+j);
							curCell = curRow.getCell(i);
							curCell.setCellValue("");
						}
					}
				}
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
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

		String regex = "(?<=\\D)(?=\\d)|(?<=\\d)(?=\\D)"; 
		try {
				
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			
			// 추가된 config 항목 데이터 처리
			HashMap<String, Object> uniqMap = new HashMap<String, Object>((HashMap<String, Object>) configMap.get("uniqMap"));
			List<String> tagIdList = new ArrayList<String>((List<String>) configMap.get("tagIdList"));
			workbook = defaultValueSetting(uniqMap, tagIdList, paramMap, workbook);
			
			HashMap<String, Object> dateMap = (HashMap<String, Object>) configMap.get("dateMap");
			HashMap<String, Object> tagMap = new HashMap<String, Object>((HashMap<String, Object>) configMap.get("tagMap"));
			String sheetStartDate = (String) dateMap.get("startDate");
			String sheetEndDate = (String) dateMap.get("startDate");
			int sheetCount = 0;
			
			for(int sheetIndex=0; sheetIndex<workbook.getNumberOfSheets(); sheetIndex++) {
				curSheet = workbook.getSheetAt(sheetIndex);
				String sheetName = curSheet.getSheetName();
				if(sheetName.indexOf("min") > -1) {
					
					sheetCount++;
					
					HashMap<String, Object> tagMapCopy = new HashMap<>(tagMap); 
					
					//시트 변경에 따른 날짜 범위 조정
					Calendar sheetStartDateCalendar = Calendar.getInstance();
					Calendar sheetLastDateCalendar = Calendar.getInstance();
					
					
					/** 개발 테스트용 임시 셋팅 
					if(StringUtils.isNotBlank(tempSetTime)) {
						sheetStartDateCalendar.setTime(sdf_default.parse(tempSetTime));
						sheetLastDateCalendar.setTime(sdf_default.parse(tempSetTime));
					}
					/** 개발 테스트용 임시 셋팅 */

					
					
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

					List<FlkMap> reportData = batchTaskMapper.selectReportData(paramMap);
					
					/** s:각 시트별 상단에 날짜 입력 */
					CellReference cellReference = new CellReference("A4");
					curRow = curSheet.getRow(cellReference.getRow());
					curCell = curRow.getCell(cellReference.getCol());
					if(sheetStartDateCalendar.get(Calendar.HOUR_OF_DAY) > 0) {
						Calendar titleCalendar = Calendar.getInstance();
							
						/** 개발 테스트용 임시 셋팅
						if(StringUtils.isNotBlank(tempSetTime)){
							titleCalendar.setTime(sdf_default.parse(tempSetTime));
						}
						/** 개발 테스트용 임시 셋팅 */
						
						titleCalendar.setTime(sheetStartDateCalendar.getTime());
						titleCalendar.add(Calendar.DAY_OF_MONTH, 1);
						curCell.setCellValue(sdf_sheetTitleTime.format(titleCalendar.getTime()));
					} else {
						curCell.setCellValue(sdf_sheetTitleTime.format(sheetStartDateCalendar.getTime()));
					}
					/** e:각 시트별 상단에 날짜 입력 */
					
					
					Calendar timeCalendar = Calendar.getInstance();
					
					/** 개발 테스트용 임시 셋팅
					if(StringUtils.isNotBlank(tempSetTime)){
						timeCalendar.setTime(sdf_default.parse(tempSetTime));
					}
					/** 개발 테스트용 임시 셋팅 */
					
					
					/** s:시트내 각 Row에 날짜 입력 */
					timeCalendar.setTime(sdf_default.parse(sheetStartDate));
					for(int i=0; i<60*24; i++) {
						XSSFRow row = curSheet.getRow(7+i);
						XSSFCell cell = row.getCell(0);
						cell.setCellValue(sdf_rowTime.format(timeCalendar.getTime()));
						timeCalendar.add(Calendar.MINUTE, 1);
					}
					/** e:시트내 각 Row에 날짜 입력 */
					
					
					for(FlkMap data : reportData) {
						String statDateTime = (String) data.get("statDateTime");
						String tagId = (String) data.get("tagId");
						BigDecimal tagValue = (BigDecimal) data.get("tagValue");
						HashMap<String, Object> tag = new HashMap<String, Object>((HashMap<String, Object>)tagMapCopy.get(tagId));
						
						if(tag != null) {
							String cellAddress = (String) tag.get("cellAddress");
							CellReference cr = new CellReference(cellAddress);
							curRow = curSheet.getRow(cr.getRow());
							curCell = curRow.getCell(cr.getCol());
							if(tagValue == null) {	// 해당 셀에 넣어야 할 값이 DB에 없는 경우 로그만 출력 후 값 입력하지 않음
								logger.error("tagValue is null Error");
								logger.error("sheetName : " + sheetName + ", cellAddress : " + cellAddress + ", tagId : " + tagId + ", statDate : " + statDateTime);
							} else {
								try {
									curCell.setCellValue(tagValue.doubleValue());
								} catch (Exception e) {
									logger.error(e.getMessage(), e);
									continue;
								}
							}
							tag.put("cellAddress", cellAddress.split(regex)[0] + (Integer.valueOf(cellAddress.split(regex)[1])+1)); // 영문+숫자 되어 있는 Excel 좌표에서 영문제외 숫자만 추출 후 1 증가 시킴
							tagMapCopy.put(tagId, tag);
						}
					}
				}
			}
		} catch (ParseException e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Make Report Filee error");
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
		paramMap.put("energyType", "01");	
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
		List<FlkMap> runStatData = batchTaskMapper.selectRunStatData(paramMap);

		Set<String> keySet = uniqMap.keySet();
		for( String uniqNo : keySet ){
		    HashMap<String, Object> subMap = new HashMap<String, Object>((HashMap<String, Object>)uniqMap.get(uniqNo));
	    	String sheetName = (String) subMap.get("sheetName");
	    	curSheet = workbook.getSheet(sheetName);
	    	String cellAddress = (String) subMap.get("cellAddress");
	    	String tagId = (String) subMap.get("tagId");
			CellReference cr = new CellReference(cellAddress);
			curRow = curSheet.getRow(cr.getRow());
			curCell = curRow.getCell(cr.getCol());
			int no = Integer.parseInt(uniqNo.substring(1, uniqNo.length()));
			Object cellValue = null;
			
			// System.out.println("JAR ========================================> sheetName : "+ sheetName + ", uniqNo : "+uniqNo + ", no : "+no + ", cellAddress : "+cellAddress);
			if(no == 28) {	// N28 운영기간
				String startDate = (String) paramMap.get("startDate");
				String endDate = (String) paramMap.get("endDate");
				Calendar start = Calendar.getInstance();
				start.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(startDate));	
				Calendar end = Calendar.getInstance();
				end.setTime(new SimpleDateFormat("yyyyMMddHHmm").parse(endDate));
				
				StringBuffer sb = new StringBuffer();
				sb.append(new SimpleDateFormat("yyyy년 MM월 dd일").format(start.getTime()));
				sb.append(" ~ ");
				sb.append(new SimpleDateFormat("yyyy년 MM월 dd일").format(end.getTime()));
				cellValue = sb.toString();
				
			} else if(no >= 29 && no <= 40 || no >= 225 && no <= 230) {	// N29 ~ N40 / N225 ~ N230 1분 실시간 통계 데이터
				for(FlkMap data : runStatData) {
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
						}  
					}
				}
			}
			//System.out.println("uniqNo : "+uniqNo + ", cellValue : " + cellValue );
			//System.out.println("");
			if(cellValue instanceof BigDecimal) {
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