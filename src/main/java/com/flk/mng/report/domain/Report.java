package com.flk.mng.report.domain;

import org.springframework.web.multipart.MultipartFile;

import com.flk.common.utility.PageUtil;

public class Report {

	private String rtId;
	private String reportType;
	private String reportSubType;
	private String templateName;
	private String fileServerPath;
	private String fileName;
	private String mimetype;
	private String useFlag;
	private String updateId;
	private String updateDate;
	private String regId;
	private String regDate;
	private String siteId;
	private String siteName;
	private String sgId;
	private String sgName;
	private MultipartFile reportTemplteFile;
	
	
	public String rfId;
	
	
	
	private String searchGroup;
	private String searchSite;
	private String searchType;
	private String searchKeyword;
	/** 페이지 사이즈*/
	private String listSize;
	/** 첫 페이지 */
	private int firstIndex;
	/** 마지막 페이지 */
	private int lastIndex;
	/** 페이지 유틸 */
	private PageUtil Pageutil;
	/** 현재 페이지*/
	private String currPage;
	
	
	public String getRtId() {
		return rtId;
	}
	public void setRtId(String rtId) {
		this.rtId = rtId;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportSubType() {
		return reportSubType;
	}
	public void setReportSubType(String reportSubType) {
		this.reportSubType = reportSubType;
	}
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public String getFileServerPath() {
		return fileServerPath;
	}
	public void setFileServerPath(String fileServerPath) {
		this.fileServerPath = fileServerPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getMimetype() {
		return mimetype;
	}
	public void setMimetype(String mimetype) {
		this.mimetype = mimetype;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
	}
	public String getSgName() {
		return sgName;
	}
	public void setSgName(String sgName) {
		this.sgName = sgName;
	}
	public MultipartFile getReportTemplteFile() {
		return reportTemplteFile;
	}
	public void setReportTemplteFile(MultipartFile reportTemplteFile) {
		this.reportTemplteFile = reportTemplteFile;
	}
	public String getRfId() {
		return rfId;
	}
	public void setRfId(String rfId) {
		this.rfId = rfId;
	}
	public String getSearchGroup() {
		return searchGroup;
	}
	public void setSearchGroup(String searchGroup) {
		this.searchGroup = searchGroup;
	}
	public String getSearchSite() {
		return searchSite;
	}
	public void setSearchSite(String searchSite) {
		this.searchSite = searchSite;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getListSize() {
		return listSize;
	}
	public void setListSize(String listSize) {
		this.listSize = listSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public PageUtil getPageutil() {
		return Pageutil;
	}
	public void setPageutil(PageUtil pageutil) {
		Pageutil = pageutil;
	}
	public String getCurrPage() {
		return currPage;
	}
	public void setCurrPage(String currPage) {
		this.currPage = currPage;
	}
}
