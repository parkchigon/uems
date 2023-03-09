package com.flk.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.PageUtil;
import com.flk.main.domain.DashboardData;
import com.flk.main.service.DashboardService;
import com.flk.mng.report.domain.Report;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 대쉬보드(로그인 후 첫 화면)
 *
 */
@Controller
public class DashboardController {

	@Autowired
	private DashboardService dashboardService;
	
	@Autowired
	private SiteGroupService siteGroupService;
	
	@Autowired
	private SiteService siteService;
	
	/**
	 * 대시보드 - 총계
	 * 
	 * @param request		HttpServletRequest
	 * @param searchDate	검색날짜
	 * @param model			ModelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/main.do")
	public String searchMainView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		model.addAttribute( "mng", mng );
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("groupAllList", siteGroupService.searchSiteGroupList(siteGroup));
		
		//검색 연도 리스트
		model.addAttribute("selectYearList", dashboardService.selectYearList());

		return "/main/totalDashboard";
	}
	
	/**
	 * 총계 Ajax - 냉방사용요금, co2배출량, 에너지사용량, 지점별 냉방사용요금
	 * 지점정보 Ajax - 주요 지표 데이터 및 사용요금 비교 데이터
	 * @param request
	 * @param response
	 * @param model
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/main/select{type}Ajax.do")
	public Map<String ,Object> dashboardAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, DashboardData dashboardData,
											 @PathVariable("type") String type) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int valueCnt = 2; //그래프 갯수(주요 지표 데이터 그래프만 4개 2회함. 나머지는 모두 2개씩 조회)
		String unit = "";
		
		List<FlkMap> selectList = new ArrayList<FlkMap>();
		List<FlkMap> reductionList = new ArrayList<FlkMap>();
		if(type.equals("Co2Emissions") || type.equals("BranchCo2Emissions")){
			dashboardData.setChartVal("TCO_AMOUNT");
			selectList = dashboardService.selectCo2EmissionsList(dashboardData);
		}else if(type.equals("CoolCharge") || type.equals("BranchTotalCoolCharge")){
			dashboardData.setChartVal("COOL_CHARGE");
			selectList = dashboardService.selectCoolChargeList(dashboardData);
		}else if(type.equals("EnergyUsage")){
			dashboardData.setChartVal("ENERGY_AMOUNT");
			selectList = dashboardService.selectEnergyUsageList(dashboardData);
		}else if(type.equals("BranchCoolCharge")){
			dashboardData.setChartVal("COOL_CHARGE");
			selectList = dashboardService.selectBranchCoolChargeList(dashboardData);
		}else if(type.equals("MainIndicatorsData")){
			// 년도별로 불러와야 하므로 service 에서 처리
			resultMap = dashboardService.selectMainIndicatorsDataList(dashboardData);
			return resultMap;
		}else if(type.equals("UsageChargeData")){ // 사용요금데이터 --> 냉동기축냉효율
			selectList = dashboardService.selectUsageChargeDataList(dashboardData);
		}else if(type.equals("ChillerColdstorageData")){ // 냉동기축냉효율
			selectList = dashboardService.selectChillerColdstorageData(dashboardData);
			resultMap.put("selectChillerCount", dashboardService.selectChillerCount(dashboardData));
		}
		
		if(!type.equals("BranchCoolCharge") && !type.equals("MainIndicatorsData") && !type.equals("ChillerColdstorageData")){
			//증감표(총계>지점별 냉방 사용요금, 지점정보>주요지표데이터 제외한 모든 막대그래프 증감표 추가)
			reductionList = dashboardService.selectReductionValues(dashboardData);
			resultMap.put( "reductionList", reductionList );
		}
		
		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		List<Object> tempList = new ArrayList<Object>();
		
		if(selectList.size() > 0){
			String name = "";
			for(int i=0 ; i<valueCnt ; i++){
				List<Object> list = new ArrayList<Object>();
				name = selectList.get(0).get("name"+i).toString();
				for(int j=0 ; j<selectList.size() ; j++){
					if(i == 0) {
						xList.add(selectList.get(j).get("xlist").toString());
						if(selectList.get(j).get("temp") != null){
							tempList.add(selectList.get(j).get("temp"));
						}
					}
					if(selectList.get(j).get("amount"+i)==null){
						list.add("");
					}else{
						list.add(selectList.get(j).get("amount"+i));
					}
				}
				JSONObject obj = new JSONObject();
				
				obj.put("name", name);
				obj.put("data", list);
				
				yList.add(obj);
			}
			//에너지 사용량 기온 그래프
			if(type.equals("EnergyUsage")){
				JSONObject tempObj = new JSONObject();
				tempObj.put("name", "기온");
				tempObj.put("data", tempList);
				tempObj.put("type", "spline");
				tempObj.put("yAxis", 1);
				yList.add(tempObj);
			}
			//단위
			if(selectList.get(0).get("unit") != null){
				unit = selectList.get(0).get("unit").toString();
			}
		}
		
		resultMap.put( "unit", unit );
		resultMap.put( "xList", xList );
		resultMap.put( "yList", yList );
		resultMap.put( "listSize", selectList.size());
		
		return resultMap;
	}
	
	/**
	 * 총계 Ajax - 총 누적 절감액, 절감비율 및 전력 총 소비량
	 * @param request
	 * @param response
	 * @param model
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/main/selectTotalReductionInfoAjax.do")
	public Map<String ,Object> dashboardTotalAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, DashboardData dashboardData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<FlkMap> selectList = new ArrayList<FlkMap>();
		selectList = dashboardService.selectTotalPowerConsumption(dashboardData);

		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		List<Object> list = new ArrayList<Object>();
		List<List<Object>> pieList = new ArrayList<List<Object>>();

		if(selectList.size() > 0){
			for(int j=0 ; j<selectList.size() ; j++){
				List<Object> pie = new ArrayList<Object>();
				xList.add(selectList.get(j).get("day").toString());
				if(selectList.get(j).get("analValue")==null){
					list.add("");
				}else{
					list.add(selectList.get(j).get("analValue"));
				}
				
				pie.add(selectList.get(j).get("day"));
				pie.add(selectList.get(j).get("analValue"));
				pieList.add(pie);
			}
			JSONObject obj = new JSONObject();
			obj.put("data", list);
			yList.add(obj);
			
		}
		
		resultMap.put("xList", xList );
		resultMap.put("yList", yList );
		resultMap.put("pieList", pieList );
		resultMap.put("result", dashboardService.selectTotalReductionValues(dashboardData));
		
		return resultMap;
	}
	
	/**
	 * 대시보드 - 지점정보
	 * 
	 * @param request		HttpServletRequest
	 * @param searchDate	검색날짜
	 * @param model			ModelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/branchInfo.do")
	public String searchBranchInfoView(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		model.addAttribute( "mng", mng );
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("groupAllList", siteGroupService.searchSiteGroupList(siteGroup));
		
		//검색 연도 리스트
		model.addAttribute("selectYearList", dashboardService.selectYearList());
		
		return "/main/branchInfo";
	}

	/**
	 * 대시보드 - 냉동기정보(냉동기축냉효율)
	 * 
	 * @param request		HttpServletRequest
	 * @param model			ModelMap
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/main/chillerCountInfoAjax.do")
	public Map<String ,Object> searchChillerCountInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model, DashboardData dashboardData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//냉동기개수
		resultMap.put("selectChillerCount", dashboardService.selectChillerCount(dashboardData));
		
		return resultMap;
	}	
	
	/**
	 * 지점정보 - 지점정보 및 이력 ajax
	 * @param request
	 * @param response
	 * @param model
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/main/branchInfoAjax.do")
	public Map<String ,Object> branchInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, DashboardData dashboardData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", dashboardService.selectBranchInfo(dashboardData));
		resultMap.put("workHistoryList", dashboardService.selectWorkHistoryList(dashboardData));
		
		return resultMap;
	}
	
	/**
	 * 지점정보 Ajax - 기온
	 * @param request
	 * @param response
	 * @param model
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uems/main/weatherInfoAjax.do")
	public Map<String ,Object> weatherInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, DashboardData dashboardData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", dashboardService.selectWeatherInfo(dashboardData));
		
		return resultMap;
	}
	
	@RequestMapping(value = "/uems/report.do")
	public String searchReportView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("report") Report report, ModelMap model) throws Exception {

		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> siteGroupList = siteGroupService.searchSiteGroupList(siteGroup);
		
		Site site = new Site(1, Constants.YES);
		List<FlkMap> siteList = siteService.searchSiteList(site);
		
		model.addAttribute("siteGroupList", siteGroupList);
		model.addAttribute("siteList", siteList);
		
		PageUtil pageutil = new PageUtil(request, report.getCurrPage(), report.getListSize());
		report.setFirstIndex(pageutil.getFirstIndex());
		report.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> reportList = dashboardService.selectReportList(report);
		
		pageutil.setList(reportList);
		report.setPageutil(pageutil);
		model.addAttribute("resultList", reportList);
		
		return "/main/report";

	}
	
	@RequestMapping(value = "/uems/report/download.do")
	public void reportDownload(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("report") Report report) throws Exception {
		dashboardService.downloadReportFile(report, request, response);
	}

}