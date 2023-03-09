package com.flk.mng.equipment.domain;

import com.flk.common.utility.PageUtil;

public class Equipment {
	
	/** 장비관리 공통 */
	private String sRnum;
	/**사용여부 */
	private String useFlag;
	private String updateId;
	private String updateDate;
	private String regId;
	private String regDate;
	private String siteId;
	private String sgId;
	private String flag;
	private String siteDesc;
	private String address;
	private String form;
	private String phone;
	private String testRunDate;
	private String salesInfo;
	private String asInfo;
	private String powerSupply;
	
	/** 검색조건 검색항목1 */
	private String searchCondition;
	/** 검색조건 검색항목2 */
	private String searchCondition2;
	/** 검색조건 검색키워드 */
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
	
	public String getSalesInfo() {
		return salesInfo;
	}
	public void setSalesInfo(String salesInfo) {
		this.salesInfo = salesInfo;
	}
	public String getAsInfo() {
		return asInfo;
	}
	public void setAsInfo(String asInfo) {
		this.asInfo = asInfo;
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
	public String getsRnum() {
		return sRnum;
	}
	public void setsRnum(String sRnum) {
		this.sRnum = sRnum;
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
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getSiteDesc() {
		return siteDesc;
	}
	public void setSiteDesc(String siteDesc) {
		this.siteDesc = siteDesc;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTestRunDate() {
		return testRunDate;
	}
	public void setTestRunDate(String testRunDate) {
		this.testRunDate = testRunDate;
	}
	public String getPowerSupply() {
		return powerSupply;
	}
	public void setPowerSupply(String powerSupply) {
		this.powerSupply = powerSupply;
	}
	

}