package com.flk.ems.system.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.system.domain.RawData;
import com.flk.ems.system.domain.SystemTagMap;

@Repository
public interface EmsMainMapper {

	/**
	 * 실시간 태그 값 조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagValue(RawData rawData);
	
	/**
	 * 실시간 경부 온도 습도 값 조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectGeyngbuValue(RawData rawData);

	/**
	 * 태그 매핑 조회
	 * 
	 * @param systemTagMap
	 * @return
	 */
	List<FlkMap> selectTagMapping(SystemTagMap systemTagMap);

	/**
	 * 서브메뉴 리스트 조회
	 * 
	 * @param systemTagMap
	 * @return
	 */
	List<FlkMap> selectSubMenuList(SystemTagMap systemTagMap);

	/**
	 * 실시간 알람 조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectAlarmStatus(RawData rawData);

	/**
	 * 알람 리셋
	 * 
	 * @param rawData
	 * @return
	 */
	int updateAlarmReset(RawData rawData);

	/**
	 * 제어이력 등록
	 * 
	 * @param param
	 * @return
	 */
	int insertControlHistory(Map<String, Object> param);

}
