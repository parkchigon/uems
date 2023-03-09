package com.flk.mng.site.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.domain.Constants;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;
import com.flk.system.code.service.CodeService;

@Controller
public class SiteController {
	
	@Value("#{code['region.name.cdId']}")
	private String regionCdId;
	
	@Autowired
	private SiteGroupService siteGroupService;
	
	@Autowired
	private SiteService siteService;	
	
	@Autowired
	private CodeService codeService;

	/**
	 * 지점 관리 리스트
	 * 
	 * @param request
	 * @param response
	 * @param site
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/site/siteList.do")
	public String searchSiteListView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("site") Site site, ModelMap model) throws Exception {
		
		PageUtil pageutil = new PageUtil(request, site.getCurrPage(), site.getListSize());
		site.setFirstIndex(pageutil.getFirstIndex());
		site.setLastIndex(pageutil.getLastIndex());

		List<FlkMap> siteList = siteService.searchSiteList(site);
		
		pageutil.setList(siteList);
		site.setPageutil(pageutil);
		model.addAttribute("resultList", siteList);

		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/site/siteList";
	}
	
	
	/**
	 * 지점관리 등록 및 수정 화면
	 * 
	 * @param request
	 * @param response
	 * @param site
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/site/siteRegist.do")
	public String addSiteView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("site") Site site, ModelMap model) throws Exception {
		Site siteView = new Site();
		
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(site.getSiteId())){
	        FlkMap map = siteService.searchSiteView(site);
	        if(map != null) {
	        	siteView = (Site) MethodUtil.convertToOject(map, siteView);
	        }
		}
		model.addAttribute("siteView", siteView);
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		// 지역리스트
		model.addAttribute("regionList", codeService.searchCodeList(regionCdId));
		
		return "/uems/mng/site/siteRegist";
	}
	
	
	/**
	 * 지점관리 등록 및 수정
	 * 
	 * @param request
	 * @param response
	 * @param site
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/site/siteRegistExe.do")
	public String addSite(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("site") Site site, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		site.setRegId(loginVo.getMngId());
		site.setUpdateId(loginVo.getMngId());

		// 등록일 경우
		if(StringUtils.isBlank(site.getSiteId())){
			if(siteService.checkExistSiteCd(site)) {	// siteCd 중복체크
				siteService.addSite(site);
				siteService.createSiteDbTable(site.getSiteCd());
			} else {
				model.addAttribute("resultMsg", "fail.isExist.siteCd");
			}
		} else { // 수정일 경우
			siteService.modifySite(site);
			siteService.createSiteDbTable(site.getSiteCd());
		}
		
		return "forward:/Relay.do?_forward_page=/uems/mng/site/siteList.do";
	}
}
