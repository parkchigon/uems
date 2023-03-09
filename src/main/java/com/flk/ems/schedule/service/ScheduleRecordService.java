package com.flk.ems.schedule.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.schedule.domain.ScheduleRecord;
import com.flk.mng.report.domain.DailyRecord;
import com.flk.mng.report.domain.Maintenance;
import com.flk.mng.site.domain.Site;

public interface ScheduleRecordService {

	/**
	 * 스케줄 관리 리스트 조회
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectScheduleRecordList(ScheduleRecord scheduleRecord) throws Exception;
	
	
	/**
	 * 태그 리스트
	 * 
	 * @param site
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchDriveList(Site site) throws Exception;
	
	/**
	 * SI_ID 조회
	 * @param siId 
	 * 
	 * @param site
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchSiId(ScheduleRecord scheduleRecord) throws Exception;
	
	/**
	 * 스케줄 관리 목록 저장
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	public int addScheduleRecord(ScheduleRecord scheduleRecord) throws Exception;

	/**
	 * 스케줄 관리 목록 수정
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	public int editScheduleRecord(ScheduleRecord scheduleRecord) throws Exception;	

	/**
	 * 스케줄 관리 목록 삭제
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	public int deleteScheduleRecord(ScheduleRecord scheduleRecord) throws Exception;	
	
	
	/**
	 * 스케줄 휴점일 리스트 조회
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectScheduleOutdayList(ScheduleRecord scheduleRecord) throws Exception;
	
	/**
	 * 스케줄 관리 휴점일 저장
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	public int addScheduleOutday(ScheduleRecord scheduleRecord) throws Exception;

	/**
	 * 스케줄 관리 휴점일 삭제
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	public int scheduleOutdayDeleteAjax(ScheduleRecord scheduleRecord) throws Exception;	
	
	
	
	List<FlkMap> searchTagList(Site site) throws Exception;

	
}
