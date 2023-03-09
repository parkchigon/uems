// groupID & 설비명 매핑
var map = new Map();
map.set("cooltower1_1", "냉각탑 #1-1");
map.set("cooltower1_2", "냉각탑 #1-2");
map.set("cooltower2_1", "냉각탑 #2-1");
map.set("cooltower2_2", "냉각탑 #2-2");
map.set("cooltower3_1", "냉각탑 #3-1");
map.set("cooltower3_2", "냉각탑 #3-2");
map.set("cooltower4_1", "냉각탑 #4-1");
map.set("cooltower4_2", "냉각탑 #4-2");
map.set("coolpump1", "냉각수펌프 #1");
map.set("coolpump2", "냉각수펌프 #2");
map.set("coolpump3", "냉각수펌프 #3");
map.set("coolpump4", "냉각수펌프 #4");
map.set("coolpumpsb", "냉각수펌프 SB");
map.set("coolpump5", "냉각수펌프#5");
map.set("fridge1", "냉동기 #1");
map.set("fridge2", "냉동기 #2");
map.set("fridge3", "냉동기 #3");
map.set("fridge4", "냉동기 #4");
map.set("brinepump1", "브라인펌프 #1");
map.set("brinepump2", "브라인펌프 #2");
map.set("brinepump3", "브라인펌프 #3");
map.set("brinepumpsb", "브라인펌프 SB");
map.set("coolwaterpump1", "냉수펌프 #1");
map.set("coolwaterpump2", "냉수펌프 #2");
map.set("coolwaterpump3", "냉수펌프 #3");
map.set("coolwaterpump4", "냉수펌프 SB");
map.set("storagetankpump1", "축냉펌프 #1");
map.set("storagetankpump2", "축냉펌프 #2");
map.set("storagetankpump3", "축냉펌프 #3");
map.set("storagetankpump4", "축냉펌프 #4");
map.set("icestoragepump1", "방냉펌프 #1");
map.set("icestoragepump2", "방냉펌프 #2");
map.set("icestoragepump3", "방냉펌프 #3");
map.set("icestoragepump4", "방냉펌프 #4");
map.set("coolwaterpump1_store", "냉수펌프 백화점 #1");
map.set("coolwaterpump2_store", "냉수펌프 백화점 #2");
map.set("coolwaterpump3_store", "냉수펌프 백화점 #3");
map.set("coolwaterpumpsb_store", "냉수펌프 백화점 SB");
map.set("coolwaterpump1_terminal", "냉수펌프 터미널 #1");
map.set("coolwaterpump2_terminal", "냉수펌프 터미널 #2");
map.set("coolwaterpump3_terminal", "냉수펌프 터미널 #3");
map.set("coolwaterpumpsb_terminal", "냉수펌프 터미널 SB");
map.set("mv1a", "MV1A");
map.set("mv1b", "MV1B");
map.set("mv1c", "MV1C");
map.set("mv2a", "MV2A");
map.set("mv2b", "MV2B");
map.set("mv2c", "MV2C");
map.set("mv3a", "MV3A");
map.set("mv3b", "MV3B");
map.set("mv3c", "MV3C");
map.set("mv3d", "MV3D");
map.set("mv4a", "MV4A");
map.set("mv4b", "MV4B");
map.set("mv4c", "MV4C");
map.set("mv1", "MV1");
map.set("mv2", "MV2");
map.set("mv3", "MV3");
map.set("mv4", "MV4");
map.set("mv5", "MV5");
map.set("mv6", "MV6");
map.set("cooltower1", "냉각탑 #1");
map.set("cooltower2", "냉각탑 #2");
map.set("cooltower3", "냉각탑 #3");
map.set("hex1", "HEX #1");
map.set("hex2", "HEX #2");
map.set("hex3", "HEX #3");
map.set("cool_storage_fridge_set", "냉동기 축냉 대수제어 교번사용");
map.set("storagetank_pump_main", "냉동기 축냉펌프 메인");
map.set("storagetank_pump_pre", "냉동기 축냉펌프 예비");
map.set("boiler", "보일러");
map.set("boilerpump_main", "난방순환펌프 메인");
map.set("boilerpump_pre", "난방순환펌프 예비");
map.set("coolwaterpump_main", "냉수펌프 메인");
map.set("coolwaterpump_pre", "냉수펌프 예비");
map.set("storagetankpump_main", "축냉펌프 메인");
map.set("storagetankpump_pre", "축냉펌프 예비");
map.set("icestoragepump_main", "방냉펌프 메인");
map.set("icestoragepump_pre", "방냉펌프 예비");
map.set("coolpump_main", "냉각수펌프 메인");
map.set("coolpump_pre", "냉각수펌프 예비");
map.set("brinepump_main", "브라인펌프 메인");
map.set("brinepump_pre", "브라인펌프 예비");
map.set("cooltower_main", "냉각탑 메인");
map.set("cooltower_pre", "냉각탑 예비");
map.set("cooltower", "냉각탑");
map.set("store1", "백화점 #1");
map.set("store2", "백화점 #2");
map.set("store3", "백화점 #3");
map.set("terminal1", "터미널 #1");
map.set("terminal2", "터미널 #2");
map.set("terminal3", "터미널 #3");
map.set("icestorage_non_auto_control", "방냉인버터 통합 수동 제어 사용");
map.set("mv3_valv_control", "MV3 통합 밸브 제어 사용");
map.set("cooltower1_1_night_run_temp", "냉각탑 1-1 야간 기동 설정값");
map.set("cooltower2_1_night_run_temp", "냉각탑 2-1 야간 기동 설정값");
map.set("cooltower3_1_night_run_temp", "냉각탑 3-1 야간 기동 설정값");
map.set("cooltower1_1_night_stop_temp", "냉각탑 1-1 야간 정지 설정값");
map.set("cooltower2_1_night_stop_temp", "냉각탑 2-1 야간 정지 설정값");
map.set("cooltower3_1_night_stop_temp", "냉각탑 3-1 야간 정지 설정값");
map.set("cooltower1_2_night_run_temp", "냉각탑 1-2 야간 기동 설정값");
map.set("cooltower2_2_night_run_temp", "냉각탑 2-2 야간 기동 설정값");
map.set("cooltower3_2_night_run_temp", "냉각탑 3-2 야간 기동 설정값");
map.set("cooltower1_2_night_stop_temp", "냉각탑 1-2 야간 정지 설정값");
map.set("cooltower2_2_night_stop_temp", "냉각탑 2-2 야간 정지 설정값");
map.set("cooltower3_2_night_stop_temp", "냉각탑 3-2 야간 정지 설정값");
map.set("cooltower1_1_day_run_temp", "냉각탑 1-1 주간 기동 설정값");
map.set("cooltower2_1_day_run_temp", "냉각탑 2-1 주간 기동 설정값");
map.set("cooltower3_1_day_run_temp", "냉각탑 3-1 주간 기동 설정값");
map.set("cooltower1_1_day_stop_temp", "냉각탑 1-1 주간 정지 설정값");
map.set("cooltower2_1_day_stop_temp", "냉각탑 2-1 주간 정지 설정값");
map.set("cooltower3_1_day_stop_temp", "냉각탑 3-1 주간 정지 설정값");
map.set("cooltower1_2_day_run_temp", "냉각탑 1-2 주간 기동 설정값");
map.set("cooltower2_2_day_run_temp", "냉각탑 2-2 주간 기동 설정값");
map.set("cooltower3_2_day_run_temp", "냉각탑 3-2 주간 기동 설정값");
map.set("cooltower1_2_day_stop_temp", "냉각탑 1-2 주간 정지 설정값");
map.set("cooltower2_2_day_stop_temp", "냉각탑 2-2 주간 정지 설정값");
map.set("cooltower3_2_day_stop_temp", "냉각탑 3-2 주간 정지 설정값");



// ems 로그아웃
function emsLogout() {
	opener.location.href = "/login/logout.do";
	window.close();
}

// 현재 시간 
function printClock() {
    var currentDate = new Date();
    var week = new Array('일','월','화','수','목','금','토');
    
    var calendar = currentDate.getFullYear() + "/" + addZeros(currentDate.getMonth()+1,2) + "/" + addZeros(currentDate.getDate(),2); 	// 현재 날짜
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes(),2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    // 2017/03/13(월) 09:00:00
    $("#clock").html(calendar + "(" + week[currentDate.getDay()]+ ") " + currentHours+":"+currentMinute+":"+currentSeconds);
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

//자릿수 맞춰주기
function addZeros(num, digit) { 
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

// EMS 메인화면 TAB 선택
function emsMainTab(submenuId) {
	if(submenuId == 'SYS01') {
		location.href = "/ems/system/emsMain.do";
	} else if(submenuId == 'SYS04') {	// 냉동기A
		location.href = "/ems/system/fridgeA.do";
	} else if(submenuId == 'SYS05') {	// 보일러
		location.href = "/ems/system/boiler.do";
	} else if(submenuId == 'SYS06') {	// 열량
		location.href = "/ems/system/heat.do";
	} else if(submenuId == 'SYS07') {	// 흡수식냉동기
		location.href = "/ems/system/absorbFridge.do";
	} else if(submenuId == 'SYS08') {	// 냉동기B
		location.href = "/ems/system/fridgeB.do";
	} else if(submenuId == 'SYS09') {	// 상온냉동기
		location.href = "/ems/system/roomtempFridge.do";
	} else if(submenuId == 'SYS10') {	// 상온냉동기
		location.href = "/ems/system/absorbFridgeB.do";
	} else if(submenuId == 'SYS11') {	// 상온냉동기
		location.href = "/ems/system/absorbFridgeC.do";
	} else if(submenuId == 'SYS12') {	// 상온냉동기
		location.href = "/ems/system/fridgeC.do";
	}
}

// 로그인 확인 팝업 open
function openStartPop() {
	var id = $('#startPop');

	var maskHeight = $(document).height();
	var maskWidth = $(document).width();
	
	$('#startMask').css({'width':maskWidth,'height':maskHeight});

	$('#startMask').fadeIn(200);
	$('#startMask').fadeTo("fast", 0.7);

	var winH = $(window).height();
	var winW = $(window).width();
	var scrollTop = $(window).scrollTop();

	$(id).css('top', winH/2-$(id).height()/2+scrollTop);
	$(id).css('left', winW/2-$(id).width()/2);

	//$(".layerPop").hide();
	$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
}

// 레이어팝업 호출
function openLayerPop(id, templateId, groupId) {
	
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
	settingPopupValue(id, templateId, groupId);
}

// masking 처리 유지되는 팝업 호출
function openMaskPopup(id) {
	var maskHeight = $(document).height();
	var maskWidth = $(document).width();

	$('#startMask').css({'width':maskWidth,'height':maskHeight});

	$('#startMask').fadeIn(200);
	$('#startMask').fadeTo("fast", 0.7);

	var winH = $(window).height();
	var winW = $(window).width();
	var scrollTop = $(window).scrollTop();

	$(id).css('top', winH/2-$(id).height()/2+scrollTop);
	$(id).css('left', winW/2-$(id).width()/2);

	$(".popup_container").hide();
	$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
}

//layer 팝업 close
function closeLayerPopup() {
	$('#mask').hide();
	$('.alertPop').hide();
	$('.popup_container').hide();	
}

// masking 처리 유지되는 팝업 close
function closeMaskPopup() {
	$('#startMask').hide();
	$('.popup_container').hide();
}

// 팝업 value 세팅
function settingPopupValue(id, templateId, groupId) {
	
	$("input[name=groupId]").val(groupId);
	$("input[name=templateId]").val(templateId);
	$("input[name=layerIdId]").val(id);
	
	switch (id) {
	
	// 자동/수동, 운전/정지
	case '#layerPop_type1':
		$(id+' input:radio[name=autoYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val()+']').attr("checked", true);	// 자동/수동	
		var value = $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").val();
		if(value == 1) {	// 운전/정지
			$(id+" div[id=runYn]").find('.start').show();
			$(id+" div[id=runYn]").find('.stop').hide();
			$(id+" div[id=runYn]").removeClass('off').addClass('on');
		} else if(value == 0) {
			$(id+" div[id=runYn]").find('.stop').show();
			$(id+" div[id=runYn]").find('.start').hide();
			$(id+" div[id=runYn]").removeClass('on').addClass('off');
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		// '자동/수동' 선택 시 자동일 경우에 운전/정지 disabled 처리 추가 필요
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val();
		if(value == 0){	// 자동일 경우
			$(id+" div[id=runYn]").addClass('disabled');
		} else if(value == 1) {	// 수동일 경우
			$(id+" div[id=runYn]").removeClass('disabled');
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		// 경부선
		if(templateId == 'E35501'){
			$(id+" h2").text("");
			if(groupId == 'coolwaterpump1'){
				$(id+" h2").text("빙축열 냉수펌프 #1");
			} else if(groupId == 'coolwaterpump2'){
				$(id+" h2").text("빙축열 냉수펌프 #2");
			} else if(groupId == 'coolwaterpumpsb'){
				$(id+" h2").text("빙축열 냉수펌프 SB");
			} else if(groupId == 'coolwaterpump4'){
				$(id+" h2").text("상온 냉수펌프 #1");
			} else if(groupId == 'coolwaterpump5'){
				$(id+" h2").text("상온 냉수펌프 #2");
			} else if(groupId == 'fridge3'){
				$(id+" h2").text("상온냉동기");
			} else if(groupId == 'tempfridge'){
				$(id+" h2").text("상온냉동기 전체기동");
			} else if(groupId == 'coolpump1'){
				$(id+" h2").text("빙축열 냉각수펌프 #1");
			} else if(groupId == 'coolpump2'){
				$(id+" h2").text("빙축열 냉각수펌프 #2");
			} else if(groupId == 'coolpumpsb'){
				$(id+" h2").text("빙축열 냉각수펌프 SB");
			} else if(groupId == 'coolpump4'){
				$(id+" h2").text("상온 냉각수펌프 #1");
			} else if(groupId == 'coolpump5'){
				$(id+" h2").text("상온 냉각수펌프 #2");
			} else if(groupId == 'brinepump1'){
				$(id+" h2").text("브라인펌프 #1");
			} else if(groupId == 'brinepump1'){
				$(id+" h2").text("브라인펌프 #1");
			} else if(groupId == 'brinepump2'){
				$(id+" h2").text("브라인펌프 #2");
			} else if(groupId == 'brinepumpsb'){
				$(id+" h2").text("브라인펌프 SB");
			} else if(groupId == 'cooltower1'){
				$(id+" h2").text("냉각탑#1");
			} else if(groupId == 'cooltower2'){
				$(id+" h2").text("냉각탑#2");
			} else if(groupId == 'cooltower3_1'){
				$(id+" h2").text("냉각탑#3-1");
			} else if(groupId == 'cooltower3_2'){
				$(id+" h2").text("냉각탑#3-2");
			}
		}else if(templateId == 'T11001'){
			$(id+" h2").text("");
			if(groupId == 'absorb_coolhotwater'){
				$(id+" h2").text("흡수식냉온수기");
			} else if(groupId == 'absorb_boiler1'){
				$(id+" h2").text("흡수식 보일러 #1");
			} else if(groupId == 'absorb_boiler2'){
				$(id+" h2").text("흡수식 보일러 #2");
			} else if(groupId == 'absorb_boiler3'){
				$(id+" h2").text("흡수식 보일러 #3");
			}
		}
		else{
			$(id+" h2").text(map.get(groupId));			
		}
		
		break;
	
	// 자동/수동, 설정값
	case '#layerPop_type2':
		$(id+' input:radio[name=autoYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val()+']').attr("checked", true);	// 자동/수동
		$(id+" #nonAutoOutput").val($("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]").val());
		// '자동/수동' 선택 시 자동일 경우에 설정값 disabled 처리 추가 필요
		var value = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val();
		if(value == 0){	// 자동일 경우
			$(id+" #nonAutoOutput").attr('disabled',true);
		} else if(value == 1) {	// 수동일 경우
			$(id+" #nonAutoOutput").attr('disabled',false);
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		$(id+" h2").text(map.get(groupId));
		$(id+" #minValue").text($("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]").attr("min"));
		$(id+" #maxValue").text($("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]").attr("max"));
		break;
	
	// 온도 및 설정값 (groupId : 해당 id 값 전부 다 넘길것)
	case '#layerPop_type3':
		if(map.get(groupId) != null) {
			$(id+" h2").text(map.get(groupId));	
		} else {
			$(id+" h2").text("설정값");	
		}
		$(id+" #output").val($("#tagForm input[class="+templateId+"_"+groupId+"]").val());
		$(id+" #minValue").text($("#tagForm input[class="+templateId+"_"+groupId+"]").attr("min"));
		$(id+" #maxValue").text($("#tagForm input[class="+templateId+"_"+groupId+"]").attr("max"));
		break;

	// 사용/미사용
	case '#layerPop_type4':
		$(id+" h2").text(map.get(groupId));
		if(groupId.indexOf("cooltower") < 0 && !groupId.endsWith("_control") && (groupId.startsWith("fridge") || groupId.startsWith("hex") 
				|| groupId.startsWith("store") || groupId.startsWith("terminal") || groupId.startsWith("cool") )) {
			$(id+' input:radio[name=useYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_select]").val()+']').attr("checked", true);
		} else {
			$(id+' input:radio[name=useYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_use]").val()+']').attr("checked", true);
		}
		
		break;
	
	// 누적 리셋
	case '#layerPop_type5':		// 냉동기 병렬시 압축기 설정(3개짜리)
	case '#layerPop_type6':		// 축냉완료 > 축열조 설정
	case '#layerPop_type8':
	case '#layerPop_type9':
	case '#layerPop_type12':	// 냉동기 병렬시 압축기 설정(2개짜리)
	case '#layerPop_type14':
	case '#layerPop_type15':
	case '#layerPop_type16':	// 냉동기 병렬시 압축기 설정(4개짜리)
	case '#layerPop_type17':
	case '#layerPop_type18':
	case '#layerPop_type19':	// 흡수식냉온수기 열량 리셋 (2개짜리)
	case '#layerPop_type20':	// 흡수식냉온수기 가동시간 리셋 (2개짜리)
	case '#layerPop_type21':	// 냉각수운전 선택
	case '#layerPop_type22':	// 축냉운전 선택
	case '#layerPop_type23':	// 방냉운전 선택
	case '#layerPop_type24':	// 냉수운전 선택
	case '#layerPop_type25':	// 상온냉각수 예비선택
	case '#layerPop_type26':	// 빙축열냉각수 예비선택
	case '#layerPop_type27':	// 브라인 예비선택
	case '#layerPop_type28':	// 빙축열냉수 예비선택
	case '#layerPop_type29':	// 상온냉수 예비선택
		var componentId = "";
		$(id+" div[class^=switch]").each(function() {
			componentId = $(this).attr("id");
			var value = $("#tagForm input[class="+templateId+"_"+componentId+"]").val();
			if (value == 1) {
				$("div[id="+ componentId +"]").find('.start').show();
				$("div[id="+ componentId +"]").find('.stop').hide();
				$("div[id="+ componentId +"]").removeClass('off').addClass('on');	
			} else if(value == 0) {
				$("div[id="+ componentId +"]").find('.stop').show();
				$("div[id="+ componentId +"]").find('.start').hide();
				$("div[id="+ componentId +"]").removeClass('on').addClass('off');
			} else {
				alert("값을 가져올 수 없습니다!");
			}
		});
		break;

	
	// 자동/수동, 운전/정지, 주간/야간	
	case '#layerPop_type7':
		$(id+' input:radio[name=autoYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val()+']').attr("checked", true);	// 자동/수동
		// disabled 체크
		var value = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val();
		if(value == 1) {	// 수동
			$(id+" div[id=runYn]").removeClass('disabled');
			$(id+" input[id=dayYn]").removeAttr('disabled');
			$(id+" input[id=nightYn]").removeAttr('disabled');
		} else if(value == 0) {	// 자동
			$(id+" div[id=runYn]").addClass('disabled',true);
			$(id+" input[id=dayYn]").attr('disabled',true);
			$(id+" input[id=nightYn]").attr('disabled',true);
		} else {
			alert("'자동/수동'값을 가져올 수 없습니다!");
		}
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").val();
		if(value == 1) {	// 운전
			$(id+" div[id=runYn]").find('.start').show();
			$(id+" div[id=runYn]").find('.stop').hide();
			$(id+" div[id=runYn]").removeClass('off').addClass('on');
		} else if(value == 0) {	// 정지
			$(id+" div[id=runYn]").find('.stop').show();
			$(id+" div[id=runYn]").find('.start').hide();
			$(id+" div[id=runYn]").removeClass('on').addClass('off');
		} else {
			alert("'기동/정지'값을 가져올 수 없습니다!");
		}
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_day_yn]").val();
		if(value == 1) { // 주간 ON
			$(id+" input[id=dayYn]").attr("checked", true);
		} else if(value == 0) { // 주간 OFF
			$(id+" input[id=dayYn]").attr("checked", false);
		} else {
			alert("'주간'값을 가져올 수 없습니다!");
		}
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_night_yn]").val();
		if(value == 1) {	// 야간 ON
			$(id+" input[id=nightYn]").attr("checked", true);
		} else if(value == 0) {	// 야간 OFF
			$(id+" input[id=nightYn]").attr("checked", false);
		} else {
			alert("'야간'값을 가져올 수 없습니다!");
		}
		$(id+" h2").text(map.get(groupId));
		break;
		
		
	// 축냉완료 > 축열량 설정
	case '#layerPop_type10':
		var componentId = "storagetank_set";
		var value = $("#tagForm input[class="+templateId+"_"+componentId+"]").val();
		$("#"+componentId).val(value);
		componentId = "storagetank_use_set";
		value = $("#tagForm input[class="+templateId+"_"+componentId+"]").val();
		if(value == 1) {
			$("div[id="+ componentId +"]").find('.start').show();
			$("div[id="+ componentId +"]").find('.stop').hide();
			$("div[id="+ componentId +"]").removeClass('off').addClass('on');					
		} else if(value == 0) {
			$("div[id="+ componentId +"]").find('.stop').show();
			$("div[id="+ componentId +"]").find('.start').hide();
			$("div[id="+ componentId +"]").removeClass('on').addClass('off');
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		break;
		
	// 자동/수동, 열림/닫힘
	case '#layerPop_type11':	
		$(id+' input:radio[name=autoYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val()+']').attr("checked", true);	// 자동/수동	
		var value = $("#tagForm input[class="+templateId+"_"+groupId+"_open_yn]").val();
		if(value == 1) {			// 열림
			$(id+" div[id=openYn]").find('.start').show();
			$(id+" div[id=openYn]").find('.stop').hide();
			$(id+" div[id=openYn]").removeClass('off').addClass('on');
		} else if(value == 0) {		// 담힘
			$(id+" div[id=openYn]").find('.stop').show();
			$(id+" div[id=openYn]").find('.start').hide();
			$(id+" div[id=openYn]").removeClass('on').addClass('off');
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		// '자동/수동' 선택 시 자동일 경우에 열림/닫힘 disabled 처리 추가 필요
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val();
		if(value == 0){			// 자동일 경우
			$(id+" div[id=openYn]").addClass('disabled');
		} else if(value == 1) {	// 수동일 경우
			$(id+" div[id=openYn]").removeClass('disabled');
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		$(id+" h2").text(map.get(groupId));
		break;	
		

		
	// 자동/수동, 운정/정지, 설정값
	case '#layerPop_type13':
		$(id+' input:radio[name=autoYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val()+']').attr("checked", true);	// 자동/수동
		if($("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").val() == 1) {	// 운전
			$(id+" div[id=runYn]").find('.start').show();
			$(id+" div[id=runYn]").find('.stop').hide();
			$(id+" div[id=runYn]").removeClass('off').addClass('on');			
		} else if($("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").val() == 0) {	// 정지
			$(id+" div[id=runYn]").find('.stop').show();
			$(id+" div[id=runYn]").find('.start').hide();
			$(id+" div[id=runYn]").removeClass('on').addClass('off');
		}
		$(id+" #nonAutoOutput").val($("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]").val()); //주파수설정값
		if($("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val() == 0) {		// 자동일 경우	
			$(id+" div[id=runYn]").addClass('disabled');
			$(id+" #nonAutoOutput").attr('disabled',true);
		} else if($("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val() == 1) {	// 수동일 경우
			$(id+" div[id=runYn]").removeClass('disabled');
			$(id+" #nonAutoOutput").attr('disabled',false);
		}
		$(id+" h2").text(map.get(groupId));
		$(id+" #minValue").text($("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]").attr("min"));
		$(id+" #maxValue").text($("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]").attr("max"));
		break;
	
		// 자동/수동, 운전/정지, 주간/야간	
	case '#layerPop_type30':
		$(id+' input:radio[name=autoYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val()+']').attr("checked", true);	// 자동/수동
		// disabled 체크
		var value = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").val();
		if(value == 1) {	// 수동
			$(id+" div[id=runYn]").removeClass('disabled');
			$(id+" input[id=dayYn]").removeAttr('disabled');
			$(id+" input[id=nightYn]").removeAttr('disabled');
		} else if(value == 0) {	// 자동
			$(id+" div[id=runYn]").addClass('disabled',true);
			$(id+" input[id=dayYn]").attr('disabled',true);
			$(id+" input[id=nightYn]").attr('disabled',true);
		} else {
			alert("'자동/수동'값을 가져올 수 없습니다!");
		}
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").val();
		if(value == 1) {	// 운전
			$(id+" div[id=runYn]").find('.start').show();
			$(id+" div[id=runYn]").find('.stop').hide();
			$(id+" div[id=runYn]").removeClass('off').addClass('on');
		} else if(value == 0) {	// 정지
			$(id+" div[id=runYn]").find('.stop').show();
			$(id+" div[id=runYn]").find('.start').hide();
			$(id+" div[id=runYn]").removeClass('on').addClass('off');
		} else {
			alert("'기동/정지'값을 가져올 수 없습니다!");
		}
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_day_yn]").val();
		if(value == 1) { // 야간 ON
			$(id+" input[id=dayYn]").attr("checked", false);
			$(id+" input[id=nightYn]").attr("checked", true);
		} else if(value == 0) { // 주간 OFF
			$(id+" input[id=dayYn]").attr("checked", true);
			$(id+" input[id=nightYn]").attr("checked", false);
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		$(id+" h2").text(map.get(groupId));
		break;

		// 경부선 흡수식냉온수기 냉/난방
	case '#layerPop_type31':
		if(templateId == 'T11001'){
			if(groupId == 'absorb_coolhotwater'){
				$(id+" h2").text("흡수식냉온수기");
			}
		}
		if(groupId.endsWith("_coolhotwater")) {
			$(id+' input:radio[name=useYn]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_heat_yn]").val()+']').attr("checked", true);
		}
		
		break;	
		
	
	// (경부선)냉동기 교번선택
	case '#layerPop_type32':
		// 선택(1)/해제(0)
		$(id+' input:radio[name=shift]:input[value='+$("#tagForm input[class="+templateId+"_"+groupId+"_shift]").val()+']').attr("checked", true);
		// 1호기/2호기
		value = $("#tagForm input[class="+templateId+"_"+groupId+"_turn]").val();
		if(value == 1) { // 2호기
			$(id+" input[id=unit1]").attr("checked", false);
			$(id+" input[id=unit2]").attr("checked", true);
		} else if(value == 0) { // 1호기
			$(id+" input[id=unit1]").attr("checked", true);
			$(id+" input[id=unit2]").attr("checked", false);
		} else {
			alert("값을 가져올 수 없습니다!");
		}
		
		break;
		
	}
}


// 태그 value 수정
function updateTagValue(request) {
	
	showLoading();
	
	$.ajax({
		url : "/ems/system/updateTagValueAjax.do",
		type: "POST",
		data: JSON.stringify(request),
		dataType : "json",
		contentType : "application/json"
	}).done( function(data) {
		hideLoading();
		var resultCode = data.resultCode;
		if(resultCode == "0000") {
			var list = data.resultList;
			if(list != null) {
				var tagIdArr = new Array();
				for(var i=0; i<list.length; i++) {
					if(list[i].successFlag != "Y") {
						tagIdArr.push(list[i].tagId);
					}
				}
				if(!isEmpty(tagIdArr)) {
					alert(tagIdArr + " 수정을 실패하였습니다.");
					closeLayerPopup();
				}
			}
		} else {
			alert("PLC Controller 연동 실패하였습니다.");
			closeLayerPopup();
		}
	});
}

// 로딩바 SHOW
function showLoading() {
	var id = $('.loading');

	var maskHeight = $(document).height();
	var maskWidth = $(document).width();

	$('#loading_mask').css({'width':maskWidth,'height':maskHeight});

	$('#loading_mask').fadeIn(200);
	$('#loading_mask').fadeTo("fast", 0.1);

	var winH = $(window).height();
	var winW = $(window).width();
	var scrollTop = $(window).scrollTop();

	$(id).css('top', winH/2-$(id).height()/2+scrollTop);
	$(id).css('left', winW/2-$(id).width()/2);

	$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
}

// 로딩바 HIDE
function hideLoading() {
	$('#loading_mask').hide();
	$('.loading').hide();
}

// 실시간 태그 값 조회
function selectTagValue() {
	var siteCd = $("#siteCd").val();
	$.ajax({
		url : "/ems/system/selectTagValueAjax.do",
		type: "POST",
		data: {siteCd : siteCd},
		dataType : "json",
		async : false
	}).done( function(data) {
		var list = data.tagList;
		// 통신여부 세팅
		//initSetFrequency(list);
		// 초기값 세팅
		initSetValue(list);
	});
	
	// TODO JAR 실시간데이터 설정한 밀리세컨드마다 한번씩 호출해야함
	setTimeout("selectTagValue()",1500);
}

// TODO JAR 테스트 위해서 잠시 masking 처리 제외
//통신여부 세팅
function initSetFrequency(list) {
	
	if(list.length > 0) {
		for (var i in list) {
			var regDate = list[0].regDate;
			var diffSec = list[i].diffSec;
			// 통신중인지 체크 (현재시간 과 등록일 +20 초 이상일 경우 통신이상으로 판단)
			if(isEmpty(regDate)) {
				fullMask();
			} else {
				//if(parseInt(regDate)+20 >= getDate()) {
				if(parseInt(diffSec) <= validConnIntervalSec) {
					$('#error_mask').hide();
					$('.error_text').hide();
				} else {
					fullMask();
				}
			}
			// 첫번째 태그로만 체크
			break;
		}
	} else {
		fullMask();
	}
}

// 실시간 알람 조회
function selectAlarmStatus(templateID) {
	var siteCd = $("#siteCd").val();
	$.ajax({
		url : "/ems/system/selectAlarmStatusAjax.do",
		type: "POST",
		data: {siteCd : siteCd},
		dataType : "json",
		async : false
	}).done( function(data) {
		var list = data.tagList;
		// 초기값 세팅
		initSetAlarmStatus(list);
	});
	
	// TODO JAR 실시간데이터 3초(3000)마다 한번씩 호출해야함
	setTimeout("selectAlarmStatus()",3000); 
}

// 초기값 세팅
function initSetValue(list) {

	if(list != null) {
		for(var i=0; i<list.length; i++) {
			// 태그-리스트 매핑 tagForm value 세팅
			$("#tagForm input[id="+list[i].tagId+"]").val(list[i].tagValue);
		}
	}

	var firstChk = true;
	var componentId = null;
	var tagId = null;
	var tagValue = null;
	var hsPercent = null;
	$("#tagForm input").each(function() {
		componentId = $(this).attr("class");
		tagId = $(this).attr("id");
		if (tagId.startsWith("UNIT_")) return true;
		tagValue = $(this).val();
		
		if (firstChk) {
			// 각 템플릿페이지별 중복파이프 체크
			checkDoublePipe();
			firstChk = false;
		}
		
		// 파이프
		if(componentId.includes("_pipe")) {
			if(tagValue == 1) {
				$("span[name="+ componentId +"]").addClass("on");
			} else {
				$("span[name="+ componentId +"]").removeClass("on");
			}
			return true;
		}
		
		// 축열조(축냉시/방냉시)
		if(componentId.endsWith("_state")) {
			if(tagValue == 0) {
				$("#"+ componentId).addClass("none");
			} else {
				$("#"+ componentId).removeClass("none");
			}
			return true;
		}
		
		if(componentId.endsWith("_alert")) {
			if(tagValue == 0) {
				
				$("#"+ componentId).removeClass("danger").addClass("nomal");
			} else {
				
				$("#"+ componentId).removeClass("nomal").addClass("danger");
			}
			
			return true;
		}
		
		// 온도, 퍼센트, 순시유량, 설정, 열량, 가동시간
		if(componentId.endsWith("_temp") 
			|| componentId.endsWith("_per") 
			|| componentId.endsWith("_flux") 
			|| componentId.endsWith("_set") 
			|| componentId.endsWith("_heat") 
			|| componentId.endsWith("_hour") 
			|| componentId.endsWith("_min") 
			|| componentId.endsWith("_delay")
			|| componentId.endsWith("_time") 
			|| componentId.endsWith("_cooling") 
			|| componentId.endsWith("_volt") 
			|| componentId.endsWith("_frequency")
			|| componentId.endsWith("_heatstorage") 
			|| componentId.indexOf("set_control") >= 0
			|| componentId.indexOf("inverter_control_set") >= 0
		) {
			if(!isEmpty(tagValue)) {
				if (componentId.indexOf("set_control") >= 0 || componentId.indexOf("inverter_control_set") >= 0) {
					// 단위 붙이기
					var unit = $("#tagForm div[id=UNIT_"+tagId+"]").attr("class");
					//console.log(unit);
					//$("span[id="+ componentId +"]").text(parseFloat(tagValue).toFixed(1));
					$("span[id="+ componentId +"]").text(tagValue);
					$("span[id=UNIT_"+ componentId +"]").text(unit);
				} else {
					//$("span[id="+ componentId +"]").text(parseFloat(tagValue).toFixed(1));
					$("span[id="+ componentId +"]").text(tagValue);
				}
			}
			if(componentId.endsWith("_heatstorage")){
				//$(".heat_storaging_tank").find("span").css("height",tagValue+"%");
				/*if (hsPercent==null) {
					if ($(this).attr("max")-$(this).attr("min") == 0) 
						hsPercent = 0;
					else 
						hsPercent = 100/($(this).attr("max")-$(this).attr("min"))*tagValue;
				}*/
				hsPercent = tagValue;
				if(hsPercent >= 100){
					hsPercent = 100;
				}
				//console.log(hsPercent);
				$(".heat_storaging_tank").find("span").css("height",hsPercent+"%");
			}
			return true;
		}
		
		// 자동/수동 : auto/direct 
		if(componentId.endsWith("_auto_yn")) {
			if(tagValue == 0) {
				$("span[id="+ componentId +"]").removeClass("direct").addClass("auto");
			} else {
				$("span[id="+ componentId +"]").removeClass("auto").addClass("direct");
			}
			return true;
		}
		
		// 가동/정지 span : on/off
		// coolpump : 냉각수펌프 / brinepumpsb : 브라운펌프 / coolwaterpump : 냉수펌프 / heatstorage_end : 축냉완료 / boilerpump : 보일러펌프
		if(componentId.includes("_coolpump") 
			|| componentId.includes("_brinepump") 
			|| componentId.includes("_coolwaterpump") 
			|| componentId.includes("_heatstorage_end")
			|| componentId.includes("_storagetankpump") 
			|| componentId.includes("_icestoragepump") 
			|| componentId.includes("_storagetank_end") 
			|| componentId.includes("_boilerpump")
		) {
			if(componentId.includes("_work_")){
				if(tagValue == 1) {
					$("div[id="+ componentId +"]").find('.start').show();
					$("div[id="+ componentId +"]").find('.stop').hide();
					$("div[id="+ componentId +"]").removeClass('off').addClass('on');
					//$("div[id="+ componentId +"]").prev('.lamp').removeClass('off').addClass('on');
				} else {
					$("div[id="+ componentId +"]").find('.stop').show();
					$("div[id="+ componentId +"]").find('.start').hide();
					$("div[id="+ componentId +"]").removeClass('on').addClass('off');
					//$("div[id="+ componentId +"]").prev('.lamp').removeClass('on').addClass('off');
				}
				return true;
			} else if(!componentId.endsWith("_yn") && !componentId.endsWith("_start")) {
				if(tagValue == 1) {
					$("span[id="+ componentId +"]").removeClass("off").addClass("on");
					// 축냉완료 해지/만빙
					if(componentId.includes("_heatstorage_end") || componentId.includes("_storagetank_end") ) {
						$("span[id="+ componentId +"_text]").text("만빙");
					}
				} else {
					$("span[id="+ componentId +"]").removeClass("on").addClass("off");
					// 축냉완료 해지/만빙
					if(componentId.includes("_heatstorage_end") || componentId.includes("_storagetank_end") ) {
						$("span[id="+ componentId +"_text]").text("해지");
					}
				}
				return true;
			}
		}

		// 방냉펌프 제어설정 > 사용/미사용
		if(componentId.endsWith("_icestorage_use")){
			if(tagValue == 1) {
				$("div[id="+ componentId +"]").find('.start').show();
				$("div[id="+ componentId +"]").find('.stop').hide();
				$("div[id="+ componentId +"]").removeClass('off').addClass('on');
				$("div[id="+ componentId +"]").prev('.lamp').removeClass('off').addClass('on');
			} else {
				$("div[id="+ componentId +"]").find('.stop').show();
				$("div[id="+ componentId +"]").find('.start').hide();
				$("div[id="+ componentId +"]").removeClass('on').addClass('off');
				$("div[id="+ componentId +"]").prev('.lamp').removeClass('on').addClass('off');
			}
			return true;
		}
		
		// 설정관리 > 냉각탑1,2,3 사용여부 
		if(componentId.startsWith("T")){
			if(componentId.endsWith("_use")) {
				if(tagValue == 1) {
					$("a[id="+ componentId +"]").removeClass("btn_disabled").addClass("btn_use");
					$("span[id="+ componentId +"_text]").text("사용");
				} else {
					$("a[id="+ componentId +"]").removeClass("btn_use").addClass("btn_disabled");
					$("span[id="+ componentId +"_text]").text("미사용");
				}
				return true;
			}
		}
		
		// 가동/정지 a태그 : on/off
		// cooltower : 냉각탑 / fridge : 냉동기, 상온흡수식냉동기, 상온터보냉동기 / ups_status : UPS
		if(componentId.includes("_cooltower") 
			|| componentId.includes("_fridge") 
			|| componentId.includes("_ups_status") 
			|| componentId.includes("_boiler")
		) {
			if(!componentId.endsWith("_yn") && !componentId.endsWith("_select") && !componentId.endsWith("_use") && !componentId.endsWith("_day")) {
				if(tagValue == 1) {
					$("a[id="+ componentId +"]").removeClass("off").addClass("on");
					// 상온냉동기 : UPS
					if(componentId.includes("_ups_status")) {
						$("a[id="+ componentId +"]").text("정상");
					} else {
						$("a[id="+ componentId +"]").text("기동");
					}
				} else {
					$("a[id="+ componentId +"]").removeClass("on").addClass("off");
					// 상온냉동기 : UPS
					if(componentId.includes("_ups_status")) {
						$("a[id="+ componentId +"]").text("고장");
					} else {
						$("a[id="+ componentId +"]").text("정지");
					}
				}
				return true;
			}else if(componentId.endsWith("_use")){ //냉각탑 선택,미선택
				if(tagValue == 1){
					$("a[id="+ componentId +"]").text("선택중");
					$("a[id="+ componentId +"]").addClass("on");
				}else{
					$("a[id="+ componentId +"]").text("미선택");
					$("a[id="+ componentId +"]").removeClass("on");
				}
				return true;
			}
			
		}
		
		//열림/닫힘 a태그 :on/off
		if(componentId.endsWith("_open_yn") 
			|| componentId.includes("_mv")
		) {
			if(!componentId.endsWith("_control_use")) {
				if(tagValue == 1) {
					$("a[id="+ componentId +"]").removeClass("off").addClass("on");
					$("a[id="+ componentId +"]").text("열림");
					$("div[id="+ componentId +"_class]").removeClass("off").addClass("on");
				} else {
					$("a[id="+ componentId +"]").removeClass("on").addClass("off");
					$("a[id="+ componentId +"]").text("닫힘");
					$("div[id="+ componentId +"_class]").removeClass("on").addClass("off");
				}
				return true;
			}
		}
		
		// 시스템상태 > 운전 / 축냉완료 설정 (축열량 강제 0/100%) / 설정관리 > 흡수식냉각탑 사용여부 / 설정 > 방냉인버터 통합 수동 제어 사용
		if(componentId.endsWith("_drive") || componentId.endsWith("_heat_reset") || componentId.endsWith("_use_yn") || componentId.includes("_absorb_damper")) {
			if(tagValue == 1) {
				$("div[id="+ componentId +"]").find('.start').show();
				$("div[id="+ componentId +"]").find('.stop').hide();
				$("div[id="+ componentId +"]").removeClass('off').addClass('on');
				$("div[id="+ componentId +"]").prev('.lamp').removeClass('off').addClass('on');
			} else {
				$("div[id="+ componentId +"]").find('.stop').show();
				$("div[id="+ componentId +"]").find('.start').hide();
				$("div[id="+ componentId +"]").removeClass('on').addClass('off');
				$("div[id="+ componentId +"]").prev('.lamp').removeClass('on').addClass('off');
			}
			return true;
		}
		
		
		
	

		// 냉동기,HEX 사용여부 
		if(componentId.endsWith("_select")) {
			if(tagValue == 1) {
				$("a[id="+ componentId +"]").removeClass("btn_disabled").addClass("btn_select");
			} else {
				$("a[id="+ componentId +"]").removeClass("btn_select").addClass("btn_disabled");
			}
			return true;
		}
		
		// 알람 리셋
		if(componentId.endsWith("_alarm_reset")) {
			if(tagValue == 1) {
				$("div[id="+ componentId +"]").removeClass('off').addClass('on');
			} else {
				$("div[id="+ componentId +"]").removeClass('on').addClass('off');
			} 
			return true;
		}
		
		// 냉각수 START신호(동파방지)
		if(componentId.endsWith("_start")) {
			if(tagValue == 1) {
				$("span[id="+ componentId+"]").show();				
			} else {
				$("span[id="+ componentId+"]").hide();
			}
			return true;
		}

		//경부선 흡수식냉온수기
		if(componentId.includes("_coolhotwater")){
			if(tagValue == 1){
				$("span[id="+ componentId+"]").removeClass('off').addClass('on');
				$("span[id="+ componentId+"]").text("운전");
			}else{
				$("span[id="+ componentId+"]").removeClass('on').addClass('off');
				$("span[id="+ componentId+"]").text("정지");
			}
			if(componentId.endsWith("_heat_stat")){
				if(tagValue == 1){
					$("span[id="+ componentId+"]").removeClass('on').addClass('off');
					$("span[id="+ componentId+"]").text("냉방");
				}else{
					$("span[id="+ componentId+"]").removeClass('off').addClass('on');
					$("span[id="+ componentId+"]").text("난방");
				}
			}
			return true;
		}
		
		// 냉동기 등 운전/정지 여부
		if(componentId.endsWith("_run_yn")) {
			
			if(tagValue == 1) {
				$("span[id="+ componentId+"]").removeClass('off').addClass('on');
				$("span[id="+ componentId+"_text]").text("운전중");
				$("div[id="+ componentId +"]").prev('.lamp').removeClass('off').addClass('on');
			} else {
				$("span[id="+ componentId+"]").removeClass('on').addClass('off');
				$("span[id="+ componentId+"_text]").text("정지");
				$("div[id="+ componentId +"]").prev('.lamp').removeClass('on').addClass('off');
			}
			return true;
		}
		
		// 흠수식냉동기 value (김포,군포)
		if(componentId.endsWith("_absorb1_gas") || componentId.endsWith("_absorb2_gas") || componentId.endsWith("_absorb_inspect_elec") || componentId.endsWith("_inspect") || componentId.endsWith("_accum")) {
			$("span[id="+ componentId +"]").text(tagValue);
		}
		
		// 냉동기 등 운전/정지 여부
		if(componentId.includes("_absorb1") || componentId.includes("_absorb2")) {
			
			if(tagValue == 1) {
				$("span[id="+ componentId+"]").removeClass('off').addClass('on');
				$("span[id="+ componentId+"]").text("기동");
			} else {
				$("span[id="+ componentId+"]").removeClass('on').addClass('off');
				$("span[id="+ componentId+"]").text("정지");
			}
			return true;
		}
		
		// 경부선 설정화면
		if(componentId.endsWith("_electric")|| componentId.endsWith("_wattage")) {
			$("span[id="+ componentId +"]").text(tagValue);
			return true;
		}
		
		
		// 경부선 상온냉동기 전체 운전/정지 여부
		if(componentId.endsWith("_tempfridge")) {
			if(tagValue == 1) {
				$("span[id="+ componentId+"]").removeClass("off").addClass("on");
				$("span[id="+ componentId +"_text]").text("상온기동");
			} else {
				$("span[id="+ componentId+"]").removeClass('on').addClass('off');
				$("span[id="+ componentId +"_text]").text("상온정지");
			}
			return true;
		}
		
	});
	
}

// 알람 상태값 초기 세팅
function initSetAlarmStatus(list) {
	$("#tagForm input[class*=alarm_error]").each(function() {
		var componentId = $(this).attr("class");
		$("td[id="+ componentId +"]").removeClass();
	});
	if(list != null) {
		for(var i=0; i<list.length; i++) {
			// 경보 
			// alarm_warning : 점멸 (ALARM_STATUS01) / alarm_on : 빨간글씨 (ALARM_STATUS02)
			$("#tagForm input[class*=alarm_error]").each(function() {
				var componentId = $(this).attr("class");
				if(list[i].tagId == $(this).attr("id")) {
					if(list[i].alarmStatusCd == "ALARM_STATUS01") {
						$("td[id="+ componentId +"]").addClass("alarm_warning");
					} else if(list[i].alarmStatusCd == "ALARM_STATUS02") {
						$("td[id="+ componentId +"]").addClass("alarm_on");
					}
					return false;
				} 
			});
		}
	}
}

// 알람 리셋
function updateAlarmReset() {
	//showLoading();
	var siteCd = $("#siteCd").val();
	$.ajax({
		url : "/ems/system/updateAlarmResetAjax.do",
		type: "POST",
		data:  {siteCd : siteCd},
		dataType : "json",
	}).done( function(data) {
		//hideLoading();
		var resultCode = data.resultCode;
		//if(resultCode != "0000") {
		//	alert(data.resultMsg);
		//}
	});
}

// 트랜드 메뉴로 이동
function goTrend() {
	var tagId = $("#tagForm input[class="+$("input[name=templateId]").val()+"_"+$("input[name=groupId]").val()+"]").attr("id");
	var siteCd = $("#siteCd").val();
	location.href = "/ems/trend/tagMonitoring.do?siteCd="+siteCd+"&tagId="+tagId;
}

// 경보 메뉴로 이동
function goAlarm() {
	location.href = "/ems/alarm/alarmList.do";
}

// 통신오류일 경우 dim처리
function fullMask() {
	var id = $('.error_text')

	var maskHeight = $(document).height();
	var maskWidth = $(document).width();

	$('#error_mask').css({'width':maskWidth,'height':maskHeight});

	$('#error_mask').fadeIn(200);
	$('#error_mask').fadeTo("fast", 0.75);

	var winH = $(window).height();
	var winW = $(window).width();
	var scrollTop = $(window).scrollTop();

	$(id).css('top', winH/2-$(id).height()/2+scrollTop);
	$(id).css('left', winW/2-$(id).width()/2);

	$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.

}