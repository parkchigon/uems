<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
 	if(!isEmpty($("#famId").val())) { // 상세화면
 		$("select[name=sgId]").val('${autoCtrlInfo.sgId}').prop("selected", true);
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
			if(list[i].siteId == '${autoCtrlInfo.siteId}') {
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
	
	if($('#autoctrlName').val() == '' || $('#autoctrlName').val() == null){
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
	 		f.action = "<c:url value ='/uems/mng/equipment/autoCtrlRegistExe.do'/>"
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
 	 		f.action = "<c:url value ='/uems/mng/equipment/autoCtrlRegistExe.do'/>"
 	 		f.submit();
 	 	}
 	 };
  }
	 
</script>

<div class="contents_wrap">
<form:form commandName="autoCtrl" name="frm" id="frm" method="post">	
	<form:hidden path="famId"/>
	<form:hidden path="useFlag"/>
	<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${autoCtrl.currPage}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="<c:out value="${autoCtrl.searchCondition}" escapeXml="false" />" />
	<input type ="hidden" id ="searchKeyword" name = "searchKeyword" value ="<c:out value="${autoCtrl.searchKeyword}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="<c:out value="${autoCtrl.searchCondition2}" escapeXml="false" />" />
	
	<div class="cont_wrap01">
		<h2 class="main_title">장비관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 장비를 조회 및 관리를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<div class="tab_wrap">
		<ul>
			<li><a href="/uems/mng/equipment/heatExcList.do">열교환기관리</a></li>
			<li><a href="/uems/mng/equipment/heatExcList.do">냉동기관리</a></li>
			<li><a href="/uems/mng/equipment/chillerList.do">냉동기관리</a></li>
			<li class="on"><a href="#">자동제어</a></li>
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
						<input type="text" id="autoctrlName" name="autoctrlName" class="inp_txt w01" style="width:400px;" value="<c:out value="${autoCtrlInfo.autoctrlName}" escapeXml="false" />"  />
					</td> 
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="4">
						<input type="text" id="address" name="address" class="inp_txt w01" style="width:800px;" value="<c:out value="${autoCtrlInfo.address}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="4">
						<input type="text" id="phone" name="phone" class="inp_txt w01" style="width:800px;" value="<c:out value="${autoCtrlInfo.phone}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan ="4">
						<span class="entry_calendar">
							<fmt:parseDate value="${autoCtrlInfo.testRunDate}" var="testRunDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="testRunDate" name="testRunDate" value="<fmt:formatDate value="${testRunDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" readonly="readonly"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
				</tr>
				<tr>
					<th>전원</th>
					<td >
						<input type="text" id="powerSupply" name="powerSupply" class="inp_txt w01" value="<c:out value="${autoCtrlInfo.powerSupply}" escapeXml="false" />"/>
					</td>
				
					<th>형식</th>
					<td >
						<input type="text" id="form" name="form" class="inp_txt w01" value="<c:out value="${autoCtrlInfo.form}" escapeXml="false" />"/>
					</td> 
				</tr>
				
				<tr>
					<th>업체명</th>
					
					<td >
						<input type="text" id="salesInfo" name="salesInfo" class="inp_txt w01" value="<c:out value="${autoCtrlInfo.salesInfo}" escapeXml="false" />"/>
					</td>
				
					<th>A/S</th>
					<td >
						<input type="text" id="asInfo" name="asInfo" class="inp_txt w01" value="<c:out value="${autoCtrlInfo.asInfo}" escapeXml="false" />"/>
					</td> 
				</tr>
				
				<tr>
					<th></th>
					<th >본체사양</th>
					<th ></th>
					<th >콘트롤 및 터치스크린</th>
				</tr>
				<tr>
					<th> 크기 </th>
					<td> 
						<input type="text" id="sizeW" name="sizeW" class="inp_txt w01" style="width:100px;" value="<c:out value="${autoCtrlInfo.sizeW}" escapeXml="false" />"/> &nbsp; X &nbsp;&nbsp;
						<input type="text" id="sizeL" name="sizeL" class="inp_txt w01" style="width:100px;" value="<c:out value="${autoCtrlInfo.sizeL}" escapeXml="false" />"/> &nbsp; X &nbsp;&nbsp;
						<input type="text" id="sizeH" name="sizeH" class="inp_txt w01" style="width:100px;" value="<c:out value="${autoCtrlInfo.sizeH}" escapeXml="false" />"/> 
					</td>
					<th> 메이커 </th>
					<td>
						<input type="text" id="ctrlMaker" name="ctrlMaker" class="inp_txt w01" style="width:200px;" value="<c:out value="${autoCtrlInfo.ctrlMaker}" escapeXml="false" />"/>
					</td>
				</tr>
				
				<tr>
					<th> 구성 </th>
					<td> 
						<input type="text" id="component" name="component" class="inp_txt w01" style="width:200px;" value="<c:out value="${autoCtrlInfo.component}" escapeXml="false" />"/>
					</td>
					<th> 인터넷 </th>
					<td>
						<input type="text" id="ctrlInternet" name="ctrlInternet" class="inp_txt w01" style="width:200px;" value="<c:out value="${autoCtrlInfo.ctrlInternet}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th></th>
					<th>PC - 본체</th>
					<th ></th>
					<th>PC - 모니터</th>
				</tr>
				<tr>
					<th>메이커</th>
					<td>
						<input type="text" id="pcMaker" name="pcMaker" class="inp_txt w01" style="width:200px;" value="<c:out value="${autoCtrlInfo.pcMaker}" escapeXml="false" />"/>
					</td>
					<th>메이커</th>
					<td>
						<input type="text" id="monMaker" name="monMaker" class="inp_txt w01" style="width:200px;" value="<c:out value="${autoCtrlInfo.monMaker}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th>모델명</th>
					<td>
						<input type="text" id="pcModel" name="pcModel" class="inp_txt w01" style="width:200px;" value="<c:out value="${autoCtrlInfo.pcModel}" escapeXml="false" />"/>
					</td>
					<th>모델명</th>
					<td>
						<input type="text" id="" name="monModel" class="inp_txt w01" style="width:200px;" value="<c:out value="${autoCtrlInfo.monModel}" escapeXml="false" />"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
	<c:choose>
		<c:when test ="${autoCtrlInfo.famId eq null}">
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('reg');">등 록</a></span>
		</c:when>
		<c:otherwise>		
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump();">저 장</a></span>
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('del');">삭 제</a></span>
		</c:otherwise>
	</c:choose>
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/equipment/autoCtrlList.do">취소</a></span>
	</div>
</form:form>
</div>
