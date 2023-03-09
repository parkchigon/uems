package com.flk.mng.sitePrice.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.sitePrice.domain.SitePrice;

@Repository
public interface SitePriceMapper {
	
	
	
	/**태그유형에 따른 세부TAG리스트
	 * @param sitePrice
	 * @return
	 */
	List<FlkMap> selectTagList(SitePrice sitePrice);
	/**지점별단가데이터 리스트
	 * @param sitePrice
	 * @return
	 */
	List<FlkMap> selectSitePriceList(SitePrice sitePrice);
	
	/**종별리스트
	 * @param sitePrice
	 * @return
	 */
	List<FlkMap> selectPriceNmList(SitePrice sitePrice);
	
	/**지점단가 데이터 등록
	 * @param sitePrice
	 */
	void insertSitePrice(SitePrice sitePrice);
	
	/** 지점단가 데이터 수정
	 * @param sitePrice
	 */
	void updateSitePrice(SitePrice sitePrice);
	
	/**수정시 history insert
	 * @param sitePrice
	 */
	void insertSitePriceHistory(SitePrice sitePrice);
	
	
	/**상세정보조회
	 * @param sitePrice
	 * @return
	 */
	FlkMap selectSitePriceInfo(SitePrice sitePrice);
}