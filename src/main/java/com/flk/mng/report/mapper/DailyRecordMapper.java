package com.flk.mng.report.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.DailyRecord;

@Repository
public interface DailyRecordMapper {
	
	public List<FlkMap> selectDailyRecordList(DailyRecord dailyRecord);
	
	public int updateDailyRecord(DailyRecord dailyRecord) throws Exception;
	
	public int insertDailyRecord(List<String> insertDailyRecordList) throws Exception;
	
	public int updateDailyRecordNotUse(DailyRecord dailyRecord) throws Exception;

}
