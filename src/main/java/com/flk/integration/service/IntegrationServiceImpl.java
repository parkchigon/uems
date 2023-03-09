package com.flk.integration.service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.integration.domain.Integration;
import com.flk.integration.domain.TemplateType;
import com.flk.integration.mapper.IntegrationMapper;
import com.flk.mng.user.domain.Mng;
import com.flk.mng.user.mapper.MngMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;


/**
 *  통합관리
 */
@Service
public class IntegrationServiceImpl implements IntegrationService {
	
	@Autowired
	IntegrationMapper integrationMapper;

	@Autowired
	private MngMapper mngMapper;
	/**
	 * 통합관리 (진입)
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Integration> selectIntegration(Integration integration) throws Exception {
		
		// mysql set session variable
		integrationMapper.groupConcatMaxLenSet(50240);
		
		// 미니계통도
		List<Integration> integrationList = integrationMapper.selectIntegration(integration);
		for ( Integration list : integrationList ) {
			setComponentValue(list);
		}
		
		return integrationList;
	}
	
	/**
	 * componentValue JSON TO OBJECT
	 * @param integration
	 */
	public void setComponentValue(Integration integration){
		StringBuffer buffer = new StringBuffer();
		String templateId = integration.getTemplateID();
		buffer.append("[{");
		buffer.append(integration.getComponentValue());
		buffer.append("}]");
		String componentValue = String.valueOf(buffer);
		
		setTemplateTypeList(integration, templateId, componentValue);
	}
	
	/**
	 * componentId , tagValue 매핑
	 * @param integration
	 * @param templateId
	 * @param componentValue
	 */
	public void setTemplateTypeList(Integration integration, String templateId, String componentValue){
		Gson gson = new Gson();
		Type templateHType = new TypeToken<ArrayList<TemplateType>>(){}.getType();
		List<TemplateType> templateList = gson.fromJson(componentValue, templateHType);
		integration.setTempList(templateList);
	}

	/**
	 * 통합관리 (지도)
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> selectIntegrationMapList(Integration integration, Map<String, Object> resultMap) throws Exception {
		
		List<FlkMap> integrationMapList = integrationMapper.selectIntegrationMapList(integration); 
		resultMap.put("mapList", integrationMapList);
		
		return resultMap;
	}

	/**
	 * 통합관리 (Template 조회)
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectTemplateList(Integration integration) throws Exception {
		return integrationMapper.selectTemplateList(integration);
	}

	/**
	 * 통합센터 Template 추가
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> insertIntegrationTemplate(Integration integration, Map<String, Object> resultMap) throws Exception {
		
		// 통합센터 Template 추가
		integrationMapper.insertIntegrationTemplate(integration);
		
		List<FlkMap> templateList = integrationMapper.selectTemplateList(integration); 
		resultMap.put("templateList", templateList);
		
		return resultMap;
	}

	/**
	 * 통합센터 Template 삭제
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> deleteIntegrationTemplate(Integration integration, Map<String, Object> resultMap) throws Exception {
			
		// 기존 Template 삭제
		integrationMapper.deleteIntegrationTemplate(integration);

		return resultMap;
	}

	/**
	 * 실시간 알람 조회
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> selectAlarmStatus(Integration integration, Map<String, Object> resultMap) throws Exception {
			
		List<FlkMap> selectAlarmStatusList = integrationMapper.selectAlarmStatusList(integration); 
		resultMap.put("alarmList", selectAlarmStatusList);
		
		return resultMap;
	}

	/**
	 * 실시간 태그값 조회
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> selectTagValue(Integration integration, Map<String, Object> resultMap) throws Exception {
		
		List<FlkMap> selectTagValueList = integrationMapper.selectTagValueList(integration);
		resultMap.put("tagList", selectTagValueList);
		
		// 통신여부 판단을 위한 tagValue 등록일시 지점별로 관리
		List<Map<String, Object>> regList = new ArrayList<Map<String, Object>>();
		
		String siteCd = "";
		if(selectTagValueList.size() > 0) {
			for(FlkMap map : selectTagValueList) {
				if(!StringUtils.equals(siteCd, (String) map.get("siteCd"))) {
					Map<String, Object> regMap = new HashMap<String, Object>();
					siteCd = (String) map.get("siteCd");
					regMap.put("siteCd", map.get("siteCd"));
					regMap.put("regDate", map.get("regDate"));
					regMap.put("diffSec", map.get("diffSec"));
					regList.add(regMap);
				}
			}
		}
		
		resultMap.put("tagList", selectTagValueList);
		resultMap.put("regList", regList);
		
		return resultMap;
	}

	@Override
	public List<Mng> selectSiteList(Mng mng, HttpSession session) throws Exception {
		List<Mng> siteList = mngMapper.selectMngSiteList(mng);
		for (Mng list : siteList) {
			if (mng.getSiteId().equals(list.getSiteId())) {
				session.setAttribute("SITE_INFO", list);
			}
		}
		return siteList;
	}

	/**
	 * 10분 단위 지점 날씨 조회
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> selectWeatherStatus(Integration integration, Map<String, Object> resultMap) throws Exception {
			
		List<FlkMap> selectWeatherStatusList = integrationMapper.selectWeatherStatusList(integration); 
		resultMap.put("weatherList", selectWeatherStatusList);
		
		return resultMap;
	}

	/**
	 * 내일 날씨 조회
	 */
	@Override
	public Map<String, Object> selectTomorrowWeatherStatus(Integration integration, Map<String, Object> resultMap) throws Exception {
		List<FlkMap> selectWeatherStatusList = integrationMapper.selectTomorrowWeatherStatus(integration); 
		resultMap.put("weatherList", selectWeatherStatusList);
		
		return resultMap;
	}
	
	
	
}
