package com.flk.mng.commPrice.controller;


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

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.utility.StringUtils;
import com.flk.mng.commPrice.domain.CommPrice;
import com.flk.mng.commPrice.service.CommPriceService;
import com.flk.mng.user.domain.Mng;


@Controller
public class CommPriceController {
	@Autowired CommPriceService commPriceService;
	/**공통단가-일반전기요금 리스트조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/commPrice/generalElecList.do")
	public String searchGeneralElecView(HttpServletRequest request, HttpServletResponse response, ModelMap model, CommPrice commPrice) throws Exception {
		commPrice.setEnergyType("01");//일반전기요금
		List<FlkMap> commPriceList = commPriceService.searchCommPriceNmList(commPrice);
		model.addAttribute("commPrice", commPrice);
		model.addAttribute("commPriceList", commPriceList);
		return "/uems/mng/commPrice/generalElecList";
	}
	
	/** 종별선택에 따른 단가데이터LIST
	 * @param request
	 * @param response
	 * @param commPrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/commPrice/selectPriceDataListAjax.do")
	@ResponseBody
	public Map<String, Object> searchPriceDataListAjax(HttpServletRequest request, HttpServletResponse response, CommPrice commPrice) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<FlkMap> priceDataList = commPriceService.searchPriceDataList(commPrice);
		resultMap.put("commPrice",commPrice);
		resultMap.put("priceDataList",priceDataList);
		
		return resultMap;
	}
	
	/** 데이터 선택에 따른 상세정보
	 * @param request
	 * @param response
	 * @param commPrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/commPrice/selectPriceDataInfoAjax.do")
	@ResponseBody
	public Map<String, Object> SiteListAjax(HttpServletRequest request, HttpServletResponse response, CommPrice commPrice) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		FlkMap priceDataInfo = commPriceService.searchPriceDataInfo(commPrice);
		//resultMap.put("commPrice",commPrice);
		resultMap.put("priceDataInfo",priceDataInfo);
		return resultMap;
	}
	
	/**공통단가 등록,수정
	 * @param request
	 * @param response
	 * @param commPrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/commPrice/commPriceRegistExe.do")
	public Map<String, Object> addCommPrice(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("commPrice")CommPrice commPrice) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		commPrice.setRegId(loginVo.getMngId());
		commPrice.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(commPrice.getApplyDateKey())){ //등록
			commPriceService.addCommPrice(commPrice);
		}else{
			commPriceService.modifyCommPrice(commPrice); //수정
		}
		return resultMap;
	}
	
	/** 데이터 중복체크
	 * @param commPrice
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/uems/mng/commPrice/dataCount.do")
	public int getDataCount(@ModelAttribute("commPrice") CommPrice commPrice, ModelMap model) throws Exception {
		int count = commPriceService.searchDataCount(commPrice);
		return count;
	}
	
	
	/**공통단가-심야전기요금 리스트조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/commPrice/midNightElecList.do")
	public String searchMidNightElecView(HttpServletRequest request, HttpServletResponse response, ModelMap model,@ModelAttribute("commPrice")CommPrice commPrice) throws Exception {
		commPrice.setEnergyType("02");//심야전기요금
		List<FlkMap> commPriceList = commPriceService.searchCommPriceNmList(commPrice);
		model.addAttribute("commPrice", commPrice);
		model.addAttribute("commPriceList", commPriceList);
		return "/uems/mng/commPrice/midNightElecList";
	}
	
	/**공통단가-가스요금 리스트조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/commPrice/gasList.do")
	public String searchGasView(HttpServletRequest request, HttpServletResponse response, ModelMap model, @ModelAttribute("commPrice")CommPrice commPrice) throws Exception {
		commPrice.setEnergyType("03");//심야전기요금
		List<FlkMap> commPriceList = commPriceService.searchCommPriceNmList(commPrice);
		model.addAttribute("commPrice", commPrice);
		model.addAttribute("commPriceList", commPriceList);
		return "/uems/mng/commPrice/gasList";
	}
	
	/**가스요금 종별추가
	 * @param request
	 * @param response
	 * @param commPrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/commPrice/commPriceRegistNmExe.do")
	@ResponseBody
	public Map<String, Object> priceNmlListAjax(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("commPrice")CommPrice commPrice) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		commPrice.setRegId(loginVo.getMngId());
		commPrice.setEnergyType("03");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<FlkMap> priceList = commPriceService.searchCommPriceNmList(commPrice);
		int count = priceList.size();
		if(count >= 1){ // 중복체크
			resultMap.put("count",count);
			return resultMap;
		}
		commPriceService.addCommPriceNm(commPrice);
		commPrice.setPriceName(null);// energyType=03 조회하기위해
		List<FlkMap> priceNmList = commPriceService.searchCommPriceNmList(commPrice);
		resultMap.put("priceNmList",priceNmList);
		return resultMap;
	}
}
