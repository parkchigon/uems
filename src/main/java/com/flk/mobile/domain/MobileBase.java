package com.flk.mobile.domain;

public class MobileBase {
	
	private String mngId;
	
	private String siteId;
	/** 화면용 선택 년도 */
	private String checkYear;
	/** 화면용 선택 월 */
	private String checkMonth;
	/** DB용 검색 년월 */
	private String chkMonth;
	
	
	
	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}

	public String getChkMonth() {
		return chkMonth;
	}

	public void setChkMonth(String chkMonth) {
		this.chkMonth = chkMonth;
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
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	
}
