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
	$("#content_area").removeClass("screen_all");
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
	var slider2 = $('#image-gallery2').lightSlider({
		gallery:true,
		item:1,
		thumbItem:0,
		slideMargin: 0,
		speed:500,
		auto:false,
		loop:true,
		onSliderLoad: function() {
		    $('#image-gallery2').removeClass('cS-hidden');
		}  
	});
	
	var flowTemplate = '${flowInfo.templateId}';
	if(!isEmpty(flowTemplate)) {
		slider1.goToSlide($( "#image-gallery li" ).index($("#"+flowTemplate)));	
	}
	var gridTemplate = '${gridInfo.templateId}';
	if(!isEmpty(gridTemplate)) {
		slider2.goToSlide($( "#image-gallery2 li" ).index($("#"+gridTemplate)));
	}
	
});

// 템플릿 타입 저장
function templateTypeRegist(submenuId) {
	
	if(confirm("계통도 변경 시 설정된 태그가 삭제 됩니다. 해당 계통도를 선택하시겠습니까?")) {
		var templateId = "";
		$("#frm #submenuId").val(submenuId);
		
		// 빙축열일 경우
		if(submenuId == "SYS01") {
			templateId = $("#image-gallery .active").attr("id");	
		} else {	// 계통도일 경우
			templateId = $("#image-gallery2 .active").attr("id");
		}
		
		$("#frm #templateId").val(templateId);
		$("#frm").attr("action", "/ems/build/templateRegistExe.do");
		$("#frm").submit();
	}
	
}

</script>

<form id="frm" name="frm" method="POST">	
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="submenuId" name="submenuId" />
	<input type="hidden" id="templateId" name="templateId" />
</form>		

<div class="blockDiagram_area">
	<div class="demo">
		<div class="item">            
			<div class="clearfix" style="max-width:1200px;">
				<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
					<c:forEach var="result" items="${flowTypeList}" varStatus="status">
						<li data-thumb="${result.thumbnailFilePath}" id="${result.templateId}">
							<h4>
								${result.templateName}
								<c:if test="${flowInfo.templateId eq result.templateId}">
									<img src="/resources/ems/images/check_icon.png" style="padding: 0 0 5px 5px; width:25px" />
								</c:if>
							</h4>
							<img src="${result.thumbnailFilePath}" />
						</li>
					</c:forEach>
                </ul>
            </div>
        </div>
    </div>
	<div class="btn_areaC mt5">
		<a class="btnType btn_type02" href="javascript:templateTypeRegist('SYS01');">저장</a>
	</div>	
</div>

<!-- s : data_area -->
<div id="data_area">
	<div class="demo2">
        <div class="item">            
            <div class="clearfix" style="max-width:575px;">
                <ul id="image-gallery2" class="gallery list-unstyled cS-hidden">
                    <c:forEach var="result" items="${gridTypeList}" varStatus="status">
						<li data-thumb="${result.thumbnailFilePath}" id="${result.templateId}">
							<h3>
								${result.templateName} (#${result.templateId})
								<c:if test="${gridInfo.templateId eq result.templateId}">
									<img src="/resources/ems/images/check_icon.png" style="padding: 0 0 5px 5px; width:25px" />
								</c:if>
							</h3>
							<img src="${result.thumbnailFilePath}" />
						</li>
					</c:forEach>
                </ul>
            </div>
        </div>
    </div>
	<div class="btn_areaC mt5">
		<a class="btnType btn_type02" href="javascript:templateTypeRegist('SYS02');">저장</a>
	</div>
</div>
<!-- e : data_area -->