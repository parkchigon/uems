package com.flk.integration.domain;

import java.util.List;
import java.util.Map;

/**
 * @author "최영덕"
 *
 */
public class Integration {

	/** 관리자 아이디 */
	private String mngId;
	/** 지점 아이디*/
	private String siteId;
	/** 지점 명*/
	private String siteName;
	/** 지점 코드 */
	private String siteCd;
	/** 지점 그룹 코드 */
	private String sgCd;
	/** 지점 그룹 명 */
	private String sgName;
	/** 관리 순서 */
	private String arrayNo;
	/** 지점 위도 */
	private String regionX;
	/** 지점 경도 */
	private String regionY;
	/** 기상청 x좌표 */
	private String weatherX;
	/** 기상청 y좌표 */
	private String weatherY;
	/** 템플릿 ID */
	private String templateID;
	/** 템플릿 Type */
	private String templateType;
	/** 템플릿 파일경로 */
	private String templateFilePath;
	/** 썸네일 파일경로 */
	private String thumnailFilePath;
	/** 설명 */
	private String templateDesc;
	/** 사용여부 */
	private String useFlag;
	/** 컴포넌트그룹아이디 */
	private String groupId;
	/** 템플릿 컴포넌트ID (컴포넌트고유ID) */
	private String componentId;
	/** 컴포넌트명 */
	private String componentName;
	/** 컴포넌트그룹명 */
	private String groupName;
	/** 썸네일에 매핑되는 번호 */
	private String viewNo;
	/** 태그종류: TAG_TYPE1(AI) , TAG_TYPE2(AO) , TAG_TYPE3(DI) , TAG_TYPE4(DO) */
	private String tagTypeCd;
	/** tbl_tag FK */
	private String tagId;
	/** 사용여부 */
	private String setFlag;
	/** 등록 Id */
	private String regId;
	/** 등록 Date */
	private String regDate;
	/** updateId */
	private String updateId;
	/** updateDate */
	private String updateDate;
	/** 태그 값 */
	private String tagValue;
	/** 등록시간과 현재시간의 TERM (초) */
	private String diffSec;
	
	private String insertCondition;
	private String insertCondition2;
	
	private Map<String, String> templateFilePathMap;
	private String componentValue;
	private List<TemplateType> tempList;
	private List<String> siteCdList;
	
	private String infoSiteId;
	private String infoType;
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
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
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getSgCd() {
		return sgCd;
	}
	public void setSgCd(String sgCd) {
		this.sgCd = sgCd;
	}
	public String getSgName() {
		return sgName;
	}
	public void setSgName(String sgName) {
		this.sgName = sgName;
	}
	public String getArrayNo() {
		return arrayNo;
	}
	public void setArrayNo(String arrayNo) {
		this.arrayNo = arrayNo;
	}
	public String getRegionX() {
		return regionX;
	}
	public void setRegionX(String regionX) {
		this.regionX = regionX;
	}
	public String getRegionY() {
		return regionY;
	}
	public void setRegionY(String regionY) {
		this.regionY = regionY;
	}
	public String getWeatherX() {
		return weatherX;
	}
	public void setWeatherX(String weatherX) {
		this.weatherX = weatherX;
	}
	public String getWeatherY() {
		return weatherY;
	}
	public void setWeatherY(String weatherY) {
		this.weatherY = weatherY;
	}
	public String getTemplateID() {
		return templateID;
	}
	public void setTemplateID(String templateID) {
		this.templateID = templateID;
	}
	public String getTemplateType() {
		return templateType;
	}
	public void setTemplateType(String templateType) {
		this.templateType = templateType;
	}
	public String getTemplateFilePath() {
		return templateFilePath;
	}
	public void setTemplateFilePath(String templateFilePath) {
		this.templateFilePath = templateFilePath;
	}
	public String getThumnailFilePath() {
		return thumnailFilePath;
	}
	public void setThumnailFilePath(String thumnailFilePath) {
		this.thumnailFilePath = thumnailFilePath;
	}
	public String getTemplateDesc() {
		return templateDesc;
	}
	public void setTemplateDesc(String templateDesc) {
		this.templateDesc = templateDesc;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
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
	public String getComponentName() {
		return componentName;
	}
	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getViewNo() {
		return viewNo;
	}
	public void setViewNo(String viewNo) {
		this.viewNo = viewNo;
	}
	public String getTagTypeCd() {
		return tagTypeCd;
	}
	public void setTagTypeCd(String tagTypeCd) {
		this.tagTypeCd = tagTypeCd;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getSetFlag() {
		return setFlag;
	}
	public void setSetFlag(String setFlag) {
		this.setFlag = setFlag;
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
	public String getTagValue() {
		return tagValue;
	}
	public void setTagValue(String tagValue) {
		this.tagValue = tagValue;
	}
	public String getDiffSec() {
		return diffSec;
	}
	public void setDiffSec(String diffSec) {
		this.diffSec = diffSec;
	}
	public String getInsertCondition() {
		return insertCondition;
	}
	public void setInsertCondition(String insertCondition) {
		this.insertCondition = insertCondition;
	}
	public String getInsertCondition2() {
		return insertCondition2;
	}
	public void setInsertCondition2(String insertCondition2) {
		this.insertCondition2 = insertCondition2;
	}
	public Map<String, String> getTemplateFilePathMap() {
		return templateFilePathMap;
	}
	public void setTemplateFilePathMap(Map<String, String> templateFilePathMap) {
		this.templateFilePathMap = templateFilePathMap;
	}
	public String getComponentValue() {
		return componentValue;
	}
	public void setComponentValue(String componentValue) {
		this.componentValue = componentValue;
	}
	public List<TemplateType> getTempList() {
		return tempList;
	}
	public void setTempList(List<TemplateType> tempList) {
		this.tempList = tempList;
	}
	public List<String> getSiteCdList() {
		return siteCdList;
	}
	public void setSiteCdList(List<String> siteCdList) {
		this.siteCdList = siteCdList;
	}
	public String getInfoSiteId() {
		return infoSiteId;
	}
	public void setInfoSiteId(String infoSiteId) {
		this.infoSiteId = infoSiteId;
	}
	public String getInfoType() {
		return infoType;
	}
	public void setInfoType(String infoType) {
		this.infoType = infoType;
	}
	

}
