package com.flk.mng.work.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.work.domain.WorkHistory;

public interface WorkHistoryService {

	/**
	 * 작업이력 리스트
	 * 
	 * @param workHistory
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchWorkHistoryList(WorkHistory workHistory) throws Exception;

	/**
	 * 작업이력 상세 조회
	 * 
	 * @param workHistory
	 * @return
	 * @throws Exception
	 */
	FlkMap searchWorkHistoryView(WorkHistory workHistory) throws Exception;

	/**
	 * 작업이력 추가
	 * 
	 * @param workHistory
	 * @throws Exception
	 */
	void addWorkHistory(WorkHistory workHistory) throws Exception;

	/**
	 * 작업이력 수정
	 * 
	 * @param workHistory
	 * @throws Exception
	 */
	void modifyWorkHistory(WorkHistory workHistory) throws Exception;

	/**
	 * 작업이력 삭제
	 * 
	 * @param workHistory
	 * @throws Exception
	 */
	void removeWorkHistory(WorkHistory workHistory) throws Exception;


}
