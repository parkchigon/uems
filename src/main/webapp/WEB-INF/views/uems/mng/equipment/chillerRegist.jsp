<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
 	if(!isEmpty($("#fsmId").val())) { // 상세화면
 		$("select[name=sgId]").val('${chillerInfo.sgId}').prop("selected", true);
 		$("select[name=chillerTypeCd]").val('${chillerInfo.chillerTypeCd}').prop("selected", true);
 		$("#sgId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#sgId").change(function() {this.selectedIndex = this.initialSelect; });
		$("#siteId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#siteId").change(function() {this.selectedIndex = this.initialSelect; });
	} 
	
	selectSiteList($("#sgId").val());
	//냉동기번호 셋팅
	if($("#sgForm input[id='"+$("#sgId").val()+"']").attr("name")=='GS001'){
		$("td[id=tdChillerNo1]").show();
		$("td[id=tdChillerNo2]").hide();
	} else {
		$("td[id=tdChillerNo1]").hide();
		$("td[id=tdChillerNo2]").show();
	}
	$("select[name=chillerNo]").val("${chillerInfo.chillerNo}").prop("selected", true);
	
	$("#sgId").change(function() {
		selectSiteList($(this).val());
		
		var sgCd = $("#sgForm input[id='"+$("#sgId").val()+"']").attr("name");
		// 이마트일 경우 추가항목 미노출 및 프로시저 컬럼 비활성화
		if(sgCd == "GS001") {
			$("td[id=tdChillerNo1]").show();
			$("td[id=tdChillerNo2]").hide();
		} else {
			$("td[id=tdChillerNo1]").hide();
			$("td[id=tdChillerNo2]").show();
		}
	});
});

/*지점 리스트  */
function selectSiteList(sgId) {
	var flag = "reg"
	$.ajax({
		url : "/uems/mng/equipment/selectSiteListAjax.do",
		type: "POST",
		data: {
				sgId : sgId
			   ,flag : flag
			   },
		dataType : "json"
	}).done( function(data) {
		var list = data.siteList;
		var html = "";
		html += "<option value=''>지점을 선택하세요</option>";
		for(var i=0; i<list.length; i++) {
			if(list[i].siteId == '${chillerInfo.siteId}') {
				html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
			} else {
				html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
			}
		}
		$("#siteId").empty();
		$("#siteId").append(html);
	});
}



function valChk(){ // 유효성 체크
	console.log($('#chillerNo').val());
	if($('#siteId').val() == '' || $('#siteId').val() == null){ 
		alert('지점을 선택해주세요.');
		return false;
	}
	
	if($('#chillerName').val() == '' || $('#chillerName').val() == null){
		alert('장비명 항목을 확인해주세요.');
		return false;
	}
	if($("#sgForm input[id='"+$("#sgId").val()+"']").attr("name") == 'GS001'){
		if($('#chillerNo').val() == '' || $('#chillerNo').val() == null){
			alert('냉동기 번호를  선택해주세요.');
			return false;
		}
	}
	
	// 백화점일 경우 냉동기번호 존재여부 체크
	if($("#sgForm input[id='"+$("#sgId").val()+"']").attr("name") == 'GS001'){
		if(!chillerNoCheck()){
			return false;
		}
	}
	return true;
}

function chillerNoCheck(){
	var returnValue = '';
	$.ajax({
		url : "/uems/mng/equipment/chiilerNoExistChkAjax.do",
		type: "POST",
		data: {
				siteId : $("#siteId").val()
			   ,chillerNo : $("#chillerNo").val()
			   ,fsmId : $("#fsmId").val()
			   },
		dataType : "json",
		async : false
	}).done(function(data) {
		if(data.existYn == 'Y'){
			alert("해당 사이트에 이미 존재하는 냉동기번호 입니다.");
			returnValue = false;
		}else{
			returnValue = true
		}
	});
	return returnValue;
}

/* 등록,수정,삭제 */
 function registPump(flag){
	 var testRunDate =$('#testRunDate').val()
	 var f = document.frm;
	 f.testRunDate.value = testRunDate.replace(/-/gi,"");
	 if (flag=="del"){ // 삭제일경우
		f.useFlag.value = flag;
		if(confirm("삭제하시겠습니까?")){	
			f.action = "<c:url value = '/uems/mng/equipment/chillerRegistExe.do'/>"
 	 		f.submit();
		}
	 }else{
 	 	if(valChk()){ //유효성체크 결과 true일경우
 	 		if(flag == "reg"){ //등록일 때는 검색조건 없애준다.
 	 			f.currPage.value = 1
 	 			f.searchKeyword.value = null
 	 			f.searchCondition.value= null
 	 			f.searchCondition2.value= null
 	 		}
 	 		f.action = "<c:url value = '/uems/mng/equipment/chillerRegistExe.do'/>"
 	 		f.submit();
 	 	}
 	 };
  }
	 
</script>

<div class="contents_wrap">
<form id="sgForm" name="sgForm">
	<c:forEach var="result" items="${groupAllList}" varStatus="status">
		<input type="hidden" id="${result.sgId}" name="${result.sgCd}" class="${result.sgName}"/>
	</c:forEach>
</form>
<form:form commandName="chiller" name="frm" id="frm" method="post">	
	<form:hidden path="fsmId"/>
	<form:hidden path="useFlag"/>
	<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${chiller.currPage}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="<c:out value="${chiller.searchCondition}" escapeXml="false" />" />
	<input type ="hidden" id ="searchKeyword" name = "searchKeyword" value ="<c:out value="${chiller.searchKeyword}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="<c:out value="${chiller.searchCondition2}" escapeXml="false" />" />
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">장비관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 장비를 조회 및 관리를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<div class="tab_wrap">
		<ul>
			<li><a href="/uems/mng/equipment/pumpList.do">펌프관리</a></li>
			<li><a href="/uems/mng/equipment/heatExcList.do">열교환기관리</a></li>
			<li class="on"><a href="#">냉동기관리</a></li>
			<li><a href="/uems/mng/equipment/autoCtrlList.do">자동제어</a></li>
			<li><a href="/uems/mng/equipment/heatStgList.do">축열조 및 배관</a></li>
			<li><a href="/uems/mng/equipment/elecMccList.do">심야전기MCC</a></li>
			<li><a href="/uems/mng/equipment/cTowerList.do">냉각탑</a></li>
		</ul>
	 </div>

	<!-- s: btn -->
	<br><br>
	<!-- e: btn -->
	
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
			<colgroup>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			
			<tbody>
				<tr>
					<th>고객명 *</th>
					<td colspan ="10">
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="sgId">
								<%-- <form:option value="" label="전체"/> --%>
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
				</tr>
				<tr>
					<th>장비명 *</th>
					<td colspan ="4">
						<input type="text" id="chillerName" name="chillerName" class="inp_txt w01" style="width:400px;" value="<c:out value="${chillerInfo.chillerName}" escapeXml="false" />"  />
					</td> 
					<td colspan ="3">
						냉동기타입 *
						<form:select path="chillerTypeCd">
							<c:forEach var="result" items="${chillerTypeList}" varStatus="status">
								<form:option  value="${result.codeId}" label="${result.codeName}"/>
							</c:forEach>
						</form:select>
					</td>
					<td colspan ="3" id="tdChillerNo1">
						냉동기번호 *
						<select name="chillerNo" id="chillerNo" >
							<option value="" selected="selected" >냉동기번호</option>
							<option value="1" >#1</option>
							<option value="2" >#2</option>
							<option value="3" >#3</option>
							<option value="4" >#4</option>
						</select>
					</td>
					<td colspan ="3" id="tdChillerNo2">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="10">
						<input type="text" id="address" name="address" class="inp_txt w01" style="width:800px;" value="<c:out value="${chillerInfo.address}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="10">
						<input type="text" id="phone" name="phone" class="inp_txt w01" style="width:800px;" value="<c:out value="${chillerInfo.phone}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan ="2">
						<span class="entry_calendar">
							<fmt:parseDate value="${chillerInfo.testRunDate}" var="testRunDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="testRunDate" name="testRunDate" value="<fmt:formatDate value="${testRunDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" readonly="readonly"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
					<th>전원</th>
					<td colspan ="2">
						<input type="text" id="powerSupply" name="powerSupply" class="inp_txt w01" value="<c:out value="${chillerInfo.powerSupply}" escapeXml="false" />"/>
					</td>
				
					<th>형식</th>
					<td colspan="3">
						<input type="text" id="form" name="form" class="inp_txt w01" value="<c:out value="${chillerInfo.form}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>콤프수량</th>
					<td colspan="2" id = "cnt">
						<input type="text" id="compCount" name="compCount" class="inp_txt w01" value="<c:out value="${chillerInfo.compCount}" escapeXml="false" />"/>
					</td> 
					<th>모델번호</th>
					<td colspan="2" id = "cnt">
						<input type="text" id="modelNo" name="modelNo" class="inp_txt w01" value="<c:out value="${chillerInfo.modelNo}" escapeXml="false" />"/>
					</td> 
					<th>기동방식</th>
					<td colspan="3" id = "cnt">
						<input type="text" id="drivenMethod" name="drivenMethod" class="inp_txt w01" value="<c:out value="${chillerInfo.drivenMethod}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>제조번호</th>
					<td colspan="2" id = "cnt">
						<input type="text" id="manufactureNo" name="manufactureNo" class="inp_txt w01" value="<c:out value="${chillerInfo.manufactureNo}" escapeXml="false" />"/>
					</td> 
					<th>냉매</th>
					<td colspan="2" id = "cnt">
						<input type="text" id="refrigName" name="refrigName" class="inp_txt w01" value="<c:out value="${chillerInfo.refrigName}" escapeXml="false" />"/>
					</td> 
					<th>냉매충진량</th>
					<td colspan="3" id = "cnt">
						<input type="text" id="refrigAmount" name="refrigAmount" class="inp_txt w01" value="<c:out value="${chillerInfo.refrigAmount}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="4">
						<input type="text" id="salesInfo" name="salesInfo" class="inp_txt w01" value="<c:out value="${chillerInfo.salesInfo}" escapeXml="false" />"/>
					</td> 
					<th>A/S</th>
					<td colspan="5">
						<input type="text" id="asInfo" name="asInfo" class="inp_txt w01" value="<c:out value="${chillerInfo.asInfo}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th></th>
					<th colspan="2" style="text-align:center">야간</th>
					<th colspan="2" style="text-align:center">주간</th>
					<th ></th>
					<th colspan="2" style="text-align:center">야간</th>
					<th colspan="2" style="text-align:center">주간</th>
				</tr>
				<tr>
					<th>용량(USRt)</th>
					<td colspan="2">
						<input type="text" id=volumeNight name="volumeNight" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.volumeNight}" escapeXml="false" />"/>&nbsp;
					</td>
					<td colspan="2">
						<input type="text" id="volumeDay" name="volumeDay" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.volumeDay}" escapeXml="false" />"/>&nbsp;
					</td>
					<th>소비전력(kw)</th>
					<td colspan="2">
						<input type="text" id="consumpowerNight" name="consumpowerNight" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.consumpowerNight}" escapeXml="false" />"/>&nbsp;
					</td>
					<td colspan="2">
						<input type="text" id="consumpowerDay" name="consumpowerDay" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.consumpowerDay}" escapeXml="false" />"/>&nbsp;
					</td>
				</tr>
				<tr>
					<th>냉수온도(℃)</th>
					<td colspan="2">
						<input type="text" id="colTempNight1" name="colTempNight1" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colTempNight1}" escapeXml="false" />"/> /
						<input type="text" id="colTempNight2" name="colTempNight2" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colTempNight2}" escapeXml="false" />"/>
					</td>
					<td colspan="2">
						<input type="text" id="colTempDay1" name="colTempDay1" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colTempDay1}" escapeXml="false" />"/> /
						<input type="text" id="colTempDay2" name="colTempDay2" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colTempDay2}" escapeXml="false" />"/>
					</td>
					<th >전 류(A)</th>
					<td colspan="2">
						<input type="text" id="currentNight" name="currentNight" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.currentNight}" escapeXml="false" />"/>
					</td>
					<td colspan="2">
						<input type="text" id="currentDay" name="currentDay" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.currentDay}" escapeXml="false" />"/>
					</td>
				</tr>
				
				<tr>
					<th>냉각수온도(℃)</th>
					<td colspan="2">
						<input type="text" id="colwaterTempNight1" name="colwaterTempNight1" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colwaterTempNight1}" escapeXml="false" />"/> /
						<input type="text" id="colwaterTempNight2" name="colwaterTempNight2" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colwaterTempNight2}" escapeXml="false" />"/>
					</td>
					<td colspan="2">
						<input type="text" id="colwaterTempDay1" name="colwaterTempDay1" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colwaterTempDay1}" escapeXml="false" />"/> /
						<input type="text" id="colwaterTempDay2" name="colwaterTempDay2" class="inp_txt w01" style="width:120px;" value="<c:out value="${chillerInfo.colwaterTempDay2}" escapeXml="false" />"/>
					</td>
					<th >C O P</th>
					<td colspan="2">
						<input type="text" id="copNight" name="copNight" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.copNight}" escapeXml="false" />"/>
					</td>
					<td colspan="2">
						<input type="text" id="copDay" name="copDay" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.copDay}" escapeXml="false" />"/>
					</td>
				</tr>
				 <tr>
					<th>유체</th>
					<td>
						냉수
					</td>
					<td>
						<input type="text" id="fluidNight" name="fluidNight" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.fluidNight}" escapeXml="false" />"/>
					</td>
					<td>
						냉각수
					</td>
					<td>
						<input type="text" id="fluidDay" name="fluidDay" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.fluidDay}" escapeXml="false" />"/>
					</td>
					<th>제어범위</th>
					<td colspan="4">
						<input type="text" id="controlRange1" name="controlRange1" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.controlRange1}" escapeXml="false" />"/>&nbsp;% &nbsp; ~&nbsp;&nbsp;
						<input type="text" id="controlRange2" name="controlRange2" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.controlRange2}" escapeXml="false" />"/>&nbsp;%
					</td>
				</tr>
				
				<tr>
					<th rowspan="2">유량(㎥/h / lpm)</th>
					<th colspan="2" style="text-align:center">
						냉수
					</th>
					<th colspan="2" style="text-align:center">
						냉각수
					</th>
					
					<th>특이사항</th>
					<td colspan="4">
						<input type="text" id="detail" name="detail" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.detail}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<td >
						<input type="text" id="flowNight1" name="flowNight1" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.flowNight1}" escapeXml="false" />"/>㎥/h
					</td>
					<td >
						<input type="text" id="flowNight2" name="flowNight2" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.flowNight2}" escapeXml="false" />"/>lpm
					</td>
					<td>
						<input type="text" id="flowDay1" name="flowDay1" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.flowDay1}" escapeXml="false" />"/>㎥/h
					</td>
					<td>
						<input type="text" id="flowDay2" name="flowDay2" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.flowDay2}" escapeXml="false" />"/>lpm
					</td>
					
					<th>중 량</th>
					<td>
						제품
					</td>
					<td>
						<input type="text" id="weightProduct" name="weightProduct" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.weightProduct}" escapeXml="false" />"/>&nbsp;ton
					</td>
					<td>
						운전
					</td>
					<td>
						<input type="text" id="weightDriven" name="weightDriven" class="inp_txt w01" style="width:100px;" value="<c:out value="${chillerInfo.weightDriven}" escapeXml="false" />"/>&nbsp;ton
					</td>
				</tr>
				
				<tr>
					<th rowspan="2">압력손실(㎏/㎠)</th>
					<th colspan="2" style="text-align:center">
						냉수
					</th>
					<th colspan="2" style="text-align:center">
						냉각수
					</th>
					<th rowspan="2">접속관경(A)</th>
					<th colspan="2" style="text-align:center">
						냉수
					</th>
					<th colspan="2" style="text-align:center">
						냉각수
					</th>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" id="presslossNight" name="presslossNight" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.presslossNight}" escapeXml="false" />"/>
					</td>
					<td colspan="2">
						<input type="text" id="presslossDay" name="presslossDay" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.presslossDay}" escapeXml="false" />"/>
					</td>
					<td colspan="2">
						<input type="text" id="pipeDiamWt" name="pipeDiamWt" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.pipeDiamWt}" escapeXml="false" />"/>&nbsp;
					</td>
					<td colspan="2">
						<input type="text" id="pipeDiamCw" name="pipeDiamCw" class="inp_txt w01" style="width:200px;" value="<c:out value="${chillerInfo.pipeDiamCw}" escapeXml="false" />"/>&nbsp;
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
	<c:choose>
		<c:when test ="${chillerInfo.fsmId eq null}">
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('reg');">등 록</a></span>
		</c:when>
		<c:otherwise>		
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump();">저 장</a></span>
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('del');">삭 제</a></span>
		</c:otherwise>
	</c:choose>
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/equipment/chillerList.do">취소</a></span>
	</div>
</form:form>
</div>