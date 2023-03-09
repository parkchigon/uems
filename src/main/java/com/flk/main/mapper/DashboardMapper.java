package com.flk.main.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.main.domain.DashboardData;
import com.flk.mng.report.domain.Report;

/**
 *  대쉬보드 조회(로그인 시 첫 화면)
 */
@Repository
public interface DashboardMapper {
	
	public List<FlkMap> selectYearList();
	
	public List<FlkMap> selectCo2EmissionsList(DashboardData dashboardData);
	
	public List<FlkMap> selectCoolChargeList(DashboardData dashboardData);
	
	public List<FlkMap> selectEnergyUsageList(DashboardData dashboardData);
	
	public List<FlkMap> selectBranchCoolChargeList(DashboardData dashboardData);
	
	public FlkMap selectTotalReductionValues(DashboardData dashboardData);
	
	public List<FlkMap> selectTotalPowerConsumption(DashboardData dashboardData);
	
	public List<FlkMap> selectReductionValues(DashboardData dashboardData);
	
	public FlkMap selectBranchInfo(DashboardData dashboardData);
	
	public List<FlkMap> selectWorkHistoryList(DashboardData dashboardData);
	
	public List<FlkMap> selectMainIndicatorsDataList(DashboardData dashboardData);
	
	public List<FlkMap> selectUsageChargeDataList(DashboardData dashboardData);
	
	public FlkMap selectWeatherInfo(DashboardData dashboardData);

	public List<FlkMap> selectReportList(Report report);
	
	public FlkMap selectReportDetail(Report report);
	
	public FlkMap selectChillerCount(DashboardData dashboardData);
	
	public List<FlkMap> selectChillerColdstorageData(DashboardData dashboardData);
	
}
