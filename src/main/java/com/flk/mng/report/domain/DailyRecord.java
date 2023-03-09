package com.flk.mng.report.domain;

import java.util.List;

public class DailyRecord {

	private String drId;
	private String date;
	private String useFlag;
	private String updateId;
	private String updateDate;
	private String regId;
	private String regDate;
	private String siteId;
	private String recordType;
	private String result;
	private String reason;
	private String etc;
	
	List<String> insertDailyRecordList;
	List<String> updateDailyRecordList;
	List<String> deleteDailyRecordList;
	
	//엑셀 파일 생성
	private String startDate;
	private String endDate;
	
	private String checkYear;
	private String checkMonth;
	
	public String getDrId() {
		return drId;
	}
	public void setDrId(String drId) {
		this.drId = drId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public String getRecordType() {
		return recordType;
	}
	public void setRecordType(String recordType) {
		this.recordType = recordType;
	}
	public List<String> getInsertDailyRecordList() {
		return insertDailyRecordList;
	}
	public void setInsertDailyRecordList(List<String> insertDailyRecordList) {
		this.insertDailyRecordList = insertDailyRecordList;
	}
	public List<String> getUpdateDailyRecordList() {
		return updateDailyRecordList;
	}
	public void setUpdateDailyRecordList(List<String> updateDailyRecordList) {
		this.updateDailyRecordList = updateDailyRecordList;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public List<String> getDeleteDailyRecordList() {
		return deleteDailyRecordList;
	}
	public void setDeleteDailyRecordList(List<String> deleteDailyRecordList) {
		this.deleteDailyRecordList = deleteDailyRecordList;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCheckYear() {
		return checkYear;
	}
	public void setCheckYear(String checkYear) {
		this.checkYear = checkYear;
	}
	public String getCheckMonth() {
		return checkMonth;
	}
	public void setCheckMonth(String checkMonth) {
		this.checkMonth = checkMonth;
	}

	
}
