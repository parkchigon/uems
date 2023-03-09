package com.flk.integration.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.integration.domain.Integration;
import com.flk.mng.user.domain.Mng;

/**
 *  통합관리
 */
public interface IntegrationService {

	/**
	 * 통합관리 (진입)
	 * @return
	 * @throws Exception
	 */
	List<Integration> selectIntegration(Integration integration) throws Exception;

	/**
	 * 통합관리 (지도)
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectIntegrationMapList(Integration integration, Map<String, Object> resultMap) throws Exception;

	/**
	 * 통합관리 (Template 조회)
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectTemplateList(Integration integration) throws Exception;

	/**
	 * 통합센터 Template 추가
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> insertIntegrationTemplate(Integration integration, Map<String, Object> resultMap) throws Exception;

	/**
	 * 통합센터 Template 삭제
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> deleteIntegrationTemplate(Integration integration, Map<String, Object> resultMap) throws Exception;

	/**
	 * 실시간 알람 조회
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectAlarmStatus(Integration integration, Map<String, Object> resultMap) throws Exception;

	/**
	 * 실시간 태그값 조회
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectTagValue(Integration integration, Map<String, Object> resultMap) throws Exception;

	/**
	 * 구글지도 Infowindow 매핑 URL 정보 조회
	 * @param session 
	 * @return
	 * @throws Exception
	 */
	List<Mng> selectSiteList(Mng mng, HttpSession session) throws Exception;

	/**
	 * 10분 단위 지점 날씨 조회
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectWeatherStatus(Integration integration, Map<String, Object> resultMap) throws Exception;

	/**
	 * 내일 날씨 조회
	 * @param integration
	 * @param resultMap
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectTomorrowWeatherStatus(Integration integration, Map<String, Object> resultMap)  throws Exception;

}
