<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="nowMenu" uri="/WEB-INF/tld/menu-tld.tld" %>

<c:set value="${requestScope.MENU_MAP}" var="menuMap" />
<c:if test="${empty menuMap}">
<script type="text/javaScript" defer="defer">
	util.forwardLoginPage("<%= ServiceConfig.SERVICE_LOGIN_PAGE %>");
</script>
</c:if>

<!-- s : 모달팝업추가 -->
<script type="text/javascript" src="/resources/uems/js/jquery.model.js"></script>
<!-- e : 모달팝업추가 -->

<!-- s : 모달 배경 -->
<div id="mask"></div><!-- 헤더부분으로 이동해주세요 -->

<div id="loading_mask"></div>
<div class="loading"></div>
<!-- e : 모달 배경 -->


<!-- s: header container -->
<div class="header_container"> 
	<div class="inner_content"> 
		<h1 class="logo"><a href="/uems/main.do">UEMS</a></h1>
		<div class="user_info"><strong>${sessionScope.AUTH.mngName}</strong> 님 &nbsp;&nbsp;<span class="btn btn_type01 btn_size01"><a href="/login/logout.do" class="btn"><i class="fa fa-sign-out fa-fw"></i>로그아웃</a></span></div>
	</div>
	<div class="gnb_wrap">
		<ul>
			<c:forEach var="result" items="${nowMenu:getMenuInfo()}" varStatus="status">
				<li><a href="${result.menuUrl}" class='${result.menuOn}'>${result.menuName}</a></li>
			</c:forEach>
		</ul>
	</div>
</div> 
<!-- e: header container -->

