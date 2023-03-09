<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
	
	if(!isEmpty($("#monthKey").val())) {//상세
		$("select[name=sgId]").val('${dataInfo.sgId}').prop("selected", true);
		$("#sgId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#sgId").change(function() {this.selectedIndex = this.initialSelect; });
		$("#siteId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#siteId").change(function() {this.selectedIndex = this.initialSelect; });
		var monthKey  =  $('#monthKey').val();
		hae = monthKey.substr(0,4);
		var dal = monthKey.substr(4,5);
		$("select[name=years]").val(hae).prop("selected", true);
		$("select[name=mon]").val(dal).prop("selected", true);
		
	} 
	
	// 이마트일 경우 프로시저 계산 컬럼 disabled 처리
	var sgCd = $("#sgForm input[id='"+$("#sgId").val()+"']").attr("name");
	if(sgCd == "GE001") {
		$("tr[id^=addTr]").hide();
		$("#prevCoolCharge, #presCoolCharge, #prevEnergyAmount, #presEnergyAmount, #prevTcoAmount, #presTcoAmount, #coolingLoadAmount").attr("disabled", true);
	} else {
		$("tr[id^=addTr]").show();
		$("#prevCoolCharge, #presCoolCharge, #prevEnergyAmount, #presEnergyAmount, #prevTcoAmount, #presTcoAmount, #coolingLoadAmount").attr("disabled", false);
	}
	
	selectSiteList($("#sgId").val());
	
	// 그룹 변경 시 입력 항목도 변경
	$("#sgId").change(function() {
		selectSiteList($(this).val());
		
		var sgCd = $("#sgForm input[id='"+$("#sgId").val()+"']").attr("name");
		// 이마트일 경우 추가항목 미노출 및 프로시저 컬럼 비활성화
		if(sgCd == "GE001") {
			$("tr[id^=addTr]").hide();
			$("#prevCoolCharge, #presCoolCharge, #prevEnergyAmount, #presEnergyAmount, #prevTcoAmount, #presTcoAmount, #coolingLoadAmount").attr("disabled", true);
		} else {
			$("tr[id^=addTr]").show();
			$("#prevCoolCharge, #presCoolCharge, #prevEnergyAmount, #presEnergyAmount, #prevTcoAmount, #presTcoAmount, #coolingLoadAmount").attr("disabled", false);
		}
	});
	
	$("#years").change(function() {
		selectData($("#years").val(),$("#mon").val());
	});
	
	$("#mon").change(function() {
		selectData($("#years").val(),$("#mon").val());
	});
});

//년월변경시 데이터 변경
function selectData(years,mon) {
	var month = years+mon;
	var siteId = $('#siteId').val();
	$.ajax({
		url : "/uems/mng/data/selectDataAjax.do",
		type: "POST",
		data: {month : month
			   ,siteId : siteId},
		dataType : "json",
		async: false
	}).done( function(data) {
		var  dataInfo = data.dataInfo;
		$('#siteIdKey').val(dataInfo.siteId);
		$('#siteId').val(dataInfo.siteId);
		$('#monthKey').val(dataInfo.month);
		$('#prevCoolCharge').val(dataInfo.prevCoolCharge);
		$('#presCoolCharge').val(dataInfo.presCoolCharge);
		$('#prevEnergyAmount').val(dataInfo.prevEnergyAmount);
		$('#presEnergyAmount').val(dataInfo.presEnergyAmount);
		$('#prevTcoAmount').val(dataInfo.prevTcoAmount);
		$('#presTcoAmount').val(dataInfo.presTcoAmount);
		$('#coolingLoadAmount').val(dataInfo.coolingLoadAmount);
		$('#billBasicCharge1').val(dataInfo.billBasicCharge1);
		$('#nightelecDayAmount').val(dataInfo.nightelecDayAmount);
		$('#elecPowerfactorCharge').val(dataInfo.elecPowerfactorCharge);
		$('#nightelecNightAmount').val(dataInfo.nightelecNightAmount);
		$('#elecDiscountCharge').val(dataInfo.elecDiscountCharge);
		$('#chargeApplyPower').val(dataInfo.chargeApplyPower);
		$('#gasAverageCalorie').val(dataInfo.gasAverageCalorie);
		$('#heatingCharge').val(dataInfo.heatingCharge);
		$('#heatUsageCharge').val(dataInfo.heatUsageCharge);
		$('#coolingCharge').val(dataInfo.coolingCharge);
		$('#heatUsageAmount').val(dataInfo.heatUsageAmounts);
	});

}

//지점리스트
function selectSiteList(sgId) {
	var flag = "reg"
	$.ajax({
		url : "/uems/mng/data/selectSiteListAjax.do",
		type: "POST",
		data: {sgId : sgId
			   ,flag : flag},
		dataType : "json"
	}).done( function(data) {
		var list = data.siteList;
		var html = "";
		var siteHtml = "";
		for(var i=0; i<list.length; i++) {
			if(list[i].siteId == '${dataInfo.siteId}') {
				html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
			} else {
				html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
			}
			siteHtml += "<input type='hidden' id='" +list[i].siteId+ "' name='" +list[i].siteCd+ "' class='" +list[i].siteName + "' />";
		}
		$("#siteId").empty();
		$("#siteId").append(html);
		
		$("#siteForm").empty();
		$("#siteForm").append(siteHtml);
		
	});
}

 function duplChk(){ //지점명 & 년월 중복체크
	 
	var chk = false;
	var month = $('#years').val()+$('#mon').val();
	var siteId = $('#siteId').val(); 
	var originMonth = $('#monthKey').val();
	var originSiteId  = $('#siteIdKey').val();
	if(!isEmpty($("#monthKey").val()) && (month == originMonth) && (siteId == originSiteId)) { // 상세화면에서 지점명&년월 변경사항 없을 경우 중복체크 안함
		return true;
	}
	$.ajax({
		url : "/uems/mng/data/dataCount.do",
		type: "POST",
		data: {month : month
			   ,siteId : siteId},
		dataType : "json",
		async: false
	}).done( function(data) {
		if(data >= 1){
			alert('이미 존재하는 데이터입니다.');
			chk = false;
		}else{
			chk = true;
		}
	});
	return chk;
}

function valChk(){ // 유효성 체크
	var sgCd = $("#sgForm input[id='"+$("#sgId").val()+"']").attr("name");
	var siteCd = $("#siteForm input[id='"+$("#siteId").val()+"']").attr("name");
	
    var reg =  /^[+-]?\d+\.?\d*$/;
    if(isEmpty($('#siteId').val() == '')){
		alert('지점명을 선택해주세요.');
		return false;
	}
    if(isEmpty($('#years').val())  || isEmpty($('#mon').val())){
		alert('년월을 선택해주세요.');
		return false;
	}

	if(duplChk()){ //중복체크 true 일경우 null체크
		// 이마트가 아닐 경우에만 추가항목 체크
		if(sgCd != "GE001") {
			if(isEmpty($('#prevCoolCharge').val())){
				alert('냉방사용요금(기존) 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#presCoolCharge').val())){
				alert('냉방사용요금(빙축) 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#prevEnergyAmount').val())){
				alert('에너지사용량(기존) 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#presEnergyAmount').val())){
				alert('에너지사용량(빙축) 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#prevTcoAmount').val())){
				alert('탄소배출량(기존) 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#presTcoAmount').val())){
				alert('탄소배출량(빙축) 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#coolingLoadAmount').val())){
				alert('냉방부하량 항목을 확인해주세요.');
				return false;
			}
		}
		if(isEmpty($('#billBasicCharge1').val())){
			alert('고지서 기본요금I 항목을 확인해주세요.');
			return false;
		}
		if(isEmpty($('#nightelecDayAmount').val())){
			alert('심야전기 주간사용량 항목을 확인해주세요(배율적용된값).');
			return false;
		}
		if(isEmpty($('#nightelecNightAmount').val())){
			alert('심야전기 야간사용량 항목을 확인해주세요(배율적용된값).');
			return false;
		}
		if(isEmpty($('#elecPowerfactorCharge').val())){
			alert('역률요금 항목을 확인해주세요.');
			return false;
		}
		if(isEmpty($('#elecDiscountCharge').val())){
			alert('할인요금 항목을 확인해주세요.');
			return false;
		}
		if(isEmpty($('#chargeApplyPower').val()) && siteCd == "SE012") {	// 이마트/월배점일 경우에만
			alert('요금적용전력 항목을 확인해주세요.');
			return false;
		}
		if(isEmpty($('#gasAverageCalorie').val())){
			alert('평균열량 항목을 확인해주세요.');
			return false;
		}
		
		// 백화점일 경우에만 추가항목 체크
		if(sgCd == "GS001") {
			if(isEmpty($('#heatingCharge').val())){
				alert('난방요금 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#heatUsageCharge').val())){
				alert('열사용요금 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#coolingCharge').val())){
				alert('냉방요금 항목을 확인해주세요.');
				return false;
			}
			if(isEmpty($('#heatUsageAmount').val())){
				alert('열사용량 항목을 확인해주세요.');
				return false;
			}
		}

		var chk = true;
		$(".preClass").each(function(){	   // class돌면서 숫자 유효성 검사
			if(!isEmpty($(this).val())) {
				if(!reg.test($(this).val())){ 
	    			alert('숫자를 입력해주세요.');
	    			chk = false;
	    			return false;
	    		}
			}
	    });
    	if(chk){
    		return true;
    	}else{
    		return false;
    	}
		
		return true;
	}
	
}

function registData(flag){ // 등록,저장
	
	if(valChk()){
		var month =$('#years').val()+$('#mon').val();
		$('#month').val(month);
		var frm = document.frm;
		if(flag == "reg"){ //등록일 때는 검색조건 없애준다.
			frm.currPage.value = 1;
			frm.searchCondition.value= null;
			frm.searchCondition2.value= null;
			frm.year.value=null;
	 	}
		$("#sgCd").val($("#sgForm input[id='"+$("#sgId").val()+"']").attr("name"));
		$("#siteCd").val($("#siteForm input[id='"+$("#siteId").val()+"']").attr("name"));
		frm.action = "<c:url value='/uems/mng/data/dataRegistExe.do'/>";
		frm.submit();
		loading();
	}
	
}

function deleteData(){ //삭제
	var frm = document.frm;
	if(confirm("삭제하시겠습니까?")){
		frm.action = "<c:url value='/uems/mng/data/dataRemoveExe.do'/>";
		frm.submit();
	}
}

// 보고서 다운로드 
function downloadReportFile() { 
	var sgCd = $("#sgForm input[id='"+$("#sgId").val()+"']").attr("name");
	// 이마트일 경우에만 프로시저 계산 컬럼 빈값 체크
	if(sgCd == "GE001") {
		if(isEmpty($('#prevCoolCharge').val())){
			alert('냉방사용요금(기존) 항목을 확인해주세요.');
			return;
		}
		if(isEmpty($('#presCoolCharge').val())){
			alert('냉방사용요금(빙축) 항목을 확인해주세요.');
			return;
		}
		if(isEmpty($('#prevEnergyAmount').val())){
			alert('에너지사용량(기존) 항목을 확인해주세요.');
			return;
		}
		if(isEmpty($('#presEnergyAmount').val())){
			alert('에너지사용량(빙축) 항목을 확인해주세요.');
			return;
		}
		if(isEmpty($('#prevTcoAmount').val())){
			alert('탄소배출량(기존) 항목을 확인해주세요.');
			return;
		}
		if(isEmpty($('#presTcoAmount').val())){
			alert('탄소배출량(빙축) 항목을 확인해주세요.');
			return;
		}
		if(isEmpty($('#coolingLoadAmount').val())){
			alert('냉방부하량 항목을 확인해주세요.');
			return;
		}
	}
	var siteName = $("#siteForm input[id='"+$("#siteId").val()+"']").attr("class");
	if(confirm($('#years').val()+"년 "+$('#mon').val() +"월 " + siteName +" 기술운영보고서를 다운로드 하시겠습니까?")) {
		var f = document.frm;
		$("#sgCd").val(sgCd);
		$("#siteCd").val($("#siteForm input[id='"+$("#siteId").val()+"']").attr("name"));
		$('#month').val($('#years').val()+$('#mon').val());
		loading();
		
		f.action = "<c:url value='/uems/mng/data/downloadReportFile.do'/>";
		f.submit();
	}
}

// 로딩바
function loading() {

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

function closeLoading() {
	$('#loading_mask').hide();
	$('.loading').hide();
}
</script>

<div class="contents_wrap">
<form id="sgForm" name="sgForm">
	<c:forEach var="result" items="${groupAllList}" varStatus="status">
		<input type="hidden" id="${result.sgId}" name="${result.sgCd}" class="${result.sgName}"/>
	</c:forEach>
</form>

<form id="siteForm" name="siteForm"></form>

<form:form commandName="data" name="frm" id="frm" method="post">	
	<%-- <form:hidden path="siteId"/> --%>
	<input type ="hidden" id ="monthKey" name = "monthKey" value ="<c:out value="${dataInfo.month}" escapeXml="false" />" />
	<input type ="hidden" id ="siteIdKey" name = "siteIdKey" value ="<c:out value="${dataInfo.siteId}" escapeXml="false" />" />
	<input type ="hidden" id ="month" name = "month" value ="" />
	<input type ="hidden" id ="year" name = "year" value ="${data.year}" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="${data.searchCondition}" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="${data.searchCondition2}" /> 
	<input type ="hidden" id ="currPage" name = "currPage" value ="${data.currPage}" />
	<input type ="hidden" id ="siteCd" name = "siteCd" value ="" />
	<input type ="hidden" id ="sgCd" name = "sgCd" value ="" />
	<input type ="hidden" id ="rfId" name = "rfId" value ="" />
	
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">월별운영데이터관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;월별운영데이터를 조회 및 관리를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	


	<!-- s: btn -->
	<br><br>
	<!-- e: btn -->
	
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			
			<tbody>
				<tr>
					<th>지점명 *</th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="sgId">
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="siteId" name="siteId">
							</select>
						</span>
					</td>
					<th>년월 *</th>
					<td>
					<span class="sel_wrap w01" style="width:200px;">
						<form:select path="years">
								<form:option value="" label="선택하십시오."/>
								<c:forEach var="result" items="${yearList}" varStatus="status">
									<form:option value="${result}">${result}</form:option>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="mon" name="mon">
								<option value = "">선택하십시오.</option>
								<option value = "01">01</option>
								<option value = "02">02</option>
								<option value = "03">03</option>
								<option value = "04">04</option>
								<option value = "05">05</option>
								<option value = "06">06</option>
								<option value = "07">07</option>
								<option value = "08">08</option>
								<option value = "09">09</option>
								<option value = "10">10</option>
								<option value = "11">11</option>
								<option value = "12">12</option>
							</select>
						</span>
					</td> 
				</tr>
				<tr>
					<th>냉방사용요금(기존)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px ;" id="prevCoolCharge" name="prevCoolCharge" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.prevCoolCharge}" escapeXml="false" />" />
					</td> 
					<th>냉방사용요금(빙축)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="presCoolCharge" name="presCoolCharge" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.presCoolCharge}" escapeXml="false" />" />
					</td> 
				</tr>	
				<tr>
					<th>에너지사용량(기준)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="prevEnergyAmount" name="prevEnergyAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.prevEnergyAmount}" escapeXml="false" />"/>
					</td> 
					<th>에너지사용량(빙축)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="presEnergyAmount" name="presEnergyAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.presEnergyAmount}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>탄소배출량(기존)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="prevTcoAmount" name="prevTcoAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.prevTcoAmount}" escapeXml="false" />"/>
					</td> 
					<th>탄소배출량(빙축)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="presTcoAmount" name="presTcoAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.presTcoAmount}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>냉방부하량</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="coolingLoadAmount" name="coolingLoadAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.coolingLoadAmount}" escapeXml="false" />"/>
					</td>
					<th>고지서 기본요금 I</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="billBasicCharge1" name="billBasicCharge1" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.billBasicCharge1}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>(심야전기)주간사용량 [배율적용된값]</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="nightelecDayAmount" name="nightelecDayAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.nightelecDayAmount}" escapeXml="false" />"/>
					</td> 
					<th>역률요금</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="elecPowerfactorCharge" name="elecPowerfactorCharge" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.elecPowerfactorCharge}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>(심야전기)야간사용량 [배율적용된값]</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="nightelecNightAmount" name="nightelecNightAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.nightelecNightAmount}" escapeXml="false" />"/>
					</td> 
					<th>할인요금</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="elecDiscountCharge" name="elecDiscountCharge" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.elecDiscountCharge}" escapeXml="false" />"/>
					</td> 
				</tr>	
				<tr>
					<th>요금적용전력</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="chargeApplyPower" name="chargeApplyPower" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.chargeApplyPower}" escapeXml="false" />"/>
					</td> 
					<th>평균열량(MJ/Nm³)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="gasAverageCalorie" name="gasAverageCalorie" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.gasAverageCalorie}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr id="addTr1" style="display:none;">
					<th>난방요금</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="heatingCharge" name="heatingCharge" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.heatingCharge}" escapeXml="false" />"/>
					</td> 
					<th>열사용요금</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="heatUsageCharge" name="heatUsageCharge" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.heatUsageCharge}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr id="addTr2" style="display:none;">
					<th>냉방요금</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="coolingCharge" name="coolingCharge" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.coolingCharge}" escapeXml="false" />"/>
					</td> 
					<th>열사용량(Mcal)</th>
					<td>
						<input type="text" maxlength="14" style="text-align:right; width:400px;" id="heatUsageAmount" name="heatUsageAmount" class="inp_txt w01 preClass" value="<c:out value="${dataInfo.heatUsageAmount}" escapeXml="false" />"/>
					</td> 
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
		<c:choose>
			<c:when test ="${dataInfo.month eq null}">
				<span class="btn btn_type02 btn_size03"><a href="#" onclick="registData('reg');">등 록</a></span>
			</c:when>
			<c:otherwise>		
				<span class="btn btn_type02 btn_size03"><a href="#" onclick="registData();">저 장</a></span>
				<span class="btn btn_type02 btn_size03"><a href="#" onclick="deleteData();">삭 제</a></span>
			</c:otherwise>
		</c:choose>		
		<span class="btn btn_type01 btn_size03"><a href="/uems/mng/data/dataList.do">목 록</a></span>
		<div class="rtl">
			<c:if test ="${dataInfo.month ne null}">
				<span class="btn btn_type03 btn_size03"><a href="javascript:downloadReportFile();"><i class="fa fa-file-excel-o"></i> 보고서 생성</a></span>
			</c:if>
		</div>
	</div>
	
</form:form>
</div>
