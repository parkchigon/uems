<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>EMS</title>
    <tiles:insertAttribute name="script" />
    <tiles:insertAttribute name="css" />
</head>
<body onload="printClock();">
	<!-- s : 모달 배경 -->
	<div id="startMask"></div>
	<div id="mask"></div>
	<!-- e : 모달 배경 -->
	
	<div id="loading_mask"></div>
	<div class="loading"><span class="blind">로딩중...</span></div>
	
	<div id="wrap_area">
	
		<%@ include file="inc/ems/head.jsp" %>
		<div id="container" class="build">
			<c:if test="${!empty sessionScope.SITE_INFO.siteId}">
				<input type="hidden" id="siteCd" namme="siteCd" value="${sessionScope.SITE_INFO.siteCd}" />
				<input type="hidden" id="siteId" namme="siteId" value="${sessionScope.SITE_INFO.siteId}" />
			</c:if>
			<%@ include file="inc/ems/lnb.jsp" %>
			<!-- s : content_area -->
			<div id="content_area" class="screen_all">
				<%@ include file="inc/ems/buildTab.jsp" %>
				<tiles:insertAttribute name="content" />
			</div>
			<!-- 구축메뉴 푸터 삭제 -->
			<%-- <%@ include file="inc/ems/footer.jsp" %> --%>
		</div>
	</div>

</body>
</html>

