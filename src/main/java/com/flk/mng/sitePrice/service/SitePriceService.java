package com.flk.mng.sitePrice.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.sitePrice.domain.SitePrice;

public interface SitePriceService {

	
	/**tag유형별 tag 리스트 조회
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchTagList(SitePrice sitePrice) throws Exception;
	
	/** 지점단가리스트 조회
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchSitePriceList(SitePrice sitePrice) throws Exception;
	
	/**종별선택리스트 조회
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchPriceNmList(SitePrice sitePrice) throws Exception;
	
	/**지점단가 등록
	 * @param sitePrice
	 * @throws Exception
	 */
	void addSitePrice(SitePrice sitePrice) throws Exception;
	
	/**지점단가 수정
	 * @param sitePrice
	 * @throws Exception
	 */
	void modifySitePrice(SitePrice sitePrice) throws Exception;
	
	/**지점단가 상세정보 조회
	 * @param sitePrice
	 * @return
	 * @throws Exception
	 */
	FlkMap searchSitePriceInfo(SitePrice sitePrice) throws Exception;
}
