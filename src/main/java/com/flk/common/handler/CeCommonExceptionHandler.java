package com.flk.common.handler;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.fasterxml.jackson.core.JsonParseException;
import com.flk.common.domain.Constants;
import com.flk.common.enums.ErrorCodeEnum;
import com.flk.common.exception.AccessDenyException;
import com.flk.common.exception.BizExceptionProperties;
import com.flk.common.exception.FileDownloadException;
import com.flk.common.exception.RoleDenyException;
import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.MessageAccessUtil;
import com.google.gson.Gson;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;

@ControllerAdvice
public class CeCommonExceptionHandler{
	
	private Logger errorLogger = LoggerFactory.getLogger("error");	
	
	@Autowired
	@Qualifier("messageUtil")
	private MessageAccessUtil messageUtil;
	
	@ExceptionHandler(AccessDenyException.class)
    public ModelAndView accessDeniedExceptionHandler(HttpServletRequest request, RuntimeException ex){
		
        ModelAndView view = new ModelAndView();
        view.addObject("message", ex.getMessage());
        view.addObject("url", request.getRequestURL());
        view.setViewName("forward:/Relay.do?_forward_page="+ServiceConfig.SERVICE_LOGIN_PAGE);
        view.addObject("resultMsg", "fail.common.login");
        errorLogger.info("ERR - [AccessDenyException]["+request.getRequestURL()+"]["+ex.getMessage()+"]");
        return view;
    }	

	@ExceptionHandler(RoleDenyException.class)
    public ModelAndView roleDenyExceptionDeniedExceptionHandler(HttpServletRequest request, RuntimeException ex){
		
        ModelAndView view = new ModelAndView();
        view.addObject("message", ex.getMessage());
        view.addObject("url", request.getRequestURL());
        view.setViewName("forward:/Relay.do?_forward_page="+ServiceConfig.SERVICE_LOGIN_PAGE);
        view.addObject("resultMsg", "fail.common.role");
        errorLogger.info("ERR - [RoleDenyException]["+request.getRequestURL()+"]["+ex.getMessage()+"]");
        return view;
    }	
	
	
	@ExceptionHandler(FileDownloadException.class)
	public ModelAndView fileDownloadExceptionHandler(HttpServletRequest request, RuntimeException ex){
		
		String origin = request.getHeader("origin");
		String beforeUri = request.getHeader("referer");
		
		ModelAndView view = new ModelAndView();
        view.addObject("message", ex.getMessage());
        view.addObject("url", request.getRequestURL());
        view.setViewName("forward:/Relay.do?_forward_page="+beforeUri.replace(origin, ""));
        view.addObject("resultMsg", "fail.notExist.reportFile");
        errorLogger.error("Exception Requested URL=" + request.getRequestURL());
        errorLogger.error(ex.getMessage());
		return view;
		
	}
	
	@ExceptionHandler(Exception.class)
    public ModelAndView exception(HttpServletRequest request, Exception ex){
        ModelAndView view = new ModelAndView();
        view.addObject("message", ex.getMessage());
        view.addObject("url", request.getRequestURL());
        view.setViewName(Constants.COMMON_ERROR);
        errorLogger.error("Exception Requested URL=" + request.getRequestURL());
        errorLogger.error(ex.getMessage());
        return view;
        
    }		
	
	
	@ExceptionHandler(BizExceptionProperties.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public Map<String, Object> bizExceptionPropertiesHandler(HttpServletRequest request, BizExceptionProperties ex){
		// 500에러
		errorLogger.error("", ex);

		// 코드로 메시지를 가져온다.
		String message = null;

		if (ex.getMsgArgs() != null && ex.getMsgArgs().length > 0) {
			message = messageUtil.getMessage(ex.getCode(), ex.getMsgArgs());
		} else {
			message = messageUtil.getMessage(ex.getCode());
		}

		return createErrorMap(ex.getResultCode(), message, request);
		
	}
	
	@ExceptionHandler({ MethodArgumentNotValidException.class, TypeMismatchException.class })
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public Map<String, Object> handleMethodArgumentNotValidException(Exception ex, HttpServletRequest request) {
		ErrorCodeEnum code = ErrorCodeEnum.BAD_REQUEST;
		return createErrorMap(code.getResultCode(), messageUtil.getMessage(code.getCode()), request);
	}

	@ExceptionHandler({ NotFoundException.class })
	@ResponseStatus(HttpStatus.NOT_FOUND)
	@ResponseBody
	public Map<String, Object> handleNotFoundException(NotFoundException ex, HttpServletRequest request) {
		ErrorCodeEnum code = ErrorCodeEnum.NOT_FOUND;
		return createErrorMap(code.getResultCode(), messageUtil.getMessage(code.getCode()), request);
	}
	
	@ExceptionHandler({ HttpRequestMethodNotSupportedException.class })
	@ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
	@ResponseBody
	public Map<String, Object> handleMethodNotAllowedException(HttpRequestMethodNotSupportedException ex, HttpServletRequest request) {
		ErrorCodeEnum code = ErrorCodeEnum.NOT_METHOD;
		return createErrorMap(code.getResultCode(), messageUtil.getMessage(code.getCode()), request);
	}
	
	@ExceptionHandler({ HttpMediaTypeNotAcceptableException.class, JsonParseException.class })
	@ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
	@ResponseBody
	public Map<String, Object> handleHttpMediaTypeNotAcceptableException(HttpMediaTypeNotAcceptableException ex,
			HttpServletRequest request) {
		ErrorCodeEnum code = ErrorCodeEnum.NOT_CONTENT_TYPE;
		return createErrorMap(code.getResultCode(), messageUtil.getMessage(code.getCode()), request);
	}

	@ExceptionHandler(HttpMediaTypeNotSupportedException.class)
	@ResponseStatus(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
	@ResponseBody
	public Map<String, Object> handleHttpMediaTypeNotSupportedException(HttpMediaTypeNotSupportedException ex,
			HttpServletRequest request) {
		ErrorCodeEnum code = ErrorCodeEnum.NOT_CONTENT_TYPE;
		return createErrorMap(code.getResultCode(), messageUtil.getMessage(code.getCode()), request);
	}

	
	/**
	 * Excpetion 맵을 생성
	 * @param resultCode
	 * @param resultMessage
	 * @param request
	 * @return
	 */
	private Map<String, Object> createErrorMap(String resultCode, String resultMessage, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(Constants.RESULT_CODE, resultCode);
		map.put(Constants.RESULT_MSG, resultMessage);

		try {
			Gson gson = new Gson();
			errorLogger.error(gson.toJson(map));
		} catch (Exception e) {

		}
		return map;
	}
	
}
