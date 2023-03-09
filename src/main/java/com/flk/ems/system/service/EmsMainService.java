package com.flk.ems.system.service;

import java.util.List;
import java.util.Map;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.system.domain.RawData;
import com.flk.ems.system.domain.SystemTagMap;

public interface EmsMainService {

	/**
	 * 실시간 태그 값 조회
	 * 
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectTagValue(RawData rawData) throws Exception;
	
	/**
	 * 실시간 경부 온도 습도 값 조회
	 * 
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectGeyngbuValue(RawData rawData) throws Exception;
	
	/**
	 * 태그 매핑 조회
	 * 
	 * @param systemTagMap
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectTagMapping(SystemTagMap systemTagMap) throws Exception;

	/**
	 * 서브메뉴 리스트 조회
	 * 
	 * @param systemTagMap
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectSubMenuList(SystemTagMap systemTagMap) throws Exception;

	/**
	 * 태그 value 수정
	 * 
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> updateTagValue(Map<String, Object> paramMap) throws Exception;

	/**
	 * 실시간 알람 조회
	 * 
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectAlarmStatus(RawData rawData) throws Exception;

	/**
	 * 알람 리셋
	 * 
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> updateAlarmReset(RawData rawData) throws Exception;

}
