package com.flk.ems.build.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.build.domain.PlcComm;
import com.flk.ems.build.domain.SystemTemplate;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.domain.Tag;

public interface BuildService {

	/**
	 * 지점관리 등록
	 * 
	 * @param plcComm
	 * @param session 
	 * @throws Exception
	 */
	void insertSiteManage(PlcComm plcComm, HttpSession session) throws Exception;

	/**
	 * 지점관리 수정
	 * 
	 * @param plcComm
	 * @param session 
	 * @throws Exception
	 */
	void updateSiteManage(PlcComm plcComm, HttpSession session) throws Exception;

	/**
	 * 지점관리 조회
	 * 
	 * @param plcCommView
	 * @return
	 * @throws Exception
	 */
	PlcComm selectPlcCommView(PlcComm plcCommView) throws Exception;
	
	/**
	 * 태그 리스트 조회
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectTagList(Tag tag) throws Exception;

	/**
	 * 태그 등록
	 * 
	 * @param tag
	 * @throws Exception
	 */
	void insertTag(Tag tag) throws Exception;

	/**
	 * 태그 수정
	 * 
	 * @param tag
	 * @throws Exception
	 */
	void updateTag(Tag tag) throws Exception;

	/**
	 * 태그ID 중복체크
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	boolean checkExistTagId(Tag tag) throws Exception;

	/**
	 * 태그 삭제
	 * 
	 * @param tag
	 * @throws Exception
	 */
	void deleteTag(Tag tag) throws Exception;

	/**
	 * 태그 상세 조회
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectTagView(Tag tag) throws Exception;
	
	/**
	 * 태그 엑셀 업로드
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> uploadTagListExcel(Tag tag) throws Exception;

	/**
	 * 템플릿 패턴 리스트
	 * 
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectTemplateList(SystemTemplate systemTemplate) throws Exception;

	/**
	 * 서브메뉴 사이트 등록
	 * 
	 * @param systemTemplate
	 * @throws Exception
	 */
	void insertSystemSubmenuSite(SystemTemplate systemTemplate) throws Exception;

	/**
	 * 사이트 별 템플릿  조회
	 * 
	 * @param systemTemplate
	 * @return
	 */
	SystemTemplate selectSystemSubmenuSite(SystemTemplate systemTemplate) throws Exception;

	/**
	 * 템플릿 정보 조회
	 * 
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	SystemTemplate selectTemplateInfo(SystemTemplate systemTemplate) throws Exception;

	/**
	 * 서브메뉴 css_path 조회
	 * 
	 * @param systemTagMap
	 * @return
	 */
	String selectSubMenuCss(SystemTagMap systemTagMap) throws Exception;

	/**
	 * 타 Template ID 태그 매핑 삭제
	 * 1
	 * @param systemTagMap
	 */
	void deleteOtherSystemTagMapping(SystemTagMap systemTagMap) throws Exception;
	
	/**
	 * 태그 매핑 등록
	 * 
	 * @param systemTagMap
	 */
	void insertSystemTagMapping(SystemTagMap systemTagMap) throws Exception;

	/**
	 * 태그 매핑 조회
	 * 
	 * @param systemTagMap
	 * @return
	 */
	Map<String, Object> selectSystemTagMapping(SystemTagMap systemTagMap) throws Exception;
	
	/**
	 * 사이트 별 기타설비 리스트 조회
	 * 
	 * @param systemTemplate
	 * @return
	 */
	Map<String, Object> selectSystemSubmenuSiteList(SystemTemplate systemTemplate) throws Exception;

	/**
	 * 태그 업로드 로그 등록
	 * 
	 * @param resultMap
	 * @throws Exception
	 */
	void insertTagRegisterLog(Map<String, Object> paramMap) throws Exception;

}
