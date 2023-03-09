<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>
<script type="text/javaScript" src="/resources/ems/js/lib/Highcharts-5.0.11/code/themes/dark-unica.js"></script>
<script type="text/javaScript">

	$(document).ready(function(){
		
		// 설비제어 > 트랜드보기 버튼으로 이동 시 
		var tagId = '${tagInfo.tagId}';
		var tagKindCd = '${tagInfo.tagKindCd}';
		if(!isEmpty(tagId)) {
			$("#tagType_0").val(tagKindCd);
			tagListSelectbox('tagType_0');
			$("#tagId_0").val(tagId);
		}
		
		//기간 조건에 따라 검색조건 노출 여부 (초기세팅)
		$("#min").hide();
		$("#monthly").hide();
		$("#daily").hide();
		$("#hourly").hide();
		
		//type선택에따른 tagList 셀렉트박스 변경
		$("select[name='tagType']").change(function(){
			$("#min").hide();
			$("#monthly").hide();
			$("#daily").hide();
			$("#hourly").hide();
			var selectedId = $(this).val();
			tagListSelectbox(selectedId);
		});
		
		//기간선택에 따른 템플릿 노출변경
		$("#term").change(function(){
			var value = $("#term option:selected").val();
			$("#min").hide();
			$("#monthly").hide();
			$("#daily").hide();
			$("#hourly").hide();
			$("#"+value).show();
			nowDate(value);
		});
		
	});
	
	/* 현재날짜구하기+시작일,종료일 자동설정 */
	function nowDate(type){

		var now = new Date();
	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    var hour = now.getHours();
	    var minute = now.getMinutes(); 
	    var seconde = now.getSeconds();
	    var endDate = year + '-' + mon + '-' + day;
	    var startDate;
	    
	    if(type == 'min'){
	    	var stDay = now.getDate()>9 ? ''+(now.getDate()-1) : '0'+(now.getDate()-1);
	    	var enDay = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    	startDate = year + '-' + mon + '-' + stDay;
	    	endDate = year + '' + mon + '' + enDay;
	    	$("#schDate").val(year + '-' + mon + '-' + enDay);
	    	$("#startDate").val(year + '' + mon + '' + stDay);
	    	$("#endDate").val(endDate);
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
	    }
	}
	
	// 지표태그유형 선택에 따른 기간유형 노출 여부
	function tagListSelectbox(selectedId) {
		/*  anal_code = '01' '02' '03'  분min
						'11' '12' '13' '14' 시간hour
						 나머지 : 일day/월month
		*/
		if(selectedId == '01' || selectedId == '02' ||selectedId == '03'){
			var selectTerm = '';
			selectTerm += "<option value=''>기간</option>";
			selectTerm += "<option value='min'>분별</option>";
			$("#term").empty();
			$("#term").append(selectTerm);
		}else if (selectedId == '11' ||selectedId == '12' ||selectedId == '13' ||selectedId == '14'){
			var selectTerm = '';
			selectTerm += "<option value=''>기간</option>";
			selectTerm += "<option value='hourly'>시간별</option>";
			$("#term").empty();
			$("#term").append(selectTerm);
		}else{
			var selectTerm = '';
			selectTerm += "<option value=''>기간</option>";
			selectTerm += "<option value='daily'>일별</option>";
			selectTerm += "<option value='monthly'>월별</option>";
			$("#term").empty();
			$("#term").append(selectTerm);
		}
		
	}
	
	
	/* tag선택값 여부   */
	function tagValueSetting(){
		
		var tagId = $("select[name='tagId']").val();
		if(tagId = ''){
			alert("태그유형을 선택해주세요");
			return false;
		}else{
			return true;
		}
	}
	
	/* 검색 */
	var realTime;
	function goSearch(){
		// 실시간조회여부 확인
		var termType = $("#term option:selected").val();
		if(tagValueSetting()){
			if(termValueSetting(termType)){
				callAjax();
			}
		}
	}
	
	/* 기간타입선택에 따른 검색조건 값 setting */
	function termValueSetting(termType){
		
		if(termType == ''){
			alert("기간유형을 선택하세요."); 
			return false;
		}else{
			var type = $("#term option:selected").val();
			if(type == 'min'){
				var date = new Date($("#schDate").val());
				var year= date.getFullYear();
			    var mon = (date.getMonth()+1)>9 ? ''+(date.getMonth()+1) : '0'+(date.getMonth()+1);
			    var stDay = date.getDate()>9 ? ''+(date.getDate()-1) : '0'+(date.getDate()-1);
		    	var enDay = date.getDate()>9 ? ''+date.getDate() : '0'+date.getDate();
		    	$("#startDate").val(year+""+mon+""+stDay+"2300");
		    	$("#endDate").val(year+""+mon+""+enDay+"2259");
				
		    }else if(type == 'hourly'){
		    	$("#startDate").val($("#schDate4").val().replace(/-/gi, ""));
				$("#endDate").val($("#schDate5").val().replace(/-/gi, ""));
				var stDate = new Date($("#schDate4").datepicker("getDate"));
				var enDate = new Date($("#schDate5").datepicker("getDate"));
				var tmpDate = new Date($("#schDate4").datepicker("getDate"));
				tmpDate.setDate(stDate.getDate()+7);
				if(tmpDate-enDate < 0){
					alert("최대설정범위는 7일 입니다.")
					return false;
				}
		    }else if(type == 'daily'){
		    	$("#startDate").val($("#schDate6").val().replace(/-/gi, ""));
				$("#endDate").val($("#schDate7").val().replace(/-/gi, ""));
				var stDate = new Date($("#schDate6").datepicker("getDate"));
				var enDate = new Date($("#schDate7").datepicker("getDate"));
				
				var tmpDate = new Date($("#schDate6").datepicker("getDate"));
				tmpDate.setMonth(stDate.getMonth()+2);
				if(tmpDate-enDate < 0){
					alert("최대설정범위는 2달 입니다.")
					return false;
				}
		    }else if(type == 'monthly'){
		    	$("#startDate").val($("#schMonth").val().replace(/-/gi, ""));
				$("#endDate").val($("#schMonth2").val().replace(/-/gi, ""));
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
	
	function callAjax(){
	    
		var termType = $("#term option:selected").val();
		var category, dataObj, yAxis;
		$.ajax({
			url: "/ems/trend/indicatorMonitoringAjax.do",
			type: "POST",
			data: $("#tagMonitoringForm").serialize(),
			dataType: "json",
			async:false
		}).done (function(data) {
			
		    category = data.xList;//x축
		    console.log(category);
		    dataObj = data.yList;
		    yAxis = data.yAxis;
		   
			var tagUseDetailAmount = data.tagUseDetailAmount;
			console.log(tagUseDetailAmount);
			var tagNameList = data.tagNameList;
			console.log(tagNameList);
			var length;
			var tagUseAmount = data.tagUseAmount;
			console.log(tagUseAmount);
			var tagName;
			//태그별상세사용량
			if(tagUseDetailAmount.length > 0){
			 	 var BodyLength = tagUseDetailAmount.length;
				 
				 tagName += '<tr>';
				 tagName += '<th>기간</th>';
				 tagName += '<th>'+tagUseAmount[0].tagId+'</th>';
				 tagName += '</tr>';
				 
				 var tagUseDetailAmountList;
				 for(var i=0; i<BodyLength; i++){
					 tagUseDetailAmountList += '<tr>';
					 tagUseDetailAmountList += '<td>'+tagUseDetailAmount[i].statHour+'</td>';
					 if(tagUseDetailAmount[i].analValue != null){
						 tagUseDetailAmountList += '<td>'+tagUseDetailAmount[i].analValue+'</td>';
					 } else{
						 tagUseDetailAmountList += '<td> - </td>';
					 }
					 tagUseDetailAmountList += '</tr>';
				 }
				 
			}else{
				tagUseDetailAmountList += '<tr><td>데이터가 없습니다</td></tr>';
			}
			$("#tagUseDetailAmountHead").empty();
			$("#tagUseDetailAmountHead").append(tagName);
			$("#tagUseDetailAmountBody").empty();
			$("#tagUseDetailAmountBody").append(tagUseDetailAmountList); 
			
			 //태그별사용량
			 var tagUseAmountList;
			 if(tagUseAmount.length > 0){
				 length = tagUseAmount.length;
				 console.log("111"+length);
				 for(var i=0; i< length; i++){
					 if(tagUseAmount[i] != null){
						 tagUseAmountList += '<tr>';
						 tagUseAmountList += '<th>'+tagUseAmount[i].tagId+'</td>';
						 tagUseAmountList += '<td>'+tagUseAmount[i].maxTagValue+'</td>';
						 tagUseAmountList += '<td>'+tagUseAmount[i].minTagValue+'</td>';
						 tagUseAmountList += '<td><span class="font_yellow">'+tagUseAmount[i].avgTagValue+'</span></td>';
						 tagUseAmountList += '</tr>';
					 }else{
						 tagUseAmountList += '<tr><td colspan="4">데이터가 없습니다</td></tr>';
					 }
					 
				 }
			 }else{
				 tagUseAmountList += '<tr><td colspan="4">데이터가 없습니다</td></tr>';
			 }
			 $("#tagUseAmountList").empty();
			 $("#tagUseAmountList").append(tagUseAmountList);
		});
		Highcharts.chart('chart', {
	        title: {
	            text: 'Indicator Monitoring',
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

	/* 검색조건 초기화 */
	function reset(num){
		$("#tagType_"+num).val('TAG_KIND');
		$("#tagId_"+num).empty();
		$("#tagId_"+num).append("<option value='' >TagList</option>");
	}
	
	/* TAG 사용량 엑셀다운로드 */
	function ExcelDownload(){
		var termType = $("#term option:selected").val();
		if(tagValueSetting()){
			if(termValueSetting(termType)){
				$("#monitoringType").val("indicator");
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
			<li><a href="/ems/trend/trendMonitoring.do">트랜드 모니터링</a></li>
			<li><a href="/ems/trend/compareMonitoring.do">비교 모니터링</a></li>
			<li class="on"><a href="/ems/trend/indicatorMonitoring.do">지표 모니터링</a></li>
		</ul>
	</div>
	<form id="tagMonitoringForm" name="tagMonitoringForm" method="POST">
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}">
	<input type="hidden" id="refreshYn" name="refreshYn" value="N">
	<input type="hidden" id="monitoringType" name="monitoringType">
	<input type="hidden" id="schDate1" name="schDate1" value="">
	<input type="hidden" id="startDate" name="startDate" value="">
	<input type="hidden" id="endDate" name="endDate" value="">
	
	<div class="trend_area">
		<div class="trend_search_area">
			<div class="trend_search_inner">
				<select id="tagType_0" name="tagType" style="width: 300px">
					<option value="">지표 태그유형</option>
					<c:forEach var="type" items="${typeList}" varStatus="status">
							<option value="${type.analCode}" >${type.analName}</option>
					</c:forEach>
				</select>
				
				<select id="term" name="term" style="width: 80px">
					<option value="" selected="selected" >기간</option>
				</select>
				
				<div id="min" style="display:inline-block;">
					<span class="entry_calendar">
						<input type="text" class="datepicker" id="schDate" name="schDate" readonly="readonly" value="${schDate}" style="width:90px;" ></input>
						<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
					</span>
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
	
	</div>
	</form>
</div>
<!-- e : content_area -->

<!-- s : data_area -->
<div id="data_area">
	
	<div class="data_area_inner">
		<dl>
			<dt><span class="icon_set sys">Tag별 사용량</span></dt>
			<dd>
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
			</dt>
			<dd>
				<div  class="scroll" style="height:610px;">
				<table class="data_row real_time">
				<caption>caption</caption>
				<colgroup>
					<col width="85px">
					<col width="*">
				</colgroup>

					<thead id="tagUseDetailAmountHead">
						<tr>
							<th>기간</th>
							<th>-</th>
							<th>-</th>
							<th>-</th>
							<th>-</th>
						</tr>
					</thead>
					<tbody id="tagUseDetailAmountBody">
						<tr>
							<td colspan="6">-</td>
						</tr>
					</tbody>
				</table>
				</div>
			</dd>
		</dl>
	</div>
</div>
<!-- e : data_area -->