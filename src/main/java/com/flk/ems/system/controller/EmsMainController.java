package com.flk.ems.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.StringUtils;
import com.flk.ems.build.service.BuildService;
import com.flk.ems.system.domain.RawData;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.service.EmsMainService;
import com.flk.mng.user.domain.Mng;

/**
 * 대쉬보드(로그인 후 첫 화면)
 *
 */
@Controller
public class EmsMainController {
	
	@Autowired
	private EmsMainService emsMainService;
	
	@Autowired
	private BuildService buildService;

	/**
	 * 메인화면(EMS) > 빙축열
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/emsMain.do")
	public String searchMainView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS01);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
				
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS01);	// 빙축열
		
		return "/ems/system/emsMain";
	}

	/**
	 * 실시간 태그 값 조회
	 * 
	 * @param request
	 * @param response
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/selectTagValueAjax.do")
	@ResponseBody
	public Map<String, Object> selectTagValueAjax(HttpServletRequest request, HttpServletResponse response, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<FlkMap> tagList = emsMainService.selectTagValue(rawData);
		resultMap.put("tagList", tagList);
		
		return resultMap;
	}
	
	
	/**
	 * 실시간 태그 값 조회
	 * 
	 * @param request
	 * @param response
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/selectGeyngbuValueAjax.do")
	@ResponseBody
	public Map<String, Object> selectGeyngbuValueAjax(HttpServletRequest request, HttpServletResponse response, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<FlkMap> tagGeyngbuList = emsMainService.selectGeyngbuValue(rawData);
		resultMap.put("tagGeyngbuList", tagGeyngbuList);
		
		return resultMap;
	}
	
	/**
	 * 태그 value 수정
	 * 
	 * @param request
	 * @param response
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/updateTagValueAjax.do")
	@ResponseBody
	public Map<String, Object> updateTagValueAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		paramMap.put("mngId", mng.getMngId());
		
		// 제어 요청 위치 (0:현장 1:통합)
		if(StringUtils.equals(mng.getRoleId(), Constants.ROL_0000000000000001) || StringUtils.equals(mng.getRoleId(), Constants.ROL_0000000000000002)) {
			paramMap.put("controlPlace", "0");		// 현장시스템 > 구축자, 사용자 권한일 경우
		} else { 	
			paramMap.put("controlPlace", "1");		// 통합시스템 > 운영자, 최고관리자일 경우
		}
		resultMap = emsMainService.updateTagValue(paramMap);
		
		return resultMap;
	}
	
	
	/**
	 * 실시간 알람 조회
	 * 
	 * @param request
	 * @param response
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/selectAlarmStatusAjax.do")
	@ResponseBody
	public Map<String, Object> selectAlarmStatusAjax(HttpServletRequest request, HttpServletResponse response, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<FlkMap> tagList = emsMainService.selectAlarmStatus(rawData);
		resultMap.put("tagList", tagList);
		
		return resultMap;
	}
	
	
	/**
	 * 알람 리셋
	 * 
	 * @param request
	 * @param response
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/updateAlarmResetAjax.do")
	@ResponseBody
	public Map<String, Object> updateAlarmResetAjax(HttpServletRequest request, HttpServletResponse response, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = emsMainService.updateAlarmReset(rawData);
		return resultMap;
	}
	
	
	/**
	 * 메인화면(EMS) > 열량
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/heat.do")
	public String searchHeatView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS06);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS06);		// 열량
		
		return "/ems/system/heat";
	}	
	
	/**
	 * 메인화면(EMS) > 보일러
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/boiler.do")
	public String searchBoilerView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS05);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS05);		// 보일러
		
		return "/ems/system/boiler";
	}	
	
	
	
	/**
	 * 메인화면(EMS) > 냉동기A
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/fridgeA.do")
	public String searchFridgeAView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS01);	// 빙축열 탭 (좌측화면)

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		systemTagMap.setSubmenuId(Constants.SubMenu.SYS04);	// 빙축열(계통도) / 냉동기A
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS04);		// 냉동기A
		
		return "/ems/system/fridgeA";
	}
	
	
	/**
	 * 메인화면(EMS) > 냉동기B
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/fridgeB.do")
	public String searchFridgeBView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS08);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS08);		// 냉동기B
		
		return "/ems/system/fridgeB";
	}	
	
	
	/**
	 * 메인화면(EMS) > 흡수식냉동기
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/absorbFridge.do")
	public String searchAbsorbFridgeView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS07);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS07);		// 흡수식냉동기
		
		return "/ems/system/absorbFridge";
	}	
	
	
	/**
	 * 메인화면(EMS) > 상온냉동기
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/roomtempFridge.do")
	public String searchRoomtempFridgeView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS09);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS09);		// 상온냉동기
		
		return "/ems/system/roomtempFridge";
	}
	
	/**
	 * 메인화면(EMS) > 흡수식냉동기B
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/absorbFridgeB.do")
	public String searchAbsorbFridgeBView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS01);	// 빙축열 탭 (좌측화면)

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		systemTagMap.setSubmenuId(Constants.SubMenu.SYS10);	// 빙축열(계통도) / 냉동기A
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS10);		// 냉동기A
		
		return "/ems/system/absorbFridgeB";
	}
	
	/**
	 * 메인화면(EMS) > 흡수식냉온수기
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/absorbFridgeC.do")
	public String searchAbsorbFridgeCView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS11);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS11);		// 흡수식냉동기C
		
		return "/ems/system/absorbFridgeC";
	}
	
	/**
	 * 메인화면(EMS) > 냉동기C
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/system/fridgeC.do")
	public String searchFridgeCView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS12);

		// 설비제어 > 탭 메뉴 구성
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		model.addAttribute("subMenu", Constants.SubMenu.SYS12);		// 냉동기B
		
		return "/ems/system/fridgeC";
	}	
}
