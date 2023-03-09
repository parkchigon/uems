package com.flk.mng.trendMng.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.trendMng.domain.TrendGroup;

@Repository
public interface TrendMngMapper {
	
	public List<FlkMap> selectSiteList(TrendGroup trendGroup);
	
	public List<TrendGroup> selectTrendGroupList(TrendGroup trendGroup);
	
	public List<TrendGroup> selectTagList(TrendGroup trendGroup);
	
	public List<TrendGroup> selectTrendTagList(TrendGroup trendGroup);
	
	public boolean insertTrendGroup(TrendGroup trendGroup);
	
	public boolean insertTrendGroupTag(TrendGroup trendGroup);
	
	public void deleteTrendGroupTag(TrendGroup trendGroup);
	
	public void deleteTrendGroup(TrendGroup trendGroup);

}
