package com.flk.mng.miniDiagram.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.miniDiagram.domain.MiniDiagram;

/**
 * 관리 ( 미니계통도 관리 )
 */
@Repository
public interface MiniDiagramMapper {

	/**
	 * 미니 계통도 관리 조회
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectMiniDiagramList(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 미니 계통도 컴퍼넌트 조회
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectComponentNameList(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 태그 리스트 조회
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectTagList(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 미니계통도 기존 태그 삭제
	 * @return
	 * @throws Exception
	 */
	void deleteMiniDiagramTagMapping(MiniDiagram miniDiagram) throws Exception;
	
	/**
	 * 미니계통도 태그 매핑
	 * @return
	 * @throws Exception
	 */
	void insertMiniDiagramTagMapping(MiniDiagram miniDiagram) throws Exception;
	
	/**
	 * 미니계통도 매핑 사이트 정보 업데이트
	 * @return
	 * @throws Exception
	 */
	void insertMiniDiagramSystemSite(MiniDiagram miniDiagram) throws Exception;

	/**
	 * 태그 매핑 조회
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectSystemTagMapping(MiniDiagram miniDiagram) throws Exception;
	
}
