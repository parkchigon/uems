package com.flk.ems.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;
import com.flk.ems.schedule.domain.ScheduleRecord;
import com.flk.ems.schedule.service.ScheduleRecordService;
import com.flk.mng.report.domain.DailyRecord;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;
import com.flk.mng.work.domain.WorkHistory;


@Controller
public class ScheduleController {

	@Autowired
	private SiteGroupService siteGroupService;
	
	@Autowired
	private SiteService siteService;
	
	@Autowired
	private ScheduleRecordService scheduleRecordService;
	
	@RequestMapping(value = "/uems/mng/schedule/scheduleList.do")
	public String scheduleList(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("scheduleRecord") ScheduleRecord scheduleRecord, ModelMap model) throws Exception {
		

		// 그룹 리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("groupAllList", siteGroupService.searchSiteGroupList(siteGroup));
		
		Site site = new Site(1, Constants.YES);
		List<FlkMap> siteList = siteService.searchSiteList(site);
		model.addAttribute("siteList", siteList);
		
		//날짜 selecbox 올해기준 -2 ~ +10년
		List<String> yearList = new ArrayList<String>();
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy", Locale.KOREA);
		for(int i = -2; i <= 10; i++){
			Date currentTime = new Date();
			currentTime.setYear(currentTime.getYear()+i);
			String year = mSimpleDateFormat.format(currentTime);
			yearList.add(year);
		}
		model.addAttribute("yearList", yearList);
		
		PageUtil pageutil = new PageUtil(request, scheduleRecord.getCurrPage(), scheduleRecord.getListSize());
		scheduleRecord.setFirstIndex(pageutil.getFirstIndex());
		scheduleRecord.setLastIndex(pageutil.getLastIndex());
		
		/* 스케줄제어 리스트 */
		List<FlkMap> scheduleRecordList = scheduleRecordService.selectScheduleRecordList(scheduleRecord);
		
		pageutil.setList(scheduleRecordList);
		scheduleRecord.setPageutil(pageutil);
		scheduleRecord.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("scheduleList", scheduleRecordList);
		
		return "/uems/mng/schedule/scheduleList";
	}
	
	/**
	 * 선택한 그룹의 태그 리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param workHistory
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/schedule/selectDriveListAjax.do")
	@ResponseBody
	public Map<String, Object> selectDriveListAjax(HttpServletRequest request, HttpServletResponse response, WorkHistory workHistory) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 지점 리스트
		Site site = new Site(1, Constants.YES);
		site.setSearchCondition(workHistory.getSearchCondition());	// 지점그룹ID
		List<FlkMap> driveList = scheduleRecordService.searchDriveList(site);
		resultMap.put("driveList", driveList);
		
		return resultMap;
	}
	
	/**
	 * 선택한 그룹의 태그 리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param workHistory
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/schedule/selecttagListAjax.do")
	@ResponseBody
	public Map<String, Object> selecttagListAjax(HttpServletRequest request, HttpServletResponse response, WorkHistory workHistory) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 지점 리스트
		Site site = new Site(1, Constants.YES);
		site.setSearchCondition(workHistory.getSearchCondition());	// 지점그룹ID
		List<FlkMap> tagList = scheduleRecordService.searchTagList(site);
		resultMap.put("tagList", tagList);
		
		return resultMap;
	}
	
	
	/**
	 * 스케줄 관리 목록 조회 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 * 
	 * , @ModelAttribute("scheduleRecord") ScheduleRecord scheduleRecord, ModelMap model
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/schedule/scheduleRecordListAjax.do")
	public Map<String ,Object> scheduleRecordListAjax(HttpServletRequest request, HttpServletResponse response, ScheduleRecord scheduleRecord, ModelMap model) throws Exception {

		/*PageUtil pageutil = new PageUtil(request, scheduleRecord.getCurrPage(), scheduleRecord.getListSize());
		scheduleRecord.setFirstIndex(pageutil.getFirstIndex());
		scheduleRecord.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> scheduleRecordList = scheduleRecordService.selectScheduleRecordList(scheduleRecord);
		
		pageutil.setList(scheduleRecordList);
		scheduleRecord.setPageutil(pageutil);
		model.addAttribute("result", scheduleRecordList);*/
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", scheduleRecordService.selectScheduleRecordList(scheduleRecord));
		
		return resultMap;
	}
	
	/**
	 * 스케줄 관리 목록 저장 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/schedule/scheduleRecordRegistAjax.do")
	public Map<String ,Object> scheduleRecordRegistAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, ScheduleRecord scheduleRecord) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		scheduleRecord.setRegId(loginVo.getMngId());
		scheduleRecord.setUpdateId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 적용 위치 (0:현장 1:통합)
		if(StringUtils.equals(loginVo.getRoleId(), Constants.ROL_0000000000000001) || StringUtils.equals(loginVo.getRoleId(), Constants.ROL_0000000000000002)) {
			scheduleRecord.setSetPlace("0");		// 현장시스템 > 구축자, 사용자 권한일 경우
		} else { 	
			scheduleRecord.setSetPlace("1");		// 통합시스템 > 운영자, 최고관리자일 경우
		}
		
		Boolean result = false;
		if(scheduleRecordService.addScheduleRecord(scheduleRecord) > 0){
			result = true;
		}
		resultMap.put("result", result);
		
		return resultMap;
	}	
	
	/**
	 * 스케줄 관리 목록 수정 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/schedule/scheduleRecordEditAjax.do")
	public Map<String ,Object> scheduleRecordEditAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, ScheduleRecord scheduleRecord) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		scheduleRecord.setUpdateId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Boolean result = false;
		if(scheduleRecordService.editScheduleRecord(scheduleRecord) > 0){
			result = true;
		}
		resultMap.put("result", result);
		
		return resultMap;
	}
	
	/**
	 * 스케줄 관리 목록 삭제 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/schedule/scheduleRecordDeleteAjax.do")
	public Map<String ,Object> scheduleRecordDeleteAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, ScheduleRecord scheduleRecord) throws Exception {
		
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		scheduleRecord.setUpdateId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Boolean result = false;
		if(scheduleRecordService.deleteScheduleRecord(scheduleRecord) > 0){
			result = true;
		}
		resultMap.put("result", result);
		
		return resultMap;
	}
	
	/**
	 * 스케줄 관리 제외일 목록 조회 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 * 
	 * , @ModelAttribute("scheduleRecord") ScheduleRecord scheduleRecord, ModelMap model
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/schedule/scheduleOutdayListAjax.do")
	public Map<String ,Object> scheduleOutdayListAjax(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("scheduleRecord") ScheduleRecord scheduleRecord, ModelMap model) throws Exception {

		List<FlkMap> scheduleRecordList = scheduleRecordService.selectScheduleOutdayList(scheduleRecord);
		
		model.addAttribute("outday", scheduleRecordList);
		
		return model;
	}
	
	/**
	 * 스케줄 관리 제외일 저장 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/schedule/scheduleOutdayRegistAjax.do")
	public Map<String ,Object> scheduleOutdayRegistAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, ScheduleRecord scheduleRecord) throws Exception {
		
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		scheduleRecord.setRegId(loginVo.getMngId());
		scheduleRecord.setUpdateId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 적용 위치 (0:현장 1:통합)
		if(StringUtils.equals(loginVo.getRoleId(), Constants.ROL_0000000000000001) || StringUtils.equals(loginVo.getRoleId(), Constants.ROL_0000000000000002)) {
			scheduleRecord.setSetPlace("0");		// 현장시스템 > 구축자, 사용자 권한일 경우
		} else { 	
			scheduleRecord.setSetPlace("1");		// 통합시스템 > 운영자, 최고관리자일 경우
		}

		Boolean result = false;
		if(scheduleRecordService.addScheduleOutday(scheduleRecord) > 0){
			result = true;
		}
		resultMap.put("result", result);
		
		return resultMap;
	}
		
	/**
	 * 스케줄 관리 제외일 삭제 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/schedule/scheduleOutdayDeleteAjax.do")
	public Map<String ,Object> scheduleOutdayDeleteAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, ScheduleRecord scheduleRecord) throws Exception {
		
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		scheduleRecord.setUpdateId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Boolean result = false;
		if(scheduleRecordService.scheduleOutdayDeleteAjax(scheduleRecord) > 0){
			result = true;
		}
		resultMap.put("result", result);
		
		return resultMap;
	}
}
