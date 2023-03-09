package com.flk.ems.trend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.ExcelJxls;
import com.flk.ems.system.domain.RawData;
import com.flk.ems.trend.service.TrendService;
import com.flk.mng.user.domain.Mng;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.jxls.transformer.XLSTransformer;

/**
 * Trend 모니터링
 *
 */
@Controller
public class TrendController {
	
	@Autowired
	TrendService trendService;

	/**
	 * 
	 * Tag 화면호출
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/trend/tagMonitoring.do")
	public String tagMonitoring(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData,HttpSession session) throws Exception {
		
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		//TagList 온도~\
		List<FlkMap> typeList = trendService.searchTypeList(rawData);
		
		model.addAttribute( "mng", mng );
		model.addAttribute( "typeList", typeList );
		
		// 설비제어 > 트랜드보기 버튼으로 이동 시 
		model.addAttribute( "tagInfo", trendService.selectTagInfo(rawData));
		
		return "/ems/trend/tagMonitoring";
	}
	
	/**
	 * 
	 * Trend 화면호출
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/trend/trendMonitoring.do")
	public String trendMonitoring(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData,HttpSession session) throws Exception {
		
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		//태그그룹리스트 조회
		Mng data = (Mng)request.getSession().getAttribute("SITE_INFO");
		rawData.setSiteId(data.getSiteId());
		List<FlkMap> typeList = trendService.selectTrendGroupList(rawData);
		
		model.addAttribute( "mng", mng );
		model.addAttribute( "typeList", typeList );
		
		return "/ems/trend/trendMonitoring";
	}
	
	/**
	 * 
	 * TAG MONITORING 데이터 조회 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/ems/trend/trendMonitoringAjax.do")
	public Map<String ,Object> trendMonitoringAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//모니터링 데이터 조회
		int arrSize = rawData.getTagValueArr().size();
		List<FlkMap> tagList = null;
		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		JSONArray yAxis = new JSONArray();
		
		tagList = trendService.selectTagMonitoringData(rawData);
		if(tagList.size() > 0){
			String name = "";
			String format = "";
			String text = "";
			
			int cnt = 0;
			int tempCnt = 0;
			for(int i=0; i<arrSize; i++) {
				List<Object> list = new ArrayList<Object>();
				for(int j=0; j<tagList.size(); j++ ){
					if(j == 0) {
						if(tagList.get(j).get("tagUnit"+i) == null){
							format = "{value} on/off";
						} else {
							format = "{value} "+tagList.get(j).get("tagUnit"+i).toString();
						}
						name = tagList.get(j).get("tagId"+i).toString();
						//format = "{value} "+tagList.get(j).get("tagUnit"+i).toString();
						text = tagList.get(j).get("tagType"+i).toString();
					}
					if(tagList.get(j).get("tagValueAvg"+i)==null){
						list.add("");
					}else{
						list.add(tagList.get(j).get("tagValueAvg"+i));
						
					}
					if(i==0){
						xList.add(tagList.get(j).get("statHour").toString());
					}
				}
				
				
				JSONObject formatObj = new JSONObject();
				JSONObject textObj = new JSONObject();
				JSONObject lastObj = new JSONObject();
				formatObj.put("format", format);
				textObj.put("text", text);
				lastObj.put("labels", formatObj);
				lastObj.put("title", textObj);

				JSONObject obj = new JSONObject();
				obj.put("name", name);
				obj.put("data", list);
				
				
				if(yAxis.contains(lastObj)){
					obj.put("yAxis", tempCnt);
					yList.add(obj);
					continue;
				}else{
					tempCnt = cnt;
					obj.put("yAxis", cnt++);
					yList.add(obj);
					yAxis.add(lastObj);					
				}
			}
		}
		resultMap.put( "xList", xList );
		resultMap.put( "yList", yList );
		resultMap.put( "yAxis", yAxis );
		resultMap.put( "arrSize", arrSize );

		return resultMap;
	}
	
	/**
	 * 
	 * TAG MONITORING 실시간 추가 데이터 조회 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "ems/trend/trendMonitoringRealTimeAjax.do")
	public Map<String ,Object> trendMonitoringRealTimeAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//모니터링 데이터 조회
		int arrSize = rawData.getTagValueArr().size();
		List<FlkMap> tagList = null;
		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		
		tagList = trendService.selectTagMonitoringAddData(rawData);
		if(tagList.size() > 0){
			String name = "";
			for(int i=0; i<arrSize; i++) {
				List<Object> list = new ArrayList<Object>();
				for(int j=0; j<tagList.size(); j++ ){
					if(j == 0) {
						name = tagList.get(j).get("tagId"+i).toString();
					}
					if(tagList.get(j).get("tagValueAvg"+i)==null){
						list.add("");
					}else{
						list.add(tagList.get(j).get("tagValueAvg"+i));
						
					}
					if(i==0){
						xList.add(tagList.get(j).get("statHour").toString());
					}
				}
				JSONObject obj = new JSONObject();
				obj.put("name", name);
				obj.put("data", list);
				yList.add(obj);
			}
		}
		resultMap.put( "xList", xList );
		resultMap.put( "yList", yList );
		resultMap.put( "arrSize", arrSize );
		
		
		return resultMap;
	}
	
	/**
	 * 
	 * TAG MONITORING 실시간 추가 데이터 조회 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "ems/trend/trendMonitoringMinAjax.do")
	public Map<String ,Object> trendMonitoringMinAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//모니터링 데이터 조회
		int arrSize = rawData.getTagValueArr().size();
		List<FlkMap> tagList = null;
		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		
		tagList = trendService.selectTagMonitoringAddMinData(rawData);
		if(tagList.size() > 0){
			String name = "";
			for(int i=0; i<arrSize; i++) {
				List<Object> list = new ArrayList<Object>();
				for(int j=0; j<tagList.size(); j++ ){
					if(j == 0) {
						name = tagList.get(j).get("tagId"+i).toString();
					}
					if(tagList.get(j).get("tagValueAvg"+i)==null){
						list.add("");
					}else{
						list.add(tagList.get(j).get("tagValueAvg"+i));
						
					}
					if(i==0){
						xList.add(tagList.get(j).get("statHour").toString());
					}
				}
				JSONObject obj = new JSONObject();
				obj.put("name", name);
				obj.put("data", list);
				yList.add(obj);
			}
		}
		resultMap.put( "xList", xList );
		resultMap.put( "yList", yList );
		resultMap.put( "arrSize", arrSize );
		
		
		return resultMap;
	}
	
	/**
	 * 
	 * 태그모니터링 tagType에 따른 tag 리스트 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/ems/trend/searchTagListAjax.do")
	public Map<String ,Object> searchTagListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		
		//tag리스트조회
		List<FlkMap> tagList = trendService.searchTagList(rawData);
		
		
		resultMap.put( "mng", mng );
		resultMap.put( "tagList", tagList );
		
		return resultMap;
	}
	
	
	/**
	 * 
	 * 트랜드모니터링 tagType에 따른 tag 리스트 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/ems/trend/searchTrendTagListAjax.do")
	public Map<String ,Object> searchTrendTagListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		
		//tag리스트조회
		List<FlkMap> tagList = trendService.selectTrendGroupTagList(rawData);
		
		
		resultMap.put( "mng", mng );
		resultMap.put( "tagList", tagList );
		
		return resultMap;
	}
	
	/**
	 * 
	 * TAG/TREND MONITORING 사용량조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/ems/trend/trendMonitoringAmountAjax.do")
	public Map<String ,Object> trendMonitoringAmountAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(Constants.NO.equals(rawData.getRefreshYn())){
			//Tag별 사용량
			List<RawData> tagUseAmount = trendService.selectTagUseAmount(rawData);
			resultMap.put( "tagUseAmount", tagUseAmount );
		}
		//TAG별 상세사용량
		List<FlkMap> tagUseDetailAmount = trendService.selectTagUseDetailAmount(rawData);
		//TAG명 리스트
		List<FlkMap> tagNameList = trendService.selectTagName(rawData);
		
		resultMap.put( "tagUseDetailAmount", tagUseDetailAmount );
		resultMap.put( "tagNameList", tagNameList );
		
		
		return resultMap;
	}
	
	/**
	 * 
	 * COMPARE 비교모니터링 화면호출
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/trend/compareMonitoring.do")
	public String compareMonitoring(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		//TagList 온도~\
		List<FlkMap> typeList = trendService.searchTypeList(rawData);
		
		model.addAttribute( "mng", mng );
		model.addAttribute( "typeList", typeList );
		
		// 설비제어 > 트랜드보기 버튼으로 이동 시 
		model.addAttribute( "tagInfo", trendService.selectTagInfo(rawData));
		
		return "/ems/trend/compareMonitoring";
	}
	
	/**
	 * 
	 * INDICATOR 지표모니터링 화면호출
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/trend/indicatorMonitoring.do")
	public String indicatorMonitoring(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		//지표태그리스트
		List<RawData> typeList = trendService.selectIndicatorTagList(rawData);
		
		model.addAttribute( "mng", mng );
		model.addAttribute( "typeList", typeList );
		
		// 설비제어 > 트랜드보기 버튼으로 이동 시 
		model.addAttribute( "tagInfo", trendService.selectTagInfo(rawData));
		
		return "/ems/trend/indicatorMonitoring";
	}
	
	/**
	 * 
	 * COMPARE 비교모니터링 데이터조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/ems/trend/compareMonitoringAjax.do")
	public Map<String ,Object> compareMonitoringAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//모니터링 데이터 조회
		List<FlkMap> tagList = null;
		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		JSONArray yAxis = new JSONArray();
		
		tagList = trendService.selectCompareMonitoringData(rawData);
		if(tagList.size() > 0){
			String name = "";
			String format = "";
			String text = "";
			for(int i=0; i<2; i++) {
				List<Object> list = new ArrayList<Object>();
				for(int j=0; j<tagList.size(); j++ ){
					if(j == 0) {
						name = tagList.get(j).get("tagId"+i).toString();
					}
					if(tagList.get(j).get("tagValueAvg"+i)==null){
						list.add("");
					}else{
						list.add(tagList.get(j).get("tagValueAvg"+i));
						
					}
					if(i==0){
						xList.add(tagList.get(j).get("statHour").toString());
					}
				}
				JSONObject obj = new JSONObject();
				obj.put("name", name);
				obj.put("data", list);
				yList.add(obj);
				
				if(i==0){
					format = "{value}"+tagList.get(0).get("tagUnit"+0).toString();
					text = tagList.get(0).get("tagType"+0).toString();
					JSONObject formatObj = new JSONObject();
					JSONObject textObj = new JSONObject();
					JSONObject lastObj = new JSONObject();
					formatObj.put("format", format);
					textObj.put("text", text);
					lastObj.put("labels", formatObj);
					lastObj.put("title", textObj);
					yAxis.add(lastObj);
				}
			}
		}
		resultMap.put( "xList", xList );
		resultMap.put( "yList", yList );
		resultMap.put( "yAxis", yAxis );
		
		return resultMap;
	}
	
	/**
	 * 
	 * INDICATOR 모니터링 데이터조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/ems/trend/indicatorMonitoringAjax.do")
	public Map<String ,Object> indicatorMonitoringAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//모니터링 데이터 조회
		List<FlkMap> tagList = null;
		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		JSONArray yAxis = new JSONArray();
		
		tagList = trendService.selectIndicatorMonitoringData(rawData);
		if(tagList.size() > 0){
			String name = "";
			String format = "";
			String text = "";
			List<Object> list = new ArrayList<Object>();
			for(int j=0; j<tagList.size(); j++ ){
				if(j == 0) {
					name = tagList.get(j).get("tagId").toString();
					format = "{value}"+tagList.get(j).get("tagUnit").toString();
					text = tagList.get(j).get("tagId").toString();
				}
				if(tagList.get(j).get("analValue")==null){
					list.add("");
				}else{
					list.add(tagList.get(j).get("analValue"));
					
				}
				xList.add(tagList.get(j).get("statHour").toString());
			}
			JSONObject obj = new JSONObject();
			obj.put("name", name);
			obj.put("data", list);
			yList.add(obj);
			
			JSONObject formatObj = new JSONObject();
			JSONObject textObj = new JSONObject();
			JSONObject lastObj = new JSONObject();
			formatObj.put("format", format);
			textObj.put("text", text);
			lastObj.put("labels", formatObj);
			lastObj.put("title", textObj);
			yAxis.add(lastObj);
		}
		
		//Tag별 사용량
		List<RawData> tagUseAmount = trendService.selectIndicatorUseAmount(rawData);
		
		resultMap.put( "tagUseAmount", tagUseAmount );
		resultMap.put( "tagUseDetailAmount", tagList );
		resultMap.put( "xList", xList );
		resultMap.put( "yList", yList );
		resultMap.put( "yAxis", yAxis );
		
		return resultMap;
	}
	/**
	 * 
	 * COMPARE MONITORING 사용량조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/ems/trend/compareMonitoringAmountAjax.do")
	public Map<String ,Object> compareMonitoringAmountAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//Tag별 사용량
		List<RawData> tagUseAmount = trendService.selectCompareUseAmount(rawData);
		resultMap.put( "tagUseAmount", tagUseAmount );
		//비교계산식
		double maxTagValue_0 = tagUseAmount.get(0).getMaxTagValue();
		double maxTagValue_1 = tagUseAmount.get(1).getMaxTagValue(); 
		double minTagValue_0 = tagUseAmount.get(0).getMinTagValue(); 
		double minTagValue_1 = tagUseAmount.get(1).getMinTagValue();  
		double avgTagValue_0 = tagUseAmount.get(0).getAvgTagValue();  
		double avgTagValue_1 = tagUseAmount.get(1).getAvgTagValue();   
		rawData.setDiffMax(Math.round(maxTagValue_1-maxTagValue_0));
		rawData.setDiffMin(Math.round(minTagValue_1-minTagValue_0));
		rawData.setDiffAvg(Math.round(avgTagValue_1-avgTagValue_0));
		rawData.setDiffMaxRt(Math.round((maxTagValue_1-maxTagValue_0)/maxTagValue_1*100)/100.0);
		rawData.setDiffMinRt(Math.round((minTagValue_1-minTagValue_0)/minTagValue_1*100)/100.0);
		rawData.setDiffAvgRt(Math.round((avgTagValue_1-avgTagValue_0)/avgTagValue_1*100)/100.0);
		//TAG별 상세사용량
		List<FlkMap> tagUseDetailAmount = trendService.selectCompareUseDetailAmount(rawData);
		
		resultMap.put( "tagUseDetailAmount", tagUseDetailAmount );
		resultMap.put("rawData", rawData);
		
		return resultMap;
	}
	
	/**
	 * 
	 * 모니터링 사용량 엑셀다운로드
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/trend/excelDownload.do")
	public void excelDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model, RawData rawData) throws Exception {
		
		Map<String, Object> beans = new HashMap<String, Object>();
		List<RawData> tagUseAmount = null;
		List<FlkMap> tagUseDetailAmount = null;
		String templete = "";
		
		if(Constants.COMPARE.equals(rawData.getMonitoringType())){
			templete = Constants.COMPARE_TMP;
			tagUseAmount = trendService.selectCompareUseAmount(rawData);
			//비교계산식
			double maxTagValue_0 = tagUseAmount.get(0).getMaxTagValue();
			double maxTagValue_1 = tagUseAmount.get(1).getMaxTagValue(); 
			double minTagValue_0 = tagUseAmount.get(0).getMinTagValue(); 
			double minTagValue_1 = tagUseAmount.get(1).getMinTagValue();  
			double avgTagValue_0 = tagUseAmount.get(0).getAvgTagValue();  
			double avgTagValue_1 = tagUseAmount.get(1).getAvgTagValue();   
			rawData.setDiffMax(Math.round(maxTagValue_1-maxTagValue_0));
			rawData.setDiffMin(Math.round(minTagValue_1-minTagValue_0));
			rawData.setDiffAvg(Math.round(avgTagValue_1-avgTagValue_0));
			rawData.setDiffMaxRt(Math.round((maxTagValue_1-maxTagValue_0)/maxTagValue_1*100)/100.0);
			rawData.setDiffMinRt(Math.round((minTagValue_1-minTagValue_0)/minTagValue_1*100)/100.0);
			rawData.setDiffAvgRt(Math.round((avgTagValue_1-avgTagValue_0)/avgTagValue_1*100)/100.0);
			
			tagUseDetailAmount = trendService.selectCompareUseDetailAmount(rawData);
			
			//상세사용량 타이틀
			rawData.setTitle1(tagUseAmount.get(0).getTagDate()+tagUseAmount.get(0).getTagId());
			rawData.setTitle2(tagUseAmount.get(1).getTagDate()+tagUseAmount.get(1).getTagId());
			rawData.setTitle3(tagUseAmount.get(1).getTagDate()+Constants.COMPARE_VALUE);
			rawData.setTitle4(tagUseAmount.get(1).getTagDate()+Constants.COMPARE_RATE);
		}else if(Constants.INDICATOR.equals(rawData.getMonitoringType())){
			templete = Constants.INDICATOR_TMP;
			//Tag별 사용량
			tagUseAmount = trendService.selectIndicatorUseAmount(rawData);
			//TAG별 상세사용량
			tagUseDetailAmount = trendService.selectIndicatorMonitoringData(rawData);
		}else if(Constants.TAG.equals(rawData.getMonitoringType())||Constants.TREND.equals(rawData.getMonitoringType())){
			if(Constants.TAG.equals(rawData.getMonitoringType())){
				templete = Constants.TAG_TMP;
			}else if(Constants.TREND.equals(rawData.getMonitoringType())){
				templete = Constants.TREND_TMP;
			}
			if(Constants.NO.equals(rawData.getRefreshYn())){
				//Tag별 사용량
				tagUseAmount = trendService.selectTagUseAmount(rawData);
			}
			//TAG별 상세사용량
			tagUseDetailAmount = trendService.selectTagUseDetailAmount(rawData);
			//TAG명 리스트
			List<FlkMap> tagNameList = trendService.selectTagName(rawData);
			beans.put("tagNameList", tagNameList);
		}
		
        beans.put("tagUseAmount", tagUseAmount);
        beans.put("rawData", rawData);
        beans.put("tagUseDetailAmount", tagUseDetailAmount);
        
        ExcelJxls mkExcel = new ExcelJxls();
        mkExcel.download(request, response, beans, "monitoring", templete);
		
	}
}
