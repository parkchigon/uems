package com.flk.mng.work.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.work.domain.WorkHistory;

@Repository
public interface WorkHistoryMapper {

	/**
	 * 작업이력 리스트
	 * 
	 * @param workHistory
	 * @return
	 */
	List<FlkMap> selectWorkHistoryList(WorkHistory workHistory);

	/**
	 * 작업이력관리 상세 조회
	 * 
	 * @param workHistory
	 * @return
	 */
	FlkMap selectWorkHistoryView(WorkHistory workHistory);

	/**
	 * 작업이력 추가
	 * 
	 * @param workHistory
	 */
	void insertWorkHistory(WorkHistory workHistory);

	/**
	 * 작업이력 수정
	 * 
	 * @param workHistory
	 */
	void updateWorkHistory(WorkHistory workHistory);

	/**
	 * 작업이력 삭제
	 * 
	 * @param workHistory
	 */
	void deleteWorkHistory(WorkHistory workHistory);

}
