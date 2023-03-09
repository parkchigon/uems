package com.flk.ems.alarm.service;

import java.util.List;
import java.util.Map;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.alarm.domain.Alarm;

public interface AlarmService {

	/**
	 * 푸터 > 경보 알람 정보 조회
	 * 
	 * @param alarm
	 * @return
	 * @throws Exception
	 */
	Alarm selectAlarmFooter(Alarm alarm) throws Exception;

	/**
	 * 경보리스트조회
	 * 
	 * @param alarm
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectAlarmList(Alarm alarm) throws Exception;
	
	/**
	 * 경보리스트 상태별 카운트
	 *  
	 * @param alarm
	 * @return
	 * @throws Exception
	 */
	Alarm selectAlarmCountForStatus(Alarm alarm) throws Exception;
	
	/**
	 * 경보리스트 상태값 변경
	 * @param alarm
	 * @return
	 * @throws Exception
	 */
	void updateAlarmStatusCd(Alarm alarm) throws Exception;
	
	/**
	 * 알람 value 수정
	 * 
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> updateAlarmValue(Map<String, Object> paramMap) throws Exception;
}
