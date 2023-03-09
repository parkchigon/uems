package com.flk.mng.comm.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.comm.domain.Comm;

@Repository
public interface CommMapper {

	/**
	 * 통신관리 리스트
	 * 
	 * @param comm
	 * @return
	 */
	List<FlkMap> selectCommList(Comm comm);
	
	/**
	 * 통신관리 상세
	 * 
	 * @param comm
	 * @return
	 */
	FlkMap selectCommDetail(Comm comm);
}
