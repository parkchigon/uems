package com.flk.api.mapper;


import org.springframework.stereotype.Repository;

import com.flk.api.domain.File;
import com.flk.api.domain.Login;

@Repository
public interface ApiMapper {

	/**
	 * 아이디/비밀번호 체크
	 * 
	 * @param mng
	 * @return
	 * @throws Exception
	 */
	public Login getLoginCheck(Login login) throws Exception;
	
	/**
	 * 파일업로드
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public int uploadFile(File file) throws Exception;
}
