package com.flk.system.role.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.role.domain.Role;

/**
 * 권한 Mapper
 *
 */
@Repository
public interface RoleMapper {
	
	/**
	 * 권한 등록
	 * 
	 * @param vo
	 * @return
	 */
	public int insertRole(Role vo);
	
	/**
	 * 권한 리스트 조회 (페이징)
	 * 
	 * @param vo
	 * @return
	 */
	public List<FlkMap> selectRoleList(Role vo);

	
	/**
	 * 권한 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteRole(Role vo);
	
	/**
	 * 프로그램 권한 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteRoleProgram(Role vo);
	
	/**
	 * 프로그램 메뉴 삭제
	 * 
	 * @param vo
	 * @return
	 */
	public int deleteRoleMenu(Role vo);
	
	/**
	 * 메뉴 권한 리스트 조회
	 * 
	 * @param vo
	 * @return
	 */
	public List<FlkMap> selectRoleMenuList(Role vo);
	
	/**
	 * roleId로 메뉴 권한 리스트 조회
	 * 
	 * @param vo
	 * @return
	 */
	public List<FlkMap> selectRoleMenuListByRole(Role vo);
	
	/**
	 * 메뉴 권한 등록
	 * 
	 * @param vo
	 */
	public void insertRoleMenu(Role vo);
	
	/**
	 * 프로그램 권한 리스트 조회
	 * 
	 * @param vo
	 * @return
	 */
	public List<FlkMap> selectRoleProgramList(Role vo);
	
	/**
	 * 프로그램 권한 등록
	 * 
	 * @param vo
	 */
	public void insertRoleProgram(List<Role> vo);
	
	/**
	 * 프로그램 권한 삭제 (Not in)
	 * 
	 * @param vo
	 */
	public void deleteRoleProgramNotIn(Role vo);
	
	/**
	 * 권한 수정
	 * 
	 * @param vo
	 * @return
	 */
	public int updateRole(Role vo);
	
	/**
	 * 권한 순서 수정
	 * 
	 * @param vo
	 * @return
	 */
	public int updateRoleOrderNo(Role vo);
	
	/**
	 * 권한 조회
	 * 
	 * @param vo
	 * @return
	 */
	public Role selectRoleView(Role vo);

}
