<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ taglib prefix="nowMenu" uri="/WEB-INF/tld/menu-tld.tld" %>
<c:set value="${requestScope.MENU_MAP}" var="menuMap" />
<c:set value="${requestScope.MENU_ID}" var="menuId" />
<!-- s: location -->
<div class="location_wrap">
	Home &gt; ${nowMenu:getMenuNavi(menuMap, menuId)}
</div>
<!-- e: location -->
