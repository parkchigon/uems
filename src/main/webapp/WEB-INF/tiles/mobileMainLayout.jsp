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
    
    <script type="text/javaScript">
	    $(document).ready(function(){
	    	var sgId = "${sessionScope.SITE_INFO.sgId}";
	    	if(sgId == '1'){
	    		$("#emart").addClass("on");
	    		$("#ssg").removeClass("on");
	    	}else{
	    		$("#ssg").addClass("on");
	    		$("#emart").removeClass("on");
	    	}
		});
    	function goTap(sgId){
    		//location.href = "/mobileWeb/uappMain?sgId="+sgId;
    		$("#sgId").val(sgId);
    		$("#mobileLayoutFrm").attr("action","/mobileWeb/uappMain");
    		$("#mobileLayoutFrm").submit();
    	}
    </script>
</head>
<body>
	<!-- s : 모달 배경 -->
	<div id="mask"></div>
	<!-- e : 모달 배경 -->
	
	<div id="wrap_area">
		
		<div id="header_tab">
			<a class="tab_menu on" id="emart" href="javascript:goTap('1');"><img src="/resources/mobile/images/logo_emart.png" alt="이마트" /></a>
			<a class="tab_menu" id="ssg" href="javascript:goTap('2');"><img src="/resources/mobile/images/logo_ssg.png" alt="신세계" /></a>
			<form id="mobileLayoutFrm" action="">
				<input type="hidden" id="sgId" name="sgId"/>
				<input type="hidden" id="mngId" name="mngId" value="${sessionScope.MNG_ID}"/>
				
			</form>
		</div>
			
		
		<div id="container">
			<tiles:insertAttribute name="content" />
		</div>
		
	</div>
	
</body>
</html>

