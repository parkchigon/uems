package com.flk.system.menu.domain;

import java.io.Serializable;
import java.util.ArrayList;

import org.apache.commons.lang.builder.ToStringBuilder;
 
/**
 * 메뉴 도메인
 *
 */
public class Menu implements Serializable {

	private static final long serialVersionUID = 4905202067526929762L;

	/** 메뉴 아이디 */
	private String menuId;

	/** 메뉴 명 */
	private String menuName;

	/** 부모메뉴 아이디 */
	private String parentmenuId;
	
	/** 메뉴댑스 */
	private String menuDepth;

	/** 정렬 번호 */
	private String sortNum;	
	
	/** 등록자 아이디 */
	private String regId;
	
	/** 등록일 */
	private String regDate;
	
	/** 수정자 아이디 */
	private String updateId;
	
	/** 수정일 */
	private String updateDate;
	
	/** 사용 여부 */
	private String useYn;
	
	/** 검색 조건 (검색 시 사용)*/
	private String searchCondition;
	
	/** 메뉴 아이디 ArrayList (삭제 시 사용)*/
	private ArrayList<String> menuIds;
	
	/** 권한 아이디 (검색 시 사용)*/
	private String roleId;
	
	/** 로그인 url */
	private String loginUrl;
	
	/** 메뉴타입 */    
	private String urlType;

	/** 시작 프로그램 URL */ 
	private String startProgramUrl;
	
	public String getStartProgramUrl() {
		return startProgramUrl;
	}
	public void setStartProgramUrl(String startProgramUrl) {
		this.startProgramUrl = startProgramUrl;
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
	public String getMenuId() {
		return this.menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return this.menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getParentmenuId() {
		return this.parentmenuId;
	}
	public void setParentmenuId(String parentmenuId) {
		this.parentmenuId = parentmenuId;
	}
	public String getUrlType() {
		return urlType;
	}
	public void setUrlType(String urlType) {
		this.urlType = urlType;
	}
	public String getSortNum() {
		return this.sortNum;
	}
	public void setSortNum(String sortNum) {
		this.sortNum = sortNum;
	}
	public String getMenuDepth() {
		return this.menuDepth;
	}
	public void setMenuDepth(String menuDepth) {
		this.menuDepth = menuDepth;
	}
	public String getUseYn() {
		return this.useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}    
	public String getLoginUrl() {
		return loginUrl;
	}
	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}
	public ArrayList<String> getMenuIds() {
		return menuIds;
	}
	public void setMenuIds(ArrayList<String> menuIds) {
		this.menuIds = menuIds;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
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
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}

