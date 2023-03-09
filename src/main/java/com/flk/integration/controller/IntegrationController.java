package com.flk.integration.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.integration.domain.Integration;
import com.flk.integration.service.IntegrationService;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.user.domain.Mng;

/**
 * 통합관리
 *
 */
@Controller
public class IntegrationController {
	
	@Autowired
	private IntegrationService integrationService;
	
	@Autowired
	private SiteGroupService siteGroupService;
	
	/**
	 * 통합센터 진입
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/main.do")
	public String integrationMap(HttpServletRequest request, HttpServletResponse response, ModelMap model, Integration integration, HttpSession session) throws Exception {
		
		settingMngId(request, integration);
		
		// 미니계통도 Template 조회
		List<FlkMap> templateList = integrationService.selectTemplateList(integration);
		model.addAttribute("templateList", templateList);
		
		selectTypeDataList(integration, model);
		
		return "/uems/integration/integrationMap";
	}
	
	/**
	 * 지도 API AJAX
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/integrationMapAjax.do")
	@ResponseBody
	public Map<String, Object> selectIntegrationMapAjax(HttpServletRequest request, HttpServletResponse response, Integration integration) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		settingMngId(request, integration);
		
		resultMap = integrationService.selectIntegrationMapList(integration, resultMap);
		
		return resultMap;
	}
	
	/**
	 * 구글지도 Infowindow 매핑 URL 정보 session 세팅
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/integration/setSiteSession.do")
	public String setSiteSession(HttpServletRequest request, HttpServletResponse response, Integration integration, HttpSession session, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		
		String urlType = integration.getInfoType();
		String page = "";
		
		Mng mng = new Mng();
		mng.setMngId(integration.getMngId());
		mng.setSiteId(integration.getInfoSiteId());
		
		List<Mng> siteList = integrationService.selectSiteList(mng, session);
		if (siteList.size() > 0) {
			if ("ems".equals(urlType)) {
				page = "forward:/Relay.do?_forward_page=/ems/system/emsMain.do";
			} else if ("alarm".equals(urlType)) {
				page = "forward:/Relay.do?_forward_page=/ems/alarm/alarmList.do";
			} else if ("trend".equals(urlType)) {
				page = "forward:/Relay.do?_forward_page=/ems/trend/tagMonitoring.do";
			} else if ("setting".equals(urlType)) {
				page = "forward:/Relay.do?_forward_page=/ems/setting/settingView.do";
			}
		}
		
		return page;
	}
	
	/**
	 * 통합센터 Template 추가 AJAX
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/addIntegrationTemplateAjax.do")
	@ResponseBody
	public Map<String, Object> addIntegrationTemplateAjax(HttpServletRequest request, HttpServletResponse response, Integration integration) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		settingMngId(request, integration);
		
		resultMap = integrationService.insertIntegrationTemplate(integration, resultMap);
		
		return resultMap;
	}
	
	/**
	 * 통합센터 Template 삭제 AJAX
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/deleteIntegrationTemplateAjax.do")
	@ResponseBody
	public Map<String, Object> deleteIntegrationTemplateAjax(HttpServletRequest request, HttpServletResponse response, Integration integration) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		settingMngId(request, integration);
		
		resultMap = integrationService.deleteIntegrationTemplate(integration, resultMap);
		
		return resultMap;
	}
	
	/**
	 * 미니계통도 기본 화면
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setDefaultPage.do")
	public String setDefaultPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/integration/miniDiagramType/defaultTemplate";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_A)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeAPage.do")
	public String setTypeAPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeA";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_B)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeBPage.do")
	public String setTypeBPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);		
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeB";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_C)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeCPage.do")
	public String setTypeCPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeC";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_D)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeDPage.do")
	public String setTypeDPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeD";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_E)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeEPage.do")
	public String setTypeEPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeE";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_F)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeFPage.do")
	public String setTypeFPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeF";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_G)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeGPage.do")
	public String setTypeGPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeG";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_H)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeHPage.do")
	public String setTypeHPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeH";
	}
	
	/**
	 * 미니계통도 기본 화면 (TYPE_I)
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/setTypeIPage.do")
	public String setTypeIPage(HttpServletRequest request, HttpServletResponse response, Integration integration, ModelMap model) throws Exception {
		
		settingMngId(request, integration);
		selectTypeDataList(integration, model);
		
		return "/uems/integration/miniDiagramType/typeI";
	}
	
	/**
	 * MngID Setting
	 * @param request
	 * @param integration
	 * @throws Exception
	 */
	public void settingMngId(HttpServletRequest request, Integration integration) throws Exception {
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		integration.setMngId(mng.getMngId());
		integration.setRegId(mng.getMngId());
		integration.setUpdateId(mng.getMngId());
	}
	
	/**
	 * 미니계통도 및 그룹 리스트 조회 공통
	 * @param integration
	 * @param model
	 * @throws Exception
	 */
	public void selectTypeDataList(Integration integration, ModelMap model) throws Exception {
		// 미니계통도
		List<Integration> integrationList = integrationService.selectIntegration(integration);
		model.addAttribute("integrationList", integrationList);
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
	}

	/**
	 * 실시간 알람 조회
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/alarmStatusAjax.do")
	@ResponseBody
	public Map<String, Object> selectAlarmStatusAjax(HttpServletRequest request, HttpServletResponse response, Integration integration) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//settingMngId(request, integration);
		
		resultMap = integrationService.selectAlarmStatus(integration, resultMap);
		
		return resultMap;
	}
	
	/**
	 * 10분 단위 지점 날씨 조회
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/weatherStatusAjax.do")
	@ResponseBody
	public Map<String, Object> selectWeatherStatusAjax(HttpServletRequest request, HttpServletResponse response, Integration integration) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		settingMngId(request, integration);
		
		resultMap = integrationService.selectWeatherStatus(integration, resultMap);
		
		return resultMap;
	}
	
	/**
	 * 실시간 태그값 조회
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/selectTagValueAjax.do")
	@ResponseBody
	public Map<String, Object> selectTagValueAjax(HttpServletRequest request, HttpServletResponse response, Integration integration) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		settingMngId(request, integration);
		
		resultMap = integrationService.selectTagValue(integration, resultMap);
		
		return resultMap;
	}
	
	/**
	 * 내일 날씨 조회
	 * 
	 * @param request
	 * @param response
	 * @param integration
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/integration/tomorrowWeatherStatusAjax.do")
	@ResponseBody
	public Map<String, Object> selectTomorrowWeatherStatusAjax(HttpServletRequest request, HttpServletResponse response, Integration integration) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		settingMngId(request, integration);
		
		resultMap = integrationService.selectTomorrowWeatherStatus(integration, resultMap);
		
		return resultMap;
	}
}
