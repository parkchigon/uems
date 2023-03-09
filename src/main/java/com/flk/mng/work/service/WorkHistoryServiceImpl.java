package com.flk.mng.work.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.attachfile.service.AttachFileService;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.work.domain.WorkHistory;
import com.flk.mng.work.mapper.WorkHistoryMapper;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service
public class WorkHistoryServiceImpl implements WorkHistoryService{

	@Autowired
	private WorkHistoryMapper workHistoryMapper;
	
	@Resource(name = "workIdGnrService")
	private EgovIdGnrService workIdGnrService;
	
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;
	
	/**
	 * 작업이력관리 리스트
	 */
	@Override
	public List<FlkMap> searchWorkHistoryList(WorkHistory workHistory) throws Exception {
		return workHistoryMapper.selectWorkHistoryList(workHistory);
	}

	/**
	 * 작업이력관리 상세 조회
	 */
	@Override
	public FlkMap searchWorkHistoryView(WorkHistory workHistory) throws Exception {
		return workHistoryMapper.selectWorkHistoryView(workHistory);
	}

	/**
	 * 작업이력 추가
	 */
	@Override
	public void addWorkHistory(WorkHistory workHistory) throws Exception {
		String workId = workIdGnrService.getNextStringId();
		workHistory.setWorkId(workId);
		
		if(StringUtils.isNotBlank(workHistory.getWorkDate())) {
			workHistory.setWorkDate(workHistory.getWorkDate().replaceAll("-", ""));
		}
		workHistoryMapper.insertWorkHistory(workHistory);
	}

	/**
	 * 작업이력 수정
	 */
	@Override
	public void modifyWorkHistory(WorkHistory workHistory) throws Exception {
		if(StringUtils.isNotBlank(workHistory.getWorkDate())) {
			workHistory.setWorkDate(workHistory.getWorkDate().replaceAll("-", ""));
		}
		workHistoryMapper.updateWorkHistory(workHistory);	
	}

	/**
	 * 작업이력 삭제
	 */
	@Override
	public void removeWorkHistory(WorkHistory workHistory) throws Exception {
		workHistoryMapper.deleteWorkHistory(workHistory);
	}

}
