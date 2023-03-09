<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	
	$(document).ready(function(){
		// 스위치 선택 시 control 연동인 경우
		$('.switch').click(function(){
			if($(this).hasClass('disabled') == false) {
				var value = "";
				if($(this).hasClass('on')) {
					
					/* 고속터미널 START */
					if ($(this).attr("id") == 'T02009_system_drive') {
						if(!confirm("시스템운전을 종료하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_storagetank_drive') {
						if(!confirm("축냉운전모드를 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_icestorage_drive') {
						if(!confirm("방냉운전모드를 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_parall_drive') {
						if(!confirm("동시운전모드를 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_single_drive') {
						if(!confirm("냉단운전모드를 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_auto_drive') {
						if(!confirm("자동운전모드를 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					}
					/* 고속터미널 END */
					else if ($(this).attr("id").endsWith('coolstorage_drive')) {
						if(!confirm("냉단운전을 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id").endsWith('icestorage_drive')) {
						if(!confirm("방냉운전을 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id").endsWith('storagetank_drive')) {
						if(!confirm("축냉운전을 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id").endsWith('winter_drive')) {
						if(!confirm("동시운전을 중지하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					}
					
					
					$(this).find('.stop').show();
					$(this).find('.start').hide();
					$(this).removeClass('on').addClass('off');
					$(this).prev('.lamp').removeClass('on').addClass('off');
					value = "0";
				} else if($(this).hasClass('off')){
					
					/* 고속터미널 START */
					if ($(this).attr("id") == 'T02009_system_drive') {
						if(!confirm("시스템운전을 시작하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_storagetank_drive') {
						if(!confirm("축냉운전모드를 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_icestorage_drive') {
						if(!confirm("방냉운전모드를 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_parall_drive') {
						if(!confirm("동시운전모드를 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_single_drive') {
						if(!confirm("냉단운전모드를 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id") == 'T02009_auto_drive') {
						if(!confirm("자동운전모드를 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					}
					/* 고속터미널 END */
					else if ($(this).attr("id").endsWith('coolstorage_drive')) {
						if(!confirm("냉단운전을 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id").endsWith('icestorage_drive')) {
						if(!confirm("방냉운전을 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id").endsWith('storagetank_drive')) {
						if(!confirm("축냉운전을 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					} else if ($(this).attr("id").endsWith('winter_drive')) {
						if(!confirm("동시운전을 실행하시겠습니까?\n(몇초간 지연시간이 발생할 수 있습니다)")) {
							return;							
						}
					}
					
					$(this).find('.start').show();
					$(this).find('.stop').hide();
					$(this).removeClass('off').addClass('on');
					$(this).prev('.lamp').removeClass('off').addClass('on');
					value = "1";
				}
				
				// 경보 > 알람 리셋
				if($(this).attr("id").endsWith("_alarm_reset")) {
					if(value == "1") {
						var json = new Object();
						var array = new Array();
						json.tagId = $("#tagForm input[class="+$(this).attr("id")+"]").attr("id");
						var plcNo = $("#tagForm input[class="+$(this).attr("id")+"]").attr("plcno");		// 제어 PLC번호
						json.value = value;
						array.push(json);
						var request = new Object();
						request.siteCd = $("#siteCd").val();
						request.plcNo = plcNo;
						request.tagList = array;
						if(array.length > 0) {
							console.log("siteCd:"+$("#siteCd").val());
							console.log("plcNo:"+plcNo);
							console.log(array.length, array);
							updateAlarmReset();
							updateTagValue(request);
						}
					}
				// 시스템상태 > 운전 선택 시 / 축냉,방냉 열량 리셋 / 설정관리 > 흡수식 냉각탑 사용
				} else if ($(this).attr("id").indexOf("_drive") > 0 || $(this).attr("id").indexOf("_heat_reset") > 0 || $(this).attr("id").indexOf("_use_yn") > 0
						|| $(this).attr("id").indexOf("_work_main") > 0 || $(this).attr("id").indexOf("_work_pre") > 0) {
					var templateId = $("input[name=templateId]").val();
					// 흡수식냉동기가 아니고 군포, 김포 냉동기가 아닐 경우
					if($(this).attr("id").indexOf("absorb") < 0 && templateId!='A12212' && templateId!='A12212' && templateId!='A22214' && templateId!='A22215'){
						var json = new Object();
						var array = new Array();
						json.tagId = $("#tagForm input[class="+$(this).attr("id")+"]").attr("id");
						var plcNo = $("#tagForm input[class="+$(this).attr("id")+"]").attr("plcno");		// 제어 PLC번호
						json.value = value;
						array.push(json);
						
						var request = new Object();
						request.siteCd = $("#siteCd").val();
						request.plcNo = plcNo;
						request.tagList = array;
						if(array.length > 0) {
							console.log("siteCd:"+$("#siteCd").val());
							console.log("plcNo:"+plcNo);
							console.log(array.length, array);
							updateTagValue(request);
						}
					}
				}
			};
			return;
		});
		
		// 실시간 태그 값 조회
		selectTagValue();
		// 실시간 알람 조회
		selectAlarmStatus();
	});
	
	

</script>

<!-- s : content_area -->
<div id="content_area">
	<div class="subTab_area">
		<ul>
			<c:forEach var="result" items="${subMenulist}" varStatus="status">
				<c:if test="${result.menuFlag eq 'Y'}">
					<c:if test="${result.submenuId eq subMenu}">
						<li class="on">
					</c:if>
					<c:if test="${result.submenuId ne subMenu}">
						<li>
					</c:if>
						<a href="javascript:emsMainTab('${result.submenuId}');">${result.submenuName}</a>
					</li>				
				</c:if>
			</c:forEach>
		</ul>
	</div>
	
	<!-- 템플릿 타입별로 계통도/그리드 노출 -->
	<c:forEach var="result" items="${subMenulist}" varStatus="status">
		<!-- s : flow_area -->
		<c:if test="${result.submenuId eq 'SYS01'}">
			<jsp:include page="${result.templateFilePath1}" />
			<%-- <%@ include file="/WEB-INF/views/ems/flowType/flowTypeF.jsp" %> --%>
		</c:if>	
		<!-- e : flow_area -->
		<!-- s : data_area -->
		<c:if test="${result.submenuId eq 'SYS02'}">
			<jsp:include page="${result.templateFilePath1}" />
			<%-- <%@ include file="/WEB-INF/views/ems/system/gridType.jsp" %> --%>
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

