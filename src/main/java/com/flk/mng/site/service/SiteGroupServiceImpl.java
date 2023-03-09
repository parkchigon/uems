package com.flk.mng.site.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.mapper.SiteGroupMapper;
import com.flk.mng.site.mapper.SiteMapper;
import com.flk.mng.user.mapper.MngMapper;


@Service
public class SiteGroupServiceImpl implements SiteGroupService{

	@Autowired
	private SiteGroupMapper siteGroupMapper;
	
	@Autowired
	private SiteMapper siteMapper;
	
	@Autowired
	private MngMapper mngMapper;
	
	
	/**
	 * 그룹관리 리스트
	 */
	@Override
	public List<FlkMap> searchSiteGroupList(SiteGroup siteGroup) throws Exception {
		return siteGroupMapper.selectSiteGroupList(siteGroup);
	}

	/**
	 * 그룹관리 상세 조회
	 */
	@Override
	public FlkMap searchSiteGroupView(SiteGroup siteGroup) throws Exception {
		return siteGroupMapper.selectSiteGroupView(siteGroup);
	}

	/**
	 * 그룹 추가
	 */
	@Override
	public void addSiteGroup(SiteGroup siteGroup) throws Exception {
		siteGroupMapper.insertSiteGroup(siteGroup);
	}

	/**
	 * 그룹 수정
	 */
	@Override
	@Transactional
	public void modifySiteGroup(SiteGroup siteGroup) throws Exception {
		siteGroupMapper.updateSiteGroup(siteGroup);	
		
		// 사용여부  N일 경우에만 해당 그룹의 지점/유저 사용여부 N 으로 UPDATE
		if(StringUtils.equals(siteGroup.getUseFlag(), Constants.NO)) {
			Site site = new Site(1, Constants.NO);
			site.setSgId(String.valueOf(siteGroup.getSgId()));
			site.setUseFlag(Constants.NO);
			siteMapper.updateAllSiteUseFlag(site);
			
			Map<String, Object> param = new HashMap<String, Object>();
			
			// 해당 그룹의 지점 조회
			List<FlkMap> siteAllList = siteMapper.selectSiteList(site);
			
			// 지점와 매핑된 유저 사용여부 N UPDATE
			param.put("siteList", siteAllList);
			param.put("useYn", Constants.NO);
			if(siteAllList != null) {
				mngMapper.updateAllMngUseFlag(param);
			}
			
		}
	}

	/**
	 * 그룹코드 중복체크
	 */
	@Override
	public boolean checkExistSgCd(SiteGroup siteGroup) throws Exception {
		
		boolean result = true;
		if(siteGroupMapper.selectSgCd(siteGroup) > 0) {
			result = false; 
		}
		
		return result;
	}

}
