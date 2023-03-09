package com.flk.ems.schedule.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.schedule.domain.ScheduleRecord;
import com.flk.mng.report.domain.DailyRecord;
import com.flk.mng.site.domain.Site;

@Repository
public interface ScheduleRecordMapper {
	
	/**
	 * 운전모드 리스트
	 * 
	 * @param site
	 * @return
	 */
	List<FlkMap> selectDriveList(Site site) throws Exception;
	
	/**
	 * 지점 리스트
	 * 
	 * @param site
	 * @return
	 */
	List<FlkMap> selectSiteList() throws Exception;
	
	public int updateDailyRecord(DailyRecord dailyRecord) throws Exception;
	
	public int insertScheduleRecord(ScheduleRecord scheduleRecord) throws Exception;
	public int insertScheduleHistoryRecord(ScheduleRecord scheduleRecord) throws Exception;

	public int updateScheduleRecord(ScheduleRecord scheduleRecord) throws Exception;
	public int updateScheduleHistoryRecord(ScheduleRecord scheduleRecord) throws Exception;

	public int deleteScheduleRecord(ScheduleRecord scheduleRecord) throws Exception;
	public int deleteScheduleHistoryRecord(ScheduleRecord scheduleRecord) throws Exception;
	
	public int updateScheduleRecordNotUse(ScheduleRecord scheduleRecord) throws Exception;

	List<FlkMap> selectScheduleRecordList(ScheduleRecord scheduleRecord) throws Exception;
	
	List<FlkMap> selectScheduleOutdayList(ScheduleRecord scheduleRecord) throws Exception;
	
	public int deleteScheduleOutday(ScheduleRecord scheduleRecord) throws Exception;
	public int deleteScheduleOutdayHistory(ScheduleRecord scheduleRecord) throws Exception;
	
	public int insertScheduleOutday(ScheduleRecord scheduleRecord) throws Exception;
	public int insertScheduleOutdayHistory(ScheduleRecord scheduleRecord) throws Exception;

	List<FlkMap> selectSiIdList(ScheduleRecord scheduleRecord) throws Exception;

	List<FlkMap> selectTagList(Site site) throws Exception;

}
