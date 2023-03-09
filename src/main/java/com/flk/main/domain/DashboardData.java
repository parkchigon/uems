package com.flk.main.domain;

import java.util.List;

public class DashboardData {
	
	/** 연도 */
	private String year;
	/** 월 */
	private String month;
	/** 지점그룹 ID */
	private String sgId;
	private String siteCd;
	/** chart 분류  */
	private String chartVal;
	/** 지점 ID */
	private String siteId;
	/** 서브타입 */
	private String subType;
	/** analCode */
	private String analCode;
	/** 조회 년도 */
	private List<String> yearArr;
	/** 냉동기 개수 */
	private Integer chillerCount;
	/** 냉동기 순번 */
	private Integer chillerIdx;
	
	
	public List<String> getYearArr() {
		return yearArr;
	}
	public void setYearArr(List<String> yearArr) {
		this.yearArr = yearArr;
	}
	public Integer getChillerCount() {
		return chillerCount;
	}
	public void setChillerCount(Integer chillerCount) {
		this.chillerCount = chillerCount;
	}
	public Integer getChillerIdx() {
		return chillerIdx;
	}
	public void setChillerIdx(Integer chillerIdx) {
		this.chillerIdx = chillerIdx;
	}
	public String getAnalCode() {
		return analCode;
	}
	public void setAnalCode(String analCode) {
		this.analCode = analCode;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
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
	public String getChartVal() {
		return chartVal;
	}
	public void setChartVal(String chartVal) {
		this.chartVal = chartVal;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSubType() {
		return subType;
	}
	public void setSubType(String subType) {
		this.subType = subType;
	}
	
}
