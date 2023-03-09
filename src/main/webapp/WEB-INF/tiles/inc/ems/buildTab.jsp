<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="nowMenu" uri="/WEB-INF/tld/menu-tld.tld" %>
<script type="text/javaScript">
	$(document).ready(function(){
		var tabId = location.pathname.split("/")[3];
		tabId = tabId.substring(0, tabId.length-3);;
		$("#buildTab").find("li").removeClass("on");
		$("#"+tabId).addClass("on");
	});
</script>
<!-- s : build_header -->
<div class="build_header_area">
	<ul id="buildTab">
		<li id="siteManage"><a href="/ems/build/siteManage.do">지점 관리</a></li>
		<li id="tagManage"><a href="/ems/build/tagManage.do">태그 관리</a></li>
		<li id="diagramSelect"><a href="/ems/build/diagramSelect.do">계통도 선택</a></li>
		<li id="diagramSetL"><a href="/ems/build/diagramSetL.do">계통도 설정(좌)</a></li>
		<li id="diagramSetR"><a href="/ems/build/diagramSetR.do">계통도 설정(우)</a></li>
		<li id="settingSelect"><a href="/ems/build/settingSelect.do">설정메뉴 선택</a></li>
		<li id="settingSet"><a href="/ems/build/settingSet.do">설정메뉴 설정</a></li>
		<li id="etcSelect"><a href="/ems/build/etcSelect.do">기타설비 선택</a></li>
		<li id="etcSet"><a href="/ems/build/etcSet.do">기타설비 설정</a></li>
	</ul>
</div>
<!-- e : build_header -->
