package com.flk.mobile.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.Maintenance;

@Repository
public interface MobileMapper {
	
	
	/**
	 * 메인화면 지점리스트 
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<FlkMap> selectMainSiteList(Maintenance maintenance)throws Exception;
	
	/**
	 * 지점별 장비리스트 조회
	 * @param maintenance
	 * @return
	 */
	public List<Maintenance> selectFacilityListForSite(Maintenance maintenance)throws Exception;
	
	/**
	 * 해당지점 1번장비 아이디 조회
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public Maintenance selectFirstFacilityInfo(Maintenance maintenance)throws Exception;
	
	/**
	 * 장비점검 상태값 변경
	 * @param maintenance
	 * @throws Exception
	 */
	public void updateCheckStatus(Maintenance maintenance)throws Exception;
	
	/**
	 * 미실시 점검항목 QueList
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<FlkMap> selectFacilityCheckQuestion(Maintenance maintenance) throws Exception;
	
	/**
	 * 미실시 점검항목 AnswerList
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<FlkMap> selectFacilityCheckAnswer(Maintenance maintenance) throws Exception;

	/**
	 * 점검완료 점검항목 QueList
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<FlkMap> selectFacilityCheckCmpltQuestion(Maintenance maintenance) throws Exception;
	
	/**
	 * 점검완료 점검항목 AnswerList
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<FlkMap> selectFacilityCheckCmpltAnswer(Maintenance maintenance) throws Exception;
	
	/**
	 * 점검내용 저장
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public void insertCheckValue(Maintenance maintenance) throws Exception;
	
	/**
	 * 점검내용 저장완료
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public void insertCheckFinish(Maintenance maintenance) throws Exception;
	
	/**
	 * 점검내용 수정
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public void updateCheckValue(Maintenance maintenance) throws Exception;
	
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
