package com.flk.system.code.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.code.domain.Code;

@Repository
public interface CodeMapper {

	/**
	 * 코드등록
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int insertCode(Code vo);

	/**
	 * 코드삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int deleteCode(Code vo);

	/**
	 * 코드정보
	 * 
	 * @param vo
	 * @throws Exception
	 */
	FlkMap selectCodeDetail(Code vo);

	/**
	 * 코드 리스트 조회(connectby)
	 * 
	 * @param vo
	 * @throws Exception 서비스에러
	 */
	List<Map<String, Object>> selectCodeListConnectBy(Code vo);

	/**
	 * 코드리스트조회 (vo)
	 * 
	 * @param vo
	 * @throws Exception
	 */
	List<FlkMap> selectCodeList(Code Code);

	/**
	 * 코드수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int updateCode(Code vo);

	/**
	 * 코드순서변경
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int updateCodeOrder(Code vo);
	
	/**
	 * 기존데이터순서가 틀릴 경우 순서 자동 변경
	 * 
	 * @param vo
	 * @throws Exception
	 */
	int updateCodeOrderAuto(Code Code);
}
