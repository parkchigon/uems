package com.flk.ems.trend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.ems.system.domain.RawData;
import com.flk.ems.trend.mapper.TrendMapper;

@Service
public class TrendServiceImpl implements TrendService{

	@Autowired
	private TrendMapper trendMapper;

	public List<FlkMap> selectTagMonitoringData(RawData rawData) throws Exception {
		List<FlkMap> returnVal = null;
		if(Constants.ONE_MIN.equals(rawData.getTerm())||Constants.FIVE_MIN.equals(rawData.getTerm())||Constants.FIFTEEN_MIN.equals(rawData.getTerm())||Constants.HOUR.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagMonitoringDataForTime(rawData);
		}else if(Constants.DAY.equals(rawData.getTerm())||Constants.MONTH.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagMonitoringDataForDay(rawData);
		}else if(Constants.REALTIME.equals(rawData.getTerm())){
			if(Constants.YES.equals(rawData.getRealTimeType())){
				returnVal = trendMapper.selectTagMonitoringForRealTime(rawData);
			}else{
				returnVal = trendMapper.selectTagMonitoringForRealTimeN(rawData);
			}
		}
		return returnVal;
	}
	
	public List<FlkMap> selectTagMonitoringAddData(RawData rawData) throws Exception {
		List<FlkMap> returnVal = null;
		returnVal = trendMapper.selectTagMonitoringAddData(rawData);
		return returnVal;
	}
	
	public List<FlkMap> selectTagMonitoringAddMinData(RawData rawData) throws Exception {
		List<FlkMap> returnVal = null;
		returnVal = trendMapper.selectTagMonitoringAddMinData(rawData);
		return returnVal;
	}

	public List<FlkMap> searchTypeList(RawData rawData) throws Exception{
		return  trendMapper.searchTypeList(rawData);
	}

	public List<FlkMap> searchTagList(RawData rawData) throws Exception{
		return  trendMapper.searchTagList(rawData);
	}

	public List<FlkMap> selectTagUseDetailAmount(RawData rawData) throws Exception{
		List<FlkMap> returnVal = null;
		if(Constants.ONE_MIN.equals(rawData.getTerm())||Constants.FIVE_MIN.equals(rawData.getTerm())||Constants.FIFTEEN_MIN.equals(rawData.getTerm())||Constants.HOUR.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagUseDetailAmountForTime(rawData);
		}else if(Constants.DAY.equals(rawData.getTerm())||Constants.MONTH.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagUseDetailAmountForDay(rawData);
		}else if(Constants.REALTIME.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagUseDetailAmountForRealTime(rawData);
		}
		return returnVal;
	}
	
	public List<FlkMap> selectTagName(RawData rawData){
		return  trendMapper.selectTagName(rawData);
	}
	
	public List<RawData> selectTagUseAmount(RawData rawData) throws Exception{
		List<RawData> returnVal = null;
		if(Constants.ONE_MIN.equals(rawData.getTerm())||Constants.FIVE_MIN.equals(rawData.getTerm())||Constants.FIFTEEN_MIN.equals(rawData.getTerm())||Constants.HOUR.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagUseAmountForTime(rawData);
		}else if(Constants.DAY.equals(rawData.getTerm())||Constants.MONTH.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagUseAmountForDay(rawData);
		}else if(Constants.REALTIME.equals(rawData.getTerm())){
			returnVal = trendMapper.selectTagUseAmountForRealTime(rawData);
		}
		return  returnVal;
	}

	/**
	 * 태그 정보 조회
	 */
	@Override
	public RawData selectTagInfo(RawData rawData) throws Exception {
		return trendMapper.selectTagInfo(rawData);
	}

	/**
	 * 트랜드모니터링 태그그룹 태그리스트 조회
	 */
	@Override
	public List<FlkMap> selectTrendGroupTagList(RawData rawData) throws Exception {
		List<FlkMap> returnVal = trendMapper.selectTrendGroupTagList(rawData);
		return returnVal;
	}
	
	/**
	 * 트랜드모니터링 태그그룹리스트조회
	 */
	@Override
	public List<FlkMap> selectTrendGroupList(RawData rawData) throws Exception {
		List<FlkMap> returnVal = trendMapper.selectTrendGroupList(rawData);
		return returnVal;
	}

	/**
	 * 비교 모니터링 일별 데이터 조회
	 */
	@Override
	public List<FlkMap> selectCompareMonitoringData(RawData rawData) throws Exception {
		List<FlkMap> returnVal = null;
		if(Constants.DAY.equals(rawData.getTerm())){
			returnVal= trendMapper.selectCompareMonitoringDataForDay(rawData);
		}else if(Constants.MONTH.equals(rawData.getTerm())){
			returnVal= trendMapper.selectCompareMonitoringDataForMonth(rawData);
		}else if(Constants.HOUR.equals(rawData.getTerm())){
			returnVal= trendMapper.selectCompareMonitoringDataForHour(rawData);
		}
		return returnVal;
	}
	
	/**
	 * 비교 모니터링 태그 사용량 조회
	 */
	public List<RawData> selectCompareUseAmount(RawData rawData) throws Exception{
		List<RawData> returnVal = null;
		if(Constants.HOUR.equals(rawData.getTerm())){
			returnVal = trendMapper.selectCompareUseAmountForHour(rawData);
		}else if(Constants.DAY.equals(rawData.getTerm())){
			returnVal = trendMapper.selectCompareUseAmountForDay(rawData);
		}else if(Constants.MONTH.equals(rawData.getTerm())){
			returnVal = trendMapper.selectCompareUseAmountForMonth(rawData);
		}
		return  returnVal;
	}

	/**
	 * 비교 모니터링 태그 상세사용량 조회
	 */
	@Override
	public List<FlkMap> selectCompareUseDetailAmount(RawData rawData) throws Exception {
		List<FlkMap> returnVal = null;
		if(Constants.HOUR.equals(rawData.getTerm())){
			returnVal = trendMapper.selectCompareUseDetailAmountForHour(rawData);
		}else if(Constants.DAY.equals(rawData.getTerm())){
			returnVal = trendMapper.selectCompareUseDetailAmountForDay(rawData);
		}else if(Constants.MONTH.equals(rawData.getTerm())){
			returnVal = trendMapper.selectCompareUseDetailAmountForMonth(rawData);
		}
		return  returnVal;
	}

	/**
	 * 지표 모니터링  지표태그리스트 조회
	 */
	@Override
	public List<RawData> selectIndicatorTagList(RawData rawData) throws Exception {
		return trendMapper.selectIndicatorTagList(rawData);
	}

	/**
	 * 지표 모니터링 태그사용량 조회
	 */
	@Override
	public List<RawData> selectIndicatorUseAmount(RawData rawData) throws Exception {
		List<RawData> returnVal = null;
		if(Constants.HOUR.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorUseAmountForHour(rawData);
		}else if(Constants.DAY.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorUseAmountForDay(rawData);
		}else if(Constants.MONTH.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorUseAmountForMonth(rawData);
		}else if(Constants.MIN.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorUseAmountForMin(rawData);
		}
		return returnVal;
	}

	/**
	 * 지표 모니터링 데이터 조회
	 */
	@Override
	public List<FlkMap> selectIndicatorMonitoringData(RawData rawData) throws Exception {
		List<FlkMap> returnVal = null;
		if(Constants.HOUR.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorMonitoringDataForHour(rawData);
		}else if(Constants.DAY.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorMonitoringDataForDay(rawData);
		}else if(Constants.MONTH.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorMonitoringDataForMonth(rawData);
		}else if(Constants.MIN.equals(rawData.getTerm())){
			returnVal = trendMapper.selectIndicatorMonitoringDataForMin(rawData);
		}
		return returnVal;
	}
}
