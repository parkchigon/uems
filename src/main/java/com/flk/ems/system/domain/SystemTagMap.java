package com.flk.ems.system.domain;

import java.util.List;

public class SystemTagMap {
	private String siteId;
	private String submenuId;
	private String templateId;
	private String groupId;
	private String componentId;
	private String tagId;
	private String plcNo;
	private String setFlag;
	private String displayName;
	private String unitCd;
	
	private String submenuName;
	private String menuListYn;
	
	private String templateFilePath1;
	private String menuFlag;
	private String cssFilePath;
	
	private String regId;
	private String regDate;
	private String updateId;
	private String updateDate;
	
	private List<SystemTagMap> tagList;
	private String redirectUrl;
	
	public SystemTagMap() { }
	
	public SystemTagMap(String siteId, String submenuId) {
		this.siteId = siteId;
		this.submenuId = submenuId;
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
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getComponentId() {
		return componentId;
	}
	public void setComponentId(String componentId) {
		this.componentId = componentId;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getPlcNo() {
		return plcNo;
	}
	public void setPlcNo(String plcNo) {
		this.plcNo = plcNo;
	}
	public String getSetFlag() {
		return setFlag;
	}
	public void setSetFlag(String setFlag) {
		this.setFlag = setFlag;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getUnitCd() {
		return unitCd;
	}
	public void setUnitCd(String unitCd) {
		this.unitCd = unitCd;
	}
	public String getSubmenuName() {
		return submenuName;
	}
	public void setSubmenuName(String submenuName) {
		this.submenuName = submenuName;
	}
	public String getMenuListYn() {
		return menuListYn;
	}
	public void setMenuListYn(String menuListYn) {
		this.menuListYn = menuListYn;
	}
	public String getTemplateFilePath1() {
		return templateFilePath1;
	}
	public void setTemplateFilePath1(String templateFilePath1) {
		this.templateFilePath1 = templateFilePath1;
	}
	public String getMenuFlag() {
		return menuFlag;
	}
	public void setMenuFlag(String menuFlag) {
		this.menuFlag = menuFlag;
	}
	public String getCssFilePath() {
		return cssFilePath;
	}
	public void setCssFilePath(String cssFilePath) {
		this.cssFilePath = cssFilePath;
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
	public List<SystemTagMap> getTagList() {
		return tagList;
	}
	public void setTagList(List<SystemTagMap> tagList) {
		this.tagList = tagList;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	
}
