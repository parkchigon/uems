package com.flk.mng.equipment.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.AutoCtrl;
import com.flk.mng.equipment.domain.CTower;
import com.flk.mng.equipment.domain.Chiller;
import com.flk.mng.equipment.domain.ElecMcc;
import com.flk.mng.equipment.domain.HeatExc;
import com.flk.mng.equipment.domain.HeatStg;
import com.flk.mng.equipment.domain.Pump;


public interface EquipmentService {
	
	/** 펌프관리 조회
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchPumpList(Pump pump) throws Exception;
	
	/**펌프관리 상세 Master
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	FlkMap searchPumpInfo (Pump pump)throws Exception;
	
	/**펌프관리 상세 Sub
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchSubPumpList(Pump pump) throws Exception;
	
	/** 펌프종류 리스트
	 * @param pump
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchPumpTypeList(Pump pump) throws Exception;
	
	/** 펌프관리 등록 ajax
	 * @param pump
	 * @throws Exception
	 */
	void addPump(Pump pump) throws Exception;
	
	/**펌프관리 수정
	 * @param pump
	 * @throws Exception
	 */
	void modifyPump(Pump pump) throws Exception;
	
	
	/**열교환기 리스트 조회
	 * @param heatExc
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchHeatExcList(HeatExc heatExc) throws Exception; 
	
	/**열교환기 상세정보
	 * @param heatExc
	 * @return
	 * @throws Exception
	 */
	FlkMap searchHeatExcInfo (HeatExc heatExc)throws Exception;
	
	/** 열교환기 등록 ajax
	 * @param heatExc
	 * @throws Exception
	 */
	void addHeatExc(HeatExc heatExc) throws Exception;
	
	/**열교환기 수정
	 * @param heatExc
	 * @throws Exception
	 */
	void modifyHeatExc(HeatExc heatExc) throws Exception;
	
	/**냉동기 리스트 조회
	 * @param chiller
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchChillerList(Chiller chiller) throws Exception; 
	
	/**냉동기 타입 리스트 조회
	 * @param chiller
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchChillerTypeList(Chiller chiller) throws Exception;
	
	/**냉동기 상세정보
	 * @param chiller
	 * @return
	 * @throws Exception
	 */
	FlkMap searchChillerInfo (Chiller chiller)throws Exception;
	
	/** 냉동기 등록 ajax
	 * @param chiller
	 * @throws Exception
	 */
	void addChiller(Chiller chiller) throws Exception;
	
	/**냉동기 수정
	 * @param chiller
	 * @throws Exception
	 */
	void modifyChiller(Chiller chiller) throws Exception;
	
	
	/**자동제어 리스트조회
	 * @param autoCtrl
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchAutoCtrlList(AutoCtrl autoCtrl)throws Exception;
	
	/**자동제어 상세정보
	 * @param autoCtrl
	 * @return
	 * @throws Exception
	 */
	FlkMap searchAutoCtrlInfo(AutoCtrl autoCtrl)throws Exception;
	
	/**자동제어 등록
	 * @param autoCtrl
	 * @throws Exception
	 */
	void addAutoCtrl(AutoCtrl autoCtrl)throws Exception;
	
	/**자동제어 수정,삭제
	 * @param autoCtrl
	 * @throws Exception
	 */
	void modifyAutoCtrl(AutoCtrl autoCtrl)throws Exception;
	
	/**축열조 및 배관 리스트 조회
	 * @param heatStg
	 * @throws Exception
	 */
	List<FlkMap> searchHeatStgList(HeatStg heatStg) throws Exception;

	/**축열조 및 배관 등록
	 * @param heatStg
	 * @throws Exception
	 */
	void addHeatStg(HeatStg heatStg) throws Exception;

	/**축열조 및 배관 수정
	 * @param heatStg
	 * @throws Exception
	 */
	void modifyHeatStg(HeatStg heatStg) throws Exception;

	/**축열조 및 배관 상세정보
	 * @param heatStg
	 * @throws Exception
	 */
	FlkMap searchHeatStgInfo(HeatStg heatStg) throws Exception;
	
	/**심야전기리스트 조회
	 * @param elecMcc
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchElecMccList(ElecMcc elecMcc) throws Exception;

	/**심야전기 상세
	 * @param elecMcc
	 * @return
	 * @throws Exception
	 */
	FlkMap searchElecMccInfo(ElecMcc elecMcc) throws Exception;
	
	/**심야전기 등록
	 * @param elecMcc
	 * @throws Exception
	 */
	void addElecMcc(ElecMcc elecMcc) throws Exception;
	
	
	/**심야전기 수정
	 * @param elecMcc
	 * @throws Exception
	 */
	void modifyElecMcc(ElecMcc elecMcc) throws Exception;
	
	/**냉각탑 리스트 조회
	 * @param cTower
	 * @throws Exception
	 */
	List<FlkMap> searchCTowerList(CTower cTower) throws Exception;

	/**냉각탑 상세 Master
	 * @param cTower
	 * @return
	 * @throws Exception
	 */
	FlkMap searchCTowerInfo(CTower cTower) throws Exception;

	/**냉각탑 상세 SUB
	 * @param cTower
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchSubCTowerList(CTower cTower) throws Exception;

	/**냉각탑 등록
	 * @param cTower
	 * @throws Exception
	 */
	void addCTower(CTower cTower) throws Exception;

	/**냉각탑 수정
	 * @param cTower
	 * @throws Exception
	 */
	void modifyCTower(CTower cTower) throws Exception;
	
	/**냉동기 번호 카운트 
	 * @param cTower
	 * @throws Exception
	 */
	int selectChiilerNoExistCount(Chiller chiller) throws Exception;
}
