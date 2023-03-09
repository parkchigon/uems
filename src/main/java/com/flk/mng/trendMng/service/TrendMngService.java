package com.flk.mng.trendMng.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.trendMng.domain.TrendGroup;

public interface TrendMngService {

	/**
	 * 지점 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectSiteList(TrendGroup trendGroup) throws Exception;
	
	/**
	 * 트랜드 그룹 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	List<TrendGroup> selectTrendGroupList(TrendGroup trendGroup) throws Exception;
	
	/**
	 * 태그 타입 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	List<TrendGroup> selectTagList(TrendGroup trendGroup) throws Exception;
	
	/**
	 * 트랜드그룹에 따른 태그 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	List<TrendGroup> selectTrendTagList(TrendGroup trendGroup) throws Exception;
	
	/**
	 * 트랜드 그룹 추가
	 * @param trendGroup
	 * @return
	 */
	public boolean insertTrendGroup(TrendGroup trendGroup);
}
