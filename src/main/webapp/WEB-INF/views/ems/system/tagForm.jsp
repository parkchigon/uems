<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form id="tagForm" name="tagForm">
	<!-- 태그 매핑 -->
	<c:forEach var="result" items="${tagMapList}" varStatus="status">
	<c:set var="aConvertBase" value="${result.aConvertBase}" />
		<fmt:parseNumber var="min" type="number" value="${aConvertBase}" />
		<c:set var="aConvertFull" value="${result.aConvertFull}" />
		<fmt:parseNumber var="max" type="number" value="${aConvertFull}" />
		<input type="hidden" id="${result.tagId}" name="${result.groupId}" class="${result.templateId}_${result.componentId}" plcno="${result.plcNo}" min="${min}" max="${max}"/>
		<div type="hidden" id="UNIT_${result.tagId}" class="${result.unitCd}"></div>
	</c:forEach>
</form>

