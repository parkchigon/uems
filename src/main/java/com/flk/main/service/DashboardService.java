package com.flk.main.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.main.domain.DashboardData;
import com.flk.mng.report.domain.Report;

/**
 *  대쉬보드 조회(로그인 시 첫 화면)
 */
public interface DashboardService {

	/**
	 * 총계 - 전체 Co2 배출량 조회
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectCo2EmissionsList(DashboardData dashboardData) throws Exception;
	
	/**
	 * 검색연도(데이터 있는 연도만 조회 가능)
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectYearList() throws Exception;
	
	/**
	 * 총계 - 전체 냉방 사용요금
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectCoolChargeList(DashboardData dashboardData) throws Exception;
	
	/**
	 * 총계 - 에너지 사용량
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectEnergyUsageList(DashboardData dashboardData) throws Exception;
	
	/**
	 * 총계 - 월별, 지점별 냉방 사용요금
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectBranchCoolChargeList(DashboardData dashboardData) throws Exception;
	
	/**
	 * 총계 - 총 누적 절감액, 누적 절감 비율
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	FlkMap selectTotalReductionValues(DashboardData dashboardData) throws Exception;
	
	/**
	 * 총계 - 전력 총 소비량
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectTotalPowerConsumption(DashboardData dashboardData) throws Exception;
	
	/**
	 * 총계 - 각 차트 절감액, 증감량
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectReductionValues(DashboardData dashboardData) throws Exception;
	
	/**
	 * 지점정보 - 지점정보
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	FlkMap selectBranchInfo(DashboardData dashboardData) throws Exception;
	
	/**
	 * 지점정보 - 이력
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectWorkHistoryList(DashboardData dashboardData) throws Exception;
	
	/**
	 * 지점정보 - 주요 지표 데이터
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectMainIndicatorsDataList(DashboardData dashboardData) throws Exception;
	
	/**
	 * 지점정보 - 사용요금 비교 데이터
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectUsageChargeDataList(DashboardData dashboardData) throws Exception;

	/**
	 * 지점정보 - 냉동기개수(냉동기축냉효율)
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	FlkMap selectChillerCount(DashboardData dashboardData) throws Exception;	
	
	/**
	 * 지점정보 - 냉동기 축냉 효율
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectChillerColdstorageData(DashboardData dashboardData) throws Exception;
	
	/**
	 * 지점정보 - 기온
	 * @param dashboardData
	 * @return
	 */
	FlkMap selectWeatherInfo(DashboardData dashboardData);

	
	/**
	 * 리포트 - 목록 조회
	 * @param report
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectReportList(Report report) throws Exception;
	
	/**
	 * 리포트 - 다운로드
	 * @param report
	 * @throws Exception
	 */
	void downloadReportFile(Report report, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
