package com.flk.ems.trend.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.ems.system.domain.RawData;

public interface TrendService {

	/**
	 * 태그모니터링 데이터조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringData(RawData rawData) throws Exception;
	
	/**
	 * 태그모니터링 추가 데이터조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringAddData(RawData rawData) throws Exception;
	
	
	/**
	 * 태그모니터링 추가 데이터조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagMonitoringAddMinData(RawData rawData) throws Exception;
	
	/**
	 * 태그모니터링 typeList
	 * @param rawData
	 * @return
	 */
	List<FlkMap> searchTypeList(RawData rawData) throws Exception;

	/**
	 * 태그모니터링 태그리스트
	 * @param rawData
	 * @return
	 */
	List<FlkMap> searchTagList(RawData rawData) throws Exception;

	/**
	 * 
	 * 태그모니터링 사용량 조회
	 * @param rawData
	 * @return
	 */
	List<RawData> selectTagUseAmount(RawData rawData) throws Exception;
	
	/**
	 * 태그모니터링 상세사용량 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagUseDetailAmount(RawData rawData) throws Exception;

	/**
	 * 태그모니터링 상세사용량 태그네임 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTagName(RawData rawData) throws Exception;

	/**
	 * 트랜드모니터링  태그리스트조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTrendGroupTagList(RawData rawData) throws Exception;

	/**
	 * 트랜드모니터링 태그그룹리스트조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectTrendGroupList(RawData rawData) throws Exception;

	/**
	 * 태그 정보 조회
	 * 
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	RawData selectTagInfo(RawData rawData) throws Exception;
	
	/**
	 * 비교모니터링 데이터 조회
	 * 
	 * @param rawData
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectCompareMonitoringData(RawData rawData) throws Exception;

	/**
	 * 
	 * 비교모니터링 사용량 조회
	 * @param rawData
	 * @return
	 */
	List<RawData> selectCompareUseAmount(RawData rawData) throws Exception;
	
	/**
	 * 
	 * 비교모니터링 상세사용량 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectCompareUseDetailAmount(RawData rawData) throws Exception;
	
	/**
	 * 
	 * 지표모니터링 지표태그 리스트 조회
	 * @param rawData
	 * @return
	 */
	List<RawData> selectIndicatorTagList(RawData rawData) throws Exception;
	
	/**
	 * 
	 * 지표모니터링 사용량 조회
	 * @param rawData
	 * @return
	 */
	List<RawData> selectIndicatorUseAmount(RawData rawData) throws Exception;
	
	/**
	 * 
	 * 지표모니터링 데이터 조회
	 * @param rawData
	 * @return
	 */
	List<FlkMap> selectIndicatorMonitoringData(RawData rawData) throws Exception;
}
