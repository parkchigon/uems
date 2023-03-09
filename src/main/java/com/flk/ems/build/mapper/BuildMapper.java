package com.flk.ems.build.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.build.domain.FixInfo;
import com.flk.ems.build.domain.PlcComm;
import com.flk.ems.build.domain.SystemTemplate;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.domain.Tag;
import com.flk.system.code.domain.Code;

@Repository
public interface BuildMapper {

	/**
	 * PLC 통신설정 등록
	 * 
	 * @param plcComm
	 */
	void insertPlcComm(PlcComm plcComm);

	/**
	 * PLC 통신설정 수정
	 * 
	 * @param plcComm
	 */
	void updatePlcComm(PlcComm plcComm);

	/**
	 * PLC 통신설정 조회
	 * 
	 * @param plcCommView
	 * @return
	 */
	PlcComm selectPlcCommView(PlcComm plcCommView);

	/**
	 * 태그 리스트 조회
	 * 
	 * @param tag
	 * @return
	 */
	List<Map<String, Object>> selectTagList(Tag tag);

	/**
	 * 태그 등록
	 * 
	 * @param tag
	 */
	void insertTag(Tag tag);

	/**
	 * 태그 수정
	 * 
	 * @param tag
	 */
	void updateTag(Tag tag);

	/**
	 * 태그ID 조회
	 * 
	 * @param tag
	 * @return
	 */
	int selectTagId(Tag tag);

	/**
	 * 태그 이력 등록
	 * 
	 * @param tag
	 */
	void insertTagHistory(Tag tag);

	/**
	 * 태그 삭제
	 * 
	 * @param tag
	 */
	void deleteTag(Tag tag);

	/**
	 * 태그 상세 조회
	 * 
	 * @param tag
	 * @return
	 */
	Tag selectTagView(Tag tag);

	/**
	 * 정보 변경 등록
	 * 
	 * @param fixInfo
	 */
	void insertFixInfo(FixInfo fixInfo);

	/**
	 * 템플릿 패턴 리스트
	 * 
	 * @param systemTemplate 
	 * @return
	 */
	List<FlkMap> selectTemplateList(SystemTemplate systemTemplate);

	/**
	 * 템플릿 등록
	 * 
	 * @param systemTemplate
	 */
	void insertSystemSubmenuSite(SystemTemplate systemTemplate);

	/**
	 * 사이트 별 템플릿
	 * 
	 * @param systemTemplate
	 * @return
	 */
	SystemTemplate selectSystemSubmenuSite(SystemTemplate systemTemplate);

	/**
	 * 템플릿 정보 조회
	 * 
	 * @param systemTemplate
	 * @return
	 */
	SystemTemplate selectTemplateInfo(SystemTemplate systemTemplate);

	/**
	 * 서브메뉴 css_path 조회
	 * 
	 * @param systemTagMap
	 * @return
	 */
	String selectSubMenuCss(SystemTagMap systemTagMap);

	/**
	 * 태그 매핑 삭제
	 * 
	 * @param systemTagMap
	 */
	void deleteSystemTagMapping(SystemTagMap systemTagMap);

	/**
	 * 타 Template ID 태그 매핑 삭제
	 * 
	 * @param systemTagMap
	 */
	void deleteOtherSystemTagMapping(SystemTagMap systemTagMap);
	
	/**
	 * 태그 매핑 등록
	 * 
	 * @param systemTagMap
	 */
	void insertSystemTagMapping(SystemTagMap systemTagMap);

	/**
	 * 컴포넌트 리스트 조회
	 * 
	 * @param systemTemplate
	 * @return
	 */
	List<FlkMap> selectSystemTemplateComponent(SystemTemplate systemTemplate);
	
	/**
	 * 사이트 별 템플릿 수정
	 * 
	 * @param systemTemplate
	 */
	void updateSystemSubmenuSite(SystemTemplate systemTemplate);

	/**
	 * 태그 매핑 조회
	 * 
	 * @param systemTagMap
	 * @return
	 */
	List<FlkMap> selectSystemTagMapping(SystemTagMap systemTagMap);

	/**
	 * 사이트 별 기타설비 리스트 조회
	 * 
	 * @param systemTemplate
	 * @return
	 */
	List<FlkMap> selectSystemSubmenuSiteList(SystemTemplate systemTemplate);

	/**
	 * 템플릿 삭제
	 * 
	 * @param systemTemplate
	 */
	void deleteSystemSubmenuSite(SystemTemplate systemTemplate);

	/**
	 * 태그 관련 코드 리스트 조회
	 * 
	 * @return
	 */
	List<Code> tagCodeList();

	/**
	 * 태그 리스트 등록
	 * 
	 * @param resultMap
	 */
	void insertTagList(Map<String, Object> resultMap);

	/**
	 * 태그 이력 리스트 등록
	 * 
	 * @param resultMap
	 */
	void insertTagHistoryList(Map<String, Object> resultMap);

	/**
	 * 태그 업로드 로그 등록
	 * 
	 * @param paramMap
	 */
	void insertTagRegisterLog(Map<String, Object> paramMap);

}
