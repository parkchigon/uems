<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<link rel="stylesheet"  href="/resources/ems/css/lightslider.css"/>
<style>
	ul{
		list-style: none outside none;
		padding-left: 0;
		margin: 0;
	}
	.content-slider li{
		background-color: #ed3020;
	    text-align: center;
	    color: #FFF;
	}
	.content-slider h3 {
	    margin: 0;
	    padding: 70px 0;
	}
	.demo{
		width: 1200px;
	}
	.demo2{
		width: 575px;
	}
  </style>
<script src="/resources/ems/js/lightslider.js"></script> 
<script type="text/javaScript">
$(document).ready(function() {
	$("#content-slider").lightSlider({
		loop:true,
		keyPress:true
	});
	var slider1 = $('#image-gallery').lightSlider({
		gallery:true,
		item:1,
		thumbItem:0,
		slideMargin: 0,
		speed:500,
		auto:false,
		loop:true,
		onSliderLoad: function() {
		    $('#image-gallery').removeClass('cS-hidden');
		}  
	});
	
	var flowTemplate = '${templateInfo.templateId}';
	if(!isEmpty(flowTemplate)) {
		slider1.goToSlide($( "#image-gallery li" ).index($("#"+flowTemplate)));	
		$("#"+flowTemplate).find("h3").append("<img src='/resources/ems/images/check_icon.png' style='padding: 0 0 5px 5px; width:30px' />");
	}
	
});

// 템플릿 타입 저장
function templateTypeRegist() {
	
	if(confirm("설정메뉴 변경 시 설정된 태그가 삭제 됩니다. 해당 설정메뉴를 선택하시겠습니까?")) {
		$("#frm #templateId").val($("#image-gallery .active").attr("id"));
		
		$("#frm").attr("action", "/ems/build/settingRegistExe.do");
		$("#frm").submit();
	}
	
}

</script>

<form id="frm" name="frm" method="POST">	
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="submenuId" name="submenuId" value="SYS03" />
	<input type="hidden" id="templateId" name="templateId" />
</form>		

<div class="blockDiagram_area">
	<img src="${flowInfo.thumbnailFilePath}" />
</div>

<!-- s : data_area -->
<div id="data_area">
	<div class="demo2">
        <div class="item">            
            <div class="clearfix" style="max-width:575px;">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                    <c:forEach var="result" items="${settingTypeList}" varStatus="status">
						<li id="${result.templateId}">
							<h3>${result.templateName} (#${result.templateId})</h3>
							<img src="${result.thumbnailFilePath}" />
						</li>
					</c:forEach>
                </ul>
            </div>
        </div>
    </div>
	<div class="btn_areaC mt5">
		<a class="btnType btn_type02" href="javascript:templateTypeRegist();">저장</a>
	</div>
</div>
<!-- e : data_area -->