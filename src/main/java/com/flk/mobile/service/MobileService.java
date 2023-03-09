package com.flk.mobile.service;

import java.util.List;
import java.util.Map;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.Maintenance;
import com.flk.mng.trendMng.domain.TrendGroup;
import com.flk.mng.user.domain.Mng;

public interface MobileService {

	
	/**
	 * 메인 지점리스트
	 * @param maintenance
	 * @return
	 */
	public List<FlkMap> selectMainSiteList(Maintenance maintenance) throws Exception;
	
	/**
	 * 지점별 장비리스트 조회
	 * @param maintenance
	 * @return
	 */
	public List<Maintenance> selectFacilityListForSite(Maintenance maintenance) throws Exception;
	
	/**
	 * 점검항목 Que List
	 * @param maintenance
	 * @throws Exception
	 */
	public List<FlkMap> selectFacilityCheckQuestion(Maintenance maintenance) throws Exception;
	
	/**
	 * 점검항목 Ans List
	 * @param maintenance
	 * @throws Exception
	 */
	public List<FlkMap> selectFacilityCheckAnswer(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검화면 데이터 조회
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectCheckData(Maintenance maintenance, int count) throws Exception;
	
	/**
	 * 장비점검내용 데이터 저장
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insertCheckValue(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 이미지리스트 조회
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<Maintenance> selectPhotoList(Maintenance maintenance) throws Exception;

	/**
	 * 이미지리스트 삭제 --> 사용여부 'N' 업데이트
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public int deletePhoto(Maintenance maintenance) throws Exception;
}
