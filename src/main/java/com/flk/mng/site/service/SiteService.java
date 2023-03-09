package com.flk.mng.site.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.site.domain.Site;

public interface SiteService {

	/**
	 * 지점 리스트
	 * 
	 * @param site
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchSiteList(Site site) throws Exception;

	/**
	 * 지점관리 상세 조회
	 * 
	 * @param site
	 * @return
	 * @throws Exception
	 */
	FlkMap searchSiteView(Site site) throws Exception;

	/**
	 * 지점 추가
	 * 
	 * @param site
	 * @throws Exception
	 */
	void addSite(Site site) throws Exception;

	/**
	 * 지점 수정
	 * 
	 * @param site
	 * @throws Exception
	 */
	void modifySite(Site site) throws Exception;

	/**
	 * 지점코드 중복체크 
	 * 
	 * @param site
	 * @return
	 */
	boolean checkExistSiteCd(Site site) throws Exception;

	/**
	 * 지점관련 DB테이블추가
	 * 
	 * @param String
	 * @return
	 * @throws Exception
	 */ 
	boolean createSiteDbTable(String siteCd) throws Exception;
}
