package com.flk.ems.build.domain;

import java.util.List;

public class SystemTemplate {

	private String siteId;
	private String submenuId;
	private String templateId;
	private String applyFlag;
	private String regId;
	private String regDate;
	private String updateId;
	private String updateDate;
	private String templateFilePath1;
	private String thumbnailFilePath;
	private String setFilePath1;
	private String setFilePath2;
	private String setFilePath3;
	private String cssFilePath;
	
	private String etcSubmenuYn;
	private List<SystemTemplate> templateList;
	private String deleteYn;
	private String rightSetYn;
	
	public SystemTemplate() { }
	
	public SystemTemplate(String submenuId, String templateId) {
		this.submenuId = submenuId;
		this.templateId = templateId;
	}
	
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSubmenuId() {
		return submenuId;
	}
	public void setSubmenuId(String submenuId) {
		this.submenuId = submenuId;
	}
	public String getTemplateId() {
		return templateId;
	}
	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}
	public String getApplyFlag() {
		return applyFlag;
	}
	public void setApplyFlag(String applyFlag) {
		this.applyFlag = applyFlag;
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
	public String getTemplateFilePath1() {
		return templateFilePath1;
	}
	public void setTemplateFilePath1(String templateFilePath1) {
		this.templateFilePath1 = templateFilePath1;
	}
	public String getThumbnailFilePath() {
		return thumbnailFilePath;
	}
	public void setThumbnailFilePath(String thumbnailFilePath) {
		this.thumbnailFilePath = thumbnailFilePath;
	}
	public String getSetFilePath1() {
		return setFilePath1;
	}
	public void setSetFilePath1(String setFilePath1) {
		this.setFilePath1 = setFilePath1;
	}
	public String getSetFilePath2() {
		return setFilePath2;
	}
	public void setSetFilePath2(String setFilePath2) {
		this.setFilePath2 = setFilePath2;
	}
	public String getSetFilePath3() {
		return setFilePath3;
	}
	public void setSetFilePath3(String setFilePath3) {
		this.setFilePath3 = setFilePath3;
	}
	public String getCssFilePath() {
		return cssFilePath;
	}
	public void setCssFilePath(String cssFilePath) {
		this.cssFilePath = cssFilePath;
	}
	public String getEtcSubmenuYn() {
		return etcSubmenuYn;
	}
	public void setEtcSubmenuYn(String etcSubmenuYn) {
		this.etcSubmenuYn = etcSubmenuYn;
	}
	public List<SystemTemplate> getTemplateList() {
		return templateList;
	}
	public void setTemplateList(List<SystemTemplate> templateList) {
		this.templateList = templateList;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getRightSetYn() {
		return rightSetYn;
	}
	public void setRightSetYn(String rightSetYn) {
		this.rightSetYn = rightSetYn;
	}
	
}
