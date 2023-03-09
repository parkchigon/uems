package com.flk.mng.site.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.ems.build.domain.FixInfo;
import com.flk.ems.build.mapper.BuildMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;
import com.flk.mng.user.mapper.MngMapper;

@Service
public class SiteServiceImpl implements SiteService{

	@Autowired
	private SiteMapper siteMapper;
	
	@Autowired
	private MngMapper mngMapper;
	
	@Autowired
	private BuildMapper buildMapper;
	
	/**
	 * 지점관리 리스트
	 */
	@Override
	public List<FlkMap> searchSiteList(Site site) throws Exception {
		return siteMapper.selectSiteList(site);
	}

	/**
	 * 지점관리 상세 조회
	 */
	@Override
	public FlkMap searchSiteView(Site site) throws Exception {
		return siteMapper.selectSiteView(site);
	}

	/**
	 * 지점 추가
	 */
	@Override
	@Transactional
	public void addSite(Site site) throws Exception {
		if(StringUtils.isNotBlank(site.getIceSystemSdate())) {
			site.setIceSystemSdate(site.getIceSystemSdate().replaceAll("-", ""));
		}
		if(StringUtils.isBlank(site.getStatEndDay())) {
			site.setStatEndDay("31");	// 익월종료일 없을경우 무조건 31일
		}
		siteMapper.insertSite(site);
		
		// TBL_FIX_INFO 추가
		FixInfo fixInfo = new FixInfo(Constants.FIX02, Constants.NO);
		fixInfo.setUpdateId(site.getRegId());
		buildMapper.insertFixInfo(fixInfo);
	}

	/**
	 * 지점 수정
	 */
	@Override
	@Transactional
	public void modifySite(Site site) throws Exception {
		if(StringUtils.isNotBlank(site.getIceSystemSdate())) {
			site.setIceSystemSdate(site.getIceSystemSdate().replaceAll("-", ""));
		}
		if(StringUtils.isBlank(site.getStatEndDay())) {
			site.setStatEndDay("31");	// 익월종료일 없을경우 무조건 31일
		}
		siteMapper.updateSite(site);	
		// 사용여부  N일 경우에만 해당 그룹의 지점/유저 사용여부 N 으로 UPDATE
		if(StringUtils.equals(site.getUseFlag(), Constants.NO)) {
			
			Map<String, Object> param = new HashMap<String, Object>();
			
			// 해당 그룹의 지점 조회
			List<Site> siteAllList = new ArrayList<Site>();
			siteAllList.add(site);
			
			// 지점와 매핑된 유저 사용여부 N UPDATE
			param.put("siteList", siteAllList);
			param.put("useYn", Constants.NO);
			if(siteAllList != null) {
				mngMapper.updateAllMngUseFlag(param);
			}
		}
		
		// TBL_FIX_INFO 추가
		FixInfo fixInfo = new FixInfo(Constants.FIX02, Constants.NO);
		fixInfo.setUpdateId(site.getRegId());
		buildMapper.insertFixInfo(fixInfo);
	}

	/**
	 * 지점코드 중복체크
	 */
	@Override
	public boolean checkExistSiteCd(Site site) throws Exception {
		
		boolean result = true;
		if(siteMapper.selectSiteCd(site) > 0) {
			result = false; 
		}
		
		return result;
	}
	
	/**
	 * 지점관련 DB테이블추가 (tbl_raw_data_지점CD, tbl_stat_1min_지점CD)
	 */
	@Override
	public boolean createSiteDbTable(String siteCd) throws Exception {
		if(siteMapper.selectCheckTable(siteCd) > 0) {
			return false;
		} else {
			siteMapper.createRawDataTable(siteCd);
			siteMapper.createStat1minTable(siteCd);
		}
		return true;
	}
}
