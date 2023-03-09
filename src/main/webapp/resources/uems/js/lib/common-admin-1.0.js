
//검색 시작&종료 날짜 셋팅(오늘, 일주일, 한달, 일년, 전체)
function intervalSetting(val, div){
	//전체의 경우 div = 'all'로 넘겨주면 됩니다~ val은 그냥 암거나 맘대로
	if (div == 'all') { //전체
		$("#schStDt").val("");
		$("#schEdDt").val("");
		return;
	} 
	
	if (div == 'before'){ //과거 x일 전 1일치 데이터만 (시작일=종료일)
		var today = new Date();
		var search_date = new Date(today.getFullYear(), today.getMonth(), today.getDate() - val);
		$("#schStDt").datepicker("setDate", search_date);
		$("#schEdDt").datepicker("setDate", search_date);
		
	} else { // 오늘로 부터 며칠 전, 몇달 전, 몇년 전... 
		var end_date = new Date();
		var start_date;
		
		if (div == 'day') {
			start_date = new Date(end_date.getFullYear(), end_date.getMonth(), end_date.getDate() - val);
		} else if (div == 'month') {
			start_date = new Date(end_date.getFullYear(), end_date.getMonth()- val, end_date.getDate());
		} else if (div == 'year') {
			start_date = new Date(end_date.getFullYear()- val, end_date.getMonth(), end_date.getDate());
		}
		
		$("#schStDt").datepicker("setDate", start_date);
		$("#schEdDt").datepicker("setDate", end_date);
	}
	
}


function hpValidation(num){
	
	if(!/^[0-9]{3}[0-9]{3,4}[0-9]{4}$/.test(num)){
		return false;
	}
	return true;
}

//체크박스 전체 체크
function allCheck(name) {
	if($("#check_all").is(":checked")){
		$('input:checkbox[name="'+name+'"]').attr("checked","checked");	
	}else{
		$('input:checkbox[name="'+name+'"]').removeAttr("checked");
	}
}

//체크박스 선택된 애들 Array에 id값 셋팅
function checkboxArrSetting(name){
	var valueArr = new Array();
	$('input:checkbox[name="'+name+'"]:checked').each(function(){
		valueArr.push($(this).val());
	});
	return valueArr;
	
}

//체크박스 선택된 애들 Array에 class값 셋팅
function checkboxArrClassSetting(name){
	var valueArr = new Array();
	$('input:checkbox[name="'+name+'"]:checked').each(function(){
		valueArr.push($(this).attr("class"));
	});
	return valueArr;
	
}
// 글자 수 계산
String.prototype.byteLength = function() {
	var length=0;
	this.split('').forEach(function(v) {
		
		code = v.charCodeAt(0);
		if ( code == 10 ) length += 2; // 줄바꿈은 LF + CR라서 2자리임.
		else if ( 0 <= code && code < 256 ) length += 1;
		else length += 2;
	});
	return length;
}

//최대 글자수만큼 자르기
$.fn.cut = function(maxLength, length) {
	var str="";
	$(this).val().split('').forEach(function(v) {
		var remainingLen = Number(maxLength) - str.length;
		if ( 0 < remainingLen && remainingLen >= v.length ) {
			str += v;
		}
	});
	return str;
}

// 입력된 글자 수를 id+Count에 넣기(',' 추가)
function updateInputCount(id, length) {
	if ( typeof id == 'undefined' ) return false;
	$id = $("#" + id);
	var maxLength = $id.attr("maxLength");
	var count = $id.val().length;
	if ( count > maxLength ) {
		$id.val( $id.cut( maxLength, length ) );
		count = length( $id.val() );
	}
	if ( typeof $("#"+id+"Count").attr('id') == "undefined" ) return false;
	
	 $("#"+id+"Count").text( addComma( count.toString() ) );
}

/* 날짜 포멧 */
Date.prototype.format = function(f) {
	
	if (!this.valueOf()) return " ";
 
	var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	var d = this;

	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
		switch ($1) {
			case "yyyy": return d.getFullYear();
			case "yy": return (d.getFullYear() % 1000).zf(2);
			case "MM": return (d.getMonth() + 1).zf(2);
			case "dd": return d.getDate().zf(2);
			case "E": return weekName[d.getDay()];
			case "HH": return d.getHours().zf(2);
			case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
			case "mm": return d.getMinutes().zf(2);
			case "ss": return d.getSeconds().zf(2);
			case "a/p": return d.getHours() < 12 ? "오전" : "오후";
			default: return $1;
		}
	});
};
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

// 콤마(',') 추가
function addComma(number) {

	number = number + "";
	
	if ( ! /^[-+]?\d+$/.test(number) ) {
		return number;
	}
	return number.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
};

$(document).ready(function() {
	var menuNavi = $('#menuNavi').text().split('>');
	//$('.main_title').text($.trim(menuNavi[1]) + ( typeof menuNavi[2] == "undefined" ? "" : " : " + $.trim(menuNavi[2]) ));
	
	$('img').error(function(){
	    $(this).attr('src', '/resources/uems/images/no_image_box.png');
	});
	
	// 한글, 숫자, 영문 1 Byte
	$(document).on("keyup keydown mounseout", '.chk_count', function() {
		updateInputCount($(this).attr("id"), function(str) { return str.length; });
	});

	// 한글 2 Bytes,  숫자, 영문 1 Byte
	$(document).on("keyup keydown mounseout", '.chk_count2', function() {
		updateInputCount($(this).attr("id"), function(str) { return str.byteLength(); });
	});
	
	$('.chk_count').each(function() {
		updateInputCount($(this).attr("id"), function(str) { return str.length; });
	});
	
	$('.chk_count2').each(function() {
		updateInputCount($(this).attr("id"), function(str) { return str.byteLength(); });
	});
	
	$(document).on("change", '.add_comma', function() {
		if ( "SPAN" == $(this).context.tagName ) {
			$(this).text(addComma( $(this).text() ));
		}
		if ( "INPUT" == $(this).context.tagName ) {
			$(this).val(addComma( $(this).val() ));
		}
	});
});

//현재 시간
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

