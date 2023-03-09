package com.flk.ems.alarm.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.alarm.domain.Alarm;

@Repository
public interface AlarmMapper {

	/**
	 * 푸터 > 경보 알람 조회
	 * 
	 * @param alarm
	 * @return
	 */
	Alarm selectAlarmFooter(Alarm alarm);

	/**
	 * 경보 리스트 조회
	 * 
	 * @param alarm
	 * @return
	 */
	List<FlkMap> selectAlarmList(Alarm alarm);
	
	
	/**
	 * 경보리스트 상태값별 카운트 조회
	 * 
	 * @param alarm
	 * @return
	 */
	Alarm selectAlarmCountForStatus(Alarm alarm);
	
	
	/**
	 * 경보리스트 상태값 변경
	 * @param alarm
	 * @return
	 */
	void updateAlarmStatusCd(Alarm alarm);
	
	/**
	 *  경보리스트 상태값 변경
	 * 
	 * @param param
	 * @return
	 */
	Integer updatesAlarmStatusCd(Map<String, Object> param);
}

