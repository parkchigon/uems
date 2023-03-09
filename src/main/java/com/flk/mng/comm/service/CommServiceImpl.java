package com.flk.mng.comm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.comm.domain.Comm;
import com.flk.mng.comm.mapper.CommMapper;

@Service
public class CommServiceImpl implements CommService {

	@Autowired
	private CommMapper commMapper;
	
	/**
	 * 통신관리 리스트
	 */
	@Override
	public List<FlkMap> commList(Comm comm) throws Exception {
		return commMapper.selectCommList(comm);
	}
	
	/**
	 * 통신관리 상세 조회
	 */
	@Override
	public FlkMap commDetail(Comm comm) throws Exception {
        return commMapper.selectCommDetail(comm);
	}

}
