package com.flk.ems.trend.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.system.domain.RawData;

@Repository
public interface TrendMapper {

	/**
	 * 모니터링 데이터 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringData(RawData rawData);
	
	/**
	 * 모니터링 실시간 추가데이터 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringAddData(RawData rawData);
	
	/**
	 * 모니터링 실시간 추가데이터 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringAddMinData(RawData rawData);
	
	/**
	 * 태그모니터링 시간별 데이터조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringDataForTime(RawData rawData);
	
	/**
	 * 태그모니터링 일별 데이터조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringDataForDay(RawData rawData);

	/**
	 * 태그모니러팅 검색타입 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> searchTypeList(RawData rawData);

	/**
	 * 태그모니터링 해당 태극룹아이디에 해당하는 해댱리스트
	 * @param rawData
	 * @return
	 */
	List<FlkMap> searchTagList(RawData rawData);

	/**
	 * 태그모니터링 태그상세사용량 일별
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagUseDetailAmountForDay(RawData rawData);

	/**
	 * 태그모니터링 태그상세사용량 시간별
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagUseDetailAmountForTime(RawData rawData);

	/**
	 * 태그모니터링 태그상세사용량 일별
	 * 
	 * @param rawData
	 * @return
	 */
	List<RawData> selectTagUseAmountForDay(RawData rawData);
	
	/**
	 * 태그모니터링 시간별 태그사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectTagUseAmountForTime(RawData rawData);
	
	/**
	 * 공통모니터링 태그상세사용량 리스트용 태그명 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagName(RawData rawData);

	/**
	 * 태그모니터링 실시간 데이터 조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringForRealTime(RawData rawData);
	
	/**
	 * 태그모니터링 실시간 데이터조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringForRealTimeN(RawData rawData);
	
	/**
	 * 태그모니터링 실시간 태그사용량 조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<RawData> selectTagUseAmountForRealTime(RawData rawData);
	
	/**
	 * 태그모니터링 실시간 태그상세사용량 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagUseDetailAmountForRealTime(RawData rawData);
	
	/**
	 * 트랜드모니터링 태그그룹매핑리스트 조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTrendGroupTagList(RawData rawData);

	 /**
	 * 트랜드모니터링 태그그룹매핑리스트 조회
	 * 
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTrendGroupList(RawData rawData);

	/**
	 * 태그 정보 조회
	 * 
	 * @param rawData
	 * @return
	 */
	RawData selectTagInfo(RawData rawData);
	
	
	/**
	 * 비교모니터링 일별데이터 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectCompareMonitoringDataForDay(RawData rawData);
	
	/**
	 * 비교모니터링 월별데이터 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectCompareMonitoringDataForMonth(RawData rawData);
	
	/**
	 * 비교모니터링 시간별데이터 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectCompareMonitoringDataForHour(RawData rawData);
	
	/**
	 * 비교모니터링 일별 태그사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectCompareUseAmountForDay(RawData rawData);
	
	/**
	 * 비교모니터링 일별 태그상세사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectCompareUseDetailAmountForDay(RawData rawData);
	
	/**
	 * 비교모니터링 월별 태그사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectCompareUseAmountForMonth(RawData rawData);
	
	/**
	 * 비교모니터링 월별 태그상세사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectCompareUseDetailAmountForMonth(RawData rawData);
	
	/**
	 * 비교모니터링 시간별 태그사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectCompareUseAmountForHour(RawData rawData);
	
	/**
	 * 비교모니터링 시간별 태그상세사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectCompareUseDetailAmountForHour(RawData rawData);
	
	/**
	 * 지표모니터링 지표태그리스트 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectIndicatorTagList(RawData rawData);
	
	/**
	 * 지표모니터링 분별 데이터 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectIndicatorMonitoringDataForMin(RawData rawData);
	
	/**
	 * 지표모니터링 시간별 데이터 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectIndicatorMonitoringDataForHour(RawData rawData);
	
	/**
	 * 지표모니터링 일별 데이터 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectIndicatorMonitoringDataForDay(RawData rawData);
	
	/**
	 * 지표모니터링 월별 데이터 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectIndicatorMonitoringDataForMonth(RawData rawData);
	
	/**
	 * 지표모니터링 분별 TAG 사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectIndicatorUseAmountForMin(RawData rawData);
	
	/**
	 * 지표모니터링 시간별 TAG 사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectIndicatorUseAmountForHour(RawData rawData);
	
	/**
	 * 지표모니터링 일별  TAG 사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectIndicatorUseAmountForDay(RawData rawData);
	
	/**
	 * 지표모니터링 월별  TAG 사용량 조회
	 *
	 * @param rawData
	 * @return
	 */
	List<RawData> selectIndicatorUseAmountForMonth(RawData rawData);
	
}
