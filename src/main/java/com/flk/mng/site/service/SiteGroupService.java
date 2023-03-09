package com.flk.mng.site.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.site.domain.SiteGroup;

public interface SiteGroupService {

	/**
	 * 그룹 리스트
	 * 
	 * @param siteGroup
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchSiteGroupList(SiteGroup siteGroup) throws Exception;

	/**
	 * 그룹관리 상세 조회
	 * 
	 * @param siteGroup
	 * @return
	 * @throws Exception
	 */
	FlkMap searchSiteGroupView(SiteGroup siteGroup) throws Exception;

	/**
	 * 그룹 추가
	 * 
	 * @param siteGroup
	 * @throws Exception
	 */
	void addSiteGroup(SiteGroup siteGroup) throws Exception;

	/**
	 * 그룹 수정
	 * 
	 * @param siteGroup
	 * @throws Exception
	 */
	void modifySiteGroup(SiteGroup siteGroup) throws Exception;

	/**
	 * 그룹코드 중복체크 
	 * 
	 * @param siteGroup
	 * @return
	 */
	boolean checkExistSgCd(SiteGroup siteGroup) throws Exception;

}
