package com.flk.system.role.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.LogUtil;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;
import com.flk.system.role.domain.Role;
import com.flk.system.role.domain.RoleTree;
import com.flk.system.role.service.RoleService;

/**
 * 권한 컨트롤러 
 *
 */
@Controller
public class RoleController {

	@Autowired
	private RoleService roleService;

	private Logger logger = LogUtil.serviceLog;

	/**
	 * 권한 조회 화면
	 * 
	 * @param request
	 * @param role
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleList.do")
	public String searchRoleList(HttpServletRequest request, @ModelAttribute("role") Role role, Model model) throws Exception {

		

		
		// 페이징
		PageUtil pageutil = new PageUtil(request, role.getCurrPage(), role.getListSize());
		
		role.setFirstIndex(pageutil.getFirstIndex());
		role.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> roleGroupList = roleService.searchRoleList(role);
		
		pageutil.setList(roleGroupList); // 하단 계산
		role.setPageutil(pageutil);
		
		
		model.addAttribute("resultList", roleGroupList);
		model.addAttribute("roleTotalCnt", roleGroupList.get(0));

		return "/uems/system/role/roleList";
	}

	/**
	 * 권한 추가 화면
	 * 
	 * @param request
	 * @param role
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleRegist.do")
	public String addRoleView(HttpServletRequest request, @ModelAttribute("role") Role role, Model model) throws Exception {

		model.addAttribute("roleId", role.getRoleId());
		model.addAttribute("Role", roleService.searchRoleView(role));
		
		return "/uems/system/role/roleRegist";
	}

	/**
	 * 권한 추가 및 수정 
	 * 
	 * @param request
	 * @param role
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleRegistExe.do")
	public String addRole(HttpServletRequest request, @ModelAttribute("Role") Role role, Model model) throws Exception {

		if (StringUtils.isEmpty(role.getRoleId())) {
			role.setRegId((String) request.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID));
			role.setRoleId(roleService.addRole(role));
			model.addAttribute("resultMsg", "success.common.insert");
		} else {
			role.setUpdateId((String) request.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID));
			roleService.modifyRole(role);
			model.addAttribute("resultMsg", "success.common.update");
		}
		return "forward:/Relay.do?_forward_page=/uems/system/role/roleList.do";
	}

	/**
	 * 권한 삭제 화면
	 * 
	 * @param request
	 * @param role
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleDelete.do")
	public String removeRoleView(HttpServletRequest request, Role role, Model model) throws Exception {

		roleService.removeRole(role);
		model.addAttribute("resultMsg", "success.common.delete");

		return "forward:/Relay.do?_forward_page=/uems/system/role/roleList.do";
	}

	/**
	 * 메뉴 권한 관리
	 * 
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleView.do")
	public String searchMenuRoleView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("Role") Role vo, ModelMap model) throws Exception {

		model.addAttribute("role", roleService.searchRoleView(vo));

		return "/uems/system/role/roleView";
	}

	/**
	 * 프로그램 권한 관리
	 * 
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleProgramView.do")
	public String searchRoleProgramView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("Role") Role vo, ModelMap model) throws Exception {

		model.addAttribute("role", roleService.searchRoleView(vo));

		return "/uems/system/role/roleProgramView";
	}

	/**
	 * 권한 메뉴리스트 조회(Connect by, ajax)
	 * 
	 * @param request
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleMenuListConnectByAjax.do")
	public ModelAndView searchRoleMenuListAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody Role vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		List<FlkMap> roleMenus = roleService.searchRoleMenuList(vo);

		if (CollectionUtils.isNotEmpty(roleMenus)) {

			List<RoleTree> treeList = new ArrayList<RoleTree>();
			for (FlkMap roleMap : roleMenus) {
				treeList.add((RoleTree)MethodUtil.convertToOject(roleMap, new RoleTree()));
			}
			modelAndView.addObject("treeList", treeList);
			
		}
		return modelAndView;
	}

	/**
	 * 권한별 메뉴리스트 조회
	 * 
	 * @param request
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleMenuListAjax.do")
	public ModelAndView searchRoleMenuListByRoleAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody Role vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		List<FlkMap> roleMenus = roleService.searchRoleMenuListByRole(vo);

		if (CollectionUtils.isNotEmpty(roleMenus)) {

			List<RoleTree> treeList = new ArrayList<RoleTree>();
			for (FlkMap roleMap : roleMenus) {
				treeList.add((RoleTree)MethodUtil.convertToOject(roleMap, new RoleTree()));
			}
			modelAndView.addObject("treeList", treeList);
		}
		return modelAndView;
	}

	/**
	 * 권한별 메뉴 등록/수정
	 * 
	 * @param request
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleMenuRegistExeAjax.do")
	public ModelAndView addAndModifyAndRemoveRoleMenuAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody RoleTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		try {
			roleService.addAndModifyAndRemoveRoleMenu(vo);
		} catch (Exception e) {
			logger.error("roleMenuRegist error", e);
		}

		return modelAndView;
	}

	/**
	 * 권한별 프로그램 리스트 조회
	 * 
	 * @param request
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleProgramListAjax.do")
	public ModelAndView searchRoleProgramListAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody Role vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		modelAndView.addObject("roleProgramList", roleService.searchRoleProgramList(vo));

		return modelAndView;
	}

	/**
	 * 권한 프로그램 등록/수정
	 * 
	 * @param request
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/role/roleProgramRegistExeAjax.do")
	public ModelAndView addRoleProgramAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody RoleTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		Role role = new Role(vo.getRoleId(), vo.getMenuId());
		List<Role> rolePrograms = new ArrayList<Role>();
		for (String programId : vo.getProgramIds()) {
			rolePrograms.add(new Role(role.getRoleId(), role.getMenuId(), programId));
		}

		try {
			roleService.addRoleProgram(role, rolePrograms);
		} catch (Exception e) {
			logger.error("roleProgramRegist error {}", vo, e);
		}

		return modelAndView;
	}
}
