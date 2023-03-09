package com.flk.mng.site.domain;

import com.flk.common.utility.PageUtil;

public class SiteGroup {
	
	/** 지점 그룹 아이디 */
	private String sgId;
	/** 지점 그룹 코드 */
	private String sgCd;
	/** 지점 그룹 명 */
	private String sgName;
	/** 설명 */
	private String sgDesc;
	/** 사용 여부 */
	private String useFlag;
	/** 등록 아이디 */
	private String regId;
	/** 등록 일시 */
	private String regDate;
	/** 수정 아이디 */
	private String updateId;
	/** 수정 일시 */
	private String updateDate;
	
	/** 검색조건 검색값 */
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
	
	private String useListYn;
	
	public SiteGroup() { }
	
	public SiteGroup(int lastIndex, String useListYn) {
		this.lastIndex = lastIndex;
		this.useListYn = useListYn;
	}
	
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
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
	public String getSgDesc() {
		return sgDesc;
	}
	public void setSgDesc(String sgDesc) {
		this.sgDesc = sgDesc;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
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
	public String getUseListYn() {
		return useListYn;
	}
	public void setUseListYn(String useListYn) {
		this.useListYn = useListYn;
	}
	
}
