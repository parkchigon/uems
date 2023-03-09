package com.flk.system.program.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.program.domain.Program;

public interface ProgramService {

	/**
	 * 메뉴 프로그램 리스트 조회
	 * @param vo
	 * @throws Exception
	 */
	List<FlkMap> searchProgramList(Program vo) throws Exception;

	/**
	 * 메뉴 프로그램 등록
	 * @param vo
	 * @throws Exception
	 */
	void addProgram(Program vo) throws Exception;
	
	/**
	 * 메뉴 프로그램 수정
	 * @param vo
	 * @throws Exception
	 */
	void modifyProgram(Program vo) throws Exception;
	
	/**
	 * 메뉴 프로그램 삭제
	 * @param vo
	 * @throws Exception
	 */
	void removeProgram(Program vo) throws Exception;
	
}
