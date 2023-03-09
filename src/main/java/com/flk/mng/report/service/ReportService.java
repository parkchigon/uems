package com.flk.mng.report.service;

import java.util.List;
import java.util.Map;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.ManageFacility;
import com.flk.mng.report.domain.Report;

public interface ReportService {

	public List<FlkMap> selectReportTemplete(Report report) throws Exception;

	FlkMap selectReportTempleteDetail(Report report) throws Exception;
	
	public int addReportTemplete(Report report) throws Exception;

	public int modifyReportTemplete(Report report) throws Exception;

	public void deleteReportTemplete(Report report) throws Exception;

	public void insertReportItem(ManageFacility manageFacility) throws Exception;

	public Map<String, Object> selectReportItemDetail(ManageFacility manageFacility) throws Exception;
	
}
