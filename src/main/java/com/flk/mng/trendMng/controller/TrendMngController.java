package com.flk.mng.trendMng.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.StringUtils;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.trendMng.domain.TrendGroup;
import com.flk.mng.trendMng.service.TrendMngService;
import com.flk.mng.user.domain.Mng;
import com.flk.system.code.service.CodeService;

@Controller
public class TrendMngController {
	
	@Autowired
	private TrendMngService trendMngService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private SiteGroupService siteGroupService;
	
	@Value("#{code['tag.type.cdId']}")
	private String tagTypeCdId;		// 태그 TYPE
	
	@RequestMapping("/uems/mng/trendMng/trendMngList.do")
	public String searchTrendMngList(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("trendGroup") TrendGroup trendGroup, ModelMap model) throws Exception {
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("siteGroupList", siteGroupService.searchSiteGroupList(siteGroup));
		model.addAttribute("tagTypeList", codeService.searchCodeList(tagTypeCdId));
		
		return "/uems/mng/trendMng/trendMngList";
	}
	
	//Ajax롤 각 리스트 조회
	@ResponseBody
	@RequestMapping(value = "/uems/mng/trendMng/search{type}ListAjax.do")
	public Map<String ,Object> searchListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, TrendGroup trendGroup,
											  @PathVariable("type") String type) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<TrendGroup> tagList = new ArrayList<TrendGroup>();
		
		if(type.equals("Tag")){
			tagList = trendMngService.selectTagList(trendGroup);
		}else if(type.equals("TrendTag")){
			tagList = trendMngService.selectTrendTagList(trendGroup);
		}else if(type.equals("TrendGroup")){
			tagList = trendMngService.selectTrendGroupList(trendGroup);
		}
		
		resultMap.put( "tagList", tagList );
		
		return resultMap;
	}
	
	//저장
	@ResponseBody
	@RequestMapping("/uems/mng/trendMng/trendMngSaveAjax.do")
	public Map<String ,Object> searchTrendMngSaveAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, TrendGroup trendGroup) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		
		trendGroup.setRegId(loginVo.getMngId());
		trendGroup.setUpdateId(loginVo.getMngId());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Boolean result = trendMngService.insertTrendGroup(trendGroup);
		
		resultMap.put( "result", result);
		
		return resultMap;
	}
	
}
