package com.flk.common.domain;

public final class CeWebConstants extends Constants {

	/**
	 * TN_MENU TOP MENU ID
	 */
	public static final String TOP_MENU_ID = "TOPMENU0000000000000";
	
	/**
	 * TN_CD TOP CODE ID
	 */
	public static final String TOP_CODE_ID = "TOPCD000000000000000";

	/**
	 * TN_CD TOP CODE ID
	 */
	public static final String TOP_CATE_ID = "TOPCATE0000000000000";

	/**
	 * 로그인
	 */
	public static final int ERROR_CODE_LOGIN = 0;// 로그인 성공
	/**
	 * The constant ERROR_CODE_LOGIN_ID.
	 */
	public static final int ERROR_CODE_LOGIN_ID = 1;// ID만 존재할 경우
	/**
	 * The constant ERROR_CODE_LOGIN_ID_PWD.
	 */
	public static final int ERROR_CODE_LOGIN_ID_PWD = 2;// ID/PWD가 존재하지 않을 경우
	/**
	 * The constant ERROR_CODE_LOGIN_PWD_WORNG.
	 */
	public static final int ERROR_CODE_LOGIN_PWD_WORNG = 3;// ID만 존재하지만 패스워드가 5번

	/**
	 * The constant ERROR_CODE_LOGIN_PWD_ERROR.
	 */
	public static final int ERROR_CODE_LOGIN_PWD_ERROR = 4;// ID만 존재 하지만 패스워드 틀림
	
	/**
	 * The constant ERROR_CODE_LOGIN_SITE_ERROR.
	 */
	public static final int ERROR_CODE_LOGIN_SITE_ERROR = 5;// 사용자(현장)권한 : 유저-지점 매핑 없을 경우
 
}
