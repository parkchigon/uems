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
		$("div[id^=monthly]").hide();
		$("div[id^=daily]").hide();
		$("div[id^=hourly]").hide();
		
		//type선택에따른 tagList 셀렉트박스 변경
		$("select[name='tagType']").change(function(){
			var selectedId = $(this).attr("id");
			tagListSelectbox(selectedId);
		});
		
		//기간선택에 따른 템플릿 노출변경
		$("#term").change(function(){
			var value = $("#term option:selected").val();
			$("div[id^=monthly]").hide();
			$("div[id^=daily]").hide();
			$("div[id^=hourly]").hide();
			$("#"+value).show();
			$("#"+value+"_s").show();
			//nowDate(value);
		});
		
	});
	
	// 태그 리스트 selectbox
	function tagListSelectbox(selectedId) {
		var index = selectedId.charAt(selectedId.length-1);
		var url = "/ems/trend/searchTagListAjax.do";
		var tagType = $("#"+selectedId+" option:selected").val();
		var siteCd = $("#siteCd").val();
	
		$.ajax({
			url: url,
			type: "POST",
			data: {tagType:tagType ,siteCd : siteCd},
			dataType: "json",
			async:false
		 }).done (function(data) {
			  
			 var tagList;
			 var length = data.tagList.length;
			 var data = data.tagList;
			 
			 if(length < 1){
				 tagList += "<option value='' >TagList</option>";
			 }else{
				 for(var i=0; i<length; i++){
					 tagList += "<option value='"+data[i].tagId+"' >"+data[i].tagDesc+"</option>";
				 }
			 }
			 $("#tagId_"+index).empty();
			 $("#tagId_"+index).append(tagList);
			 
		 });
	}
	
	
	/* tag선택값 여부   */
	function tagValueSetting(){
		
		var tagId = $("select[name='tagId']").val();
		$("#tagTypeName").val($("select[name='tagType'] option:selected").text());
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
				callAmountAjax();
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
			if(type=='hourly'){
				if($("#hourlyYearFirst").val()=='' ||$("#hourlyMonthFirst").val()==''||$("#hourlyDayFirst").val()==''
					||$("#hourlyYearSecond").val()=='' ||$("#hourlyMonthSecond").val()==''||$("#hourlyDaySecond").val()==''){
					alert("기간을 선택하세요");
					return false;
				}else{
					var firstTemp = $("#hourlyYearFirst").val()+$("#hourlyMonthFirst").val()+$("#hourlyDayFirst").val();
					var secondTemp = $("#hourlyYearSecond").val()+$("#hourlyMonthSecond").val()+$("#hourlyDaySecond").val();
					$("#firstYear").val($("#hourlyYearFirst").val());
					$("#secondYear").val($("#hourlyYearSecond").val());
					$("#firstMonth").val($("#hourlyMonthFirst").val());
					$("#secondMonth").val($("#hourlyMonthSecond").val());
					$("#firstDay").val($("#hourlyDayFirst").val());
					$("#secondDay").val($("#hourlyDaySecond").val());
					$("#firstDate").val(firstTemp+"00");
					$("#firstLastDate").val(firstTemp+"23");
					$("#secondDate").val(secondTemp+"00");
					$("#secondLastDate").val(secondTemp+"23");
					return true;
				}
			}else if(type=='daily'){
				if($("#dailyYearFirst").val()==''||$("#dailyMonthFirst").val()=='' ||$("#dailyYearSecond").val()==''||$("#dailyMonthSecond").val()==''){
					alert("기간을 선택하세요");
					return false;
				}else{
					var firstTemp = $("#dailyYearFirst").val()+$("#dailyMonthFirst").val();
					var secondTemp = $("#dailyYearSecond").val()+$("#dailyMonthSecond").val();
					$("#firstYear").val($("#dailyYearFirst").val());
					$("#secondYear").val($("#dailyYearSecond").val());
					$("#firstMonth").val($("#dailyMonthFirst").val());
					$("#secondMonth").val($("#dailyMonthSecond").val());
					$("#firstDate").val(firstTemp);
					$("#secondDate").val(secondTemp);
					return true;
				}
			}else if(type=='monthly'){
				if($("#monthlyYearFirst").val()==''||$("#monthlyYearSecond").val()==''){
					alert("기간을 선택하세요");
					return false;
				}else{
					$("#firstYear").val($("#monthlyYearFirst").val());
					$("#secondYear").val($("#monthlyYearSecond").val());
					return true;
				}
			}
			
		}
	}
	
	function callAjax(){
	    
		var termType = $("#term option:selected").val();
		var category, dataObj, yAxis;
		$.ajax({
		   url: "/ems/trend/compareMonitoringAjax.do",
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
	            text: 'Compare Monitoring',
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
	function callAmountAjax(){
		
		$.ajax({
			url: "/ems/trend/compareMonitoringAmountAjax.do",
			type: "POST",
			data: $("#tagMonitoringForm").serialize(),
			dataType: "json",
			async:false
		 }).done (function(data) {
			 
			 
			 var tagUseAmount = data.tagUseAmount;
			 var rawDate = data.rawData;
			 var length;
			 //태그별사용량
			 if(tagUseAmount != null){
				 length = tagUseAmount.length;
				 var tagUseAmountList;
				 
				 for(var i=0; i< length; i++){
					 tagUseAmountList += '<tr>';
					 tagUseAmountList += '<th>'+tagUseAmount[i].tagDate+'  '+tagUseAmount[i].tagId+'</td>';
					 tagUseAmountList += '<td>'+tagUseAmount[i].maxTagValue+'</td>';
					 tagUseAmountList += '<td>'+tagUseAmount[i].minTagValue+'</td>';
					 tagUseAmountList += '<td><span class="font_yellow">'+tagUseAmount[i].avgTagValue+'</span></td>';
					 tagUseAmountList += '</tr>';
					 
				 }
				 tagUseAmountList += '<tr>';
				 tagUseAmountList += '<th>'+tagUseAmount[1].tagDate+'  대비 차이(값)</td>';
				 tagUseAmountList += '<td>'+rawDate.diffMax+'</td>';
				 tagUseAmountList += '<td>'+rawDate.diffMin+'</td>';
				 tagUseAmountList += '<td><span class="font_yellow">'+rawDate.diffAvg+'</span></td>';
				 tagUseAmountList += '</tr>';
				 
				 tagUseAmountList += '<tr>';
				 tagUseAmountList += '<th>'+tagUseAmount[1].tagDate+'  대비 비율(%)</td>';
				 if(rawDate.diffMaxRt > 0){
					 tagUseAmountList += '<td><span class="font_blue">▲</span>'+rawDate.diffMaxRt+'%</td>';
				 }else if(rawDate.diffMaxRt < 0){
					 tagUseAmountList += '<td><span class="font_red">▼</span>'+rawDate.diffMaxRt+'%</td>';
				 }else{
					 tagUseAmountList += '<td>'+rawDate.diffMaxRt+'%</td>';
				 }
				 if(rawDate.diffMinRt > 0){
					 tagUseAmountList += '<td><span class="font_blue">▲</span>'+rawDate.diffMinRt+'%</td>';
				 }else if(rawDate.diffMinRt < 0){
					 tagUseAmountList += '<td><span class="font_red">▼</span>'+rawDate.diffMinRt+'%</td>';
				 }else{
					 tagUseAmountList += '<td>'+rawDate.diffMinRt+'%</td>';
				 }
				 if(rawDate.diffAvgRt > 0){
					 tagUseAmountList += '<td><span class="font_blue">▲</span>'+rawDate.diffAvgRt+'%</td>';
				 }else if(rawDate.diffAvgRt < 0){
					 tagUseAmountList += '<td><span class="font_red">▼</span>'+rawDate.diffAvgRt+'%</td>';
				 }else{
					 tagUseAmountList += '<td>'+rawDate.diffAvgRt+'%</td>';
				 }
				 tagUseAmountList += '</tr>';
				 
				 $("#tagUseAmountList").empty();
				 $("#tagUseAmountList").append(tagUseAmountList);
			 }
			 
			 var tagUseDetailAmount = data.tagUseDetailAmount;
			 var tagNameList = data.tagNameList;
			 var length;
			 
			 //태그별상세사용량
			 //head
			 var tagName;
		 	 tagName += '<tr rowspan="2">';
		 	 tagName += '<th rowspan="2">기 간</th>';
	 		 tagName += '<th rowspan="2">'+tagUseAmount[0].tagDate+' <br> '+tagUseAmount[0].tagId+'</th>';
			 tagName += '<th rowspan="2">'+tagUseAmount[1].tagDate+' <br> '+tagUseAmount[1].tagId+'</th>';
			 tagName += '<th rowspan="2">'+tagUseAmount[1].tagDate+'  <br>대비 차이(값)</th>';
			 tagName += '<th rowspan="2">'+tagUseAmount[1].tagDate+'  <br>대비 비율(%)</th>';
			 tagName += '</tr>';
			 $("#tagUseDetailAmountHead").empty();
			 $("#tagUseDetailAmountHead").append(tagName);
			 
			 //body
			 if(tagUseDetailAmount != null){
				 
				 var BodyLength = tagUseDetailAmount.length;
				 var tagUseDetailAmountList;
				 var tempValue0, tempValue1, tempValue2, tempValue3;
				 for(var i=0; i<BodyLength; i++){
					 tempValue0  = tagUseDetailAmount[i].tagValueAvg0 == undefined ? '-' : tagUseDetailAmount[i].tagValueAvg0;
					 tempValue1  = tagUseDetailAmount[i].tagValueAvg1 == undefined ? '-' : tagUseDetailAmount[i].tagValueAvg1;
					 tempValue2  = tagUseDetailAmount[i].tagValueAvg2 == undefined ? '-' : tagUseDetailAmount[i].tagValueAvg2;
					 tempValue3  = tagUseDetailAmount[i].tagValueAvg3 == undefined ? '-' : tagUseDetailAmount[i].tagValueAvg3;
					 tagUseDetailAmountList += '<tr>';
					 tagUseDetailAmountList += '<td>'+tagUseDetailAmount[i].statHour+'</td>';
					 tagUseDetailAmountList += '<td>'+tempValue0+'</td>';
					 tagUseDetailAmountList += '<td>'+tempValue1+'</td>';
					 tagUseDetailAmountList += '<td>'+tempValue2+'</td>';
					 if(tempValue3 > 0){
						 tagUseDetailAmountList += '<td><span class="font_blue">▲</span>'+tempValue3+'%</td>';
					 }else if(tempValue3 < 0 ){
						 tagUseDetailAmountList += '<td><span class="font_red">▼</span>'+tempValue3+'%</td>';
					 }else{
						 tagUseDetailAmountList += '<td>'+tempValue3+'%</td>';
					 }
					 tagUseDetailAmountList += '</tr>';
				 }
				 $("#tagUseDetailAmountBody").empty();
				 $("#tagUseDetailAmountBody").append(tagUseDetailAmountList);
			 } 
			 
		 })
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
				$("#monitoringType").val("compare");
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
			<li class="on"><a href="/ems/trend/compareMonitoring.do">비교 모니터링</a></li>
			<c:if test="${(sessionScope.ROLE_ID eq 'ROL_0000000000000000') or (sessionScope.ROLE_ID eq 'ROL_9999999999999999') or (sessionScope.ROLE_ID eq 'ROL_0000000000000003')}">
				<li><a href="/ems/trend/indicatorMonitoring.do">지표 모니터링</a></li>
			</c:if>
		</ul>
	</div>
	<form id="tagMonitoringForm" name="tagMonitoringForm" method="POST">
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}">
	<input type="hidden" id="firstYear" name="firstYear" value="">
	<input type="hidden" id="secondYear" name="secondYear" value="">
	<input type="hidden" id="firstMonth" name="firstMonth" value="">
	<input type="hidden" id="secondMonth" name="secondMonth" value="">
	<input type="hidden" id="firstDay" name="firstDay" value="">
	<input type="hidden" id="secondDay" name="secondDay" value="">
	<input type="hidden" id="refreshYn" name="refreshYn" value="N">
	<input type="hidden" id="firstDate" name="firstDate" value="">
	<input type="hidden" id="secondDate" name="secondDate" value="">
	<input type="hidden" id="firstLastDate" name="firstLastDate" value="">
	<input type="hidden" id="secondLastDate" name="secondLastDate" value="">
	<input type="hidden" id="monitoringType" name="monitoringType" value="">
	<input type="hidden" id="tagTypeName" name="tagTypeName" value="">
	
	<div class="trend_area">
		<div class="trend_search_area">
			<div class="trend_search_inner">
				<select id="tagType_0" name="tagType" style="width: 130px">
					<c:forEach var="type" items="${typeList}" varStatus="status">
							<option value="${type.codeUseName}" >${type.codeName}</option>
					</c:forEach>
				</select>
				
				<select id="tagId_0" name="tagId" style="width: 200px">
					<option value="" selected="selected" >TagList</option>
				</select>
				
				<select id="term" name="term" style="width: 80px">
					<option value="" selected="selected" >기간</option>
					<option value="hourly"  >시간별</option>
					<option value="daily"  >일별</option>
					<option value="monthly"  >월별</option>
				</select>
				
				<div id="hourly" style="display:inline-block;">
					<select id="hourlyYearFirst" name="hourlyYearFirst" style="width: 80px;">
						<option value="">--년도</option>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="yyyy" var="nowDate"/> 
						<c:forEach var="n" begin="${nowDate-10}" end="${nowDate+10}">
						<option value="${n}">${n}년</option>
						</c:forEach>
					</select>
					<select id="hourlyMonthFirst" name="hourlyMonthFirst" style="width: 80px;">
						<option value="">-- 월</option>
						<c:forEach var="n" begin="1" end="12">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />월
							</option>
						</c:forEach>
					</select>
					<select id="hourlyDayFirst" name="hourlyDayFirst" style="width: 80px;">
						<option value="">-- 일</option>
						<c:forEach var="n" begin="1" end="31">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />일
							</option>
						</c:forEach>
					</select>
				</div>
				
				<div id="daily" style="display:inline-block;">
					<select id="dailyYearFirst" name="dailyYearFirst" style="width: 80px;">
						<option value="">--년도</option>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="yyyy" var="nowDate"/> 
						<c:forEach var="n" begin="${nowDate-10}" end="${nowDate+10}">
						<option value="${n}">${n}년</option>
						</c:forEach>
					</select>
					<select id="dailyMonthFirst" name="dailyMonthFirst" style="width: 80px;">
						<option value="">-- 월</option>
						<c:forEach var="n" begin="1" end="12">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />월
							</option>
						</c:forEach>
					</select>
				</div>
				
				<div id="monthly" style="display:inline-block;">
					<select id="monthlyYearFirst" name="monthlyYearFirst" style="width: 80px;" >
						<option value="">--년도</option>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="yyyy" var="nowDate"/> 
						<c:forEach var="n" begin="${nowDate-10}" end="${nowDate+10}">
						<option value="${n}">${n}년</option>
						</c:forEach>
					</select>
				</div>
				
				<span class="btn_wrap">
					<a class="btnType btn_type02" href="javascript:goSearch();">검색</a>
				</span>
			</div>
			<div class="trend_search_inner">
				<div id="hourly_s" style="display:inline-block;">
					<select id="hourlyYearSecond" name="hourlyYearSecond" style="width: 80px;margin-left:393px;"">
						<option value="">--년도</option>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="yyyy" var="nowDate"/> 
						<c:forEach var="n" begin="${nowDate-10}" end="${nowDate+10}">
						<option value="${n}">${n}년</option>
						</c:forEach>
					</select>
					<select id="hourlyMonthSecond" name="hourlyMonthSecond" style="width: 80px;">
						<option value="">-- 월</option>
						<c:forEach var="n" begin="1" end="12">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />월
							</option>
						</c:forEach>
					</select>
					<select id="hourlyDaySecond" name="hourlyDaySecond" style="width: 80px;">
						<option value="">-- 일</option>
						<c:forEach var="n" begin="1" end="31">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />일
							</option>
						</c:forEach>
					</select>
				</div>
				<div id="daily_s" style="display:inline-block;">
					<select id="dailyYearSecond" name="dailyYearSecond" style="width: 80px;margin-left:393px;">	
						<option value="">--년도</option>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="yyyy" var="nowDate"/> 
						<c:forEach var="n" begin="${nowDate-10}" end="${nowDate+10}">
						<option value="${n}">${n}년</option>
						</c:forEach>
					</select>
					<select id="dailyMonthSecond" name="dailyMonthSecond" style="width: 80px;">
						<option value="">-- 월</option>
						<c:forEach var="n" begin="1" end="12">
							<option value="<fmt:formatNumber value='${n}' pattern='00' />">
							<fmt:formatNumber value='${n}' pattern='00' />월
							</option>
						</c:forEach>
					</select>
				</div>
				<div id="monthly_s" style="display:inline-block;">
					<select id="monthlyYearSecond" name="monthlyYearSecond" style="width: 80px;margin-left:393px;">
						<option value="">--년도</option>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${now}" pattern="yyyy" var="nowDate"/> 
						<c:forEach var="n" begin="${nowDate-10}" end="${nowDate+10}">
						<option value="${n}">${n}년</option>
						</c:forEach>
					</select>
				</div>
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