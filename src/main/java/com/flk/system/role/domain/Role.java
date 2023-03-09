package com.flk.system.role.domain;

import java.io.Serializable;
import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;

/**
 * 권한 도메인
 * 
 */
public class Role implements Serializable{

	private static final long serialVersionUID = 1L;

	/** 권한 아이디 */
	private String roleId;

	/** 메뉴 아이디 */
	private String menuId;

	/** 권한 이름 */
	private String roleName;
	
	/** 내용 */
	private String content;
	
	/** 부모 메뉴 아이디 */
	private String parentmenuId;
	
	/** 사용여부 */
	private String useYn;
	
	/** 정렬 순서 */
	private String sortNum;
	
	/** 프로그램 아이디 */
	private String programId;
	
	/** 메뉴 아이디 ArrayList */
	private ArrayList<String> menuIds;
	
	/** 등록 아이디 */
	private String regId;
	
	/** 등록 이름 */
	private String regName;
	
	/** 수정 아이디 */
	private String updateId;
	
	/** 수정 이름 */
	private String updateName;
	
	/** 등록일 */
	private String regDate;
	
	/** 수정일 */
	private String updateDate;
	
	/** 최고관리자 여부 */
	private String masterYn;
	
	/** 페이지 사이즈*/
	@JsonIgnore
	private String listSize;
	
	/** 첫 페이지 */
	@JsonIgnore
	private int firstIndex;
	
	/** 마지막 페이지 */
	@JsonIgnore
	private int lastIndex;
	
	/** 페이지 유틸 */
	@JsonIgnore
	private PageUtil Pageutil;
	
	/** 현재 페이지*/
	@JsonIgnore
	private String currPage;
	
	public Role() {
		
	}
	
	public Role(String roleId) {
		this.roleId = roleId;
	}
	
	public Role(String roleId, String menuId) {
		this.roleId = roleId;
		this.menuId = menuId;
	}
	
	public Role(String roleId, String menuId, String programId) {
		this.roleId = roleId;
		this.menuId = menuId;
		this.programId = programId;
	}
	
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getParentmenuId() {
		return parentmenuId;
	}

	public void setParentmenuId(String parentmenuId) {
		this.parentmenuId = parentmenuId;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getSortNum() {
		return sortNum;
	}

	public void setSortNum(String sortNum) {
		this.sortNum = sortNum;
	}

	public String getProgramId() {
		return programId;
	}

	public void setProgramId(String programId) {
		this.programId = programId;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegName() {
		return regName;
	}

	public void setRegName(String regName) {
		this.regName = regName;
	}

	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	public String getUpdateName() {
		return updateName;
	}

	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getMasterYn() {
		return masterYn;
	}

	public void setMasterYn(String masterYn) {
		this.masterYn = masterYn;
	}

	@JsonIgnore
	public ArrayList<String> getMenuIds() {
		return menuIds;
	}
	
	public void setMenuIds(ArrayList<String> menuIds) {
		this.menuIds = menuIds;
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
		return StringUtils.defaultString(currPage, "1");
	}
	public void setCurrPage(String currPage) {
		this.currPage = currPage;
	}
}
