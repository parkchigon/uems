package com.flk.mng.work.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.work.domain.Weather;
import com.flk.mng.work.service.WeatherService;

@Controller
public class WeatherController {
	
	@Autowired
	private SiteGroupService siteGroupService;
	
	@Autowired
	private WeatherService weatherService;

	/**
	 * 날씨별 부하량 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param weather
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/weather/weatherOverList.do")
	public String selectWeatherOverListView(HttpServletRequest request, HttpServletResponse response, ModelMap model, Weather weather) throws Exception {
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/weather/weatherOverList";
	}
	
	
	/**
	 * 날씨별 부하량 조회
	 * 
	 * @param request
	 * @param response
	 * @param weather
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/weather/selectWeatherOverAjax.do")
	@ResponseBody
	public Map<String, Object> selectWeatherOverAjax(HttpServletRequest request, HttpServletResponse response, Weather weather) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultList", weatherService.selectWeatherOver(weather));
		return resultMap;
	}
}
