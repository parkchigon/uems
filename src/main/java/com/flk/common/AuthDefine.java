package com.flk.common;

public class AuthDefine {

	/**
	 * 토큰 생성 및 갱신시 세션에 저장 
	 */
	public static String AUTH_SESSION_VO = "AUTH";

	/**
	 * 개인정보 암호화 키
	 */
	public static String SECRET_KEY = "flkNowFrame";

	/***
	 * 토큰 유지 시간 8시간
	 */
	public static int TOKEN_USE_TIME = 12;

	public static int AUTH_CHECK_INTERVAL_MIN = 240;//240분 

	public static enum AUTH_STE_TYPE {

		//I("I"), U("U"), D("D");        
		AuthCreate("Create"), AuthCheck("Check"), AuthRenewal("Renewal"), AuthExpire("Exprire");

		final private String steCd;

		AUTH_STE_TYPE(String steCd) {
			this.steCd = steCd;
		}

		public String value() {
			return steCd;
		}

	};

}
