<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.flk.common.service.ServiceConfig" %>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <title>UEMS</title>
    <tiles:insertAttribute name="script" />
	<tiles:insertAttribute name="css" />
	
</head>
<body onload="printClock();">
	<spring:eval expression="@config" var="config" scope="request"/>
	<spring:eval expression="@code" var="code" scope="request"/>
	<spring:eval expression="@comm" var="comm" scope="request"/>
	<!-- s: body container -->
	<div id="wrap_area">
		<tiles:insertAttribute name="content" />
	</div>
	<!-- e: body container -->
</body>
</html>

