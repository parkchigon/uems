package com.flk.mng.user.domain;

import java.io.Serializable;

import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;

/**
 * 
 * 관리자 정보 도메인
 *
 */
public class Mng implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** 관리자 아이디 */
	private String mngId;
	/** 관리자 명 */
	private String mngName;
	/** 로그인 아이디 */
	private String loginId;
	/** 로그인 암호 */
	private String loginPassword;
	/** 이메일 */
	private String email;
	/** 사용여부 */
	private String useYn;
	/** 관리자 유형 */
	private String mngType;
	/** 관리자 유형명 */
	private String mngTypeName;
	/** 권한 아이디 */
	private String roleId;
	/** 관리자 핸드폰 */
	private String mngCellNum;
	/** 관리자 일반번호 */
	private String mngPhoneNum;
	/** 관리자 이메일 */
	private String mngEmail;
	/** 관리자 직급 */
	private String mngPosition;
	/** 관리자 부서 */
	private String mngDepartment;
	/** 담당업무 */
	private String contactTask;
	/** 패스워드 실패 카운트 */
	private int passwordFailCnt;
	/** 패스워드 수정일 */
	private String passwordUpdateDate;
	/** 메모 */
	private String memo;
	/** 검색조건 시작일 */
	private String schStDt;
	/** 검색조건 종료일 */
	private String schEdDt;
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
	/** 검색조건 검색항목 */
	private String searchCondition;

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
	
	/** 지점 아이디 */
	private String siteId;
	/** 지점 명 */
	private String siteName;
	/** 지점 코드 */
	private String siteCd;
	/** 그룹 아이디 */
	private String sgId;
	/** 그룹 명 */
	private String sgName;
	/** 그룹 코드 */
	private String sgCd;	
	/** 정렬 순서 */
	private String arrayNo;
	
	/** 앱 url */
	private String mainUrl;
	
	
	public String getMainUrl() {
		return mainUrl;
	}
	public void setMainUrl(String mainUrl) {
		this.mainUrl = mainUrl;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getMngType() {
		return mngType;
	}
	public void setMngType(String mngType) {
		this.mngType = mngType;
	}
	public String getMngTypeName() {
		return mngTypeName;
	}
	public void setMngTypeName(String mngTypeName) {
		this.mngTypeName = mngTypeName;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getMngCellNum() {
		return mngCellNum;
	}
	public void setMngCellNum(String mngCellNum) {
		this.mngCellNum = mngCellNum;
	}
	public String getMngPhoneNum() {
		return mngPhoneNum;
	}
	public void setMngPhoneNum(String mngPhoneNum) {
		this.mngPhoneNum = mngPhoneNum;
	}
	public String getMngEmail() {
		return mngEmail;
	}
	public void setMngEmail(String mngEmail) {
		this.mngEmail = mngEmail;
	}
	public String getMngPosition() {
		return mngPosition;
	}
	public void setMngPosition(String mngPosition) {
		this.mngPosition = mngPosition;
	}
	public String getMngDepartment() {
		return mngDepartment;
	}
	public void setMngDepartment(String mngDepartment) {
		this.mngDepartment = mngDepartment;
	}
	public String getContactTask() {
		return contactTask;
	}
	public void setContactTask(String contactTask) {
		this.contactTask = contactTask;
	}
	public int getPasswordFailCnt() {
		return passwordFailCnt;
	}
	public void setPasswordFailCnt(int passwordFailCnt) {
		this.passwordFailCnt = passwordFailCnt;
	}
	public String getPasswordUpdateDate() {
		return passwordUpdateDate;
	}
	public void setPasswordUpdateDate(String passwordUpdateDate) {
		this.passwordUpdateDate = passwordUpdateDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
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
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
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
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
	}
	public String getSgName() {
		return sgName;
	}
	public void setSgName(String sgName) {
		this.sgName = sgName;
	}
	public String getSgCd() {
		return sgCd;
	}
	public void setSgCd(String sgCd) {
		this.sgCd = sgCd;
	}
	public String getArrayNo() {
		return arrayNo;
	}
	public void setArrayNo(String arrayNo) {
		this.arrayNo = arrayNo;
	}
}
