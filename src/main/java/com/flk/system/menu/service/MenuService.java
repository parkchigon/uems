package com.flk.system.menu.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.menu.domain.Menu;
import com.flk.system.program.domain.Program;

/**
 * 메뉴 서비스
 *
 */
public interface MenuService {

	/**
	 * 메뉴 목록 조회(ConnectBy)
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchMenuList(Menu vo) throws Exception;
	
	/**
	 * 메뉴 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void addMenuList(Menu vo) throws Exception;

	/**
	 * 메뉴 업데이트
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void modifyMenu(Menu vo) throws Exception;

	/**
	 * 메뉴 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void removeMenu(Menu vo) throws Exception;

	/**
	 * 메뉴 순서 업데이트
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void modifyMenuOrder(Menu vo) throws Exception;

	/**
	 * 메뉴 정보 업데이트 (ServiceConfig 의 HashMap MENU_MAP)
	 * 
	 * @throws Exception
	 */
	void settingMenuMap() throws Exception;
	
	/**
	 * 메뉴권한 삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void removeRoleProgram(Program vo) throws Exception;

	/**
	 * 메뉴권한 등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void addRoleProgram(Program vo) throws Exception;	

}
