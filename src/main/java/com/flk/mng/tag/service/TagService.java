package com.flk.mng.tag.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.system.domain.Tag;

public interface TagService {

	/**
	 * 태그 리스트
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchTagList(Tag tag) throws Exception;

	/**
	 * 태그 타입 리스트
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchTagTypeList(Tag tag) throws Exception;
	
	/**
	 * site 리스트
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchSiteList(Tag tag) throws Exception;
	
	/**
	 * 상황일지태그값 업데이트
	 * 
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	void updateDailyRecordFlag(Tag tag) throws Exception;
	
	

}
