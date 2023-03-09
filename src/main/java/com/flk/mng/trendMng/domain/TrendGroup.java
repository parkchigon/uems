package com.flk.mng.trendMng.domain;

import java.util.List;

public class TrendGroup {
	
	/** 트랜드 그룹 아이디 */
	private String tgId;
	/** 트랜드 그룹 명 */
	private String tgName;
	/** 태그 타입 */
	private String tagKindCd;
	
	/** 지점 그룹 아이디 */
	private String sgId;
	/** 지점 그룹 코드 */
	private String sgCd;
	/** 지점 그룹 명 */
	private String sgName;
	
	/** 지점 아이디*/
	private String siteId;
	/** 지점 코드 */
	private String siteCd;
	/** 지점 명*/
	private String siteName;
	/** 검색조건 검색항목 */
	private String searchCondition;
	/** 검색조건 검색항목 */
	private String searchCondition2;
	/** 검색조건 검색항목 */
	private String searchCondition3;
	
	List<String> trendGroupList;
	List<String> trendTagList;
	
	/** 등록 아이디 */
	private String regId;
	/** 수정 아이디 */
	private String updateId;
	/** 태그 아이디 */
	private String tagId;
	/** 태그 설명 */
	private String tagDesc;
	
	public String getTgId() {
		return tgId;
	}
	public void setTgId(String tgId) {
		this.tgId = tgId;
	}
	public String getTgName() {
		return tgName;
	}
	public void setTgName(String tgName) {
		this.tgName = tgName;
	}
	public String getTagKindCd() {
		return tagKindCd;
	}
	public void setTagKindCd(String tagKindCd) {
		this.tagKindCd = tagKindCd;
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
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
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
	public String getSearchCondition3() {
		return searchCondition3;
	}
	public void setSearchCondition3(String searchCondition3) {
		this.searchCondition3 = searchCondition3;
	}
	public List<String> getTrendGroupList() {
		return trendGroupList;
	}
	public void setTrendGroupList(List<String> trendGroupList) {
		this.trendGroupList = trendGroupList;
	}
	public List<String> getTrendTagList() {
		return trendTagList;
	}
	public void setTrendTagList(List<String> trendTagList) {
		this.trendTagList = trendTagList;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getTagDesc() {
		return tagDesc;
	}
	public void setTagDesc(String tagDesc) {
		this.tagDesc = tagDesc;
	}
	
}
