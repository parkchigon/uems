package com.flk.batch.service;

import java.util.Map;

public interface BatchTaskService {

	/**
	 * 초단기 실황조회
	 * 
	 * @return 
	 * @throws Exception
	 */
	Map<String, Object> getForecastGrib() throws Exception;
	
	/**
	 * 동네예보
	 * 
	 * @return 
	 * @throws Exception
	 */
	Map<String, Object> getForecastSpaceData() throws Exception;

	/**
	 * 보고서 엑셀 생성
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> createReport() throws Exception;
	
	/**
	 * 상황일지 엑셀 작성
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> createDailyRecord() throws Exception;
}
