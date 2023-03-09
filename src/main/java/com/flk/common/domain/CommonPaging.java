package com.flk.common.domain;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.flk.common.utility.PageUtil;

public class CommonPaging implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3133872328924807158L;
	/**
	 * Common Page Field
	 */
	@SuppressWarnings({ "rawtypes", "unused" })
	private List list;
	private String currPage;
	private String listSize;
	private String listType;//list type ex)PLP, RELPD
	private String rnum;
	
	@JsonIgnore 
	private int sTotalcount;
	@JsonIgnore 
	private int sPagelistno;
	private PageUtil pageutil;		
	@JsonIgnore 
	private int firstIndex = 1;
	@JsonIgnore 
	private int lastIndex = 1;

	public int getFirstIndex() {
		return pageutil == null ? this.firstIndex : pageutil.getFirstIndex();
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		this.firstIndex = pageutil == null ? this.firstIndex : pageutil.getLastIndex();
		return firstIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	@SuppressWarnings("rawtypes")
	@JsonIgnore
	public List getList() {
		return pageutil.getList();
	}

	@SuppressWarnings("rawtypes")
	public void setList(List list) {
		pageutil.setList(list);
	}
	
	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getCurrPage() {
		return currPage;
	}

	public void setCurrPage(String currPage) {
		this.currPage = currPage;
	}

	public String getListSize() {
		return listSize;
	}

	public void setListSize(String listSize) {
		this.listSize = listSize;
	}

	public int getsTotalcount() {
		return sTotalcount;
	}

	public void setsTotalcount(int sTotalcount) {
		this.sTotalcount = sTotalcount;
	}

	public int getsPagelistno() {
		return sPagelistno;
	}

	public void setsPagelistno(int sPagelistno) {
		this.sPagelistno = sPagelistno;
	}

	public PageUtil getPageutil() {
		return pageutil;
	}

	public void setPageutil(PageUtil pageutil) {
		this.pageutil = pageutil;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}
	
	
}
