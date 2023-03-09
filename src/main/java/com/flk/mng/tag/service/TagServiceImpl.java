package com.flk.mng.tag.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.system.domain.Tag;
import com.flk.mng.tag.mapper.TagMapper;

@Service
public class TagServiceImpl implements TagService{

	@Autowired
	private TagMapper tagMapper;
	
	
	/**
	 * 태그 리스트
	 */
	@Override
	public List<FlkMap> searchTagList(Tag tag) throws Exception {
		return tagMapper.selectTagList(tag);
	}

	/**
	 * 태그 타입 리스트
	 */
	@Override
	public List<FlkMap> searchTagTypeList(Tag tag) throws Exception {
		return tagMapper.searchTagTypeList(tag);
	}
	
	/**
	 * Site 리스트
	 */
	@Override
	public List<FlkMap> searchSiteList(Tag tag) throws Exception {
		return tagMapper.searchSiteList(tag);
	}
	
	/**
	 * 상황일지태그값 업데이트
	 */
	@Override
	public void updateDailyRecordFlag(Tag tag) throws Exception {
		tagMapper.updateDailyRecordFlag(tag);
	}
	
}
