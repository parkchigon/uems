package com.flk.common.domain;

public class CommonConstants {

	/**
	 * 첨부파일 File Grp 유형 
	 */
	public static final String FILE_GRP_PLP = "plp";
	public static final String FILE_GRP_PDP = "pdp";
 
	//세션 API TRID
	public static final String TRID_API = "TRID_API";
	
	//게시물 페이징 개수 
	public static final int LIST_SIZE_MAX = 1000;
	
	/**
	 * The enum Common code.
	 */
	public enum ApiResultCode {
		RESULT_CODE_0000("0000", "성공"), 
		RESULT_CODE_0001("0001", "성공( 조회시 데이터가 없는경우"),
		
		/**
		 * 토큰 
		 */
		//2000~2009 : 인증 및 토큰 생성
		RESULT_CODE_2000("2000", "인증 및 토큰 생성 시 인증 오류"), 
		//2010~2019 : 토큰 체크
		RESULT_CODE_2010("2010", "토큰 체크 시 사용 불가능한 토큰 "), 
		RESULT_CODE_2011("2011", "토큰 체크 시 만료된 토큰 "), 		
		//2020~2029 : 토큰 갱신	
		RESULT_CODE_2020("2020", "토큰 갱신 시 토큰값 일치 하지 않음 - accessToken"),  		
		RESULT_CODE_2021("2021", "토큰 갱신 시 토큰값 일치 하지 않음 - renewalToken"),  			
		RESULT_CODE_2022("2021", "토큰 갱신 시 실패"), 
 
		//2030~2039 : 토큰 만료 
		RESULT_CODE_2030("2030", "토큰 만료 시 실패"), 
		/**
		 * 연동 
		 */
		RESULT_CODE_3000("3000", "취소 연동시 실패"),
		RESULT_CODE_3001("3001", "취소할 수 없는 상태 혹은 이미 취소된 상태"),
		
		/**
		 * 공통 
		 */
		RESULT_CODE_4002("4002", "바디 필수 파라메터 누락"), 
		RESULT_CODE_4003("4003", "지원되지 않는 http 메소드"),
		RESULT_CODE_4005("4005", "유효하지 않은 파라메터"),
		RESULT_CODE_4006("4006", "존재하지 않는 자원 호출"),		
		RESULT_CODE_4008("4008", "서비스아이디 불일치"), 
		
		RESULT_CODE_4010("4010", "제휴G/W 또는 POI 연동 오류"),
		RESULT_CODE_4012("4012", "제휴G/W 또는 POI  연동 타임아웃 발생"),
		
		RESULT_CODE_4020("4020", "No Data Result"),
		
		RESULT_CODE_4800("4800", "연동 접속 발생"),
		RESULT_CODE_4801("4801", "연동 JSON Parsing 오류"),	
		RESULT_CODE_4802("4802", "연동 타임아웃 발생"),	
		
		RESULT_CODE_4910("4910", "DB접속 오류"), 
		RESULT_CODE_5000("5000", "서버에러(서비스)")
		;
		
		private String code;

		private String msg;

		ApiResultCode(String code, String msg){
			this.code = code;
			this.msg = msg;
		}

		public String getCode() {
			return code;
		}

		public String getMsg() {
			return msg;
		}

		public static ApiResultCode keyOf(String key) {
			
			ApiResultCode[] areas = ApiResultCode.values();
			for(int i = 0; i < areas.length; i++) {
				if(areas[i].code.equals(key)) {
					return areas[i];
				}
			}
			return null;
		}		
	}
	
}
