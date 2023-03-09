<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
 	 if(!isEmpty($("#fhmId").val())) { // 상세화면
 		$("select[name=sgId]").val('${heatExcInfo.sgId}').prop("selected", true);
 		$("#sgId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#sgId").change(function() {this.selectedIndex = this.initialSelect; });
		$("#siteId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#siteId").change(function() {this.selectedIndex = this.initialSelect; });
	}
	
	selectSiteList($("#sgId").val());
	$("#sgId").change(function() {
		selectSiteList($(this).val());
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
			if(list[i].siteId == '${heatExcInfo.siteId}') {
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
	if($('#siteId').val() == '' || $('#siteId').val() == null){ 
		alert('지점을 선택해주세요.');
		return false;
	}
	
	if($('#heatexcName').val() == '' || $('#heatexcName').val() == null){
		alert('장비명 항목을 확인해주세요.');
		return false;
	}	
	return true;
}

/* 등록,수정,삭제 */
 function registPump(flag){
	 var testRunDate =$('#testRunDate').val()
	 var f = document.frm;
	 f.testRunDate.value = testRunDate.replace(/-/gi,"");
	 if (flag=="del"){ // 삭제일경우
		f.useFlag.value = flag;
		if(confirm("삭제하시겠습니까?")){	
			f.action = "<c:url value = '/uems/mng/equipment/heatExcRegistExe.do'/>"
 	 		f.submit();
		}
	 }else{
 	 	if(valChk()){ //유효성체크 결과 true일경우
 	 		if(flag == "reg"){ //등록일 때는 검색조건 없애준다.
 	 			f.currPage.value = 1;
 	 			f.searchKeyword.value = null;
 	 			f.searchCondition2.value= null;
 	 		}
 	 		f.action = "<c:url value = '/uems/mng/equipment/heatExcRegistExe.do'/>"
 	 		f.submit();
 	 	}
 	 };
  }
	 
</script>

<div class="contents_wrap">
<form:form commandName="heatExc" name="frm" id="frm" method="post">	
	<form:hidden path="fhmId"/>
	<form:hidden path="useFlag"/>
	<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${heatExc.currPage}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="<c:out value="${heatExc.searchCondition}" escapeXml="false" />" />
	<input type ="hidden" id ="searchKeyword" name = "searchKeyword" value ="<c:out value="${heatExc.searchKeyword}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="<c:out value="${heatExc.searchCondition2}" escapeXml="false" />" />
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
			<li class="on"><a href="#">열교환기관리</a></li>
			<li><a href="/uems/mng/equipment/chillerList.do">냉동기관리</a></li>
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
				<col width="20%"/>
				<col width="20%"/>
			</colgroup>
			
			<tbody>
				<tr>
					<th>고객명 *</th>
					<td colspan ="8">
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
					<td colspan ="8">
						<input type="text" id="heatexcName" name="heatexcName" class="inp_txt w01" style="width:400px;" value="<c:out value="${heatExcInfo.heatexcName}" escapeXml="false" />"  />
					</td> 
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="8">
						<input type="text" id="address" name="address" class="inp_txt w01" style="width:800px;" value="<c:out value="${heatExcInfo.address}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="8">
						<input type="text" id="phone" name="phone" class="inp_txt w01" style="width:800px;" value="<c:out value="${heatExcInfo.phone}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan ="4">
						<span class="entry_calendar">
							<fmt:parseDate value="${heatExcInfo.testRunDate}" var="testRunDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="testRunDate" name="testRunDate" value="<fmt:formatDate value="${testRunDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" readonly="readonly"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
					<th>전원</th>
					<td colspan ="4">
						<input type="text" id="powerSupply" name="powerSupply" class="inp_txt w01" value="<c:out value="${heatExcInfo.powerSupply}" escapeXml="false" />"/>
					</td>
				</tr>	
				<tr>
					<th>형식</th>
					<td colspan="4">
						<input type="text" id="form" name="form" class="inp_txt w01" value="<c:out value="${heatExcInfo.form}" escapeXml="false" />"/>
					</td> 
					<th>모델번호</th>
					<td colspan="4" id = "cnt">
						<input type="text" id="modelNo" name="modelNo" class="inp_txt w01" value="<c:out value="${heatExcInfo.modelNo}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="4">
						<input type="text" id="salesInfo" name="salesInfo" class="inp_txt w01" value="<c:out value="${heatExcInfo.salesInfo}" escapeXml="false" />"/>
					</td> 
					<th>A/S</th>
					<td colspan="4">
						<input type="text" id="asInfo" name="asInfo" class="inp_txt w01" value="<c:out value="${heatExcInfo.asInfo}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th></th>
					<th colspan="2" style="text-align:center">냉수</th>
					<th colspan="2" style="text-align:center">브라인</th>
					<th></th>
					<th style="text-align:center">냉수</th>
					<th style="text-align:center">브라인</th>
				</tr>
				<tr>
					<th>용량</th>
					<td colspan="2">
						<input type="text" id="volumnCw" name="volumnCw" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.volumnCw}" escapeXml="false" />"/>&nbsp;㎉/h
					</td>
					<td colspan="2">
						<input type="text" id="volumnBi" name="volumnBi" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.volumnBi}" escapeXml="false" />"/>&nbsp;USRt
					</td>
					<th>전열면적</th>
					<td>
						<input type="text" id="heatareaCw" name="heatareaCw" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.heatareaCw}" escapeXml="false" />"/>&nbsp;㎡
					</td>
					<td>
						<input type="text" id="heatareaBi" name="heatareaBi" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.heatareaBi}" escapeXml="false" />"/>&nbsp;㎡
					</td>
				</tr>
				<tr>
					<th rowspan="2">온도</th>
					<td colspan="2" rowspan="2">
						<input type="text" id="tempCw1" name="tempCw1" class="inp_txt w01" style="width:120px;" value="<c:out value="${heatExcInfo.tempCw1}" escapeXml="false" />"/> /
						<input type="text" id="tempCw2" name="tempCw2" class="inp_txt w01" style="width:120px;" value="<c:out value="${heatExcInfo.tempCw2}" escapeXml="false" />"/>
					</td>
					<td colspan="2" rowspan="2">
						<input type="text" id="tempBi1" name="tempBi1" class="inp_txt w01" style="width:120px;" value="<c:out value="${heatExcInfo.tempBi1}" escapeXml="false" />"/> /
						<input type="text" id="tempBi2" name="tempBi2" class="inp_txt w01" style="width:120px;" value="<c:out value="${heatExcInfo.tempBi2}" escapeXml="false" />"/>
					</td>
					<th >판두께</th>
					<td colspan="2">
						<input type="text" id="plateThickness" name="plateThickness" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.plateThickness}" escapeXml="false" />"/>&nbsp;mm
					</td>
				</tr>
				<tr>
					<!-- <td colspan="2"></td>
					<td colspan="2"></td> -->
					
					<th>판수량</th>
					<td colspan="2" style="text-align:center">
						<input type="text" id="plateCount" name="plateCount" class="inp_txt w01" style="width:300px;" value="<c:out value="${heatExcInfo.plateCount}" escapeXml="false" />"/>&nbsp;EA
					</td>
				</tr>
				<tr>
					<th rowspan="2">유량</th>
					<td rowspan="2">
						<input type="text" id="flowCw1" name="flowCw1" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.flowCw1}" escapeXml="false" />"/>㎥/h
					</td>
					<td rowspan="2">
						<input type="text" id="flowCw2" name="flowCw2" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.flowCw2}" escapeXml="false" />"/>lpm
					</td>
					<td rowspan="2">
						<input type="text" id="flowBi1" name="flowBi1" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.flowBi1}" escapeXml="false" />"/>㎥/h
					</td>
					<td rowspan="2">
						<input type="text" id="flowBi2" name="flowBi2" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.flowBi2}" escapeXml="false" />"/>lpm
					</td>
					<th>판재질</th>
					<td colspan="2" style="text-align:center">
						<input type="text"  id="plateMaterial" name="plateMaterial" class="inp_txt w01" style="width:300px;" value="<c:out value="${heatExcInfo.plateMaterial}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th>판타입</th>
					<td colspan="2" style="text-align:center">
						<input type="text" id="plateType" name="plateType" class="inp_txt w01" style="width:300px;" value="<c:out value="${heatExcInfo.plateType}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th>유체</th>
					<td colspan="2">
						<input type="text" id="fluidCwMaterial" name="fluidCwMaterial" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.fluidCwMaterial}" escapeXml="false" />"/>
						<input type="text" id="fluidCwPercent" name="fluidCwPercent" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.fluidCwPercent}" escapeXml="false" />"/>&nbsp;%
					</td>
					<td colspan="2">
						<input type="text" id="fluidBiMaterial" name="fluidBiMaterial" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.fluidBiMaterial}" escapeXml="false" />"/>
						<input type="text" id="fluidBiPercent" name="fluidBiPercent" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.fluidBiPercent}" escapeXml="false" />"/>&nbsp;%
					</td>
					<th>LMTD</th>
					<td colspan="2" style="text-align:center">
						<input type="text" id="lmtd" name="lmtd" class="inp_txt w01" style="width:300px;" value="<c:out value="${heatExcInfo.lmtd}" escapeXml="false" />"/>
					</td>
				</tr>
				
				<tr>
					<th>손실수두</th>
					<td colspan="2">
						<input type="text" id="lossCw" name="lossCw" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.lossCw}" escapeXml="false" />"/>(단위포함 입력)
					</td>
					<td colspan="2">
						<input type="text" id="lossBi" name="lossBi" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.lossBi}" escapeXml="false" />"/>(단위포함 입력)
					</td>
					<th>가스켓재질</th>
					<td colspan="2" style="text-align:center">
						<input type="text" id="gasket" name="gasket" class="inp_txt w01" style="width:300px;" value="<c:out value="${heatExcInfo.gasket}" escapeXml="false" />"/>
					</td>
				</tr>
				
				<tr>
					<th>중량</th>
					<td colspan="2">
						<input type="text" id="weightCwName" name="weightCwName" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.weightCwName}" escapeXml="false" />"/>
						<input type="text" id="weightCwVol" name="weightCwVol" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.weightCwVol}" escapeXml="false" />"/>&nbsp;ton
					</td>
					<td colspan="2">
						<input type="text" id="weightBiName" name="weightBiName" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.weightBiName}" escapeXml="false" />"/>
						<input type="text" id="weightBiVol" name="weightBiVol" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.weightBiVol}" escapeXml="false" />"/>&nbsp;ton
					</td>
					<th>크기</th>
					<td colspan="2" style="text-align:center">
						<input type="text" id="sizeW" name="sizeW" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.sizeW}" escapeXml="false" />"/>&nbsp;(W)X
						<input type="text" id="sizeL" name="sizeL" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.sizeL}" escapeXml="false" />"/>&nbsp;(L)X
						<input type="text" id="sizeH" name="sizeH" class="inp_txt w01" style="width:100px;" value="<c:out value="${heatExcInfo.sizeH}" escapeXml="false" />"/>&nbsp;(H)
					</td>
				</tr>
				<tr>
					<th>설계입력</th>
					<td colspan="2">
						<input type="text" id="pressCw" name="pressCw" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.pressCw}" escapeXml="false" />"/>(단위포함 입력)
					</td>
					<td colspan="2">
						<input type="text" id="pressBi" name="pressBi" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.pressBi}" escapeXml="false" />"/>(단위포함 입력)
					</td>
					<th>접속관경</th>
					<td>
						<input type="text" id="pipeDiamCw" name="pipeDiamCw" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.pipeDiamCw}" escapeXml="false" />"/>&nbsp;A
					</td>
					<td>
						<input type="text" id="pipeDiamBi" name="pipeDiamBi" class="inp_txt w01" style="width:200px;" value="<c:out value="${heatExcInfo.pipeDiamBi}" escapeXml="false" />"/>&nbsp;A
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
	<c:choose>
		<c:when test ="${heatExcInfo.fhmId eq null}">
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('reg');">등 록</a></span>
		</c:when>
		<c:otherwise>		
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump();">저 장</a></span>
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('del');">삭 제</a></span>
		</c:otherwise>
	</c:choose>
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/equipment/heatExcList.do">취소</a></span>
	</div>
</form:form>
</div>
