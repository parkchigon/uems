<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		selectAlarmFooter();
	});
	
	// 실시간 경보 알람 조회
	function selectAlarmFooter() {
		var siteCd = $("#siteCd").val();
		
		if(isEmpty(siteCd)) {
			return;
		} else {
			$.ajax({
				url : "/ems/alarm/selectAlarmFooterAjax.do",
				type: "POST",
				data: {siteCd : siteCd},
				dataType : "json",
				async : false
			}).done( function(data) {
				var alarmInfo = data.alarmInfo;
				var alarm = '';
				
				if(alarmInfo != null) {
					// 푸터 세팅
					if(alarmInfo.alarmStatusCd == "ALARM_STATUS01") {
						$("#footer").removeClass();
						$("#footer").addClass("warning");
						if(alarmInfo.iAlarmWavCdNm != 'undefined' && alarmInfo.iAlarmWavCdNm != '' && alarmInfo.iAlarmWavCdNm != null){
							alarm += '<audio src="/resources/ems/wav/'+alarmInfo.iAlarmWavCdNm+'" autoplay="autoplay" loop=20 ></audio>';
						}
						if(alarmInfo.iAlarmImgCdNm != 'undefined' && alarmInfo.iAlarmImgCdNm != '' && alarmInfo.iAlarmImgCdNm != null){
							alarm += '<img src="/resources/ems/img/'+alarmInfo.iAlarmImgCdNm+'" style="width: 25px;" />';
						}
					} else if(alarmInfo.alarmStatusCd == "ALARM_STATUS02") {
						$("#footer").removeClass();
						$("#footer").addClass("alarm_on");
						if(alarmInfo.iAlarmWavCdNm != 'undefined' && alarmInfo.iAlarmWavCdNm != '' && alarmInfo.iAlarmWavCdNm != null){
							alarm += '<audio src="/resources/ems/wav/'+alarmInfo.iAlarmWavCdNm+'" autoplay="autoplay" loop=20 ></audio>';
						}
						if(alarmInfo.iAlarmImgCdNm != 'undefined' && alarmInfo.iAlarmImgCdNm != '' && alarmInfo.iAlarmImgCdNm != null){
							alarm += '<img src="/resources/ems/img/'+alarmInfo.iAlarmImgCdNm+'" style="width: 25px;" />';
						}
					} else {
						$("#footer").removeClass();
					}
					$("#alarmText").text("경보정보 : "+alarmInfo.alarmMsg);
					$("#alarmText").append(alarm);
					$("#alarmText").show();
				} else {
					$("#alarmText").hide();
				}
			});
			
			// TODO JAR 실시간데이터 주기(밀리세컨드)마다 한번씩 호출해야함
			setTimeout("selectAlarmFooter()",5000); 
		}
	}
</script>

<!-- s : footer -->
<div id="footer" class=""><!-- 경보시 : warning , 알람확인후 : alarm_on -->
	<a href="javascript:goAlarm();"><span id="alarmText"></span></a>
</div>
<!-- e : footer -->
