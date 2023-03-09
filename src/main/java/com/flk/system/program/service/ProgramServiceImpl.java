package com.flk.system.program.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.system.menu.service.MenuService;
import com.flk.system.program.domain.Program;
import com.flk.system.program.mapper.ProgramMapper;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	private ProgramMapper programMapper;
	
	@Autowired
	private MenuService menuService;	

	@Resource(name = "programIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	
	/**
	 * 메뉴 프로그램 리스트 조회
	 * @param vo
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchProgramList(Program vo) throws Exception {
		return programMapper.selectProgramList(vo);
	}
	
	/**
	 * 메뉴 프로그램 등록
	 * @param vo
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void addProgram(Program vo) throws Exception {
		
		vo.setProgramId(StringUtils.defaultIfEmpty(vo.getProgramId(), egovIdGnrService.getNextStringId()));
		programMapper.insertProgram(vo);
		menuService.settingMenuMap();
	}
	
	/**
	 * 메뉴 프로그램 수정
	 * @param vo
	 * @throws Exception
	 */
	@Override
	@Transactional	
	public void modifyProgram(Program vo) throws Exception {
		
		programMapper.updateProgram(vo);
		menuService.settingMenuMap();
	}
	
	/**
	 * 메뉴 프로그램 삭제
	 * @param vo
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void removeProgram(Program vo) throws Exception {
		programMapper.deleteProgram(vo);
		menuService.settingMenuMap();
	}
	
}
