package com.flk.mng.sitePrice.controller;



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
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.sitePrice.domain.SitePrice;
import com.flk.mng.sitePrice.service.SitePriceService;
import com.flk.mng.user.domain.Mng;
import com.flk.common.domain.Constants;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;

@Controller
public class SitePriceController {
	@Autowired 
	private SitePriceService sitePriceService;
	@Autowired
	private SiteGroupService siteGroupService;
	
	/**지점단가-일반전기요금 첫화면 조회
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/sitePrice/generalElecList.do")
	public String searchGeneralElecView(HttpServletRequest request, HttpServletResponse response, ModelMap model, SitePrice sitePrice) throws Exception {
		
		//지점그룹리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		PageUtil pageutil = new PageUtil(request, sitePrice.getCurrPage(), sitePrice.getListSize());
		sitePrice.setFirstIndex(pageutil.getFirstIndex());
		sitePrice.setLastIndex(pageutil.getLastIndex());
		
		//지점단가리스트
		List<FlkMap> priceDataList = sitePriceService.searchSitePriceList(sitePrice);
		pageutil.setList(priceDataList);
		sitePrice.setPageutil(pageutil);
	    sitePrice.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("priceDataList", priceDataList);
		return "/uems/mng/sitePrice/siteGenElecList";
	}
	
	
	/**연동태그유형 선택에 따른 태그리스트Ajax
	 * @param request
	 * @param response
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/sitePrice/selectTagListAjax.do")
	@ResponseBody
	public Map<String, Object> selectTagListAjax(HttpServletRequest request, HttpServletResponse response,  SitePrice sitePrice) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(("03").equals(sitePrice.getEnergyType())){ //가스 연동tag
			sitePrice.setTagKindCd("TAG_KIND02");
		}else{ //전기연동tag
			sitePrice.setTagKindCd("TAG_KIND04");
		}
		List<FlkMap> tagList = sitePriceService.searchTagList(sitePrice);
		resultMap.put("tagList", tagList);
		return resultMap;
	}
	
	/**종별 이름 리스트
	 * @param request
	 * @param response
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/sitePrice/selectPriceNmListAjax.do")
	@ResponseBody
	public Map<String, Object> selectPriceNmListAjax(HttpServletRequest request, HttpServletResponse response,  SitePrice sitePrice) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<FlkMap> priceNmList = sitePriceService.searchPriceNmList(sitePrice);
		resultMap.put("priceNmList", priceNmList);
		return resultMap;
	}
	
	/** 지점단가 데이터 등록,수정
	 * @param request
	 * @param response
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/sitePrice/sitePriceRegistExe.do")
	public Map<String, Object> addSitePrice(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("sitePrice")SitePrice sitePrice) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		sitePrice.setRegId(loginVo.getMngId());
		sitePrice.setUpdateId(loginVo.getMngId());
		if(("1").equals(sitePrice.getKeyFlag())){ 
			sitePriceService.modifySitePrice(sitePrice); //수정
		}else{
			sitePriceService.addSitePrice(sitePrice); //등록
		}
		return resultMap;
	}
	
	/**지점단가데이터 상세
	 * @param request
	 * @param response
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/sitePrice/selectSitePriceInfoAjax.do")
	@ResponseBody
	public Map<String, Object> selectSitePriceInfoAjax(HttpServletRequest request, HttpServletResponse response,  SitePrice sitePrice) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		FlkMap priceInfo = sitePriceService.searchSitePriceInfo(sitePrice);
		resultMap.put("priceInfo", priceInfo);
		return resultMap;
	}
}