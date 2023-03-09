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
					
					/* 고속터미널 */
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
	
	/* alarm 리스트 상태값 변경  */
	function changeStatus(alarmId,alramStatusCd,tagId,prevAlramStatusCd){
		//1.인지 > 해제 > 로우삭제
		var json = new Object();
		var array = new Array();
		
		var arrAlarmId = new Array();
		
		json.tagId = tagId;
		json.alramStatusCd = prevAlramStatusCd;
		json.prevAlarmStatusCd = alramStatusCd;
		array.push(json);
		
		arrAlarmId.push(alarmId);
		
		var request = new Object();
		request.siteCd = $("#siteCd").val();
		request.alramStatusCd = prevAlramStatusCd;
		request.alarmIdList = arrAlarmId;
		request.tagList = array;
		if(array.length > 0) {
			console.log("siteCd:"+$("#siteCd").val());
			console.log(array.length, array);
			updateAlarmValue(request);
		}
	}
	
	// 삭제하지 마세요!
	function checkDoublePipe() {
	}
	
	/* 체크박스 전체선택, 전체해제 */
	function checkAll(){
	      if( $("#checkAll").is(':checked') ){
	        $("input[name=checkRow]").prop("checked", true);
	      }else{
	        $("input[name=checkRow]").prop("checked", false);
	      }
	}

	/* 삭제(체크박스된 것 전부) */
	function deleteAction(alarmStatusCd){  
  	  var json = new Object();
	  var array = new Array();
	  var arrAlarmId = new Array();
	  var tempArr = [];
	  
	  var duplication;

	  
	  $("input[name='checkRow']:checked" ).each (function (){
		  
		  arrAlarmId.push($(this).attr("alarmId"));
		  
		  json = new Object();
		  tagId = $(this).val();
		  prevAlarmStatusCd = $(this).attr("prevAlramStatusCd");
		  
		  duplication =false;
		  for (var j = 0; j < tempArr.length; j++) {
              if (tempArr[j] == tagId) {
            	  duplication =true;
            	  break;
              }
          }
		  
		  if(!duplication && !(alarmStatusCd == "ALARM_STATUS02" && prevAlarmStatusCd =="ALARM_STATUS02") ){
			  json.tagId = tagId;
			  json.alramStatusCd = alarmStatusCd;
			  json.prevAlarmStatusCd = prevAlarmStatusCd;
			  tempArr.push(tagId);
			  array.push(json);
          }
		  
	  });
	  
	  console.log(arrAlarmId);
	  var request = new Object();
	  request.siteCd = $("#siteCd").val();
	  request.alramStatusCd = alarmStatusCd;
	  request.alarmIdList = arrAlarmId;
	  request.tagList = array;
	  if(array.length > 0) {
		  console.log("siteCd:"+$("#siteCd").val());
		  console.log(array.length, array);
		  updateAlarmValue(request);
	  }

	}
	
	// 태그 value 수정
	function updateAlarmValue(request) {
		$.ajax({
			url : "/ems/alarm/updateAlarmValueAjax.do",
			type: "POST",
			data: JSON.stringify(request),
			dataType : "json",
			contentType : "application/json"
		}).done( function(data) {
		 	var resultCode = data.resultCode;
		 	//console.log(resultCode);
			if(resultCode == "0000") {
				var list = data.resultList;
				console.log(list);
				if(list != null) {
					var tagIdArr = new Array();
					for(var i=0; i<list.length; i++) {
						if(list[i].successFlag != "Y") {
							tagIdArr.push(list[i].tagId);
						}
					}
					if(!isEmpty(tagIdArr)) {
						alert(tagIdArr + " 수정을 실패하였습니다.");
					}
				}
				window.location.href = "/ems/alarm/alarmList.do";
			} else {
				alert("PLC Controller 연동 실패하였습니다.");
			}
		});
	}
	
</script>

<!-- s : content_area -->
<div id="content_area">
	<div class="alarm_area">
		<dl>
			<dt><strong>경보리스트</strong>
				<div class="head_right">
					<span>발생 : <em class="font_sky">${countList.alarmStatus01}</em></span>
					<span class="ml20">인지 : <em class="font_sky">${countList.alarmStatus02}</em></span>
					<span class="ml20">해지 : <em class="font_sky">${countList.alarmStatus03}</em></span>
				</div>
			</dt>
			<dd>
				<div  class="scroll" style="height:935px;">
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="40px">
					<col width="110px">
					<col width="100px">
					<col width="200px">
					<col width="200px">
					<col width="*">
					<col width="100px">
				</colgroup>

					<thead>
						<tr>
							<th><input id="checkAll" type="checkbox" name="checkAll" onclick="checkAll();"/></th>
							<th>경보날짜</th>
							<th>경보시간</th>
							<th>태그</th>
							<th>태그설명</th>
							<th>경보내용</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${alarmList}" varStatus="status">
							<c:if test="${result.alarmStatusCd eq 'ALARM_STATUS01' }">
								<tr>
									<th><input type="checkbox" name="checkRow" value="${result.tagId}" prevAlramStatusCd="${result.alarmStatusCd}" alarmId="${result.alarmId}"/></th>
									<th>${result.alarmDate}</th>
									<td>${result.alarmTime}</td>
									<td>${result.tagId}</td>
									<td>${result.tagDesc}</td>
									<td>
										<c:if test="${result.iAlarmWavCdNm ne null}">
											<audio src="/resources/ems/wav/${result.iAlarmWavCdNm}" autoplay="autoplay" loop=20 ></audio>
										</c:if>
										<c:if test="${result.iAlarmImgCdNm ne null}">
											<img src="/resources/ems/img/${result.iAlarmImgCdNm}" style="width: 25px;" />
										</c:if>
										 ${result.alarmMsg}
									</td>
									<td><a href="javascript:changeStatus('${result.alarmId}','${result.alarmStatusCd}','${result.tagId}','ALARM_STATUS02');" class="btn btn_blue">인지</a></td>
								</tr>
							</c:if>
							<c:if test="${result.alarmStatusCd eq 'ALARM_STATUS02' }">
								<tr>
									<th><input type="checkbox" name="checkRow" value="${result.tagId}" prevAlramStatusCd="${result.alarmStatusCd}" alarmId="${result.alarmId}" /></th>
									<th>${result.alarmDate}</th>
									<td>${result.alarmTime}</td>
									<td>${result.tagId}</td>
									<td>${result.tagDesc}</td>
									<td>${result.alarmMsg}</td>
									<td><a href="javascript:changeStatus('${result.alarmId}','${result.alarmStatusCd}','${result.tagId}','ALARM_STATUS03');" class="btn btn_blue">해제</a></td>
								</tr>
							</c:if>
							<c:if test="${result.alarmStatusCd eq 'ALARM_STATUS03' || result.alarmStatusCd eq 'ALARM_STATUS04' }">
								<tr>
									<th></th>
									<th>${result.alarmDate}</th>
									<td>${result.alarmTime}</td>
									<td>${result.tagId}</td>
									<td>${result.tagDesc}</td>
									<c:set var="schAddMsg" value=""></c:set>
									<c:if test="${fn:contains(result.alarmMsg,'(schedule)')}">
									<c:set var="schAddMsg" value=" 실패"></c:set>
									</c:if>
									<td>${result.alarmMsg}${schAddMsg}</td>
									<td></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<div class="paging_area mt20">
	    				<span class="fl">
							<a class="btnType btn_type02" href="javascript:deleteAction('ALARM_STATUS02');">선택인지</a>
							<a class="btnType btn_type02" href="javascript:deleteAction('ALARM_STATUS03');">선택해제</a>
						</span>
	    				
	    				<div class="paging fr">
	    					<c:out value="${alarm.pageutil.pagingBody}" escapeXml="false" />
	    				</div>
					</div>
				</div>
			</dd>
		</dl>
	</div>
</div>
<c:out value="${alarm.pageutil.pagingHtml}" escapeXml="false" />
<!-- e : content_area -->
	
<!-- 템플릿 타입별로 그리드 노출 -->
<c:forEach var="result" items="${subMenulist}" varStatus="status">
	<!-- s : data_area -->
	<c:if test="${result.submenuId eq 'SYS02'}">
		<jsp:include page="${result.templateFilePath1}" />
		<%-- <%@ include file="/WEB-INF/views/ems/system/gridType.jsp" %> --%>
	</c:if>	
	<!-- e : data_area -->
</c:forEach>
	

<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->

<form id="tagForm" name="tagForm">
	<!-- 태그 매핑 -->
	<c:forEach var="result" items="${tagMapList}" varStatus="status">
		<input type="hidden" id="${result.tagId}" name="${result.groupId}" class="${result.templateId}_${result.componentId}"/>
		<div type="hidden" id="UNIT_${result.tagId}" class="${result.unitCd}"></div>
	</c:forEach>
</form>
<form id="alarmForm" name="alarmForm" method="POST" action = "/ems/alarm/updateAlarmStatusCd.do">
	<input type="hidden" id="alarmId" name="alarmId" value="">
	<input type="hidden" id="alarmStatusCd" name="alarmStatusCd" value="">
	<input type="hidden" id="tagId" name="tagId" value="">
	<input type="hidden" id="alarmIdArr" name="alarmIdArr" value="">
</form>
