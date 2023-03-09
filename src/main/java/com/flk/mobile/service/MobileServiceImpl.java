package com.flk.mobile.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.FileImageUtil;
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
import com.flk.mng.work.domain.WorkHistory;
import com.flk.mng.work.service.WorkHistoryService;
import com.flk.mobile.mapper.MobileMapper;

@Service
public class MobileServiceImpl implements MobileService{
	
	@Autowired
	private MobileMapper mobileMapper;
	
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
	private FileImageUtil fileImageUtil;
	
	@Autowired
	private WorkHistoryService workHistoryService;
	

	@Override
	public List<Maintenance> selectFacilityListForSite(Maintenance maintenance) throws Exception {
		return mobileMapper.selectFacilityListForSite(maintenance);
	}

	@Override
	public List<FlkMap> selectFacilityCheckQuestion(Maintenance maintenance) throws Exception {
		return mobileMapper.selectFacilityCheckQuestion(maintenance);
		
	}

	@Override
	public List<FlkMap> selectFacilityCheckAnswer(Maintenance maintenance) throws Exception {
		return mobileMapper.selectFacilityCheckAnswer(maintenance);
		
	}

	@Override
	public List<FlkMap> selectMainSiteList(Maintenance maintenance) throws Exception {
		return mobileMapper.selectMainSiteList(maintenance);
	}

	@Override
	@Transactional
	public Map<String, Object> selectCheckData(Maintenance maintenance, int count) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		// 해당지점 장비리스트 조회 
		List<Maintenance> facilityList = mobileMapper.selectFacilityListForSite(maintenance);
		
		if (facilityList.size() <= 0) {
			return null;
		}
		
		if(count==0){
			maintenance.setFacilityId(facilityList.get(0).getFacilityId());
			maintenance.setFacilityKind(facilityList.get(0).getFacilityKind());
			maintenance.setFinishYn(facilityList.get(0).getFinishYn());
			maintenance.setFinishYnVal(facilityList.get(0).getFinishYnVal());
			maintenance.setMsId(facilityList.get(0).getMsId());
			maintenance.setFacilityName(facilityList.get(0).getFacilityName());
		}
		List<FlkMap> questionList = null;
		List<FlkMap> answerList = null;
		// FinishYn : Y.점검완료 N.미실시
		if(Constants.YES.equals(maintenance.getFinishYn())){ //점검완료
			questionList = mobileMapper.selectFacilityCheckCmpltQuestion(maintenance);
			answerList = mobileMapper.selectFacilityCheckCmpltAnswer(maintenance);
		}else{ //미실시
			questionList = mobileMapper.selectFacilityCheckQuestion(maintenance);
			answerList = mobileMapper.selectFacilityCheckAnswer(maintenance);
		}
		
		// 설비정보조회 > 01:펌프 02:열교환기 03:냉동기 04:축열조 05:냉각탑 06:자동제어 07:심야전기MCC
		String facilityId = maintenance.getFacilityId();
		Map<String, Object> facilityMap = new HashMap<String, Object>();
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
		
		resultMap.put("facilityList", facilityList); // 장비리스트
		resultMap.put("facilityMap", facilityMap);   // 장비정보
		resultMap.put("questionList", questionList); // 해당장비점검항목
		resultMap.put("answerList", answerList);     // 해당장비점검상세항목
		resultMap.put("maintenance", maintenance);   // 기존데이터
		return resultMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Map<String, Object> insertCheckValue(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Maintenance maintenance = new Maintenance();
		List<Map<String, Object>> valueList = (List<Map<String, Object>>) paramMap.get("valueSet");
		List<Map<String, Object>> etcValue = (List<Map<String, Object>>) paramMap.get("etcValue");
		
		// 등록 or 수정 finish = Y.수정 N.등록
		String finishYn = paramMap.get("finishYn").toString();
		int resultCnt = 0;
		int workResult = 0;
		if(finishYn.equals(Constants.YES)){ //수정
			for(Map<String, Object> map : valueList) {
				maintenance.setChkMonth(map.get("chkMonth").toString());
				maintenance.setMsId(map.get("msId").toString());
				maintenance.setResult(map.get("result").toString());
				maintenance.setMsaId(map.get("msaId").toString());
				maintenance.setSubFacilityId(map.get("subFacilityId").toString());
				
				mobileMapper.updateCheckValue(maintenance);
				resultCnt++;
			}
		}else{ //등록
			maintenance.setRegId(paramMap.get("regId").toString());
			maintenance.setChkMonth(valueList.get(0).get("chkMonth").toString());
			maintenance.setMsId(valueList.get(0).get("msId").toString());
			maintenance.setFinishYn(Constants.YES);
			
			mobileMapper.insertCheckFinish(maintenance);
			
			for(Map<String, Object> map : valueList) {
				maintenance.setChkMonth(map.get("chkMonth").toString());
				maintenance.setMsId(map.get("msId").toString());
				maintenance.setResult(map.get("result").toString());
				maintenance.setMsaId(map.get("msaId").toString());
				maintenance.setSubFacilityId(map.get("subFacilityId").toString());
				
				mobileMapper.insertCheckValue(maintenance);
				resultCnt++;
				
			}
		}
		
		
		//작업관리 히스토리 등록 
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
	public List<Maintenance> selectPhotoList(Maintenance maintenance) throws Exception {
		
		List<Maintenance> photoList = mobileMapper.selectPhotoList(maintenance);
		for(Maintenance vo : photoList) {
			String fileName = vo.getFileName().substring(0, vo.getFileName().lastIndexOf("."));
			String fileExt = vo.getFileName().substring(vo.getFileName().lastIndexOf(".")+1, vo.getFileName().length());
			vo.setFileUrl(fileImageUtil.getMaintenanceImageUrl(vo.getChkMonth(), fileName, fileExt));
		}
		return photoList;
	}

	@Override
	public int deletePhoto(Maintenance maintenance) throws Exception {
		return mobileMapper.deletePhoto(maintenance);
	}


}
