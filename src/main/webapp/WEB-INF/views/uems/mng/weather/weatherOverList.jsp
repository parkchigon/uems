<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">
	var date = new Date();
	var currentYear = date.getFullYear();
	var currentMonth = date.getMonth()+1;
	var monthVal = addZeros(currentMonth, 2);

	$(document).ready(function(){
		
		selectSiteList($("#searchCondition").val());
		
		$("#searchCondition").change(function() {
			selectSiteList($(this).val());
		});
		
		$("#checkYear").val(currentYear);
		$("#checkMonth").val(monthVal);
	});
	
	// 날씨 부하량 조회
	function selectWeatherOver() {
		$.ajax({
			url : "/uems/mng/weather/selectWeatherOverAjax.do",
			type: "POST",
			data: $("#frm").serialize(),
			dataType : "json",
			async: false
		}).done( function(data) {
			var list = data.resultList;
			var html = "";
			var curSiteName = "";
			for(var i=0; i<list.length; i++) {
				if(list[i].col == "1_tmx") {
					html += "	<tr name='1_tmx'>";
				} else if(list[i].col == "2_tmn") {
					html += "	<tr name='2_tmn'>";
				} else if(list[i].col == "3_rin") {
					html += "	<tr name='3_rin'>";
				} else {
					html += "	<tr name='4_over'>";
				}
				if(curSiteName != list[i].siteName) {
					html += "	<th rowspan='4'>" + list[i].sgName + "</th>";
					html += "	<th rowspan='4'>" + list[i].siteName + "</th>";
					curSiteName = list[i].siteName;
				}
				if(list[i].col == "1_tmx") {
					html += "	<th>최고(℃)</th>";
				} else if(list[i].col == "2_tmn") {
					html += "	<th>최저(℃)</th>";
				} else if(list[i].col == "3_rin") {
					html += "	<th>강수량(mm)</th>";
				} else {
					html += "	<th>부하량(USRt.h)</th>";
				}
				 
				html += "	<td id='avgTemp'></td>";
				html += "	<td>" + list[i].day01 + "</td>";
				html += "	<td>" + list[i].day02 + "</td>";
				html += "	<td>" + list[i].day03 + "</td>";
				html += "	<td>" + list[i].day04 + "</td>";
				html += "	<td>" + list[i].day05 + "</td>";
				html += "	<td>" + list[i].day06 + "</td>";
				html += "	<td>" + list[i].day07 + "</td>";
				html += "	<td>" + list[i].day08 + "</td>";
				html += "	<td>" + list[i].day09 + "</td>";
				html += "	<td>" + list[i].day10 + "</td>";
				html += "	<td>" + list[i].day11 + "</td>";
				html += "	<td>" + list[i].day12 + "</td>";
				html += "	<td>" + list[i].day13 + "</td>";
				html += "	<td>" + list[i].day14 + "</td>";
				html += "	<td>" + list[i].day15 + "</td>";
				html += "	<td>" + list[i].day16 + "</td>";
				html += "	<td>" + list[i].day17 + "</td>";
				html += "	<td>" + list[i].day18 + "</td>";
				html += "	<td>" + list[i].day19 + "</td>";
				html += "	<td>" + list[i].day20 + "</td>";
				html += "	<td>" + list[i].day21 + "</td>";
				html += "	<td>" + list[i].day22 + "</td>";
				html += "	<td>" + list[i].day23 + "</td>";
				html += "	<td>" + list[i].day24 + "</td>";
				html += "	<td>" + list[i].day25 + "</td>";
				html += "	<td>" + list[i].day26 + "</td>";
				html += "	<td>" + list[i].day27 + "</td>";
				html += "	<td>" + list[i].day28 + "</td>";
				html += "	<td>" + list[i].day29 + "</td>";
				html += "	<td>" + list[i].day30 + "</td>";
				html += "	<td>" + list[i].day31 + "</td>";
				html += "</tr>";
			}
			
			$("#resultTbody").empty();
			$("#resultTbody").append(html);
		});
		
		// 해당 월의 말일체크 
		var dt = new Date($("#checkYear").val(), $("#checkMonth").val(), 0);
		var lastDay = dt.getDate();
		
		// 해당 월의 말일에 따른 테이블 조정 
		$("#resultTable col").each(function(index) {
			if(index > lastDay+3) {
				$(this).hide();
			} else {
				$(this).show();
			}
		});
		$("#resultTable thead th").each(function(index) {
			if(index > lastDay+3) {
				$(this).hide();
			} else {
				$(this).show();
			}
		});
		$("#resultTbody tr").each(function() {
			$(this).find("td").each(function(index) {
				if(index > lastDay) {
					$(this).hide();
				} else {
					$(this).show();
				}
			});
		});

		// 평균 계산
		$("#resultTbody tr").each(function() {
			var cnt = 0;
			var totTemp;
			$(this).find("td").each(function(index) {
				var temp = $(this).text();
				if(!isEmpty(temp)) {
					cnt ++;
					totTemp = (totTemp || 0) + parseFloat(temp);
				}
			});
			if(!isEmpty(totTemp)) {
				$(this).find("td[id=avgTemp]").text(Math.round(totTemp / cnt));	
			}
		});
		
		// 최저, 최고기온 font style 변경
		var minTemp1 = $("#minTemp1").val();
		var minTemp2 = $("#minTemp2").val();
		var maxTemp1 = $("#maxTemp1").val();
		var maxTemp2 = $("#maxTemp2").val();
		
		if(!isEmpty(maxTemp1) && !isEmpty(maxTemp2)) {
			$("#resultTbody tr[name='1_tmx'] td").each(function() {
				var value = $(this).text();
				if(!isEmpty(value)) {
					if(parseFloat(value) >= parseFloat(maxTemp1) && parseFloat(value) <= parseFloat(maxTemp2)) {
						$(this).attr("style", "color:red");
					}
				}
			});
		}
		
		if(!isEmpty(minTemp1) && !isEmpty(minTemp2)) {
			$("#resultTbody tr[name='2_tmn'] td").each(function() {
				var value = $(this).text();
				if(!isEmpty(value)) {
					if(parseFloat(value) >= parseFloat(minTemp1) && parseFloat(value) <= parseFloat(minTemp2)) {
						$(this).attr("style", "color:blue");
					}
				}
			});
		}
	}
	
	
	function selectSiteList(sgId) {
		
		if(isEmpty(sgId)) {
			var html = "";
			html += "<option value=''>전체</option>";
			
			$("#searchCondition2").empty();
			$("#searchCondition2").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/user/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId},
				dataType : "json"
			}).done( function(data) {
				var list = data.siteList;
				var html = "";
				html += "<option value=''>전체</option>";
				for(var i=0; i<list.length; i++) {
					if(list[i].siteId == '${workHistory.searchCondition2}') {
						html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
					} else {
						html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
					}
					
				}
				$("#searchCondition2").empty();
				$("#searchCondition2").append(html);
			});
		}
	}
</script>

<div class="contents_wrap">
<form:form commandName="weather" name="frm" id="frm" method="post">
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">날씨 별 부하량</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;날씨 별로 지점의 부하량을 확인합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	<!-- s: search -->
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="10%" />
				<col width="*%" />
			</colgroup>
			
			<tbody>
				<tr class="first">
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="searchCondition">
								<form:option value="" label="전체"/>
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="searchCondition2" name="searchCondition2"></select>
						</span>
						
						<jsp:useBean id="toDay" class="java.util.Date" />
						<fmt:formatDate value="${toDay}" pattern="yyyy" var="yyyy" />
						<fmt:parseNumber var="yy" type="number" value="${yyyy}" />
						
						<span class="sel_wrap w01" style="width:180px;">
							<select id="checkYear" name="checkYear">
								<c:forEach var="year" begin="${yy-10}" end="${yy+10}">
									<option value="${year}">${year} 년</option>
								</c:forEach>
							</select>
						</span>
						<span class="sel_wrap w01" style="width:160px;">
							<select id="checkMonth" name="checkMonth">
								<c:forEach var="month" begin="1" end="12">
									<option value="<fmt:formatNumber value='${month}' pattern='00' />">
										<fmt:formatNumber value='${month}' /> 월
									</option>
								</c:forEach>
							</select>
						</span>
						
						<label class="tit">최저온도</label>
						<input class="inp_txt" id="minTemp1" name="minTemp1" style="width:50px;" OnKeyUp="fnNumberCheck(this);" maxlength="2" /> ~
						<input class="inp_txt" id="minTemp2" name="minTemp2" style="width:50px;" OnKeyUp="fnNumberCheck(this);" maxlength="2" />
						
						<label class="tit">최고온도</label>
						<input class="inp_txt" id="maxTemp1" name="maxTemp1" style="width:50px;" OnKeyUp="fnNumberCheck(this);" maxlength="2" /> ~
						<input class="inp_txt" id="maxTemp2" name="maxTemp2" style="width:50px;" OnKeyUp="fnNumberCheck(this);" maxlength="2" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						
						<span class="btn btn_type02 btn_size02"><a href="javascript:selectWeatherOver();">검 색</a></span>
					</td>
				</tr>				
			<tbody>
		</table>
	</div>
	<!-- e: search -->
	<!-- s: table wrap-->
	<div class="table_wrap" style="overflow-y: auto;max-height: 650px;" id="resultTable">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type"  style="width :200%;">
			<colgroup>
				<col width="100px"/>
				<col width="100px"/>
				<col width="100px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
				<col width="80px"/>
			</colgroup>
			<thead>
				<tr>
					<th>그룹</th>
					<th>지점</th>
					<th>날씨</th>
					<th>평균</th>
					<th>1일</th>
					<th>2일</th>
					<th>3일</th>
					<th>4일</th>
					<th>5일</th>
					<th>6일</th>
					<th>7일</th>
					<th>8일</th>
					<th>9일</th>
					<th>10일</th>
					<th>11일</th>
					<th>12일</th>
					<th>13일</th>
					<th>14일</th>
					<th>15일</th>
					<th>16일</th>
					<th>17일</th>
					<th>18일</th>
					<th>19일</th>
					<th>20일</th>
					<th>21일</th>
					<th>22일</th>
					<th>23일</th>
					<th>24일</th>
					<th>25일</th>
					<th>26일</th>
					<th>27일</th>
					<th>28일</th>
					<th>29일</th>
					<th>30일</th>
					<th>31일</th>
				</tr>
			</thead>
			<tbody id="resultTbody"></tbody>
		</table>
	</div>
	<!-- e: table wrap-->
</form:form>	
</div>