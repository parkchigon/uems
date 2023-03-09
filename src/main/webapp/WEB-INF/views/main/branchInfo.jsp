<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>
<script type="text/javascript" src="/resources/uems/js/lib/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/uems/js/dashboard.js"></script>

<script type='text/javascript'>//<![CDATA[
$(document).ready(function(){

	selectSiteList($("select[name=sgId] option:selected").val());
	
	$("select[name=sgId]").change(function(){
		selectSiteList($(this).val());
	});
	
	$("select[name=siteId]").change(function(){
		callAllAjax($(this).val());
	})
	
	$(".btn_calender").click(function(){
		$(this).prev().focus();
	});
	
	initDatePickers();
	
	//일별/월별 선택에 따른 datepicker/monthpicker 변경 및 차트 검색
	$("input:radio[name^=dateMonth]").click(function(){
		var schCalender = $(this).val();
		
        if($("#"+schCalender).css("display") == "none"){
        	$("span[id^='"+schCalender.substring(0,6)+"']").hide();
        	$("#"+schCalender).show();
        }
        var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = addZeros(currentDate.getMonth()+1,2);
		var day = addZeros(currentDate.getDate(),2);
		
        if(schCalender == 'devIndDatepicker'){ // 주요 지표 데이터 일별
        	$("#"+schCalender+" > input").val(year+"-"+month+"-"+day);
        	callStackAjax($("#month").val(), $("#subType").val(),'MainIndicatorsData',$("#siteId").val());
        }else if(schCalender == 'MainIndicatorsData'){// 주요 지표 데이터 월별
        	$("#"+schCalender+" > input").val(year+"-"+month);
        	callStackAjax($("#month").val(), $("#subType").val(),'MainIndicatorsData',$("#siteId").val());
        }else if(schCalender == 'devChaDatepicker'){// 사용요금 비교 데이터 일별
        	$("#"+schCalender+" > input").val(year+"-"+month+"-"+day);
        	callLineAjax(year+month+day,'UsageChargeData',$("#siteId").val());
        }else if(schCalender == 'devChaMonthPicker'){// 사용요금데이터 --> 냉동기 축냉효율
        	/* $("#"+schCalender+" > input").val(year+"-"+month);
        	callLineAjax(year+month,'UsageChargeData',$("#siteId").val()); */
        }else if(schCalender = 'ChillerColdstorageData'){ // 냉동기 축냉효율
        	callChillerAjax(month,'ChillerColdstorageData',$("#siteId").val())
        }
    });
	
	$("input:radio[name=subType]").click(function(){
		var subType = $(this).val();
		var month = $("#month").val();
		callStackAjax(month, subType,'MainIndicatorsData',$("#siteId").val());
	});
	
});

//지점정보 진입 시, 지점그룹 or 지점 변경 시
function callAllAjax(siteId){
	var currentDate = new Date();
	var year = currentDate.getFullYear();
	var month = addZeros(currentDate.getMonth()+1,2);
	var day = addZeros(currentDate.getDate(),2);
	
	//검색조건 초기화
	searchReset(year, month, day);
	
	$("#schIndDateCondition").trigger("click");
	$("#schChaDateCondition").trigger("click");
	
	//날씨
	weatherInfo(siteId);
	
	//지점정보, 이력 ajax
	callInfoAjax(siteId);
	//총 냉방 사용요금
	callAjax($("select[id=year0]").val(),'BranchTotalCoolCharge',siteId);
	//CO2 배출량
	callAjax($("select[id=year1]").val(),'BranchCo2Emissions',siteId);
	//주요 지표 데이터
	$("input[name=subType]")[0].checked = true; 
	callStackAjax($("#month").val(), $("input[name=subType]").val(), 'MainIndicatorsData',siteId);
	//사용요금 비교 데이터
	//callLineAjax(year+month+day,'UsageChargeData',siteId);
	//냉동기 축냉효율
	callChillerAjax($("#schChaMonthCondition").val(),'ChillerColdstorageData',siteId);
	chgCallChillerAjax(0, '', siteId);

}

//지점정보, 이력 ajax
function callInfoAjax(siteId){
	$.ajax({
		   url: "/uems/main/branchInfoAjax.do",
		   type: "POST",
		   data: {siteId:siteId},
		   dataType: "json",
		   async:false
		}).done (function(data) {
			$(".devVal").empty();
			$("#workHistoryList").empty();
			var result = data.result;
			var workHistoryList = data.workHistoryList;
			var html = '';
			var valArray = [ result.siteDesc
			                ,result.totalArea
			                ,result.iceSystemSdate
			                ,result.peakLoad+' USRt.h'
			                ,result.volumn+' USRt-hr'
			                ,'<p>(야간) '+result.volumeNight+" USRt.h</p><p>(주간) "+result.volumeDay+" USRt.h</p>"
			                ,result.chargePersonName+' : '+result.chargePersonTel
			                ,result.techOperationTel];
			
			$(".devVal").each(function(i){
				$(this).append(valArray[i]);
			});
			
			$.each(workHistoryList, function(i, val){
				html += '<li>> '+val.workDate+' : '+val.title+'</li>';
			});
			
			$("#workHistoryList").append(html);
			
		});
	
}

//냉동기 축냉효율
function chgCallChillerAjax(idx, name, siteId)
{
/* 	$.ajax({
		   url: "/uems/main/chillerCountInfoAjax.do",
		   type: "POST",
		   data: {siteId:siteId},
		   dataType: "json",
		   async:false
		}).done (function(data) {
			var result = data.selectChillerCount;

			var selectChiller = document.getElementById("schChillNoCondition") 
			selectChiller.options.length = 0;
			
			for (var i=0; i<result.chillerCount; i++)
			{
				selectChiller.add(new Option("냉동기 "+(i+1)+"번",i),i);
			}
			
			$("select[name=schChillNoCondition] option:eq("+idx+")").attr("selected","selected");
			
		}); */
	callChillerAjax($("#schChaMonthCondition").val(),'ChillerColdstorageData',siteId);
}

function chgMainIndicatorsData(month)
{
	var subTypeValue = "";	
	
	if ($('#schTypeCondition1').is(":checked")) {
		subTypeValue = "SUB_1"
	} else if ($('#schTypeCondition2').is(":checked")){
		subTypeValue = "SUB_2"
	}

	callStackAjax(month, subTypeValue, 'MainIndicatorsData', $('#siteId').val());
}


</script>
<div id="header">
	<h1><img src="/resources/uems/images/total/logo.png" alt="ENERZENT" /></h1>
	<div class="topUtil">
		<span class="user">${sessionScope.AUTH.mngName} 님</span>
		<a class="btn_login" href="/login/logout.do">LOGOUT</a>
	</div>
	<div id="gnb">
		<a href="/uems/main.do">총계</a>
		<a href="#" class="on">지점정보</a>
		<a href="/uems/report.do">보고서</a>
	</div>
	<div class="header_right">
		<span class="toDay" id="clock">2017년 05월 25일(월) 10:00:00</span>
		<div class="links">
			<a href="/uems/mng/site/siteGroupList.do">관리</a>
			<a href="javascript: goIntegration();">통합센터</a>
		</div>
	</div>
</div>
<div id="container">
	
	<div class="content_head_area">
		<span class="weather"><strong>24℃</strong> <em>최저기온 : 18℃ / 최고기온 : 30℃</em></span>
			<!-- 			
			sun					/* 낮 맑음 */
			sun_cloudy			/* 낮 구름조금 */
			sun_cloudy2			/* 낮 구름많음 */
			sun_rain			/* 낮 한때 비 */
			
			moon				/* 밤 맑음 */
			moon_cloudy	 		/* 밤 구름조금 */
			moon_cloudy2  		/* 밤 구름많음 */
			moon_rain		 	/* 밤 한때 비 */
			
			less_rain		 	/* 비조금 */
			less_show		 	/* 눈조금 */
			rain				/* 비 */
			show			 	/* 눈 */
			rain_show	 		/* 비 또는 눈 */
			lightning			/* 번개 */
			 -->		
		
		<div class="fr">
			<select id="sgId" name="sgId" style="width: 160px">
				<c:forEach var="result" items="${groupAllList}" varStatus="status">
					<option value="${result.sgId}">${result.sgName}</option>
				</c:forEach>
			</select>
			<select id="siteId" name="siteId" style="width: 160px">
			</select>
		</div>
	</div>
	
	<!-- s : content_area -->
	<div id="content_area">
	
		<div class="fl">	
			<div class="info_area">
				<dl>
					<dt class="devVal">이마트 동인천점</dt>
					<dd>
						<table class="table_wrap">
						<caption>caption</caption>
						<colgroup>
							<col width="120px">
							<col width="150px">
							<col width="*">
						</colgroup>
		
							<tbody>
								<tr>
									<th scope="row">연면적</th>
									<td colspan="2" class="devVal">
										<!-- 3500평 -->
									</td>
								</tr>
								<tr>
									<th scope="row">빙축열운영</th>
									<td colspan="2" class="devVal">
										<!-- 2015.07.01 -->
									</td>
								</tr>
								<tr>
									<th scope="rowgroup" rowspan="3">장비현황</th>
									<th scope="row">피크용량</th>
									<td class="devVal"><!-- 360 USRt.h --></td>
								</tr>
								<tr>
									<th scope="row">빙축조 용량</th>
									<td class="devVal"><!-- 1360 USRt-hr --></td>
								</tr>
								<tr>
									<th scope="row">냉동기 용량</th>
									<td class="devVal">
										<!-- <p>(야간) 360 USRt.h</p>
										<p>(주간) 360 USRt.h</p> -->
									</td>
								</tr>
								<tr>
									<th scope="rowgroup" rowspan="2">연락망</th>
									<th scope="row">담당자</th>
									<td class="devVal"><!-- 홍길동 : 010-1234-5678 --></td>
								</tr>
								<tr>
									<th scope="row">기술운영팀</th>
									<td class="devVal"><!-- 032-0000-0000, 0001 --></td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
			
			<div class="chart_area mt20">
				<dl>
					<dt>주요 지표 데이터
						<span class="fr">
							<input type="radio" id="schTypeCondition1" name="subType" value="SUB_1" checked="checked"><label for="schTypeCondition1">축냉량</label> &nbsp;&nbsp;
							<input type="radio" id="schTypeCondition2" name="subType" value="SUB_2"><label for="schTypeCondition2">방냉량</label> &nbsp;&nbsp;
						<select id="month" name="month" style="width: 130px" onchange="javascript:chgMainIndicatorsData($(this).val());"><!-- 월 -->
								<c:forEach var="n" begin="4" end="11">
									<option value="<fmt:formatNumber value='${n}' pattern='00' />">
									<fmt:formatNumber value='${n}' pattern='00' /> 월
									</option>
								</c:forEach>
							</select> 
						</span>
					</dt>
					<dd style="height: 207px;" id="mainIndicatorsDataChart">
						차트 영역(688*207)
					</dd>
				</dl>
			</div>
		</div>
		
		<div class="fr">
			<div class="chart_area">
				<dl>
					<dt>이력</dt>
					<dd>
						<div style="overflow:auto;height:210px;">
							<ul id="workHistoryList"></ul>
						</div>
					</dd>
				</dl>
			</div>
			
			<div class="chart_area mt20">
				<dl>
					<dt>총 냉방 사용요금
						<span class="fr">
							<select style="width: 130px" id="year0" onchange="javascript:callAjax($(this).val(), 'BranchTotalCoolCharge', $('#siteId').val());">
								<c:forEach var="result" items="${selectYearList}" varStatus="status">
									<option value="${result.year}">${result.year}년</option>
								</c:forEach>
							</select>
						</span>
					</dt>
					<dd>
						<div class="left_chart" id="branchTotalCoolChargeChart">
							차트 영역(470*207)
						</div>
						
						<div class="right_table">
							<table class="chart_inner_table">
							<caption>caption</caption>
							<colgroup>
								<col width="35%">
								<col width="*">
							</colgroup>
			
								<tbody>
									<tr>
										<th scope="col">월</th>
										<th scope="col">절감비율</th>
									</tr>
								</tbody>
								<tbody id="BranchTotalCoolCharge">
								</tbody>
							</table>
						</div>
					</dd>
				</dl>
			</div>
		</div>
		
		<div class="both"></div>
		
		<div class="mt20">
			<div class="chart_area fl">
				<dl>
					<dt>CO2 배출량
						<span class="fr">
							<select style="width: 130px" id="year1" onchange="javascript:callAjax($(this).val(), 'BranchCo2Emissions', $('#siteId').val());">
								<c:forEach var="result" items="${selectYearList}" varStatus="status">
									<option value="${result.year}">${result.year}년</option>
								</c:forEach>
							</select>
						</span>
					</dt>
					<dd>
						<div class="left_chart" id="branchCo2EmissionsChart">
							차트 영역(470*207)
						</div>
						
						<div class="right_table">
							<table class="chart_inner_table">
							<caption>caption</caption>
							<colgroup>
								<col width="35%">
								<col width="*">
							</colgroup>
			
								<tbody>
									<tr>
										<th scope="col">월</th>
										<th scope="col">증감량</th>
									</tr>
								</tbody>
								<tbody id="BranchCo2Emissions">
								</tbody>
							</table>
						</div>
					</dd>
				</dl>
			</div>
			
			<div class="chart_area fr">
				<dl>
					<dt>냉동기 축냉효율
						<span class="fr">
							<select id="schChillNoCondition" name="schChillNoCondition" style="width: 130px;margin-left: 15px;" onchange="javascript:chgCallChillerAjax($(this).val(),'schChillNoCondition', $('#siteId').val());">
							</select>
							<select id="schChaMonthCondition" name="schChaMonthCondition" style="width: 130px;margin-left: 15px;" onchange="javascript:callChillerAjax($(this).val(),'ChillerColdstorageData', $('#siteId').val());">
								<c:forEach var="n" begin="4" end="11">
									<option value="<fmt:formatNumber value='${n}' pattern='00' />">
									<fmt:formatNumber value='${n}' pattern='00' /> 월
									</option>
								</c:forEach>					
							</select>
						</span>
					</dt>
					<dd id="chillerColdstorageData">
						차트 영역(688*207)
					</dd>
				</dl>
			</div>
			
			<div class="both"></div>
		</div>
	
	</div>
	<!-- e : content_area -->
	
	<!-- s : footer -->
	<div id="footer">
		<img src="/resources/uems/images/total/logo_footer.jpg" alt="ENERZENT" /> <span>Copyright (C) ENERZENT CO., LTD, All Rights Reserved.</span>
	</div>
	<!-- e : footer -->

</div>
<!-- e: main content -->

