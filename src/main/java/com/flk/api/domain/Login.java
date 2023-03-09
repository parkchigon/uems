package com.flk.api.domain;

import java.io.Serializable;

/**
 * 
 * 관리자 정보 도메인
 *
 */
public class Login implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** 관리자 아이디 */
	private String mngId;
	/** 관리자 명 */
	private String mngName;
	/** 로그인 아이디 */
	private String loginId;
	/** 로그인 암호 */
	private String loginPassword;
	/** 사용여부 */
	private String useYn;
	/** 권한 아이디 */
	private String roleId;
	/** 관리자 핸드폰 */
	private String mngCellNum;
	/** 관리자 이메일 */
	private String mngEmail;
	/** 메모 */
	private String memo;
	/** 앱 url */
	private String mainUrl;
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
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getMngEmail() {
		return mngEmail;
	}
	public void setMngEmail(String mngEmail) {
		this.mngEmail = mngEmail;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getMainUrl() {
		return mainUrl;
	}
	public void setMainUrl(String mainUrl) {
		this.mainUrl = mainUrl;
	}
	
	
}
