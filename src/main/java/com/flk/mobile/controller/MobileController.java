package com.flk.mobile.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.enums.FacilityEnum;
import com.flk.common.utility.SessionUtil;
import com.flk.mng.report.domain.Maintenance;
import com.flk.mobile.service.MobileService;

/**
 * Mobile Web
 *
 */
@Controller
public class MobileController {

	@Autowired
	private MobileService mobileService;
	
	
	/**
	 * 메인화면 호출
	 * 
	 * @param login
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mobileWeb/uappMain")
	public String uappMainAllSite(@ModelAttribute Maintenance maintenance, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		SessionUtil.put(request, "MNG_ID", maintenance.getMngId());
		String returnUrl = "";
		if(maintenance.getSgId()==null || Constants.EMART.equals(maintenance.getSgId())){
			maintenance.setSgName(Constants.EMART_STR);
			maintenance.setSgId(Constants.EMART);
			returnUrl = "/mobileMain/eSiteList";
		}else{
			maintenance.setSgName(Constants.SGG_STR);
			returnUrl = "/mobileMain/sSiteList";
		}
		List<FlkMap> siteList = mobileService.selectMainSiteList(maintenance);
		model.addAttribute("siteList", siteList);
		SessionUtil.put(request, "SITE_INFO", maintenance);
		
		return returnUrl;
	}
	
	/**
	 * 지점별 메인화면 호출
	 * 
	 * @param login
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mobileWeb/uappMainForSite")
	public String uappMain(@ModelAttribute Maintenance maintenance, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		SessionUtil.put(request, "SITE_INFO", maintenance);
		model.addAttribute("sgId",maintenance.getSgId());
		
		return "/mobileMain/uappMain";
	}
	
	
	/**
	 * 장비점검화면 호출
	 * 
	 * @param login
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mobileWeb/uappCheckView")
	public String uappCheckView(@ModelAttribute Maintenance maintenance, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		SessionUtil.put(request, "SITE_INFO", maintenance);
		SessionUtil.put(request, "checkYear", maintenance.getCheckYear());
		SessionUtil.put(request, "checkMonth", maintenance.getCheckMonth());
		
		Map<String, Object> resultMap = mobileService.selectCheckData(maintenance, maintenance.getCount());
		
		if (resultMap == null) {
			model.addAttribute("LIST", "NULL");
			return "/mobileMain/uappMain";
		}
		
		List<Maintenance> facilityList = (List<Maintenance>) resultMap.get("facilityList");
		List<FlkMap> questionList = (List<FlkMap>) resultMap.get("questionList");
		List<FlkMap> answerList = (List<FlkMap>) resultMap.get("answerList");
		FlkMap detailInfo = (FlkMap) ((Map<String, Object>)resultMap.get("facilityMap")).get("facilityInfo");
		Maintenance basicInfo = (Maintenance) resultMap.get("maintenance");
		// 01.펌프 05.냉각탑 sub장비 정보 셋팅
		List<FlkMap> subDetailList = null;
		if(basicInfo.getFacilityKind().equals(FacilityEnum.PUMP.getCode())||basicInfo.getFacilityKind().equals(FacilityEnum.CTOWER.getCode())){
			subDetailList = (List<FlkMap>) ((Map<String, Object>)resultMap.get("facilityMap")).get("subList");
			model.addAttribute("SUB_DETAIL_INFO_SIZE", subDetailList.size()); // sub장비리스트 사이즈
		}else{
			model.addAttribute("SUB_DETAIL_INFO_SIZE", 0); // sub장비리스트 사이즈
		}
		String url = FacilityEnum.enumOf(maintenance.getFacilityKind()).getUrl();
		
		model.addAttribute("FACILITY_LIST", facilityList);		 // 장비리스트
		model.addAttribute("SUB_DETAIL_INFO", subDetailList); 	 // 장비상세정보>sub장비정보
		model.addAttribute("DETAIL_INFO", detailInfo);			 // 장비상세정보
		model.addAttribute("questionList", questionList);
		model.addAttribute("answerList", answerList);
		model.addAttribute("BASIC_INFO", basicInfo);
		

		return "/mobile/"+url;
	}
	
	/**
	 * 점검내용 등록 / 수정
	 * @param paramMap
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/mobileWeb/insertCheckValueAjax")
	public Map<String, Object> insertCheckValueAjax(@RequestBody Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String mngId = (String) SessionUtil.get(request, "MNG_ID");
		paramMap.put("regId", mngId);
		
		resultMap = mobileService.insertCheckValue(paramMap);
		
		return resultMap;
	}

	/**
	 * 해당 사진/이미지 조회
	 * @param maintenance
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/mobileWeb/selectPhotoListAjax", method=RequestMethod.POST)
	public Map<String, Object> selectPhotoList(@ModelAttribute Maintenance maintenance, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		maintenance.setRegId((String) SessionUtil.get(request, "MNG_ID"));
		
		List<Maintenance> photoList = mobileService.selectPhotoList(maintenance);
		resultMap.put("photoList", photoList);
		
		return resultMap;
	}

	/**
	 * 해당 사진/이미지 삭제
	 * @param maintenance
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/mobileWeb/deletePhotoAjax")
	public Map<String, Object> deletePhoto(@ModelAttribute Maintenance maintenance, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		maintenance.setRegId((String) SessionUtil.get(request, "MNG_ID"));
		
		int delResult = mobileService.deletePhoto(maintenance);
		resultMap.put("result", delResult);
		
		return resultMap;
	}
	
}
