<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.flk.common.utility.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="hiddenTag" uri="/WEB-INF/tld/hidden-tld.tld" %>
<%
/**
 * @Class Name 		: Relay.jsp
 * @Description 	: 서버작업 후 페이지 새로고침시 재처리를 막기위한 페이지.
 * @Modification Information
 **/
%>
<%

	
	String _forward_page 	= request.getParameter( "_forward_page" );		// 이동할 페이지.
	String mode 			= request.getParameter( "mode" );				// 현재화면 처리구분. 디폴트는 _forward_page로 이동.
	String openermode 		= request.getParameter( "openermode" );			// 팝업에서 사용하는 경우 부모창에 대한 제어처리구분.
	String resultMsg 		= (String)request.getAttribute( "resultMsg" );	// 메세지.
	
%>
<form name="frm" action="<%=request.getParameter("_forward_page")%>" method="post">
	${hiddenTag:getTagInfo()}
</form>
<script type="text/javaScript" language="javascript" defer="defer">
</script>