package com.flk.mng.data.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.data.domain.Data;
import com.flk.mng.report.domain.Report;

public interface DataService {
	
	
	/**월별운영데이터관리 리스트조회
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchDataList(Data data) throws Exception;
	
	/**월별운영데이터관리 등록
	 * @param data
	 * @throws Exception
	 */
	void addData(Data data) throws Exception;
	
	
	/**월별운영데이터관리 상세조회
	 * @param workHistory
	 * @return
	 * @throws Exception
	 */
	FlkMap searchDataInfo(Data data) throws Exception;
	
	/**월별운영데이터관리 수정
	 * @param data
	 * @throws Exception
	 */
	void modifyData(Data data) throws Exception;
	
	/**월별운영데이터관리 삭제
	 * @param data
	 * @throws Exception
	 */
	void removeData(Data data) throws Exception;
	
	/**월별운영데이터관리 데이터 중복 조회
	 * @param data
	 * @return
	 * @throws Exception
	 */
	int searchDataCount(Data data) throws Exception;

	/**
	 * 기술운영보고서 생성
	 * @param data
	 * @return 
	 * @throws Exception
	 */
	Report makeReportFile(Data data) throws Exception;

}
