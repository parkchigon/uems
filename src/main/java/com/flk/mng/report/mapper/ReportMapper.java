package com.flk.mng.report.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.ManageFacility;
import com.flk.mng.report.domain.Report;

@Repository
public interface ReportMapper {

	/**
	 * 보고서 템플릿 목록 조회
	 * @param report
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectReportTempleteList(Report report) throws Exception;
	
	/**
	 * 보고서 싸이트코드 목록 조회
	 * @param report
	 * @return
	 * @throws Exception
	 */
	FlkMap selectReportSiteList(Report report) throws Exception;
	
	/**
	 * 보고서 템플릿 상세 조회
	 * @param report
	 * @return
	 * @throws Exception
	 */
	FlkMap selectReportTempleteDetail(Report report) throws Exception;
	
	/**
	 * 동일한 타입의 보고서 템플릿 중복 확인
	 * @param report
	 * @return
	 * @throws Exception
	 */
	FlkMap checkDuplicationReportTemplete(Report report) throws Exception;
	
	/**
	 * 보고서 템플릿 등록
	 * @param report
	 * @throws Exception
	 */
	int insertReportTemplete(Report report) throws Exception;
	
	/**
	 * 보고서 템플릿 수정
	 * @param report
	 * @throws Exception
	 */
	int updateReportTemplete(Report report) throws Exception;
	
	/**
	 * 보고서 템플릿 삭제
	 * @param report
	 * @throws Exception
	 */
	void deleteReportTemplete(Report report) throws Exception;

	/**
	 * 보고서 항목입력 등록
	 * @param manageFacility
	 */
	void insertManageFacilitySpec(ManageFacility manageFacility);
	void insertManageFacilityRate(ManageFacility manageFacility);

	/**
	 * 보고서 항목입력 조회
	 * @param manageFacility
	 * @return
	 */
	ManageFacility selectManageFacilitySpec(ManageFacility manageFacility);
	ManageFacility selectManageFacilityRate(ManageFacility manageFacility);
}
