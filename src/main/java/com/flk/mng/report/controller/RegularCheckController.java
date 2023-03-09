package com.flk.mng.report.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flk.api.domain.File;
import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.enums.FacilityEnum;
import com.flk.common.utility.PageUtil;
import com.flk.mng.report.domain.Maintenance;
import com.flk.mng.report.service.RegularCheckService;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.user.domain.Mng;

@Controller
public class RegularCheckController {

	@Autowired
	private SiteGroupService siteGroupService;
	@Autowired
	private RegularCheckService regularCheckService;
	
	@Value("#{code['record.type.cdId']}")
	private String recordTypeCdId;		// 상황 기준 타입
	
	/**
	 * 보고서관리 > 정기점검 항목관리 화면 
	 * @param request
	 * @param response
	 * @param report
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/check/regularCheckItemView.do")
	public String regularCheckItemView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("maintenance") Maintenance maintenance, ModelMap model) throws Exception {
		
		//지점그룹리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("siteGroupList", siteGroupService.searchSiteGroupList(siteGroup));
		
		return "/uems/mng/report/regularCheckItemView";
	}

	
	/**
	 * 보고서관리 > 정기점검항목관리화면 > 해당지점 장비리스트 조회 ajax
	 * 
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/uems/mng/check/selectFacilityListAjax.do")
	public Map<String, Object> selectFacilityListAjax(@ModelAttribute("maintenance") Maintenance maintenance) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//장비리스트조회
		resultMap.put("facilityList", regularCheckService.selectFacilityList(maintenance));
		
		return resultMap;
	}
	
	/**
	 * 보고서관리 > 정기점검항목관리화면 > 해당장비 점검항목 리스트 조회
	 * 
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/uems/mng/check/selectFacilityQueListAjax.do")
	public Map<String, Object> selectFacilityQueListAjax(@ModelAttribute("maintenance") Maintenance maintenance) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		/*String[] searchValArr = maintenance.getSearchVal().split("\\|");
		maintenance.setFacilityId(searchValArr[0]);
		maintenance.setSiteId(searchValArr[1]);*/
		//점검항목 리스트 조회
		List<FlkMap> facilityQueList = regularCheckService.selectFacilityQueList(maintenance);
		resultMap.put("facilityQueList", facilityQueList);
		return resultMap;
	}
	
	/**
	 * 해당장비 점검항목 리스트 > 점검항목 Question 추가/수정/삭제
	 * 
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/uems/mng/check/saveFacilityQueListAjax.do")
	public Map<String, Object> saveFacilityQueListAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody Maintenance listMap) throws Exception {
		
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		listMap.setRegId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Boolean result = regularCheckService.saveFacilityQueList(listMap);
		if(result){
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
		}else{
			resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
			resultMap.put(Constants.RESULT_MSG, Constants.ERROR_MSG);
			
		}
		return resultMap;
	}
	
	/**
	 * 보고서관리 > 정기점검항목관리화면 > 대항목 선택에 따른 상세항목리스트 조회
	 * 
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/uems/mng/check/selectFacilityAnsListAjax.do")
	public Map<String, Object> selectFacilityAnsListAjax(@ModelAttribute("maintenance") Maintenance maintenance) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		maintenance.setMsqId(maintenance.getSearchVal());
		//점검항목 상세 리스트 조회
		List<FlkMap> facilityAnsList = regularCheckService.selectFacilityAnsList(maintenance);
		resultMap.put("facilityAnsList", facilityAnsList);
		return resultMap;
	}
	
	/**
	 * 해당장비 점검항목 리스트 > 점검항목 Answer 추가/수정/삭제
	 * 
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/check/saveFacilityAnsListAjax.do")
	@ResponseBody
	public Map<String, Object> saveFacilityAnsListAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody Maintenance listMap) throws Exception {
		
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);

		listMap.setRegId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Boolean result = regularCheckService.saveFacilityAnsList(listMap);
		if(result){
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
		}else{
			resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
			resultMap.put(Constants.RESULT_MSG, Constants.ERROR_MSG);
			
		}
		return resultMap;
	}
	
	/**
	 * 정기점검 목록관리 리스트
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/check/regularCheckList.do")
	public String regularCheckList(HttpServletRequest request, HttpServletResponse response, ModelMap model, Maintenance maintenance,HttpSession session) throws Exception {
		
		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		model.addAttribute("groupAllList", siteGroupService.searchSiteGroupList(siteGroup));
		
		PageUtil pageutil = new PageUtil(request, maintenance.getCurrPage(), maintenance.getListSize());
		maintenance.setFirstIndex(pageutil.getFirstIndex());
		maintenance.setLastIndex(pageutil.getLastIndex());
		//점검완료리스트조회
		List<FlkMap> regularChkList = regularCheckService.selectFacilityCheckCmpltList(maintenance);
		pageutil.setList(regularChkList);
		maintenance.setPageutil(pageutil);
		model.addAttribute("regularChkList",regularChkList);
		model.addAttribute("maintenance",maintenance);
		return "/uems/mng/report/regularCheckList";
	}
	
	/**
	 * 정기점검 목록관리 상세
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/uems/mng/check/regularCheckDetail.do")
	public String regularCheckDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session, Maintenance maintenance) throws Exception {
		
 		session.setAttribute("SITE_INFO", maintenance);
		// 점검항목조회
		List<FlkMap> questionList = regularCheckService.selectFacilityCheckCmpltQuestion(maintenance);
		List<FlkMap> answerList = regularCheckService.selectFacilityCheckCmpltAnswer(maintenance);
		
		// 장비정보조회
		Map<String, Object> resultMap =  regularCheckService.selectFacilityCheckDetailInfo(maintenance);
		FlkMap detailInfo = (FlkMap) ((Map<String, Object>)resultMap.get("facilityMap")).get("facilityInfo");
		
		List<FlkMap> subDetailList = null;
		if(maintenance.getFacilityKind().equals(FacilityEnum.PUMP.getCode())||maintenance.getFacilityKind().equals(FacilityEnum.CTOWER.getCode())){
			subDetailList = (List<FlkMap>) ((Map<String, Object>)resultMap.get("facilityMap")).get("subList");
			model.addAttribute("SUB_DETAIL_INFO_SIZE", subDetailList.size()); // sub장비리스트 사이즈
		}else{
			model.addAttribute("SUB_DETAIL_INFO_SIZE", 0); // sub장비리스트 사이즈
		}
		String url = FacilityEnum.enumOf(maintenance.getFacilityKind()).getUrl();
		
		// 이미지조회
		List<Maintenance> photoList = regularCheckService.selectPhotoList(maintenance);
		
		model.addAttribute("questionList", questionList);
		model.addAttribute("answerList", answerList);
		model.addAttribute("DETAIL_INFO", detailInfo);
		model.addAttribute("SUB_DETAIL_INFO", subDetailList); 
		model.addAttribute("maintenance", maintenance);
		model.addAttribute("photoList", photoList);
		
		return "/uems/mng/report/"+url;
	}
	
	/**
	 * 정지점검 내용 수정
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/check/updateRegularCheckInfo.do")
	@ResponseBody
	public Map<String, Object> updateRegularCheckInfo(@RequestBody Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session, Maintenance maintenance) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		paramMap.put("regId", loginVo.getMngId());
		
		resultMap = regularCheckService.updateRegularCheckInfo(paramMap);
		
		return resultMap;
	}
	
	/**
	 * 정기점검 보고서 생성
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/check/createRegularCheckReport.do")
	public String createRegularCheckReport(HttpServletRequest request, HttpServletResponse response, ModelMap model, Maintenance maintenance) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		maintenance.setRegId(loginVo.getMngId());
		maintenance.setUpdateId(loginVo.getMngId());
		
		resultMap = regularCheckService.createRegularCheckReport(request, maintenance);
		model.addAttribute("resultMsg", resultMap.get(Constants.RESULT_MSG));
		
		return "forward:/Relay.do?_forward_page=/uems/mng/check/regularCheckList.do";
	}
	
	
	/**
	 * 정기점검 장비 상태 리스트 
	 * 
	 * @param request
	 * @param response
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/check/selectFacilityStatusListAjax.do")
	@ResponseBody
	public Map<String, Object> selectFacilityStatusListAjax(HttpServletRequest request, HttpServletResponse response, Maintenance maintenance) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultList", regularCheckService.selectFacilityStatusList(maintenance));
		return resultMap;
	}
	
	/**
	 * 정기점검 상세 이미지 업로드(임시저장)
	 * @param req
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/check/regularCheckUploadImg.do")
	@ResponseBody
	public Map<String, Object> regularCheckUploadImg(@ModelAttribute Maintenance maintenance,HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		File file = new File();
		file.setMngId(loginVo.getMngId());
		file.setMsId(maintenance.getMsId());
		file.setMsqId(maintenance.getMsqId());
		file.setChkMonth(maintenance.getChkMonth());
		file.setSubFacilityId(maintenance.getSubFacilityId());
		file.setFileName(maintenance.getUploadImg().getOriginalFilename());
		file.setUploadFile1(maintenance.getUploadImg());
		resultMap = regularCheckService.uploadImg(file);
		
		return resultMap;
	}
	
}
