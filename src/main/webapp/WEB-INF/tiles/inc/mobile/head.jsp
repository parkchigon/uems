<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>

<script type="text/javascript">
	function goSiteMain(){
		$("#headFrm").submit();
	}
</script>

<form id="headFrm" method="POST" action="/mobileWeb/uappMainForSite">
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="siteName" name="siteName" value="${sessionScope.SITE_INFO.siteName}" />
	<input type="hidden" id="sgId" name="sgId" value="${sessionScope.SITE_INFO.sgId}" />
	<input type="hidden" id="sgName" name="sgName" value="${sessionScope.SITE_INFO.sgName}" />
</form>
<div id="header">
	<a class="btn_menu" href="#"><span class="blind">menu</span></a>
	<h1>
		<c:if test="${sessionScope.SITE_INFO.sgId eq '1' }">
			<img src="/resources/mobile/images/logo_emart.png" alt="이마트" />
		</c:if>
		<c:if test="${sessionScope.SITE_INFO.sgId eq '2' }">
			<img src="/resources/mobile/images/logo_ssg.png" alt="백화점" /> 
		</c:if>
		<strong><a href="javascript:goSiteMain();" >${sessionScope.SITE_INFO.siteName}</a></strong>
	</h1>
	<div class="header_right">
		<span class="toDay">${sessionScope.checkYear}년 ${sessionScope.checkMonth}월</span>
	</div>
</div>
