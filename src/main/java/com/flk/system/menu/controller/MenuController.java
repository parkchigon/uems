package com.flk.system.menu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.LogUtil;
import com.flk.common.utility.StringUtils;
import com.flk.system.menu.domain.Menu;
import com.flk.system.menu.domain.MenuTree;
import com.flk.system.menu.service.MenuService;

/**
 * 메뉴 관련 컨트롤러
 *
 */
@Controller
public class MenuController {

	@Autowired
	private MenuService menuService;

	private Logger logger = LogUtil.serviceLog;

	/**
	 * 메뉴 메인 화면 
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/menu/menuList.do")
	public String searchMenuMainList(HttpServletRequest request, Menu vo, ModelMap model) throws Exception {

		return "/uems/system/menu/menuList";
	}

	/**
	 * 메뉴리스트 조회(Connect by, ajax)
	 * 
	 * @param request
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/menu/menuListConnectByAjax.do")
	public ModelAndView searchMenuListByAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody MenuTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		List<FlkMap> menus = menuService.searchMenuList(vo);

		if (CollectionUtils.isNotEmpty(menus)){
			List<MenuTree> treeList = new ArrayList<MenuTree>();
			for(FlkMap menuMap : menus) {
				treeList.add((MenuTree)MethodUtil.convertToOject(menuMap, new MenuTree()));
			}
			modelAndView.addObject("treeList", treeList);
		}
		
		return modelAndView;
	}

	/**
	 * 메뉴 등록 / 수정
	 * 
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/menu/menuRegistExeAjax.do")
	public ModelAndView regAndUpdateMenuByAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody MenuTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		boolean result = true;
		
		try {
			// MenuId로 Insert, Update 구분
			if(StringUtils.isEmpty(vo.getMenuId())){
				vo.setRegId((String) request.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID));
				menuService.addMenuList(vo);
			}else{
				vo.setUpdateId((String) request.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID));
				menuService.modifyMenu(vo);
			}
			
		} catch(Exception e) {
			logger.error("regAndUpdateMenuByAjax error", e);
			result = false;
		}

		if (result) {
			modelAndView.addObject("result", "success");
		} else {
			modelAndView.addObject("result", "fail");
		}

		return modelAndView;
	}

	/**
	 * 메뉴 삭제
	 * 
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/menu/menuDeleteExeAjax.do")
	public ModelAndView removeMenuByAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody MenuTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		boolean result = true;
		try{
			menuService.removeMenu(vo);
		}catch(Exception e){
			logger.error("removeMenuByAjax error", e);
			result = false;
		}

		if (result) {
			modelAndView.addObject("result", "success");
		} else {
			modelAndView.addObject("result", "fail");
		}

		return modelAndView;
	}

	/**
	 * 메뉴 순서 업데이트
	 * 
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/menu/menuOrderUpdateExeAjax.do")
	public ModelAndView modifyMenuOrderByAjax(HttpServletRequest request, HttpServletResponse response , @RequestBody MenuTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		boolean result = true;
		
		try{
			menuService.modifyMenuOrder(vo);
		}catch(Exception e) {
			logger.error("modifyMenuOrderByAjax error", e);
			result = false;
		}

		if (result) {
			modelAndView.addObject("result", "success");
		} else {
			modelAndView.addObject("result", "fail");
		}
		
		return modelAndView;
	}
}
