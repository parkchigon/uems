package com.flk.mng.report.service;

import java.awt.Dimension;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.PrintSetup;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.batch.mapper.BatchTaskMapper;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.domain.UploadFile;
import com.flk.common.enums.ErrorCodeEnum;
import com.flk.common.enums.FacilityEnum;
import com.flk.common.exception.BizExceptionProperties;
import com.flk.common.utility.DateFormatUtils;
import com.flk.common.utility.FileImageUtil;
import com.flk.common.utility.FileUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.equipment.domain.AutoCtrl;
import com.flk.mng.equipment.domain.CTower;
import com.flk.mng.equipment.domain.Chiller;
import com.flk.mng.equipment.domain.ElecMcc;
import com.flk.mng.equipment.domain.HeatExc;
import com.flk.mng.equipment.domain.HeatStg;
import com.flk.mng.equipment.domain.Pump;
import com.flk.mng.equipment.mapper.AutoCtrlMapper;
import com.flk.mng.equipment.mapper.CTowerMapper;
import com.flk.mng.equipment.mapper.ChillerMapper;
import com.flk.mng.equipment.mapper.ElecMccMapper;
import com.flk.mng.equipment.mapper.HeatExcMapper;
import com.flk.mng.equipment.mapper.HeatStgMapper;
import com.flk.mng.equipment.mapper.PumpMapper;
import com.flk.mng.report.domain.Maintenance;
import com.flk.mng.report.domain.Report;
import com.flk.mng.report.mapper.RegularCheckMapper;
import com.flk.mng.report.mapper.ReportMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;
import com.flk.mng.work.domain.WorkHistory;
import com.flk.mng.work.service.WorkHistoryService;
import com.flk.mobile.mapper.MobileMapper;

import net.sf.jxls.transformer.XLSTransformer;

@Service
public class RegularCheckServiceImpl implements RegularCheckService{

	private static final Logger logger = LoggerFactory.getLogger(RegularCheckServiceImpl.class);
	
	@Autowired
	private RegularCheckMapper regularCheckMapper;

	@Autowired
	private ReportMapper reportMapper;

	@Autowired
	private SiteMapper siteMapper;
	
	@Autowired
	private PumpMapper pumpMapper;
	
	@Autowired
	private HeatExcMapper heatExcMapper;
	
	@Autowired
	private ChillerMapper chillerMapper;
	
	@Autowired
	private HeatStgMapper heatStgMapper;
	
	@Autowired
	private CTowerMapper cTowerMapper;
	
	@Autowired
	private AutoCtrlMapper autoCtrlMapper;
	
	@Autowired
	private ElecMccMapper elecMccMapper;
	
	@Autowired
	private BatchTaskMapper batchTaskMapper;
	
	@Autowired
	private MobileMapper mobileMapper;

	@Autowired
	private FileImageUtil fileImageUtil;
	
	@Autowired
	private WorkHistoryService workHistoryService;
	
	@Value("#{config['maintenance.file.path']}")
	private String filePath;
	
	/**
	 * 장비리스트조회
	 */
	@Override
	public List<FlkMap> selectFacilityList(Maintenance maintenance) throws Exception {
		return regularCheckMapper.selectFacilityList(maintenance);
	}

	/**
	 * 점검항목리스트조회
	 */
	@Override
	public List<FlkMap> selectFacilityQueList(Maintenance maintenance) throws Exception {
		//키값조회
		//Maintenance main = regularCheckMapper.selectMsId(maintenance);
		
		return regularCheckMapper.selectFacilityQueList(maintenance);
	}

	/**
	 * 점검항목 상세 리스트조회
	 */
	@Override
	public List<FlkMap> selectFacilityAnsList(Maintenance maintenance) throws Exception {
		return regularCheckMapper.selectFacilityAnsList(maintenance);
	}

	/**
	 * 점검항목 대항목 추가수정삭제
	 */
	@Override
	@Transactional
	public Boolean saveFacilityQueList(Maintenance maintenance) throws Exception {
		Boolean result = true;
		if(Constants.YES.equals(maintenance.getUpdateFlag())){ //추가,수정,삭제 있는 경우
			/* 1.삭제항목 UPDATE */
			if(maintenance.getDelListArr().length > 0){
				int delResult = regularCheckMapper.deleteQueList(maintenance);
				if(delResult > 0){
					regularCheckMapper.deleteQueAnsList(maintenance);
				}
			}
			/* 2. UPDATE & INSERT */
			List<Maintenance> list = maintenance.getQueList();
			for(int i=0; i<list.size(); i++){
				/* 추가,수정 항목 재등록 */
				list.get(i).setMsId(maintenance.getMsId());
				list.get(i).setRegId(maintenance.getRegId());
				regularCheckMapper.insertQueList(list.get(i));
				/* ans테이블 msq_id 값 update */
				regularCheckMapper.updateAnsMsqId(list.get(i));
				if(list.get(i).getMsqId() != null){
					/* 수정항목 이전데이터 use_flag='N'  UPDATE */
					regularCheckMapper.updateQueList(list.get(i));
				}
				//신규등록일 경우 상세항목 '기타' 추가등록
				if(Constants.YES.equals(list.get(i).getNewYn())){
					list.get(i).setAnswer(Constants.ETC_VALUE);
					list.get(i).setCheckTypeFlag(Constants.ETC);
					list.get(i).setSortNo(Constants.NO1);
					regularCheckMapper.insertAnsDefaultEtc(list.get(i));
				}
			}
			/* defaultList > sort_no  update */
			List<Maintenance> defaultList = maintenance.getDefaultList();
			for(int j=0; j<defaultList.size(); j++){
				regularCheckMapper.updateQueSortNo(defaultList.get(j));
			}
		}else{ // 순서만 변경된 경우 : queList > sort_no 만 update
			List<Maintenance> list = maintenance.getQueList();
			for(int j=0; j<list.size(); j++){
				regularCheckMapper.updateQueSortNo(list.get(j));
			}
		}
		
		
		return result;
	}
	
	/**
	 * 점검항목 상세항목 추가수정삭제
	 */
	@Override
	@Transactional
	public Boolean saveFacilityAnsList(Maintenance maintenance) throws Exception {
		Boolean result = true;
		if(Constants.YES.equals(maintenance.getUpdateFlag())){ //추가,수정,삭제 있는 경우
			/* 1.삭제항목 UPDATE */                           
			if(maintenance.getDelListArr().length > 0){
				regularCheckMapper.deleteAnsList(maintenance);
			}
			/* 2. UPDATE & INSERT */
			List<Maintenance> list = maintenance.getQueList();
			for(int i=0; i<list.size(); i++){
				/* 추가,수정 항목 재등록 */
				list.get(i).setMsqId(maintenance.getMsqId());
				list.get(i).setRegId(maintenance.getRegId());
				regularCheckMapper.insertAnsList(list.get(i));
				if(list.get(i).getMsaId() != null){
					/* 수정항목 이전데이터 use_flag='N'  UPDATE */
					regularCheckMapper.updateAnsList(list.get(i));
				}
				/* 필수 기타 항목의 sort_no를 제일 마지막으로 변경 한다 */
				if (i == (list.size()-1)) {
					list.get(i).setSortNo(Integer.toString(list.size()+1));
					regularCheckMapper.updateAnsEtcSortNo(list.get(i));
				}
			}

			
		}else{ // 순서만 변경된 경우 : queList > sort_no 만 update
			List<Maintenance> list = maintenance.getQueList();
			for(int j=0; j<list.size(); j++){
				regularCheckMapper.updateAnsSortNo(list.get(j));
			}
		}
		
		return result;
	}

	//@Value("#{config['report.templete.file.path']}")		//로컬테스트시 사용
	//private String templatePath;               //보고서 템플릿 파일 저장 경로  //로컬테스트시 사용
	/**
	 * 정기점검 보고서 생성
	 */
	@Override
	public Map<String, Object> createRegularCheckReport(HttpServletRequest request, Maintenance maintenance) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 정기점검 보고서 생성
		// 1. 선택한 월에 정기점검이 완료되었는지 확인
		// 2. DB에 등록된 정기점검 템플릿 조회 (TBL_REPORT_TEMPLATE 1건 -> 조회쿼리 LIST 반환됨)
		// 3. 템플릿 파일 읽어오기
		// 4. DB에서 해당 사이트의 정기점검 항목이 등록되어있는 장비 리스트 조회
		// 5. 장비별로 시트 생성하여 데이터 입력
		// 6. EXCEL 보고서 생성
		// 7. 생성된 보고서 서버에 저장 후 TBL_REPORT_FILE 에 저장

		// 정기점검 완료 리스트 조회
		List<Maintenance> chkList = new ArrayList<Maintenance>();
		maintenance.setFinishYn(Constants.YES);
		chkList = regularCheckMapper.selectMaintenanceChk(maintenance);
		
		// 해당 월에 정기점검 리스트가 존재할 경우에만 보고서 생성
		if(chkList.size() > 0) {
			Report report = new Report();
			report.setLastIndex(1);
			report.setReportSubType("03");	// 정기점검
			report.setSearchType("M"); 		// 월별로 생성
			List<FlkMap> templeteList = reportMapper.selectReportTempleteList(report);
			Map<String, Object> dataMap = new HashMap<String, Object>();
			
			// 정기점검 템플릿 1건만 존재
			for(FlkMap templateMap : templeteList) {
				// 장비별 데이터 조회
				dataMap = selectFacilityData(chkList, maintenance);
				// 장비별 시트 생성
				makeReportSheet(request, templateMap, dataMap);
			}
			
		} else {
			// 해당 월에 정기점검 리스트가 없을 경우
			resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
			resultMap.put(Constants.RESULT_MSG, "fail.notExist.maintenance");
			return resultMap;
		}
		
		resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
		resultMap.put(Constants.RESULT_MSG, "success.report.maintenance");
		return resultMap;
	}
	
	/**
	 * 장비별 데이터 조회
	 * @param chkList
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	private Map<String, Object> selectFacilityData(List<Maintenance> chkList, Maintenance maintenance) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();
		
		try {
			// 지점정보 조회
			Site site = new Site();
			site.setSiteId(maintenance.getSiteId());
			FlkMap siteInfo = siteMapper.selectSiteView(site);
			dataMap.put("siteInfo", siteInfo);
			dataMap.put("chkMonth", maintenance.getChkMonth().substring(4, 6));
			dataMap.put("chkYear", maintenance.getChkMonth().substring(0, 4));
			
			/*String currDate = DateFormatUtils.getDateFormat("yyyyMMdd");
			dataMap.put("writeYYYY", currDate.substring(0, 4));
			dataMap.put("writeMM", currDate.substring(4, 6));
			dataMap.put("writeDD", currDate.substring(6, 8));*/
			
			List<Map<String, Object>> pumpList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> heatexcList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> chillerList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> heatstgList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> ctowerList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> autoctrlList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> elecmccList = new ArrayList<Map<String, Object>>();
			
			for(Maintenance chkVo : chkList) {
				String msId = chkVo.getMsId();
				String facilityKind = chkVo.getFacilityKind();
				String facilityId = chkVo.getFacilityId();
				String facilityName = FacilityEnum.enumOf(facilityKind).getValue();
				
				
				Map<String, Object> facilityMap = new HashMap<String, Object>();
				facilityMap.put("facilityKind", facilityKind);
				facilityMap.put("facilityId", facilityId);
				facilityMap.put("facilityName", facilityName);
				
				facilityMap.put("regDate", chkVo.getRegDate());
				
				Maintenance vo = new Maintenance();
				vo.setMsId(msId);
				vo.setChkMonth(maintenance.getChkMonth());
				vo.setCheckTypeFlag(Constants.YES);
				List<Maintenance> fileList = new ArrayList<Maintenance>();
				fileList = regularCheckMapper.selectFileQueList(vo);
				facilityMap.put("fileList", fileList);
				List<Maintenance> finishList = regularCheckMapper.selectFinishFacilityList(vo);
				List<Maintenance> queList = new ArrayList<Maintenance>();
				List<Maintenance> answerList = new ArrayList<Maintenance>();
				String curMsqId = "";
				String curMsaId = "";
				for(Maintenance finishVo : finishList) {
					if(!StringUtils.equals(curMsqId, finishVo.getMsqId())) {
						curMsqId = finishVo.getMsqId();
						queList.add(finishVo);
					}
					if(!StringUtils.equals(curMsaId, finishVo.getMsaId())) {
						curMsaId = finishVo.getMsaId();
						answerList.add(finishVo);
					}
				}
				facilityMap.put("queList", queList);
				facilityMap.put("answerList", answerList);
				facilityMap.put("finishList", finishList);
				
				
				// 01:펌프 02:열교환기 03:냉동기 04:축열조 05:냉각탑 06:자동제어 07:심야전기MCC
				switch (facilityKind) {
				
				case "01":	// 01:펌프 
					Pump pump = new Pump();
					pump.setFpmId(facilityId);
					FlkMap pumpInfo = pumpMapper.selectPumpInfo(pump);
					List<FlkMap> subPumpList = pumpMapper.selectSubPumpList(pump);
					facilityMap.put("facilityInfo", pumpInfo);
					facilityMap.put("subList", subPumpList);
					pumpList.add(facilityMap);
					break;
					
				case "02":	// 02:열교환기 
					HeatExc heatExc = new HeatExc();
					heatExc.setFhmId(facilityId);
					FlkMap heatExcInfo = heatExcMapper.selectHeatExcInfo(heatExc);
					facilityMap.put("facilityInfo", heatExcInfo);
					heatexcList.add(facilityMap);
					break;
					
				case "03":	// 03:냉동기
					Chiller chiller = new Chiller();
					chiller.setFsmId(facilityId);
					FlkMap chillerInfo = chillerMapper.selectChillerInfo(chiller);
					facilityMap.put("facilityInfo", chillerInfo);
					chillerList.add(facilityMap);
					break;
					
				case "04":	// 04:축열조
					HeatStg heatStg = new HeatStg();
					heatStg.setFhsm(facilityId);
					FlkMap heatStgInfo = heatStgMapper.selectHeatStgInfo(heatStg);
					facilityMap.put("facilityInfo", heatStgInfo);
					heatstgList.add(facilityMap);
					break;
					
				case "05":	// 05:냉각탑
					CTower cTower = new CTower();
					cTower.setFcmId(facilityId);
					FlkMap cTowerInfo = cTowerMapper.selectCTowerInfo(cTower);
					List<FlkMap> subCTowerList = cTowerMapper.selectSubCTowerList(cTower);
					facilityMap.put("facilityInfo", cTowerInfo);
					facilityMap.put("subList", subCTowerList);
					ctowerList.add(facilityMap);
					break;
					
				case "06":	// 06:자동제어
					AutoCtrl autoCtrl = new AutoCtrl();
					autoCtrl.setFamId(facilityId);
					FlkMap autoCtrlInfo = autoCtrlMapper.selectAutoCtrlInfo(autoCtrl);
					facilityMap.put("facilityInfo", autoCtrlInfo);
					autoctrlList.add(facilityMap);
					break;
					
				case "07":	// 07:심야전기MCC
					ElecMcc elecMcc = new ElecMcc();
					elecMcc.setFemId(facilityId);
					FlkMap elecMccInfo = elecMccMapper.selectElecMccInfo(elecMcc);
					facilityMap.put("facilityInfo", elecMccInfo);
					elecmccList.add(facilityMap);
					break;
				}
			}
			
			dataMap.put("pumpList", pumpList);
			dataMap.put("heatexcList", heatexcList);
			dataMap.put("chillerList", chillerList);
			dataMap.put("heatstgList", heatstgList);
			dataMap.put("ctowerList", ctowerList);
			dataMap.put("autoctrlList", autoctrlList);
			dataMap.put("elecmccList", elecmccList);
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Facility Data Select Error");
		}
		
		return dataMap;
	}

	/**
	 * 템플릿 읽어와서 장비별 시트 생성
	 * @param excelTempleteWorkbook
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private void makeReportSheet(HttpServletRequest request, FlkMap templateMap, Map<String, Object> dataMap) throws Exception {
		
		try {
			//String filePath = templatePath;	//로컬테스트시 사용
			//String tempFileName = "정기정검_월간정기.xlsx";
			String filePath = (String) templateMap.get("fileServerPath");
			String tempFileName = (String) templateMap.get("fileName");
			String rtId = String.valueOf((Integer) templateMap.get("rtId"));
	        
	        // 장비별 점검항목 생성
	     	XSSFWorkbook workbook = readExcelTempleteFile(filePath + tempFileName);
	     	
	     	List<Map<String, Object>> pumpList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> heatexcList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> chillerList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> heatstgList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> ctowerList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> autoctrlList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> elecmccList = new ArrayList<Map<String, Object>>();
			
	     	// 01:펌프 02:열교환기 03:냉동기 04:축열조 05:냉각탑 06:자동제어 07:심야전기MCC
	     	pumpList = (List<Map<String, Object>>) dataMap.get("pumpList");
	     	if(pumpList.size() > 0) {
	     		workbook = createPumpSheet(dataMap, workbook, pumpList);
	     	}
	     	heatexcList = (List<Map<String, Object>>) dataMap.get("heatexcList");
	     	if(heatexcList.size() > 0) {
	     		workbook = createHeatexcSheet(dataMap, workbook, heatexcList);
	     	}
	     	chillerList = (List<Map<String, Object>>) dataMap.get("chillerList");
	     	if(chillerList.size() > 0) {
	     		workbook = createChillerSheet(dataMap, workbook, chillerList);
	     	}
	     	heatstgList = (List<Map<String, Object>>) dataMap.get("heatstgList");
	     	if(heatstgList.size() > 0) {
	     		workbook = createHeatstgSheet(request, dataMap, workbook, heatstgList);
	     	}
	     	ctowerList = (List<Map<String, Object>>) dataMap.get("ctowerList");
	     	if(ctowerList.size() > 0) {
	     		workbook = createCtowerSheet(dataMap, workbook, ctowerList);
	     	}
	     	autoctrlList = (List<Map<String, Object>>) dataMap.get("autoctrlList");
	     	if(autoctrlList.size() > 0) {
	     		workbook = createAutoctrlSheet(dataMap, workbook, autoctrlList);
	     	}
	     	elecmccList = (List<Map<String, Object>>) dataMap.get("elecmccList");
	     	if(elecmccList.size() > 0) {
	     		workbook = createElecmccSheet(dataMap, workbook, elecmccList);
	     	}
	     	
	     	// 보고서 파일 생성 및 DB 이력 등록
			makeReportFile(dataMap, filePath, tempFileName, rtId, workbook);
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new Exception("Report Read Error");
		}
	}

	/**
	 * 심야전기MCC 시트생성
	 * @param dataMap
	 * @param workbook
	 * @param elecmccList
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private XSSFWorkbook createElecmccSheet(Map<String, Object> dataMap, XSSFWorkbook workbook, List<Map<String, Object>> elecmccList) throws Exception {
		int index = 0;
		for(Map<String, Object> facilityMap : elecmccList) {
			XSSFSheet curSheet;
			XSSFRow row;
			XSSFCell cell;
			
			String facilityName = (String) facilityMap.get("facilityName");
			FlkMap facilityInfo = (FlkMap) facilityMap.get("facilityInfo");
			
			String saveDate = (String) facilityMap.get("regDate");
			facilityInfo.put("writeYYYY", saveDate.substring(0, 4));
			facilityInfo.put("writeMM", saveDate.substring(4, 6));
			facilityInfo.put("writeDD", saveDate.substring(6, 8));
			
			curSheet = workbook.cloneSheet(workbook.getSheetIndex("#"+facilityName), (String) facilityInfo.get("elecmccName"));
			PrintSetup printSetup = curSheet.getPrintSetup();
			printSetup.setScale((short) 50);
			
			// 추가시트 생성 시에만 replaceAll 적용
			if(index > 0) {	
				// Row 18까지만 Excel read (심야전기MCC정보까지만)
				for(int r = 0; r < 18; r++) {
					row = curSheet.getRow(r);
					int cells = row.getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell == null) {
							continue;
						}
						if(cell.getStringCellValue().contains("elecmccList[0]")) {
							cell.setCellValue(cell.getStringCellValue().replaceAll("elecmccList\\[0\\]", "elecmccList["+index+"]"));
						}
					}
				}
			}
			
			// 하위 ROW 삭제
			int curRow = 18;
			int baseRow = 18;
			
			for(int i =0; i<curSheet.getLastRowNum(); i++) {
				removeRow(curSheet, curRow);
			}
			
			List<Maintenance> fileList = (List<Maintenance>) facilityMap.get("fileList");
			List<Maintenance> finishList = (List<Maintenance>) facilityMap.get("finishList");
			List<Maintenance> queList = (List<Maintenance>) facilityMap.get("queList");
			List<Maintenance> answerList = (List<Maintenance>) facilityMap.get("answerList");
			
			int cells = 0;
			// 템플릿 시트 가져오기
			XSSFSheet baseSheet = workbook.getSheet("#"+facilityName);
			curSheet.createRow(curRow);		
			// 대항목
			int queCnt = 1;
			for(Maintenance que : queList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+1).getRowStyle());
				row.setHeight((short) 600);
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for (int c = 0; c < cells; c++) {
					cell = row.createCell(c);
					if(c == 0) {
						cell.setCellValue(queCnt + ". " + (String) que.getQuestion());
					}
					cell.setCellStyle(baseSheet.getRow(baseRow+1).getCell(c).getCellStyle());
				}
				
				// 소항목
				int ansCnt = 1;
				for(Maintenance ans : answerList) {
					if(!StringUtils.equals(ans.getCheckTypeFlag(), Constants.NO) && StringUtils.equals(que.getMsqId(), ans.getMsqId())) {
						curRow = curRow+1;	
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						cells = baseSheet.getRow(baseRow+2).getPhysicalNumberOfCells();
						for (int c = 0; c < cells; c++) {
							cell = row.createCell(c);
							if(c == 1) {
								cell.setCellValue(ansCnt + ") ");
							} else if(c == 2) {
								cell.setCellValue((String) ans.getAnswer());
							} 
							
							if(StringUtils.equals(ans.getCheckTypeFlag(), Constants.YES)) {
								if(c == 10) {
									cell.setCellValue("확인여부");
								} else if(c == 12) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											if(StringUtils.equals(vo.getResult(), Constants.YES)) {
												cell.setCellValue("■");
											} else {
												cell.setCellValue("□");
											}
											break;
										}
									}
								}
							} else {
								 if(c == 3) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(vo.getCheckTypeFlag(), "E") && StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											cell.setCellValue(" :   "+vo.getResult());
											break;
										}
									}
								 }
							}
							cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
						}
						ansCnt++;
					}
				}
				
				// 99 기타의견 및 특이사항
				if(StringUtils.equals(que.getDesignedCode(), "99")) {
					int etcCnt = 1;
					for(Maintenance vo : finishList) {
						if(StringUtils.equals(vo.getDesignedCode(), "99")) {
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.createCell(c);
								if(c == 1) {
									cell.setCellValue(etcCnt+") ");
								} else if(c == 2) {
									cell.setCellValue(vo.getResult());
								}
								cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
							}
							etcCnt++;
						}
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
				
				/*// 대항목 별 이미지파일 호출 
				for(Maintenance vo : fileList) {
					if(StringUtils.equals(que.getMsqId(), vo.getMsqId())) {
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						//String[] arry = vo.getFilePath().split("/");
						//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
						String filePath = vo.getFilePath() + vo.getFileName();
						int height = getImageFile(workbook, curSheet, curRow, filePath);
						int rowCnt = height / 40;
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int i=0; i<rowCnt; i++) {
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
						}
						if(rowCnt == 12){
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
						}
					}
				}*/
				
				queCnt++;
			}
			
			index++;
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			row.setHeight((short) 600);
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
			// 대항목 별 이미지파일 호출 
			for(Maintenance vo : fileList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
				row.setHeight((short) 600);
				//String[] arry = vo.getFilePath().split("/");
				//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
				String filePath = vo.getFilePath() + vo.getFileName();
				int height = getImageFile(workbook, curSheet, curRow, filePath);
				int rowCnt = height / 40;
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for(int i=0; i<rowCnt; i++) {
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
				}
				if(rowCnt == 12){
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
			}
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
		}
		
		return workbook;
	}

	/**
	 * 자동제어 시트생성
	 * @param dataMap
	 * @param workbook
	 * @param autoctrlList
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private XSSFWorkbook createAutoctrlSheet(Map<String, Object> dataMap, XSSFWorkbook workbook, List<Map<String, Object>> autoctrlList) throws Exception {
		int index = 0;
		for(Map<String, Object> facilityMap : autoctrlList) {
			XSSFSheet curSheet;
			XSSFRow row;
			XSSFCell cell;
			
			String facilityName = (String) facilityMap.get("facilityName");
			FlkMap facilityInfo = (FlkMap) facilityMap.get("facilityInfo");
			
			String saveDate = (String) facilityMap.get("regDate");
			facilityInfo.put("writeYYYY", saveDate.substring(0, 4));
			facilityInfo.put("writeMM", saveDate.substring(4, 6));
			facilityInfo.put("writeDD", saveDate.substring(6, 8));
			
			curSheet = workbook.cloneSheet(workbook.getSheetIndex("#"+facilityName), (String) facilityInfo.get("autoctrlName"));
			PrintSetup printSetup = curSheet.getPrintSetup();
			printSetup.setScale((short) 50);
			
			// 추가시트 생성 시에만 replaceAll 적용
			if(index > 0) {	
				// Row 18까지만 Excel read (자동제어 정보까지만)
				for(int r = 0; r < 18; r++) {
					row = curSheet.getRow(r);
					int cells = row.getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell == null) {
							continue;
						}
						if(cell.getStringCellValue().contains("autoctrlList[0]")) {
							cell.setCellValue(cell.getStringCellValue().replaceAll("autoctrlList\\[0\\]", "autoctrlList["+index+"]"));
						}
					}
				}
			}
			
			// 하위 ROW 삭제
			int curRow = 18;
			int baseRow = 18;
			
			for(int i =0; i<curSheet.getLastRowNum(); i++) {
				removeRow(curSheet, curRow);
			}
			
			List<Maintenance> fileList = (List<Maintenance>) facilityMap.get("fileList");
			List<Maintenance> finishList = (List<Maintenance>) facilityMap.get("finishList");
			List<Maintenance> queList = (List<Maintenance>) facilityMap.get("queList");
			List<Maintenance> answerList = (List<Maintenance>) facilityMap.get("answerList");
			
			int cells = 0;
			// 템플릿 시트 가져오기
			XSSFSheet baseSheet = workbook.getSheet("#"+facilityName);
			curSheet.createRow(curRow);		
			// 대항목
			int queCnt = 1;
			for(Maintenance que : queList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+1).getRowStyle());
				row.setHeight((short) 600);
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for (int c = 0; c < cells; c++) {
					cell = row.createCell(c);
					if(c == 0) {
						cell.setCellValue(queCnt + ". " + (String) que.getQuestion());
					}
					cell.setCellStyle(baseSheet.getRow(baseRow+1).getCell(c).getCellStyle());
				}
				
				// 소항목
				int ansCnt = 1;
				for(Maintenance ans : answerList) {
					if(!StringUtils.equals(ans.getCheckTypeFlag(), Constants.NO) && StringUtils.equals(que.getMsqId(), ans.getMsqId())) {
						curRow = curRow+1;	
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						cells = baseSheet.getRow(baseRow+2).getPhysicalNumberOfCells();
						for (int c = 0; c < cells; c++) {
							cell = row.createCell(c);
							if(c == 1) {
								cell.setCellValue(ansCnt + ") ");
							} else if(c == 2) {
								cell.setCellValue((String) ans.getAnswer());
							} 
							
							if(StringUtils.equals(ans.getCheckTypeFlag(), Constants.YES)) {
								if(c == 10) {
									cell.setCellValue("확인여부");
								} else if(c == 12) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											if(StringUtils.equals(vo.getResult(), Constants.YES)) {
												cell.setCellValue("■");
											} else {
												cell.setCellValue("□");
											}
											break;
										}
									}
								}
							} else {
								 if(c == 3) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(vo.getCheckTypeFlag(), "E") && StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											cell.setCellValue(" :   "+vo.getResult());
											break;
										}
									}
								 }
							}
							cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
						}
						ansCnt++;
					}
				}
				
				// 99 기타의견 및 특이사항
				if(StringUtils.equals(que.getDesignedCode(), "99")) {
					int etcCnt = 1;
					for(Maintenance vo : finishList) {
						if(StringUtils.equals(vo.getDesignedCode(), "99")) {
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.createCell(c);
								if(c == 1) {
									cell.setCellValue(etcCnt+") ");
								} else if(c == 2) {
									cell.setCellValue(vo.getResult());
								}
								cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
							}
							etcCnt++;
						}
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
				
				/*// 대항목 별 이미지파일 호출 
				for(Maintenance vo : fileList) {
					if(StringUtils.equals(que.getMsqId(), vo.getMsqId())) {
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						//String[] arry = vo.getFilePath().split("/");
						//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
						String filePath = vo.getFilePath() + vo.getFileName();
						int height = getImageFile(workbook, curSheet, curRow, filePath);
						int rowCnt = height / 40;
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int i=0; i<rowCnt; i++) {
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
						}
						if(rowCnt == 12){
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
						}
					}
				}*/
				
				queCnt++;
			}
			index++;
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			row.setHeight((short) 600);
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
			// 대항목 별 이미지파일 호출 
			for(Maintenance vo : fileList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
				row.setHeight((short) 600);
				//String[] arry = vo.getFilePath().split("/");
				//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
				String filePath = vo.getFilePath() + vo.getFileName();
				int height = getImageFile(workbook, curSheet, curRow, filePath);
				int rowCnt = height / 40;
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for(int i=0; i<rowCnt; i++) {
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
				}
				if(rowCnt == 12){
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
			}
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
		}
		
		return workbook;
	}

	/**
	 * 냉각탑 시트 생성
	 * @param dataMap
	 * @param workbook
	 * @param ctowerList
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private XSSFWorkbook createCtowerSheet(Map<String, Object> dataMap, XSSFWorkbook workbook, List<Map<String, Object>> ctowerList) throws Exception {
		int index = 0;
		for(Map<String, Object> facilityMap : ctowerList) {
			XSSFSheet curSheet;
			XSSFRow row;
			XSSFCell cell;
			
			String facilityName = (String) facilityMap.get("facilityName");
			FlkMap facilityInfo = (FlkMap) facilityMap.get("facilityInfo");
			
			String saveDate = (String) facilityMap.get("regDate");
			facilityInfo.put("writeYYYY", saveDate.substring(0, 4));
			facilityInfo.put("writeMM", saveDate.substring(4, 6));
			facilityInfo.put("writeDD", saveDate.substring(6, 8));
			
			curSheet = workbook.cloneSheet(workbook.getSheetIndex("#"+facilityName), (String) facilityInfo.get("ctowerName"));
			PrintSetup printSetup = curSheet.getPrintSetup();
			printSetup.setScale((short) 50);
			
			// 추가시트 생성 시에만 replaceAll 적용
			if(index > 0) {	
				// Row 21까지만 Excel read (냉각탑정보까지만)
				for(int r = 0; r < 21; r++) {
					row = curSheet.getRow(r);
					int cells = row.getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell == null) {
							continue;
						}
						if(cell.getStringCellValue().contains("ctowerList[0]")) {
							cell.setCellValue(cell.getStringCellValue().replaceAll("ctowerList\\[0\\]", "ctowerList["+index+"]"));
						}
					}
				}
			}
			
			// 하위 ROW 삭제
			int curRow = 21;
			for(int i =0; i<curSheet.getLastRowNum(); i++) {
				removeRow(curSheet, curRow);
			}
			
			List<Maintenance> fileList = (List<Maintenance>) facilityMap.get("fileList");
			List<Maintenance> finishList = (List<Maintenance>) facilityMap.get("finishList");
			List<Maintenance> queList = (List<Maintenance>) facilityMap.get("queList");
			List<Maintenance> answerList = (List<Maintenance>) facilityMap.get("answerList");
			List<FlkMap> subPumpList = (List<FlkMap>) facilityMap.get("subList");
			
			int baseRow = 22;
			int cells = 0;
			// 템플릿 시트 가져오기
			XSSFSheet baseSheet = workbook.getSheet("#"+facilityName);
			curSheet.createRow(curRow);
			for(FlkMap map : subPumpList) {
				// 하위 냉각탑
				String fcId = String.valueOf((Integer) map.get("fcId"));
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow).getRowStyle());
				row.setHeight((short) 800);
				cells = baseSheet.getRow(baseRow).getPhysicalNumberOfCells();
				for (int c = 0; c < cells; c++) {
					cell = row.createCell(c);
					if(c == 0) {
						cell.setCellValue("▣  "+(String) map.get("ctowerSubName"));
					}
					cell.setCellStyle(baseSheet.getRow(baseRow).getCell(c).getCellStyle());
				}
				
				// 대항목
				int queCnt = 1;
				for(Maintenance que : queList) {
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+1).getRowStyle());
					row.setHeight((short) 600);
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.createCell(c);
						if(c == 0) {
							cell.setCellValue(queCnt + ". " + (String) que.getQuestion());
						}
						cell.setCellStyle(baseSheet.getRow(baseRow+1).getCell(c).getCellStyle());
					}
					
					// 소항목
					int ansCnt = 1;
					for(Maintenance ans : answerList) {
						if(!StringUtils.equals(ans.getCheckTypeFlag(), Constants.NO) && StringUtils.equals(que.getMsqId(), ans.getMsqId())) {
							curRow = curRow+1;	
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							cells = baseSheet.getRow(baseRow+2).getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.createCell(c);
								if(c == 1) {
									cell.setCellValue(ansCnt + ") ");
								} else if(c == 2) {
									cell.setCellValue((String) ans.getAnswer());
								} 
								
								if(StringUtils.equals(ans.getCheckTypeFlag(), Constants.YES)) {
									if(c == 10) {
										cell.setCellValue("확인여부");
									} else if(c == 12) {
										for(Maintenance vo : finishList) {
											if(StringUtils.equals(ans.getMsaId(), vo.getMsaId()) && StringUtils.equals(fcId, vo.getSubFacilityId())) {
												if(StringUtils.equals(vo.getResult(), Constants.YES)) {
													cell.setCellValue("■");
												} else {
													cell.setCellValue("□");
												}
												break;
											}
										}
									}
								} else {
									 if(c == 3) {
										for(Maintenance vo : finishList) {
											if(StringUtils.equals(vo.getCheckTypeFlag(), "E") && StringUtils.equals(ans.getMsaId(), vo.getMsaId()) 
													&& StringUtils.equals(fcId, vo.getSubFacilityId())) {
												cell.setCellValue(" :   "+vo.getResult());
												break;
											}
										}
									 }
								}
								cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
							}
							ansCnt++;
						}
					}
					
					// 99 기타의견 및 특이사항
					if(StringUtils.equals(que.getDesignedCode(), "99")) {
						int etcCnt = 1;
						for(Maintenance vo : finishList) {
							if(StringUtils.equals(vo.getDesignedCode(), "99") && StringUtils.equals(fcId, vo.getSubFacilityId())) {
								curRow = curRow+1;
								row = curSheet.createRow(curRow);
								row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
								row.setHeight((short) 600);
								cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
								for (int c = 0; c < cells; c++) {
									cell = row.createCell(c);
									if(c == 1) {
										cell.setCellValue(etcCnt+") ");
									} else if(c == 2) {
										cell.setCellValue(vo.getResult());
									}
									cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
								}
								etcCnt++;
							}
						}
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int c = 0; c < cells; c++){
							cell = row.createCell(c);
							cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
						}
					}
					
					/*// 대항목 별 이미지파일 호출 
					for(Maintenance vo : fileList) {
						if(StringUtils.equals(fcId, vo.getSubFacilityId()) && StringUtils.equals(que.getMsqId(), vo.getMsqId())) {
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							//String[] arry = vo.getFilePath().split("/");
							//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
							String filePath = vo.getFilePath() + vo.getFileName();
							int height = getImageFile(workbook, curSheet, curRow, filePath);
							int rowCnt = height / 40;
							cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
							for(int i=0; i<rowCnt; i++) {
								for(int c = 0; c < cells; c++){
									cell = row.createCell(c);
									cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
								}
								curRow = curRow+1;
								row = curSheet.createRow(curRow);
								row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
								row.setHeight((short) 600);
							}
							if(rowCnt == 12){
								for(int c = 0; c < cells; c++){
									cell = row.createCell(c);
									cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
								}
							}
						}
					}*/
					
					queCnt++;
				}
			}
			index++;
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			row.setHeight((short) 600);
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
			
			// 대항목 별 이미지파일 호출 
			for(Maintenance vo : fileList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
				row.setHeight((short) 600);
				//String[] arry = vo.getFilePath().split("/");
				//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
				String filePath = vo.getFilePath() + vo.getFileName();
				int height = getImageFile(workbook, curSheet, curRow, filePath);
				int rowCnt = height / 40;
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for(int i=0; i<rowCnt; i++) {
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
				}
				if(rowCnt == 12){
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
			}
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
		}
		
		return workbook;
	}

	/**
	 * 축열조 및 배관 시트 생성
	 * @param dataMap
	 * @param workbook
	 * @param heatstgList
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private XSSFWorkbook createHeatstgSheet(HttpServletRequest request, Map<String, Object> dataMap, XSSFWorkbook workbook, List<Map<String, Object>> heatstgList) throws Exception {
		int index = 0;
		for(Map<String, Object> facilityMap : heatstgList) {
			XSSFSheet curSheet;
			XSSFRow row;
			XSSFCell cell;
			
			String facilityName = (String) facilityMap.get("facilityName");
			FlkMap facilityInfo = (FlkMap) facilityMap.get("facilityInfo");
			
			String saveDate = (String) facilityMap.get("regDate");
			facilityInfo.put("writeYYYY", saveDate.substring(0, 4));
			facilityInfo.put("writeMM", saveDate.substring(4, 6));
			facilityInfo.put("writeDD", saveDate.substring(6, 8));
			
			curSheet = workbook.cloneSheet(workbook.getSheetIndex("#"+facilityName), (String) facilityInfo.get("heatstgName"));
			PrintSetup printSetup = curSheet.getPrintSetup();
			printSetup.setScale((short) 50);
			
			// 추가시트 생성 시에만 replaceAll 적용
			if(index > 0) {	
				// Row 19까지만 Excel read (축열조 및 배관 정보까지만)
				for(int r = 0; r < 19; r++) {
					row = curSheet.getRow(r);
					int cells = row.getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell == null) {
							continue;
						}
						if(cell.getStringCellValue().contains("heatstgList[0]")) {
							cell.setCellValue(cell.getStringCellValue().replaceAll("heatstgList\\[0\\]", "heatstgList["+index+"]"));
						}
					}
				}
			}
			
			// 하위 ROW 삭제
			int curRow = 19;
			for(int i =0; i<curSheet.getLastRowNum(); i++) {
				removeRow(curSheet, curRow);
			}
			
			List<Maintenance> fileList = (List<Maintenance>) facilityMap.get("fileList");
			List<Maintenance> finishList = (List<Maintenance>) facilityMap.get("finishList");
			List<Maintenance> queList = (List<Maintenance>) facilityMap.get("queList");
			List<Maintenance> answerList = (List<Maintenance>) facilityMap.get("answerList");
			
			int baseRow = 19;
			int cells = 0;
			// 템플릿 시트 가져오기
			XSSFSheet baseSheet = workbook.getSheet("#"+facilityName);
			curSheet.createRow(curRow);		
			// 대항목
			int queCnt = 1;
			for(Maintenance que : queList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+1).getRowStyle());
				row.setHeight((short) 600);
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for (int c = 0; c < cells; c++) {
					cell = row.createCell(c);
					if(c == 0) {
						cell.setCellValue(queCnt + ". " + (String) que.getQuestion());
					}
					cell.setCellStyle(baseSheet.getRow(baseRow+1).getCell(c).getCellStyle());
				}
				
				// 소항목
				int ansCnt = 1;
				for(Maintenance ans : answerList) {
					if(!StringUtils.equals(ans.getCheckTypeFlag(), Constants.NO) && StringUtils.equals(que.getMsqId(), ans.getMsqId())) {
						curRow = curRow+1;	
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						cells = baseSheet.getRow(baseRow+2).getPhysicalNumberOfCells();
						for (int c = 0; c < cells; c++) {
							cell = row.createCell(c);
							if(c == 1) {
								cell.setCellValue(ansCnt + ") ");
							} else if(c == 2) {
								cell.setCellValue((String) ans.getAnswer());
							} 
							
							if(StringUtils.equals(ans.getCheckTypeFlag(), Constants.YES)) {
								if(c == 10) {
									cell.setCellValue("확인여부");
								} else if(c == 12) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											if(StringUtils.equals(vo.getResult(), Constants.YES)) {
												cell.setCellValue("■");
											} else {
												cell.setCellValue("□");
											}
											break;
										}
									}
								}
							} else {
								 if(c == 3) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(vo.getCheckTypeFlag(), "E") && StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											cell.setCellValue(" :   "+vo.getResult());
											break;
										}
									}
								 }
							}
							cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
						}
						ansCnt++;
					}
				}
				
				// 01 표
				if(StringUtils.equals(que.getDesignedCode(), "01")) {
					// 축열조일 경우 기본 이미지 세팅 
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
					String filePath = "/resources/uems/images/heatstg_regularCheck.png"; 
					ServletContext context = request.getServletContext();
					int height = getImageFile(workbook, curSheet, curRow, context.getRealPath("/")+filePath);
					int rowCnt = height / 40;
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for(int i=0; i<rowCnt; i++) {
						for(int c = 0; c < cells; c++){
							cell = row.createCell(c);
							cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
						}
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
					}
					if(rowCnt == 11){
						for(int c = 0; c < cells; c++){
							cell = row.createCell(c);
							cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
						}
					}
				}
				
				// 99 기타의견 및 특이사항
				if(StringUtils.equals(que.getDesignedCode(), "99")) {
					int etcCnt = 1;
					for(Maintenance vo : finishList) {
						if(StringUtils.equals(vo.getDesignedCode(), "99")) {
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.createCell(c);
								if(c == 1) {
									cell.setCellValue(etcCnt+") ");
								} else if(c == 2) {
									cell.setCellValue(vo.getResult());
								}
								cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
							}
							etcCnt++;
						}
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
				
				/*// 대항목 별 이미지파일 호출 
				for(Maintenance vo : fileList) {
					if(StringUtils.equals(que.getMsqId(), vo.getMsqId())) {
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						//String[] arry = vo.getFilePath().split("/");
						//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
						String filePath = vo.getFilePath() + vo.getFileName();
						int height = getImageFile(workbook, curSheet, curRow, filePath);
						int rowCnt = height / 40;
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int i=0; i<rowCnt; i++) {
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
						}
						if(rowCnt == 12){
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
						}
					}
				}*/
				
				queCnt++;
			}
			index++;
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			row.setHeight((short) 600);
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
			// 대항목 별 이미지파일 호출 
			for(Maintenance vo : fileList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
				row.setHeight((short) 600);
				//String[] arry = vo.getFilePath().split("/");
				//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
				String filePath = vo.getFilePath() + vo.getFileName();
				int height = getImageFile(workbook, curSheet, curRow, filePath);
				int rowCnt = height / 40;
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for(int i=0; i<rowCnt; i++) {
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
				}
				if(rowCnt == 12){
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
			}
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
		}
		
		return workbook;
	}

	/**
	 * 냉동기 시트 생성
	 * @param dataMap
	 * @param workbook
	 * @param chillerList
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private XSSFWorkbook createChillerSheet(Map<String, Object> dataMap, XSSFWorkbook workbook, List<Map<String, Object>> chillerList) throws Exception {
		int index = 0;
		for(Map<String, Object> facilityMap : chillerList) {
			XSSFSheet curSheet;
			XSSFRow row;
			XSSFCell cell;
			
			String facilityName = (String) facilityMap.get("facilityName");
			FlkMap facilityInfo = (FlkMap) facilityMap.get("facilityInfo");
			
			String saveDate = (String) facilityMap.get("regDate");
			facilityInfo.put("writeYYYY", saveDate.substring(0, 4));
			facilityInfo.put("writeMM", saveDate.substring(4, 6));
			facilityInfo.put("writeDD", saveDate.substring(6, 8));
			
			curSheet = workbook.cloneSheet(workbook.getSheetIndex("#"+facilityName), (String) facilityInfo.get("chillerName"));
			PrintSetup printSetup = curSheet.getPrintSetup();
			printSetup.setScale((short) 50);
			
			// 추가시트 생성 시에만 replaceAll 적용
			if(index > 0) {	
				// Row 25까지만 Excel read (냉동기정보까지만)
				for(int r = 0; r < 25; r++) {
					row = curSheet.getRow(r);
					int cells = row.getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell == null) {
							continue;
						}
						if(cell.getStringCellValue().contains("chillerList[0]")) {
							cell.setCellValue(cell.getStringCellValue().replaceAll("chillerList\\[0\\]", "chillerList["+index+"]"));
						}
					}
				}
			}
			
			// 하위 ROW 삭제
			int curRow = 25;
			for(int i =0; i<curSheet.getLastRowNum(); i++) {
				removeRow(curSheet, curRow);
			}
			
			List<Maintenance> fileList = (List<Maintenance>) facilityMap.get("fileList");
			List<Maintenance> finishList = (List<Maintenance>) facilityMap.get("finishList");
			List<Maintenance> queList = (List<Maintenance>) facilityMap.get("queList");
			List<Maintenance> answerList = (List<Maintenance>) facilityMap.get("answerList");
			
			int baseRow = 25;
			int cells = 0;
			// 템플릿 시트 가져오기
			XSSFSheet baseSheet = workbook.getSheet("#"+facilityName);
			curSheet.createRow(curRow);	
			// 대항목
			int queCnt = 1;
			for(Maintenance que : queList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+1).getRowStyle());
				row.setHeight((short) 600);
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for (int c = 0; c < cells; c++) {
					cell = row.createCell(c);
					if(c == 0) {
						cell.setCellValue(queCnt + ". " + (String) que.getQuestion());
					}
					cell.setCellStyle(baseSheet.getRow(baseRow+1).getCell(c).getCellStyle());
				}
				
				// 소항목
				int ansCnt = 1;
				for(Maintenance ans : answerList) {
					if(!StringUtils.equals(ans.getCheckTypeFlag(), Constants.NO) && StringUtils.equals(que.getMsqId(), ans.getMsqId())) {
						curRow = curRow+1;	
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						cells = baseSheet.getRow(baseRow+2).getPhysicalNumberOfCells();
						for (int c = 0; c < cells; c++) {
							cell = row.createCell(c);
							if(c == 1) {
								cell.setCellValue(ansCnt + ") ");
							} else if(c == 2) {
								cell.setCellValue((String) ans.getAnswer());
							} 
							
							if(StringUtils.equals(ans.getCheckTypeFlag(), Constants.YES)) {
								if(c == 10) {
									cell.setCellValue("확인여부");
								} else if(c == 12) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											if(StringUtils.equals(vo.getResult(), Constants.YES)) {
												cell.setCellValue("■");
											} else {
												cell.setCellValue("□");
											}
											break;
										}
									}
								}
							} else {
								 if(c == 3) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(vo.getCheckTypeFlag(), "E") && StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											cell.setCellValue(" :   "+vo.getResult());
											break;
										}
									}
								 }
							}
							cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
						}
						ansCnt++;
					}
				}
				
				// 01 표
				if(StringUtils.equals(que.getDesignedCode(), "01")) {
					int gridRow = curRow+3;
					for(int i=0; i<14; i++) {
						curRow = curRow+1;
						row = copyRow(workbook, baseSheet, curSheet, (baseRow+7)+i, curRow, 0, null);
						row.setHeight((short) 700);
						for(Maintenance vo : finishList) {
							cells = row.getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.getCell(c);
								if(StringUtils.equals(vo.getAnswer(), cell.getStringCellValue())) {
									cell.setCellValue(vo.getResult());
									break;
								} 
							}
						}
					}
					curRow = curRow+1;
					curSheet.createRow(curRow);
					
					curSheet.addMergedRegion(new CellRangeAddress(gridRow, gridRow+1, 0, 3));
					curSheet.addMergedRegion(new CellRangeAddress(gridRow, gridRow, 4, 5));
					curSheet.addMergedRegion(new CellRangeAddress(gridRow+1, gridRow+1, 4, 5));
					curSheet.addMergedRegion(new CellRangeAddress(gridRow, gridRow, 6, 8));
					curSheet.addMergedRegion(new CellRangeAddress(gridRow, gridRow, 9, 11));
					curSheet.addMergedRegion(new CellRangeAddress(gridRow, gridRow, 12, 14));
					curSheet.addMergedRegion(new CellRangeAddress(gridRow, gridRow, 15, 17));
					curSheet.addMergedRegion(new CellRangeAddress(gridRow, gridRow+1, 18, 19));
					
					for(int i=gridRow+2; i<=gridRow+10; i+=2) {
						curSheet.addMergedRegion(new CellRangeAddress(i, i+1, 0, 1));
						curSheet.addMergedRegion(new CellRangeAddress(i, i, 2, 3));
						curSheet.addMergedRegion(new CellRangeAddress(i+1, i+1, 2, 3));
						curSheet.addMergedRegion(new CellRangeAddress(i, i+1, 4, 5));
						curSheet.addMergedRegion(new CellRangeAddress(i, i, 6, 8));
						curSheet.addMergedRegion(new CellRangeAddress(i+1, i+1, 6, 8));
						curSheet.addMergedRegion(new CellRangeAddress(i, i, 9, 11));
						curSheet.addMergedRegion(new CellRangeAddress(i+1, i+1, 9, 11));
						curSheet.addMergedRegion(new CellRangeAddress(i, i, 12, 14));
						curSheet.addMergedRegion(new CellRangeAddress(i+1, i+1, 12, 14));
						curSheet.addMergedRegion(new CellRangeAddress(i, i, 15, 17));
						curSheet.addMergedRegion(new CellRangeAddress(i+1, i+1, 15, 17));
						curSheet.addMergedRegion(new CellRangeAddress(i, i, 18, 19));
						curSheet.addMergedRegion(new CellRangeAddress(i+1, i+1, 18, 19));
					}
				}
				
				// 99 기타의견 및 특이사항
				if(StringUtils.equals(que.getDesignedCode(), "99")) {
					int etcCnt = 1;
					for(Maintenance vo : finishList) {
						if(StringUtils.equals(vo.getDesignedCode(), "99")) {
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.createCell(c);
								if(c == 1) {
									cell.setCellValue(etcCnt+") ");
								} else if(c == 2) {
									cell.setCellValue(vo.getResult());
								}
								cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
							}
							etcCnt++;
						}
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
				
				/*// 대항목 별 이미지파일 호출 
				for(Maintenance vo : fileList) {
					if(StringUtils.equals(que.getMsqId(), vo.getMsqId())) {
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						//String[] arry = vo.getFilePath().split("/");
						//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
						String filePath = vo.getFilePath() + vo.getFileName();
						int height = getImageFile(workbook, curSheet, curRow, filePath);
						int rowCnt = height / 40;
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int i=0; i<rowCnt; i++) {
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
						}
						if(rowCnt == 12){
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
						}
					}
				}*/
				
				queCnt++;
			}
			index++;
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			row.setHeight((short) 600);
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
			// 대항목 별 이미지파일 호출 
			for(Maintenance vo : fileList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
				row.setHeight((short) 600);
				//String[] arry = vo.getFilePath().split("/");
				//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
				String filePath = vo.getFilePath() + vo.getFileName();
				int height = getImageFile(workbook, curSheet, curRow, filePath);
				int rowCnt = height / 40;
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for(int i=0; i<rowCnt; i++) {
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
				}
				if(rowCnt == 12){
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
			}
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
		}
		
		return workbook;
	}

	/**
	 * 열교환기 시트 생성
	 * @param dataMap
	 * @param workbook
	 * @param heatExcList
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private XSSFWorkbook createHeatexcSheet(Map<String, Object> dataMap, XSSFWorkbook workbook, List<Map<String, Object>> heatexcList) throws Exception {
		int index = 0;
		for(Map<String, Object> facilityMap : heatexcList) {
			XSSFSheet curSheet;
			XSSFRow row;
			XSSFCell cell;
			
			String facilityName = (String) facilityMap.get("facilityName");
			FlkMap facilityInfo = (FlkMap) facilityMap.get("facilityInfo");
			
			String saveDate = (String) facilityMap.get("regDate");
			facilityInfo.put("writeYYYY", saveDate.substring(0, 4));
			facilityInfo.put("writeMM", saveDate.substring(4, 6));
			facilityInfo.put("writeDD", saveDate.substring(6, 8));
			
			curSheet = workbook.cloneSheet(workbook.getSheetIndex("#"+facilityName), (String) facilityInfo.get("heatexcName"));
			PrintSetup printSetup = curSheet.getPrintSetup();
			printSetup.setScale((short) 50);
			
			// 추가시트 생성 시에만 replaceAll 적용
			if(index > 0) {	
				// Row 21까지만 Excel read (열교환기정보까지만)
				for(int r = 0; r < 21; r++) {
					row = curSheet.getRow(r);
					int cells = row.getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell == null) {
							continue;
						}
						if(cell.getStringCellValue().contains("heatexcList[0]")) {
							cell.setCellValue(cell.getStringCellValue().replaceAll("heatexcList\\[0\\]", "heatexcList["+index+"]"));
						}
					}
				}
			}
			
			// 하위 ROW 삭제
			int curRow = 21;
			int baseRow = 21;
			
			for(int i =0; i<curSheet.getLastRowNum(); i++) {
				removeRow(curSheet, curRow);
			}
			
			List<Maintenance> fileList = (List<Maintenance>) facilityMap.get("fileList");
			List<Maintenance> finishList = (List<Maintenance>) facilityMap.get("finishList");
			List<Maintenance> queList = (List<Maintenance>) facilityMap.get("queList");
			List<Maintenance> answerList = (List<Maintenance>) facilityMap.get("answerList");
			
			int cells = 0;
			// 템플릿 시트 가져오기
			XSSFSheet baseSheet = workbook.getSheet("#"+facilityName);
			curSheet.createRow(curRow);		
			// 대항목
			int queCnt = 1;
			for(Maintenance que : queList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+1).getRowStyle());
				row.setHeight((short) 600);
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for (int c = 0; c < cells; c++) {
					cell = row.createCell(c);
					if(c == 0) {
						cell.setCellValue(queCnt + ". " + (String) que.getQuestion());
					}
					cell.setCellStyle(baseSheet.getRow(baseRow+1).getCell(c).getCellStyle());
				}
				
				// 소항목
				int ansCnt = 1;
				for(Maintenance ans : answerList) {
					if(!StringUtils.equals(ans.getCheckTypeFlag(), Constants.NO) && StringUtils.equals(que.getMsqId(), ans.getMsqId())) {
						curRow = curRow+1;	
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						cells = baseSheet.getRow(baseRow+2).getPhysicalNumberOfCells();
						for (int c = 0; c < cells; c++) {
							cell = row.createCell(c);
							if(c == 1) {
								cell.setCellValue(ansCnt + ") ");
							} else if(c == 2) {
								cell.setCellValue((String) ans.getAnswer());
							} 
							
							if(StringUtils.equals(ans.getCheckTypeFlag(), Constants.YES)) {
								if(c == 10) {
									cell.setCellValue("확인여부");
								} else if(c == 12) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											if(StringUtils.equals(vo.getResult(), Constants.YES)) {
												cell.setCellValue("■");
											} else {
												cell.setCellValue("□");
											}
											break;
										}
									}
								}
							} else {
								 if(c == 3) {
									for(Maintenance vo : finishList) {
										if(StringUtils.equals(vo.getCheckTypeFlag(), "E") && StringUtils.equals(ans.getMsaId(), vo.getMsaId())) {
											cell.setCellValue(" :   "+vo.getResult());
											break;
										}
									}
								 }
							}
							cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
						}
						ansCnt++;
					}
				}
				
				// 99 기타의견 및 특이사항
				if(StringUtils.equals(que.getDesignedCode(), "99")) {
					int etcCnt = 1;
					for(Maintenance vo : finishList) {
						if(StringUtils.equals(vo.getDesignedCode(), "99")) {
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.createCell(c);
								if(c == 1) {
									cell.setCellValue(etcCnt+") ");
								} else if(c == 2) {
									cell.setCellValue(vo.getResult());
								}
								cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
							}
							etcCnt++;
						}
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
				
				/*// 대항목 별 이미지파일 호출 
				for(Maintenance vo : fileList) {
					if(StringUtils.equals(que.getMsqId(), vo.getMsqId())) {
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						row.setHeight((short) 600);
						//String[] arry = vo.getFilePath().split("/");
						//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
						String filePath = vo.getFilePath() + vo.getFileName();
						int height = getImageFile(workbook, curSheet, curRow, filePath);
						int rowCnt = height / 40;
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int i=0; i<rowCnt; i++) {
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
						}
						if(rowCnt == 12){
							for(int c = 0; c < cells; c++){
								cell = row.createCell(c);
								cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
							}
						}
					}
				}*/
				
				queCnt++;
			}
			index++;
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			row.setHeight((short) 600);
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
			// 대항목 별 이미지파일 호출 
			for(Maintenance vo : fileList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
				row.setHeight((short) 600);
				//String[] arry = vo.getFilePath().split("/");
				//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
				String filePath = vo.getFilePath() + vo.getFileName();
				int height = getImageFile(workbook, curSheet, curRow, filePath);
				int rowCnt = height / 40;
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for(int i=0; i<rowCnt; i++) {
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
				}
				if(rowCnt == 12){
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
			}
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
		}
		
		return workbook;
	}

	/**
	 * 펌프 시트 생성
	 * @param dataMap
	 * @param workbook
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	private XSSFWorkbook createPumpSheet(Map<String, Object> dataMap, XSSFWorkbook workbook, List<Map<String, Object>> pumpList) throws Exception {
		int index = 0;
		for(Map<String, Object> facilityMap : pumpList) {
			XSSFSheet curSheet;
			XSSFRow row;
			XSSFCell cell;
			
			String facilityName = (String) facilityMap.get("facilityName");
			FlkMap facilityInfo = (FlkMap) facilityMap.get("facilityInfo");
			
			String saveDate = (String) facilityMap.get("regDate");
			facilityInfo.put("writeYYYY", saveDate.substring(0, 4));
			facilityInfo.put("writeMM", saveDate.substring(4, 6));
			facilityInfo.put("writeDD", saveDate.substring(6, 8));
			
			curSheet = workbook.cloneSheet(workbook.getSheetIndex("#"+facilityName), (String) facilityInfo.get("pumpName"));
			PrintSetup printSetup = curSheet.getPrintSetup();
			printSetup.setScale((short) 50);
			
			// 추가시트 생성 시에만 replaceAll 적용
			if(index > 0) {	
				// Row 25까지만 Excel read (펌프정보까지만)
				for(int r = 0; r < 25; r++) {
					row = curSheet.getRow(r);
					int cells = row.getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.getCell(c);
						if (cell == null) {
							continue;
						}
						if(cell.getStringCellValue().contains("pumpList[0]")) {
							cell.setCellValue(cell.getStringCellValue().replaceAll("pumpList\\[0\\]", "pumpList["+index+"]"));
						}
					}
				}
			}
			
			// 하위 ROW 삭제
			int curRow = 25;
			for(int i =0; i<curSheet.getLastRowNum(); i++) {
				removeRow(curSheet, curRow);
			}
			
			List<Maintenance> fileList = (List<Maintenance>) facilityMap.get("fileList");
			List<Maintenance> finishList = (List<Maintenance>) facilityMap.get("finishList");
			List<Maintenance> queList = (List<Maintenance>) facilityMap.get("queList");
			List<Maintenance> answerList = (List<Maintenance>) facilityMap.get("answerList");
			List<FlkMap> subPumpList = (List<FlkMap>) facilityMap.get("subList");
			
			int baseRow = 26;
			int cells = 0;
			// 템플릿 시트 가져오기
			XSSFSheet baseSheet = workbook.getSheet("#"+facilityName);
			
			for(FlkMap map : subPumpList) {
				// 하위펌프
				String fpId = String.valueOf((Integer) map.get("fpId"));
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow).getRowStyle());
				row.setHeight((short) 800);
				cells = baseSheet.getRow(baseRow).getPhysicalNumberOfCells();
				for (int c = 0; c < cells; c++) {
					cell = row.createCell(c);
					if(c == 0) {
						cell.setCellValue("▣  "+(String) map.get("pumpSubname"));
					}
					cell.setCellStyle(baseSheet.getRow(baseRow).getCell(c).getCellStyle());
				}
				
				// 대항목
				int queCnt = 1;
				for(Maintenance que : queList) {
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+1).getRowStyle());
					row.setHeight((short) 600);
					cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
					for (int c = 0; c < cells; c++) {
						cell = row.createCell(c);
						if(c == 0) {
							cell.setCellValue(queCnt + ". " + (String) que.getQuestion());
						}
						cell.setCellStyle(baseSheet.getRow(baseRow+1).getCell(c).getCellStyle());
					}
					
					// 소항목
					int ansCnt = 1;
					for(Maintenance ans : answerList) {
						if(!StringUtils.equals(ans.getCheckTypeFlag(), Constants.NO) && StringUtils.equals(que.getMsqId(), ans.getMsqId())) {
							curRow = curRow+1;	
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							cells = baseSheet.getRow(baseRow+2).getPhysicalNumberOfCells();
							for (int c = 0; c < cells; c++) {
								cell = row.createCell(c);
								if(c == 1) {
									cell.setCellValue(ansCnt + ") ");
								} else if(c == 2) {
									cell.setCellValue((String) ans.getAnswer());
								} 
								
								if(StringUtils.equals(ans.getCheckTypeFlag(), Constants.YES)) {
									if(c == 10) {
										cell.setCellValue("확인여부");
									} else if(c == 12) {
										for(Maintenance vo : finishList) {
											if(StringUtils.equals(ans.getMsaId(), vo.getMsaId()) && StringUtils.equals(fpId, vo.getSubFacilityId())) {
												if(StringUtils.equals(vo.getResult(), Constants.YES)) {
													cell.setCellValue("■");
												} else {
													cell.setCellValue("□");
												}
												break;
											}
										}
									}
								} else {
									 if(c == 3) {
										for(Maintenance vo : finishList) {
											if(StringUtils.equals(vo.getCheckTypeFlag(), "E") && StringUtils.equals(ans.getMsaId(), vo.getMsaId()) 
													&& StringUtils.equals(fpId, vo.getSubFacilityId())) {
												cell.setCellValue(" :   "+vo.getResult());
												break;
											}
										}
									 }
								}
								cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
							}
							ansCnt++;
						}
					}
					
					// 01 표
					if(StringUtils.equals(que.getDesignedCode(), "01")) {
						String value = "";
						String spendPowerKw = (String) map.get("spendPowerKw") + " Kw";
						String elecCurrent = (String) map.get("elecCurrent") + " A";
						String flowRate1 = (String) map.get("flowRate1") + " ㎥/h";
						for(int i=0; i<4; i++) {
							curRow = curRow+1;
							if(i == 1) {
								value = spendPowerKw;
							} else if(i == 2) {
								value = elecCurrent;
							} else if(i == 3) {
								value = flowRate1;
							}
							row = copyRow(workbook, baseSheet, curSheet, (baseRow+9)+i, curRow, 6, value);
							row.setHeight((short) 600);
							for(Maintenance vo : finishList) {
								if(StringUtils.equals(fpId, vo.getSubFacilityId())) {
									cells = row.getPhysicalNumberOfCells();
									for (int c = 0; c < cells; c++) {
										cell = row.getCell(c);
										if(StringUtils.equals(vo.getAnswer(), cell.getStringCellValue())) {
											cell.setCellValue(vo.getResult());
											break;
										} 
									}
								}
							}
						}
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int c = 0; c < cells; c++){
							cell = row.createCell(c);
							cell.setCellStyle(baseSheet.getRow(baseRow+13).getCell(c).getCellStyle());
						}
					}
					
					// 99 기타의견 및 특이사항
					if(StringUtils.equals(que.getDesignedCode(), "99")) {
						int etcCnt = 1;
						for(Maintenance vo : finishList) {
							if(StringUtils.equals(vo.getDesignedCode(), "99") && StringUtils.equals(fpId, vo.getSubFacilityId())) {
								curRow = curRow+1;
								row = curSheet.createRow(curRow);
								row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
								row.setHeight((short) 600);
								cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
								for (int c = 0; c < cells; c++) {
									cell = row.createCell(c);
									if(c == 1) {
										cell.setCellValue(etcCnt+") ");
									} else if(c == 2) {
										cell.setCellValue(vo.getResult());
									}
									cell.setCellStyle(baseSheet.getRow(baseRow+2).getCell(c).getCellStyle());
								}
								etcCnt++;
							}
						}
						curRow = curRow+1;
						row = curSheet.createRow(curRow);
						row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
						cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
						for(int c = 0; c < cells; c++){
							cell = row.createCell(c);
							cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
						}
					}
					
					/*// 대항목 별 이미지파일 호출 
					for(Maintenance vo : fileList) {
						if(StringUtils.equals(fpId, vo.getSubFacilityId()) && StringUtils.equals(que.getMsqId(), vo.getMsqId())) {
							curRow = curRow+1;
							row = curSheet.createRow(curRow);
							row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
							row.setHeight((short) 600);
							//String[] arry = vo.getFilePath().split("/");
							//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
							String filePath = vo.getFilePath() + vo.getFileName();
							int height = getImageFile(workbook, curSheet, curRow, filePath);
							int rowCnt = height / 40;
							cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
							for(int i=0; i<rowCnt; i++) {
								for(int c = 0; c < cells; c++){
									cell = row.createCell(c);
									cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
								}
								curRow = curRow+1;
								row = curSheet.createRow(curRow);
								row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
								row.setHeight((short) 600);
							}
							if(rowCnt == 12){
								for(int c = 0; c < cells; c++){
									cell = row.createCell(c);
									cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
								}
							}
						}
					}*/
					
					queCnt++;
				}
			
			}
			index++;
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			row.setHeight((short) 600);
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
			// 대항목 별 이미지파일 호출 
			for(Maintenance vo : fileList) {
				curRow = curRow+1;
				row = curSheet.createRow(curRow);
				row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
				row.setHeight((short) 600);
				//String[] arry = vo.getFilePath().split("/");
				//String filePath = "d:\\" +arry[3] + "/"+arry[4]+"/"  + vo.getFileName();
				String filePath = vo.getFilePath() + vo.getFileName();
				int height = getImageFile(workbook, curSheet, curRow, filePath);
				int rowCnt = height / 40;
				cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
				for(int i=0; i<rowCnt; i++) {
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
					curRow = curRow+1;
					row = curSheet.createRow(curRow);
					row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
					row.setHeight((short) 600);
				}
				if(rowCnt == 12){
					for(int c = 0; c < cells; c++){
						cell = row.createCell(c);
						cell.setCellStyle(baseSheet.getRow(baseRow+3).getCell(c).getCellStyle());
					}
				}
			}
			
			row = curSheet.createRow(curRow);
			row.setRowStyle(baseSheet.getRow(baseRow+2).getRowStyle());
			cells = baseSheet.getRow(baseRow+1).getPhysicalNumberOfCells();
			for(int c = 0; c < cells; c++){
				cell = row.createCell(c);
				cell.setCellStyle(baseSheet.getRow(baseRow+5).getCell(c).getCellStyle());
			}
		}
		
		return workbook;
	}

	/**
	 * 보고서 파일 생성 및 DB 이력 등록
	 * @param dataMap
	 * @param filePath
	 * @param tempFileName
	 * @param rtId
	 * @param workbook
	 * @throws Exception
	 */
	private void makeReportFile(Map<String, Object> dataMap, String filePath, String tempFileName, String rtId, XSSFWorkbook workbook) throws Exception {

     	// 전체시트 생성 후 템플릿 시트 삭제
     	workbook.removeSheetAt(workbook.getSheetIndex("#"+FacilityEnum.PUMP.getValue()));
     	workbook.removeSheetAt(workbook.getSheetIndex("#"+FacilityEnum.HEATEXC.getValue()));
     	workbook.removeSheetAt(workbook.getSheetIndex("#"+FacilityEnum.CHILLER.getValue()));
     	workbook.removeSheetAt(workbook.getSheetIndex("#"+FacilityEnum.HEATSTG.getValue()));
     	workbook.removeSheetAt(workbook.getSheetIndex("#"+FacilityEnum.CTOWER.getValue()));
     	workbook.removeSheetAt(workbook.getSheetIndex("#"+FacilityEnum.AUTOCTRL.getValue()));
     	workbook.removeSheetAt(workbook.getSheetIndex("#"+FacilityEnum.ELECMSS.getValue()));
		
		// 임시파일명
		String fileName = FileUtil.getFileName() + "." + FileUtil.getExtention(tempFileName);
		FileOutputStream outFile;
		try {
			outFile = new FileOutputStream(filePath + fileName);
			workbook.write(outFile);
			outFile.close();
			
			logger.debug("파일생성완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 기본 장비정보 세팅해여 엑셀파일 생성
		XLSTransformer transformer = new XLSTransformer();
		transformer.transformXLS(filePath + fileName, dataMap, filePath + fileName);
		
		File reportFile = new File(filePath + fileName);
		
		Map<String, Object> reportInsertMap = new HashMap<String, Object>();	//파일 생성 완료 후 DB에 정보 등록을 위한 맵
		reportInsertMap.put("reportStartDate", DateFormatUtils.getDateFormat("yyyyMMdd"));
		reportInsertMap.put("reportEndDate", DateFormatUtils.getDateFormat("yyyyMMdd"));
		reportInsertMap.put("rtId", rtId);
		
		FlkMap siteInfo = (FlkMap) dataMap.get("siteInfo");
		reportInsertMap.put("reportName", (String) siteInfo.get("siteDesc") + " 정기점검 (" + dataMap.get("chkYear") +"년 "+ dataMap.get("chkMonth") + "월)");
		reportInsertMap.put("reportFilePath", filePath + fileName);
		reportInsertMap.put("reportFileName", fileName);
		reportInsertMap.put("reportFileSize", reportFile.length());
		reportInsertMap.put("siteId", siteInfo.get("siteId"));
		
		batchTaskMapper.insertReport(reportInsertMap);
	}
	
	/**
	 * 이미지 가져오기
	 * @param workbook
	 * @param curSheet
	 * @param curRow
	 * @param filePath
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	private int getImageFile(XSSFWorkbook workbook, XSSFSheet curSheet, int curRow, String filePath) throws FileNotFoundException, IOException {
		
		InputStream inputStream = new FileInputStream(filePath);
		byte[] bytes = IOUtils.toByteArray(inputStream);
		int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
		inputStream.close();

		CreationHelper helper = workbook.getCreationHelper();
		Drawing drawing = curSheet.createDrawingPatriarch();
		ClientAnchor anchor = helper.createClientAnchor();
		anchor.setCol1(1);
		anchor.setRow1(curRow);

		Picture pict = drawing.createPicture(anchor, pictureIdx);
		pict.resize();
		Dimension dimension = pict.getImageDimension();
		Double height = dimension.getHeight();
		return height.intValue(); 
	}
	
	
	/**
	 * 엑셀 ROW 복사
	 * @param workbook
	 * @param worksheet
	 * @param resultSheet
	 * @param sourceRowNum
	 * @param destinationRowNum
	 * @return 
	 */
	private static XSSFRow copyRow(XSSFWorkbook workbook, XSSFSheet worksheet, XSSFSheet resultSheet, int sourceRowNum, int destinationRowNum, int cellIdx, String value) {
	    // Get the source / new row
	    XSSFRow newRow = resultSheet.getRow(destinationRowNum);
	    XSSFRow sourceRow = worksheet.getRow(sourceRowNum);
	    // If the row exist in destination, push down all rows by 1 else create a new row
	    newRow = resultSheet.createRow(destinationRowNum);
	    newRow.setRowStyle(sourceRow.getRowStyle());
	    // Loop through source columns to add to new row
	    for (int i = 0; i < sourceRow.getLastCellNum(); i++) {
	        // Grab a copy of the old/new cell
	        XSSFCell oldCell = sourceRow.getCell(i);
	        XSSFCell newCell = newRow.createCell(i);

	        // If the old cell is null jump to next cell
	        if (oldCell == null) {
	            newCell = null;
	            continue;
	        }

	        // Copy style from old cell and apply to new cell
	        newCell.setCellStyle(oldCell.getCellStyle());

	        // If there is a cell comment, copy
	        if (oldCell.getCellComment() != null) {
	            newCell.setCellComment(oldCell.getCellComment());
	        }

	        // If there is a cell hyperlink, copy
	        if (oldCell.getHyperlink() != null) {
	            newCell.setHyperlink(oldCell.getHyperlink());
	        }

	        // Set the cell data type
	        newCell.setCellType(oldCell.getCellType());

	        // Set the cell data value
	        switch (oldCell.getCellType()) {
	            case XSSFCell.CELL_TYPE_BLANK:
	                break;
	            case XSSFCell.CELL_TYPE_BOOLEAN:
	                newCell.setCellValue(oldCell.getBooleanCellValue());
	                break;
	            case XSSFCell.CELL_TYPE_ERROR:
	                newCell.setCellErrorValue(oldCell.getErrorCellValue());
	                break;
	            case XSSFCell.CELL_TYPE_FORMULA:
	                newCell.setCellFormula(oldCell.getCellFormula());
	                break;
	            case XSSFCell.CELL_TYPE_NUMERIC:
	                newCell.setCellValue(oldCell.getNumericCellValue());
	                break;
	            case XSSFCell.CELL_TYPE_STRING:
	                newCell.setCellValue(oldCell.getStringCellValue());
	                break;
	            default:
	            	newCell.setCellValue(oldCell.getStringCellValue());
	        }
	        
	        if(i == cellIdx) {
	        	if(StringUtils.isNotBlank(value)) {
	        		newCell.setCellValue(value);
	        	}
	        }
	    } 
	    return newRow;
	}
	
	/**
	 * 엑셀 ROW 삭제
	 * @param sheet
	 * @param rowIndex
	 */
	public static void removeRow(XSSFSheet sheet, int rowIndex) {
	    int lastRowNum = sheet.getLastRowNum();
	    if (rowIndex >= 0 && rowIndex < lastRowNum) {
	        sheet.shiftRows(rowIndex + 1, lastRowNum, -1);
	    }
	    if (rowIndex == lastRowNum) {
	    	XSSFRow removingRow = sheet.getRow(rowIndex);
	        if (removingRow != null) {
	            sheet.removeRow(removingRow);
	        }
	    }
	}
	
	/**
	 * 리포트 템플릿 파일 읽기
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
	 * 정기점검 장비 상태 리스트 
	 */
	@Override
	public List<FlkMap> selectFacilityStatusList(Maintenance maintenance) throws Exception {
		return regularCheckMapper.selectFacilityStatusList(maintenance);
	}

	/**
	 * 정기점검 목록관리 리스트
	 */
	@Override
	public List<FlkMap> selectFacilityCheckCmpltList(Maintenance maintenance) throws Exception {
		return regularCheckMapper.selectFacilityCheckCmpltList(maintenance);
	}

	/**
	 * 정기점검완료 상세정보 > 대항목조회
	 */
	@Override
	public List<FlkMap> selectFacilityCheckCmpltQuestion(Maintenance maintenance) throws Exception {
		return mobileMapper.selectFacilityCheckCmpltQuestion(maintenance);
	}

	/**
	 * 정기점검완료 상세정보 > 세부항목조회
	 */
	@Override
	public List<FlkMap> selectFacilityCheckCmpltAnswer(Maintenance maintenance) throws Exception {
		return mobileMapper.selectFacilityCheckCmpltAnswer(maintenance);
	}

	/**
	 * 정기점검완료 상세정보 > 장비정보
	 */
	@Override
	public Map<String, Object> selectFacilityCheckDetailInfo(Maintenance maintenance) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> facilityMap = new HashMap<String, Object>();
		String facilityId = maintenance.getFacilityId();
		switch (maintenance.getFacilityKind()) {
			case "01":	// 01:펌프 
				Pump pump = new Pump();
				pump.setFpmId(facilityId);
				FlkMap pumpInfo = pumpMapper.selectPumpInfo(pump);
				List<FlkMap> subPumpList = pumpMapper.selectSubPumpList(pump);
				facilityMap.put("facilityInfo", pumpInfo);
				facilityMap.put("subList", subPumpList);
				facilityMap.put("subListSize", subPumpList.size());
				break;
				
			case "02":	// 02:열교환기 
				HeatExc heatExc = new HeatExc();
				heatExc.setFhmId(facilityId);
				FlkMap heatExcInfo = heatExcMapper.selectHeatExcInfo(heatExc);
				facilityMap.put("facilityInfo", heatExcInfo);
				break;
				
			case "03":	// 03:냉동기
				Chiller chiller = new Chiller();
				chiller.setFsmId(facilityId);
				FlkMap chillerInfo = chillerMapper.selectChillerInfo(chiller);
				facilityMap.put("facilityInfo", chillerInfo);
				break;
				
			case "04":	// 04:축열조
				HeatStg heatStg = new HeatStg();
				heatStg.setFhsm(facilityId);
				FlkMap heatStgInfo = heatStgMapper.selectHeatStgInfo(heatStg);
				facilityMap.put("facilityInfo", heatStgInfo);
				break;
				
			case "05":	// 05:냉각탑
				CTower cTower = new CTower();
				cTower.setFcmId(facilityId);
				FlkMap cTowerInfo = cTowerMapper.selectCTowerInfo(cTower);
				List<FlkMap> subCTowerList = cTowerMapper.selectSubCTowerList(cTower);
				facilityMap.put("facilityInfo", cTowerInfo);
				facilityMap.put("subList", subCTowerList);
				facilityMap.put("subListSize", subCTowerList.size());
				break;
				
			case "06":	// 06:자동제어
				AutoCtrl autoCtrl = new AutoCtrl();
				autoCtrl.setFamId(facilityId);
				FlkMap autoCtrlInfo = autoCtrlMapper.selectAutoCtrlInfo(autoCtrl);
				facilityMap.put("facilityInfo", autoCtrlInfo);
				break;
				
			case "07":	// 07:심야전기MCC
				ElecMcc elecMcc = new ElecMcc();
				elecMcc.setFemId(facilityId);
				FlkMap elecMccInfo = elecMccMapper.selectElecMccInfo(elecMcc);
				facilityMap.put("facilityInfo", elecMccInfo);
				break;
		}
		resultMap.put("facilityMap", facilityMap);   // 장비정보
		return resultMap;
	}
	
	@Override
	public List<Maintenance> selectPhotoList(Maintenance maintenance) throws Exception {
		
		List<Maintenance> photoList = regularCheckMapper.selectPhotoList(maintenance);
		for(Maintenance vo : photoList) {
			String fileName = vo.getFileName().substring(0, vo.getFileName().lastIndexOf("."));
			String fileExt = vo.getFileName().substring(vo.getFileName().lastIndexOf(".")+1, vo.getFileName().length());
			vo.setFileUrl(fileImageUtil.getMaintenanceImageUrl(vo.getChkMonth(), fileName, fileExt));
		}
		return photoList;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public Map<String, Object> updateRegularCheckInfo(Map<String, Object> paramMap) throws Exception {
		// 
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Maintenance maintenance = new Maintenance();
		List<Map<String, Object>> valueList = (List<Map<String, Object>>) paramMap.get("valueSet");
		ArrayList<String> delPhotoArr = (ArrayList<String>)paramMap.get("delPhotoArr");
		ArrayList<String> newPhotoArr = (ArrayList<String>)paramMap.get("newPhotoArr");
		List<Map<String, Object>> etcValue = (List<Map<String, Object>>) paramMap.get("etcValue");
		
		if(delPhotoArr.size() > 0){
			maintenance.setRealDelListArr(delPhotoArr);
			//이미지 사용여부 N
			regularCheckMapper.deletePhotoList(maintenance);
			//임시저장된 데이터 사용여부N 조회 후 서버 이미지삭제
			List<Maintenance> delList = regularCheckMapper.selectNoUseImg(maintenance);
			for(Maintenance main : delList){
				FileUtil.deleteFile(main.getFilePath(), main.getFileName());
			}
			//이미지 실데이터 삭제
			regularCheckMapper.realDeletePhotoList(maintenance);
		}
		if(newPhotoArr.size() > 0){
			maintenance.setNewListArr(newPhotoArr);
			//임시저장 이미지 사용여부 업데이트
			regularCheckMapper.updateImgUseYn(maintenance);
		}
		//수정 내용 저장
		int resultCnt = 0;
		for(Map<String, Object> map : valueList) {
			maintenance.setChkMonth(map.get("chkMonth").toString());
			maintenance.setMsId(map.get("msId").toString());
			maintenance.setResult(map.get("result").toString());
			maintenance.setMsaId(map.get("msaId").toString());
			maintenance.setSubFacilityId(map.get("subFacilityId").toString());
			
			mobileMapper.updateCheckValue(maintenance);
			resultCnt++;
		}
		
		//작업관리 히스토리 등록 
		int workResult = 0;
		if(etcValue.size() > 0 ){
			WorkHistory workHistory = new WorkHistory();
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentTime = new Date ( );
			for(Map<String, Object> map : etcValue) {
				workHistory.setTitle(map.get("etcTitle").toString());
				workHistory.setContent("\r\n"+map.get("etcContent").toString().replace("|", "\r\n"));
				workHistory.setRegId(paramMap.get("regId").toString());
				workHistory.setUpdateId(paramMap.get("regId").toString());
				workHistory.setSiteId(paramMap.get("siteId").toString());
				workHistory.setWorkDate(mSimpleDateFormat.format ( currentTime ));
				
				workHistoryService.addWorkHistory(workHistory);
				workResult++;
			}
		}
		
		if(valueList.size() == resultCnt && etcValue.size() == workResult){
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
		}else{
			resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> uploadImg(com.flk.api.domain.File file) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
    	// 필수값 미입력
    	if(StringUtils.isBlank(file.getMngId()) || StringUtils.isBlank(file.getChkMonth()) || StringUtils.isBlank(file.getMsId()) || StringUtils.isBlank(file.getMsqId())) {
    		throw new BizExceptionProperties(ErrorCodeEnum.NOT_PARAMETER.getCode());
    	}
    	if(file.getUploadFile1() == null){
    		throw new BizExceptionProperties(ErrorCodeEnum.NOT_PARAMETER.getCode());
    	}
    	
    	String chkFilePath = filePath + file.getChkMonth() + "/";
    	
    	try {
    		file.setFilePath(chkFilePath);
    		file.setUseFlag(Constants.NO);
    		file.setUpdateId(file.getMngId());
			file.setRegId(file.getMngId());
    		
        	UploadFile uploadFile = FileUtil.saveMultipartImage(file.getUploadFile1(), chkFilePath);
    		file.setFileName(uploadFile.getStoreFileName() + "." + uploadFile.getStoreFileExtention());
    		file.setUpdateId(file.getMngId());
    		file.setRegId(file.getMngId());
    		
    		//이미지 임시저장
    		int result = regularCheckMapper.uploadImg(file);
    		if(result>0){
    			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
    			resultMap.put(Constants.RESULT_MSG, file.getMfqId());
    		}else{
    			resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
    		}
    	} catch (Exception e) {
    		throw new BizExceptionProperties(ErrorCodeEnum.FAIL.getCode());
		}
		return resultMap;
	}


}
