package com.flk.mng.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.domain.Constants;
import com.flk.common.domain.UploadFile;
import com.flk.common.utility.FileUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.report.domain.ManageFacility;
import com.flk.mng.report.domain.Report;
import com.flk.mng.report.mapper.ReportMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportMapper reportMapper;
	
	@Autowired
	private SiteMapper siteMapper;

	@Value("#{config['report.templete.file.path']}")
	private String templatePath;					//보고서 템플릿 파일 저장 경로
	

	/**
	 * 보고서 템플릿 목록 조회
	 */
	@Override
	public List<FlkMap> selectReportTemplete(Report report) throws Exception {
		return reportMapper.selectReportTempleteList(report);
	}
	
	/**
	 * 보고서 템플릿 상세 조회
	 */
	@Override
	public FlkMap selectReportTempleteDetail(Report report) throws Exception {
		return reportMapper.selectReportTempleteDetail(report);
	}
	
	/**
	 * 보고서 템플릿 등록
	 */
	@Override
	public int addReportTemplete(Report report) throws Exception {
		
		FlkMap result = reportMapper.checkDuplicationReportTemplete(report);
		
		if(result != null) {
			return 9999;
		} else {
			if(!report.getReportTemplteFile().isEmpty()){
				UploadFile uploadFile = FileUtil.saveMultipartFile(report.getReportTemplteFile(), templatePath);
				report.setFileServerPath(templatePath);
				report.setFileName(uploadFile.getStoreFileName() + "." + uploadFile.getStoreFileExtention());
				report.setMimetype("application/octet-stream");
				report.setUseFlag(Constants.YES);
			}
			// siteId 없을 경우엔 report_sub_type 03 : 정기점검
			if(StringUtils.isBlank(report.getSiteId())) {
				report.setReportSubType("03");
			}
			return reportMapper.insertReportTemplete(report);
		}
		
		
	}

	/**
	 * 보고서 템플릿 수정
	 */
	@Override
	public int modifyReportTemplete(Report report) throws Exception{
		if(StringUtils.isBlank(report.getReportSubType())) {
			report.setReportSubType("00");
		}
		FlkMap afterReportTemplete = reportMapper.checkDuplicationReportTemplete(report);
		FlkMap beforeReportTemplete = reportMapper.selectReportTempleteDetail(report);
		
		if(afterReportTemplete == null) {  
			if(report.getReportTemplteFile() != null){
				
				//기존에 업로드 되어 있는 파일 삭제
				FileUtil.deleteFile(report.getFileServerPath(), report.getFileName());
				
				//신규 파일 저장
				UploadFile uploadFile = FileUtil.saveMultipartFile(report.getReportTemplteFile(), templatePath);
				report.setFileServerPath(templatePath);
				report.setFileName(uploadFile.getStoreFileName() + "." + uploadFile.getStoreFileExtention());
			}
			return reportMapper.updateReportTemplete(report);
			
		} else {
			Report afterReport = new Report();
			Report beforeDetail = new Report();
			afterReport = (Report) MethodUtil.convertToOject(afterReportTemplete, afterReport);
			beforeDetail = (Report) MethodUtil.convertToOject(beforeReportTemplete, beforeDetail);
	
			
			if (!afterReport.getRtId().equals(report.getRtId()) && afterReport.getSiteId().equals(report.getSiteId())
					&& afterReport.getReportType().equals(report.getReportType())) {
//					&& afterReport.getReportSubType().equals(report.getReportSubType())) {
					return 9999;
			} else {
				if(report.getReportTemplteFile() != null){
					
					//기존에 업로드 되어 있는 파일 삭제
					FileUtil.deleteFile(report.getFileServerPath(), report.getFileName());
					
					//신규 파일 저장
					UploadFile uploadFile = FileUtil.saveMultipartFile(report.getReportTemplteFile(), templatePath);
					report.setFileServerPath(templatePath);
					report.setFileName(uploadFile.getStoreFileName() + "." + uploadFile.getStoreFileExtention());
				}
				return reportMapper.updateReportTemplete(report);
			}
		}
	}

	/**
	 * 보고서 템플릿 삭제
	 */
	@Override
	public void deleteReportTemplete(Report report) throws Exception {
		
		// 파일은 삭제하지 않고 보존..
		//FileUtil.deleteFile(report.getFileServerPath(), report.getFileName());
		reportMapper.deleteReportTemplete(report);
	}

	/**
	 * 보고서 항목입력 등록
	 */
	@Override
	@Transactional
	public void insertReportItem(ManageFacility manageFacility) throws Exception {
		manageFacility.setUseFlag(Constants.YES);
		reportMapper.insertManageFacilitySpec(manageFacility);
		reportMapper.insertManageFacilityRate(manageFacility);
	}

	/**
	 * 보고서 항목입력 조회
	 */
	@Override
	public Map<String, Object> selectReportItemDetail(ManageFacility manageFacility) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Site site = new Site();
		site.setSiteId(manageFacility.getSiteId());
		resultMap.put("siteInfo", siteMapper.selectSiteView(site));
		
		resultMap.put("specInfo", reportMapper.selectManageFacilitySpec(manageFacility));
		resultMap.put("rateInfo", reportMapper.selectManageFacilityRate(manageFacility));
		return resultMap;
	}


}
