package com.flk.mng.report.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.domain.Constants;
import com.flk.common.utility.PageUtil;
import com.flk.mng.report.domain.DailyRecord;
import com.flk.mng.report.domain.Maintenance;
import com.flk.mng.report.domain.ManageFacility;
import com.flk.mng.report.domain.Report;
import com.flk.mng.report.service.DailyRecordService;
import com.flk.mng.report.service.ReportService;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;
import com.flk.system.code.service.CodeService;

@Controller
public class ReportController {

	@Autowired
	private SiteGroupService siteGroupService;
	@Autowired
	private SiteService siteService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private DailyRecordService dailyRecordService;
	@Autowired
	private CodeService codeService;
	
	@Value("#{code['record.type.cdId']}")
	private String recordTypeCdId;		// 상황 기준 타입
	
	/**
	 * 보고서 템플릿관리 목록
	 * @param request
	 * @param response
	 * @param report
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/reportTempletList.do")
	public String reportTempletListView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("report") Report report, ModelMap model) throws Exception {
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> siteGroupList = siteGroupService.searchSiteGroupList(siteGroup);
		
		Site site = new Site(1, Constants.YES);
		List<FlkMap> siteList = siteService.searchSiteList(site);
		
		model.addAttribute("siteGroupList", siteGroupList);
		model.addAttribute("siteList", siteList);
		
		
		PageUtil pageutil = new PageUtil(request, report.getCurrPage(), report.getListSize());
		report.setFirstIndex(pageutil.getFirstIndex());
		report.setLastIndex(pageutil.getLastIndex());

		List<FlkMap> reportTempletList = reportService.selectReportTemplete(report);
		
		pageutil.setList(reportTempletList);
		report.setPageutil(pageutil);
		model.addAttribute("resultList", reportTempletList);
		
		return "/uems/mng/report/reportTempletList";
	}
	
	/**
	 * 보고서 템플릿 등록/수정 화면
	 * @param request
	 * @param response
	 * @param report
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/reportTempletRegist.do")
	public String addReportTempletView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("report") Report report, ModelMap model) throws Exception {
		
		Report reportTempleteView = new Report();
		
		if(StringUtils.isNotBlank(report.getRtId())){
			FlkMap map = reportService.selectReportTempleteDetail(report);
			if(map != null) {
				reportTempleteView = (Report) MethodUtil.convertToOject(map, reportTempleteView);
			}
		}
		
		model.addAttribute("reportTempleteView", reportTempleteView);
		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> siteGroupList = siteGroupService.searchSiteGroupList(siteGroup);
		
		Site site = new Site(1, Constants.YES);
		List<FlkMap> siteList = siteService.searchSiteList(site);
		
		model.addAttribute("siteGroupList", siteGroupList);
		model.addAttribute("siteList", siteList);
		
		return "/uems/mng/report/reportTempletRegist";
	}
	
	/**
	 * 보고서 템플릿 등록/수정
	 * @param request
	 * @param response
	 * @param report
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/reportTempletRegistExe.do")
	@ResponseBody
	public Map<String, Object> reportTempletRegist(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("report") Report report, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		report.setRegId(loginVo.getMngId());
		report.setUpdateId(loginVo.getMngId());
		
		int result = 0;
		if(StringUtils.isNoneBlank(report.getRtId())) {
			result = reportService.modifyReportTemplete(report);
		} else {
			result = reportService.addReportTemplete(report);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(result == 1) {
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
			resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
		} else {
			resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
			resultMap.put(Constants.RESULT_MSG, Constants.ERROR_MSG);
		}
		
		
		return resultMap;
		
	}
	
	/**
	 * 보고서 템플릿 삭제
	 * @param request
	 * @param response
	 * @param report
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/reportTempletDelete.do")
	public String reportTempletDelete(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("report") Report report, ModelMap model) throws Exception {
		
		reportService.deleteReportTemplete(report); 
		model.addAttribute("resultMsg", "success.common.delete");

		return "forward:/Relay.do?_forward_page=/uems/mng/report/reportTempletList.do";	}
	
	/**
	 * 보고서 상황일지 관리 목록
	 * @param request
	 * @param response
	 * @param report
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/situationsDailyList.do")
	public String situationsDailyView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("dailyRecord") DailyRecord dailyRecord, ModelMap model) throws Exception {
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("groupAllList", siteGroupService.searchSiteGroupList(siteGroup));
		// 상황 기준 타입
		model.addAttribute("recordTypeList", codeService.searchCodeList(recordTypeCdId));
		
		return "/uems/mng/report/situationsDailyList";
	}
	
	/**
	 * 보고서 상황일지 관리 목록 조회 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param dailyRecord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/report/dailyRecordListAjax.do")
	public Map<String ,Object> dailyRecordListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, DailyRecord dailyRecord) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", dailyRecordService.selectDailyRecordList(dailyRecord));
		
		return resultMap;
	}
	
	/**
	 * 보고서 상황일지 관리 목록 저장 Ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param dailyRecord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/report/dailyRecordRegistAjax.do")
	public Map<String ,Object> dailyRecordRegistAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, DailyRecord dailyRecord) throws Exception {
		
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		dailyRecord.setRegId(loginVo.getMngId());
		dailyRecord.setUpdateId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Boolean result = false;
		if(dailyRecordService.addDailyRecord(dailyRecord) > 0){
			result = true;
		}
		resultMap.put("result", result);
		
		return resultMap;
	}
	
	/**
	 * 상황일지 보고서 생성
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param dailyRecord
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/createSituationReport.do")
	public String createSituationReport(HttpServletRequest request, HttpServletResponse response, ModelMap model, DailyRecord dailyRecord) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		dailyRecord.setRegId(loginVo.getMngId());
		dailyRecord.setUpdateId(loginVo.getMngId());
		
		resultMap = dailyRecordService.createSituationReport(request, dailyRecord);
		model.addAttribute("resultMsg", resultMap.get(Constants.RESULT_MSG));
		
		return "forward:/Relay.do?_forward_page=/uems/mng/report/situationsDailyList.do";
	}
	
	/**
	 * 보고서 항목입력 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/reportItemRegist.do")
	public String reportItemRegistView(HttpServletRequest request, HttpServletResponse response, ModelMap model, ManageFacility manageFacility) throws Exception {
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("groupAllList", siteGroupService.searchSiteGroupList(siteGroup));
		model.addAttribute("siteId", manageFacility.getSiteId());
		return "/uems/mng/report/reportItemRegist";
	}
	
	
	/**
	 * 보고서 항목입력 등록
	 * 
	 * @param request
	 * @param response
	 * @param manageFacility
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/report/reportItemRegistExe.do")
	public String addReportItem(HttpServletRequest request, HttpServletResponse response, ManageFacility manageFacility, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		manageFacility.setRegId(loginVo.getMngId());
		manageFacility.setUpdateId(loginVo.getMngId());
		reportService.insertReportItem(manageFacility);
		
		return "forward:/Relay.do?_forward_page=/uems/mng/report/reportItemRegist.do";
	}
	
	
	/**
	 * 보고서 항목입력 조회
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param manageFacility
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/mng/report/selectReportItemDetailAjax.do")
	public Map<String ,Object> selectReportItemDetailAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, ManageFacility manageFacility) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.putAll(reportService.selectReportItemDetail(manageFacility));
		return resultMap;
	}
	
}
