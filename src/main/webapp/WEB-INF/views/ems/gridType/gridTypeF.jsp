<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
$(document).ready(function(){
	// 달력 체크박스 클릭시 control 연동인 경우
	$('[name ="scheduleWeek"]').click(function(){
		componentId =$(this).attr("id");
		//console.log(componentId);
		var json = new Object();
		var array = new Array();
		json.tagId =  $("#tagForm input[class=T02009_" + componentId + "]").attr("id");
		var plcNo = $("#tagForm input[class=T02009_" + componentId + "]").attr("plcno");// 제어 PLC번호
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
	
	var alarmPage = 1;
	
	// 경보 > 페이지 이동
	function moveAlarm(div) {
		var totalPage = Math.ceil($(".warning tr").size() / 6);
		if(div == "prev") {
			if(alarmPage == "1") {
				return;
			} else {
				alarmPage = alarmPage-1;
			}
		} else if(div == "next") {
			if(alarmPage == totalPage) {
				return;
			} else {
				alarmPage = alarmPage+1;
			}
		}
		
		$(".warning tr").each(function() {
			if($(this).index() >= ((alarmPage-1)*6) && $(this).index() < (alarmPage*6)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
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
		case '#layerPop_type500':
			var value = $("#tagForm input[class='T02009_schedule_mon']").val();
			if(value == 1) { // 월요일 ON
				$(id+" input[id=schedule_mon]").attr("checked", true);
			} else if(value == 0) { // 월요일 OFF
				$(id+" input[id=schedule_mon]").attr("checked", false);
			} else {
				alert("'월'값을 가져올 수 없습니다!");
			} 
			
			value = $("#tagForm input[class='T02009_schedule_tues']").val();
			if(value == 1) { // 화요일 ON
				$(id+" input[id=schedule_tues]").attr("checked", true);
			} else if(value == 0) { // 화요일 OFF
				$(id+" input[id=schedule_tues]").attr("checked", false);
			} else {
				alert("'화'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_schedule_wed']").val();
			if(value == 1) { // 수요일 ON
				$(id+" input[id=schedule_wed]").attr("checked", true);
			} else if(value == 0) { // 수요일 OFF
				$(id+" input[id=schedule_wed]").attr("checked", false);
			} else {
				alert("'수'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_schedule_thur']").val();
			if(value == 1) { // 목요일 ON
				$(id+" input[id=schedule_thur]").attr("checked", true);
			} else if(value == 0) { // 목요일 OFF
				$(id+" input[id=schedule_thur]").attr("checked", false);
			} else {
				alert("'목'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_schedule_fri']").val();
			if(value == 1) { // 금요일 ON
				$(id+" input[id=schedule_fri]").attr("checked", true);
			} else if(value == 0) { // 금요일 OFF
				$(id+" input[id=schedule_fri]").attr("checked", false);
			} else {
				alert("'금'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_schedule_sat']").val();
			if(value == 1) { // 토요일 ON
				$(id+" input[id=schedule_sat]").attr("checked", true);
			} else if(value == 0) { // 토요일 OFF
				$(id+" input[id=schedule_sat]").attr("checked", false);
			} else {
				alert("'토'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_schedule_sun']").val();
			if(value == 1) { // 일요일 ON
				$(id+" input[id=schedule_sun]").attr("checked", true);
			} else if(value == 0) { // 일요일 OFF
				$(id+" input[id=schedule_sun]").attr("checked", false);
			} else {
				alert("'일'값을 가져올 수 없습니다!");
			}
			//빙축열 스케줄 운전시간 #1
			var weekday1_runnig_shset = $("input[class='T02009_weekday1_runnig_shset']").val();
			var classId = $("input[class='T02009_weekday1_runnig_shset']").attr('class');
			driveTime(weekday1_runnig_shset, classId);

			
			var sat1_running_shset = $("input[class='T02009_sat1_running_shset']").val();
			var classId = $("input[class='T02009_sat1_running_shset']").attr('class');
			driveTime(sat1_running_shset, classId);
			
			var sun1_running_shset = $("input[class='T02009_sun1_running_shset']").val();
			var classId = $("input[class='T02009_sun1_running_shset']").attr('class');
			driveTime(sun1_running_shset, classId);
			
			var weekday1_stop_shset = $("input[class='T02009_weekday1_stop_shset']").val();
			var classId = $("input[class='T02009_weekday1_stop_shset']").attr('class');
			driveTime(weekday1_stop_shset, classId);
			
			
			var sat1_stop_shset = $("input[class='T02009_sat1_stop_shset']").val();
			var classId = $("input[class='T02009_sat1_stop_shset']").attr('class');
			driveTime(sat1_stop_shset, classId);
			
			var sun1_stop_shset = $("input[class='T02009_sun1_stop_shset']").val();
			var classId = $("input[class='T02009_sun1_stop_shset']").attr('class');
			driveTime(sun1_stop_shset, classId);
			
			//빙축열 스케줄 운전시간 #2
			var weekday2_runnig_shset = $("input[class='T02009_weekday2_runnig_shset']").val();
			var classId = $("input[class='T02009_weekday2_runnig_shset']").attr('class');
			driveTime(weekday2_runnig_shset, classId);
			
			var sat2_running_shset = $("input[class='T02009_sat2_running_shset']").val();
			var classId = $("input[class='T02009_sat2_running_shset']").attr('class');
			driveTime(sat2_running_shset, classId);
			
			var sun2_running_shset = $("input[class='T02009_sun2_running_shset']").val();
			var classId = $("input[class='T02009_sun2_running_shset']").attr('class');
			driveTime(sun2_running_shset, classId);
			
			var weekday2_stop_shset = $("input[class='T02009_weekday2_stop_shset']").val();
			var classId = $("input[class='T02009_weekday2_stop_shset']").attr('class');
			driveTime(weekday2_stop_shset, classId);
			
			var sat2_stop_shset = $("input[class='T02009_sat2_stop_shset']").val();
			var classId = $("input[class='T02009_sat2_stop_shset']").attr('class');
			driveTime(sat2_stop_shset, classId);
			
			var sun2_stop_shset = $("input[class='T02009_sun2_stop_shset']").val();
			var classId = $("input[class='T02009_sun2_stop_shset']").attr('class');
			driveTime(sun2_stop_shset, classId);
			
			//빙축열 스케줄 운전시간 #3
			var weekday3_runnig_shset = $("input[class='T02009_weekday3_runnig_shset']").val();
			var classId = $("input[class='T02009_weekday3_runnig_shset']").attr('class');
			driveTime(weekday3_runnig_shset, classId);
			
			var sat3_running_shset = $("input[class='T02009_sat3_running_shset']").val();
			var classId = $("input[class='T02009_sat3_running_shset']").attr('class');
			driveTime(sat3_running_shset, classId);
			
			var sun3_running_shset = $("input[class='T02009_sun3_running_shset']").val();
			var classId = $("input[class='T02009_sun3_running_shset']").attr('class');
			driveTime(sun3_running_shset, classId);
			
			var weekday3_stop_shset = $("input[class='T02009_weekday3_stop_shset']").val();
			var classId = $("input[class='T02009_weekday3_stop_shset']").attr('class');
			driveTime(weekday3_stop_shset, classId);
			
			var sat3_stop_shset = $("input[class='T02009_sat3_stop_shset']").val();
			var classId = $("input[class='T02009_sat3_stop_shset']").attr('class');
			driveTime(sat3_stop_shset, classId);
			
			var sun3_stop_shset = $("input[class='T02009_sun3_stop_shset']").val();
			var classId = $("input[class='T02009_sun3_stop_shset']").attr('class');
			driveTime(sun3_stop_shset, classId);
			
			//축냉시간설정
			var heatstorage_drive_time_shset = $("input[class='T02009_heatstorage_drive_time_shset']").val();
			var classId = $("input[class='T02009_heatstorage_drive_time_shset']").attr('class');
			driveTime(heatstorage_drive_time_shset, classId);
			
			var heatstorage_stop_time_shset = $("input[class='T02009_heatstorage_stop_time_shset']").val();
			var classId = $("input[class='T02009_heatstorage_stop_time_shset']").attr('class');
			driveTime(heatstorage_stop_time_shset, classId);
			
			var plc_hour_shset = $("input[class='T02009_plc_hour_shset']").val();
			if(plc_hour_shset < 10){
				plc_hour_shset = "0"+plc_hour_shset;
			}
			$("#T02009_plc_hour_shset").text(plc_hour_shset);
			
			var plc_time_shset = $("input[class='T02009_plc_time_shset']").val();
			if(plc_time_shset < 10){
				plc_time_shset = "0"+plc_time_shset;
			}
			$("#T02009_plc_time_shset").text(plc_time_shset);
			
			var plc_current_hour = $("input[class='T02009_plc_current_hour']").val();
			if(plc_current_hour < 10){
				plc_current_hour = "0"+plc_current_hour;
			}
			$("#T02009_plc_current_hour").text(plc_current_hour);
			
			var plc_current_time = $("input[class='T02009_plc_current_time']").val();
			if(plc_current_time < 10){
				plc_current_time = "0"+plc_current_time;
			}
			$("#T02009_plc_current_time").text(plc_current_time);
			
			setTimeout("settingScheduelPopupValue('"+id+"','"+componentId+"')",2000);
			break;
			
		case '#layerPop_type502':
			var value = $("#tagForm input[class='T02009_tf_schedule_mon']").val();
			if(value == 1) { // 월요일 ON
				$(id+" input[id=tf_schedule_mon]").attr("checked", true);
			} else if(value == 0) { // 월요일 OFF
				$(id+" input[id=tf_schedule_mon]").attr("checked", false);
			} else {
				alert("'월'값을 가져올 수 없습니다!");
			} 
			
			value = $("#tagForm input[class='T02009_tf_schedule_tues']").val();
			if(value == 1) { // 화요일 ON
				$(id+" input[id=tf_schedule_tues]").attr("checked", true);
			} else if(value == 0) { // 화요일 OFF
				$(id+" input[id=tf_schedule_tues]").attr("checked", false);
			} else {
				alert("'화'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_tf_schedule_wed']").val();
			if(value == 1) { // 수요일 ON
				$(id+" input[id=tf_schedule_wed]").attr("checked", true);
			} else if(value == 0) { // 수요일 OFF
				$(id+" input[id=tf_schedule_wed]").attr("checked", false);
			} else {
				alert("'수'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_tf_schedule_thur']").val();
			if(value == 1) { // 목요일 ON
				$(id+" input[id=tf_schedule_thur]").attr("checked", true);
			} else if(value == 0) { // 목요일 OFF
				$(id+" input[id=tf_schedule_thur]").attr("checked", false);
			} else {
				alert("'목'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_tf_schedule_fri']").val();
			if(value == 1) { // 금요일 ON
				$(id+" input[id=tf_schedule_fri]").attr("checked", true);
			} else if(value == 0) { // 금요일 OFF
				$(id+" input[id=tf_schedule_fri]").attr("checked", false);
			} else {
				alert("'금'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_tf_schedule_sat']").val();
			if(value == 1) { // 토요일 ON
				$(id+" input[id=tf_schedule_sat]").attr("checked", true);
			} else if(value == 0) { // 토요일 OFF
				$(id+" input[id=tf_schedule_sat]").attr("checked", false);
			} else {
				alert("'토'값을 가져올 수 없습니다!");
			}
			
			value = $("#tagForm input[class='T02009_tf_schedule_sun']").val();
			if(value == 1) { // 일요일 ON
				$(id+" input[id=tf_schedule_sun]").attr("checked", true);
			} else if(value == 0) { // 일요일 OFF
				$(id+" input[id=tf_schedule_sun]").attr("checked", false);
			} else {
				alert("'일'값을 가져올 수 없습니다!");
			}
			//(상온)월수금 운전시간1 설정
			var tf_weekday11_runnig_shset = $("input[class='T02009_tf_weekday11_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday11_runnig_shset']").attr('class');
			driveTime(tf_weekday11_runnig_shset, classId);
			//(상온)화목토 운전시간1 설정
			var tf_weekday21_runnig_shset = $("input[class='T02009_tf_weekday21_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday21_runnig_shset']").attr('class');
			driveTime(tf_weekday21_runnig_shset, classId);
			//(상온)일요일 운전시간1 설정
			var tf_sun1_running_shset = $("input[class='T02009_tf_sun1_running_shset']").val();
			var classId = $("input[class='T02009_tf_sun1_running_shset']").attr('class');
			driveTime(tf_sun1_running_shset, classId);
			//(상온)월수금 정지시간1 설정
			var tf_weekday11_stop_shset = $("input[class='T02009_tf_weekday11_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday11_stop_shset']").attr('class');
			driveTime(tf_weekday11_stop_shset, classId);
			//(상온)화목토 정지시간1 설정
			var tf_weekday21_stop_shset = $("input[class='T02009_tf_weekday21_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday21_stop_shset']").attr('class');
			driveTime(tf_weekday21_stop_shset, classId);
			//(상온)일요일 정지시간1 설정
			var tf_sun1_stop_shset = $("input[class='T02009_tf_sun1_stop_shset']").val();
			var classId = $("input[class='T02009_tf_sun1_stop_shset']").attr('class');
			driveTime(tf_sun1_stop_shset, classId);
			
			//(상온)월수금 운전시간2 설정
			var tf_weekday12_runnig_shset = $("input[class='T02009_tf_weekday12_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday12_runnig_shset']").attr('class');
			driveTime(tf_weekday12_runnig_shset, classId);
			//(상온)화목토 운전시간2 설정
			var tf_weekday22_runnig_shset = $("input[class='T02009_tf_weekday22_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday22_runnig_shset']").attr('class');
			driveTime(tf_weekday22_runnig_shset, classId);
			//(상온)일요일 운전시간2 설정
			var tf_sun2_running_shset = $("input[class='T02009_tf_sun2_running_shset']").val();
			var classId = $("input[class='T02009_tf_sun2_running_shset']").attr('class');
			driveTime(tf_sun2_running_shset, classId);
			//(상온)월수금 정지시간2 설정
			var tf_weekday12_stop_shset = $("input[class='T02009_tf_weekday12_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday12_stop_shset']").attr('class');
			driveTime(tf_weekday12_stop_shset, classId);
			//(상온)화목토 정지시간2 설정
			var tf_weekday22_stop_shset = $("input[class='T02009_tf_weekday22_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday22_stop_shset']").attr('class');
			driveTime(tf_weekday22_stop_shset, classId);
			//(상온)일요일 정지시간2 설정
			var tf_sun2_stop_shset = $("input[class='T02009_tf_sun2_stop_shset']").val();
			var classId = $("input[class='T02009_tf_sun2_stop_shset']").attr('class');
			driveTime(tf_sun2_stop_shset, classId);
			
			//(상온)월수금 운전시간3 설정
			var tf_weekday13_runnig_shset = $("input[class='T02009_tf_weekday13_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday13_runnig_shset']").attr('class');
			driveTime(tf_weekday13_runnig_shset, classId);
			//(상온)화목토 운전시간3 설정
			var tf_weekday23_runnig_shset = $("input[class='T02009_tf_weekday23_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday23_runnig_shset']").attr('class');
			driveTime(tf_weekday23_runnig_shset, classId);
			//(상온)일요일 운전시간3 설정
			var tf_sun3_running_shset = $("input[class='T02009_tf_sun3_running_shset']").val();
			var classId = $("input[class='T02009_tf_sun3_running_shset']").attr('class');
			driveTime(tf_sun3_running_shset, classId);
			//(상온)월수금 정지시간3 설정
			var tf_weekday13_stop_shset = $("input[class='T02009_tf_weekday13_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday13_stop_shset']").attr('class');
			driveTime(tf_weekday13_stop_shset, classId);
			//(상온)화목토 정지시간3 설정
			var tf_weekday23_stop_shset = $("input[class='T02009_tf_weekday23_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday23_stop_shset']").attr('class');
			driveTime(tf_weekday23_stop_shset, classId);
			//(상온)일요일 정지시간3 설정
			var tf_sun3_stop_shset = $("input[class='T02009_tf_sun3_stop_shset']").val();
			var classId = $("input[class='T02009_tf_sun3_stop_shset']").attr('class');
			driveTime(tf_sun3_stop_shset, classId);
			
			//(상온)월수금 운전시간4 설정
			var tf_weekday14_runnig_shset = $("input[class='T02009_tf_weekday14_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday14_runnig_shset']").attr('class');
			driveTime(tf_weekday14_runnig_shset, classId);
			//(상온)화목토 운전시간4 설정
			var tf_weekday24_runnig_shset = $("input[class='T02009_tf_weekday24_runnig_shset']").val();
			var classId = $("input[class='T02009_tf_weekday24_runnig_shset']").attr('class');
			driveTime(tf_weekday24_runnig_shset, classId);
			//(상온)일요일 운전시간4 설정
			var tf_sun4_running_shset = $("input[class='T02009_tf_sun4_running_shset']").val();
			var classId = $("input[class='T02009_tf_sun4_running_shset']").attr('class');
			driveTime(tf_sun4_running_shset, classId);
			//(상온)월수금 정지시간4 설정
			var tf_weekday14_stop_shset = $("input[class='T02009_tf_weekday14_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday14_stop_shset']").attr('class');
			driveTime(tf_weekday14_stop_shset, classId);
			//(상온)화목토 정지시간4 설정
			var tf_weekday24_stop_shset = $("input[class='T02009_tf_weekday24_stop_shset']").val();
			var classId = $("input[class='T02009_tf_weekday24_stop_shset']").attr('class');
			driveTime(tf_weekday24_stop_shset, classId);
			//(상온)일요일 정지시간4 설정
			var tf_sun4_stop_shset = $("input[class='T02009_tf_sun4_stop_shset']").val();
			var classId = $("input[class='T02009_tf_sun4_stop_shset']").attr('class');
			driveTime(tf_sun4_stop_shset, classId);
			
			setTimeout("settingScheduelPopupValue('"+id+"','"+componentId+"')",2000);
			break;
		case '#time_set':
			var componentId = $("input[name=shComponentId]").val();
			
			var time = $("input[class=T02009_"+componentId+"]").val();
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
			json.tagId =  $("#tagForm input[class=T02009_" + shComponentId+"_hour_shset]").attr("id");
			console.log(json.tagId);
			var plcNo = $("#tagForm input[class=T02009_" + shComponentId+"_hour_shset]").attr("plcno");		// 제어 PLC번호
			console.log(plcNo);
			var shhour = $("#shhour option:selected").val();
			if(shhour < 10){
				shhour = "0"+shhour;
			}
			json.value = shhour;
			array.push(json);
			
			json = new Object();
			json.tagId =  $("#tagForm input[class=T02009_" + shComponentId+"_time_shset]").attr("id");
			console.log(json.tagId);
			var plcNo = $("#tagForm input[class=T02009_" + shComponentId+"_time_shset]").attr("plcno");		// 제어 PLC번호
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
			json.tagId =  $("#tagForm input[class=T02009_" + shComponentId+"]").attr("id");
			var plcNo = $("#tagForm input[class=T02009_"+shComponentId +"]").attr("plcno");		// 제어 PLC번호
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
		json.tagId =  $("#tagForm input[class='T02009_plc_time_send']").attr("id");
		var plcNo = $("#tagForm input[class='T02009_plc_time_send']").attr("plcno");
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
	/* function checkDoublePipe() {
		var brine1_in_temp = $("input[class='E35501_brine1_in_temp']").val();
		console.log(brine1_in_temp);
	} */
</script>

<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
		<dl class="left">
			<dt><span class="icon_set sys">시스템 상태</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">시스템운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02009_system_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">축냉운전모드</span>
						<div class="switch off" id="T02009_storagetank_drive">
							<span class="stop">해제</span>
							<span class="start">선택</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">방냉운전모드</span>
						<div class="switch off" id="T02009_icestorage_drive">
							<span class="stop">해제</span>
							<span class="start">선택</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">동시운전모드</span>
						<div class="switch off" id="T02009_parall_drive">
							<span class="stop">해제</span>
							<span class="start">선택</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">냉단운전모드</span>
						<div class="switch off" id="T02009_single_drive">
							<span class="stop">해제</span>
							<span class="start">선택</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">자동운전모드</span>
						<div class="switch off" id="T02009_auto_drive">
							<span class="stop">해제</span>
							<span class="start">선택</span>
							<em></em>
						</div>
					</li>
				</ul>
			</dd>
		</dl>
		
		<dl class="right">
			<dt><span class="icon_set set">축열조 설정</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">축냉종료 온도설정</span>
						<a href="javascript:openLayerPop('#layerPop_type3','T02009','heatstorage_temp_set');" class="font_purple setPop"><span id="T02009_heatstorage_temp_set"></span> <span class="font_yellow">℃</span></a>
					</li>
					<li>
						<span class="tit"><a href="javascript:openLayerPop('#layerPop_type10','T02009','storagetank');">축냉완료</a></span>
						<span class="lamp off" id="T02009_heatstorage_end"></span>
						<span id="T02009_heatstorage_end_text">해지</span>
					</li>
					<li>
						<span class="tit"><a href="javascript:openScheduelPopup('#layerPop_type500','schdeuel');">빙축열 스케줄설정</a></span>&nbsp;
					</li>
				</ul>
			</dd>
		</dl>
		
		<dl class="right">
			<dt><span class="icon_set set">상온냉동기 설정</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit"><a href="javascript:openLayerPop('#layerPop_type1','E35501', 'tempfridge');">상온냉동기</a></span>
						<span class="lamp off" id="E35501_tempfridge"></span>
						<span id="E35501_tempfridge_text">상온정지</span>
					</li>
					<li>
						<span class="tit"><a href="javascript:openScheduelPopup('#layerPop_type502','tf_schdeuel');">상온 스케줄설정</a></span>&nbsp;
					</li>
				</ul>
			</dd>
		</dl>
		<div class="both"></div>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>온도 제어설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">냉수1 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','cool1_temp_set');" class="font_purple setPop" ><span id="T02009_cool1_temp_set"> </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉수2 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','cool2_temp_set');" class="font_purple setPop" ><span id="T02009_cool2_temp_set"> </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각수1 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','coolwater1_temp_set');" class="font_purple setPop" ><span id="T02009_coolwater1_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑1 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','coolwater1_devia_set');" class="font_purple setPop" ><span id="T02009_coolwater1_devia_set"> </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각수2 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','coolwater2_temp_set');" class="font_purple setPop" ><span id="T02009_coolwater2_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑2 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','coolwater2_devia_set');" class="font_purple setPop" ><span id="T02009_coolwater2_devia_set"> </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각수3 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','coolwater3_temp_set');" class="font_purple setPop" ><span id="T02009_coolwater3_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑3 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','coolwater3_devia_set');" class="font_purple setPop" ><span id="T02009_coolwater3_devia_set"> </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">열교환기 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','heatchange_temp_set');" class="font_purple setPop" ><span id="T02009_heatchange_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">단독운전 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','single_temp_set');" class="font_purple setPop" ><span id="T02009_single_temp_set"> </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기1요청 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','fridge1_temp_set');" class="font_purple setPop" ><span id="T02009_fridge1_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기2요청 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','fridge2_temp_set');" class="font_purple setPop" ><span id="T02009_fridge2_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
							
						</tr>
						<tr>
							<th scope="row">동파방지 온도설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','freeze_temp_set');" class="font_purple setPop" ><span id="T02009_freeze_temp_set"> </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">방냉종료 설정온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02009','icestorage_set_temp');" class="font_purple setPop" ><span id="T02009_icestorage_set_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>

	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set chart">열량 관리</span></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="28%">
					<col width="*">
					<col width="28%">
					<col width="*">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">냉동기 #1 순시열량</th>
							<td class="font_yellow"><span id="T02009_inspect_fridge1_heat"></span>  USRT</td>
							<th scope="row">냉동기 #2 순시열량</th>
							<td class="font_yellow"><span id="T02009_inspect_fridge2_heat"></span> USRT</td>
						</tr>
						<tr>
							<th scope="row">열교환기 #1 순시열량</th>
							<td class="font_yellow"><span id="T02009_inspect_hex1_heat"></span> USRT</td>
							<th scope="row">열교환기 #2 순시열량</th>
							<td class="font_yellow"><span id="T02009_inspect_hex2_heat" ></span> USRT</td>
						</tr>
						<tr>
							<th scope="row">냉동기 #3 순시열량</th>
							<td class="font_yellow"><span id="T02009_inspect_fridge3_heat"></span> USRT</td>
							<th scope="row">축냉순시열량</th>
							<td class="font_yellow"><span id="T02009_inspect_storagetank_heat"></span> USRT</td>
						</tr>
						<tr>
							<th scope="row">방냉순시열량</th>
							<td class="font_yellow"><span id="T02009_inspect_icestorage_heat" ></span> USRT</td>
							<th scope="row"></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set danger">경보</span>
				<div class="head_right">
					<a href="javascript:moveAlarm('prev');" class="btn_next pre"><span class="blind">이전페이지</span></a>
					<a href="javascript:moveAlarm('next');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
										<c:when test="${count > 18}">
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
<!-- e : data_area -->

<!--경부선 빙축열 스케줄링  -->
		<div class="popup_container type3" id="layerPop_type500">
		<div class="popup_inner">
			<div class="popup_header"><h2>빙축열 스케줄 설정</h2></div> 
			<div class="popup_body">
				<div class="popup_content">
  			 			
					<div class="main_content">
					
						<!-- s: table wrap-->
						<div>
							<table class="pop_row">
								<colgroup>
									<col width="*" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<tbody>
									<tr>
										<th>요일선택</th>
										<td colspan="4">
											<input type="checkbox" id="schedule_mon" name="scheduleWeek"/><label for="scheduleMon">월</label>
											<input type="checkbox" id="schedule_tues" name="scheduleWeek" class="ml20"/><label for="scheduleTues">화</label>
											<input type="checkbox" id="schedule_wed" name="scheduleWeek" class="ml20"/><label for="scheduleWed">수</label>
											<input type="checkbox" id="schedule_thur" name="scheduleWeek" class="ml20"/><label for="scheduleThur">목</label>
											<input type="checkbox" id="schedule_fri" name="scheduleWeek" class="ml20"/><label for="scheduleFri">금</label>
											<input type="checkbox" id="schedule_sat" name="scheduleWeek" class="ml20"/><label for="scheduleSat" class="font_blue">토</label>
											<input type="checkbox" id="schedule_sun" name="scheduleWeek" class="ml20"/><label for="scheduleSun" class="font_red">일</label>
										</td>
									</tr>
									<tr>
										<th>시간설정</th>
										<td>월 ~ 금요일</td>
										<td class="font_blue">토요일</td>
										<td class="font_red">일요일</td>
										<td>축냉시간설정</td>
									</tr>
									<tr>
										<th>운전시간1</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','weekday1_runnig_shset');"><span id="T02009_weekday1_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sat1_running_shset');"><span id="T02009_sat1_running_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sun1_running_shset');"><span id="T02009_sun1_running_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','heatstorage_drive_time_shset');"><span id="T02009_heatstorage_drive_time_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간1</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','weekday1_stop_shset');"><span id="T02009_weekday1_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sat1_stop_shset');"><span id="T02009_sat1_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sun1_stop_shset');"><span id="T02009_sun1_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','heatstorage_stop_time_shset');"><span id="T02009_heatstorage_stop_time_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>운전시간2</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','weekday2_runnig_shset');"><span id="T02009_weekday2_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sat2_running_shset');"><span id="T02009_sat2_running_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sun2_running_shset');"><span id="T02009_sun2_running_shset">0000</span></a></td>
										<td></td>
									</tr>
									<tr>
										<th>정지시간2</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','weekday2_stop_shset');"><span id="T02009_weekday2_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sat2_stop_shset');"><span id="T02009_sat2_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sun2_stop_shset');"><span id="T02009_sun2_stop_shset">0000</span></a></td>
										<td><!-- 야간방냉설정 --></td>
									</tr>
									<tr>
										<th>운전시간3</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','weekday3_runnig_shset');"><span id="T02009_weekday3_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sat3_running_shset');"><span id="T02009_sat3_running_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sun3_running_shset');"><span id="T02009_sun3_running_shset">0000</span></a></td>
										<td><!-- <a href="#time_set" name="alert"><span id="">0000</span></a> --></td>
									</tr>
									<tr>
										<th>정지시간3</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','weekday3_stop_shset');"><span id="T02009_weekday3_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sat3_stop_shset');"><span id="T02009_sat3_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','sun3_stop_shset');"><span id="T02009_sun3_stop_shset">0000</span></a></td>
										<td><!-- <a href="#time_set" name="alert"><span id="">0000</span></a> --></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<!-- <td colspan="3">
											PLC 현재시간 <a href="javascript:openScheduelPopup2('#time_set','plc');"><span id="T02009_plc_hour_shset">15</span>:<span id="T02009_plc_time_shset">29</span></a>
											<a class="btnType btn_type03" href="javascript:updateCurrentTime();">전송</a>
										</td>
										<td colspan="2">PLC 현재시간 <span id="T02009_plc_current_hour">00</span>:<span id="T02009_plc_current_time">00</span></td> -->
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

<!--경부선 상온 스케줄링  -->
	<div class="popup_container type3" id="layerPop_type502">
		<div class="popup_inner">
			<div class="popup_header"><h2>상온냉동기 스케줄 설정</h2></div> 
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
											<input type="checkbox" id="tf_schedule_mon" name="scheduleWeek"/><label for="tf_schedule_mon">월</label>
											<input type="checkbox" id="tf_schedule_tues" name="scheduleWeek" class="ml20"/><label for="tf_schedule_tues">화</label>
											<input type="checkbox" id="tf_schedule_wed" name="scheduleWeek" class="ml20"/><label for="tf_schedule_wed">수</label>
											<input type="checkbox" id="tf_schedule_thur" name="scheduleWeek" class="ml20"/><label for="tf_schedule_thur">목</label>
											<input type="checkbox" id="tf_schedule_fri" name="scheduleWeek" class="ml20"/><label for="tf_schedule_fri">금</label>
											<input type="checkbox" id="tf_schedule_sat" name="scheduleWeek" class="ml20"/><label for="tf_schedule_sat" class="font_blue">토</label>
											<input type="checkbox" id="tf_schedule_sun" name="scheduleWeek" class="ml20"/><label for="tf_schedule_sun" class="font_red">일</label>
										</td>
									</tr>
									<tr>
										<th>시간설정</th>
										<td>월/수/금</td>
										<td>화/목/토</td>
										<td class="font_red">일요일</td>
									</tr>
									<tr>
										<th>운전시간1</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday11_runnig_shset');"><span id="T02009_tf_weekday11_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday21_runnig_shset');"><span id="T02009_tf_weekday21_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun1_running_shset');"><span id="T02009_tf_sun1_running_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간1</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday11_stop_shset');"><span id="T02009_tf_weekday11_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday21_stop_shset');"><span id="T02009_tf_weekday21_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun1_stop_shset');"><span id="T02009_tf_sun1_stop_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>운전시간2</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday12_runnig_shset');"><span id="T02009_tf_weekday12_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday22_runnig_shset');"><span id="T02009_tf_weekday22_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun2_running_shset');"><span id="T02009_tf_sun2_running_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간2</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday12_stop_shset');"><span id="T02009_tf_weekday12_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday22_stop_shset');"><span id="T02009_tf_weekday22_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun2_stop_shset');"><span id="T02009_tf_sun2_stop_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>운전시간3</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday13_runnig_shset');"><span id="T02009_tf_weekday13_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday23_runnig_shset');"><span id="T02009_tf_weekday23_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun3_running_shset');"><span id="T02009_tf_sun3_running_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간3</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday13_stop_shset');"><span id="T02009_tf_weekday13_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday23_stop_shset');"><span id="T02009_tf_weekday23_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun3_stop_shset');"><span id="T02009_tf_sun3_stop_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>운전시간4</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday14_runnig_shset');"><span id="T02009_tf_weekday14_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday24_runnig_shset');"><span id="T02009_tf_weekday24_runnig_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun4_running_shset');"><span id="T02009_tf_sun4_running_shset">0000</span></a></td>
									</tr>
									<tr>
										<th>정지시간4</th>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday14_stop_shset');"><span id="T02009_tf_weekday14_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_weekday24_stop_shset');"><span id="T02009_tf_weekday24_stop_shset">0000</span></a></td>
										<td><a href="javascript:openScheduelPopup2('#time_set','tf_sun4_stop_shset');"><span id="T02009_tf_sun4_stop_shset">0000</span></a></td>
									</tr>
								</tbody>
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
            		('확인' 후 값 변경에 지연시간이 발생할수 있습니다.)
            	</div>
            	
				<div class="pop_btn_wrap">
					<a class="pop_btn btn_type02" href="javascript:updateTimeSet();">확인</a>
				</div>
            </dd>
        </dl>
        <a href="" class="closePop3"><span class="blind">닫기</span></a>
	</div>
	<!--// 시간설정팝업 -->