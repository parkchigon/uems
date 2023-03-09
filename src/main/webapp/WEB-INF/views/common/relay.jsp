<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.flk.common.utility.*"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="hiddenTag" uri="/WEB-INF/tld/hidden-tld.tld" %>

<%	
	String _forward_page 	= request.getParameter( "_forward_page" );		// 이동할 페이지.
	String mode 			= request.getParameter( "mode" );				// 현재화면 처리구분. 디폴트는 _forward_page로 이동.
	String openermode 		= request.getParameter( "openermode" );			// 팝업에서 사용하는 경우 부모창에 대한 제어처리구분.
	String resultMsg 		= (String)request.getAttribute( "resultMsg" );	// 메세지.
	
%>
<form name="frm" action="<%=request.getParameter("_forward_page")%>" method="post">
	${hiddenTag:getTagInfo()}
</form>
<script type="text/javaScript" language="javascript">

<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
<c:if test="${!empty resultFreeMsg}">alert("${resultFreeMsg}");</c:if>

window.onload = function()
{
	<%
	// 팝업인 경우 실행할 스크립트
	if ("reload".equals( openermode ) )
		out.println("opener.location.reload();");

	// 작업완료후 실행할 스크립트
	if ( "close".equals( mode ) )
		out.println("self.close();");
	else
		out.println("document.frm.submit();");
	%>
};
</script>

	


