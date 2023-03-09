package com.flk.system.role.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.role.domain.Role;

/**
 * 권한 서비스
 *
 */
public interface RoleService {
	
	/**
	 * 권한 등록
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	String addRole(Role vo) throws Exception;

	/**
	 * 권한 수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void modifyRole(Role vo) throws Exception;

	/**
	 * 권한 리스트 조회 (페이징)
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchRoleList(Role vo) throws Exception;
	
	
	/**
	 * 권한 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void removeRole(Role vo) throws Exception;
	
	/**
	 * 메뉴 권한 리스트 조회
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchRoleMenuList(Role vo) throws Exception;
	
	/**
	 * roleId로 메뉴 권한 리스트 조회
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchRoleMenuListByRole(Role vo) throws Exception;
	
	/**
	 * 메뉴 권한 추가/수정/삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void addAndModifyAndRemoveRoleMenu(Role vo) throws Exception;
	
	/**
	 * 프로그램 권한 리스트 조회
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchRoleProgramList(Role vo) throws Exception;
	
	/**
	 * 프로그램 권한 추가 
	 * 
	 * @param role
	 * @param rolePrograms
	 * @throws Exception
	 */
	void addRoleProgram(Role role, List<Role> rolePrograms) throws Exception;
	
	/**
	 * 권한 조회
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	Role searchRoleView(Role vo) throws Exception;
	
}
