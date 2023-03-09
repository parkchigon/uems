<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
 	if(!isEmpty($("#femId").val())) { // 상세화면
 		$("select[name=sgId]").val('${elecMccInfo.sgId}').prop("selected", true);
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
			if(list[i].siteId == '${elecMccInfo.siteId}') {
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
	
	if($('#elecmccName').val() == '' || $('#elecmccName').val() == null){
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
			f.action = "<c:url value ='/uems/mng/equipment/elecMccRegistExe.do'/>"
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
 	 		f.action = "<c:url value ='/uems/mng/equipment/elecMccRegistExe.do'/>"
 	 		f.submit();
 	 	}
 	 };
  }
	 
</script>

<div class="contents_wrap">
<form:form commandName="elecMcc" name="frm" id="frm" method="post">	
	<form:hidden path="femId"/>
	<form:hidden path="useFlag"/>
	<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${elecMcc.currPage}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="<c:out value="${elecMcc.searchCondition}" escapeXml="false" />" />
	<input type ="hidden" id ="searchKeyword" name = "searchKeyword" value ="<c:out value="${elecMcc.searchKeyword}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="<c:out value="${elecMcc.searchCondition2}" escapeXml="false" />" />
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
			<li><a href="/uems/mng/equipment/chillerList.do">냉동기관리</a></li>
			<li><a href="/uems/mng/equipment/autoCtrlList.do">자동제어</a></li>
			<li><a href="/uems/mng/equipment/heatStgList.do">축열조 및 배관</a></li>
			<li class="on"><a href="#">심야전기MCC</a></li>
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
				<col width="40%"/>
				<col width="10%"/>
				<col width="40%"/>
		
			</colgroup>
			
			<tbody>
				<tr>
					<th>고객명 *</th>
					<td colspan ="4">
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
						<input type="text" id="elecmccName" name="elecmccName" class="inp_txt w01" style="width:400px;" value="<c:out value="${elecMccInfo.elecmccName}" escapeXml="false" />"  />
					</td> 
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="4">
						<input type="text" id="address" name="address" class="inp_txt w01" style="width:800px;" value="<c:out value="${elecMccInfo.address}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="4">
						<input type="text" id="phone" name="phone" class="inp_txt w01" style="width:800px;" value="<c:out value="${elecMccInfo.phone}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan ="4">
						<span class="entry_calendar">
							<fmt:parseDate value="${elecMccInfo.testRunDate}" var="testRunDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="testRunDate" name="testRunDate" value="<fmt:formatDate value="${testRunDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" readonly="readonly"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
				</tr>
				
				<tr>
					<th>업체명</th>
					<td colspan="4">
						<input type="text" id="salesInfo" name="salesInfo" class="inp_txt w01" style="width:800px;" value="<c:out value="${elecMccInfo.salesInfo}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th></th>
					<th style="text-align:center">MCC판넬 메인</th>
					<th ></th>
					<th>냉동기부분</th>
				</tr>
				<tr>
					<th> 형식 </th>
					<td> 
						<input type="text" id="mccType" name="mccType" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.mccType}" escapeXml="false" />"/> 
						 
					</td>
					<th> 형식 </th>
					<td>
						<input type="text" id="refrigType" name="refrigType" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.refrigType}" escapeXml="false" />"/>
					</td>
				</tr>
				
				<tr>
					<th> 메이커 </th>
					<td> 
						<input type="text" id="mccMaker" name="mccMaker" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.mccMaker}" escapeXml="false" />"/>
					</td>
					<th> 인터넷 </th>
					<td>
						<input type="text" id="refrigInternet" name="refrigInternet" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.refrigInternet}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th></th>
					<th>인버터</th>
					<th></th>
					<th>전력량계</th>
				</tr>
				<tr>
					<th rowspan="2">사양</th>
					<td>
						<input type="text" id="inverterStorage" name="inverterStorage" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.inverterStorage}" escapeXml="false" />"/>
					</td>
					<th rowspan="2">사양</th>
					<td>
						심야:&nbsp;<input type="text" id="wattmeterNight" name="wattmeterNight" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.wattmeterNight}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="inverterRelease" name="inverterRelease" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.inverterRelease}" escapeXml="false" />"/>
					</td>
					<td>
						일반:&nbsp;<input type="text" id="wattmeterDay" name="wattmeterDay" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.wattmeterDay}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th>메이커</th>
					<td>
						<input type="text" id="inverterMaker" name="inverterMaker" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.inverterMaker}" escapeXml="false" />"/>
					</td>
					<th>메이커</th>
					<td>
						<input type="text" id="wattmeterMaker" name="wattmeterMaker" class="inp_txt w01" style="width:200px;" value="<c:out value="${elecMccInfo.wattmeterMaker}" escapeXml="false" />"/>
					</td>
				</tr> 
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
	<c:choose>
		<c:when test ="${elecMccInfo.femId eq null}">
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('reg');">등 록</a></span>
		</c:when>
		<c:otherwise>		
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump();">저 장</a></span>
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('del');">삭 제</a></span>
		</c:otherwise>
	</c:choose>
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/equipment/elecMccList.do">취소</a></span>
	</div>
</form:form>
</div>
