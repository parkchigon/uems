package com.flk.system.code.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flk.common.domain.CeWebConstants;
import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.LogUtil;
import com.flk.common.utility.StringUtils;
import com.flk.system.code.domain.Code;
import com.flk.system.code.domain.CodeTree;
import com.flk.system.code.service.CodeService;

/**
 * 
 * 코드 컨트롤러
 *
 */
@Controller
public class CodeController {

	@Autowired
	private CodeService codeService;
	
	private Logger logger = LogUtil.serviceLog;

	/**
	 * 코드 메인 화면
	 * @param request
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/code/codeList.do")
	public String searchCodeView(HttpServletRequest request, HttpServletResponse response, Code vo, ModelMap model) throws Exception {

		if ( StringUtils.isNotBlank(vo.getCodeId()) ) {
			model.addAttribute( "codeId", vo.getCodeId() );
		} else {
			model.addAttribute( "codeId", codeService.searchCodeDetail(vo).get("codeId") );
		}
		return "/uems/system/code/codeList";
	}
	
	/**
	 * 코드 리스트 조회(connectby)
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/code/codeListConnectByAjax.do")
	public ModelAndView searchCodeListConnectByAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody CodeTree vo, ModelMap model) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		List<Map<String, Object>> codes = codeService.searchCodeListConnectBy(vo);  //searchCodeListConnectBy
		
		String codeId = vo.getCodeId();
		
		if ( CollectionUtils.isNotEmpty(codes) ) {
			List<CodeTree> codeTrees = new ArrayList<CodeTree>();
			// 조회된 값에서 부모 아이디(내 아이디 포함) 리스트를 뽑는다.
			List<String> parentIds = searchCodeParentIds(codes, vo.getCodeId());
			
			// Code 객체 리스트를 CodeTree 객체 리스트로 변환
			for ( Map<String, Object> codeMap : codes ) {
				CodeTree codeTree = new CodeTree(codeMap);
				
				if ( parentIds.contains(codeMap.get("codeId").toString()) ) {
					codeTree.getState().put("opened", true);
				}
				if ( StringUtils.isNotEmpty(codeId) && codeId.equals(codeMap.get("codeId").toString()) ) {
					codeTree.getState().put("selected", true);
				}
				codeTrees.add(codeTree);
			}
			
			modelAndView.addObject("treeList", codeTrees);
		}
		return modelAndView;
	}
	

	/**
	 * 코드 등록 / 수정
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/code/codeRegistExeAjax.do")
	public ModelAndView addCodeAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody CodeTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		String mngId = (String) request.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID);
		
		vo.setRegId(mngId);
		vo.setUpdateId(mngId);
		
		boolean result = true;
		try {
			// CdId로 Insert, Update 구분
			if ( StringUtils.isEmpty(vo.getCodeId()) ) {
				result = codeService.addCode(vo) > 0 ? true : false;
			} else {
				result = codeService.modifyCode(vo) > 0 ? true : false;
			}
		} catch(Exception e) {
			logger.error("addCode error", e);
			result = false;
		}

		if (result) {
			modelAndView.addObject("result", "success");
		} else {
			modelAndView.addObject("result", "fail");
		}

		return modelAndView;
	}

	/**
	 * 코드 삭제
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/code/codeDeleteExeAjax.do")
	public ModelAndView removeCodeAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody CodeTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		boolean result = true;
		try{
			result = codeService.removeCode(vo) > 0 ? true : false;
		}catch(Exception e){
			logger.error("removeCode error", e);
			result = false;
		}

		if (result) {
			modelAndView.addObject("result", "success");
		} else {
			modelAndView.addObject("result", "fail");
		}

		return modelAndView;
	}

	/**
	 * 코드 순서 업데이트
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/code/codeOrderUpdateExeAjax.do")
	public ModelAndView modifyCodeOrderAjax(HttpServletRequest request, HttpServletResponse response , @RequestBody CodeTree vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		String mngId = (String) request.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID);
		
		vo.setUpdateId(mngId);
		
		boolean result = true;
		try{
			codeService.modifyCodeOrder(vo);
		}catch(Exception e) {
			logger.error("modifyCodeOrder error", e);
			result = false;
		}

		if (result) {
			modelAndView.addObject("result", "success");
		} else {
			modelAndView.addObject("result", "fail");
		}
		return modelAndView;
	}
	
	
	/**
	 * 코드 조회
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/code/codeListAjax.do")
	public ModelAndView searchCodeListAjax(HttpServletRequest request, HttpServletResponse response , @RequestBody Code vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");
		
		modelAndView.addObject( "codeList", codeService.searchCodeList(vo) );
		return modelAndView;
	}
	
	/**
	 * 부모 아이디 리스트 찾기
	 * Java는 Default Parameter를 지원하지 않아서 Method Overloading으로 처리함.
	 * @param codes
	 * @param id
	 * @return
	 */
	private List<String> searchCodeParentIds(List<Map<String, Object>> codes, String id) {
		
		return searchCodeParentIds(codes, id, new ArrayList<String>());
	}
	
	/**
	 * 부모 아이디 리스트 찾기
	 * @param codeTrees
	 * @param id
	 * @param list
	 * @return
	 */
	private List<String> searchCodeParentIds(List<Map<String, Object>> codes, String id, List<String> list) {
		
		if ( StringUtils.isEmpty(id) ) return list;
		
		CodeTree codeTree = null;
		for ( Map<String, Object> map : codes ) {
			if ( id.equals(map.get("codeId").toString()) ) {
				codeTree = new CodeTree(map);
				break;
			}
		}
		list.add(codeTree.getCodeId());
		
		if ( CeWebConstants.TOP_CODE_ID.equals(codeTree.getParentCodeId()) ) return list;
		
		return searchCodeParentIds(codes, codeTree.getParentCodeId(), list);
	}
}
