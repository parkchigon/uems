<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

$(document).ready(function(){
 	 if(!isEmpty($("#fpmId").val())) { // 상세화면
		$("select[name=sgId]").val('${pumpInfo.sgId}').prop("selected", true);
		$("select[name=pumpTypeCd]").val('${pumpInfo.pumpTypeCd}').prop("selected", true);
		$("#sgId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#sgId").change(function() {this.selectedIndex = this.initialSelect; });
		$("#siteId").focus(function() { this.initialSelect = this.selectedIndex; });
		$("#siteId").change(function() {this.selectedIndex = this.initialSelect; });;
	}
	
	selectSiteList($("#sgId").val());
	$("#sgId").change(function() {
		selectSiteList($(this).val());
	});
	
	var rc = jQuery("#pumpRegist > tr").length;  //첫화면 하위 테이블 length 확인
	var cnt = 0;
	if(rc >= 10){
		$(".pumpSubnameClass").each(function(){	
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
			if(list[i].siteId == '${pumpInfo.siteId}') {
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
	var rowCount = jQuery("#pumpRegist > tr").length;
	var chk = true; 
	var count =0;
	var arr = new Array();
	
	if(document.getElementById('siteId').value == '' || document.getElementById('siteId').value == null){ 
		alert('지점을 선택해주세요.');
		return false;
	}
	
	if($('#pumpName').val() == '' || $('#pumpName').val() == null){ //상위 장비명 null체크 
		alert('장비명 항목을 확인해주세요.');
		return false;
	}
	
	var subCnt = $(".subEquipment").length;
	if(subCnt < 1) {
		alert("하위장비를 등록해주세요.");
		return false;
	}	
	
	if(rowCount >= 10){ //하위 데이터가 있는경우 유효성체크
		$(".pumpSubnameClass").each(function(){	
	    	if($(this).val() == null || $(this).val() == ''){ // 펌프명 null체크
	    			alert('하위 펌프명 항목을 확인해주세요.');
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
					alert("같은 펌프명을 입력할 수 없습니다.");
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
	 $('#pumpRegist:last').append('<tr class="subEquipment">'
    	+'<td rowspan="2"><input type="text" class="inp_txt w01 pumpSubnameClass" id= "pumpSubname'+rowCount+'" name= "subPump['+num+'].pumpSubname" style="width:120px;" />&nbsp;&nbsp;'
    	+'<select id="pumpSubTypeCd'+rowCount+'"name="subPump['+num+'].pumpSubTypeCd"><c:forEach var="result" items="${pumpTypeList}" varStatus="status"><option value="${result.codeId}" >${result.codeName}</option></c:forEach></select>'
    	+'</td>'
    	+'<td><input type="text" class="inp_txt w01 pumpModelNameClass" id= "pumpModelName'+rowCount+'" name= "subPump['+num+'].pumpModelName" style="width:150px;" /></td>'
    	+'<td><input type="text" class="inp_txt w01 motorModelNameClass" id= "motorModelName'+rowCount+'" name= "subPump['+num+'].motorModelName" style="width:150px;" /></td>'
    	+'<td rowspan="2"><input type="text" class="inp_txt w01 powerSupplyClass" id= "powerSupply'+rowCount+'" name= "subPump['+num+'].powerSupply" style="width:130px;" /></td>'
    	+'<td><input type="text" class="inp_txt w01 spendPowerKwClass" id= "spendPowerKw'+rowCount+'" name= "subPump['+num+'].spendPowerKw" style="width:70px;" />&nbsp;Kw</td>'
    	+'<td rowspan="2"><input type="text" class="inp_txt w01 elecCurrentClass" id= "elecCurrent'+rowCount+'" name= "subPump['+num+'].elecCurrent" style="width:65px;" />&nbsp;A</td>'
    	+'<td><input type="text" class="inp_txt w01 flowRate1Class" id= "flowRate1'+rowCount+'" name= "subPump['+num+'].flowRate1" style="width:100px;" />㎥/h</td>'
    	+'<td rowspan="2"><input type="text" class="inp_txt w01 liftClass" id= "lift'+rowCount+'" name= "subPump['+num+'].lift" style="width:70px;" />&nbsp;m</td>'
        +'<td><input type="text" class="inp_txt w01 fluidMaterialClass" id="fluidMaterial'+rowCount+'" name="subPump['+num+'].fluidMaterial" style="width:100px;"/></td>'
        +'<td rowspan="2"><input type="text" class="inp_txt w01 motorTypeClass" id="motorType'+rowCount+'" name="subPump['+num+'].motorType" style="width:150px;" /></td> '
        +'<td rowspan="2"><span class="btn btn_type01"><a href="#" onclick="deleteRow(this);">삭제</a></span></td>'
        +'</tr>'
        +'<tr>'
    	+'<td>S/N&nbsp;<input type="text" class="inp_txt w01 pumpModelNoClass" id= "pumpModelNo'+rowCount+'" name= "subPump['+num+'].pumpModelNo" style="width:120px;" /></td>'
    	+'<td>S/N&nbsp;<input type="text" class="inp_txt w01 motorModelNoClass" id= "motorModelNo'+rowCount+'" name= "subPump['+num+'].motorModelNo" style="width:120px;" /></td>'
    	+'<td><input type="text" class="inp_txt w01 spendPowerHpClass" id= "spendPowerHp'+rowCount+'" name= "subPump['+num+'].spendPowerHp" style="width:70px;" />&nbsp;HP</td>'
    	+'<td><input type="text" class="inp_txt w01 flowRate2Class" id= "flowRate2'+rowCount+'" name= "subPump['+num+'].flowRate2" style="width:100px;" />&nbsp;lpm</td>'
        +'<td><input type="text" class="inp_txt w01 fluidPercentClass" id="fluidPercent'+rowCount+'" name="subPump['+num+'].fluidPercent" style="width:70px;"/>&nbsp;%</td>'
       +'</tr>');
} 


function deleteRow(obj){ //펌프 세부항목 삭제
	var length = jQuery("#pumpRegist > tr").length;
	if(length >= 9){
  		$(obj).parent().parent().parent().next().remove();
  		$(obj).parent().parent().parent().remove();
	}
}


/* 등록,수정 */
 function registPump(flag){
	 var testRunDate =$('#testRunDate').val();
	 var f = document.frm;
	 if (flag=="del"){
		f.useFlag.value = flag;
		if(confirm("삭제하시겠습니까?")){	
			f.testRunDate.value = testRunDate.replace(/-/gi,"");
			f.action = "<c:url value = '/uems/mng/equipment/pumpRegistExe.do'/>"
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
			f.action = "<c:url value = '/uems/mng/equipment/pumpRegistExe.do'/>"
			f.submit();
	 	}
	 };
}
 
</script>

<div class="contents_wrap">
<form:form commandName="pump" name="frm" id="frm" method="post">	
	<form:hidden path="fpmId"/>
	<form:hidden path="useFlag"/>
	<input type ="hidden" id ="cnt" name = "cnt" value ="" />
	<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${pump.currPage}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition" name = "searchCondition" value ="<c:out value="${pump.searchCondition}" escapeXml="false" />" />
	<input type ="hidden" id ="searchKeyword" name = "searchKeyword" value ="<c:out value="${pump.searchKeyword}" escapeXml="false" />" />
	<input type ="hidden" id ="searchCondition2" name = "searchCondition2" value ="<c:out value="${pump.searchCondition2}" escapeXml="false" />" />
	
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
			<li class="on"><a href="#">펌프관리</a></li>
			<li><a href="/uems/mng/equipment/heatExcList.do">열교환기관리</a></li>
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
				<col width="6%"/>
				<col width="9%"/>
				<col width="9%"/>
				<col width="7%"/>
				<col width="8%"/>
				<col width="6%"/>
				<col width="9%"/>
				<col width="6%"/>
				<col width="7%"/>
				<col width="7%"/>
				<col width="4%"/>
			</colgroup>
			
			<tbody id="pumpRegist">
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
					<td colspan ="10">
						<input type="text" id="pumpName" name="pumpName" class="inp_txt w01" style="width:400px;" value="<c:out value="${pumpInfo.pumpName}" escapeXml="false" />" />
						<form:select path="pumpTypeCd">
							<c:forEach var="result" items="${pumpTypeList}" varStatus="status">
								<form:option  value="${result.codeId}" label="${result.codeName}"/>
							</c:forEach>
						</form:select>
					</td> 
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="10">
						<input type="text" id="address" name="address" class="inp_txt w01" style="width:800px;" value="<c:out value="${pumpInfo.address}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="10">
						<input type="text" id="phone" name="phone" class="inp_txt w01" style="width:800px;" value="<c:out value="${pumpInfo.phone}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan ="10">
						<span class="entry_calendar">
							<fmt:parseDate value="${pumpInfo.testRunDate}" var="testRunDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="testRunDate" name="testRunDate" value="<fmt:formatDate value="${testRunDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" readonly="readonly"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
				</tr>	
				<tr>
					<th>형식</th>
					<td colspan="3">
						<input type="text" id="form" name="form" class="inp_txt w01" value="<c:out value="${pumpInfo.form}" escapeXml="false" />"/>
					</td> 
					<th>수량</th>
					<td colspan="3" id = "cnt">
						<input type="text" id="amtPumpName1" name="amtPumpName1" class="inp_txt w01" style="width:220px;" value="<c:out value="${pumpInfo.amtPumpName1}" escapeXml="false" />" /> &nbsp; &nbsp;
						<input type="text" id="amtPumpCnt1" name="amtPumpCnt1" class="inp_txt w01" style="width:70px;" value="<c:out value="${pumpInfo.amtPumpCnt1}" escapeXml="false" />" /> &nbsp;EA
					</td> 
					<td colspan="3" id = "cnt">
						<input type="text" id="amtPumpName2" name="amtPumpName2" class="inp_txt w01" style="width:220px;" value="<c:out value="${pumpInfo.amtPumpName2}" escapeXml="false" />" /> &nbsp; &nbsp;
						<input type="text" id="amtPumpCnt2" name="amtPumpCnt2" class="inp_txt w01" style="width:70px;" value="<c:out value="${pumpInfo.amtPumpCnt2}" escapeXml="false" />" /> &nbsp;EA
					</td> 
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="3">
						<input type="text" id="salesInfo" name="salesInfo" class="inp_txt w01" value="<c:out value="${pumpInfo.salesInfo}" escapeXml="false" />"/>
					</td> 
					<th>A/S</th>
					<td colspan="6">
						<input type="text" id="asInfo" name="asInfo" class="inp_txt w01" value="<c:out value="${pumpInfo.asInfo}" escapeXml="false" />"/>
					</td> 
				</tr>
				<tr>
					<th rowspan="2">펌프명 *</th>
					<th>모델이름(펌프)</th>
					<th>모델이름(모터)</th>
					<th rowspan="2">전원</th>
					<th rowspan="2">소비동력</th>
					<th rowspan="2">전류</th>
					<th rowspan="2">유량</th>
					<th rowspan="2">양정</th>
					<th rowspan="2">유체</th>
					<th rowspan="2">모터형식</th>
					<th rowspan ="2">			
						<span class="btn btn_type01"><a href="#" onclick="addRow();">추가</a></span>
					</th> 
				</tr>
				<tr>
					<th>모델번호(펌프)</th>
					<th>모델번호(모터)</th>
				</tr>
				<c:if test="${searchSubPumpList.size() > 0}" >
					<c:forEach var="item" items="${searchSubPumpList}" varStatus="i">
						<tr style="border-left: 1px solid #dedede;" class="subEquipment">
							<input type="hidden" name="subPump[${i.count-1}].fpId" value="${item.fpId}" />
					    	<td rowspan="2">
					    		<input type="text" class="inp_txt w01 pumpSubnameClass" id= "pumpSubname${i.count}" name= "subPump[${i.count-1}].pumpSubname" style="width:120px;" value="${item.pumpSubname}"/>					    		
					    		<select id="pumpSubTypeCd${i.count}" name="subPump[${i.count-1}].pumpSubTypeCd">
					    			<c:forEach var="result" items="${pumpTypeList}" varStatus="status">
					    				<option value="${result.codeId}" <c:if test="${result.codeId == item.pumpTypeCd}">selected="selected"</c:if> />${result.codeName}</option>
					    			</c:forEach>
					    		</select> 
					    	</td>
					    	<td>
					    		<input type="text" class="inp_txt w01 pumpModelNameClass" id= "pumpModelName${i.count}" name= "subPump[${i.count-1}].pumpModelName" style="width:150px;" value="${item.pumpModelName}"/>
					    	</td>
					    	<td>
					    		<input type="text" class="inp_txt w01 motorModelNameClass" id= "motorModelName${i.count}" name= "subPump[${i.count-1}].motorModelName" style="width:150px;" value="${item.motorModelName}"/>
					    	</td>
					    	<td rowspan="2">
					    		<input type="text" class="inp_txt w01 powerSupplyClass" id= "powerSupply${i.count}" name= "subPump[${i.count-1}].powerSupply" style="width:130px;"value="${item.powerSupply}" />
					    	</td>
					    	<td>
					    		<input type="text" class="inp_txt w01 spendPowerKwClass" id= "spendPowerKw${i.count}" name= "subPump[${i.count-1}].spendPowerKw" style="width:70px;" value="${item.spendPowerKw}"/>&nbsp;Kw
					    	</td>
					    	<td rowspan="2">
					    		<input type="text" class="inp_txt w01 elecCurrentClass" id= "elecCurrent${i.count}" name= "subPump[${i.count-1}].elecCurrent" style="width:65px;" value="${item.elecCurrent}"/>&nbsp;A
					    	</td>
					    	<td>
					    		<input type="text" class="inp_txt w01 flowRate1Class" id= "flowRate1${i.count}" name= "subPump[${i.count-1}].flowRate1" style="width:100px;" value="${item.flowRate1}"/>㎥/h
					    	</td>
					    	<td rowspan="2">
					    		<input type="text" class="inp_txt w01 liftClass" id= "lift${i.count}" name= "subPump[${i.count-1}].lift" style="width:70px;" value="${item.lift}"/>&nbsp;m
					    	</td>
					        <td>
					        	<input type="text" class="inp_txt w01 fluidMaterialClass" id="fluidMaterial${i.count}" name="subPump[${i.count-1}].fluidMaterial" style="width:100px;"value="${item.fluidMaterial}"/>
					        </td>
					        <td rowspan="2">
					        	<input type="text" class="inp_txt w01 motorTypeClass" id="motorType${i.count}" name="subPump[${i.count-1}].motorType" style="width:150px;" value="${item.motorType}"/> 
					        </td>
					        <td rowspan="2">
					        	<span class="btn btn_type01"><a href="#" onclick="deleteRow(this);">삭제</a></span>
					        </td>
	       				 </tr>
	      				 <tr>
					    	<td>
					    		S/N&nbsp;<input type="text" class="inp_txt w01 pumpModelNoClass" id= "pumpModelNo${i.count}" name= "subPump[${i.count-1}].pumpModelNo" style="width:120px;" value="${item.pumpModelNo}"/>
					    	</td>
					    	<td>
					    		S/N&nbsp;<input type="text" class="inp_txt w01 motorModelNoClass" id= "motorModelNo${i.count}" name= "subPump[${i.count-1}].motorModelNo" style="width:120px;" /value="${item.motorModelNo}">
					    	</td>
					    	<td>
					    		<input type="text" class="inp_txt w01 spendPowerHpClass" id= "spendPowerHp${i.count}" name= "subPump[${i.count-1}].spendPowerHp" style="width:70px;" value="${item.spendPowerHp}"/>&nbsp;HP
					    	</td>
					    	<td>
					    		<input type="text" class="inp_txt w01 flowRate2Class" id= "flowRate2${i.count}" name= "subPump[${i.count-1}].flowRate2" style="width:100px;" value="${item.flowRate2}"/>&nbsp;lpm
					    	</td>
					        <td>
					        	<input type="text" class="inp_txt w01 fluidPercentClass" id="fluidPercent${i.count}" name="subPump[${i.count-1}].fluidPercent" style="width:70px;"value="${item.fluidPercent}"/>&nbsp;%
					        </td>
			      		 </tr>
					</c:forEach>													
				</c:if>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="btn_wrap02">
	<c:choose>
		<c:when test ="${pumpInfo.fpmId eq null}">
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('reg');">등 록</a></span>
		</c:when>
		<c:otherwise>		
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump();">저 장</a></span>
				<span class="btn btn_type02 btn_size02"><a href="#" onclick="registPump('del');">삭 제</a></span>
		</c:otherwise>
	</c:choose>
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/equipment/pumpList.do">취소</a></span>
	</div>
</form:form>
</div>
