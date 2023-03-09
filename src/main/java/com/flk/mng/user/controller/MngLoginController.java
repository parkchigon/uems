package com.flk.mng.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flk.common.service.ServiceConfig;
import com.flk.mng.user.domain.Mng;
import com.flk.mng.user.service.MngService;

/**
 * 
 * 로그인 컨트롤러
 *
 */
@Controller
public class MngLoginController {

	@Autowired
	private MngService mngService;
	
	/**
	 * 로그인 페이지
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login/login.do")
	public String loginView() throws Exception {
		return "/login/login";
	}
	
	/**
	 * 로그 아웃
	 * @param session
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "/login/logout.do")
    public String logoutView(HttpSession session) throws Exception {

        session.invalidate();

        return "forward:/Relay.do?_forward_page=/login/login.do";
    }	
	
    /**
     * 로그인 처리
     * @param session
     * @param response
     * @param vo
     * @return
     * @throws Exception
     */
	@RequestMapping("/login/loginProcessAjax.do")	
	@SuppressWarnings("rawtypes")
	public ModelAndView mngListAjax(HttpSession session, HttpServletResponse response, @RequestBody Mng vo) throws Exception {
 
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		int resultCode = mngService.searchMngViewByLogin(session, vo);
		
		modelAndView.addObject("resultCode", resultCode);
		
		String roleId = (String) session.getAttribute("ROLE_ID");
		modelAndView.addObject("roleId", roleId);

		if(resultCode < 1) {
			
			HashMap menuMap = (HashMap) ServiceConfig.MENU_MAP.get(roleId);
			HashMap siteMap = (HashMap) menuMap.get("/uems/");
			List _programList = (List)siteMap.get( "MENU_LIST_MAP" ); // 프로그램리스트
			Object[] _objProgramList = _programList.toArray();
			
			siteMap = (HashMap) siteMap.get("MENU_MAP");
			ArrayList _menuList = (ArrayList)siteMap.get("subNodeList"); // 메뉴리스트
			HashMap _menuMap = (HashMap)_menuList.get(0);
			String redirectUrl = getMenuUrl( _menuMap, _objProgramList );
			modelAndView.addObject("redirectUrl", redirectUrl);
			
		}
		
		return modelAndView;
	}
	
	@SuppressWarnings("rawtypes")
	private String getMenuUrl(HashMap menuMap, Object[] programList) {

		String programUrl = "";
		ArrayList subMenuList = (ArrayList) menuMap.get("subNodeList");
		HashMap subMenuMap = new HashMap();
		if (subMenuList.size() > 0) {
			subMenuMap = (HashMap) subMenuList.get(0);
			String menuId = (String) subMenuMap.get("menuId");
			for (int i = 0; i < programList.length; i++) {
				Map programMap = (Map) programList[i];
				String programMenuId = (String) programMap.get("menuId");
				if (menuId.equals(programMenuId) && "Y".equals((String) programMap.get("startProgramYn"))) {
					programUrl = (String) programMap.get("programUrl");
					break;
				}
			}
		} else {
			programUrl = (String) menuMap.get("programUrl");
		}

		if (programUrl == null || "".equals(programUrl))
			programUrl = getMenuUrl(subMenuMap, programList);

		return programUrl;
	}
    
}
