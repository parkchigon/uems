package com.flk.common.service;

import java.util.HashMap;

import com.flk.common.utility.XMLUtil;

public class ServiceConfig {
    /**
     * serviceInit.xml 파일 설정값
     */
    public static XMLUtil xu;

    /**
     * 조건에 맞는 노드 값을 serviceInit.xml에서 찾아서 문자열로 반환
     * @param node
     * @return
     * @throws Exception
     */
    public static String getUserConfig(String node) throws Exception {
        return xu.getNodeValue(node);
    }

    /**
     * 브라우저 타이틀
     */
    public static String SERVICE_TITLE = "";

    /**
     * 로그인 페이지
     */
    public static String SERVICE_LOGIN_PAGE = "";

    /**
     * 사용자 MAIN 페이지
     */
    public static String SERVICE_MAIN_PAGE = "";

    /**
     * 기본날짜 포멧
     */
    public static String FORMAT_DATE = "";

    /**
     * 기본날짜시간 포멧
     */
    public static String FORMAT_DATETIME = "";
    
    /**
     * 페이징 블럭사이즈
     */
    public static int BLOCK_SIZE = 0;

    /**
     * 페이징 리스트사이즈
     */
    public static int LIST_SIZE = 0;
    
	/**
	 * 세션키 아이디
	 */
	public static String SESSION_KEY_USER_ID = "";

	/**
	 * 세션키 이름
	 */
	public static String SESSION_KEY_USER_NAME = "";    

    /**
     * 페이징 HTML 템플릿소스
     */
    public static HashMap<String,Object> PAGING_MAP = new HashMap<String,Object>();

    /**
     * 페이징 JAVASCRIPT
     */
    public static String PAGING_SCRIPT = "";
    
    /**
     * 지점별 메뉴정보
     */
    @SuppressWarnings("rawtypes")
    public static HashMap MENU_MAP;
    
    /**
     * 로그인 변수명
     */
    public static final String LOGIN_URL = "LOGIN_URL";

    /**
     * 로그인 변수명
     */
    public static final String REQ_LOGIN_TYPE = "reqTp";

    /**
     * 로그인 후 돌아갈 리턴 변수명
     */
    public static final String RETURN_URL = "RETURN_URL";   
    
    /***
     * 메뉴 리스트
     */
    public static final String MENU_LIST_MAP = "MENU_LIST_MAP";
}
