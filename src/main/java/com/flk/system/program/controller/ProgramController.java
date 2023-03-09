package com.flk.system.program.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.LogUtil;
import com.flk.common.utility.StringUtils;
import com.flk.system.program.domain.Program;
import com.flk.system.program.service.ProgramService;

@Controller
public class ProgramController {

	@Autowired
	private ProgramService programService;

	private final Logger logger = LogUtil.serviceLog;

	/**
	 * 프로그램화면 메인 화면
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/program/programList.do")
	public String searchProgramListView(HttpServletRequest request, HttpServletResponse response, Program vo, ModelMap model) throws Exception {

		return "/uems/system/program/programList";
	}

	/**
	 * 메뉴 프로그램 리스트 조회
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/program/programListAjax.do")
	public ModelAndView searchProgramListAjax(HttpServletRequest request, HttpServletResponse response, 
			@RequestBody Program vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		logger.info(vo.toString());

		modelAndView.addObject("programList", programService.searchProgramList(vo));

		return modelAndView;
	}
	
	/**
	 * 메뉴 프로그램 등록 / 수정
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/program/programRegistExeAjax.do")
	public ModelAndView addProgramAjax(HttpServletRequest request, HttpServletResponse response,
			@RequestBody Program vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		String mngId = (String) request.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID);
		
		vo.setRegId(mngId);
		vo.setUpdateId(mngId);
		
		boolean result = true;
		try {
			// ProgramId로 Insert, Update 구분
			if ( StringUtils.isEmpty(vo.getProgramId()) ) {
				programService.addProgram(vo);
			} else {
				programService.modifyProgram(vo);
			}
		} catch(Exception e) {
			logger.error("programRegist error", e);
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
	 * 메뉴 프로그램 삭제
	 * @param request
	 * @param response
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/system/program/programDeleteExeAjax.do")
	public ModelAndView removeProgramAjax(HttpServletRequest request, HttpServletResponse response, 
			@RequestBody Program vo, ModelMap model) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsonView");

		boolean result = true;		
		try{
			programService.removeProgram(vo);
		}catch(Exception e) {
			logger.error("programDelete error", e);
			result = false;
		}

		if (result) {
			modelAndView.addObject("result", "success");
		} else {
			modelAndView.addObject("result", "fail");
		}

		return modelAndView;
	}
}
