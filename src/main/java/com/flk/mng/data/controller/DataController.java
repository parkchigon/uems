package com.flk.mng.data.controller;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.flk.common.utility.StringUtils;
import com.flk.mng.data.domain.Data;
import com.flk.mng.data.service.DataService;
import com.flk.mng.report.domain.Report;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;

@Controller
public class DataController {
	
	private static final Logger logger = LoggerFactory.getLogger(DataController.class);
	
	@Autowired 
	private DataService dataService;
	@Autowired
	private SiteGroupService siteGroupService;
	@Autowired
	private SiteService siteService;
	
	/**월별운영데이터관리 리스트 조회
	 * @param request
	 * @param response
	 * @param data
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/uems/mng/data/dataList.do")
	public String searchDataListView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("data") Data data, ModelMap model) throws Exception {
		
		PageUtil pageutil = new PageUtil(request, data.getCurrPage(), data.getListSize());
		data.setFirstIndex(pageutil.getFirstIndex());
		data.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> dataList = dataService.searchDataList(data);
		
		pageutil.setList(dataList);
		data.setPageutil(pageutil);
		data.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("dataList", dataList);
		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
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
		
		return "/uems/mng/data/dataList";
	}
	
	/**데이터 등록/수정 화면
	 * @param request
	 * @param response
	 * @param data
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/uems/mng/data/dataRegist.do")
	public String addDataView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("data") Data data, ModelMap model) throws Exception {
		
		Data dataInfo = new Data();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(data.getMonth())){
	        FlkMap map = dataService.searchDataInfo(data);
	        if(map != null) {
	        	dataInfo = (Data) MethodUtil.convertToOject(map, dataInfo);
	        }
		}
		
	//	data.setSearchCondition(dataInfo.getSgId());
		model.addAttribute("dataInfo", dataInfo);
		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
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
		
		return "/uems/mng/data/dataRegist";
	}
	
	/** 데이터 등록/수정
	 * @param request
	 * @param response
	 * @param data
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/data/dataRegistExe.do")
	public String addSite(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("data")Data data, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		data.setRegId(loginVo.getMngId());
		data.setUpdateId(loginVo.getMngId());
		
		//등록
		if(StringUtils.isBlank(data.getMonthKey())){
			dataService.addData(data);
		} else { // 수정일 경우
			dataService.modifyData(data);
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/data/dataRegist.do";
	}
	
	/** 데이터 중복체크
	 * @param data
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/uems/mng/data/dataCount.do")
	public int getDataCount(@ModelAttribute("data")Data data, ModelMap model) throws Exception {
		int count = dataService.searchDataCount(data);
		return count;
	}
	
	/**
	 * 선택한 그룹의 지점 리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/data/selectSiteListAjax.do")
	@ResponseBody
	public Map<String, Object> selectSiteListAjax(HttpServletRequest request, HttpServletResponse response, Data data) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 지점 리스트
		Site site = new Site(1, Constants.YES);
		if(data.getFlag().equals("list")){
			site.setSearchCondition(data.getSearchCondition());
		}else if(data.getFlag().equals("reg")){
			site.setSearchCondition(data.getSgId());
		}
		List<FlkMap> siteList = siteService.searchSiteList(site);
		resultMap.put("siteList", siteList);
		
		return resultMap;
	}
	
	/**
	 * 선택한 날짜 데이터 조회
	 * 
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/data/selectDataAjax.do")
	@ResponseBody
	public Map<String, Object> selectDataAjax(HttpServletRequest request, HttpServletResponse response, Data data) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		FlkMap dataInfo = dataService.searchDataInfo(data);
		
		resultMap.put("dataInfo",dataInfo);
		
		return resultMap;
	}
	
	
	/**데이터 삭제
	 * @param request
	 * @param response
	 * @param data
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/data/dataRemoveExe.do")
	public String removeData(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("data") Data data, ModelMap model) throws Exception {
		dataService.removeData(data);
		return "forward:/Relay.do?_forward_page=/uems/mng/data/dataList.do";
	}
	
	/**
	 * 기술운영보고서 생성
	 * @param request
	 * @param response
	 * @param data
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/data/downloadReportFile.do")
	public String downloadReportFile(HttpServletRequest request, HttpServletResponse response, Data data, ModelMap model) throws Exception {
		
		try {
			Report report = new Report();
			report = dataService.makeReportFile(data);
			if(StringUtils.isNotBlank(report.getRfId())) {
				model.addAttribute("resultMsg", "success.report.maintenance");
			} else {
				model.addAttribute("resultMsg", "fail.report.maintenance");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			model.addAttribute("resultMsg", "fail.report.maintenance");
		}
		
		return "forward:/Relay.do?_forward_page=/uems/mng/data/dataRegist.do";
	}
	
}
