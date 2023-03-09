package com.flk.common.domain;

import java.io.File;

public class Constants {

    public static final int BYTE_DIVISION = 1024;

    public static final String PREVIEW_PATH = File.separator + "files" + File.separator + "preview" + File.separator;

    public static final String PATH = File.separator + "files" + File.separator;

    public static final String XML_HTTP_REQUEST_HEADER = "x-requested-with";
	public static final String XML_HTTP_REQUEST_VALUE = "XMLHttpRequest";
	
	public final static String _E_400 = "400";
	public final static String _E_500 = "500";
	public final static String _E_501 = "501";

	public final static String _V_400 = "/common/error/400";
	public final static String _V_500 = "/common/error/500";
	public final static String COMMON_ERROR = "/common/error/commonError";
	
	public final static String YES = "Y";
	public final static String NO = "N";
	
	public final static String EMART = "1";
	public final static String SGG = "2";
	public final static String EMART_STR = "이마트";
	public final static String SGG_STR = "신세계";
	
	public final static String WEB_LOGIN_URL = "/login/loginView.do";
	
	public final static String RESULT_CODE = "resultCode";
	public final static String RESULT_MSG = "resultMsg";
	public final static String RESULT_FREE_MSG = "resultFreeMsg";
	public final static String RESULT_DATA = "resultData";
	
	public final static String ROL_9999999999999999 = "ROL_9999999999999999";	// 최고관리자 권한
	public final static String ROL_0000000000000001 = "ROL_0000000000000001";	// 구축자 권한
	public final static String ROL_0000000000000002 = "ROL_0000000000000002";	// 사용자(현장) 권한
	public final static String ROL_0000000000000003 = "ROL_0000000000000003";	// 운영자(통합) 권한
	
	public final static String SUCCESS = "0000";
	public final static String SUCCESS_MSG = "SUCCESS";
	public final static String ERROR = "9999";
	public final static String ERROR_MSG = "ERROR";	
	public final static String NOT_UPDATE = "8888";
	public final static String NOT_UPDATE_MSG = "NOT UPDATE";	
	public final static String SYSTEM = "system";
	
	public final static String MIN = "min";
	public final static String ONE_MIN = "1min";
	public final static String FIVE_MIN = "5min";
	public final static String FIFTEEN_MIN = "15min";
	public final static String HOUR = "hourly";
	public final static String DAY = "daily";
	public final static String MONTH = "monthly";
	public final static String REALTIME = "realTime";

	public final static String FIX02 = "FIX02";		// 통신정보 변경
	public final static String FIX03 = "FIX03";		// 태그정보 변경
	
	public final static String MOBILE_MAIN_URL = "/mobileWeb/uappMain";		// 웹뷰메인 호출URL
	public final static String DEFAULT_404_IMAGE = ".."+File.separator+".."+File.separator+"resources"+File.separator+"uems"+File.separator+"images"+File.separator+"404.jpg";
	
	//모니터링 엑셀템플릿
	public final static String TAG = "tag"; 
	public final static String TREND = "trend";
	public final static String COMPARE = "compare";
	public final static String INDICATOR = "indicator";
	public final static String TAG_TMP = "tagTmp.xlsx";
	public final static String TREND_TMP = "trendTmp.xlsx";
	public final static String COMPARE_TMP = "compareTmp.xlsx";
	public final static String INDICATOR_TMP = "indicatorTmp.xlsx";
	
	public final static String COMPARE_VALUE = " 대비 차이(값)";
	public final static String COMPARE_RATE = " 대비 차이(%)";
	
	// 정기점검항목관리
	public final static String ETC_VALUE = "기타";
	public final static String ETC = "E";
	public final static String NO1 = "1";
	
	public static final class SubMenu {
		// EMS 서브메뉴 아이디
		// (빙축열, [설정], 보일러, 열량, 흡수식냉동기, 냉동기, 상온냉동기 등)
		public final static String SYS01 = "SYS01";		// 빙축열(계통도)
		public final static String SYS02 = "SYS02";		// 빙축열(그리드)
		public final static String SYS03 = "SYS03";		// 설정
		public final static String SYS04 = "SYS04";		// 냉동기A
		public final static String SYS05 = "SYS05";		// 보일러
		public final static String SYS06 = "SYS06";		// 열량
		public final static String SYS07 = "SYS07";		// 흡수식냉동기
		public final static String SYS08 = "SYS08";		// 냉동기B
		public final static String SYS09 = "SYS09";		// 상온냉동기
		public final static String SYS10 = "SYS10";		// 흡수식냉동기B
		public final static String SYS11 = "SYS11";		// 흡수식냉동기C
		public final static String SYS12 = "SYS12";		// 냉동기C
	}
	
	public static final class EmsMenu {
		// EMS 서브메뉴 아이디
		// (설비제어, 트랜드, 경보, 설정, 구축)
		public final static String SYSTEM = "system";
		public final static String TREND = "trend";
		public final static String ALARM = "alarm";
		public final static String SETTING= "setting";
		public final static String BUILD= "build";
	}
	
	public static final class TocSystem {
		// 미니계통도 관리 Template 관리
		public final static String TEMPLATE_A = "0001";
		public final static String TEMPLATE_B = "0002";
		public final static String TEMPLATE_C = "0003";
		public final static String TEMPLATE_D = "0004";
		public final static String TEMPLATE_E = "0005";
		public final static String TEMPLATE_F = "0006";
		public final static String TEMPLATE_G = "0007";
		public final static String TEMPLATE_H = "0008";
		public final static String TEMPLATE_I = "0009";
	}

	public static final class CODE {
		// 알람 상태 : 알람리셋
		public final static String ALARM_STATUS04 = "ALARM_STATUS04";
	}
	
	// 엑셀시트
	public static final class EXCEL_SHEET {
		public final static String TAG_AI = "TAG_AI";
		public final static String TAG_AO = "TAG_AO";
		public final static String TAG_DI = "TAG_DI";
		public final static String TAG_DO = "TAG_DO";
	}
	
    public int getBYTE_DIVISION() {
        return BYTE_DIVISION;
    }

    public String getPREVIEW_PATH() {
        return PREVIEW_PATH;
    }

    public String getPATH() {
        return PATH;
    }

}
