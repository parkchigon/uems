package com.flk.system.menu.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.menu.domain.Menu;
import com.flk.system.program.domain.Program;

/**
 * 메뉴 Mapper
 *
 */
@Repository
public interface MenuMapper {

	/**
	 * 메뉴 목록 조회(ConnectBy)
	 * 
	 * @param vo
	 * @return
	 */
	List<FlkMap> selectMenuList(Menu vo);

	/**
	 * 메뉴 등록
	 * 
	 * @param vo
	 */
	void insertMenu(Menu vo);
	
	/**
	 * 메뉴 업데이트
	 * 
	 * @param vo
	 */
	void updateMenu(Menu vo);

	/**
	 * 메뉴 삭제
	 * 
	 * @param vo
	 */
	void deleteMenu(Menu vo);
	
	/**
	 * 메뉴ID로 메뉴프로그램 삭제 
	 * 
	 * @param vo
	 */
	void deleteMenuProgramByMenuId(Menu vo);

	/**
	 * 메뉴 순서 업데이트
	 * 
	 * @param vo
	 */
	void updateMenuOrder(Menu vo);
	
	/**
	 * 메뉴 순서 자동 업데이트
	 * 
	 * @param vo
	 */
	void updateMenuOrderAuto(Menu vo);

	/**
	 * 권한 조회
	 * 
	 * @return
	 */
	List<FlkMap> selectRoleList();

	/**
	 * 사이트 리스트 조회
	 * 
	 * @param vo
	 * @return
	 */
	List<FlkMap> selectSiteList(Menu vo);

	/**
	 * 사이트 메뉴 리스트 조회
	 * 
	 * @param vo
	 * @return
	 */
	List<FlkMap> selectSiteMenuList(Menu vo);

	/**
	 * 권한 프로그램 리스트 조회
	 * 
	 * @param vo
	 * @return
	 */
	List<FlkMap> selectSiteProgramList(Menu vo);

	/**
	 * 메뉴권한 삭제
	 * 
	 * @param vo
	 */
	public void deleteRoleProgram(Program vo);

	/**
	 * 메뉴권한 등록
	 * 
	 * @param vo
	 */
	public void insertRoleProgram(Program vo);

	/**
	 * 메뉴권한 조회
	 * 
	 * @param vo
	 * @return
	 */
	public List<String> selectRoleMenuList(Menu vo);

}
