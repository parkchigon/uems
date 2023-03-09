package com.flk.mng.site.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.site.domain.SiteGroup;

@Repository
public interface SiteGroupMapper {

	/**
	 * 그룹 리스트
	 * 
	 * @param siteGroup
	 * @return
	 */
	List<FlkMap> selectSiteGroupList(SiteGroup siteGroup);

	/**
	 * 그룹관리 상세 조회
	 * 
	 * @param siteGroup
	 * @return
	 */
	FlkMap selectSiteGroupView(SiteGroup siteGroup);

	/**
	 * 그룹 추가
	 * 
	 * @param siteGroup
	 */
	void insertSiteGroup(SiteGroup siteGroup);

	/**
	 * 그룹 수정
	 * 
	 * @param siteGroup
	 */
	void updateSiteGroup(SiteGroup siteGroup);

	/**
	 * 그룹코드 조회
	 * 
	 * @param siteGroup
	 * @return
	 */
	int selectSgCd(SiteGroup siteGroup);

}
