package com.flk.mng.miniDiagram.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.mng.miniDiagram.domain.MiniDiagram;
import com.flk.mng.miniDiagram.service.MiniDiagramService;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.user.domain.Mng;

/**
 * 관리 ( 미니계통도 관리 )
 *
 */
@Controller
public class MiniDiagramController {
	
	@Autowired
	private MiniDiagramService miniDiagramService;
	
	@Autowired
	private SiteGroupService siteGroupService;
	
	/**
	 * 미니 계통도 관리 조회
	 * @param request
	 * @param response
	 * @param miniDiagram
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/miniDiagram/miniDiagramList.do")
	public String searchMiniDiagram(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("miniDiagram") MiniDiagram miniDiagram, ModelMap model) throws Exception {
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		// 미니계통도 관리
		List<FlkMap> miniDiagramList = miniDiagramService.searchMiniDiagram(miniDiagram);
		model.addAttribute("miniDiagramList", miniDiagramList);
		
		return "/uems/mng/miniDiagram/miniDiagramList";
	}
	
	/**
	 * 미니 계통도 관리 설정화면
	 * @param request
	 * @param response
	 * @param miniDiagram
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/miniDiagram/settingMiniDiagram.do")
	public String setMiniDiagramView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("miniDiagram") MiniDiagram miniDiagram, ModelMap model) throws Exception {
		
		// 1. 좌측 테크 영역 가져오기
		List<FlkMap> componentNameList = miniDiagramService.searchComponentNameList(miniDiagram);
		model.addAttribute("componentNameList", componentNameList);
		
		// 2. 태그 리스트 조회
		List<FlkMap> tagList = miniDiagramService.selectTagList(miniDiagram); 
		model.addAttribute("tagList", tagList);
		
		return "/uems/mng/miniDiagram/miniDiagramSet";
	}
	
	
	/**
	 * 선택한 Type의 화면 구성
	 * @param request
	 * @param response
	 * @param miniDiagram
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/miniDiagram/selectComponetListAjax.do")
	@ResponseBody
	public Map<String, Object> selectComponetListAjax(HttpServletRequest request, HttpServletResponse response, MiniDiagram miniDiagram) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 1. 좌측 테크 영역 가져오기
		List<FlkMap> componentNameList = miniDiagramService.searchComponentNameList(miniDiagram);
		resultMap.put("componentNameList", componentNameList);
		
		// 2. 태그 리스트 조회
		List<FlkMap> tagList = miniDiagramService.selectTagList(miniDiagram); 
		resultMap.put("tagList", tagList);
		
		return resultMap;
	}
	
	/**
	 * 미니계통도 태그 매핑
	 * @param request
	 * @param response
	 * @param miniDiagram
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/miniDiagram/miniDiagramSetRegistExe.do")
	public String addDiagramSetL(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("miniDiagram") MiniDiagram miniDiagram) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		miniDiagram.setRegId(loginVo.getMngId());
		miniDiagram.setUpdateId(loginVo.getMngId());
		miniDiagramService.insertMiniDiagramTagMapping(miniDiagram);
		
		return "forward:/Relay.do?_forward_page=/uems/mng/miniDiagram/miniDiagramList.do";
	}
	
	/**
	 * 태그 매핑 조회
	 * @param request
	 * @param response
	 * @param miniDiagram
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/miniDiagram/selectTagMappingListAjax.do")
	@ResponseBody
	public Map<String, Object> selectTagMappingListAjax(HttpServletRequest request, HttpServletResponse response, MiniDiagram miniDiagram) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = miniDiagramService.selectSystemTagMapping(miniDiagram);
		return resultMap;
	}
	
}
