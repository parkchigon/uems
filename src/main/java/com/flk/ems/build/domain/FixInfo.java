package com.flk.ems.build.domain;

public class FixInfo {
	private String fixId;
	private String fixCd;
	private String applyFlag;
	private String updateId;
	private String updateDate;
	
	public FixInfo() { }
	
	public FixInfo(String fixCd, String applyFlag) {
		this.fixCd = fixCd;
		this.applyFlag = applyFlag;
	}
	
	public String getFixId() {
		return fixId;
	}
	public void setFixId(String fixId) {
		this.fixId = fixId;
	}
	public String getFixCd() {
		return fixCd;
	}
	public void setFixCd(String fixCd) {
		this.fixCd = fixCd;
	}
	public String getApplyFlag() {
		return applyFlag;
	}
	public void setApplyFlag(String applyFlag) {
		this.applyFlag = applyFlag;
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
	
	
}
