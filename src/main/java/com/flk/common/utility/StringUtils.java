package com.flk.common.utility;

public class StringUtils extends org.apache.commons.lang.StringUtils{

	/**
     * 공백이거나 널인 경우 true 반환
     * 
     * @param object
     * @return null인경우 true 아닌 경우는 isBlank 함수 호출
     */
    public static boolean isEmpty(Object o) {
        if (o == null){
            return true;
        }
        return isBlank(o.toString());
    }
    
    /**
     * XSS 관련 문자를 아스키코드값으로 변환
     * 
     * @param s
     *            변환할 문자열
     * @return 변환한 문자열
     */
    public static String convertCharToAscii(String s) {
        if (isNotBlank(s)) {
        	s = s.replaceAll("<", "&lt;");
            s = s.replaceAll(">", "&gt;");
        	s = s.replaceAll("&", "&amp;");
        	s = s.replaceAll("%", "&#37;");
            s = s.replaceAll("%00", "null");
            s = s.replaceAll("\'", "&#39;");
            s = s.replaceAll("\"", "&#34;");
            s = s.replaceAll("!", "&#33;");
            s = s.replaceAll("--", "&#45;");
        }
        return s;
    }
    
    /**
     * script 제거
     * @param str
     * @return
     */
    public static String cleanScript(String str) {
        str = str.replaceAll("<script", "< script");
        str = str.replaceAll("</script", "< / script");
        str = str.replaceAll("<SCRIPT", "< SCRIPT");
        str = str.replaceAll("</SCRIPT", "< / SCRIPT");
        return str;
    }
    
    
    /**
     * 대상 String이 null일 경우 ""을, null이 아닐 경우 대상 String을 trim한 후 return
     * 
     * @param str
     *            trim한 대상 스트링
     */
    public static String trim(String str) {
        String sTmp = str;

        if (str == null) {
            sTmp = "";
        } else if (!"".equals(str) && str.length() > 0) {
            sTmp = str.trim();
        }

        return sTmp;
    }
}
