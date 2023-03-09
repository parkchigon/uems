package com.flk.mng.equipment.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.Pump;

@Repository
public interface PumpMapper {
	List<FlkMap> selectPumpList(Pump pump);
	FlkMap selectPumpInfo(Pump pump);
	List<FlkMap> selectSubPumpList(Pump pump);
	List<FlkMap> selectPumpTypeList(Pump pump);
	void insertPumpMaster(Pump pump);
	void insertPumpSub(Pump pump);
	void updatePumpMaster(Pump pump);
	void deletePumpSub(Pump pump);
	void updateUseFlag(Pump pump);
	
}
