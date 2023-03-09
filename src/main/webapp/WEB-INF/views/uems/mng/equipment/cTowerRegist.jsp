<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
	if(!isEmpty($("#fcmId").val())) { // 상세화면
		$("select[name=sgId]").val('${cTowerInfo.sgId}').prop("selected", true);
		$("#sgId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#sgId").change(function() {this.selectedIndex = this.initialSelect; });
		$("#siteId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#siteId").change(function() {this.selectedIndex = this.initialSelect; });
	}
	selectSiteList($("#sgId").val());
	$("#sgId").change(function() {
		selectSiteList($(this).val());
	});
	
	var rc = jQuery("#cTowerRegist > tr").length;  //첫화면 하위 테이블 length 확인
	var cnt = 0;
	if(rc >= 10){
		$(".ctowerSubNameClass").each(function(){	
	    	cnt +=1;
		});
	}
	$('#cnt').val(cnt);
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
			if(list[i].siteId == '${cTowerInfo.siteId}') {
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
	var rowCount = jQuery("#cTowerRegist > tr").length;
	var chk = true; 
	var count =0;
	var arr = new Array();
	
	if(document.getElementById('siteId').value == '' || document.getElementById('siteId').value == null){ 
		alert('지점을 선택해주세요.');
		return false;
	}
	
	if($('#ctowerName').val() == '' || $('#ctowerName').val() == null){ //상위 장비명 null체크 
		alert('장비명 항목을 확인해주세요.');
		return false;
	}
	var subCnt = $(".subEquipment").length;
	if(subCnt < 1) {
		alert("하위장비를 등록해주세요.");
		return false;
	}	
	if(rowCount >= 10){ //하위 데이터가 있는경우 유효성체크
		$(".ctowerSubNameClass").each(function(){	
	    	if($(this).val() == null || $(this).val() == ''){ // 펌프명 null체크
	    			alert('하위 냉각탑명명 항목을 확인해주세요.');
					chk= false;
	    			return false; // 2칸이상 null일경우 roop를 끝내기 위한 return
			}else{					//펌프명 중복체크 위한 배열
				arr.push($(this).val());
				count+=1;
			}
		});
		for(var i=0;i<count;i++){	//중복있을 경우 return false
			for(var m=i+1;m<count;m++){
				if(arr[i] == arr[m]){
					alert("같은 냉각탑명을 입력할 수 없습니다.");
					chk=false;
					return false;
				}
			}
		}
	}
	if(chk){
		return true;
	}else{
		return false;
	}
	return true;
}

 var temp = 1;
function addRow() { // 펌프 세부항목 추가
	var rowCount =parseInt($('#cnt').val());
	rowCount= rowCount+temp;
	temp=temp+1;
	var num = rowCount-1;
	
	var subCnt = $(".subEquipment").length;
	if(subCnt > 3) {
		alert("최대 4개까지만 등록 가능합니다.");
		return;
	}
	 $('#cTowerRegist:last').append('<tr class="subEquipment">'
    	+'<td><input type="text" class="inp_txt w01 ctowerSubNameClass" id= "ctowerSubName'+rowCount+'" name= "subCTower['+num+'].ctowerSubName" /></td>'
    	+'<td><input type="text" class="inp_txt w01 motorCountClass" id= "motorCount'+rowCount+'" name= "subCTower['+num+'].motorCount" style="width:80%;" />&nbsp;EA</td>'
    	+'<td><input type="text" class="inp_txt w01 powerSupplyClass" id= "powerSupply'+rowCount+'" name= "subCTower['+num+'].powerSupply" /></td>'
    	+'<td colspan="2"><input type="text" class="inp_txt w01 spendPowerKwClass" id= "spendPowerKw'+rowCount+'" name= "subCTower['+num+'].spendPowerKw" style="width:40%;" />&nbsp;Kw&nbsp;&nbsp;&nbsp;&nbsp;'
    	+'<input type="text" class="inp_txt w01 spendPowerHpClass" id= "spendPowerHp'+rowCount+'" name= "subCTower['+num+'].spendPowerHp" style="width:40%;" />&nbsp;HP</td>'
    	+'<td><input type="text" class="inp_txt w01 currentClass" id= "current'+rowCount+'" name= "subCTower['+num+'].current" />'
    	+'<td colspan="2"><input type="text" class="inp_txt w01 flow1Class" id= "flow1'+rowCount+'" name= "subCTower['+num+'].flow1" style="width:120px;" />&nbsp;m2/h&nbsp;&nbsp;&nbsp;&nbsp;'
    	+'<input type="text" class="inp_txt w01 flow2Class" id= "flow2'+rowCount+'" name= "subCTower['+num+'].flow2" style="width:120px;" />&nbsp;lpm</td>'
        +'<td rowspan="2"><span class="btn btn_type01"><a href="#" onclick="deleteRow(this);">삭제</a></span></td>'
        +'</tr>'
        +'<tr>'
        +'<td><input type="text" class="inp_txt w01 volumnClass" id= "volumn'+rowCount+'" name= "subCTower['+num+'].volumn" /></td>'
        +'<td colspan="2"><input type="text" class="inp_txt w01 chemical1NameClass" id="chemical1Name'+rowCount+'" name="subCTower['+num+'].chemical1Name" style="width:45%;"/>&nbsp;&nbsp;&nbsp;&nbsp;'
        +'<input type="text" class="inp_txt w01 chemical1DescClass" id="chemical1Desc'+rowCount+'" name="subCTower['+num+'].chemical1Desc" style="width:45%;"/></td>'
        +'<td colspan="2"><input type="text" class="inp_txt w01 chemical2NameClass" id="chemical2Name'+rowCount+'" name="subCTower['+num+'].chemical2Name" style="width:45%;"/>&nbsp;&nbsp;&nbsp;&nbsp;'
        +'<input type="text" class="inp_txt w01 chemical2DescClass" id="chemical2Desc'+rowCount+'" name="subCTower['+num+'].chemical2Desc" style="width:45%;"/></td>'
        +'<td colspan="2"><input type="text" class="inp_txt w01 chemical3NameClass" id="chemical3Name'+rowCount+'" name="subCTower['+num+'].chemical3Name" style="width:45%;"/>&nbsp;&nbsp;&nbsp;&nbsp;'
        +'<input type="text" class="inp_txt w01 chemical3DescClass" id="chemical3Desc'+rowCount+'" name="subCTower['+num+'].chemical3Desc" style="width:45%;"/></td>'
        +'<td><input type="text" class="inp_txt w01 fluidClass" id= "fluid'+rowCount+'" name= "subCTower['+num+'].fluid" /></td>'
       +'</tr>');
}

function deleteRow(obj){ //펌프 세부항목 삭제
	var length = jQuery("#cTowerRegist > tr").length;
	if(length >= 9){
  		$(obj).parent().parent().parent().next().remove();
  		$(obj).parent().parent().parent().remove();
	}
}


 /* 등록,수정 */
 function registCTower(flag){
	 var testRunDate =$('#testRunDate').val();
	 var f = document.frm;
	 if (flag=="del"){
		f.useFlag.value = flag;
		if(confirm("삭제하시겠습니까?")){
			f.testRunDate.value = testRunDate.replace(/-/gi,"");
			f.action = "<c:url value = '/uems/mng/equipment/cTowerRegistExe.do'/>"
			f.submit();
		}
	 }else{
		if(valChk()){ //유효성체크 결과 true일경우
 	 		if(flag == "reg"){ //등록일 때는 검색조건 없애준다.
 	 			f.currPage.value = 1;
 	 			f.searchCondition.value= null;
 				f.searchCondition2.value= null;
 				f.searchKeyword.value= null;
 	 		}
 	 		f.testRunDate.value = testRunDate.replace(/-/gi,"");
			f.action = "<c:url value = '/uems/mng/equipment/cTowerRegistExe.do'/>"
			f.submit();
	 	}
	 };
}
</script>

<div class="contents_wrap">
<form:form commandName="cTower" name="frm" id="frm" method="post">	
	<form:hidden path="fcmId"/>
	<form:hidden path="useFlag"/>
	<input type ="hidden" id ="cnt" name = "cnt" value ="" />
	<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${cTower.currPage}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="<c:out value="${cTower.searchCondition}" escapeXml="false" />" />
	<input type ="hidden" id ="searchKeyword" name = "searchKeyword" value ="<c:out value="${cTower.searchKeyword}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="<c:out value="${cTower.searchCondition2}" escapeXml="false" />" />
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
			<li><a href="/uems/mng/equipment/heatStgList.do">축열조 및 배관</a></li>
			<li><a href="/uems/mng/equipment/elecMccList.do">심야전기MCC</a></li>
			<li class="on"><a href="/uems/mng/equipment/cTowerList.do">냉각탑</a></li>
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
				<col width="6%"/>
				
			<!-- 	<col width="2%"/> -->
			</colgroup>
			
			<tbody id="cTowerRegist">
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
					<th>이름 *</th>
					<td colspan ="8">
						<input type="text" id="ctowerName" name="ctowerName" class="inp_txt w01" style="width:400px;" value="<c:out value="${cTowerInfo.ctowerName}" escapeXml="false" />" />
					</td> 
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="8">
						<input type="text" id="address" name="address" class="inp_txt w01" style="width:800px;" value="<c:out value="${cTowerInfo.address}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="8">
						<input type="text" id="phone" name="phone" class="inp_txt w01" style="width:800px;" value="<c:out value="${cTowerInfo.phone}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan ="8">
						<span class="entry_calendar">
							<fmt:parseDate value="${cTowerInfo.testRunDate}" var="testRunDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="testRunDate" name="testRunDate" value="<fmt:formatDate value="${testRunDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" readonly="readonly"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
				</tr>	
				<tr>
					<th>형식</th>
					<td colspan="3">
						<input type="text" id="type" name="type" class="inp_txt w01" value="<c:out value="${cTowerInfo.type}" escapeXml="false" />"/>
					</td> 
					<th>수량</th>
					<td colspan="4">
						<input type="text" id="count" name="count" class="inp_txt w01" value="${cTowerInfo.count}"/>
					</td> 
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="3">
						<input type="text" id="salesInfo" name="salesInfo" class="inp_txt w01" value="<c:out value="${cTowerInfo.salesInfo}" escapeXml="false" />"/>
					</td> 
					<th>A/S</th>
					<td colspan="4">
						<input type="text" id="asInfo" name="asInfo" class="inp_txt w01" value="<c:out value="${cTowerInfo.asInfo}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>냉각탑명 *</th>
					<th>모터수량</th>
					<th>전원</th>
					<th colspan="2">소비동력</th>
					<th>전류</th>
					<th colspan="2">유량</th>
					<th rowspan ="2">			
						<span class="btn btn_type01"><a href="#" onclick="addRow();">추가</a></span>
					</th> 
				</tr>
				<tr>
					<th>용량(CRt)</th>
					<th colspan="2">약품1</th>
					<th colspan="2">약품2</th>
					<th colspan="2">약품3</th>
					<th>유체</th>
				</tr>
				
				<c:if test="${searchSubCTowerList.size() > 0}" >
					<c:forEach var="item" items="${searchSubCTowerList}" varStatus="i">
						<tr style="border-left: 1px solid #dedede;" class="subEquipment">
					    	<input type="hidden" name="subCTower[${i.count-1}].fcId" value="${item.fcId}" />
					    	<td><input type="text" class="inp_txt w01 ctowerSubNameClass" id= "ctowerSubName${i.count}" name= "subCTower[${i.count-1}].ctowerSubName" value="${item.ctowerSubName}" /></td>
					    	<td><input type="text" class="inp_txt w01 motorCountClass" id= "motorCount${i.count}" name= "subCTower[${i.count-1}].motorCount" style="width:80%;" value="${item.motorCount}"/>&nbsp;EA</td>
					    	<td><input type="text" class="inp_txt w01 powerSupplyClass" id= "powerSupply${i.count}" name= "subCTower[${i.count-1}].powerSupply" value="${item.powerSupply}"/></td>
					    	<td colspan="2"><input type="text" class="inp_txt w01 spendPowerKwClass" id= "spendPowerKw${i.count}" name= "subCTower[${i.count-1}].spendPowerKw" style="width:40%;" value="${item.spendPowerKw}"/>&nbsp;Kw&nbsp;&nbsp;&nbsp;&nbsp;
					    	<input type="text" class="inp_txt w01 spendPowerHpClass" id= "spendPowerHp${i.count}" name= "subCTower[${i.count-1}].spendPowerHp" style="width:40%;" value="${item.spendPowerHp}"/>&nbsp;HP</td>
					    	<td><input type="text" class="inp_txt w01 currentClass" id= "current${i.count}" name= "subCTower[${i.count-1}].current" value="${item.current}"/>
					    	<td colspan="2"><input type="text" class="inp_txt w01 flow1Class" id= "flow1${i.count}" name= "subCTower[${i.count-1}].flow1" style="width:120px;" value="${item.flow1}"/>&nbsp;m2/h&nbsp;&nbsp;&nbsp;&nbsp;
					    	<input type="text" class="inp_txt w01 flow2Class" id= "flow2${i.count}" name= "subCTower[${i.count-1}].flow2" style="width:120px;" value="${item.flow2}"/>&nbsp;lpm</td>
					        <td rowspan="2"><span class="btn btn_type01"><a href="#" onclick="deleteRow(this);">삭제</a></span></td>
				        </tr>
				        <tr>
					        <td><input type="text" class="inp_txt w01 volumnClass" id= "volumn${i.count}" name= "subCTower[${i.count-1}].volumn" value="${item.volumn}"/></td>
					        <td colspan="2"><input type="text" class="inp_txt w01 chemical1NameClass" id="chemical1Name${i.count}" name="subCTower[${i.count-1}].chemical1Name" style="width:45%;" value="${item.chemical1Name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
					        <input type="text" class="inp_txt w01 chemical1DescClass" id="chemical1Desc${i.count}" name="subCTower[${i.count-1}].chemical1Desc" style="width:45%;" value="${item.chemical1Desc}"/></td>
					        <td colspan="2"><input type="text" class="inp_txt w01 chemical2NameClass" id="chemical2Name${i.count}" name="subCTower[${i.count-1}].chemical2Name" style="width:45%;" value="${item.chemical2Name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
					        <input type="text" class="inp_txt w01 chemical2DescClass" id="chemical2Desc${i.count}" name="subCTower[${i.count-1}].chemical2Desc" style="width:45%;" value="${item.chemical2Desc}"/></td>
					        <td colspan="2"><input type="text" class="inp_txt w01 chemical3NameClass" id="chemical3Name${i.count}" name="subCTower[${i.count-1}].chemical3Name" style="width:45%;" value="${item.chemical3Name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
					        <input type="text" class="inp_txt w01 chemical3DescClass" id="chemical3Desc${i.count}" name="subCTower[${i.count-1}].chemical3Desc" style="width:45%;" value="${item.chemical3Desc}"/></td>
					        <td><input type="text" class="inp_txt w01 fluidClass" id= "fluid${i.count}" name= "subCTower[${i.count-1}].fluid" value="${item.fluid}"/></td>
					    </tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
	<c:choose>
		<c:when test ="${cTowerInfo.fcmId eq null}">
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registCTower('reg');">등 록</a></span>
		</c:when>
		<c:otherwise>		
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registCTower();">저 장</a></span>
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registCTower('del');">삭 제</a></span>
		</c:otherwise>
	</c:choose>
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/equipment/cTowerList.do">취소</a></span>
	</div>
</form:form>
</div>
