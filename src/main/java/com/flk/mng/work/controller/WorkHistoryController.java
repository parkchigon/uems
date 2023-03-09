package com.flk.mng.work.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.attachfile.service.AttachFileService;
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
import com.flk.mng.work.domain.WorkHistory;
import com.flk.mng.work.service.WorkHistoryService;

@Controller
public class WorkHistoryController {
	
	@Autowired
	private WorkHistoryService workHistoryService;

	@Autowired
	private SiteGroupService siteGroupService;
	
	@Autowired
	private SiteService siteService;
	
	@Autowired
	private AttachFileService attachfileService;

	
	/**
	 * 작업관리 리스트
	 * 
	 * @param request
	 * @param response
	 * @param workHistory
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/work/workHistoryList.do")
	public String searchWorkHistoryListView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("workHistory") WorkHistory workHistory, ModelMap model) throws Exception {
		
		PageUtil pageutil = new PageUtil(request, workHistory.getCurrPage(), workHistory.getListSize());
		workHistory.setFirstIndex(pageutil.getFirstIndex());
		workHistory.setLastIndex(pageutil.getLastIndex());

		List<FlkMap> workHistoryList = workHistoryService.searchWorkHistoryList(workHistory);
		
		pageutil.setList(workHistoryList);
		workHistory.setPageutil(pageutil);
		
		model.addAttribute("resultList", workHistoryList);
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/work/workHistoryList";
	}
	
	
	/**
	 * 작업관리 등록 및 수정 화면
	 * 
	 * @param request
	 * @param response
	 * @param workHistory
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/work/workHistoryRegist.do")
	public String addWorkHistoryView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("workHistory") WorkHistory workHistory, ModelMap model) throws Exception {
		WorkHistory workHistoryView = new WorkHistory();
		
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(workHistory.getWorkId())){
	        FlkMap map = workHistoryService.searchWorkHistoryView(workHistory);
	        if(map != null) {
	        	workHistoryView = (WorkHistory) MethodUtil.convertToOject(map, workHistoryView);
	        }
		}
		model.addAttribute("workHistoryView", workHistoryView);
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/work/workHistoryRegist";
	}
	
	
	/**
	 * 작업관리 등록 및 수정
	 * 
	 * @param request
	 * @param response
	 * @param workHistory
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/work/workHistoryRegistExe.do")
	public String addWorkHistory(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("workHistory") WorkHistory workHistory, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		workHistory.setRegId(loginVo.getMngId());
		workHistory.setUpdateId(loginVo.getMngId());
		
		if (workHistory.getContent() != null) {
			workHistory.setContent(StringUtils.cleanScript(workHistory.getContent()));
		}

		// 등록일 경우
		if(StringUtils.isBlank(workHistory.getWorkId())){
			workHistoryService.addWorkHistory(workHistory);
		} else { // 수정일 경우
			workHistoryService.modifyWorkHistory(workHistory);
		}
		
		attachfileService.modifyAttachFileImageExe(workHistory.getWorkId(), request.getParameterValues("fileids"));
		
		return "forward:/Relay.do?_forward_page=/uems/mng/work/workHistoryList.do";
	}
	
	
	
	/**
	 * 작업관리 삭제
	 * 
	 * @param request
	 * @param response
	 * @param workHistory
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/work/workHistoryRemoveExe.do")
	public String removeWorkHistory(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("workHistory") WorkHistory workHistory, ModelMap model) throws Exception {
		workHistoryService.removeWorkHistory(workHistory);
		return "forward:/Relay.do?_forward_page=/uems/mng/work/workHistoryList.do";
	}
	
	
	/**
	 * 선택한 그룹의 지점 리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param workHistory
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/user/selectSiteListAjax.do")
	@ResponseBody
	public Map<String, Object> selectSiteListAjax(HttpServletRequest request, HttpServletResponse response, WorkHistory workHistory) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 지점 리스트
		Site site = new Site(1, Constants.YES);
		site.setSearchCondition(workHistory.getSearchCondition());	// 지점그룹ID
		List<FlkMap> siteList = siteService.searchSiteList(site);
		resultMap.put("siteList", siteList);
		
		return resultMap;
	}
}
