package com.flk.ems.setting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.ems.build.service.BuildService;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.service.EmsMainService;
import com.flk.mng.user.domain.Mng;

/**
 * 설정
 *
 */
@Controller
public class SettingController {

	@Autowired
	private EmsMainService emsMainService;
	
	@Autowired
	private BuildService buildService;
	
	@RequestMapping(value = "/ems/setting/settingView.do")
	public String searchSettingView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS01);	// 빙축열 탭 (좌측화면)

		// 좌측 계통도 서브메뉴정보 조회
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		// 태그 매핑 리스트 
		systemTagMap.setSubmenuId(Constants.SubMenu.SYS03);	// 빙축열(계통도) / 설정
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);
		
		return "/ems/setting/settingView";
	}
	
}
