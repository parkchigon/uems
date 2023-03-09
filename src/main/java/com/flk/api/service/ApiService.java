package com.flk.api.service;

import java.util.Map;

import com.flk.api.domain.File;
import com.flk.api.domain.Login;

public interface ApiService {

	/**
	 * 아이디/비밀번호 체크
	 * 
	 * @param mng
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getLoginCheck(Login login) throws Exception;
	
	/**
	 * 파일업로드
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> uploadFile(File file) throws Exception;

	/**
	 * 장비 이미지 조회
	 * 
	 * @param chkMonth
	 * @param fileName
	 * @param fileExt 
	 * @return
	 * @throws Exception
	 */
	public java.io.File maintenanceImage(String chkMonth, String fileName, String fileExt) throws Exception;

}
