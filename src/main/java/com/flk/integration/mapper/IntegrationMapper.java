package com.flk.integration.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.integration.domain.Integration;

/**
 *  통합관리
 */
@Repository
public interface IntegrationMapper {

	List<Integration> selectIntegration(Integration integration) throws Exception;

	List<FlkMap> selectIntegrationMapList(Integration integration) throws Exception;

	List<FlkMap> selectTemplateList(Integration integration) throws Exception;

	void insertIntegrationTemplate(Integration integration) throws Exception;

	void deleteIntegrationTemplate(Integration integration) throws Exception;

	void groupConcatMaxLenSet(int groupConcatMaxLen) throws Exception;

	List<FlkMap> selectAlarmStatusList(Integration integration) throws Exception;

	List<FlkMap> selectTagValueList(Integration integration) throws Exception;

	List<FlkMap> selectWeatherStatusList(Integration integration) throws Exception;

	List<FlkMap> selectTomorrowWeatherStatus(Integration integration) throws Exception;
	
}
