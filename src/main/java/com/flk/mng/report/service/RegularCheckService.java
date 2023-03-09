package com.flk.mng.report.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.flk.api.domain.File;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.Maintenance;

public interface RegularCheckService {

	public List<FlkMap> selectFacilityList(Maintenance maintenance) throws Exception;
	
	public List<FlkMap> selectFacilityQueList(Maintenance maintenance) throws Exception;
	
	public List<FlkMap> selectFacilityAnsList(Maintenance maintenance) throws Exception;
	
	public Boolean saveFacilityQueList(Maintenance maintenance) throws Exception;
	
	public Boolean saveFacilityAnsList(Maintenance maintenance) throws Exception;

	public Map<String, Object> createRegularCheckReport(HttpServletRequest request, Maintenance maintenance) throws Exception;

	public List<FlkMap> selectFacilityStatusList(Maintenance maintenance) throws Exception;

	public List<FlkMap> selectFacilityCheckCmpltList(Maintenance maintenance) throws Exception;
	
	public List<FlkMap> selectFacilityCheckCmpltQuestion(Maintenance maintenance) throws Exception;

	public List<FlkMap> selectFacilityCheckCmpltAnswer(Maintenance maintenance) throws Exception;
	
	public Map<String, Object> selectFacilityCheckDetailInfo(Maintenance maintenance) throws Exception;
	
	public List<Maintenance> selectPhotoList(Maintenance maintenance) throws Exception;
	
	public Map<String, Object> updateRegularCheckInfo(Map<String, Object> paramMap) throws Exception;

	public Map<String, Object> uploadImg(File file) throws Exception;
	
}
