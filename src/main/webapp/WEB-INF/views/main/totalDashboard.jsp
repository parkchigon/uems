<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>
<script type="text/javascript" src="/resources/uems/js/lib/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/uems/js/dashboard.js"></script>

<script type='text/javascript'>//<![CDATA[
$(document).ready(function(){

	callAllAjax($("select[id=year0] option:eq(0)").attr("value"));
	
	$("select[name=sgId]").change(function(){
		$("#siteGroupLogo").empty();
		if($("select[name=sgId] option:selected").val() == '1'){
			$("#siteGroupLogo").append('<img src="/resources/uems/images/total/logo_emart.png" alt="이마트" /> <span>빙축열 통합정보</span>');
		}else if($("select[name=sgId] option:selected").val() == '2'){
			$("#siteGroupLogo").append('<img src="/resources/uems/images/total/logo_ssg.png" alt="신세계" /> <span>빙축열 통합정보</span>');
		}
		callAllAjax($("select[id=year0] option:eq(0)").attr("value"));
	});
	
	$(".btn_calender").click(function(){
		$(this).prev().focus();
	});
	
	initDatePickers();
	
});

//총계 진입, 지점그룹 변경 시
function callAllAjax(selectedYear){
	var currentDate = new Date();
	var year = currentDate.getFullYear();
	var month = (currentDate.getMonth()+1)>9 ? ''+(currentDate.getMonth()+1) : '0'+(currentDate.getMonth()+1)
	
	//검색조건 초기화
	searchReset(selectedYear, month);
	
	//총 누적 절감액, 절감비율
	callInfoAjax();
	//전체 냉방 사용요금
	callAjax(selectedYear,'CoolCharge');
	//전체 Co2 배출량
	callAjax(selectedYear,'Co2Emissions');
	//에너지 사용량
	callAjax(selectedYear,'EnergyUsage');
	//지점별 냉방 사용요금
	callAjax(selectedYear+month,'BranchCoolCharge');
	
}

//총 누적 절감액, 절감비율 ajax
function callInfoAjax(){
	var category, dataObj, pieObj;
	$.ajax({
		   url: "/uems/main/selectTotalReductionInfoAjax.do",
		   type: "POST",
		   data: {sgId:$("select[name=sgId] option:selected").val()},
		   dataType: "json",
		   async:false
		}).done (function(data) {
			var result = data.result;
			category = data.xList;
			dataObj = data.yList;
			pieObj = data.pieList;
			
			//총 누적 절감액, 절감율 화면 세팅(값, 화살표)
			$("#totalDiffCharge").text(addComma(result.totalDiffCharge));
			$(".devDiff").empty();
			$(".devRate").empty();
			
			$("#diffChargeLast").append("\\ "+addComma(result.diffChargeLast)+"<span><\/span>");
			$("#diffChargeThis").append("\\ "+addComma(result.diffChargeThis)+"<span><\/span>");
			$("#diffChargeLastMonth").append("\\ "+addComma(result.diffChargeLastMonth)+"<span><\/span>");
			$("#coolChargeReductionRate").append("<span>"+result.coolChargeReductionRate+"%</span>");
			$("#energyAmountReductionRate").append("<span>"+result.energyAmountReductionRate+"%</span>");
			$("#tcoAmountReductionRate").append("<span>"+result.tcoAmountReductionRate+"%</span>");
			
			$(".devDiff").each(function(){
				if($(this).text().indexOf("-") == -1){
					if($(this).text() != '\\ 0'){
						$(this).find("span").text("▼");	
					}else{
						$(this).find("span").text("-");
					}
				}else{//기존방식 요금 < 빙축열 요금
					var temp = $(this).text().split("-")[1];
					$(this).empty();
					$(this).append("\\ "+temp+"<span>▲<\/span>");
				}
				
			});
			
			$(".devRate").each(function(){
				if($(this).text().indexOf("-") == -1){
					if($(this).text() != '0%'){
						$(this).find("span").addClass("down");	
					}
				}else{//기존방식 < 빙축열
					$(this).find("span").addClass("up");
					$(this).find("span").text($(this).text().split("-")[1]);
				}
				
			});
			
		});
	
	//전력 총 소비량 차트
	Highcharts.chart('totalPowerConsumptionChart', {
		chart: {
			type: 'bar'
		},
		credits: {
	        enabled: false
	    },
        title: {
            //text: '전력 총 소비량'
        	style: {
                display: 'none'
            }
        },
        xAxis: {
            categories: category
        },
        yAxis: {
        	min: 0,
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }],
	        title: {
	            text: 'kWh',
	            align: 'high'
	        },
	        labels: {
                format: '{value}',
                formatter: function () {
                    return addComma(this.value);
                }
            }
        },
        tooltip: {
            valueSuffix: '',
            formatter: function() {
            	return addComma(this.y);
            }
        },
        legend: {
        	enabled: false,
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },

        series: dataObj
        
    });
	
	//반원
	Highcharts.chart('totalPowerConsumptionPie', {
		chart: {
			type: 'pie'
		},
		credits: {
	        enabled: false
	    },
		title: {
            //text: '전력 총 소비량'
            style: {
                display: 'none'
            }
        },
		plotOptions: {
			      pie: {
			         dataLabels: {
			            enabled: true,
			            distance: 10,
			            style: {
			               fontWeight: 'bold',
			               color: 'white',
			               textShadow: '0px 1px 2px black'
			            }
			         },
			         startAngle: -90,
			         endAngle: 90,
			         center: ['50%', '75%']
			      }
		},
                
        series: [{
        	type: 'pie',
        	innerSize: '50%',
        	data: pieObj  		
        }]
        
    });
	
	Highcharts.setOptions(Highcharts.theme);
	
}

  
// });

//]]> 

</script>
<div id="header">
	<h1><img src="/resources/uems/images/total/logo.png" alt="ENERZENT" /></h1>
	<div class="topUtil">
		<span class="user">${sessionScope.AUTH.mngName} 님</span>
		<a class="btn_login" href="/login/logout.do">LOGOUT</a>
	</div>
	<div id="gnb">
		<a href="#" class="on">총계</a>
		<a href="/uems/branchInfo.do">지점정보</a>
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
		<h2 id="siteGroupLogo"><img src="/resources/uems/images/total/logo_emart.png" alt="이마트" /> <span>빙축열 통합정보</span></h2>
		<div class="fr">
			<select id="sgId" name="sgId" style="width: 160px">
				<c:forEach var="result" items="${groupAllList}" varStatus="status">
					<option value="${result.sgId}">${result.sgName}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<!-- s : content_area -->
	<div id="content_area">
	
		<div class="fl">	
			<div class="visual_area">
				<ul>
					<li class="list1">
						<dl>
							<dt>전년도</dt>
							<dd class="devDiff" id="diffChargeLast"><!-- \ 325,509<span>▼</span> --></dd>
						</dl>
						<dl>
							<dt>금년도</dt>
							<dd class="devDiff" id="diffChargeThis"><!-- \ 325,509<span>▼</span> --></dd>
						</dl>
						<dl>
							<dt>지난달</dt>
							<dd class="devDiff" id="diffChargeLastMonth"><!-- \ 35,509<span>▼</span> --></dd>
						</dl>
					</li>
					<li class="list2">
						<dl>
							<dt>사용요금</dt>
							<dd class="devRate" id="coolChargeReductionRate"><!-- <span class="down">67%</span> --></dd>
						</dl>
						<dl>
							<dt>에너지사용량</dt>
							<dd class="devRate" id="energyAmountReductionRate"><!-- <span class="down">60%</span> --></dd>
						</dl>
						<dl>
							<dt>CO2배출량</dt>
							<dd class="devRate" id="tcoAmountReductionRate"><!-- <span class="up">5%</span> --></dd>
						</dl>
					</li>
				</ul>
				<div class="total">총 누적 절감액 \<span id="totalDiffCharge">456,780</span>
					<p>단위 : 천원</p>
				</div>
			</div>
			
			<div class="chart_area both">
				<dl>
					<dt colspan="2">전력 총 소비량</dt>
					<dd style="height: 140px;">
						<div class="fl" style="width: 250px;height: 140px;" id="totalPowerConsumptionPie">차트 영역(250*140)</div>
						<div class="fr" style="width: 430px;height: 140px;" id="totalPowerConsumptionChart">차트 영역(430*140)</div>
					</dd>
					<!-- <dd style="height: 147px;" id="totalPowerConsumptionPie" class="left_chart">
						차트 영역(720*168)
					</dd>
					<dd style="height: 147px;" id="totalPowerConsumptionChart">
						차트 영역(720*168)
					</dd> -->
				</dl>
			</div>
		</div>
		
		<div class="fr">
			<div class="chart_area">
				<dl>
					<dt>전체 냉방 사용요금
						<span class="fr">
							<select style="width: 130px" id="year0" onchange="javascript:callAjax($(this).val(), 'CoolCharge');">
								<c:forEach var="result" items="${selectYearList}" varStatus="status">
									<option value="${result.year}">${result.year}년</option>
								</c:forEach>
							</select>
						</span>
					</dt>
					<dd>
						<div class="left_chart" id="coolChargeChart">
							차트 영역(470*204)
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
								<tbody id="CoolCharge">
									<!-- <tr>
										<td>5월</td>
										<td><span class="font_blue">▼</span> -21%</td>
									</tr>
									<tr>
										<td>6월</td>
										<td><span class="font_blue">▼</span> -21%</td>
									</tr>
									<tr>
										<td>7월</td>
										<td><span class="font_blue">▼</span> -21%</td>
									</tr>
									<tr>
										<td>8월</td>
										<td><span class="font_blue">▼</span> -21%</td>
									</tr>
									<tr>
										<td>9월</td>
										<td><span class="font_red">▲</span> 21%</td>
									</tr>
									<tr>
										<td>10월</td>
										<td><span class="font_blue">▼</span> -21%</td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</dd>
				</dl>
			</div>
			
			<div class="chart_area mt20">
				<dl>
					<dt>전체 CO2 배출량
						<span class="fr">
							<select style="width: 130px" id="year1" onchange="javascript:callAjax($(this).val(), 'Co2Emissions');">
								<c:forEach var="result" items="${selectYearList}" varStatus="status">
									<option value="${result.year}">${result.year}년</option>
								</c:forEach>
							</select>
						</span>
					</dt>
					<dd>
						<div class="left_chart" id="co2EmissionsChart">
							차트 영역(470*204)
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
								<tbody id="Co2Emissions">
									<!-- <tr>
										<td>5월</td>
										<td>-100 tCO²</td>
									</tr>
									<tr>
										<td>6월</td>
										<td>-100 tCO²</td>
									</tr>
									<tr>
										<td>7월</td>
										<td>-100 tCO²</td>
									</tr>
									<tr>
										<td>8월</td>
										<td>-100 tCO²</td>
									</tr>
									<tr>
										<td>9월</td>
										<td>-100 tCO²</td>
									</tr>
									<tr>
										<td>10월</td>
										<td>-100 tCO²</td>
									</tr> -->
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
					<dt>에너지 사용량
						<span class="fr">
							<select style="width: 130px" id="year2" onchange="javascript:callAjax($(this).val(), 'EnergyUsage');">
								<c:forEach var="result" items="${selectYearList}" varStatus="status">
									<option value="${result.year}">${result.year}년</option>
								</c:forEach>
							</select>
						</span>
					</dt>
					<dd>
						<div class="left_chart" id="energyUsageChart">
							차트 영역(470*204)
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
								<tbody id="EnergyUsage">
									<!-- <tr>
										<td>5월</td>
										<td>-100 kWh</td>
									</tr>
									<tr>
										<td>6월</td>
										<td>-100 kWh</td>
									</tr>
									<tr>
										<td>7월</td>
										<td>-100 kWh</td>
									</tr>
									<tr>
										<td>8월</td>
										<td>-100 kWh</td>
									</tr>
									<tr>
										<td>9월</td>
										<td>-100 kWh</td>
									</tr>
									<tr>
										<td>10월</td>
										<td>-100 kWh</td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</dd>
				</dl>
			</div>
			
			<div class="chart_area fr">
				<dl>
					<dt>지점별 냉방 사용요금
						<span class="fr">
							<span class="entry_calendar"><!-- 월별 -->
								<input type="text" class="monthPicker" id="schMonth" name="schMonth" value="${schMonth}" style="width:90px;" ></input>
								<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
							</span>
						</span>
					</dt>
					<dd style="overflow:auto; width:700px; margin: 0 auto;">
						<div id="branchCoolChargeChart" style="overflow:auto; width:100%; margin: 0 auto;">
							차트 영역(720*228)
						</div>
					</dd>
				</dl>
			</div>
			
			<div class="both"></div>
		</div>
	
	</div>
	<!-- e : content_area -->
	
	<!-- s : footer -->
	<div id="footer">
		<img src="/resources/uems/images/total/logo_footer.png" alt="ENERZENT" /> <span>Copyright (C) ENERZENT CO., LTD, All Rights Reserved.</span>
	</div>
	<!-- e : footer -->

</div>
<!-- e: main content -->

