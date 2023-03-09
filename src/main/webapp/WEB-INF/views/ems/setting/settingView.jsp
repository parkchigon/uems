<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		
		// 스위치 선택 시 control 연동인 경우
		$('.switch').click(function(){
			if($(this).hasClass('disabled') == false) {
				var value = "";
				if($(this).hasClass('on')) {
					$(this).find('.stop').show();
					$(this).find('.start').hide();
					$(this).removeClass('on').addClass('off');
					$(this).prev('.lamp').removeClass('on').addClass('off');
					value = "0";
				} else if($(this).hasClass('off')){
					$(this).find('.start').show();
					$(this).find('.stop').hide();
					$(this).removeClass('off').addClass('on');
					$(this).prev('.lamp').removeClass('off').addClass('on');
					value = "1";
				}
				
				// 설정>방냉펌프제어설정 > 사용/미사용
				if ($(this).attr("id").indexOf("_use") > 0) {	
					var json = new Object();
					var array = new Array();
					json.tagId = $("#tagForm input[class="+$(this).attr("id")+"]").attr("id");
					json.value = value;
					array.push(json);
					
					var request = new Object();
					request.siteCd = $("#siteCd").val();
					request.tagList = array;
					updateTagValue(request);
				}
			};
		
		});
		
		// 실시간 태그 값 조회
		selectTagValue();
		

	});
	
	

</script>

<!-- s : content_area -->
<div id="content_area">
	<div class="subTitle_area">설정관리</div>
	
	<!-- 템플릿 타입별로 계통도/그리드 노출 -->
	<c:forEach var="result" items="${subMenulist}" varStatus="status">
		<!-- s : flow_area -->
		<c:if test="${result.submenuId eq 'SYS01'}">
			<jsp:include page="${result.templateFilePath1}" />
		</c:if>	
		<!-- e : flow_area -->
		<!-- s : data_area -->
		<c:if test="${result.submenuId eq 'SYS03'}">
			<jsp:include page="${result.templateFilePath1}" />
		</c:if>	
		<!-- e : data_area -->
	</c:forEach>
</div>
<!-- e : content_area -->

<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->

