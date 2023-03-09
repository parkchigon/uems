package com.flk.mng.equipment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.enums.FacilityEnum;
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


@Service
public class EquipmentServiceImpl implements EquipmentService {
	@Autowired PumpMapper pumpMapper;
	@Autowired HeatExcMapper heatExcMapper;
	@Autowired ChillerMapper chillerMapper;
	@Autowired AutoCtrlMapper autoCtrlMapper;
	@Autowired HeatStgMapper heatStgMapper;
	@Autowired ElecMccMapper elecMccMapper;
	@Autowired CTowerMapper cTowerMapper;
	
	/**펌프관리 리스트조회
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchPumpList(Pump pump) throws Exception {
		return pumpMapper.selectPumpList(pump);
	}
	
	/**펌프관리 상세화면 Master
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	@Override
	public FlkMap searchPumpInfo(Pump pump)throws Exception{
		return pumpMapper.selectPumpInfo(pump);
	}
	
	
		
	/**펌프관리 상세화면 Sub
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchSubPumpList(Pump pump) throws Exception {
		return pumpMapper.selectSubPumpList(pump);
	}
	
	/**펌프종류 리스트
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchPumpTypeList(Pump pump) throws Exception {
		return pumpMapper.selectPumpTypeList(pump);
	}
	
	/**펌프관리 등록
	 * @param pump
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addPump(Pump pump) throws Exception{
		pumpMapper.insertPumpMaster(pump);
		if(pump.getSubPump()!= null){ // 세부항목 insert
			for(Pump subPump : pump.getSubPump()){
				subPump.setFpmId(pump.getFpmId());
				subPump.setPumpTypeCd(subPump.getPumpSubTypeCd());
				if (!StringUtils.isEmpty(subPump.getPumpSubname())) {
					pumpMapper.insertPumpSub(subPump);
				}
			}
		}
		// 장비신규 등록 시 점검관리 테이블에 장비정보 INSERT
		Maintenance maintenance = new Maintenance();
		maintenance.setFacilityId(pump.getFpmId());
		maintenance.setSiteId(pump.getSiteId());
		maintenance.setFacilityKind(FacilityEnum.PUMP.getCode());
		maintenance.setRegId(pump.getRegId());
		
		insertMaintenanceCommData(maintenance);
		
	}
	
	/**펌프관리 수정,삭제
	 * @param pump
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void modifyPump(Pump pump) throws Exception{
		if(("del").equals(pump.getUseFlag())){ //삭제시 useFlag = N
			pumpMapper.updateUseFlag(pump);
			// 장비 useFlag = N
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(pump.getFpmId());
			maintenance.setUpdateId(pump.getUpdateId());
			updateMaintenanceCommData(maintenance);
		}else{	//수정
			pumpMapper.updatePumpMaster(pump);
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(pump.getFpmId());
			maintenance.setSiteId(pump.getSiteId());
			maintenance.setUpdateId(pump.getUpdateId());
			updateMaintenanceData(maintenance);
			//
			pumpMapper.deletePumpSub(pump);//수정시 하위테이블 delete insert
			if (!StringUtils.isEmpty(pump.getSubPump())) {//insert할 내용이 있을경우에만
				for(Pump subPump : pump.getSubPump()){
					subPump.setFpmId(pump.getFpmId());
					subPump.setPumpTypeCd(subPump.getPumpSubTypeCd());
					if (!StringUtils.isEmpty(subPump.getPumpSubname())) {
						pumpMapper.insertPumpSub(subPump);
					}
				}
			}
			
		}
	}
	
	/**열교환기관리 리스트 조회
	 * @param heatExc
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchHeatExcList(HeatExc heatExc) throws Exception {
		return heatExcMapper.selectHeatExcList(heatExc);
	}
	
	/**열교환기 관리 상세정보
	 * @param heatExc
	 * @return
	 * @throws Exception
	 */
	@Override
	public FlkMap searchHeatExcInfo(HeatExc heatExc)throws Exception{
		return heatExcMapper.selectHeatExcInfo(heatExc);
	}
	
	/**열교환기 관리 등록
	 * @param heatExc
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addHeatExc(HeatExc heatExc) throws Exception{
		
		heatExcMapper.insertHeatExcInfo(heatExc);
		// 장비신규 등록 시 점검관리 테이블에 장비정보 INSERT
 		Maintenance maintenance = new Maintenance();
		maintenance.setFacilityId(heatExc.getFhmId());
		maintenance.setSiteId(heatExc.getSiteId());
		maintenance.setFacilityKind(FacilityEnum.HEATEXC.getCode());
		maintenance.setRegId(heatExc.getRegId());
		insertMaintenanceCommData(maintenance);
	}
	
	/**열교환기 수정,삭제
	 * @param heatExc
	 * @throws Exception
	 */
	@Override
	public void modifyHeatExc(HeatExc heatExc) throws Exception{
		if(("del").equals(heatExc.getUseFlag())){ //삭제시 useFlag = N
			heatExcMapper.updateUseFlag(heatExc);
			// 장비 useFlag = N
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(heatExc.getFhmId());
			maintenance.setUpdateId(heatExc.getUpdateId());
			updateMaintenanceCommData(maintenance);
			
		}else{
			heatExcMapper.updateHeatExcInfo(heatExc);
		}
	}
	
	/**냉동기 리스트 조회
	 * @param chiller
	 * @return
	 * @throws Exception
	 */
	public List<FlkMap> searchChillerList(Chiller chiller) throws Exception{
		return chillerMapper.selectChillerList(chiller);
	}
	
	/**냉동기 타입 리스트 조회
	 * @param chiller
	 * @return
	 * @throws Exception
	 */
	public List<FlkMap> searchChillerTypeList(Chiller chiller) throws Exception{
		return chillerMapper.selectChillerTypeList(chiller);
	}
	
	/**냉동기 상세정보
	 * @param chiller
	 * @return
	 * @throws Exception
	 */
	public FlkMap searchChillerInfo (Chiller chiller)throws Exception{
		return chillerMapper.selectChillerInfo(chiller);
	}
	
	/** 냉동기 등록 ajax
	 * @param chiller
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addChiller(Chiller chiller) throws Exception{
		chillerMapper.insertChillerInfo(chiller);
		// 장비신규 등록 시 점검관리 테이블에 장비정보 INSERT
 		Maintenance maintenance = new Maintenance();
		maintenance.setFacilityId(chiller.getFsmId());
		maintenance.setSiteId(chiller.getSiteId());
		maintenance.setFacilityKind(FacilityEnum.CHILLER.getCode());
		maintenance.setRegId(chiller.getRegId());
		insertMaintenanceCommData(maintenance);
	}
	
	/**냉동기 수정
	 * @param chiller
	 * @throws Exception
	 */
	@Override
	public void modifyChiller(Chiller chiller) throws Exception{
		if(("del").equals(chiller.getUseFlag())){ //삭제시 useFlag = N
			chillerMapper.updateUseFlag(chiller);
			// 장비 useFlag = N
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(chiller.getFsmId());
			maintenance.setUpdateId(chiller.getUpdateId());
			updateMaintenanceCommData(maintenance);
		}else{
			chillerMapper.updateChillerInfo(chiller);
		}
	}
	
	
	/**자동제어 조회
	 * @param autoCtrl
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchAutoCtrlList(AutoCtrl autoCtrl) throws Exception{ //자동제어 조회
		return autoCtrlMapper.selectAutoCtrlList(autoCtrl);
	}
	
	/**자동제어 상세
	 * @param autoCtrl
	 * @throws Exception
	 */
	@Override
	public FlkMap searchAutoCtrlInfo(AutoCtrl autoCtrl) throws Exception{ //자동제어 상세
		return autoCtrlMapper.selectAutoCtrlInfo(autoCtrl);
	}
	
	/**자동제어 등록
	 * @param autoCtrl
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addAutoCtrl(AutoCtrl autoCtrl) throws Exception{ //자동제어 등록
		autoCtrlMapper.insertAutoCtrlInfo(autoCtrl);
		// 장비신규 등록 시 점검관리 테이블에 장비정보 INSERT
		Maintenance maintenance = new Maintenance();
		maintenance.setFacilityId(autoCtrl.getFamId());
		maintenance.setSiteId(autoCtrl.getSiteId());
		maintenance.setFacilityKind(FacilityEnum.AUTOCTRL.getCode());
		maintenance.setRegId(autoCtrl.getRegId());
		insertMaintenanceCommData(maintenance);
	}
	
	/**자동제어 수정
	 * @param autoCtrl
	 * @throws Exception
	 */
	@Override
	public void modifyAutoCtrl(AutoCtrl autoCtrl) throws Exception{ //자동제어 수정
		if(("del").equals(autoCtrl.getUseFlag())){ //삭제시 useFlag = N
			autoCtrlMapper.updateUseFlag(autoCtrl);
			// 장비 useFlag = N
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(autoCtrl.getFamId());
			maintenance.setUpdateId(autoCtrl.getUpdateId());
			updateMaintenanceCommData(maintenance);
		}else{
			autoCtrlMapper.updateAutoCtrlInfo(autoCtrl);
		}
	}
	
	/**축열조 및 배관 리스트 조회
	 * @param heatStg
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchHeatStgList(HeatStg heatStg) throws Exception {
		return heatStgMapper.selectHeatStgList(heatStg);
	}

	/**축열조 및 배관 등록
	 * @param heatStg
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addHeatStg(HeatStg heatStg) throws Exception {
		heatStgMapper.insertHeatStgInfo(heatStg);
		// 장비신규 등록 시 점검관리 테이블에 장비정보 INSERT
 		Maintenance maintenance = new Maintenance();
		maintenance.setFacilityId(heatStg.getFhsm());
		maintenance.setSiteId(heatStg.getSiteId());
		maintenance.setFacilityKind(FacilityEnum.HEATSTG.getCode());
		maintenance.setRegId(heatStg.getRegId());
		insertMaintenanceCommData(maintenance);
	}

	/**축열조 및 배관 수정
	 * @param heatStg
	 * @throws Exception
	 */
	@Override
	public void modifyHeatStg(HeatStg heatStg) throws Exception {
		if(("del").equals(heatStg.getUseFlag())){ //삭제시 useFlag = N
			heatStgMapper.updateUseFlag(heatStg);
			// 장비 useFlag = N
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(heatStg.getFhsm());
			maintenance.setUpdateId(heatStg.getUpdateId());
			updateMaintenanceCommData(maintenance);
		}else{
			heatStgMapper.updateHeatStgInfo(heatStg);
		}
	}

	/**축열조 및 배관 상세정보
	 * @param heatStg
	 * @throws Exception
	 */
	@Override
	public FlkMap searchHeatStgInfo(HeatStg heatStg) throws Exception {
		return heatStgMapper.selectHeatStgInfo(heatStg);
	}
	
	/**심야전기 조회
	 * @param elecMcc
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchElecMccList(ElecMcc elecMcc) throws Exception{
		return elecMccMapper.selectElecMccList(elecMcc);
	}
	
	/**심야전기 상세
	 * @param elecMcc
	 * @throws Exception
	 */
	@Override
	public FlkMap searchElecMccInfo(ElecMcc elecMcc) throws Exception{
		return elecMccMapper.selectElecMccInfo(elecMcc);
	}
	
	/**심야전기 등록
	 * @param elecMcc
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addElecMcc(ElecMcc elecMcc)throws Exception{
		elecMccMapper.insertElecMccInfo(elecMcc);
		// 장비신규 등록 시 점검관리 테이블에 장비정보 INSERT
 		Maintenance maintenance = new Maintenance();
		maintenance.setFacilityId(elecMcc.getFemId());
		maintenance.setSiteId(elecMcc.getSiteId());
		maintenance.setFacilityKind(FacilityEnum.ELECMSS.getCode());
		maintenance.setRegId(elecMcc.getRegId());
		insertMaintenanceCommData(maintenance);
	}
	
	/**심야전기 수정
	 * @param elecMcc
	 * @throws Exception
	 */
	@Override
	public void modifyElecMcc(ElecMcc elecMcc)throws Exception{
		if(("del").equals(elecMcc.getUseFlag())){ //삭제시 useFlag = N
			elecMccMapper.updateUseFlag(elecMcc);
			// 장비 useFlag = N
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(elecMcc.getFemId());
			maintenance.setUpdateId(elecMcc.getUpdateId());
			updateMaintenanceCommData(maintenance);
		}else{
			elecMccMapper.updateElecMccInfo(elecMcc);
		}
	}
	
	/**냉각탑 리스트 조회
	 * @param cTower
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchCTowerList(CTower cTower) throws Exception {
		return cTowerMapper.selectCTowerList(cTower);
	}

	/**냉각탑 상세 Master
	 * @param cTower
	 * @throws Exception
	 */
	@Override
	public FlkMap searchCTowerInfo(CTower cTower) throws Exception {
		return cTowerMapper.selectCTowerInfo(cTower);
	}

	/**냉각탑 상세  SUB
	 * @param cTower
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchSubCTowerList(CTower cTower) throws Exception {
		return cTowerMapper.selectSubCTowerList(cTower);
	}

	/**냉각탑 등록
	 * @param cTower
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addCTower(CTower cTower) throws Exception {
		cTowerMapper.insertCTowerMaster(cTower);
		if(cTower.getSubCTower()!= null){ // 세부항목 insert
			for(CTower subCTower : cTower.getSubCTower()){
				subCTower.setFcmId(cTower.getFcmId());
				if (!StringUtils.isEmpty(subCTower.getCtowerSubName())) {
					cTowerMapper.insertCTowerSub(subCTower);
				}
			}
		}
		// 장비신규 등록 시 점검관리 테이블에 장비정보 INSERT
		Maintenance maintenance = new Maintenance();
		maintenance.setFacilityId(cTower.getFcmId());
		maintenance.setSiteId(cTower.getSiteId());
		maintenance.setFacilityKind(FacilityEnum.CTOWER.getCode());
		maintenance.setRegId(cTower.getRegId());
		insertMaintenanceCommData(maintenance);
	}

	/**냉각탑 수정
	 * @param cTower
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void modifyCTower(CTower cTower) throws Exception {
		if(("del").equals(cTower.getUseFlag())){ //삭제시 useFlag = N
			cTowerMapper.updateUseFlag(cTower);
			// 장비 useFlag = N
			Maintenance maintenance = new Maintenance();
			maintenance.setFacilityId(cTower.getFcmId());
			maintenance.setUpdateId(cTower.getUpdateId());
			updateMaintenanceCommData(maintenance);
		}else{	//수정
			cTowerMapper.updateCTowerMaster(cTower);
			cTowerMapper.deleteCTowerSub(cTower);
			if (! StringUtils.isEmpty(cTower.getSubCTower())) { //sub data있을 경우
				for(CTower subCTower : cTower.getSubCTower()){
					subCTower.setFcmId(cTower.getFcmId());
					if (!StringUtils.isEmpty(subCTower.getCtowerSubName())) {
						cTowerMapper.insertCTowerSub(subCTower);
					}
				}
			}
		}
	}
	
	/**
	 * 장비점검항목 공통데이터 조회 및 등록 
	 * @param maintenance
	 * @throws Exception
	 */
	public void insertMaintenanceCommData(Maintenance maintenance) throws Exception {
		
		// 1. 장비등록후 해당데이터 점검항목리스트에 등록
		heatExcMapper.insertEquipInfoForMaintenance(maintenance);
		// 2. comm_que 테이블 mcq_id 리스트 조회
		List<Maintenance> mcqList = heatExcMapper.selectCommMcpIdList(maintenance);
		for(int i=0; i<mcqList.size(); i++){
			maintenance.setMcqId(mcqList.get(i).getMcqId());
			// 3. que / ans 공통테이블 copy 각 site 테이블에 등록 
			heatExcMapper.insertMaintenanceDefaultQue(maintenance);
			heatExcMapper.insertMaintenanceDefaultAns(maintenance);
		}
	}
	
	/**
	 * 장비점검항목 공통데이터 엡데이트 삭제시 useFlag = N
	 * @param maintenance
	 * @throws Exception
	 * 삭제시 useFlag = N
	 */
	public void updateMaintenanceCommData(Maintenance maintenance) throws Exception {
		
		// 삭제시 useFlag = N
		heatExcMapper.updateEquipMaintenance(maintenance);

	}
	
	/**
	 * 장비점검항목 공통데이터 엡데이트시 tbl_maintenance_site update
	 * @param maintenance
	 * @throws Exception
	 * tbl_maintenance_site update
	 */
	public void updateMaintenanceData(Maintenance maintenance) throws Exception {
		
		// 엡데이트시 tbl_maintenance_site
		heatExcMapper.updateMaintenance(maintenance);

	}

	/**
	 * 냉동기 > 냉동기번호 카운트 조회
	 * @param chiller
	 * @throws Exception
	 */
	@Override
	public int selectChiilerNoExistCount(Chiller chiller) throws Exception {
		return chillerMapper.selectChiilerNoExistCount(chiller);
	}
}
