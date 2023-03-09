package com.flk.mng.miniDiagram.service;

import java.util.List;
import java.util.Map;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.miniDiagram.domain.MiniDiagram;

/**
 * 관리 ( 미니계통도 관리 )
 */
public interface MiniDiagramService {

	/**
	 * 미니 계통도 관리 조회
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchMiniDiagram(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 미니 계통도 컴퍼넌트 조회
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchComponentNameList(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 태그 리스트 조회
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectTagList(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 미니계통도 태그 매핑
	 * @return
	 * @throws Exception
	 */
	void insertMiniDiagramTagMapping(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 태그 매핑 조회
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectSystemTagMapping(MiniDiagram miniDiagram) throws Exception;

}
