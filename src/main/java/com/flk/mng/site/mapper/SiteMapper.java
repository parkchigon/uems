package com.flk.mng.site.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.site.domain.Site;

@Repository
public interface SiteMapper {

	/**
	 * 지점 리스트
	 * 
	 * @param site
	 * @return
	 */
	List<FlkMap> selectSiteList(Site site);

	/**
	 * 지점관리 상세 조회
	 * 
	 * @param site
	 * @return
	 */
	FlkMap selectSiteView(Site site);

	/**
	 * 지점 추가
	 * 
	 * @param site
	 */
	void insertSite(Site site);

	/**
	 * 지점 수정
	 * 
	 * @param site
	 */
	void updateSite(Site site);

	/**
	 * 지점코드 조회
	 * 
	 * @param site
	 * @return
	 */
	int selectSiteCd(Site site);

	/**
	 * 하위 지점 사용여부 업데이트
	 * 
	 * @param siteGroup
	 */
	void updateAllSiteUseFlag(Site site);

	/**
	 * 지점 DB테이블 조회
	 * 
	 * @param String
	 * @return
	 */
	int selectCheckTable(String siteCd);
	
	/**
	 * tbl_raw_data_지점CD 생성
	 * @param String
	 */
	void createRawDataTable(String siteCd);
	
	/**
	 * tbl_stat_1min_지점CD 생성
	 * @param String
	 */
	void createStat1minTable(String siteCd);
	
}
