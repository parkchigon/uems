package com.flk.system.menu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.CeWebConstants;
import com.flk.common.service.ServiceConfig;
import com.flk.system.menu.domain.Menu;
import com.flk.system.menu.mapper.MenuMapper;
import com.flk.system.program.domain.Program;
import com.flk.system.role.domain.Role;
import com.flk.system.role.mapper.RoleMapper;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 메뉴 서비스 
 *
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Resource(name = "menuMapper")
	private MenuMapper menuMapper;
	
	@Resource(name = "roleMapper")
	private RoleMapper roleMapper;

	@Resource(name = "menuIdGnrService")
	private EgovIdGnrService menuIdGnrService;
	
	@Override
	public List<FlkMap> searchMenuList(Menu vo) throws Exception {

		vo.setParentmenuId(StringUtils.defaultIfEmpty(vo.getParentmenuId(), CeWebConstants.TOP_MENU_ID));

		return menuMapper.selectMenuList(vo);
	}

	@Override
	@Transactional
	public void addMenuList(Menu vo) throws Exception {

		vo.setMenuId(StringUtils.defaultIfEmpty(vo.getMenuId(), menuIdGnrService.getNextStringId()));

		// 메뉴 등록
		menuMapper.insertMenu(vo);
		// 메뉴 순서 업데이트
		menuMapper.updateMenuOrderAuto(vo);

		//메뉴 추가 후 MENU_MAP 새로 설정
		settingMenuMap();
	}
	
	@Override
	@Transactional
	public void modifyMenuOrder(Menu vo) throws Exception {

		int index = 1;
		for(String menuId : vo.getMenuIds() ) {
			
			Menu menu = new Menu();
			menu.setMenuId(menuId);
			menu.setParentmenuId(vo.getParentmenuId());
			menu.setSortNum(String.valueOf(index));
			if(StringUtils.isNotBlank( vo.getMenuDepth())){
				menu.setMenuDepth(vo.getMenuDepth());
			}
			menu.setUpdateId(vo.getUpdateId());
			menuMapper.updateMenuOrder(menu);
			
			index += 1;
		}
		
		//메뉴 추가 후 MENU_MAP 새로 설정
		settingMenuMap();		
	}
	
	@Override
	@Transactional
	public void modifyMenu(Menu vo) throws Exception {
		
		// 메뉴 수정
		menuMapper.updateMenu(vo);

		//메뉴 추가 후 MENU_MAP 새로 설정
		settingMenuMap();
	}

	@Override
	@Transactional
	public void removeMenu(Menu vo) throws Exception {
		
		for(String menuId : vo.getMenuIds()){
			
			Role roleVo = new Role();
			roleVo.setMenuId(menuId);
			// 프로그램 권한 제거
			roleMapper.deleteRoleProgram(roleVo);
			// 메뉴 권한 제거
			roleMapper.deleteRoleMenu(roleVo);
		}
		
		// 메뉴 삭제 시 권한이 없는 프로그램 정보도 삭제함.
		menuMapper.deleteMenuProgramByMenuId(vo);
		
		// 메뉴 삭제
		menuMapper.deleteMenu(vo);
		
		// 메뉴 순서 업데이트
		menuMapper.updateMenuOrderAuto(vo);
		
		//메뉴 추가 후 MENU_MAP 새로 설정
		settingMenuMap();
	}

	
	private List<FlkMap> searchRoleList() throws Exception {
		return menuMapper.selectRoleList();
	}

	
	private List<FlkMap> searchSiteList(Menu vo) throws Exception {
		
		List<String> roleMenuList = menuMapper.selectRoleMenuList(vo);

		ArrayList<String> menuIds = new ArrayList<String>(roleMenuList);
		vo.setMenuIds(menuIds);
		
		return menuMapper.selectSiteList(vo);
		
	}

	private List<FlkMap> searchSiteMenuList(Menu vo) throws Exception {

		List<String> roleMenuList = menuMapper.selectRoleMenuList(vo);

		ArrayList<String> menuIds = new ArrayList<String>(roleMenuList);
		vo.setMenuIds(menuIds);
		
		return menuMapper.selectSiteMenuList(vo);

	}

	private List<FlkMap> searchSiteProgramList(Menu vo) throws Exception {
		return menuMapper.selectSiteProgramList(vo);
	}

	@Override
	public void removeRoleProgram(Program vo) throws Exception {
		
		menuMapper.deleteRoleProgram(vo);
		
		//메뉴 추가 후 MENU_MAP 새로 설정
		settingMenuMap();
		
	}

	@Override
	public void addRoleProgram(Program vo) throws Exception {
		
		menuMapper.insertRoleProgram(vo);
		
		//메뉴 추가 후 MENU_MAP 새로 설정
		settingMenuMap();
		
	}

	@Override
	public void settingMenuMap() throws Exception {

		Menu menu = new Menu();
		HashMap<String, HashMap<String, HashMap<String, Object>>> menuTotMap = new HashMap<String, HashMap<String, HashMap<String, Object>>>();

		// 등록된 모든 권한정보(ROLE_ID, GUEST_YN)를 조회한다.
		List<FlkMap> roleList = searchRoleList();

		if (roleList != null) { 

			int roleListSize = roleList.size();

			String urlTp = "";
			String loginUrl = "";
			String menuId = "";
			String roleId = "";

			for (int x = 0; x < roleListSize; x++) {

				FlkMap roleMap = (FlkMap) roleList.get(x);
				HashMap<String, HashMap<String, Object>> siteMenuMap = new HashMap<String, HashMap<String, Object>>();

				// ROLE_ID 조회
				roleId = (String) roleMap.get("roleId");

				// 사이트 정보 조회
				menu.setRoleId(roleId);

				// 권한에 해당하는 최상위 사이트정보를 조회(URL_TP, LOGIN_URL, MENU_ID)
				List<FlkMap> siteList = searchSiteList(menu);

				// 권한이 접근 가능한 사이트별로 메뉴구조를 조회
				for (int j = 0; j < siteList.size(); j++) {

					HashMap<String, Object> menuMap = new HashMap<String, Object>();
					FlkMap siteHm = (FlkMap) siteList.get(j);

					// 사이트 URL타입. 요청 URL타입을 기준으로 사이트를 구분한다.
					urlTp = (String) siteHm.get("urlType");
					// 요청에 대한 권한이 없는 경우 로그인할 URL설정
					loginUrl = (String) siteHm.get("loginUrl");
					// 사이트 최상위 메뉴아이디
					menuId = (String) siteHm.get("menuId");

					// 권한, 사이트별 메뉴목록 조회
					menu.setMenuId(menuId);
					// 권한속한 메뉴구조를 조회. 메뉴별 시작URL도 조회
					List<FlkMap> siteMenuList = searchSiteMenuList(menu);

					// 최상위 메뉴데이타 맵설정. 깝데기
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("menuId", menuId);
					map.put("menuName", "");
					map.put("orderNum", 1);
					map.put("parentmenuId", "");
					map.put("programUrl", "");

					// 트리형태의 메뉴데이타 생성. 맵안에 하위 메뉴의 맵을 설정. 재귀호출함.
					Object[] leftMObj = siteMenuList.toArray();
					map.put("subNodeList", setMenuMap(map, leftMObj));

					// 권한, 사이트별 프로그램목록 조회
					List<FlkMap> siteProgramList = searchSiteProgramList(menu);

					menuMap.put("LOGIN_URL", loginUrl);
					menuMap.put("MENU_MAP", map);
					menuMap.put("MENU_LIST_MAP", siteProgramList);

					// 권한, 사이트별 메뉴설정
					siteMenuMap.put(urlTp, menuMap);

				}

				menuTotMap.put(roleId, siteMenuMap);
			}
			ServiceConfig.MENU_MAP = menuTotMap;
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList setMenuMap(HashMap map, Object[] menuList) {
		ArrayList list = new ArrayList();
        for (int i = 0; i < menuList.length; i++) {
            Map nodeMap = (Map) menuList[i];
            // 하위노드 맵
            if (map.get("menuId").equals(nodeMap.get("parentmenuId"))) {
                HashMap subNodeMap = new HashMap();
                subNodeMap.put("menuId", nodeMap.get("menuId"));
                subNodeMap.put("menuName", nodeMap.get("menuName"));
                subNodeMap.put("sortNum", nodeMap.get("sortNum"));
                subNodeMap.put("parentmenuId", nodeMap.get("parentmenuId"));
                subNodeMap.put("programUrl", nodeMap.get("programUrl"));
                subNodeMap.put("programName", nodeMap.get("programName"));
                subNodeMap.put("useYn", nodeMap.get("useYn"));
                subNodeMap.put("path", nodeMap.get("path"));
                subNodeMap.put("subNodeList", setMenuMap(subNodeMap, menuList));
                list.add(subNodeMap);
            }
        }

        return list;
    }
    
}