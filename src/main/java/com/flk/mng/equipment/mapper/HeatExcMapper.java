package com.flk.mng.equipment.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.HeatExc;
import com.flk.mng.report.domain.Maintenance;


@Repository
public interface HeatExcMapper {
	
	/**열교환기 리스트 조회
	 * @param heatExc
	 * @return
	 */
	List<FlkMap> selectHeatExcList(HeatExc heatExc);
	
	/**열교환기 상세
	 * @param HeatExc
	 * @return
	 */
	FlkMap selectHeatExcInfo(HeatExc HeatExc);
	
	/**열교환기 등록
	 * @param heatExc
	 */
	void insertHeatExcInfo(HeatExc heatExc);
	
	/**열교환기 수정
	 * @param heatExc
	 */
	void updateHeatExcInfo(HeatExc heatExc);
	
	/**열교환기 삭제 
	 * @param heatExc
	 */
	void updateUseFlag(HeatExc heatExc);

	/**
	 * 장비점검관리 테이블 장비 정보 등록
	 * @param maintenance
	 */
	void insertEquipInfoForMaintenance(Maintenance maintenance);
	
	/**
	 * 장비점검관리 테이블 장비 삭제시 N처리
	 * @param maintenance
	 */
	void updateEquipMaintenance(Maintenance maintenance);
	
	/**
	 * 장비점검관리 테이블 장비 삭제시 N처리
	 * @param maintenance
	 */
	void updateMaintenance(Maintenance maintenance);
	
	/**
	 * 장비별 공통 항목 키값 조회
	 * @param maintenance
	 */
	List<Maintenance> selectCommMcpIdList(Maintenance maintenance);
	
	/**
	 * 장비점검관리 테이블 common Que copy
	 * @param maintenance
	 */
	void insertMaintenanceDefaultQue(Maintenance maintenance);
	
	/**
	 * 장비점검관리 테이블 common Ans copy
	 * @param maintenance
	 */
	void insertMaintenanceDefaultAns(Maintenance maintenance);
}

