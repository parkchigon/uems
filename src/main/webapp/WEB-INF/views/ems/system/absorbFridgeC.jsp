<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		
		$('.switch').click(function(){
			
			if($(this).hasClass('disabled') == false) {
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
				
				if ($(this).attr("id").indexOf("_absorb") > 0) {	// 시스템상태 > 운전 선택 시
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
			};
		});	
		
		// 달력 체크박스 클릭시 control 연동인 경우
		$('[name ="scheduleWeek"]').click(function(){
			componentId =$(this).attr("id");
			var json = new Object();
			var array = new Array();
			json.tagId =  $("#tagForm input[class=T11001_" + componentId + "]").attr("id");
			var plcNo = $("#tagForm input[class=T11001_" + componentId + "]").attr("plcno");		// 제어 PLC번호
			value = "0";
			if($("input[id="+ componentId +"]:checked").is(":checked")) {
				value = "1";
			}
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
		});
		
		// 실시간 태그 값 조회
		selectTagValue();
	});
	var coolwater_fs = null;
	var heatchanging_fs = null;
	var coolwaterpump1 = null;
	var coolwaterpump2 = null;
	var heatchangingpump1 = null;
	var heatchangingpump2 = null;
	/* 삭제하지 말것 */
	function checkDoublePipe() {
		
		coolwater_fs = $("input[class='T11001_absorb_cool_fs']").val();
		
		if(coolwater_fs == '1'){
			$("span[name = 'T11001_pipe1']").addClass("on");
		}else{
			$("span[name = 'T11001_pipe1']").removeClass("on");
		}
		
		heatchanging_fs = $("input[class='T11001_absorb_coolhotwater_fs']").val();
		
		if(heatchanging_fs == '1'){
			$("span[name = 'T11001_pipe2']").addClass("on");
		}else{
			$("span[name = 'T11001_pipe2']").removeClass("on");
		}
		
		coolwaterpump1 = $("input[class='T11001_absorb_coolpump1']").val();
		
		if(coolwaterpump1 == '1'){
			$("span[id='T11001_absorb_coolpump1']").removeClass("off").addClass("on");
			$("span[name = 'T11001_pipe3']").addClass("on");
		}else{
			$("span[id='T11001_absorb_coolpump1']").removeClass("on").addClass("off");
			$("span[name = 'T11001_pipe3']").removeClass("on");
		}
		
		coolwaterpump2 = $("input[class='T11001_absorb_coolpump2']").val();
		
		if(coolwaterpump2 == '1'){
			$("span[id='T11001_absorb_coolpump2']").removeClass("off").addClass("on");
			$("span[name = 'T11001_pipe4']").addClass("on");
		}else{
			$("span[id='T11001_absorb_coolpump2']").removeClass("on").addClass("off");
			$("span[name = 'T11001_pipe4']").removeClass("on");
		}
		
		heatchangingpump1 = $("input[class='T11001_absorb_coolhotwaterpump1']").val();
		
		if(heatchangingpump1 == '1'){
			$("span[name = 'T11001_pipe5']").addClass("on");
			$("span[id='T11001_absorb_coolhotwaterpump1']").removeClass("off").addClass("on");
		}else{
			$("span[id='T11001_absorb_coolhotwaterpump1']").removeClass("on").addClass("off");
			$("span[name = 'T11001_pipe5']").removeClass("on");
		}
		
		heatchangingpump2 = $("input[class='T11001_absorb_coolhotwaterpump2']").val();
		
		if(heatchangingpump2 == '1'){
			$("span[id='T11001_absorb_coolhotwaterpump2']").removeClass("off").addClass("on");
			$("span[name = 'T11001_pipe6']").addClass("on");
		}else{
			$("span[id='T11001_absorb_coolhotwaterpump2']").removeClass("on").addClass("off");
			$("span[name = 'T11001_pipe6']").removeClass("on");
		}
		
		var absorb_wattmeter_electric = $("input[class='T11001_absorb_wattmeter_electric']").val();
		$("#T11001_absorb_wattmeter_electric").text(absorb_wattmeter_electric);
		
		var absorb_wattmeter_wattage = $("input[class='T11001_absorb_wattmeter_wattage']").val();
		$("#T11001_absorb_wattmeter_wattage").text(absorb_wattmeter_wattage);
		
		var absorb_gas_inspect = $("input[class='T11001_absorb_gas_inspect']").val();
		$("#T11001_absorb_gas_inspect").text(absorb_gas_inspect);
		
		var absorb_gas_accum = $("input[class='T11001_absorb_gas_accum']").val();
		$("#T11001_absorb_gas_accum").text(absorb_gas_accum);
		
		var absorb_gas_pressure = $("input[class='T11001_absorb_gas_pressure']").val();
		$("#T11001_absorb_gas_pressure").text(absorb_gas_pressure);
		
		var boiler1 = $("input[class='T11001_absorb_boiler1_auto_yn']").val();
			if(boiler1 == 1){
				$("span[id='T11001_absorb_boiler1_auto_yn']").removeClass('off').addClass('on');
				$("span[id='T11001_absorb_boiler1_auto_yn']").text("수동");
			}else{
				$("span[id='T11001_absorb_boiler1_auto_yn']").removeClass('on').addClass('off');
				$("span[id='T11001_absorb_boiler1_auto_yn']").text("자동");
			}

		var boiler2 = $("input[class='T11001_absorb_boiler2_auto_yn']").val();
		if(boiler2 == 1){
			$("span[id='T11001_absorb_boiler2_auto_yn']").removeClass('off').addClass('on');
			$("span[id='T11001_absorb_boiler2_auto_yn']").text("수동");
		}else{
			$("span[id='T11001_absorb_boiler2_auto_yn']").removeClass('on').addClass('off');
			$("span[id='T11001_absorb_boiler2_auto_yn']").text("자동");
		}

		var boiler3 = $("input[class='T11001_absorb_boiler3_auto_yn']").val();
		if(boiler3 == 1){
			$("span[id='T11001_absorb_boiler3_auto_yn']").removeClass('off').addClass('on');
			$("span[id='T11001_absorb_boiler3_auto_yn']").text("수동");
		}else{
			$("span[id='T11001_absorb_boiler3_auto_yn']").removeClass('on').addClass('off');
			$("span[id='T11001_absorb_boiler3_auto_yn']").text("자동");
		}
		
		var absorb_cooltower = $("input[class='T11001_absorb_cooltower']").val();
		if(absorb_cooltower == 1){
			$("span[id='T11001_absorb_cooltower']").removeClass('off').addClass('on');
			$("span[id='T11001_absorb_cooltower']").text("기동");
		}else{
			$("span[id='T11001_absorb_cooltower']").removeClass('on').addClass('off');
			$("span[id='T11001_absorb_cooltower']").text("정지");
		}
		
		//흡수식냉온수기 순시열량
		var absorb_inspect_heat = 0;
		var absorb_coolhotwater_run_yn = $("input[class='T11001_absorb_coolhotwater_run_yn']").val();
		if (absorb_coolhotwater_run_yn == 1) {
			var absorb_flow_inspect = $("input[class='T11001_absorb_flow_inspect']").val().replace(/,/g, '');
			absorb_inspect_heat = Math.round(($("input[class='T11001_absorb_coolhotwater_in_temp']").val() - $("input[class='T11001_absorb_coolhotwater_out_temp']").val())*absorb_flow_inspect*1000/3024);
		}
		$("#absorb_inspect_heat").text(absorb_inspect_heat);
	}
	
	function openScheduelPopup(id, componentId) {
		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(200);
		$('#mask').fadeTo("fast", 0.7);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		$(".popup_container").hide();
		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
		// 팝업 value 세팅
		settingScheduelPopupValue(id, componentId);
	}
	
	function openScheduelPopup2(id, componentId) {
		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(200);
		$('#mask').fadeTo("fast", 0.7);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
		$("input[name=shComponentId]").val(componentId);
		// 팝업 value 세팅
		settingScheduelPopupValue(id, componentId);
	}
	
	function settingScheduelPopupValue(id, componentId) {
		
		$("input[name=componentId]").val(componentId);
		$("input[name=layerIdId]").val(id);
		
		switch (id) {
		case '#layerPop_type501':
			var value = $("#tagForm input[class='T11001_absorb_schedule_mon']").val();
			if(value == 1) { // 월요일 ON
				$(id+" input[id=absorb_schedule_mon]").attr("checked", true);
			} else if(value == 0) { // 월요일 OFF
				$(id+" input[id=absorb_schedule_mon]").attr("checked", false);
			} else {
				alert("'월'값을 가져올 수 없습니다!");
			} 
			
			value = $("#tagForm input[class='T11001_absorb_schedule_tues']").val();
			if(value == 1) { // 화요일 ON
				$(id+" input[id=absorb_schedule_tues]").attr("checked", true);
			} else if(value == 0) { // 화요일 OFF
				$(id+" input[id=absorb_schedule_tues]").attr("checked", false);
			} else {
				alert("'화'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T11001_absorb_schedule_wed']").val();
			if(value == 1) { // 수요일 ON
				$(id+" input[id=absorb_schedule_wed]").attr("checked", true);
			} else if(value == 0) { // 수요일 OFF
				$(id+" input[id=absorb_schedule_wed]").attr("checked", false);
			} else {
				alert("'수'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T11001_absorb_schedule_thur']").val();
			if(value == 1) { // 목요일 ON
				$(id+" input[id=absorb_schedule_thur]").attr("checked", true);
			} else if(value == 0) { // 목요일 OFF
				$(id+" input[id=absorb_schedule_thur]").attr("checked", false);
			} else {
				alert("'목'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T11001_absorb_schedule_fri']").val();
			if(value == 1) { // 금요일 ON
				$(id+" input[id=absorb_schedule_fri]").attr("checked", true);
			} else if(value == 0) { // 금요일 OFF
				$(id+" input[id=absorb_schedule_fri]").attr("checked", false);
			} else {
				alert("'금'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T11001_absorb_schedule_sat']").val();
			if(value == 1) { // 토요일 ON
				$(id+" input[id=absorb_schedule_sat]").attr("checked", true);
			} else if(value == 0) { // 토요일 OFF
				$(id+" input[id=absorb_schedule_sat]").attr("checked", false);
			} else {
				alert("'토'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T11001_absorb_schedule_sun']").val();
			if(value == 1) { // 일요일 ON
				$(id+" input[id=absorb_schedule_sun]").attr("checked", true);
			} else if(value == 0) { // 일요일 OFF
				$(id+" input[id=absorb_schedule_sun]").attr("checked", false);
			} else {
				alert("'일'값을 가져올 수 없습니다!");
			}
			//빙축열 스케줄 운전시간 #1
			var weekday1_runnig_shset = $("input[class='T11001_absorb_weekday1_runnig_shset']").val();
			var classId = $("input[class='T11001_absorb_weekday1_runnig_shset']").attr('class');
			driveTime(weekday1_runnig_shset, classId);

			
			var sat1_running_shset = $("input[class='T11001_absorb_sat1_running_shset']").val();
			var classId = $("input[class='T11001_absorb_sat1_running_shset']").attr('class');
			driveTime(sat1_running_shset, classId);
			
			var sun1_running_shset = $("input[class='T11001_absorb_sun1_running_shset']").val();
			var classId = $("input[class='T11001_absorb_sun1_running_shset']").attr('class');
			driveTime(sun1_running_shset, classId);
			
			var weekday1_stop_shset = $("input[class='T11001_absorb_weekday1_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_weekday1_stop_shset']").attr('class');
			driveTime(weekday1_stop_shset, classId);
			
			
			var sat1_stop_shset = $("input[class='T11001_absorb_sat1_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_sat1_stop_shset']").attr('class');
			driveTime(sat1_stop_shset, classId);
			
			var sun1_stop_shset = $("input[class='T11001_absorb_sun1_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_sun1_stop_shset']").attr('class');
			driveTime(sun1_stop_shset, classId);
			
			//빙축열 스케줄 운전시간 #2
			var weekday2_runnig_shset = $("input[class='T11001_absorb_weekday2_runnig_shset']").val();
			var classId = $("input[class='T11001_absorb_weekday2_runnig_shset']").attr('class');
			driveTime(weekday2_runnig_shset, classId);
			
			var sat2_running_shset = $("input[class='T11001_absorb_sat2_running_shset']").val();
			var classId = $("input[class='T11001_absorb_sat2_running_shset']").attr('class');
			driveTime(sat2_running_shset, classId);
			
			var sun2_running_shset = $("input[class='T11001_absorb_sun2_running_shset']").val();
			var classId = $("input[class='T11001_absorb_sun2_running_shset']").attr('class');
			driveTime(sun2_running_shset, classId);
			
			var weekday2_stop_shset = $("input[class='T11001_absorb_weekday2_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_weekday2_stop_shset']").attr('class');
			driveTime(weekday2_stop_shset, classId);
			
			var sat2_stop_shset = $("input[class='T11001_absorb_sat2_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_sat2_stop_shset']").attr('class');
			driveTime(sat2_stop_shset, classId);
			
			var sun2_stop_shset = $("input[class='T11001_absorb_sun2_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_sun2_stop_shset']").attr('class');
			driveTime(sun2_stop_shset, classId);
			
			//빙축열 스케줄 운전시간 #3
			var weekday3_runnig_shset = $("input[class='T11001_absorb_weekday3_runnig_shset']").val();
			var classId = $("input[class='T11001_absorb_weekday3_runnig_shset']").attr('class');
			driveTime(weekday3_runnig_shset, classId);
			
			var sat3_running_shset = $("input[class='T11001_absorb_sat3_running_shset']").val();
			var classId = $("input[class='T11001_absorb_sat3_running_shset']").attr('class');
			driveTime(sat3_running_shset, classId);
			
			var sun3_running_shset = $("input[class='T11001_absorb_sun3_running_shset']").val();
			var classId = $("input[class='T11001_absorb_sun3_running_shset']").attr('class');
			driveTime(sun3_running_shset, classId);
			
			var weekday3_stop_shset = $("input[class='T11001_absorb_weekday3_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_weekday3_stop_shset']").attr('class');
			driveTime(weekday3_stop_shset, classId);
			
			var sat3_stop_shset = $("input[class='T11001_absorb_sat3_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_sat3_stop_shset']").attr('class');
			driveTime(sat3_stop_shset, classId);
			
			var sun3_stop_shset = $("input[class='T11001_absorb_sun3_stop_shset']").val();
			var classId = $("input[class='T11001_absorb_sun3_stop_shset']").attr('class');
			driveTime(sun3_stop_shset, classId);
			
			var plc_hour_shset = $("input[class='T11001_absorb_plc_hour_shset']").val();
			if(plc_hour_shset < 10){
				plc_hour_shset = "0"+plc_hour_shset;
			}
			$("#T11001_absorb_plc_hour_shset").text(plc_hour_shset);
			
			var plc_time_shset = $("input[class='T11001_absorb_plc_time_shset']").val();
			if(plc_time_shset < 10){
				plc_time_shset = "0"+plc_time_shset;
			}
			$("#T11001_absorb_plc_time_shset").text(plc_time_shset);
		
			setTimeout("settingScheduelPopupValue('"+id+"','"+componentId+"')",2000);
			break;
			
		case '#time_set':
			var componentId = $("input[name=shComponentId]").val();
			
			var time = $("input[class=T11001_"+componentId+"]").val();
			time = time+"";
			console.log(time);
			if(time < 1000){
				time = "0"+time;
			} else{
				var stime = time+"";
				time = stime.replace(/,/g,'');
			}
			var shhour = time.substring(0,2);
			var shtime = time.substring(2,4);
			if(shhour < 10){
				shhour = shhour.substring(1,2);
			}
			if(shtime < 10){
				shtime = shtime.substring(1,2);
			}
			$("select[name=shhour]").val(shhour).prop("selected", true);
			$("select[name=shmin]").val(shtime).prop("selected", true);

			break; 
		}
		
	}
	
	function driveTime(value, classId) {
		if(value == 0){
			value = "0000";
			$("#"+classId).text(value);
		}else if(value < 100){
			value = "00"+value;
			$("#"+classId).text(value);
		}else if(value < 1000){
			value = "0"+value;
			$("#"+classId).text(value);
		}else{
			var svalue = value+"";
			var value1 = svalue.replace(/,/g,'');
			$("#"+classId).text(value1);
		}
	}
	
	function updateTimeSet() {
		var shComponentId = $("input[name=shComponentId]").val();
		console.log(shComponentId);
		if(shComponentId == 'plc'){
			var json = new Object();
			var array = new Array();
			json.tagId =  $("#tagForm input[class=T11001_" + shComponentId+"_hour_shset]").attr("id");
			console.log(json.tagId);
			var plcNo = $("#tagForm input[class=T11001_" + shComponentId+"_hour_shset]").attr("plcno");		// 제어 PLC번호
			console.log(plcNo);
			var shhour = $("#shhour option:selected").val();
			if(shhour < 10){
				shhour = "0"+shhour;
			}
			json.value = shhour;
			array.push(json);
			
			json = new Object();
			json.tagId =  $("#tagForm input[class=T11001_" + shComponentId+"_time_shset]").attr("id");
			console.log(json.tagId);
			var plcNo = $("#tagForm input[class=T11001_" + shComponentId+"_time_shset]").attr("plcno");		// 제어 PLC번호
			console.log(plcNo);
			var shmin = $("#shmin option:selected").val();
			if(shmin < 10){
				shmin = "0"+shmin;
			}
			json.value = shmin;
			array.push(json);
			
			
		}else{
			var json = new Object();
			var array = new Array();
			json.tagId =  $("#tagForm input[class=T11001_" + shComponentId+"]").attr("id");
			var plcNo = $("#tagForm input[class=T11001_"+shComponentId +"]").attr("plcno");		// 제어 PLC번호
			var shhour = $("#shhour option:selected").val();
			if(shhour < 10){
				shhour = "0"+shhour;
			}
			var shmin = $("#shmin option:selected").val();
			if(shmin < 10){
				shmin = "0"+shmin;
			}
			var fullTime = shhour+ shmin;
			
			json.value = fullTime;
			array.push(json);
			
			
		}
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
	
	function updateCurrentTime() {
		var json = new Object();
		var array = new Array();
		json.tagId =  $("#tagForm input[class='T11001_absorb_plc_time_send']").attr("id");
		var plcNo = $("#tagForm input[class='T11001_absorb_plc_time_send']").attr("plcno");
		var value = "1";
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
	
	<div class="blockDiagram_area">
		
		<div class="hw">
			<span class="pipe_hw_ud up pipe001" name="T11001_pipe1"><em></em></span>
			<span class="pipe_hw_ud down pipe002" name="T11001_pipe1"><em></em></span>
			<span class="pipe_hw_ud down pipe003" name="T11001_pipe3"></span>
			<span class="pipe_hw_ud down pipe004" name="T11001_pipe1"><em></em></span>
			<span class="pipe_hw_ud down pipe005" name="T11001_pipe4"></span>
			
			<span class="pipe_hw_lr right pipe001" name="T11001_pipe1"><em></em></span>
			<span class="pipe_hw_lr right pipe002" name="T11001_pipe1"><em></em></span>
			<span class="pipe_hw_lr left pipe003" name="T11001_pipe1"></span>
			<span class="pipe_hw_lr right pipe004" name="T11001_pipe4"></span>
			<span class="pipe_hw_lr left pipe005" name="T11001_pipe4"></span>
			
			<span class="pipe_hw_corner_dl corner001"></span>
			<span class="pipe_hw_corner_dl corner002"></span>
			
			<span class="pipe_hw_corner_dr corner001"></span>
			<span class="pipe_hw_corner_dr corner002"></span>
			<span class="pipe_hw_corner_dr corner003"></span>
			
			<span class="pipe_hw_corner_ul corner001"></span>
			
			<span class="pipe_hw_corner_ur corner001"></span>
			
			<span class="pipe_hw_t_lrd corner001"></span>
			<span class="pipe_hw_t_udr corner001"></span>
			
			<span class="sensor_u_temperature sensor001"><em><span id="T11001_absorb_cool_in_temp" title="냉각수입구온도"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor002"><em><span id="T11001_absorb_cool_out_temp" title="냉각수출구온도"></span> ℃</em></span>
			
			<div class="coolingtower">
				<strong class="name">냉각탑</strong>
				<div class="one_inner">
					<span class="power off" id="T11001_absorb_cooltower">정지</span><!-- 모달팝업 -->
				</div>
			</div>
			
			<div class="coolpump_area">
				<a class="coolpump ud No1">
					<span class="fan on" id="T11001_absorb_coolpump1"></span>
				</a>
				<a class="coolpump ud No2">
					<span class="fan on" id="T11001_absorb_coolpump2"></span>
				</a>
				<strong class="text_info">냉각수<br />펌프</strong>
			</div>
		</div>
		
		<div class="glycol">
			<span class="pipe_glycol_ud down pipe001" name="T11001_pipe2"></span>
			<span class="pipe_glycol_ud up pipe002" name="T11001_pipe2"></span>
			<span class="pipe_glycol_ud up pipe003" name="T11001_pipe5"></span>
			<span class="pipe_glycol_ud down pipe004" name="T11001_pipe5"></span>
			<span class="pipe_glycol_ud up pipe005" name="T11001_pipe2"></span>
			
			<span class="pipe_glycol_lr left pipe001" name="T11001_pipe2"><em></em></span>
			<span class="pipe_glycol_lr right pipe002" name="T11001_pipe6"></span>
			<span class="pipe_glycol_lr left pipe003" name="T11001_pipe2"></span>
			<span class="pipe_glycol_lr right pipe004" name="T11001_pipe2"></span>
			<span class="pipe_glycol_lr right pipe005" name="T11001_pipe5"></span>
			<span class="pipe_glycol_lr right pipe006" name="T11001_pipe2"><em></em></span>
			<span class="pipe_glycol_lr right pipe007" name="T11001_pipe2"></span>
			<span class="pipe_glycol_lr left pipe008" name="T11001_pipe2"></span>
			
			<span class="pipe_glycol_corner_ur corner001"></span>
			<span class="pipe_glycol_corner_ur corner002"></span>
			<span class="pipe_glycol_corner_ul corner001"></span>
			<span class="pipe_glycol_corner_ul corner002"></span>
			<span class="pipe_glycol_corner_ul corner003"></span>
			<span class="pipe_glycol_corner_dl corner001"></span>
			<span class="pipe_glycol_corner_dl corner002"></span>
			<span class="pipe_glycol_corner_dr corner001"></span>
			
			<span class="pipe_glycol_t_lru corner001"></span>
			<span class="pipe_glycol_t_lru corner002"></span>
			
			<span class="sensor_d_temperature sensor001"><em class="font_yellow"><span id="T11001_absorb_coolhotwater_out_temp" title="냉온수출구온도"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="T11001_absorb_coolhotwater_in_temp" title="냉온수입구온도"></span> ℃</em></span>
			
			<div class="refrigerating_machine No1">
				<a href="javascript:openLayerPop('#layerPop_type31','T11001','absorb_coolhotwater');"><span id="T11001_absorb_coolhotwater_heat_stat" class="power no1 off">냉방</span></a>
				<a href="javascript:openLayerPop('#layerPop_type1','T11001','absorb_coolhotwater');"><span id="T11001_absorb_coolhotwater" class="power no2 off">정지</span></a>
			</div>
			
			<div class="coolpump_area">
				<a class="coolpump no1">
					<span class="fan off" id="T11001_absorb_coolhotwaterpump1"></span>
				</a>
				<a class="coolpump no2">
					<span class="fan off" id="T11001_absorb_coolhotwaterpump2"></span>
				</a>
				<strong class="text_info">냉온수 펌프</strong>
			</div>
			
			<div class="header No1">공<br />급<br />헤<br />더<em></em></div>
			<div class="header No2">환<br />수<br />헤<br />더<em></em></div>
		</div>
		
		<div class="innerPop pop3">
					<dl>
						<dt>전력량계</dt>
						<dd>
							<table class="pop_row">
								<colgroup>
									<col width="40%" />
									<col width="60%" />
								</colgroup>
								<tbody>
									<tr>
										<th>전력</th>
										<td>
											<span id="T11001_absorb_wattmeter_electric"></span> kw
										</td>
									</tr>
									<tr>
										<th>전력량</th>
										<td>
											<span id="T11001_absorb_wattmeter_wattage"></span> kwh
										</td>
									</tr>
								</tbody>
							</table>
						</dd>
					</dl>
				</div>
				
				<div class="innerPop pop4">
					<dl>
						<dt>가스</dt>
						<dd>
							<table class="pop_row">
								<colgroup>
									<col width="40%" />
									<col width="60%" />
								</colgroup>
								<tbody>
									<tr>
										<th>순시</th>
										<td>
											<span id="T11001_absorb_gas_inspect"></span> ㎡/h
										</td>
									</tr>
									<tr>
										<th>적산</th>
										<td>
											<span id="T11001_absorb_gas_accum"></span> ㎡
										</td>
									</tr>
									<tr>
										<th>압력</th>
										<td>
											<span id="T11001_absorb_gas_pressure"></span> ㎪
										</td>
									</tr>
									<tr>
										<th>온도</th>
										<td>
											<span id="T11001_absorb_gas_temp"></span> ℃
										</td>
									</tr>
								</tbody>
							</table>
						</dd>
					</dl>
				</div>
		
		<div class="boiler no1">
			<span class="name">보일러1</span>
			<!-- <a href="javascript:openLayerPop('#layerPop_type1','T11001', 'absorb_boiler1');"><span id="T11001_absorb_boiler1_auto_yn" class="time">시간 수동</span></a> -->
			<a href="javascript:openLayerPop('#layerPop_type1','T11001', 'absorb_boiler1');" id="T11001_absorb_boiler1" class="power off" >운전 가동</a>
		</div>
		<div class="boiler no2">
			<span class="name">보일러2</span>
			<!-- <a href="javascript:openLayerPop('#layerPop_type1','T11001', 'absorb_boiler2');"><span id="T11001_absorb_boiler2_auto_yn" class="time">시간 수동</span></a> -->
			<a href="javascript:openLayerPop('#layerPop_type1','T11001', 'absorb_boiler2');" id="T11001_absorb_boiler2" class="power off">운전 가동</a>
		</div>
		<div class="boiler no3">
			<span class="name">보일러3</span>
			<!-- <a href="javascript:openLayerPop('#layerPop_type1','T11001', 'absorb_boiler3');"><span id="T11001_absorb_boiler3_auto_yn" class="time">시간 수동</span></a> -->
			<a href="javascript:openLayerPop('#layerPop_type1','T11001', 'absorb_boiler3');" id="T11001_absorb_boiler3" class="power off">운전 가동</a>
		</div>
	</div>
</div>
<!-- e : content_area -->
	
<!-- s : data_area -->
<div id="data_area">
<div class="scroll" style="height:940px;">
	
	<div class="data_area_inner">
		<dl>
			<dt>적산관리</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">유량계 순시</th>
							<td class="font_yellow"><span id="T11001_absorb_flow_inspect">0</span> ㎡/h</td>
							<th scope="row">유랑계 적산</th>
							<td class="font_yellow"><span id="T11001_absorb_flow_accum">0</span> ㎥</td>
						</tr>
						<tr>
							<th scope="row">비보정 가스유량</th>
							<td class="font_yellow"><span id="T11001_absorb_gas_uncorrect_flux">0</span> ㎡/h</td>
							<th scope="row">비보정 가스적산량</th>
							<td class="font_yellow"><span id="T11001_absorb_gas_uncorrect_accum">0</span> ㎥</td>
						</tr>
						<tr>
							<th scope="row">보정 가스유량</th>
							<td class="font_yellow"><span id="T11001_absorb_gas_correct_flux">0</span> ㎡/h</td>
							<th scope="row">보정 가스적산량</th>
							<td class="font_yellow"><span id="T11001_absorb_gas_correct_accum">0</span> ㎥</td>
						</tr>
						<tr>
							<th scope="row">냉온수기 순시열량</th>
							<td class="font_yellow"><span id="absorb_inspect_heat">0</span> USRT</td>
							<th scope="row"> </th>
							<td ></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>댐퍼설정 <span class="fr"><a class="btnType btn_type01" href="javascript:openScheduelPopup('#layerPop_type501','absorb_schdeuel');">스케줄 설정</a></span></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="29%">
					<col width="*">
					<col width="29%">
					<col width="*%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">4호빗트 (생화)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper1">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
							<th scope="row">4호빗트 (조화)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper2">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">3호빗트측면(생화) 165호</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper6">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
							<th scope="row">3호 계단앞 (조화)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper5">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">2호빗트측면(생화) 147호</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper8">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
							<th scope="row">2호 계단앞 (조화)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper7">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">1호빗트 (생화)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper3">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
							<th scope="row">1호빗트 (조화)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper4">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
						</tr>
						<!-- <tr>
							<th scope="row">댐퍼3(북쪽 급기1)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper3">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
							<th scope="row">댐퍼4(북쪽 급기2)</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper4">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">댐퍼5</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper5">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
							<th scope="row">댐퍼6</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper6">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">댐퍼7</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper7">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
							<th scope="row">댐퍼8</th>
							<td>
								<div class="switch off" id="T11001_absorb_damper8">
									<span class="stop">OFF</span>
									<span class="start">ON</span>
									<em></em>
								</div>
							</td>
						</tr> -->
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set danger">경보</span>
				<div class="head_right">
					
				</div>
			</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="33.3%">
					<col width="33.3%">
					<col width="*">
				</colgroup>

					<tbody class="warning">
						<c:set var="count" value="0"/>
						<c:forEach var="result" items="${tagMapList}" varStatus="status">
							<c:if test="${result.groupId eq 'alarm'}">
								<c:set var="count" value="${count+1}"/>
								<c:if test="${count % 3 eq '1'}">	
									<c:choose>
										<c:when test="${count > 9}">
											<tr style="display:none;">
										</c:when>
										<c:otherwise>
											<tr>
										</c:otherwise>
									</c:choose>
								</c:if>
								<td class="" id="${result.templateId}_${result.componentId}"><a href="javascript:goAlarm();">${result.displayName}</a></td>
								<c:if test="${count % 3 eq '0'}">	
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>

	
</div>
</div>
<!-- e : data_area -->
	<div class="popup_container type3" id="layerPop_type501">
		<div class="popup_inner">
			<div class="popup_header"><h2>스케줄 설정</h2></div> 
			<div class="popup_body">
				<div class="popup_content">
  			 			
					<div class="main_content">
					
						<!-- s: table wrap-->
						<div>
							<table class="pop_row">
								<colgroup>
									<col width="*" />
									<col width="25%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th>요일선택</th>
										<td colspan="3">
											<input type="checkbox" id="absorb_schedule_mon" name="scheduleWeek"/><label for="absorb_schedule_mon">월</label>
											<input type="checkbox" id="absorb_schedule_tues" name="scheduleWeek" class="ml20"/><label for="absorb_schedule_tues">화</label>
											<input type="checkbox" id="absorb_schedule_wed" name="scheduleWeek" class="ml20"/><label for="absorb_schedule_wed">수</label>
											<input type="checkbox" id="absorb_schedule_thur" name="scheduleWeek" class="ml20"/><label for="absorb_schedule_thur">목</label>
											<input type="checkbox" id="absorb_schedule_fri" name="scheduleWeek" class="ml20"/><label for="absorb_schedule_fri">금</label>
											<input type="checkbox" id="absorb_schedule_sat" name="scheduleWeek" class="ml20"/><label for="absorb_schedule_sat" class="font_blue">토</label>
											<input type="checkbox" id="absorb_schedule_sun" name="scheduleWeek" class="ml20"/><label for="absorb_schedule_sun" class="font_red">일</label>
										</td>
									</tr>
									<tr>
										<th>시간설정</th>
										<td>월 ~ 금요일</td>
										<td class="font_blue">토요일</td>
										<td class="font_red">일요일</td>
									</tr>
									<tr>
										<th>운전시간1</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_weekday1_runnig_shset');"><span id="T11001_absorb_weekday1_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sat1_running_shset');"><span id="T11001_absorb_sat1_running_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sun1_running_shset');"><span id="T11001_absorb_sun1_running_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간1</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_weekday1_stop_shset');"><span id="T11001_absorb_weekday1_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sat1_stop_shset');"><span id="T11001_absorb_sat1_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sun1_stop_shset');"><span id="T11001_absorb_sun1_stop_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>운전시간2</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_weekday2_runnig_shset');"><span id="T11001_absorb_weekday2_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sat2_running_shset');"><span id="T11001_absorb_sat2_running_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sun2_running_shset');"><span id="T11001_absorb_sun2_running_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간2</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_weekday2_stop_shset');"><span id="T11001_absorb_weekday2_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sat2_stop_shset');"><span id="T11001_absorb_sat2_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sun2_stop_shset');"><span id="T11001_absorb_sun2_stop_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>운전시간3</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_weekday3_runnig_shset');"><span id="T11001_absorb_weekday3_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sat3_running_shset');"><span id="T11001_absorb_sat3_running_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sun3_running_shset');"><span id="T11001_absorb_sun3_running_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간3</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_weekday3_stop_shset');"><span id="T11001_absorb_weekday3_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sat3_stop_shset');"><span id="T11001_absorb_sat3_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','absorb_sun3_stop_shset');"><span id="T11001_absorb_sun3_stop_shset">0000</span></a></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="5">
											PLC 현재시간 <a href="javascript:openScheduelPopup2('#time_set','plc');"><span id="T11001_absorb_plc_hour_shset">00</span>:<span id="T11001_absorb_plc_time_shset">00</span></a>
											<a class="btnType btn_type03" href="javascript:updateCurrentTime();">전송</a>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- s: btn wrap 가운데 정렬-->
						<div class="pop_btn_wrap">
							<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	<!-- 시간설정팝업 -->
    <div id="time_set" class="alertPop" style="width: 300px;">
    <input type="hidden" id="shComponentId" name="shComponentId" value="">
        <dl>
            <dt><strong>시간설정</strong></dt>
            <dd>
                <p class="textC">
					<select id="shhour" name="shhour" style="width: 100px">
						<c:forEach var="item" varStatus="i" begin="00" end="23" step="1">
							<option value="${item }"><c:if test="${item < 10}">0</c:if><c:out value="${item }"></c:out></option>
						</c:forEach>
					</select>
					<select id="shmin" name="shmin" style="width: 100px">
						<c:forEach var="item" varStatus="i" begin="00" end="55" step="5">
							<option value="${item }"><c:if test="${item < 10}">0</c:if><c:out value="${item }"></c:out></option>
						</c:forEach>
					</select>
                </p>
            	<div style="text-align: center;color: red;">
            		(확인 후 값 변경에 지연시간이 발생할수 있습니다.)
            	</div>
				<div class="pop_btn_wrap">
					<a class="pop_btn btn_type02" href="javascript:updateTimeSet();">확인</a>
				</div>
            </dd>
        </dl>
        <a href="" class="closePop3"><span class="blind">닫기</span></a>
	</div>
	<!--// 시간설정팝업 -->
	
<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->	

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->
