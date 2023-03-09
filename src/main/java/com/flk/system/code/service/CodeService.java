package com.flk.system.code.service;

import java.util.List;
import java.util.Map;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.code.domain.Code;

/**
 * 
 * 코드 서비스
 *
 */
public interface CodeService {

	/**
	 * 코드 리스트 조회(connectby)
	 * 
	 * @param vo
	 * @throws Exception 서비스에러
	 */
	List<Map<String, Object>> searchCodeListConnectBy(Code vo) throws Exception;

	/**
	 * 코드리스트조회 (vo)
	 * 
	 * @param vo
	 * @throws Exception
	 */
	List<FlkMap> searchCodeList(Code vo) throws Exception;

	/**
	 * 코드리스트조회 (codeUseName)
	 * 
	 * @param codeUseName
	 * @throws Exception
	 */
	List<FlkMap> searchCodeList(String codeUseName) throws Exception;
	
	/**
	 * 코드리스트조회 (codeUseName , codeDetailDivision)
	 * 
	 * @param codeDetailDivision
	 * @param codeUseName
	 * @throws Exception
	 */
	List<FlkMap> searchCodeList(String codeUseName, String codeDetailDivision) throws Exception;

	/**
	 * 코드등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int addCode(Code vo) throws Exception;

	/**
	 * 코드수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int modifyCode(Code vo) throws Exception;

	/**
	 * 코드삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int removeCode(Code vo) throws Exception;
	
	/**
	 * 코드순서변경
	 * 
	 * @param vo
	 * @throws Exception
	 */
	void modifyCodeOrder(Code vo) throws Exception;

	/**
	 * 코드정보조회
	 * 
	 * @param vo
	 * @throws Exception
	 */
	FlkMap searchCodeDetail(Code vo) throws Exception;
	
	/**
	 * 코드정보조회
	 * 
	 * @param codeUseName
	 * @throws Exception
	 */
	FlkMap searchCodeDetail(String codeUseName) throws Exception;
}
