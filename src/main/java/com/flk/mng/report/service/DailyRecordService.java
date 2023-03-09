package com.flk.mng.report.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.DailyRecord;
import com.flk.mng.report.domain.Maintenance;

public interface DailyRecordService {

	/**
	 * 보고서관리 > 상황일지 관리 리스트 조회
	 * @param dailyRecord
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectDailyRecordList(DailyRecord dailyRecord) throws Exception;
	
	/**
	 * 보고서관리 > 상황일지 관리 저장
	 * @param dailyRecord
	 * @return
	 * @throws Exception
	 */
	public int addDailyRecord(DailyRecord dailyRecord) throws Exception;
	
	public Map<String, Object> createSituationReport(HttpServletRequest request, DailyRecord dailyRecord) throws Exception;
	
}
