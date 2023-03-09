package com.flk.system.role.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.CeWebConstants;
import com.flk.system.menu.service.MenuService;
import com.flk.system.role.domain.Role;
import com.flk.system.role.mapper.RoleMapper;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 권한 서비스
 *
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	
	@Resource(name = "roleMapper")
	private RoleMapper roleMapper;
	
	@Resource(name = "rolegrpIdGnrService")
	private EgovIdGnrService roleIdGnrService;
	
	@Autowired
	private MenuService menuService;

	@Override
	@Transactional
	public String addRole(Role vo) throws Exception {
		String roleid = roleIdGnrService.getNextStringId();
		vo.setRoleId(roleid);
		roleMapper.insertRole(vo);
		roleMapper.updateRoleOrderNo(vo);
		
		return roleid;
	}

	@Override
	public List<FlkMap> searchRoleList(Role vo) throws Exception {
		return roleMapper.selectRoleList(vo);
	}
	
	
	@Override
	@Transactional
	public void modifyRole(Role vo) throws Exception {
		roleMapper.updateRole(vo);
		roleMapper.updateRoleOrderNo(vo);
	}
	
	@Override
	@Transactional
	public void removeRole(Role vo) throws Exception {
		roleMapper.deleteRoleProgram(vo);
		roleMapper.deleteRoleMenu(vo);
		roleMapper.deleteRole(vo);
	}
	
	@Override
	public List<FlkMap> searchRoleMenuList(Role vo) throws Exception {
		vo.setParentmenuId(StringUtils.defaultIfEmpty(vo.getParentmenuId(), CeWebConstants.TOP_MENU_ID));
		return roleMapper.selectRoleMenuList(vo);
	}
	
	@Override
	public List<FlkMap> searchRoleMenuListByRole(Role vo) throws Exception {
		vo.setParentmenuId(StringUtils.defaultIfEmpty(vo.getParentmenuId(), CeWebConstants.TOP_MENU_ID));
		return roleMapper.selectRoleMenuListByRole(vo);
	}
	
	@Override
	@Transactional
	public void addAndModifyAndRemoveRoleMenu(Role vo) throws Exception {
		
		/**
		 * 기존 RoleMenu 데이터를 삭제하고 새로 등록함. 
		 */
		// 메뉴 권한 삭제
		roleMapper.deleteRoleMenu(vo);
		
		// 등록 할 메뉴가 있을 때만 쿼리 실행
		if (CollectionUtils.isNotEmpty(vo.getMenuIds())){
			// 등록되는 메뉴를 제외한 나머지 프로그램 권한 삭제
			roleMapper.deleteRoleProgramNotIn(vo);
			
			roleMapper.insertRoleMenu(vo);
		} else {
			// 프로그램 권한 전체 삭제
			roleMapper.deleteRoleProgram(vo);
		}
		
		/* 메뉴 맵을 갱신함. */
		menuService.settingMenuMap();
	}
	
	@Override
	public List<FlkMap> searchRoleProgramList(Role vo) throws Exception {
		return roleMapper.selectRoleProgramList(vo);
	}
	
	@Override
	@Transactional
	public void addRoleProgram(Role role, List<Role> rolePrograms) throws Exception {
		
		/**
		 * 기존 RoleMenu 데이터를 삭제하고 새로 등록함. 
		 */
		roleMapper.deleteRoleProgram(role);
		if ( CollectionUtils.isNotEmpty(rolePrograms) ) {
			roleMapper.insertRoleProgram(rolePrograms);
		}
		
		/* 메뉴 맵을 갱신함. */
		menuService.settingMenuMap();
	}
	@Override
	public Role searchRoleView(Role vo) throws Exception {
		return roleMapper.selectRoleView(vo);
	}
}
