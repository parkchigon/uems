<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
  	 if(!isEmpty($("#fhsm").val())) { // 상세화면
  		$("select[name=sgId]").val('${heatStgInfo.sgId}').prop("selected", true);
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
			if(list[i].siteId == '${heatStgInfo.siteId}') {
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
	
	if($('#heatstgName').val() == '' || $('#heatstgName').val() == null){
		alert('이름 항목을 확인해주세요.');
		return false;
	}	
	return true;
}

/* 등록,수정,삭제 */
 function registHeatStg(flag){
	 var testRunDate =$('#testRunDate').val()
	 var f = document.frm;
	 f.testRunDate.value = testRunDate.replace(/-/gi,"");
	 if (flag=="del"){ // 삭제일경우
		f.useFlag.value = flag;
		if(confirm("삭제하시겠습니까?")){	
			f.action = "<c:url value = '/uems/mng/equipment/heatStgRegistExe.do'/>"
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
 	 		f.action = "<c:url value = '/uems/mng/equipment/heatStgRegistExe.do'/>"
 	 		f.submit();
 	 	}
 	 };
  }
	 
</script>

<div class="contents_wrap">
<form:form commandName="heatStg" name="frm" id="frm" method="post">	
	<form:hidden path="fhsm"/>
	<form:hidden path="useFlag"/>
	<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${heatStg.currPage}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="<c:out value="${heatStg.searchCondition}" escapeXml="false" />" />
	<input type ="hidden" id ="searchKeyword" name = "searchKeyword" value ="<c:out value="${heatStg.searchKeyword}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="<c:out value="${heatStg.searchCondition2}" escapeXml="false" />" />
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
			<li><a href="/uems/mng/equipment/chillerList.do">냉동기관리</a></li>
			<li><a href="/uems/mng/equipment/autoCtrlList.do">자동제어</a></li>
			<li class="on"><a href="#">축열조 및 배관</a></li>
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
			
			<tbody id="pumpRegist">
				<tr>
					<th>고객명 *</th>
					<td colspan ="8">
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
				</tr>
				<tr>
					<th>장비명 *</th>
					<td colspan ="8">
						<input type="text" id="heatstgName" name="heatstgName" class="inp_txt w01" style="width:400px;" value="<c:out value="${heatStgInfo.heatstgName}" escapeXml="false" />"  />
					</td> 
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="8">
						<input type="text" id="address" name="address" class="inp_txt w01" style="width:800px;" value="<c:out value="${heatStgInfo.address}" escapeXml="false" />"  />
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="8">
						<input type="text" id="phone" name="phone" class="inp_txt w01" style="width:800px;" value="<c:out value="${heatStgInfo.phone}" escapeXml="false" />"  />
					</td> 
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan ="4">
						<span class="entry_calendar">
							<fmt:parseDate value="${heatStgInfo.testRunDate}" var="testRunDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="testRunDate" name="testRunDate" value="<fmt:formatDate value="${testRunDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" readonly="readonly"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
					<th>관재질</th>
					<td colspan ="4">
						<input type="text" id="material" name="material" class="inp_txt w01" value="<c:out value="${heatStgInfo.material}" escapeXml="false" />"/>
					</td>
				</tr>	
				<tr>
					<th>형식</th>
					<td colspan="4">
						<input type="text" id="form" name="form" class="inp_txt w01" value="<c:out value="${heatStgInfo.form}" escapeXml="false" />"/>
					</td> 
					<th>타입</th>
					<td colspan="4" id = "cnt">
						<input type="text" id="type" name="type" class="inp_txt w01" value="<c:out value="${heatStgInfo.type}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="4">
						<input type="text" id="salesInfo" name="salesInfo" class="inp_txt w01" value="<c:out value="${heatStgInfo.salesInfo}" escapeXml="false" />"/>
					</td> 
					<th>A/S</th>
					<td colspan="4">
						<input type="text" id="asInfo" name="asInfo" class="inp_txt w01" value="<c:out value="${heatStgInfo.asInfo}" escapeXml="false" />"/>
					</td> 
				</tr>
				
				<tr>
					<th></th>
					<th colspan="4" style="text-align:center">축열조 사양</th>
					<th></th>
					<th colspan="4" style="text-align:center">배관</th>
				</tr>
				<tr>
					<th>피크부하</th>
					<td colspan="4">
						<input type="text" id="peakLoad" name="peakLoad" class="inp_txt w01" style="width:90%;" value="<c:out value="${heatStgInfo.peakLoad}" escapeXml="false" />"/>&nbsp;USRt
					</td>
					<th>관 재질</th>
					<td colspan="4">
						<input type="text" id="pipeMaterial" name="pipeMaterial" class="inp_txt w01" value="<c:out value="${heatStgInfo.pipeMaterial}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th>축열조용량</th>
					<td colspan="4">
						<input type="text" id="volumn" name="volumn" class="inp_txt w01" style="width:89%;" value="<c:out value="${heatStgInfo.volumn}" escapeXml="false" />"/>&nbsp;USRt-hr
					</td>
					<th>관 경</th>
					<td colspan="1">
						&nbsp;축냉&nbsp;&nbsp;<input type="text" id="pipeDiamStorage" name="pipeDiamStorage" class="inp_txt w01" style="width:85%;" value="<c:out value="${heatStgInfo.pipeDiamStorage}" escapeXml="false" />"/>
					</td>
					<td colspan="3">
						&nbsp;방냉&nbsp;&nbsp;<input type="text" id="pipeDiamRelease" name="pipeDiamRelease" class="inp_txt w01" style="width:85%;" value="<c:out value="${heatStgInfo.pipeDiamRelease}" escapeXml="false" />"/>
					</td>
				</tr>
				<tr>
					<th>축열율</th>
					<td colspan="4">
						<input type="text" id="rate" name="rate" class="inp_txt w01" style="width:95%;" value="<c:out value="${heatStgInfo.rate}" escapeXml="false" />"/>&nbsp;%
					</td>
					<th rowspan="2">자동밸브<br/>사양</th>
					<td colspan="4">
						<input type="text" id="valve1Name" name="valve1Name" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve1Name}" escapeXml="false" />"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="valve11" name="valve11" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve11}" escapeXml="false" />"/>-WAY&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="valve12" name="valve12" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve12}" escapeXml="false" />"/>A&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="valve13" name="valve13" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve13}" escapeXml="false" />"/>EA
					</td>
				</tr>
				<tr>
					<th>크기</th>
					<td colspan="4">
						<input type="text" id="sizeW" name="sizeW" class="inp_txt w01" style="width:30%;" value="<c:out value="${heatStgInfo.sizeW}" escapeXml="false" />"/>&nbsp;X&nbsp;
						<input type="text" id="sizeL" name="sizeL" class="inp_txt w01" style="width:30%;" value="<c:out value="${heatStgInfo.sizeL}" escapeXml="false" />"/>&nbsp;X&nbsp;
						<input type="text" id="sizeH" name="sizeH" class="inp_txt w01" style="width:30%;" value="<c:out value="${heatStgInfo.sizeH}" escapeXml="false" />"/>
					</td>
					<td colspan="4">
						<input type="text" id="valve2Name" name="valve2Name" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve2Name}" escapeXml="false" />"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="valve21" name="valve21" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve21}" escapeXml="false" />"/>-WAY&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="valve22" name="valve22" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve22}" escapeXml="false" />"/>A&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="valve23" name="valve23" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.valve23}" escapeXml="false" />"/>EA
					</td>
				</tr>
				<tr>
					<th>캡슐수량</th>
					<td colspan="4">
						<input type="text" id="capsuleAmt" name="capsuleAmt" class="inp_txt w01" style="width:90%;" value="<c:out value="${heatStgInfo.capsuleAmt}" escapeXml="false" />"/>&nbsp;EA
					</td>
					<th>유량계사양</th>
					<td colspan="4">
						<input type="text" id="current1Name" name="current1Name" class="inp_txt w01" style="width:48%;" value="<c:out value="${heatStgInfo.current1Name}" escapeXml="false" />"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="current11" name="current11" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.current11}" escapeXml="false" />"/>A&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="current12" name="current12" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.current12}" escapeXml="false" />"/>EA
					</td>
				</tr>
				<tr>
					<th>유 체</th>
					<td colspan="4">
						<input type="text" id="fluid" name="fluid" class="inp_txt w01" value="<c:out value="${heatStgInfo.fluid}" escapeXml="false" />"/>
					</td>
					<th></th>
					<td colspan="4">
						<input type="text" id="current2Name" name="current2Name" class="inp_txt w01" style="width:48%;" value="<c:out value="${heatStgInfo.current2Name}" escapeXml="false" />"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="current21" name="current21" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.current21}" escapeXml="false" />"/>A&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="current22" name="current22" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.current22}" escapeXml="false" />"/>EA
					</td>
				</tr>
				<tr>
					<th>브라인량</th>
					<td colspan="4">
						<input type="text" id="brineAmt1" name="brineAmt1" class="inp_txt w01" style="width:42%;" value="<c:out value="${heatStgInfo.brineAmt1}" escapeXml="false" />"/>&nbsp;ton&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="brineAmt2" name="brineAmt2" class="inp_txt w01" style="width:42%;" value="<c:out value="${heatStgInfo.brineAmt2}" escapeXml="false" />"/>&nbsp;%
					</td>
					<th></th>
					<td colspan="4">
						<input type="text" id="current3Name" name="current3Name" class="inp_txt w01" style="width:48%;" value="<c:out value="${heatStgInfo.current3Name}" escapeXml="false" />"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="current31" name="current31" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.current31}" escapeXml="false" />"/>A&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="current32" name="current32" class="inp_txt w01" style="width:20%;" value="<c:out value="${heatStgInfo.current32}" escapeXml="false" />"/>EA
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
	<c:choose>
		<c:when test ="${heatStgInfo.fhsm eq null}">
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registHeatStg('reg');">등 록</a></span>
		</c:when>
		<c:otherwise>		
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registHeatStg();">저 장</a></span>
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registHeatStg('del');">삭 제</a></span>
		</c:otherwise>
	</c:choose>
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/equipment/heatStgList.do">취소</a></span>
	</div>
</form:form>
</div>
