<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <title>ENERZENT APP</title>
    <tiles:insertAttribute name="script" />
    <tiles:insertAttribute name="css" />
</head>
<body>
	<!-- s : 모달 배경 -->
	<div id="mask"></div>
	<!-- e : 모달 배경 -->
	
	<div id="wrap_area">
		<%@ include file="inc/mobile/head.jsp" %>
		<%@ include file="inc/mobile/lnb.jsp" %>
		<div id="container">
			<tiles:insertAttribute name="content" />
		</div>
		
		<!-- s : popup container -->
		<%@ include file="/WEB-INF/views/mobile/layerPopup.jsp" %>
		<!-- e: popup container -->
	</div>
	
	
</body>
</html>

