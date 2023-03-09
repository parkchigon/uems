<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script type="text/javaScript">
	$(document).ready(function(){
		
		$("#emart").addClass("on");
		$("#ssg").removeClass("on");
	});
	
	/* 지점별 메인화면 이동 */
	function goUappMainForSite(siteId,siteName){
		$("#siteId").val(siteId);
		$("#siteName").val(siteName);
		frm.action = "<c:url value='/mobileWeb/uappMainForSite'/>";
		frm.submit();
	}
	
</script>

<div id="wrap_area">
<form id="frm" name="frm" method="post">
	<input type="hidden" id="siteId" name="siteId" />
	<input type="hidden" id="siteName" name="siteName" value="" />
	<input type="hidden" id="sgId" name="sgId" value="${sessionScope.SITE_INFO.sgId}" />
	<input type="hidden" id="sgName" name="sgName" value="${sessionScope.SITE_INFO.sgName}" />
		
	<div class="icon_aera">
		<ul>
			<c:forEach var="result" items="${siteList}" varStatus="status">
				<li><a class="btn_icon icon_emart" href="javascript:goUappMainForSite('${result.siteId}','${result.siteName}')">${result.siteName}</a></li>
			</c:forEach>
		</ul>
	</div>
	
</form>	
</div>
</body>
</html>