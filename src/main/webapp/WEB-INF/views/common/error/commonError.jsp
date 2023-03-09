<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>UEMS</title>
		<link type="text/css" rel="stylesheet" href="/resources/uems/css/default.css"  /> 
		<link rel="shortcut icon" href="/resources/uems/images/favicon.ico">
	</head>
	<body>
	
		<!-- s: header container -->
		<div class="header_container"> 
			<div class="inner_content"> 
				<h1 class="logo"><a href="/uems/main.do">UEMS</a></h1>
			</div>
		</div> 
		<!-- e: header container -->
			
		<!-- s: body container -->
		<div class="body_container main_container">
			<div class="inner_content on">
	 			<div class="main_content">
	 			<!-- s:  error-->
					<div class="error_page_wrap">
						<p><a href="javascript:history.go(-1);"><img src="/resources/uems/images/txt_error01.gif"  alt="페이지를 찾을  수 없습니다." /></a></p>
						<!-- <p class="txt">
							방문하시려는 페이지의 주소가 잘못 입력되었거나,<br />
							페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br />
							입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
						</p> -->
					</div>
					<!-- e:  error-->
				</div>	
			</div>
		</div> 
		<!-- e: body container --> 

		<!-- s: footer container -->
		<div class="footer_container">
			<div class="footer_inner">
				<span>Copyright (C) ENERZENT CO., LTD, All Rights Reserved.</span>
			</div>
		</div>
		<!-- e: footer container -->

	</body>
</html>