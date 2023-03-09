package com.flk.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.utility.DateFormatUtils;
import com.flk.common.utility.FileUtil;
import com.flk.main.domain.DashboardData;
import com.flk.main.mapper.DashboardMapper;
import com.flk.mng.report.domain.Report;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 *  대쉬보드 조회(로그인 시 첫 화면)
 */
@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Autowired
	DashboardMapper dashboardMapper;
	
	/**
	 * 총계 - 전체 Co2 배출량 조회
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectCo2EmissionsList(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectCo2EmissionsList(dashboardData);
	}

	/**
	 * 검색연도(데이터 있는 연도만 조회 가능)
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectYearList() throws Exception {
		return dashboardMapper.selectYearList();
	}

	/**
	 * 총계 - 전체 냉방 사용요금
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectCoolChargeList(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectCoolChargeList(dashboardData);
	}

	/**
	 * 총계 - 에너지 사용량
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectEnergyUsageList(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectEnergyUsageList(dashboardData);
	}

	/**
	 * 총계 - 월별, 지점별 냉방 사용요금
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectBranchCoolChargeList(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectBranchCoolChargeList(dashboardData);
	}

	/**
	 * 총계 - 총 누적 절감액, 누적 절감 비율
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public FlkMap selectTotalReductionValues(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectTotalReductionValues(dashboardData);
	}

	/**
	 * 총계 - 전력 총 소비량
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectTotalPowerConsumption(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectTotalPowerConsumption(dashboardData);
	}

	/**
	 * 총계 - 각 차트 절감액, 증감량
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectReductionValues(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectReductionValues(dashboardData);
	}

	/**
	 * 지점정보 - 지점정보
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public FlkMap selectBranchInfo(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectBranchInfo(dashboardData);
	}

	/**
	 * 지점정보 - 이력
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectWorkHistoryList(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectWorkHistoryList(dashboardData);
	}

	/**
	 * 지점정보 - 주요 지표 데이터
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> selectMainIndicatorsDataList(DashboardData dashboardData) throws Exception {
		
		int curYear = Integer.parseInt(DateFormatUtils.getMillisecondsTime().substring(0, 4));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int valueCnt = 1; //그래프 갯수
		// 축냉량이 아닐 경우 (방냉량은 2개 조회)
		if(!StringUtils.equals(dashboardData.getSubType(), "SUB_1")) {
			valueCnt = 2;
		}
		List<FlkMap> selectList = new ArrayList<FlkMap>();

		List<String> xList = new ArrayList<String>();
		JSONArray yList = new JSONArray();
		List<Object> tempList = new ArrayList<Object>();
		
		for(int year=2015; year<=curYear; year++) {
			dashboardData.setYear(String.valueOf(year));
			selectList = dashboardMapper.selectMainIndicatorsDataList(dashboardData);
			
			if(selectList.size() > 0){
				String name = "";
				String stack = "";
				for(int i=0 ; i<valueCnt ; i++){
					List<Object> list = new ArrayList<Object>();
					name = selectList.get(0).get("name"+i).toString();
					stack = selectList.get(0).get("year").toString();
					for(int j=0 ; j<selectList.size() ; j++){
						if(i == 0 && year==2015) {
							xList.add(selectList.get(j).get("xlist").toString());
							if(selectList.get(j).get("temp") != null){
								tempList.add(selectList.get(j).get("temp"));
							}
						}
						if(selectList.get(j).get("amount"+i)==null){
							list.add("");
						}else{
							list.add(selectList.get(j).get("amount"+i));
						}
					}
					JSONObject obj = new JSONObject();
					obj.put("stack", stack);
					obj.put("name", name);
					obj.put("data", list);
					
					yList.add(obj);
				}
			}
			resultMap.put( "xList", xList );
			resultMap.put( "yList", yList );
		}
		
		return resultMap;
	}

	/**
	 * 지점정보 - 사용요금 비교 데이터
	 * @param dashboardData
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectUsageChargeDataList(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectUsageChargeDataList(dashboardData);
	}

	/**
	 * 지점정보 - 기온
	 * @param dashboardData
	 * @return
	 */
	@Override
	public FlkMap selectWeatherInfo(DashboardData dashboardData) {
		return dashboardMapper.selectWeatherInfo(dashboardData);
	}

	@Override
	public List<FlkMap> selectReportList(Report report) throws Exception {
		return dashboardMapper.selectReportList(report);
	}

	@Override
	public void downloadReportFile(Report report, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		FlkMap reportDetail = dashboardMapper.selectReportDetail(report);
		
		if(reportDetail != null) {
			FileUtil.downloadFile((String)reportDetail.get("reportFilePath"), (String)reportDetail.get("reportFileName"), request, response);
		} else {
			//정보 없음
			throw new Exception("report file info not exist");
		}
		
	}

	/**
	 * 지점정보 - 냉동기 축냉 효율
	 * @param dashboardData
	 * @return
	 */
	@Override
	public FlkMap selectChillerCount(DashboardData dashboardData) throws Exception {
		return dashboardMapper.selectChillerCount(dashboardData);
	}	
	
	/**
	 * 지점정보 - 냉동기 축냉 효율
	 * @param dashboardData
	 * @return
	 */
	@Override
	public List<FlkMap> selectChillerColdstorageData(DashboardData dashboardData) throws Exception {
		
		String currYear = new String(DateFormatUtils.getDateFormat("yyyy"));
		List<String> tempYear = new ArrayList<String>();
		for(int i=Integer.parseInt(currYear)-1; i<Integer.parseInt(currYear)+1; i++){
			tempYear.add(String.valueOf(i));
		}
		dashboardData.setYearArr(tempYear);
		
		if (dashboardData.getChillerIdx() == 1) {
			dashboardData.setAnalCode("25");
		} else if (dashboardData.getChillerIdx() == 2) {
			dashboardData.setAnalCode("26");
		} else if (dashboardData.getChillerIdx() == 3) {
			dashboardData.setAnalCode("27");
		} else {
			dashboardData.setAnalCode("24");
		}
		
		
		return dashboardMapper.selectChillerColdstorageData(dashboardData);
	}
	
}
