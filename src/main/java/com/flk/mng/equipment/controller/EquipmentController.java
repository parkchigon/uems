package com.flk.mng.equipment.controller;

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
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.domain.Constants;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.equipment.domain.AutoCtrl;
import com.flk.mng.equipment.domain.CTower;
import com.flk.mng.equipment.domain.Chiller;
import com.flk.mng.equipment.domain.ElecMcc;
import com.flk.mng.equipment.domain.Equipment;
import com.flk.mng.equipment.domain.HeatExc;
import com.flk.mng.equipment.domain.HeatStg;
import com.flk.mng.equipment.domain.Pump;
import com.flk.mng.equipment.service.EquipmentService;
import com.flk.mng.report.domain.Maintenance;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;


@Controller
public class EquipmentController {
	
	@Autowired
	private EquipmentService equipmentService;
	@Autowired
	private SiteGroupService siteGroupService;
	@Autowired
	private SiteService siteService;
	
	/**펌프관리 리스트 조회
	 * @param request
	 * @param response
	 * @param pump
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/pumpList.do")
	public String searchPumpListView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("pump") Pump pump, ModelMap model) throws Exception {
		//페이징
		PageUtil pageutil = new PageUtil(request, pump.getCurrPage(), pump.getListSize());
		pump.setFirstIndex(pageutil.getFirstIndex());
		pump.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> pumpList = equipmentService.searchPumpList(pump);

		pageutil.setList(pumpList);
		pump.setPageutil(pageutil);
		pump.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("pumpList", pumpList);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		return "/uems/mng/equipment/pumpList";
	}
	
	/**펌프관리 등록,수정화면
	 * @param request
	 * @param response
	 * @param pump
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/pumpRegist.do")
	public String addPumpView(HttpServletRequest request, HttpServletResponse response,   @ModelAttribute("pump") Pump pump, ModelMap model) throws Exception {
		
		Pump pumpInfo = new Pump();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(pump.getFpmId())){ 
	        FlkMap map = equipmentService.searchPumpInfo(pump);
	       
	        if(map != null) {
	        	pumpInfo = (Pump) MethodUtil.convertToOject(map, pumpInfo);
	        }
	        
	        List<FlkMap> searchSubPumpList = equipmentService.searchSubPumpList(pump);
	        model.addAttribute("searchSubPumpList", searchSubPumpList);
		}
		model.addAttribute("pumpInfo", pumpInfo);
		
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		//펌프타입 리스트
		List<FlkMap> pumpTypeList = equipmentService.searchPumpTypeList(pump);
		model.addAttribute("pumpTypeList",pumpTypeList);
		
		return "/uems/mng/equipment/pumpRegist";
		
	}
	
	
	/**펌프관리 등록 /수정
	 * @param request
	 * @param response
	 * @param pump
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/pumpRegistExe.do")
	public String addPump(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pump")Pump pump, ModelMap model) throws Exception {
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		pump.setRegId(loginVo.getMngId());
		pump.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(pump.getFpmId())){ //등록
			equipmentService.addPump(pump);
		}else{
			equipmentService.modifyPump(pump); //수정
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/equipment/pumpList.do";
	}
	
	
	/**선택한 그룹의 지점 리스트 조회(장비관리 공통)
	 * @param request
	 * @param response
	 * @param equipment
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/equipment/selectSiteListAjax.do")
	@ResponseBody
	public Map<String, Object> selectSiteListAjax(HttpServletRequest request, HttpServletResponse response, Equipment equipment) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 지점 리스트
		Site site = new Site(1, Constants.YES);
		if( equipment.getFlag().equals("list")){
			site.setSearchCondition(equipment.getSearchCondition());
		}else if(equipment.getFlag().equals("reg")){
			site.setSearchCondition(equipment.getSgId());
		}
		List<FlkMap> siteList = siteService.searchSiteList(site);
		resultMap.put("siteList", siteList);
		
		return resultMap;
	}
	
	
	/** 열교환기 관리 리스트 조회
	 * @param request
	 * @param response
	 * @param heatExc
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/heatExcList.do")
	public String searchHeatExcListView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("heatExc") HeatExc heatExc, ModelMap model) throws Exception {
		//페이징
		PageUtil pageutil = new PageUtil(request, heatExc.getCurrPage(), heatExc.getListSize());
		heatExc.setFirstIndex(pageutil.getFirstIndex());
		heatExc.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> heatExcList = equipmentService.searchHeatExcList(heatExc);

		pageutil.setList(heatExcList);
		heatExc.setPageutil(pageutil);
		heatExc.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("heatExcList", heatExcList);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		return "/uems/mng/equipment/heatExcList";
	}
	
	/** 열교환기 등록,상세 화면
	 * @param request
	 * @param response
	 * @param heatExc
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/heatExcRegist.do")
	public String addHeatExcView(HttpServletRequest request, HttpServletResponse response,   @ModelAttribute("heatExc") HeatExc heatExc, ModelMap model) throws Exception {
		
		HeatExc heatExcInfo = new HeatExc();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(heatExc.getFhmId())){ 
			
	        FlkMap map = equipmentService.searchHeatExcInfo(heatExc);
	        if(map != null) {
	        	heatExcInfo = (HeatExc) MethodUtil.convertToOject(map, heatExcInfo);
	        }
		} 
	     model.addAttribute("heatExcInfo", heatExcInfo);
		
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		
		return "/uems/mng/equipment/heatExcRegist";
		
	}
	
	/**열교환기 등록,수정,삭제
	 * @param request
	 * @param response
	 * @param heatExc
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/heatExcRegistExe.do")
	public String addHeatExc(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("heatExc") HeatExc heatExc, ModelMap model) throws Exception {
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		heatExc.setRegId(loginVo.getMngId());
		heatExc.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(heatExc.getFhmId())){ //등록
			equipmentService.addHeatExc(heatExc);
		}else{
			equipmentService.modifyHeatExc(heatExc); //수정
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/equipment/heatExcList.do";
	}
	
	/**냉동기 리스트조회
	 * @param request
	 * @param response
	 * @param chiller
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/chillerList.do")
	public String searchChillerListView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("chiller") Chiller chiller, ModelMap model) throws Exception {
		//페이징
		PageUtil pageutil = new PageUtil(request, chiller.getCurrPage(), chiller.getListSize());
		chiller.setFirstIndex(pageutil.getFirstIndex());
		chiller.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> chillerList = equipmentService.searchChillerList(chiller);
		pageutil.setList(chillerList);
		chiller.setPageutil(pageutil);
		chiller.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("chillerList", chillerList);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		return "/uems/mng/equipment/chillerList";
	}
	
	/**냉동기 등록,상세 화면
	 * @param request
	 * @param response
	 * @param chiller
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/chillerRegist.do")
	public String addChillerView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("chiller") Chiller chiller, ModelMap model) throws Exception {
		
		Chiller chillerInfo = new Chiller();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(chiller.getFsmId())){ 
			
	        FlkMap map = equipmentService.searchChillerInfo(chiller);
	        if(map != null) {
	        	chillerInfo = (Chiller) MethodUtil.convertToOject(map, chillerInfo);
	        }
		}
	     model.addAttribute("chillerInfo", chillerInfo);
		
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		//냉동기타입 리스트
		List<FlkMap> chillerTypeList = equipmentService.searchChillerTypeList(chiller);
		model.addAttribute("chillerTypeList",chillerTypeList);
		return "/uems/mng/equipment/chillerRegist";
		
	}
	
	/**냉동기 등록,상세,삭제
	 * @param request
	 * @param response
	 * @param chiller
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/chillerRegistExe.do")
	public String addChiller(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("chiller") Chiller chiller,ModelMap model) throws Exception {
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		chiller.setRegId(loginVo.getMngId());
		chiller.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(chiller.getFsmId())){ //등록
			equipmentService.addChiller(chiller);
		}else{
			equipmentService.modifyChiller(chiller); //수정,삭제
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/equipment/chillerList.do";
	}
	
	/**자동제어 리스트조회
	 * @param request
	 * @param response
	 * @param autoCtrl
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/autoCtrlList.do")
	public String searchAutoCtrlListView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("autoCtrl") AutoCtrl autoCtrl, ModelMap model) throws Exception {
		//페이징
		PageUtil pageutil = new PageUtil(request, autoCtrl.getCurrPage(), autoCtrl.getListSize());
		autoCtrl.setFirstIndex(pageutil.getFirstIndex());
		autoCtrl.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> autoCtrlList = equipmentService.searchAutoCtrlList(autoCtrl);
		pageutil.setList(autoCtrlList);
		autoCtrl.setPageutil(pageutil);
		autoCtrl.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("autoCtrlList", autoCtrlList);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		return "/uems/mng/equipment/autoCtrlList";
	}
	
	/**자동제어 등록,상세 화면
	 * @param request
	 * @param response
	 * @param autoCtrl
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/autoCtrlRegist.do")
	public String addAutoCtrlView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("autoCtrl") AutoCtrl autoCtrl, ModelMap model) throws Exception {
		
		AutoCtrl autoCtrlInfo = new AutoCtrl();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(autoCtrl.getFamId())){ 
			
	        FlkMap map = equipmentService.searchAutoCtrlInfo(autoCtrl);
	        if(map != null) {
	        	autoCtrlInfo = (AutoCtrl) MethodUtil.convertToOject(map, autoCtrlInfo);
	        }
		}
	     model.addAttribute("autoCtrlInfo", autoCtrlInfo);
		
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/equipment/autoCtrlRegist";
		
	}
	
	/**자동제어 등록,상세,삭제
	 * @param request
	 * @param response
	 * @param autoCtrl
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/autoCtrlRegistExe.do")
	public String addAutoCtrl(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("autoCtrl") AutoCtrl autoCtrl,ModelMap model) throws Exception {
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		autoCtrl.setRegId(loginVo.getMngId());
		autoCtrl.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(autoCtrl.getFamId())){ //등록
			equipmentService.addAutoCtrl(autoCtrl);
		}else{
			equipmentService.modifyAutoCtrl(autoCtrl); //수정,삭제
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/equipment/autoCtrlList.do";
	}
	
	/** 
	 * 축열조 및 배관 리스트 조회
	 * @param request
	 * @param response
	 * @param heatStg
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/heatStgList.do")
	public String searchHeatStgView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("heatStg") HeatStg heatStg, ModelMap model) throws Exception {
		
		//페이징
		PageUtil pageutil = new PageUtil(request, heatStg.getCurrPage(), heatStg.getListSize());
		heatStg.setFirstIndex(pageutil.getFirstIndex());
		heatStg.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> heatStgList = equipmentService.searchHeatStgList(heatStg);

		pageutil.setList(heatStgList);
		heatStg.setPageutil(pageutil);
		heatStg.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("heatStgList", heatStgList);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		return "/uems/mng/equipment/heatStgList";
	}
	
	/** 축열조 및 배관 등록,상세 화면
	 * @param request
	 * @param response
	 * @param heatStg
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/heatStgRegist.do")
	public String addHeatStgView(HttpServletRequest request, HttpServletResponse response,   @ModelAttribute("heatStg") HeatStg heatStg, ModelMap model) throws Exception {
		
		HeatStg heatStgInfo = new HeatStg();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(heatStg.getFhsm())){ 
	        FlkMap map = equipmentService.searchHeatStgInfo(heatStg);
	        if(map != null) {
	        	heatStgInfo = (HeatStg) MethodUtil.convertToOject(map, heatStgInfo);
	        }
		} 
		
	    model.addAttribute("heatStgInfo", heatStgInfo);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/equipment/heatStgRegist";
	}
	
	/** 축열조 및 배관 등록 요청
	 * @param request
	 * @param response
	 * @param heatStg
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/heatStgRegistExe.do")
	public String addHeatStg(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("heatStg") HeatStg heatStg, ModelMap model) throws Exception {
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		heatStg.setRegId(loginVo.getMngId());
		heatStg.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(heatStg.getFhsm())){ //등록
			equipmentService.addHeatStg(heatStg);
		}else{
			equipmentService.modifyHeatStg(heatStg); //수정
		}
		
		return "forward:/Relay.do?_forward_page=/uems/mng/equipment/heatStgList.do";
	}
	
	/**심야전기 MCC 리스트 조회
	 * @param request
	 * @param response
	 * @param elecMcc
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/elecMccList.do")
	public String searchElecMccListView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("elecMcc") ElecMcc elecMcc, ModelMap model) throws Exception {
		//페이징
				PageUtil pageutil = new PageUtil(request, elecMcc.getCurrPage(), elecMcc.getListSize());
				elecMcc.setFirstIndex(pageutil.getFirstIndex());
				elecMcc.setLastIndex(pageutil.getLastIndex());
				
				List<FlkMap> elecMccList = equipmentService.searchElecMccList(elecMcc);
				pageutil.setList(elecMccList);
				elecMcc.setPageutil(pageutil);
				elecMcc.setCurrPage(String.valueOf(pageutil.getCurrPage()));
				model.addAttribute("elecMccList", elecMccList);
				
				//지점리스트
				SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
				List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
				model.addAttribute("groupAllList", groupAllList);
		return "/uems/mng/equipment/elecMccList";
	}
	
	/** 심야전기 등록,상세 화면
	 * @param request
	 * @param response
	 * @param elecMcc
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/elecMccRegist.do")
	public String addElecMccView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("elecMcc") ElecMcc elecMcc, ModelMap model) throws Exception {
		ElecMcc elecMccInfo = new ElecMcc();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(elecMcc.getFemId())){ 
	        FlkMap map = equipmentService.searchElecMccInfo(elecMcc);
	        if(map != null) {
	        	elecMccInfo = (ElecMcc) MethodUtil.convertToOject(map, elecMccInfo);
	        }
		}
		model.addAttribute("elecMccInfo", elecMccInfo);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/equipment/elecMccRegist";
		
	}
	
	/** 심야전기 등록,수정,삭제
	 * @param request
	 * @param response
	 * @param elecMcc
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/elecMccRegistExe.do")
	public String addAutoCtrl(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("elecMcc") ElecMcc elecMcc,ModelMap model) throws Exception {
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		elecMcc.setRegId(loginVo.getMngId());
		elecMcc.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(elecMcc.getFemId())){ //등록
			equipmentService.addElecMcc(elecMcc);
		}else{
			equipmentService.modifyElecMcc(elecMcc); //수정,삭제
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/equipment/elecMccList.do";
	}

	/** 
	 * 냉각탑 리스트 조회
	 * @param request
	 * @param response
	 * @param cTower
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/cTowerList.do")
	public String searchCTowerView(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute("cTower") CTower cTower, ModelMap model) throws Exception {
		
		//페이징
		PageUtil pageutil = new PageUtil(request, cTower.getCurrPage(), cTower.getListSize());
		cTower.setFirstIndex(pageutil.getFirstIndex());
		cTower.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> cTowerList = equipmentService.searchCTowerList(cTower);

		pageutil.setList(cTowerList);
		cTower.setPageutil(pageutil);
		cTower.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("cTowerList", cTowerList);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		return "/uems/mng/equipment/cTowerList";
	}
	
	
	/** 냉각탑 등록,상세 화면
	 * @param request
	 * @param response
	 * @param cTower
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/cTowerRegist.do")
	public String addCTowerView(HttpServletRequest request, HttpServletResponse response,   @ModelAttribute("cTower") CTower cTower, ModelMap model) throws Exception {
		
		CTower cTowerInfo = new CTower();
		// 상세 화면 정보 조회
		if(StringUtils.isNotBlank(cTower.getFcmId())){ 
	        FlkMap map = equipmentService.searchCTowerInfo(cTower);
	        if(map != null) {
	        	cTowerInfo = (CTower) MethodUtil.convertToOject(map, cTowerInfo);
	        }
	        List<FlkMap> searchSubCTowerList = equipmentService.searchSubCTowerList(cTower);
	        model.addAttribute("searchSubCTowerList", searchSubCTowerList);
		} 
		
	    model.addAttribute("cTowerInfo", cTowerInfo);
		
		//지점리스트
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		return "/uems/mng/equipment/cTowerRegist";
	}
	
	/**냉각탑 등록 /수정
	 * @param request
	 * @param response
	 * @param cTower
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/equipment/cTowerRegistExe.do")
	public String addCTower(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("cTower") CTower cTower, ModelMap model) throws Exception {
		//로그인정보
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		cTower.setRegId(loginVo.getMngId());
		cTower.setUpdateId(loginVo.getMngId());
		
		if(StringUtils.isBlank(cTower.getFcmId())){ //등록
			equipmentService.addCTower(cTower);
		}else{
			equipmentService.modifyCTower(cTower); //수정
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/equipment/cTowerList.do";
	}
	
	/**
	 * 냉동기번호 존재여부
	 * @param request
	 * @param response
	 * @param chiller
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "uems/mng/equipment/chiilerNoExistChkAjax.do")
	@ResponseBody
	public Map<String, Object> chiilerNoExistChkAjax(HttpServletRequest request, HttpServletResponse response, Chiller chiller) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = equipmentService.selectChiilerNoExistCount(chiller);
		String resultVal = "";
		if(cnt > 0){
			resultVal = Constants.YES;
		}else{
			resultVal = Constants.NO;
		}
		resultMap.put("existYn", resultVal);
		
		return resultMap;
	}
}
