package com.flk.mng.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;
import com.flk.mng.user.service.MngService;
import com.flk.system.code.service.CodeService;
import com.flk.system.role.domain.Role;
import com.flk.system.role.service.RoleService;

@Controller
public class MngController {
	
	@Value("#{code['email.domain.cdId']}")
	private String emailDomainCdId;
	@Value("#{code['phone.prenum.cdId']}")
	private String phonePrenumCdId;
	
	@Autowired
	private MngService mngService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private SiteService siteService;
	

	/**
	 * 유저 관리 리스트 
	 * 
	 * @param request	HttpServletRequest
	 * @param mng		관리자VO
	 * @param model		ModelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/user/mngList.do")
	public String searchAdminListView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("mng") Mng mng, ModelMap model) throws Exception {
		
		PageUtil pageutil = new PageUtil(request, mng.getCurrPage(), mng.getListSize());
		mng.setFirstIndex(pageutil.getFirstIndex());
		mng.setLastIndex(pageutil.getLastIndex());

		List<FlkMap> mngList = mngService.searchMngList(mng);
		
		pageutil.setList(mngList); // 하단 계산
		mng.setPageutil(pageutil);
		
		model.addAttribute("resultList", mngList);
		
		return "/uems/mng/user/mngList";
	}
	
	
	/**
	 * 유저 등록 및 수정 화면
	 * 
	 * @param request	HttpServletRequest
	 * @param mng		관리자VO
	 * @param model		ModelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/user/mngRegist.do")
	public String addMngView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("mng") Mng mng, ModelMap model) throws Exception {
		Mng mngView = new Mng();
		//디테일 화면 시 멤버 정보 가져오기
		if(StringUtils.isNotBlank(mng.getMngId()) ){
	        FlkMap map = mngService.searchMngView(mng);
	        if(map != null) {
	        	mngView = (Mng) MethodUtil.convertToOject(map, mngView);
	        }
		}
		
		model.addAttribute("mngView", mngView);
		
		// 권한 아이디 리스트		
		Role role = new Role();
		role.setLastIndex(1);
		
		// 등록일 경우 최고관리자 권한 미포함
		if(StringUtils.isBlank(mng.getMngId()) ){
			role.setMasterYn(Constants.NO);	
		}
		List<FlkMap> roleList = roleService.searchRoleList(role);
		model.addAttribute("rollAllList", roleList);
		
		// 사이트 리스트
		Site site = new Site(1, Constants.YES);
		List<FlkMap> siteAllList = siteService.searchSiteList(site);
		model.addAttribute("siteAllList", siteAllList);

		model.addAttribute("emailList", codeService.searchCodeList(emailDomainCdId));
		model.addAttribute("phonePrenumList", codeService.searchCodeList(phonePrenumCdId));
		
		return "/uems/mng/user/mngRegist";
	}
	
	/**
	 * 유저 등록 및 수정
	 * 
	 * @param request	HttpServletRequest
	 * @param mng		관리자VO
	 * @param model		ModelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/user/mngRegistExe.do")
	public String addMngAjax(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("mng") Mng mng, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		
		mng.setRegId(loginVo.getMngId());
		mng.setUpdateId(loginVo.getMngId());
		
		// 등록일 경우
		if (StringUtils.isBlank(mng.getMngId())) {
		    // 3종류 혼합 안했을 때 
		    // 길이 체크 및 다른 문자 섞였는지 체크
		    if(!passwordValidator(mng.getLoginPassword())) {
		    	model.addAttribute("resultMsg", "fail.invalid.pwd"); 
		    } else {
		    	mngService.addMng(mng);
		    }
		    
		} else { // 수정일 경우
			mngService.modifyMng(mng);
		}
		return "forward:/Relay.do?_forward_page=/uems/mng/user/mngList.do";
	}

	/**
	 * 유저 아이디 중복체크
	 * 
	 * @param request	HttpServletRequest
	 * @param response	HttpServletResponse
	 * @param mng		관리자VO
	 * @param model		ModelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/mng/user/checkLoginId.do")
	@ResponseBody
	public Map<String, Object> checkLoginIdAjax(HttpServletRequest request, HttpServletResponse response, Mng mng, ModelMap model) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
        FlkMap map = mngService.checkLoginId(mng); 
		if(map == null){
			resultMap.put("result", "Y");
		}else{
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	
	
	/**
	 * 유저 삭제
	 * 
	 * @param request
	 * @param response
	 * @param mng
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/user/mngRemoveExe.do")
	public String removeMng(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("mng") Mng mng, ModelMap model) throws Exception {
		mngService.deleteMngSite(mng);
		mngService.removeMng(mng);
		return "forward:/Relay.do?_forward_page=/uems/mng/user/mngList.do";
	}
	
	
	/**
	 * 패스워드 유효성 검증
	 * 
	 * @param password
	 * @return
	 */
	private boolean passwordValidator(String password) {
		int checkPattern = 0;
		
	    //String[] pattern ={"[0-9]", "[a-z]", "[A-Z]", "[!,@,#,$,%,^,&,*,(,),_,+,=,-]"};
		String[] pattern ={"[0-9]", "[a-z]", "[!,@,#,$,%,^,&,*,(,),_,+,=,-]"};
	    for (int i = 0; i < pattern.length; i++) {
	    	Pattern p = Pattern.compile(pattern[i]);
	    	if (p.matcher(password).find()){
	    		checkPattern++;
	    	}
	    }
	    
	    // 3종류 혼합 안했을 때 
	    // 길이 체크 및 다른 문자 섞였는지 체크
	    //if (checkPattern < 3 || !password.matches("^[a-z0-9A-Z\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\+\\=\\-]{9,16}$")) {
	    if (checkPattern < 2 || !password.matches("^[a-z0-9\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\+\\=\\-]{7,16}$")) {
	    	return false;
	    }
	    
		return true;
	}
	
}
