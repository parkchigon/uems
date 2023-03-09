<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript" src="/resources/ems/js/lib/Highcharts-5.0.11/code/themes/dark-unica.js" ></script>
<script type="text/javaScript">

	$(document).ready(function(){
		
		//기간 조건에 따라 검색조건 노출 여부 (초기세팅)
		$("#realTime").hide();
		$("#min").hide();
		$("#monthly").hide();
		$("#daily").hide();
		$("#hourly").hide();
		$("#refresh").hide();
		
		//type선택에따른 tagList 셀렉트박스 변경
		$("select[name='tagType']").change(function(){
			var selectedId = $(this).val();
			tagListSelectbox(selectedId);
		});
		
		//기간선택에 따른 템플릿 노출변경
		$("#term").change(function(){
			var value = $("#term option:selected").val();
			$("#min").hide();
			$("#realTime").hide();
			$("#monthly").hide();
			$("#daily").hide();
			$("#hourly").hide();
			$("#refresh").hide();
			if(value=='1min' ||value=='15min' || value=='5min'){
				$("#min").show();
			}else if(value=="realTime"){
				$("#refresh").show();
				$("#realTime").show();
			}else{
				$("#"+value).show();
			}
			nowDate(value);
		});
		
		//실시간 선택에 따른 종료시간 활성화여부#
		$("select[name='rtStartTime']").change(function(){
			//현재날짜구하기
			var now = new Date();
		    var hour = now.getHours();
		    var minute = now.getMinutes(); 
			var hourValue = $("#rtStartHour option:selected").val();
			var minValue = $("#rtStartMin option:selected").val();
			if(hourValue=='' || minValue == ''){
				$("#rtEndHour").val(hour);
		    	$("#rtEndMin").val(minute);
				$("#rtEndHour").attr("disabled",true);
		    	$("#rtEndMin").attr("disabled",true);
		    	$("#realTimeType").val("Y");
			}else{
				$("#rtEndHour").attr("disabled",false);
		    	$("#rtEndMin").attr("disabled",false);
		    	
		    	var date = $("#schDate1").val()+' '+$("#rtStartHour").val()+':'+$("#rtStartMin").val()+':00';  
		    	var d = new Date(date);
		    	var year= d.getFullYear();
			    var mon = (d.getMonth()+1)>9 ? ''+(d.getMonth()+1) : '0'+(d.getMonth()+1);
			    var day = d.getDate()>9 ? ''+d.getDate() : '0'+d.getDate();
			    hour = d.getHours()>9 ? ''+d.getHours() : '0'+d.getHours();
			    var seconde = d.getSeconds()>9 ? ''+d.getSeconde() : '0'+d.getSeconds();
			    var startMin = d.getMinutes()>9 ? ''+d.getMinutes() : '0'+d.getMinutes();
			    var startDate = year + '-' + mon + '-' + day + ' '+hour+':'+startMin+':'+seconde;
			    if(d.getMinutes() > 49){
			    	if(d.getHours() > 22){
			    		day = (d.getDate()+1)>9 ? ''+(d.getDate()+1) : '0'+(d.getDate()+1);
			    	}
			    	hour = (d.getHours()+1)>9 ? ''+(d.getHours()+1) : '0'+(d.getHours()+1);
			    }
			    d.setMinutes(d.getMinutes()+10);
			    minute = d.getMinutes()>9 ? ''+d.getMinutes() : '0'+d.getMinutes();
			    var endDate = year + '-' + mon + '-' + day + ' '+hour+':'+minute+':'+seconde;
			    
			    $("#endDate").val(endDate);
			    $("#startDate").val(startDate);
			    $("#rtEndHour").val(hour);
		    	$("#rtEndMin").val(minute);
		    	$("#realTimeType").val("N");
			}
		});
	});
	
	// 태그 리스트 selectbox ajax 호출
	function tagListSelectbox(selectedId) {
		var url = "/ems/trend/searchTrendTagListAjax.do";
		$.ajax({
			url: url,
			type: "POST",
			data: {tgId:selectedId,siteCd:$("#siteCd").val()},
			dataType: "json",
			async:false
		 }).done (function(data) {
			  
			 var tagList;
			 var length = data.tagList.length;
			 var data = data.tagList;
			 
			 /* 태그모니터링과 다르게 화면에 뿌리지않고 hidden값만 저장. */
			 var tagValueArr=[];
			 var tagTypeValueArr=[];
			 for(var i=0; i <length; i++){
				 tagValueArr.push(data[i].tagId);
				 tagTypeValueArr.push(data[i].codeName);
			 }
			 $("#tagValueArr").val(tagValueArr.join(','));
			 $("#tagTypeValueArr").val(tagTypeValueArr.join(','));
			 
		 });
		 
		 
		 
	}
	
	
	
	/* 현재날짜구하기+시작일,종료일 자동설정 */
	function nowDate(type){

		var now = new Date();
	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    var hour = now.getHours() > 9 ?''+now.getHours() : '0'+now.getHours();
	    var minute = now.getMinutes(); 
	    var seconde = now.getSeconds();
	    var endDate = year + '-' + mon + '-' + day;
	    var startDate;
	    
	    if(type == '1min' || type == '5min' || type == '15min'){
	    	now.setDate(now.getDate()-1);
	    	day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    	mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    	year = now.getFullYear();
	    	startDate = year + '-' + mon + '-' + day;
	    	$("#schDate").val(startDate);
	    	$("#schDate2").val(endDate);
	    	$("#minHourSt").val("23");
	    	$("#minHourEnd").val("09");
	    }else if(type == 'hourly'){
	    	now.setDate(now.getDate()-7);
	    	day = now.getDate()>9 ? ''+now.getDate() : '0'+(now.getDate());
	    	mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    	year = now.getFullYear();
	    	startDate = year + '-' + mon + '-' + day;
	    	$("#schDate4").val(startDate);
	    	$("#schDate5").val(endDate);
	    }else if(type == 'daily'){
	    	mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()) : '0'+(now.getMonth());
	    	startDate = year + '-' + mon + '-' + day;
	    	$("#schDate6").val(startDate);
	    	$("#schDate7").val(endDate);
	    }else if(type == 'monthly'){
	    	endDate = year + '-' + mon;
	    	year = now.getFullYear()-2;
	    	startDate = year + '-' + mon;
	    	$("#schMonth").val(startDate);
	    	$("#schMonth2").val(endDate);
	    }else if(type == 'realTime'){
	    	$("#schDate1").val(endDate);
	    	$("#rtEndHour").val(hour);
	    	$("#rtEndMin").val(minute);
	    	$("#rtEndHour").attr("disabled",true);
	    	$("#rtEndMin").attr("disabled",true);
	    }
	}
	
	/* tag선택값 여부   */
	function tagValueSetting(){
		
		var selectedVal = $("#tagType option:selected").val();
		if(selectedVal == '' || selectedVal == null){
			alert("태그유형을 선택해주세요");
			return false;
		}else{
			return true;
		}
	}
	
	/* 기간타입선택에 따른 검색조건 값 setting */
	function termValueSetting(termType){
		
		if(termType == ''){
			alert("기간유형을 선택하세요."); 
			return false;
		}else{
			var type = $("#term option:selected").val();
			if(type == '1min' || type == '5min' || type == '15min'){
				$("#startDate").val($("#schDate").val().replace(/-/gi, "")+$("#minHourSt").val()+"00");
				$("#endDate").val($("#schDate2").val().replace(/-/gi, "")+$("#minHourEnd").val()+"00");
				var stDate = new Date($("#schDate").val());
				var enDate = new Date($("#schDate2").val());
				var tmpDate = new Date($("#schDate").val());
				var tmpDate1 = new Date($("#schDate").val());
				stDate.setHours($("#minHourSt").val());
		    	enDate.setHours($("#minHourEnd").val());
		    	tmpDate1.setHours(stDate.getHours()+24);
				if(tmpDate1-enDate < 0){
					alert("최대설정범위는 1일(24시간) 입니다.")
					return false;
				}
		    }else if(type == 'hourly'){
		    	$("#startDate").val($("#schDate4").val().replace(/-/gi, "")+"00");
				$("#endDate").val($("#schDate5").val().replace(/-/gi, "")+"00");
				var stDate = new Date($("#schDate4").datepicker("getDate"));
				var enDate = new Date($("#schDate5").datepicker("getDate"));
				var tmpDate = new Date($("#schDate4").datepicker("getDate"));
				tmpDate.setDate(stDate.getDate()+7);
				if(tmpDate-enDate < 0){
					alert("최대설정범위는 7일 입니다.")
					return false;
				}
		    }else if(type == 'daily'){
		    	$("#startDate").val($("#schDate6").val());
				$("#endDate").val($("#schDate7").val());
				var stDate = new Date($("#schDate6").datepicker("getDate"));
				var enDate = new Date($("#schDate7").datepicker("getDate"));
				var tmpDate = new Date($("#schDate6").datepicker("getDate"));
				tmpDate.setMonth(stDate.getMonth()+2);
				if(tmpDate-enDate < 0){
					alert("최대설정범위는 2달 입니다.")
					return false;
				}
		    }else if(type == 'monthly'){
		    	$("#startDate").val($("#schMonth").val());
				$("#endDate").val($("#schMonth2").val());
				var stDate = new Date($("#schMonth").val()+'-01');
				var enDate = new Date($("#schMonth2").val()+'-01');
				var tmpDate = new Date($("#schMonth").val()+'-01');
				tmpDate.setFullYear(stDate.getFullYear()+2);
				if(tmpDate-enDate < 0){
					alert("최대설정범위는 2년 입니다.")
					return false;
				}
		    }
			return true;
		}
	}
	
	/* 검색 */
	var realTime;
	function goSearch(){
		// 실시간조회여부 확인
		var termType = $("#term option:selected").val();
		// 구간선택 실시간 여부
		var notRealTimeH = $("#rtStartHour option:selected").val();
		var notRealTimeM = $("#rtStartMin option:selected").val();
		if(tagValueSetting()){
			if(termValueSetting(termType)){
				callAmountAjax('INIT',termType);
				if(termType == 'realTime'){
					if(notRealTimeH == '' && notRealTimeM==''){
						callAjaxRealTime();
					}else{
						clearInterval(realTime);
						callAjax();
					}
				}else{
					clearInterval(realTime);
					callAjax();
				}
			}
		}
	}
	
	/* 차트 데이터 호출 실시간 ajax   */
	var chart;	
	function callAjaxRealTime(){
		var termType = $("#term option:selected").val();
	    var category, dataObj, yAxis;
	    $.ajax({
	       url: "/ems/trend/trendMonitoringAjax.do",
	       type: "POST",
	       data: $("#tagMonitoringForm").serialize(),
	       dataType: "json",
	       async:false
	    }).done (function(data) {
	       category = data.xList;//x축
	       dataObj = data.yList
	       yAxis = data.yAxis
	    });
	   	chart = new Highcharts.Chart( { 
		       chart : {
		          type:'spline',
		          animation: Highcharts.svg,
		          marginRight: 10,            
		          renderTo : 'chart'
		          ,events : {
		                 load : function(){
		                    
		                 var _this = this;   
		                 realTime = setInterval(function(){
		                          
		                   $.ajax({
		                      url: "/ems/trend/trendMonitoringRealTimeAjax.do",
		                      type: "POST",
		                      data: $("#tagMonitoringForm").serialize(),
		                      dataType: "json",
		                      async:false
		                   }).done (function(data) {
		                      
		                      var x,y;
		                      for(var i=0;i<data.xList.length;i++){
		                         category.push(data.xList[i]);                           
		                      }
		                      
		                      for(var i=0;i<data.yList.length;i++){
		                         for(var j=0;j<data.yList[i].data.length;j++){
		                            x = data.xList[j];
		                            y = data.yList[i].data[j];
		                            _this.series[i].addPoint([x, y], true, true);
		                         }
		                      }
		                   })
		                 },3000);
		              }
		           }
		       }, 
		       xAxis : { 
		          categories : category
		       }, 
		       yAxis : yAxis, 
		       tooltip : { 
		       formatter : function() { 
		             return '' + this.series.name + ': ' + this.y + ''; 
		          } 
		       }, 
		       legend: {
		            align: 'right',
		            verticalAlign: 'bottom',
		            borderWidth: 0
		        },
		       credits : { 
		          enabled: false 
		       }, 
		       plotOptions : { 
		          series : { 
		          stacking : 'normal' 
		          } 
		       }, 
		       series : dataObj 
		       });
		    
		    Highcharts.charts[0].xAxis[0].setCategories(category);
		    Highcharts.setOptions(Highcharts.theme);
	}	   	

	
	/* 차트 데이터 호출ajax   */
	function callAjax(){
	    
		var termType = $("#term option:selected").val();
		var category, dataObj, yAxis;
		$.ajax({
		   url: "/ems/trend/trendMonitoringAjax.do",
		   type: "POST",
		   data: $("#tagMonitoringForm").serialize(),
		   dataType: "json",
		   async:false
		}).done (function(data) {
		   category = data.xList;//x축
		   dataObj = data.yList;
		   yAxis = data.yAxis;
		});
		Highcharts.chart('chart', {
	        title: {
	            text: 'Tag Monitoring',
	            x: -20 //center
	        },
	        subtitle: {
	            text: '',
	            x: -20
	        },
	        xAxis: {
	            categories: category
	        },
	        yAxis: yAxis,
	        tooltip: {
		    	   headerFormat: '<b>{point.key}</b></br>',
		    	   useHTML: true,
		    	   style: {
		    		   fontSize:'13px'
		    	   },
		            valueSuffix: ''  
		    }, 
	        legend: {
	            align: 'right',
	            verticalAlign: 'bottom',
	            borderWidth: 0
	        },
	        
	        series: dataObj
	        
	    });
		Highcharts.setOptions(Highcharts.theme);
	} 
	
	/* 사용량 조회 */
	function callAmountAjax(type, termType){
		
		if(type=='REFRESH'){
			$("#refreshYn").val("Y");
		}
		
		$.ajax({
			url: "/ems/trend/trendMonitoringAmountAjax.do",
			type: "POST",
			data: $("#tagMonitoringForm").serialize(),
			dataType: "json",
			async:false
		 }).done (function(data) {
			 
			 if(type=='INIT'){
				 var tagUseAmount = data.tagUseAmount;
				 var length;
				 //태그별사용량
				 if(tagUseAmount != null){
					 length = tagUseAmount.length;
					 var tagUseAmountList;
					 
					 for(var i=0; i< length; i++){
						 tagUseAmountList += '<tr>'
						 tagUseAmountList += '<th>'+tagUseAmount[i].tagId+'</td>';
						 tagUseAmountList += '<td>'+tagUseAmount[i].maxTagValue+'</td>';
						 tagUseAmountList += '<td>'+tagUseAmount[i].minTagValue+'</td>';
						 tagUseAmountList += '<td><span class="font_yellow">'+tagUseAmount[i].avgTagValue+'</span></td>';
						 tagUseAmountList += '</tr>'
					 }
					 $("#tagUseAmountList").empty();
					 $("#tagUseAmountList").append(tagUseAmountList);
				 }
				 
			 }
			 var tagUseDetailAmount = data.tagUseDetailAmount;
			 var tagNameList = data.tagNameList;
			 var length;
			 
			 //태그별상세사용량
			 //head
			 if(tagNameList != null){
				 
				 length = tagNameList.length;
				 var tagName;
				 var colGroup;
				 colGroup += '<col width="100px">';
				 tagName += '<tr>';
				 tagName += '<th>기간</th>';
				 for(var i=0; i<length; i++){
					
					colGroup += '<col width="150px">';
					tagName += '<th>'+tagNameList[i].tagDesc+'</th>';
					if(i==3){
						$("#tdSize").css("width","100%");
					}else if(i==4){
						$("#tdSize").css("width","700px");
					}else if(i==5){
						$("#tdSize").css("width","850px");
					}else if(i==6){
						$("#tdSize").css("width","1000px");
					}else if(i==7){
						$("#tdSize").css("width","1150px");
					}else if(i==8){
						$("#tdSize").css("width","1300px");
					}else if(i==9){
						$("#tdSize").css("width","1450px");
					}
					
					
				 }
				 tagName += '</tr>';
				 $("#tagUseDetailAmountHead").empty();
				 $("#tagUseDetailAmountHead").append(tagName);
				 $("#colGroup").empty();
				 $("#colGroup").append(colGroup);
			 }
			 if(tagUseDetailAmount != null && tagUseDetailAmount.length>0){
				 //body
				 var BodyLength = tagUseDetailAmount.length;
				 var tagUseDetailAmountList;
				 var tempValue = '';
				 
				// 실시간 엑셀다운로드용 시간 데이터 저장 -- test필요
				 if(termType == 'realTime'){
					 $("#tempStart").val(tagUseDetailAmount[0].statHour);
					 $("#tempEnd").val(tagUseDetailAmount[BodyLength-1].statHour);
				 }
				
				 for(var i=0; i<BodyLength; i++){
					 tagUseDetailAmountList += '<tr>';
					 tagUseDetailAmountList += '<td>'+tagUseDetailAmount[i].statHour+'</td>';
					 for(var j=0; j<length; j++){
						 if(j==0){
							 if(tagUseDetailAmount[i].tag0 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag0;
							 }
						 }else if(j==1){
							 if(tagUseDetailAmount[i].tag1 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag1;
							 }
						 }else if(j==2){
							 if(tagUseDetailAmount[i].tag2 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag2;
							 }
						 }else if(j==3){
							 if(tagUseDetailAmount[i].tag3 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag3;
							 }
						 }else if(j==4){
							 if(tagUseDetailAmount[i].tag4 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag4;
							 }
						 }else if(j==5){
							 if(tagUseDetailAmount[i].tag5 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag5;
							 }
						 }else if(j==6){
							 if(tagUseDetailAmount[i].tag6 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag6;
							 }
						 }else if(j==7){
							 if(tagUseDetailAmount[i].tag7 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag7;
							 }
						 }else if(j==8){
							 if(tagUseDetailAmount[i].tag8 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag8;
							 }
						 }else if(j==9){
							 if(tagUseDetailAmount[i].tag9 == undefined){
								 tempValue = '-';
							 }else{
								 tempValue =  tagUseDetailAmount[i].tag9;
							 }
						 }
						 tagUseDetailAmountList += '<td>'+tempValue+'</td>';
						 
					 }
					 tagUseDetailAmountList += '</tr>';
				 }
				 $("#tagUseDetailAmountBody").empty();
				 $("#tagUseDetailAmountBody").append(tagUseDetailAmountList);
			 }
			 
		 })
	}
	
	/* TAG 사용량 엑셀다운로드 */
	function ExcelDownload(){
		var termType = $("#term option:selected").val();
		if(tagValueSetting()){
			if(termValueSetting(termType)){
				// 엑셀다운로드는 실시간도 'N'으로 처리
				if(termType == 'realTime'){
					$("#realTimeType").val("N");
					$("#startDate").val($("#tempEnd").val());
					$("#endDate").val($("#tempStart").val());
				}
				$("#monitoringType").val("trend");
				$("#tagMonitoringForm").attr("action","/ems/trend/excelDownload.do");
				$("#tagMonitoringForm").submit();
			}
		}
	}
</script>
<!-- s : content_area -->
<div id="content_area">
	<div class="subTab_area">
		<ul>
			<li><a href="/ems/trend/tagMonitoring.do">태그 모니터링</a></li>
			<li class="on"><a href="/ems/trend/trendMonitoring.do">트랜드 모니터링</a></li>
			<li><a href="/ems/trend/compareMonitoring.do">비교 모니터링</a></li>
			<c:if test="${(sessionScope.ROLE_ID eq 'ROL_0000000000000000') or (sessionScope.ROLE_ID eq 'ROL_9999999999999999') or (sessionScope.ROLE_ID eq 'ROL_0000000000000003')}">
				<li><a href="/ems/trend/indicatorMonitoring.do">지표 모니터링</a></li>
			</c:if>
		</ul>
	</div>
	<form id="tagMonitoringForm" name="tagMonitoringForm" method="POST" action="/ems/trend/trendMonitoring.do">
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}">
	<input type="hidden" id="tagValueArr" name="tagValueArr" value="">
	<input type="hidden" id="tagTypeValueArr" name="tagTypeValueArr" value="">
	<input type="hidden" id="startDate" name="startDate" value="">
	<input type="hidden" id="endDate" name="endDate" value="">
	<input type="hidden" id="tempStart" name="tempStart" value="">
	<input type="hidden" id="tempEnd" name="tempEnd" value="">
	<input type="hidden" id="realTimeType" name="realTimeType" value="Y">
	<input type="hidden" id="refreshYn" name="refreshYn" value="N">
	<input type="hidden" id="monitoringType" name="monitoringType" value="">
	
	<div class="trend_area">
		<div class="trend_search_area">
			<div class="trend_search_inner">
				<select id="tagType" name="tagType" style="width: 130px">
					<option value="" selected="selected">태그유형</option>
					<c:forEach var="type" items="${typeList}" varStatus="status">
						<option value="${type.tgId}" >${type.tgName}</option>
					</c:forEach>
				</select>
				
				<select id="term" name="term" style="width: 80px">
					<option value="" selected="selected" >기간</option>
					<!-- <option value="realTime"  >실시간</option> -->
					<option value="1min"  >1분</option>
					<option value="5min"  >5분</option>
					<option value="15min"  >15분</option>
					<option value="hourly"  >시간별</option>
					<option value="daily"  >일별</option>
					<option value="monthly"  >월별</option>
				</select>
				
				<div id="min" style="display:inline-block;">
					<span class="entry_calendar">
						<input type="text" class="datepicker" id="schDate" name="schDate" readonly="readonly" value="${schDate2}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
					
					<select id="minHourSt" name="minHourStart" style="width: 80px">
						<c:forEach var="n" begin="0" end="23">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />시
							</option>
						</c:forEach>
					</select>
					
					~
					
					<span class="entry_calendar">
						<input type="text" class="datepicker" id="schDate2" name="schDate2" readonly="readonly" value="${schDate3}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
					
					<select id="minHourEnd" name="minHourEnd" style="width: 80px">
						<c:forEach var="n" begin="0" end="23">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />시
							</option>
						</c:forEach>
					</select>
				</div>
				
				<div id="hourly" style="display:inline-block;">
					<span class="entry_calendar">
						<input type="text" class="datepicker" id="schDate4" name="schDate4" readonly="readonly" value="${schDate4}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
					
					~
					
					<span class="entry_calendar">
						<input type="text" class="datepicker" id="schDate5" name="schDate5" readonly="readonly" value="${schDate5}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
				</div>
				
				<div id="daily" style="display:inline-block;">
					<span class="entry_calendar">
						<input type="text" class="datepicker" id="schDate6" name="schDate6" readonly="readonly" value="${schDate6}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
					~
					<span class="entry_calendar">
						<input type="text" class="datepicker" id="schDate7" name="schDate7" readonly="readonly" value="${schDate7}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
				</div>
				
				<div id="monthly" style="display:inline-block;">
					<span class="entry_calendar">
						<input type="text" class="monthPicker" id="schMonth" name="schMonth" readonly="readonly" value="${schMonth}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
					
					~
					
					<span class="entry_calendar">
						<input type="text" class="monthPicker" id="schMonth2" name="schMonth2" readonly="readonly" value="${schMonth}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
				</div>
				
				<div id="realTime" style="display:inline-block;">
					<span class="entry_calendar">
					<input type="text" class="datepicker" id="schDate1" name="schDate1" readonly="readonly" value="${schDate1}" style="width:90px;" ></input>
					<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
				</span>
				
				<select id="rtStartHour" name="rtStartTime" style="width: 80px">
					<option value="" selected="selected" >실시간</option>
					<c:forEach var="n" begin="0" end="23">
						<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />시
						</option>
					</c:forEach>
				</select>
				
				<select id="rtStartMin" name="rtStartTime" style="width: 80px">
					<option value="" selected="selected" >실시간</option>
					<c:forEach var="n" begin="0" end="59">
						<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />분
						</option>
					</c:forEach>
				</select>
				
				~
				
				<input type="text" id="rtEndHour" name="rtEndHour" readonly="readonly" style="width: 50px" />시
				<input type="text" id="rtEndMin" name="rtEndMin" readonly="readonly" style="width: 50px" />분
				</div>				
				<span class="btn_wrap">
					<a class="btnType btn_type02" href="javascript:goSearch();">검색</a>
				</span>
			</div>
		</div>
		<div class="btn_areaR mt5">
			<a class="btn_iconText excel" href="javascript:ExcelDownload();">엑셀다운로드</a>
		</div>
		<div class="trend_chart_area mt5" id="chart">
			chart
		</div>

		</form>
	</div>
<!-- e : content_area -->

<!-- s : data_area -->
<div id="data_area">
	
	<div class="data_area_inner">
		<dl>
			<dt><span class="icon_set sys">Tag별 사용량</span></dt>
			<dd class="scroll" style="max-height:205px;">
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="40%">
					<col width="20%">
					<col width="20%">
					<col width="*">
				</colgroup>

					<thead>
						<tr>
							<th>태그명</th>
							<th>최대값</th>
							<th>최소값</th>
							<th>평균값</th>
						</tr>
					</thead>
					<tbody id="tagUseAmountList">
						<tr>
							<td colspan="4"> 데이터가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set chart">Tag별 상세사용량</span>
				<div class="head_right">
					<span class="reAlarm"  id="refresh"><a href="javascript:callAmountAjax('REFRESH','realTime');">새로고침</a></span>
				</div>
			</dt>
			<dd>
				<div  class="scroll" style="height:610px;">
				<table class="data_row real_time" id="tdSize">
				<caption>caption</caption>
				<colgroup id="colGroup">
					<col width="100px">
					<col width="150px">
					<col width="150px">
					<col width="150px"><!-- 100% -->
					<col width="150px"><!-- 700px -->
					<col width="150px"><!-- 850px -->
				</colgroup>

					<thead id="tagUseDetailAmountHead">
						<tr>
							<th>기간</th>
							<th>-</th>
							<th>-</th>
							<th>-</th>
							<th>-</th>
							<th>-</th>
						</tr>
					</thead>
					<tbody id="tagUseDetailAmountBody">
						<tr>
							<td colspan="6">데이터가 없습니다.</td>
						</tr>
					</tbody>
				</table>
				</div>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->