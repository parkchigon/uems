package com.flk.mng.tag.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.system.domain.Tag;

@Repository
public interface TagMapper {

	/**
	 * 태그 리스트
	 * 
	 * @param tag
	 * @return
	 */
	List<FlkMap> selectTagList(Tag tag);
	
	/**
	 * 태그 type 리스트
	 * 
	 * @param tag
	 * @return
	 */
	List<FlkMap> searchTagTypeList(Tag tag);
	
	/**
	 * site 리스트
	 * 
	 * @param tag
	 * @return
	 */
	List<FlkMap> searchSiteList(Tag tag);

	/**
	 * 상황일지태그값 업데이트
	 * 
	 * @param tag
	 * @return
	 */
	void updateDailyRecordFlag(Tag tag);
	
}
