<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="nowMenu" uri="/WEB-INF/tld/menu-tld.tld" %>
<script type="text/javaScript">
	$(document).ready(function(){
		var packageName = location.pathname.split("/")[2];
		$("#lnb").find("a").removeClass("on");
		$("#"+packageName).addClass("on");
	});
</script>
<!-- s : lnb -->
<div id="lnb">
	<h3 class="blind">lnb 영역</h3>
	<a class="btn_lnb menu1" id="system" href="/ems/system/emsMain.do"><strong>설비<br />제어</strong></a>
	<a class="btn_lnb menu2" id="trend" href="/ems/trend/tagMonitoring.do"><strong>트랜드</strong></a>
	<a class="btn_lnb menu3" id="alarm" href="/ems/alarm/alarmList.do"><strong>경보</strong></a>
	<a class="btn_lnb menu4" id="setting" href="/ems/setting/settingView.do"><strong>설정</strong></a>
	<!-- 구축자 권한일 경우에만 노출 -->
	<c:if test="${sessionScope.ROLE_ID eq 'ROL_0000000000000001'}">
		<a class="btn_lnb menu5" id="build" href="/ems/build/siteManage.do"><strong>구축</strong></a>
	</c:if>
</div>
<!-- e : lnb -->

