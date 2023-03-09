package com.flk.system.code.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.CeWebConstants;
import com.flk.system.code.domain.Code;
import com.flk.system.code.mapper.CodeMapper;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("codeService")
public class CodeServiceImpl implements CodeService {

	@Resource(name = "codeIdGnrService")
	private EgovIdGnrService codeIdGnrService;

	@Resource(name = "codeMapper")
	private CodeMapper codeMapper;
	
	/**
	 * 코드등록
	 * 
	 * @param vo
	 * @throws Exception 서비스에러
	 */
	@Override
	@Transactional
	public int addCode(Code vo) throws Exception {

		vo.setCodeId(StringUtils.defaultIfEmpty(vo.getCodeId(), codeIdGnrService.getNextStringId()));
		
		int result = codeMapper.insertCode(vo);
		// 기존 데이터의 순서가 틀릴 경우 자동으로 보정해 줌.
		codeMapper.updateCodeOrderAuto(vo);
		
		return result;
	}

	/**
	 * 코드 리스트 조회(connectby)
	 * 
	 * @param vo
	 * @throws Exception 서비스에러
	 */
	@Override
	public List<Map<String, Object>> searchCodeListConnectBy(Code vo) throws Exception {
		
		vo.setParentCodeId(StringUtils.defaultIfEmpty(vo.getParentCodeId(), CeWebConstants.TOP_CODE_ID));
		
		return codeMapper.selectCodeListConnectBy(vo);
	}

	/**
	 * 코드리스트조회 (vo)
	 * 
	 * @param vo
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchCodeList(Code vo) throws Exception {
		return codeMapper.selectCodeList(vo);
	}

	/**
	 * 코드리스트조회 (codeUseName)
	 * 
	 * @param codeUseName
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchCodeList(String codeUseName) throws Exception {
		return searchCodeList(codeUseName, null);
	}
	
	/**
	 * 코드리스트조회 (codeUseName , codeDetailDivision)
	 * 
	 * @param codeDetailDivision
	 * @param codeUseName
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchCodeList(String codeUseName, String codeDetailDivision) throws Exception {
		Code vo = new Code();
		vo.setCodeUseName(codeUseName);
		vo.setCodeDetailDivision(codeDetailDivision);
		return codeMapper.selectCodeList(vo);
	}

	/**
	 * 코드수정
	 * 
	 * @param vo
	 * @throws Exception
	 */
	@Override
	public int modifyCode(Code vo) throws Exception {
		return codeMapper.updateCode(vo);
	}

	/**
	 * 코드삭제
	 * 
	 * @param vo
	 * @throws Exception
	 */
	@Override
	public int removeCode(Code vo) throws Exception {
		return codeMapper.deleteCode(vo);
	}
	
	/**
	 * 코드순서변경
	 * 
	 * @param vo
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void modifyCodeOrder(Code vo) throws Exception {

		int index = 1;
		for ( String cdId : vo.getCodeIds() ) {
			Code code = new Code();
			code.setCodeId(cdId);
			code.setParentCodeId(vo.getParentCodeId());
			code.setUpdateId(vo.getUpdateId());
			code.setSortNum(String.valueOf(index));
			codeMapper.updateCodeOrder(code);
			
			index += 1;
		}
	}

	/**
	 * 코드정보조회
	 * 
	 * @param vo
	 * @throws Exception
	 */
	@Override
	public FlkMap searchCodeDetail(Code vo) throws Exception {
		return codeMapper.selectCodeDetail(vo);
	}
	
	/**
	 * 코드정보조회
	 * 
	 * @param codeUseName
	 * @throws Exception
	 */
	@Override
	public FlkMap searchCodeDetail(String codeUseName) throws Exception {
		
		Code code = new Code();
		code.setCodeUseName(codeUseName);
		
		return codeMapper.selectCodeDetail(code);
	}
}
