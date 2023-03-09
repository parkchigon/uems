package com.flk.mng.sitePrice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.sitePrice.domain.SitePrice;
import com.flk.mng.sitePrice.mapper.SitePriceMapper;

@Service
public class SitePriceServiceImpl implements SitePriceService{
	@Autowired SitePriceMapper sitePriceMapper;
	
	
	// 지점단가관리 연동tag list
	@Override
	public List<FlkMap> searchTagList(SitePrice sitePrice) throws Exception{
		return sitePriceMapper.selectTagList(sitePrice);
	}
	
	// 지점단가관리리스트
	@Override
	public List<FlkMap> searchSitePriceList(SitePrice sitePrice) throws Exception{
		return sitePriceMapper.selectSitePriceList(sitePrice);
	}
	
	// 지점단가관리 종별,업체명 리스트
	
	@Override
	public List<FlkMap> searchPriceNmList(SitePrice sitePrice) throws Exception{
		return sitePriceMapper.selectPriceNmList(sitePrice);
	}
	
	// 지점단가관리 등록
	@Override
	public void addSitePrice(SitePrice sitePrice) throws Exception{
		sitePriceMapper.insertSitePrice(sitePrice);
	}
	
	// 지점단가관리 수정
	@Override
	@Transactional
	public void modifySitePrice(SitePrice sitePrice) throws Exception{
		sitePriceMapper.updateSitePrice(sitePrice);
		sitePriceMapper.insertSitePriceHistory(sitePrice); //수정시 history insert
	}
	
	// 지점단가관리 상세정보
	@Override
	public FlkMap  searchSitePriceInfo(SitePrice sitePrice) throws Exception{
		return sitePriceMapper.selectSitePriceInfo(sitePrice);
	}
	
	
}
