package com.flk.common.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CommonSearch implements Serializable {


	/**
	 * Common Search Field
	 */
	private String sortType;
	private String orderByType;//order by field	
	private String orderBy; //asc or desc 
	
	/**
	 * Search Terms
	 */
	private String searchCondition;//검색조건 검색항목1
	private String searchCondition2;//검색조건 검색항목2

	private String searchKeyword;//검색조건 검색값1
	private String searchKeyword2;//검색조건 검색값2
 
	private String schStDt;//검색조건 시작일
	private String schEdDt;//검색조건 종료일
	private int schRecentMonth;//검색조건 최근 몇개월
	
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public String getOrderByType() {
		return orderByType;
	}
	public void setOrderByType(String orderByType) {
		this.orderByType = orderByType;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
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
	public String getSearchKeyword2() {
		return searchKeyword2;
	}
	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}
	public String getSchStDt() {
		return schStDt;
	}
	public void setSchStDt(String schStDt) {
		this.schStDt = schStDt;
	}
	public String getSchEdDt() {
		return schEdDt;
	}
	public void setSchEdDt(String schEdDt) {
		this.schEdDt = schEdDt;
	}
	public int getSchRecentMonth() {
		return schRecentMonth;
	}
	public void setSchRecentMonth(int schRecentMonth) {
		this.schRecentMonth = schRecentMonth;
	}
 
	
	

}
