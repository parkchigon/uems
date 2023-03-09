package com.flk.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.api.domain.File;
import com.flk.api.domain.Login;
import com.flk.api.service.ApiService;
import com.flk.common.enums.ErrorCodeEnum;
import com.flk.common.exception.BizExceptionProperties;

/**
 * API
 *
 */
@Controller
public class ApiController {

	@Autowired
	private ApiService apiService;
	
	
	/**
	 * 
	 * API로그인처리
	 * 
	 * @param login
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loginCheck(@RequestBody Login login, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = apiService.getLoginCheck(login);
		return resultMap;
	}
	
	/**
	 * API 사진업로드
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/uploadFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadFile(@ModelAttribute File file) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = apiService.uploadFile(file);
		return resultMap;
	}
	
	
	@RequestMapping(value = "/api/file/maintenance/{chkMonth}/{fileName}*", method = RequestMethod.GET)
	public void noticeImage(@PathVariable String chkMonth, @PathVariable String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String fileExt = request.getParameter("fileExt");
		
		if(StringUtils.isEmpty(fileExt)) {
			throw new BizExceptionProperties(ErrorCodeEnum.NOT_PARAMETER.getCode(), new String[]{"fileExt param is null"});
		}
		
		java.io.File file = apiService.maintenanceImage(chkMonth, fileName, fileExt);

		response.setContentType("image/"+fileExt);
		FileUtils.copyFile(file, response.getOutputStream());
	}
	
}
