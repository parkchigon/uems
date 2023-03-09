package com.flk.ems.schedule.domain;

import java.util.List;

import com.flk.common.utility.PageUtil;

public class ScheduleRecord {

	private String sgId;
	private String siId;
	private String siteCd;
	private String tagId01;
	private double tagValue01;
	private String tagTime01;
	private String tagId02;
	private double tagValue02;
	private String tagTime02;
	private int delayTime;
	private String readTagId;
	private String applyFlag;
	private String scheduleId;
	private String useFlag;
	private String updateId;
	private String updateDate;
	private String regId;
	private String regDate;
	private String driveType;
	private String driveId;
	private String siteType;
	private String setPlace;
	private String date;
	private String dateFormat;
	private String years;
	
	private String tagType;
	
	
	/** 검색조건 검색항목1 */
	private String searchCondition;
	/** 검색조건 검색항목2 */
	private String searchCondition2;
		
	/** 페이지 사이즈 */
	private String listSize;
	/** 첫 페이지 */
	private int firstIndex;
	/** 마지막 페이지 */
	private int lastIndex;
	/** 페이지 유틸 */
	private PageUtil Pageutil;
	/** 현재 페이지 */
	private String currPage;
	

	public String getTagId01() {
		return tagId01;
	}
	public void setTagId01(String tagId01) {
		this.tagId01 = tagId01;
	}
	public double getTagValue01() {
		return tagValue01;
	}
	public void setTagValue01(double tagValue01) {
		this.tagValue01 = tagValue01;
	}
	public String getTagTime01() {
		return tagTime01;
	}
	public void setTagTime01(String tagTime01) {
		this.tagTime01 = tagTime01;
	}
	public String getTagId02() {
		return tagId02;
	}
	public void setTagId02(String tagId02) {
		this.tagId02 = tagId02;
	}
	public double getTagValue02() {
		return tagValue02;
	}
	public void setTagValue02(double tagValue02) {
		this.tagValue02 = tagValue02;
	}
	public String getTagTime02() {
		return tagTime02;
	}
	public void setTagTime02(String tagTime02) {
		this.tagTime02 = tagTime02;
	}
	public String getReadTagId() {
		return readTagId;
	}
	public void setReadTagId(String readTagId) {
		this.readTagId = readTagId;
	}
	public int getDelayTime() {
		return delayTime;
	}
	public void setDelayTime(int delayTime) {
		this.delayTime = delayTime;
	}
	public String getApplyFlag() {
		return applyFlag;
	}
	public void setApplyFlag(String applyFlag) {
		this.applyFlag = applyFlag;
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
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
	}	
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getDriveType() {
		return driveType;
	}
	public void setDriveType(String driveType) {
		this.driveType = driveType;
	}
	public String getDriveId() {
		return driveId;
	}
	public void setDriveId(String driveId) {
		this.driveId = driveId;
	}
	public String getSiteType() {
		return siteType;
	}
	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}
	public String getSetPlace() {
		return setPlace;
	}
	public void setSetPlace(String setPlace) {
		this.setPlace = setPlace;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	public String getSiId() {
		return siId;
	}
	public void setSiId(String siId) {
		this.siId = siId;
	}
	public String getTagType() {
		return tagType;
	}
	public void setTagType(String tagType) {
		this.tagType = tagType;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}	
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchCondition2() {
		return searchCondition2;
	}
	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
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
