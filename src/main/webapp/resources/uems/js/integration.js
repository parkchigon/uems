// 통합센터 공통 JS

var curSiteCd = "";
var chkCoolpump = false;
var chkStoragetankpump = false;
var chkBrinepump = false;
var chkIcestoragepump = false;

//현재 시간
function getTimeStemp() {
    var currentDate = new Date();
    var week = new Array('일','월','화','수','목','금','토');
    
    var calendar = currentDate.getFullYear() + "년 " + addZeros(currentDate.getMonth()+1,2) + "월 " + addZeros(currentDate.getDate(),2)+ "일"; 	// 현재 날짜
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes(),2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    $("#clock").html(calendar + "(" + week[currentDate.getDay()]+ ") " + currentHours+":"+currentMinute+":"+currentSeconds);
    setTimeout("getTimeStemp()",1000);         // 1초마다 printClock() 함수 호출
}

function selectSiteList(arrayNo, sgId) {
	if(isEmpty(sgId)) {
		var html = "";
		html += "<option value=''>전체</option>";
		
		$("select[name=insertCondition2]").empty();
		$("select[name=insertCondition2]").append(html);
		
	} else {
		$.ajax({
			url : "/uems/mng/user/selectSiteListAjax.do",
			type: "POST",
			data: {searchCondition : sgId},
			dataType : "json"
		}).done( function(data) {
			var list = data.siteList;
			var html = "";
			for(var i=0; i<list.length; i++) {
				if(list[i].siteId == $("select[name=insertCondition]").val()) {
					html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
				} else {
					html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
				}
				
			}
			$("select[id=insertCondition2_"+arrayNo+"]").empty();
			$("select[id=insertCondition2_"+arrayNo+"]").append(html);
		});
	}
}

// 메모리 삭제
function purge(d) {
	if (typeof d != "undefined") {
		var a = d.attributes, i, l, n;

		if (a) {
			l = a.length;
			for (i = 0; i < l; i += 1) {
				n = a[i].name;

				if (typeof d[n] === 'function') {
					d[n] = null;
				}
			}
		}

		a = d.childNodes;

		if (a) {
			l = a.length;

			for (i = 0; i < l; i += 1) {
				purge(d.childNodes[i]);
			}
		}
	}
}

// 구글 맵 시작	
function googleMapInitialize() {
	// 맵 세부사항 설정
	// 옵션 정보 (https://developers.google.com/maps/documentation/javascript/reference#MapOptions)
	var mapOptions = {
		mapTypeId : 'hybrid',
		zoom : 7,
		minZoom : 7,
		maxZoom : 15,
		center : mapCenter,
		scrollwheel : true, // 마우스휠 줌
		zoomControl : true, // 줌 컨트롤 표시
		zoomControlOptions : false, // 줌 컨트롤 옵션
		streetViewControl : false, // 길거리뷰
		panControl : true, // 지도 위치를 움직일수 있는 컨트롤
		mapTypeControl : true, // 맵 타입 변경 표시 안함
		scaleControl : true
	// 스케일 컨트롤 표시 안함
	};
	// 지도 표시
	map = new google.maps.Map(document.getElementById('map_area'),
			mapOptions);
	
	google.maps.event.addDomListener(window, "resize", function() { //리사이즈에 따른 마커 위치
        var center = map.getCenter();
        google.maps.event.trigger(map, "resize");
        map.setCenter(center); 
    });
	
	// 마커 및 정보창 표시
	infowindow = new google.maps.InfoWindow(); // 마커 생성 전 초기화를 해야지 다중 정보창이 있는경우 이전 정포창이 닫히고 새로운 정보창이 표시됨
	
	$.each(displayMarkerInfo, function (index, value) {
		myLatLng = new google.maps.LatLng(value.regionX, value.regionY);		// 좌표 설정

		// 현재 운영자의 사이트 관리소유권
		var owner = false;
		
		if (value.mngId == undefined) {
			
			markerImage = ( value.sgName == '이마트' ) ? '/resources/uems/images/map/map_pin_gray_emart.png' : '/resources/uems/images/map/map_pin_gray_ssg.png';			
		} else {
			
			owner = true;
			markerImage = ( value.sgName == '이마트' ) ? '/resources/uems/images/map/map_pin_emart.png' : '/resources/uems/images/map/map_pin_ssg.png';
		}
		
		marker = new google.maps.Marker({
			position: myLatLng,		// 좌표
			map: map				// 마커를 표시할 element
			,icon: markerImage		// 마커 이미지 경로 (사용자 마커 사용 시 추가)
		});
		
		var siteName = value.siteName;
		var siteId   = value.siteId;
		var infowindowContent = setInfowindowContent(siteName, siteId, owner);
		
		// 마커 클릭 시 정보창 표시
		google.maps.event.addListener(marker, 'mouseover', function () {
			infowindow.setContent(infowindowContent);
			infowindow.open(map, this);
		});
		// 지도 클릭 시 정보창 닫기
		google.maps.event.addListener(map, 'click', function () {
			infowindow.close();
		});
		
	});
	purge(map);
}

// 구글 지도 InfoWindow
function setInfowindowContent(siteName, siteId, owner) {
	
	if (owner)
	{
		return infowindowContent = "<div id='iw_container'>"
				+ "<div class='iw_title'><strong>"
				+ siteName
				+ "</strong></div>"
				+ "<div class='iw_content'>"
				+ "<div class='pin_layer'>"
				+ "<ul>"
				+ "<li class='list1'><a href='javascript:goEms(\""+siteId+"\", \"ems\");'>계통도</a></li>"
				+ "<li class='list2'><a href='javascript:goEms(\""+siteId+"\", \"alarm\")'>경보</a></li>"
				+ "<li class='list3'><a href='javascript:goEms(\""+siteId+"\", \"trend\")'>트랜드</a></li>"
				+ "<li class='list4'><a href='javascript:goEms(\""+siteId+"\", \"setting\")'>설정메뉴</a></li>"
				+ "</ul>"
				+ "<img src='/resources/uems/images/map/map_pin_layer.png' alt='' />"
				+ "</div>"
				+ "</div>" 
				+ "</div>";
	} else {
		return infowindowContent = "<div id='iw_container'>"
			+ "<div class='iw_title'><strong>"
			+ siteName
			+ "</div>";
	}
}

// 구글 지도 InfoWindow 정보 이동
function goEms(siteId, type) {
	
	var option = 'height=' + screen.height + ',width=' + screen.width + ',top=0, left=0, scrollbars=no, location=no, resizable=yes, status=no, fullscreen=yes';
	var url = "/uems/integration/setSiteSession.do?infoSiteId="+siteId+"&infoType="+type;
	var popup = window.open(url, 'emsPopup', option);
	popup.focus();
			
}	

// 구글 지도 정보 조회
function settingMarkerInfo() {
	$.ajax({
		url : '/uems/integration/integrationMapAjax.do',
		type : 'POST',
		success : function(data) {
			var list = data.mapList;
			var length = list.length;
			displayMarkerInfo.length = 0;
			if (length > 0) {
				for ( var i in list) {
					displayMarkerInfo.push(list[i]);
				}
			}
		}
	});
}

var cooltower1 = "#1";
var cooltower2 = "#2";
var cooltower3 = "#3";
var cooltower4 = "#4";
var fridgeCoolInTemp = 0;
var fridgeCoolOutTemp = 0;
var fridgeStoragetankInTemp = 0;
var fridgeStoragetankOutTemp = 0;
var icestorageInTemp, icestorageOutTemp, icestorageInTemp1, icestorageInTemp2, icestorageInTemp3, icestorageOutTemp1, icestorageOutTemp2, icestorageOutTemp3 = 0;
// 관리 Template 추가
function addIntegrationTemplate(arrayNo) {
	var templateDataList = "";
	var insertCondition = $("select[id=insertCondition2_"+arrayNo+"]").val();
	
	if(insertCondition == '' || insertCondition == null){  
		alert('지점을 선택해주세요.');
		return false;
	}

	$("input[name=siteCd]").each(function(i) {
		var siteId = $(this).attr("id").split("_")[1];
		if (siteId == insertCondition) {
			alert('현재 관리중인 지점입니다.\n지점을 확인해 주세요.');
			return false;
		}
	});
	
	infowindow.close();
	
	var dataList = {  
		arrayNo : arrayNo,	
		siteId  : insertCondition	
	};
	
	$.ajax({
		url : '/uems/integration/addIntegrationTemplateAjax.do',
		type : 'POST',
		data: dataList,
		dataType : "json"
	}).done( function(data) {
		refeshGoogleMap();
		var list = data.templateList;
		var length = list.length;
		if (length > 0) {
			for ( var i in list) {
				var type = list[0].templateType;
				var url = '/uems/integration/setType'+type+'Page.do';
				$(".template_"+arrayNo).load(url, dataList, function(responseTxt, statusTxt, xhr){
			        if(statusTxt == "success") {
			        	refeshGoogleMap();
			        	// 실시간 태그값 조회
			    		setTagValue();
			        	//location.reload();
			    		
			        	$.ajax({
			        		url : "/uems/integration/weatherStatusAjax.do",
			        		type: "POST",
			        		data: {siteCdList : siteCdList},
			        		dataType : "json",
			        	}).done( function(data) {
			        		var list = data.weatherList;
			        		initSetWeather(list);
			        	});
			        	// 내일날씨
			        	setSiteTomorrowWeather();
			        	
			        	
			        }
			    });
				
			}
		}
	});
	
}

function deleteTemplate(siteId, arrayNo){
	
	infowindow.close();
	
	var dataList = {  
		arrayNo : arrayNo,	
		siteId  : siteId	
	};
	
	$.ajax({
		url : '/uems/integration/deleteIntegrationTemplateAjax.do',
		type : 'POST',
		data: dataList,
		dataType : "json"
	}).done( function(data) {
		refeshGoogleMap();
		$(".template_"+arrayNo).load('/uems/integration/setDefaultPage.do', dataList, function(responseTxt, statusTxt, xhr){
	        if(statusTxt == "success") {
	        	refeshGoogleMap();
	        }
	    });
	});
}

// 통합센터 진입 구글맵 로드
function entryGoogleMap(){
	// 구글맵 정보 세팅
	settingMarkerInfo();
	google.maps.event.addDomListener(window, 'load', googleMapInitialize);
}

//템플릿 추가 삭제 후 구글맵 리로드
function refeshGoogleMap(){
	// 구글맵 정보 세팅
	settingMarkerInfo();
	googleMapInitialize();
}


function resetTagVariable(){
	cooltower1 = "#1";
	cooltower2 = "#2";
	cooltower3 = "#3";
	cooltower4 = "#4";
	fridgeCoolInTemp = 0;
	fridgeCoolOutTemp = 0;
	fridgeStoragetankInTemp = 0;
	fridgeStoragetankOutTemp = 0;
	icestorageInTemp, icestorageOutTemp = 0;
}


//실시간 알람 조회
function setAlarmStatus() {
	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		url : "/uems/integration/alarmStatusAjax.do",
		type: "POST",
		data: {siteCdList : siteCdList},
		dataType : "json",
		async : false
	}).done( function(data) {
		var list = data.alarmList;
		
		// 초기값 세팅
		initAlarmStatus(list);
	});
	
	// TODO JAR 실시간데이터 3초(3000)마다 한번씩 호출해야함
	setTimeout("setAlarmStatus()",5000); 
}

// 10분단위 날씨 조회
function setSiteWeather() {
	$.ajax({
		url : "/uems/integration/weatherStatusAjax.do",
		type: "POST",
		data: {siteCdList : siteCdList},
		dataType : "json",
		async : false
	}).done( function(data) {
		var list = data.weatherList;
		initSetWeather(list);
	});
	
	// TODO JAR 실시간데이터 10분(600000)마다 한번씩 호출해야함
	setTimeout("setSiteWeather()",600000); 
}


function setSiteTomorrowWeather() {
	$.ajax({
		url : "/uems/integration/tomorrowWeatherStatusAjax.do",
		type: "POST",
		data: {siteCdList : siteCdList},
		dataType : "json",
	}).done( function(data) {
		var list = data.weatherList;
		initSetTomorrowWeather(list);
	});
}

//초기값 세팅
function initSetTomorrowWeather(list) {
	for (var i in list) {
		for (var j in siteCdList) {
			if (list[i].siteCd == siteCdList[j]) {
				$("#template_"+ list[i].siteCd).each(function(index) {
					var tmn = "<strong>"+parseFloat(list[i].tmn)+"℃</strong>";
					var tmx = "<strong>"+parseFloat(list[i].tmx)+"℃</strong>";
					$(this).find(".tomorrow").find(".tmn").empty();
					$(this).find(".tomorrow").find(".tmn").append(tmn);
					$(this).find(".tomorrow").find(".tmx").empty();
					$(this).find(".tomorrow").find(".tmx").append(tmx);
					
					var cloudyStat = '';
					// 강수형태 : 0
					if(list[i].pty == '0') {
						if(list[i].sky == '2'){
							cloudyStat = 'weather sun_cloudy';
						}else if(list[i].sky == '3' || list[i].sky == '4'){
							cloudyStat = 'weather sun_cloudy2';
						}
					} else {
						if(list[i].pty == '1') {
							cloudyStat = 'weather rain';
						} else if(list[i].pty == '2') {
							cloudyStat = 'weather rain_show';
						} else if(list[i].pty == '3') {
							cloudyStat = 'weather show';
						}  
					}
					applyClass = cloudyStat;
					$(this).find(".tomorrow").find(".weather").attr('class',cloudyStat);
					
				});
			}
		}
	}
}

//초기값 세팅
function initSetWeather(list) {
	for (var i in list) {
		for (var j in siteCdList) {
			if (list[i].siteCd == siteCdList[j]) {
				$("#template_"+ list[i].siteCd).each(function(index) {
					var teh = "<strong>"+parseFloat(list[i].teh)+"℃</strong>";
					var reh = "<strong>"+parseFloat(list[i].reh)+"%</strong>";
					$(this).find(".today").find(".teh").empty();
					$(this).find(".today").find(".teh").append(teh);
					$(this).find(".today").find(".reh").empty();
					$(this).find(".today").find(".reh").append(reh);
					
					var time='weather sun';
					var cloudyStat = '';
					if(list[i].hour < 6 && list[i].hour > 19){
						time = 'weather moon';
					}
					// 강수형태 : 0
					if(list[i].pty == '0') {
						if(list[i].sky == '2'){
							cloudyStat = '_cloudy';
						}else if(list[i].sky == '3' || list[i].sky == '4'){
							cloudyStat = '_cloudy2';
						}
						applyClass = time + cloudyStat;
					} else {
						if(list[i].pty == '1') {
							cloudyStat = 'weather rain';
						} else if(list[i].pty == '2') {
							cloudyStat = 'weather rain_show';
						} else if(list[i].pty == '3') {
							cloudyStat = 'weather show';
						}  
						applyClass = cloudyStat;
					}
					
					$(this).find(".today").find(".teh").attr('class',applyClass);
					$(this).find(".today").find(".reh").attr('class','weather humidity');
					
				});
			}
		}
	}
}

//초기 알람 그리드
function alarmLayerSet() {
	$('.alarm_layer a').click(function(e) {
		e.preventDefault();

		if ($('.alarm_layer').hasClass('close')) {
			$('.alarm_layer').removeClass('close').addClass('open');
		} else if ($('.alarm_layer').hasClass('open')) {
			$('.alarm_layer').removeClass('open').addClass('close');
		}
		;
	});
}

//알람 상태값 초기 세팅
function initAlarmStatus(list) {
	var html = "";
	if(list != null) {
		for (var i in list) {
			html += "<tr>";
			html += "<td style='text-align:center'>"+list[i].siteName+"</td>";
			html += "<td>"+list[i].regDate+"</td>";
			html += "<td style='text-align:center'>"+list[i].tagId+"</td>";
			html += "<td>"+list[i].alarmMsg+"</td>";
			html += "</tr>";
		}
	}
	$("#alarmList").empty();
	$("#alarmList").append(html);
}

//실시간 태그 값 조회
function setTagValue() {
	siteCdList = new Array();
	resetTagVariable();
	$("input[name=siteCd]").each(function(i) {
		siteCdList.push($(this).val());
	});
	
	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		url : "/uems/integration/selectTagValueAjax.do",	
		type: "POST",
		data: {siteCdList:siteCdList},
		dataType : "json",
		async : false
	}).done( function(data) {
		var list = data.tagList;
		var regList = data.regList;
		// 통신여부 세팅
		initSetFrequency(regList);
		// 초기값 세팅
		initSetTagValue(list);
	});
	
	// TODO JAR 실시간데이터 해당 밀리초마다 마다 한번씩 호출해야함
	setTimeout("setTagValue()",reloadDataView);
}

// 지점 별 통신여부 세팅
function initSetFrequency(list) {
	for (var i in list) {
		var siteCd = list[i].siteCd;
		var regDate = list[i].regDate;
		var diffSec = list[i].diffSec;
		// 통신중인지 체크 (현재시간 과 등록일 validConnIntervalSec초 이상일 경우 통신이상으로 판단)
		if(isEmpty(regDate)) {
			if(!$("#template_"+siteCd).find(".mini_view_inner_mask").parent().hasClass("mini_view_disabled")) {
				$("#template_"+siteCd).find(".mini_view_inner_mask").parent().addClass("mini_view_disabled");
			}
		} else {
			//if(parseInt(regDate)+20 >= getDate()) {
			if(parseInt(diffSec) <= validConnIntervalSec) {
				if($("#template_"+siteCd).find(".mini_view_inner_mask").parent().hasClass("mini_view_disabled")) {
					$("#template_"+siteCd).find(".mini_view_inner_mask").parent().removeClass("mini_view_disabled");
				}
			} else {
				if(!$("#template_"+siteCd).find(".mini_view_inner_mask").parent().hasClass("mini_view_disabled")) {
					$("#template_"+siteCd).find(".mini_view_inner_mask").parent().addClass("mini_view_disabled");
				}
			}
		}
		// 첫번째 태그만 확인
		//break;
	}
}

//초기값 세팅
function initSetTagValue(list) {
	
	curSiteCd = "";

	for (var j in siteCdList) {
		var templateDataList = new Array();
		
		var siteCd = "";
		var templateType = "";
		for (var i in list) {
			if (list[i].siteCd == siteCdList[j]) {
				
				if (siteCd == "") {
					siteCd = list[i].siteCd;
					templateType = list[i].templateType;
				}
				
				templateDataList.push(list[i]);
				
				// TEMPLATE 축열조 운전상태
				if (list[i].componentId.endsWith("_drive")) {
					if (list[i].tagValue == 1) {
						setDrive(list[i].componentName, list[i].siteCd);
					}
				}
			}
		}
		
		// 지점별로 미니계통도 출력
		templateSetTagValue(templateDataList, siteCd);
	}
}


//온도
var fridgeCoolInTempArr;
var fridgeCoolOutTempArr;
var fridgeStoragetankInTempArr;
var fridgeStoragetankOutTempArr;
var icestorageInTempArr;
var icestorageOutTempArr;
var coolwaterInTempArr;
var coolwaterOutTempArr;

// 기동
var fridgeArr;
var brinepumpArr;
var coolpumpArr;
var icestoragepumpArr;
var storagetankpumpArr;
var coolwaterpumpArr;


// 태그값 전체 설정
function templateSetTagValue(list, siteCd) {
	var type;
	var componentId;
	var componentName;
	var siteCd;
	var tagValue;
	var inspect_icestorage_heat = 0;
	
	// 온도
	fridgeCoolInTempArr = [];
	fridgeCoolOutTempArr = [];
	fridgeStoragetankInTempArr = [];
	fridgeStoragetankOutTempArr = [];
	icestorageInTempArr = [];
	icestorageOutTempArr = [];
	coolwaterInTempArr = [];
	coolwaterOutTempArr = [];
	
	
	// 기동
	fridgeArr = [];
	brinepumpArr = [];
	coolpumpArr = [];
	icestoragepumpArr = [];
	storagetankpumpArr = [];	
	coolwaterpumpArr = [];		//냉수펌프
	
	for (var i in list) 
	{
		type = list[i].templateType;
		componentId = list[i].componentId;
		componentName = list[i].componentName;
		siteCd = list[i].siteCd;
		tagValue = list[i].tagValue;

		/*********************************************************************************************
		 *  START-복합적인 데이터 조합에 의한 출력용
		 *********************************************************************************************/
		
		// 냉각수입구온도 저장 (백화점)
		if (componentId.startsWith("fridge_cool_in_temp") && (type == "H" || type == "I" || type == "J")) {				
			if (componentId == "fridge_cool_in_temp1") {
				fridgeCoolInTempArr[0] = Number(tagValue);
			} else if (componentId == "fridge_cool_in_temp2") {
				fridgeCoolInTempArr[1] = Number(tagValue);
			} else if (componentId == "fridge_cool_in_temp3") {
				fridgeCoolInTempArr[2] = Number(tagValue);
			} else if (componentId == "fridge_cool_in_temp4") {
				fridgeCoolInTempArr[3] = Number(tagValue);
			}
			continue;
		// 냉각수출구온도 저장 (백화점)
		} else if (componentId.startsWith("fridge_cool_out_temp") && (type == "H" || type == "I" || type == "J")) {
			if (componentId == "fridge_cool_out_temp1") {
				fridgeCoolOutTempArr[0] = Number(tagValue);
			} else if (componentId == "fridge_cool_out_temp2") {
				fridgeCoolOutTempArr[1] = Number(tagValue);
			} else if (componentId == "fridge_cool_out_temp3") {
				fridgeCoolOutTempArr[2] = Number(tagValue);
			} else if (componentId == "fridge_cool_out_temp4") {
				fridgeCoolOutTempArr[3] = Number(tagValue);
			} 
			continue;
		// 냉동기입구온도 저장 (백화점)
		} else if (componentId.startsWith("fridge_storagetank_in_temp") && (type == "H" || type == "I" || type == "J")) {	
			if (componentId == "fridge_storagetank_in_temp1") {
				fridgeStoragetankInTempArr[0] = Number(tagValue);
			} else if (componentId == "fridge_storagetank_in_temp2") {
				fridgeStoragetankInTempArr[1] = Number(tagValue);
			} else if (componentId == "fridge_storagetank_in_temp3") {
				fridgeStoragetankInTempArr[2] = Number(tagValue);
			} else if (componentId == "fridge_storagetank_in_temp4") {
				fridgeStoragetankInTempArr[3] = Number(tagValue);
			}
			continue;
		// 냉동기출구온도 저장 (백화점)
		} else if (componentId.startsWith("fridge_storagetank_out_temp") && (type == "H" || type == "I" || type == "J")) {	
			if (componentId == "fridge_storagetank_out_temp1") {
				fridgeStoragetankOutTempArr[0] = Number(tagValue);
			} else if (componentId == "fridge_storagetank_out_temp2") {
				fridgeStoragetankOutTempArr[1] = Number(tagValue);
			} else if (componentId == "fridge_storagetank_out_temp3") {
				fridgeStoragetankOutTempArr[2] = Number(tagValue);
			} else if (componentId == "fridge_storagetank_out_temp4") {
				fridgeStoragetankOutTempArr[3] = Number(tagValue);
			} 
			continue;
		// 열교환기입구온도 저장 (백화점)
		} else if (componentId.startsWith("icestorage_in_temp") && (type == "H" || type == "I" || type == "J")) {			
			if (componentId == "icestorage_in_temp1") {
				icestorageInTempArr[0] = Number(tagValue);
			} else if (componentId == "icestorage_in_temp2") {
				icestorageInTempArr[1] = Number(tagValue);
			} else if (componentId == "icestorage_in_temp3") {
				icestorageInTempArr[2] = Number(tagValue);
			}
			continue;
		// 열교환기출구온도 저장 (백화점)
		} else if (componentId.startsWith("icestorage_out_temp") && (type == "H" || type == "I" || type == "J")) {
			if (componentId == "icestorage_out_temp1") {
				icestorageOutTempArr[0] = Number(tagValue);
			} else if (componentId == "icestorage_out_temp2") {
				icestorageOutTempArr[1] = Number(tagValue);
			} else if (componentId == "icestorage_out_temp3") {
				icestorageOutTempArr[2] = Number(tagValue);
			} 
			continue;
		// 냉수입구온도 저장 (백화점)
		} else if (componentId.startsWith("coolwater_in_temp") && (type == "H" || type == "I" || type == "J")) {
			if (componentId == "coolwater_in_temp1") {
				coolwaterInTempArr[0] = Number(tagValue);
			} else if (componentId == "coolwater_in_temp2") {
				coolwaterInTempArr[1] = Number(tagValue);
			} else if (componentId == "coolwater_in_temp3") {
				coolwaterInTempArr[2] = Number(tagValue);
			} 
			continue;
		// 냉수출구온도 저장 (백화점)
		} else if (componentId.startsWith("coolwater_out_temp") && (type == "H" || type == "I" || type == "J")) {
			if (componentId == "coolwater_out_temp1") {
				coolwaterOutTempArr[0] = Number(tagValue);
			} else if (componentId == "coolwater_out_temp2") {
				coolwaterOutTempArr[1] = Number(tagValue);
			} else if (componentId == "coolwater_out_temp3") {
				coolwaterOutTempArr[2] = Number(tagValue);
			} 
			continue;
		}
		

		// 냉동기 호기별 기동유무 저장(백화점냉동기 기동유무에 따른 브라인/냉각수온도 출력용)
		if (componentId.startsWith("fridge") && (type == "H" || type == "I")) {
			if (componentId == "fridge1") {
				fridgeArr[0] = Number(tagValue);
			} else if (componentId == "fridge2") {
				fridgeArr[1] = Number(tagValue);
			} else if (componentId == "fridge3") {
				fridgeArr[2] = Number(tagValue);
			} else if (componentId == "fridge4") {
				fridgeArr[3] = Number(tagValue);
			} 
			//continue; //아래의 출력을 위해
		}
		
		// 브라인펌프 호기별 기동유무 저장
		if (componentId.startsWith("brinepump")) {
			if (componentId == "brinepump1") {
				brinepumpArr[0] = Number(tagValue);
			} else if (componentId == "brinepump2") {
				brinepumpArr[1] = Number(tagValue);
			} else if (componentId == "brinepump3") {
				brinepumpArr[2] = Number(tagValue);
			} else if (componentId == "brinepump4") {
				brinepumpArr[3] = Number(tagValue);
			} 
			//continue; //아래의 출력을 위해
		}
		
		// 냉각수펌프 호기별 기동유무 저장
		if (componentId.startsWith("coolpump")) {
			if (componentId == "coolpump1") {
				coolpumpArr[0] = Number(tagValue);
			} else if (componentId == "coolpump2") {
				coolpumpArr[1] = Number(tagValue);
			} else if (componentId == "coolpump3") {
				coolpumpArr[2] = Number(tagValue);
			} else if (componentId == "coolpump4") {
				coolpumpArr[3] = Number(tagValue);
			} 
			continue;
		}
		
		// 방냉펌프 호기별 기동유무 저장
		if (componentId.startsWith("icestoragepump")) {
			if (componentId == "icestoragepump1") {
				icestoragepumpArr[0] = Number(tagValue);
			} else if (componentId == "icestoragepump2") {
				icestoragepumpArr[1] = Number(tagValue);
			} else if (componentId == "icestoragepump3") {
				icestoragepumpArr[2] = Number(tagValue);
			} else if (componentId == "icestoragepump4") {
				icestoragepumpArr[3] = Number(tagValue);
			} 
			//continue;		//아래의 출력을 위해
		}
		
		// 축냉펌프 호기별 기동유무 저장
		if (componentId.startsWith("storagetankpump")) {
			if (componentId == "storagetankpump1") {
				storagetankpumpArr[0] = Number(tagValue);
			} else if (componentId == "storagetankpump2") {
				storagetankpumpArr[1] = Number(tagValue);
			} else if (componentId == "storagetankpump3") {
				storagetankpumpArr[2] = Number(tagValue);
			} else if (componentId == "storagetankpump4") {
				storagetankpumpArr[3] = Number(tagValue);
			} 
			continue;
		}
		
		// 냉수펌프 호기별 기동유무 저장
		if (componentId.startsWith("coolwaterpump")) {
			if (componentId == "coolwaterpump1") {
				coolwaterpumpArr[0] = Number(tagValue);
			} else if (componentId == "coolwaterpump2") {
				coolwaterpumpArr[1] = Number(tagValue);
			} else if (componentId == "coolwaterpump3") {
				coolwaterpumpArr[2] = Number(tagValue);
			} 
			continue;
		}
		
		// 고속터미널 냉동기(주간/야간) 기동유무 저장
		if (type == "J" && componentId.match(/fridge[0-9][_]day|night/) !== null) {
			if (componentId.startsWith("fridge1") && Number(tagValue)==1) {
				fridgeArr[0] = Number(tagValue);
			} else if (componentId.startsWith("fridge2") && Number(tagValue)==1) {
				fridgeArr[1] = Number(tagValue);
			}
		}
		
		/*********************************************************************************************
		 *  END-복합적인 데이터 조합에 의한 출력용
		 *********************************************************************************************/
				
		//방냉열량 출력
		if (componentId == "inspect_icestorage_heat") {
			tagValue = "방냉열량\n"+(Math.floor(Number(tagValue)))+" USRT";
		}
		
		if (componentId.endsWith("_temp") || componentId == "storagetankpump_inv_frequency"  
			|| componentId == "storagetank_heatstorage" || componentId.startsWith("icestorage_inv_frequency")
			|| componentId.endsWith("_invert_frequency")) {
			tagValue =  Number(tagValue).toFixed(1);
		}
		
		
		//본점,경기점 방냉열량 합계산 (냉수#1,#2,#3순시열량 합)
		if (type == "H" && componentId.endsWith("_inspect_heat")) 
		{
			inspect_icestorage_heat +=  Number(tagValue);
		}
		//백화점 냉동기 기동출력
		else if ((componentId.startsWith("cooltower") && componentId.indexOf("_invert_frequency") == -1) 
				|| (componentId.startsWith("fridge") && componentId.length == 7))
		{
			if (Number(tagValue) == 1) {
				$("#template_"+siteCd).find("#"+componentId).removeClass("stop");
				$("#template_"+siteCd).find("#"+componentId).addClass("play");
				$("#template_"+siteCd).find("#"+componentId).text("기동");
			} else {
				$("#template_"+siteCd).find("#"+componentId).removeClass("play");
				$("#template_"+siteCd).find("#"+componentId).addClass("stop");
				$("#template_"+siteCd).find("#"+componentId).text("정지");
			}
		}
		//백화점 열교환기 선택여부
		else if (componentId.startsWith("heatchange")) {
			if (Number(tagValue) == 1) {
				$("#template_"+siteCd).find("#"+componentId).removeClass("stop");
				$("#template_"+siteCd).find("#"+componentId).addClass("play");
				$("#template_"+siteCd).find("#"+componentId).text("선택");
			} else {
				$("#template_"+siteCd).find("#"+componentId).removeClass("play");
				$("#template_"+siteCd).find("#"+componentId).addClass("stop");
				$("#template_"+siteCd).find("#"+componentId).text("미선택");
			}
		}
		//센트럴시티점 방냉펌프 기동출력
		else if (type == "I" && componentId.startsWith("icestoragepump"))
		{
			if(Number(tagValue) == 1) {
				$("#template_"+siteCd).find("span[name="+componentId+"]").removeClass("stop");
				$("#template_"+siteCd).find("span[name="+componentId+"]").addClass("start");
			} else {
				$("#template_"+siteCd).find("span[name="+componentId+"]").removeClass("start");
				$("#template_"+siteCd).find("span[name="+componentId+"]").addClass("stop");
			}
		}
		else 
		{
			$("#template_"+siteCd).find("#"+componentId).text(tagValue + componentId.unit());
		}
	}

	
	/*****************************************************************************************************
	 * 하단 출력은 정보취합을 한 후에 출력이 가능한 항목들을 열거한다. 
	 *****************************************************************************************************/
	var flag = 0;
	
	// 브라인펌프 출력
	brinepumpArr.forEach(function(val,idex,arr) {
		if (val == 1) flag = 1;
	});
	if (flag == 1) {
		$("#template_"+siteCd).find("span[name=brinepump]").removeClass("stop");
		$("#template_"+siteCd).find("span[name=brinepump]").addClass("start");
	} else {
		$("#template_"+siteCd).find("span[name=brinepump]").removeClass("start");
		$("#template_"+siteCd).find("span[name=brinepump]").addClass("stop");
	}
	
	flag = 0;
	// 냉각수펌프 출력
	coolpumpArr.forEach(function(val,idex,arr) {
		if (val == 1) flag = 1;
	});
	if (flag == 1) {
		$("#template_"+siteCd).find("span[name=coolpump]").removeClass("stop");
		$("#template_"+siteCd).find("span[name=coolpump]").addClass("start");
	} else {
		$("#template_"+siteCd).find("span[name=coolpump]").removeClass("start");
		$("#template_"+siteCd).find("span[name=coolpump]").addClass("stop");
	}

	flag = 0;
	// 방냉펌프 출력
	icestoragepumpArr.forEach(function(val,idex,arr) {
		if (val == 1) flag = 1;
	});
	if (flag == 1) {
		$("#template_"+siteCd).find("span[name=icestoragepump]").removeClass("stop");
		$("#template_"+siteCd).find("span[name=icestoragepump]").addClass("start");
	} else {
		$("#template_"+siteCd).find("span[name=icestoragepump]").removeClass("start");
		$("#template_"+siteCd).find("span[name=icestoragepump]").addClass("stop");
	}
	
	flag = 0;
	// 축냉펌프 출력
	storagetankpumpArr.forEach(function(val,idex,arr) {
		if (val == 1) flag = 1;
	});
	if (flag == 1) {
		$("#template_"+siteCd).find("span[name=storagetankpump]").removeClass("stop");
		$("#template_"+siteCd).find("span[name=storagetankpump]").addClass("start");
	} else {
		$("#template_"+siteCd).find("span[name=storagetankpump]").removeClass("start");
		$("#template_"+siteCd).find("span[name=storagetankpump]").addClass("stop");
	}
	
	//고속터미널 냉동기 기동출력 (주간/야간 둘중 하나라도 기동시 기동으로)
	if (type == "J") 
	{
		if (fridgeArr[0] == 1) {
			$("#template_"+siteCd).find("#fridge1").removeClass("stop");
			$("#template_"+siteCd).find("#fridge1").addClass("play");
			$("#template_"+siteCd).find("#fridge1").text("기동");			
		} else {
			$("#template_"+siteCd).find("#fridge1").removeClass("play");
			$("#template_"+siteCd).find("#fridge1").addClass("stop");
			$("#template_"+siteCd).find("#fridge1").text("정지");
		}
		if (fridgeArr[1] == 1) {
			$("#template_"+siteCd).find("#fridge2").removeClass("stop");
			$("#template_"+siteCd).find("#fridge2").addClass("play");
			$("#template_"+siteCd).find("#fridge2").text("기동");			
		} else {
			$("#template_"+siteCd).find("#fridge2").removeClass("play");
			$("#template_"+siteCd).find("#fridge2").addClass("stop");
			$("#template_"+siteCd).find("#fridge2").text("정지");
		}
	}	
	
	// 백화점 온도계산 출력
	if (type == "H" || type == "I" || type == "J") {
		var sumTemp = 0;
		var cntTemp = 0;
		// 냉각수입구온도
		fridgeCoolInTempArr.forEach(function(val,idex,arr) {
			if (fridgeArr[idex]!="undefined" && fridgeArr[idex]!=null && fridgeArr[idex]==1) {
				sumTemp += fridgeCoolInTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=fridge_cool_in_temp]").text(sumTemp.toFixed(1));
		
		cntTemp = sumTemp = 0;
		// 냉각수출구온도
		fridgeCoolOutTempArr.forEach(function(val,idex,arr) {
			if (fridgeArr[idex]!="undefined" && fridgeArr[idex]!=null && fridgeArr[idex]==1) {
				sumTemp += fridgeCoolOutTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=fridge_cool_out_temp]").text(sumTemp.toFixed(1));
		
		cntTemp = sumTemp = 0;
		// 냉동기입구온도
		fridgeStoragetankInTempArr.forEach(function(val,idex,arr) {
			if (fridgeArr[idex]!="undefined" && fridgeArr[idex]!=null && fridgeArr[idex]==1) {
				sumTemp += fridgeStoragetankInTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=fridge_storagetank_in_temp]").text(sumTemp.toFixed(1));
		
		cntTemp = sumTemp = 0;
		// 냉동기출구온도
		fridgeStoragetankOutTempArr.forEach(function(val,idex,arr) {
			if (fridgeArr[idex]!="undefined" && fridgeArr[idex]!=null && fridgeArr[idex]==1) {
				sumTemp += fridgeStoragetankOutTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=fridge_storagetank_out_temp]").text(sumTemp.toFixed(1));
		
		cntTemp = sumTemp = 0;
		// 열교환기입구온도
		icestorageInTempArr.forEach(function(val,idex,arr) {
			if (brinepumpArr[idex]!="undefined" && brinepumpArr[idex]!=null && brinepumpArr[idex]==1) {
				sumTemp += icestorageInTempArr[idex];
				cntTemp++;
			}
			if (icestoragepumpArr[idex]!="undefined" && icestoragepumpArr[idex]!=null && icestoragepumpArr[idex]==1) {
				sumTemp += icestorageInTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=icestorage_in_temp]").text(sumTemp.toFixed(1));
		
		cntTemp = sumTemp = 0;
		// 열교환기출구온도
		icestorageOutTempArr.forEach(function(val,idex,arr) {
			if (brinepumpArr[idex]!="undefined" && brinepumpArr[idex]!=null && brinepumpArr[idex]==1) {
				sumTemp += icestorageOutTempArr[idex];
				cntTemp++;
			}
			if (icestoragepumpArr[idex]!="undefined" && icestoragepumpArr[idex]!=null && icestoragepumpArr[idex]==1) {
				sumTemp += icestorageOutTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=icestorage_out_temp]").text(sumTemp.toFixed(1));
		
		cntTemp = sumTemp = 0;
		// 열교환기출구온도
		/*icestorageOutTempArr.forEach(function(val,idex,arr) {
			if (brinepumpArr[idex]!="undefined" && brinepumpArr[idex]!=null && brinepumpArr[idex]==1) {
				sumTemp += icestorageOutTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=icestorage_out_temp]").text(sumTemp.toFixed(1));
		
		cntTemp = sumTemp = 0;*/
		// 냉수입구온도
		coolwaterInTempArr.forEach(function(val,idex,arr) {
			if (coolwaterpumpArr[idex]!="undefined" && coolwaterpumpArr[idex]!=null && coolwaterpumpArr[idex]==1) {
				sumTemp += coolwaterInTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=coolwater_in_temp]").text(sumTemp.toFixed(1));

		cntTemp = sumTemp = 0;
		// 냉수출구온도
		coolwaterOutTempArr.forEach(function(val,idex,arr) {
			if (coolwaterpumpArr[idex]!="undefined" && coolwaterpumpArr[idex]!=null && coolwaterpumpArr[idex]==1) {
				sumTemp += coolwaterOutTempArr[idex];
				cntTemp++;
			}
		});
		if (cntTemp > 0) {	sumTemp /= cntTemp;	}
		$("#template_"+siteCd).find("span[id=coolwater_out_temp]").text(sumTemp.toFixed(1));
	}
		
	
	// 본점, 경기점일 경우 방냉열량 출력
	if (type == "H") {
		var text = "방냉열량\n"+(Math.floor(inspect_icestorage_heat))+" USRT";
		$("#template_"+siteCd).find("span[id=inspect_icestorage_heat]").text(text);
	}


}


// 사용안함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// 방냉열량 계산식
// ( 비중(1.033) * 비열(0.94) * (열교환기출구온도 - 열교환기입구온도) * 유량(방열순시유량) ) / 3,024
function setRadianHeatFlux(type, list, siteCd){
	var gravity = 1.033;
	var heat = 0.94;
	var entryRadiantHeatInspectFlux = 0;
	var rth = 3024;
	var inspect_flux1, inspect_flux2, inspect_flux3;
	
	icestorageInTemp=icestorageOutTemp=0;
	icestorageInTemp1=icestorageInTemp2=icestorageInTemp3=0;
	icestorageOutTemp1=icestorageOutTemp2=icestorageOutTemp3=0;
	
	for (var i in list) {
		if (siteCd == list[i].siteCd) {
			var componentId = list[i].componentId; 
			
			if (componentId == "icestorage_in_temp") {
				icestorageInTemp = Number(list[i].tagValue);
			} else if (componentId == "icestorage_out_temp"){
				icestorageOutTemp = Number(list[i].tagValue);
			}
			
			if (type == "H" || type == "I") {
				
				if (componentId == "icestorage_in_temp1") {
					icestorageInTemp1 = Number(list[i].tagValue);
				} else if (componentId == "icestorage_in_temp2") {
					icestorageInTemp2 = Number(list[i].tagValue);
				} else if (componentId == "icestorage_in_temp3") {
					icestorageInTemp3 = Number(list[i].tagValue);
				} else if (componentId == "icestorage_out_temp1"){
					icestorageOutTemp1 = Number(list[i].tagValue);
				} else if (componentId == "icestorage_out_temp2"){
					icestorageOutTemp2 = Number(list[i].tagValue);
				} else if (componentId == "icestorage_out_temp3"){
					icestorageOutTemp3 = Number(list[i].tagValue);
				}
			}  
			
			if (componentId == "radiant_heat_inspect_flux"){
				entryRadiantHeatInspectFlux = Number(list[i].tagValue);
			}
			
			// 본점/경기점의 경우 순시유량 3개 의 평균값
			if (type == "H") {
				if (componentId == "inspect_flux1"){
					inspect_flux1 = Number(list[i].tagValue);
				} else if (componentId == "inspect_flux2"){
					inspect_flux2 = Number(list[i].tagValue);
				} else if (componentId == "inspect_flux3"){
					inspect_flux3 = Number(list[i].tagValue);
				}
				
			}
		}
	}
	
	if (type == "H" || type == "I") {
		icestorageInTemp = ( icestorageInTemp1 + icestorageInTemp2 + icestorageInTemp3 ) / 3;
		icestorageOutTemp = ( icestorageOutTemp1 + icestorageOutTemp2 + icestorageOutTemp3 ) / 3;
	}
	if (type == "H") {
		entryRadiantHeatInspectFlux = ( inspect_flux1 + inspect_flux2 + inspect_flux3 ) / 3;
	}
	
	var t = ( icestorageOutTemp - icestorageInTemp);
	var radiantHeatInspectFlux = ( gravity * heat * t * entryRadiantHeatInspectFlux) / rth;
	
	var text = "방냉열량\n"+radiantHeatInspectFlux.toFixed(2)+" USRT";
	$("#radiant_heat_inspect_flux_"+siteCd).text(text);		
}

// TEMPLATE 전체 공통
function setDrive(componentName, siteCd) {
	var mode = "<span class=''>"+componentName+"</span>";
	var sh = $("#storagetank_heatstorage").clone().wrapAll("<div/>").parent().html();
	
	$(".drive"+siteCd).empty();
	$(".drive"+siteCd).prepend(mode).append(sh);
}


// 단위 계산
String.prototype.unit = function(){
	var componentId = this.toString();
	var unit = "";
	if (componentId.endsWith("_temp")) {
		unit = "℃";
	} else if (componentId.endsWith("_frequency")) {
		unit = "Hz";
	} else if (componentId == "storagetank_heatstorage") {
		unit = "%";
	} else if (componentId.startsWith("icestorage_inv_frequency")) {
		unit = "Hz";
	}
	return unit;
};
