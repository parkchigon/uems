package com.flk.system.program.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.program.domain.Program;


@Repository
public interface ProgramMapper {
	
	/**
	 * 메뉴 프로그램 리스트 조회
	 * @param vo
	 * @throws Exception
	 */
	List<FlkMap> selectProgramList(Program vo);
	
	/**
	 * 메뉴 프로그램 등록
	 * @param vo
	 * @throws Exception
	 */
	void insertProgram(Program vo);

	/**
	 * 메뉴 프로그램 수정
	 * @param vo
	 * @throws Exception
	 */
	void updateProgram(Program vo);
	
	/**
	 * 메뉴 프로그램 삭제
	 * @param vo
	 * @throws Exception
	 */
	void deleteProgram(Program vo);

}
