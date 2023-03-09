package com.flk.mng.site.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.utility.PageUtil;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.user.domain.Mng;

@Controller
public class SiteGroupController {
	
	@Autowired
	private SiteGroupService siteGroupService;

	
	/**
	 * 그룹 관리 리스트
	 * 
	 * @param request
	 * @param response
	 * @param siteGroup
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/site/siteGroupList.do")
	public String searchSiteGroupListView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("siteGroup") SiteGroup siteGroup, ModelMap model) throws Exception {
		
		PageUtil pageutil = new PageUtil(request, siteGroup.getCurrPage(), siteGroup.getListSize());
		siteGroup.setFirstIndex(pageutil.getFirstIndex());
		siteGroup.setLastIndex(pageutil.getLastIndex());

		List<FlkMap> siteGroupList = siteGroupService.searchSiteGroupList(siteGroup);
		
		pageutil.setList(siteGroupList);
		siteGroup.setPageutil(pageutil);
		
		model.addAttribute("resultList", siteGroupList);
		
		return "/uems/mng/site/siteGroupList";
	}
	
	
	/**
	 * 그룹관리 등록 및 수정 화면
	 * 
	 * @param request
	 * @param response
	 * @param siteGroup
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/site/siteGroupRegist.do")
	public String addSiteGroupView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("siteGroup") SiteGroup siteGroup, ModelMap model) throws Exception {
		SiteGroup siteGroupView = new SiteGroup();
		
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(siteGroup.getSgId())){
	        FlkMap map = siteGroupService.searchSiteGroupView(siteGroup);
	        if(map != null) {
	        	siteGroupView = (SiteGroup) MethodUtil.convertToOject(map, siteGroupView);
	        }
		}
		model.addAttribute("siteGroupView", siteGroupView);
		
		return "/uems/mng/site/siteGroupRegist";
	}
	
	
	/**
	 * 그룹관리 등록 및 수정
	 * 
	 * @param request
	 * @param response
	 * @param siteGroup
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/site/siteGroupRegistExe.do")
	public String addSiteGroup(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("siteGroup") SiteGroup siteGroup, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		siteGroup.setRegId(loginVo.getMngId());
		siteGroup.setUpdateId(loginVo.getMngId());

		// 등록일 경우
		if(StringUtils.isBlank(siteGroup.getSgId())){
			if(siteGroupService.checkExistSgCd(siteGroup)) {	// sgCd 중복체크
				siteGroupService.addSiteGroup(siteGroup);
			} else {
				model.addAttribute("resultMsg", "fail.isExist.sgCd");
			}
		} else { // 수정일 경우
			siteGroupService.modifySiteGroup(siteGroup);
		}
		
		return "forward:/Relay.do?_forward_page=/uems/mng/site/siteGroupList.do";
	}
	
}
