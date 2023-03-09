package com.flk.mng.tag.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.utility.PageUtil;
import com.flk.ems.system.domain.Tag;
import com.flk.mng.tag.service.TagService;

@Controller
public class TagController {
	
	@Value("#{code['region.name.cdId']}")
	private String regionCdId;
	
	@Autowired
	private TagService tagService;

	/**
	 * 태그 관리 리스트
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/tag/tagList.do")
	public String searchTagListView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tag") Tag tag, ModelMap model) throws Exception {
		
		PageUtil pageutil = new PageUtil(request, tag.getCurrPage(), tag.getListSize());
		tag.setFirstIndex(pageutil.getFirstIndex());
		tag.setLastIndex(pageutil.getLastIndex());
		//태그리스트
		List<FlkMap> tagList = tagService.searchTagList(tag);
		//태그타입
		List<FlkMap> tagType = tagService.searchTagTypeList(tag);
		
		pageutil.setList(tagList);
		tag.setPageutil(pageutil);
		model.addAttribute("resultList", tagList);
		model.addAttribute("tagTypeList", tagType);
		model.addAttribute("tag", tag);

		
		return "/uems/mng/tag/tagList";
	}
	
	/**
	 * siteGroup별 Site리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/uems/mng/tag/selectSiteListAjax.do")
	public Map<String, Object> selectSiteListAjax(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tag") Tag tag, ModelMap model) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// Site리스트
		List<FlkMap> siteList = tagService.searchSiteList(tag);
		
		resultMap.put("siteList", siteList);
		
		return resultMap;
	}
	
	/**
	 * 상황일지태그적용 update
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/tag/updateDailyRecordFlag.do")
	public String updateDailyRecordFlag(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("tag") Tag tag, ModelMap model) throws Exception {
		
		tagService.updateDailyRecordFlag(tag);
		
		return "forward:/Relay.do?_forward_page=/uems/mng/tag/tagList.do";
	}
	
	

}
