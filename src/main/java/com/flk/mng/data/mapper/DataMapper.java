package com.flk.mng.data.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.data.domain.Data;

@Repository
public interface DataMapper {
	List<FlkMap> selectDataList(Data data);
	
	void insertData(Data data);
	
	FlkMap selectDataInfo(Data data);
	
	void updateData(Data data);
	
	void deleteData(Data data);
	
	int selectDataCount(Data data);

	Data selectElecRate(Data data);
	
	String selectDayelecAmount(Data data);

	String selectPrevCoolCharge(Data data);

	String selectPresCoolCharge(Data data);

	String selectPrevEnergyAmount(Data data);

	String selectPresEnergyAmount(Data data);

	String selectPrevTcoAmount(Data data);

	String selectPresTcoAmount(Data data);

	String selectCoolingLoadAmount(Data data); 
}


