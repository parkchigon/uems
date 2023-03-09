package com.flk.batch.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.data.domain.Data;

@Repository
public interface BatchTaskMapper {

	/**
	 * 지점별 동네예보 등록
	 * @param param
	 */
	void insertWeather(Map<String, Object> param);

	/**
	 * 지점별 동네예보 삭제
	 * @param param
	 */
	void deleteWeather(Map<String, Object> param);

	/**
	 * 동네예보 낮 최고기온 수정
	 * @param param
	 */
	void updateTmxWeather(Map<String, Object> param);
	
	/**
	 * 동네예보 아침 최저기온 수정
	 * @param param
	 */
	void updateTmnWeather(Map<String, Object> param);

	/**
	 * 동네예보 6시간 강수량/신적설 수정
	 * @param param
	 */
	void updateRinSnwWeather(Map<String, Object> param);

	/**
	 * 지점별 초단기실황예보 수정
	 * @param param
	 */
	void updateWeather(Map<String, Object> param);

	/**
	 * 보고서용 데이터 조회
	 * @param param
	 * @return
	 */
	List<FlkMap> selectReportData(Map<String, Object> param);
	
	/**
	 * 보고서 등록 여부 조회
	 * @param param
	 * @return
	 */
	int checkReport(Map<String, Object> param);
	
	/**
	 * 보고서 등록
	 * @param param
	 * @return
	 */
	int insertReport(Map<String, Object> param);
	
	/**
	 * 지점별 월간 상황일지 조회
	 * @param dailyRecord
	 * @return
	 */
	List<FlkMap> selectDailyRecordExcelList(Map<String, Object> param);

	/**
	 * 월별운영데이터 조회
	 * @param paramMap
	 * @return
	 */
	List<FlkMap> selectManageData(Map<String, Object> paramMap);

	/**
	 * 공통 단가 > 일반전기요금 조회 
	 * @param paramMap
	 * @return
	 */
	List<FlkMap> selectCommPriceData(Map<String, Object> paramMap);
	
	/**
	 * 지점단가조회
	 * @param paramMap
	 * @return
	 */
	FlkMap selectSitePriceData(Map<String, Object> paramMap);

	/**
	 * 보고서 항목 Rate 조회
	 * @param paramMap
	 * @return
	 */
	FlkMap selectFacilityRateData(Map<String, Object> paramMap);

	/**
	 * 보고서 항목 Spec 조회
	 * @param paramMap
	 * @return
	 */
	FlkMap selectFacilitySpecData(Map<String, Object> paramMap);

	/**
	 * 1분 실시간 통계 가동현황 데이터
	 * @param paramMap
	 * @return
	 */
	List<FlkMap> selectRunStatData(Map<String, Object> paramMap);
	
	/**
	 * 1분 실시간 통계 가동현황 데이터
	 * @param paramMap
	 * @return
	 */
	List<FlkMap> selectRunNightStatData(Map<String, Object> paramMap);
	
}
