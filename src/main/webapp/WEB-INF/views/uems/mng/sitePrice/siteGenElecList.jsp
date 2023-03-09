<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
$(document).ready(function(){
	
});

function goSearch (){ //검색,리스트
	var f  = document.frm;
	f.currPage.value = $('#currPage').val();
	f.action = "<c:url value='/uems/mng/sitePrice/generalElecList.do'/>";
	f.submit();
}

function showTab(siteCd,siteDesc){ //탭 펼치기
	$('#keyFlag').val(null);
	$('#elecPower, #elecFactor0, #elecFactor1').val(''); //초기화
	$('#normalSiteDesc, #midNightSiteDesc, #gasSiteDesc').text(siteDesc);  //지점명
	$('#siteCd').val(siteCd);
	changeDp('normalNmList'); //지점클릭시 일반전기요금tab을 기본으로 
}

 /* 연동TAG유형 선택에 따른 TAG LIST */
function selectTagList(energyType,tagId) {
	var siteCd =$("#siteCd").val();
	$.ajax({
		url : "/uems/mng/sitePrice/selectTagListAjax.do",
		type: "POST",
		data: {energyType : energyType
				,siteCd : siteCd},
		dataType : "json",
		async :false
	}).done( function(data) {
		var list = data.tagList;
		var html = "";
			html+=  "<option value=''> 전체 </option>";
		for(var i=0; i<list.length; i++) {
				html += "<option value="+list[i].tagId+" >" + list[i].tagDesc + "</option>";
		}
		$("#"+tagId).empty();
		$("#"+tagId).append(html);
	});
}

/* 탭별 화면 */
function changeDp(flag){ //종별리스트 노출을 위해 flag는 종별 td태그 id와 똑같이 써줌
	$('#keyFlag').val(null);
	var	tagId="";// 탭별로 연동tag  td태그 Id를 알려주기 위한 변수
	if(flag == 'midNightNmList'){ //심야전기요금 탭 ON
		$('#energyType').val("02");
		$('#useYn').val("useFlag2");
		$('#pciFlag').val("pciId2");
		tagId ="midNightTagId";
		$('#midNightDp').show();
		$('#normalDp').hide();
		$('#gasDp').hide(); 
	}else if(flag == 'gasNmList'){ //가스요금 탭 ON
		$('#energyType').val("03");
		$('#useYn').val("useFlag3");
		$('#pciFlag').val("pciId3");
		tagId ="gasTagId";
		$('#normalDp').hide();
		$('#midNightDp').hide();
		$('#gasDp').show();
	}else if(flag == 'normalNmList'){ // 일반전기요금 탭 ON
		$('#energyType').val("01");
		$('#useYn').val("useFlag1");
		$('#pciFlag').val("pciId1");
		tagId ="normalTagId";
		$('#normalDp').show();
		$('#gasDp').hide();
		$('#midNightDp').hide();
	}

	var energyType = $('#energyType').val();
	selectTagList(energyType,tagId);
	
	 var pciFlag = $('#pciFlag').val(); // 탭별로 종별선택  name 다르게 주기 위해
	$.ajax({ // 탭별 종별선택리스트 조회 Ajax
		url : "/uems/mng/sitePrice/selectPriceNmListAjax.do",
		type: "POST",
		data: {energyType : energyType},
		dataType : "json",
		async :false
	}).done( function(data) {
		var list = data.priceNmList;
		var html = "";
			html += "<input type='radio' name='"+pciFlag+"' id='priceName"+i+"' value='"+list[0].pciId+"' checked='checked'> <label for='type'>"+list[0].priceName+"</label>"
		for(var i=1; i<list.length; i++) {
			html += "<input type='radio' name='"+pciFlag+"' id='priceName"+i+"' value='"+list[i].pciId+"'> <label for='type'>"+list[i].priceName+"</label>"
		}
		$("#"+flag).empty();
		$("#"+flag).append(html);
	}); 
	
	var siteCd = $('#siteCd').val(); // 지점code
	
	$.ajax({ //상세정보 조회
		url : "/uems/mng/sitePrice/selectSitePriceInfoAjax.do",
		type: "POST",
		data: {energyType : energyType
			   ,siteCd :siteCd},
		dataType : "json",
	}).done( function(data) {
		var priceInfo = data.priceInfo;
		if(priceInfo != null && priceInfo != ''){ // 상세정보가 있을 경우
			var useYn = $('#useYn').val();
			$('#keyFlag').val('1'); //keyFlag ==1 이면 수정
			$('input:radio[name='+useYn+']:radio[value=' +priceInfo.useFlag + ']').prop("checked", true);
			$('input:radio[name='+pciFlag+']:radio[value='+priceInfo.pciId +']').prop("checked", true);
			$("#"+tagId).val(priceInfo.tagId);  // 연동tag selecbox  값 지정
			
			//history에 넣을 값 저장
			$('#useFlagHistory').val(priceInfo.useFlag);
			$('#tagIdHistory').val(priceInfo.tagId);
			$('#pciIdHistory').val(priceInfo.pciId);
			if(priceInfo.elecPower == null){ //일반전기요금일경우
				$('#elecFactor0').val(priceInfo.elecFactor0);
				$('#elecFactor1').val(priceInfo.elecFactor1);
				
				//history에 넣을 값 저장
				$('#elecFactor0History').val(priceInfo.elecFactor0);
				$('#elecFactor1History').val(priceInfo.elecFactor1);
			} else if(priceInfo.elecPower != null && priceInfo.elecPower != ''){ //일반전기요금일경우
				$('#elecPower').val(priceInfo.elecPower);
				
				//history에 넣을 값 저장
				$('#elecPowerHistory').val(priceInfo.elecPower);
			}
		}
	});
}
//유효성검사
function valChk(tag){
	var eType = $('#energyType').val();
	var tagId = $("#"+tag).find("option:selected").val();

	if(tag != 'gasTagId' && (tagId == null || tagId == '')){
		alert("연동TAG를 선택해주세요.");
		return false;
	}
	
	if(eType == "01"){ // 일반전기요금 탭일경우 
		var elecFactor0 = $('#elecFactor0').val();
		var elecFactor1 = $('#elecFactor1').val();
		var reg =  /^[+]?\d+\.?\d*$/; // 숫자 유효성검사
		if(elecFactor0 == null || elecFactor0 == ''){
			alert("지상역률을 입력해주세요.");
			return false;
		}
		if(elecFactor1 == null || elecFactor1 == ''){
			alert("진상역률을 입력해주세요.");
			return false;
		}
		var chk = true;
		$(".preClass1").each(function(){	   // class돌면서 숫자 유효성 검사
	    	if(!reg.test($(this).val())){ 
	    			alert('숫자를 입력해주세요.');
	    			chk = false;
	    			return false;
	    	}
	    });
    	if(chk){
    		return true;
    	}else{
    		return false;
    	}
	}
	else if(eType == "02"){ // 심야전기요금 탭일 경우
		var elecPower = $('#elecPower').val();
		var reg =  /^[+]?\d+\.?\d*$/; // 숫자 유효성검사
		if(elecPower == null || elecPower == ''){
			alert("계약전력을 입력해주세요.");
			return false;
		}
		var chk = true;
		$(".preClass2").each(function(){	   // class돌면서 숫자 유효성 검사
	    	if(!reg.test($(this).val())){ 
	    			alert('숫자를 입력해주세요.');
	    			chk = false;
	    			return false;
	    	}
	    });
    	if(chk){
    		return true;
    	}else{
    		return false;
    	}
	}
	
	return true;
}

/* 등록,수정 */
function save(tag){//탭별 연동TAG name 받아옴
	var useYn = $('#useYn').val(); //탭별 적용여부 라디오버튼 name 가져오기
	var useFlag = $("input[type=radio][name="+useYn+"]:checked").val();
	$('#useFlag').val(useFlag);
	
	var tagId = $("#"+tag).find("option:selected").val(); 
	$('#tagId').val(tagId);
			
	var pciFlag = $('#pciFlag').val();//탭별 종별선택 라디오버튼 name 가져오기
	var pciId = $("input[type=radio][name="+pciFlag+"]:checked").val();
	$('#pciId').val(pciId);
	
	if(valChk(tag)){ // 유효성 검사 true일때 
		$("#"+tag).find("option:selected").val();
		$.ajax({ //등록,수정
			url : "/uems/mng/sitePrice/sitePriceRegistExe.do",
			type: "POST",
			data: $("#insertForm").serialize(),
			dataType : "json"
		}).done( function(data) {
			goSearch();
			$('#elecPower, #elecFactor0, #elecFactor1').val('');
		});
	}
}

</script>

<div class="contents_wrap">
	<form:form commandName="sitePrice" name="frm" id="frm" method="post">
		<input type ="hidden" id ="currPage" name = "currPage" value ="<c:out value="${sitePrice.currPage}" escapeXml="false" />" /> 
		<input type ="hidden" id ="temp" />
		<input type ="hidden" id ="temp2"/>
		<input type ="hidden" id ="useYn"/>
		<input type ="hidden" id ="pciFlag"/>
		<!-- s: cont_wrap -->
		<div class="cont_wrap01">
			<h2 class="main_title">지점단가 관리</h2>
			<ul class="list">
				<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별로 가스, 전기요금을 적용 관리합니다.</div></li>
			</ul>
		</div>
		<!-- e: cont_wrap -->
		
		<div class="search_form_wrap">
			<table cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="10%">
					<col width="*%">
				</colgroup>
				
				<tbody>
					<tr class="rtl">
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
								<form:select path="searchCondition2">
									<form:option value="" label="전체"/>
									<form:option value="1" label="일반전기"/>
									<form:option value="2" label="심야전기"/>
									<form:option value="3" label="가스"/>
								</form:select>
							</span>
							<span class="btn btn_type02 btn_size02"><a href="javascript:goSearch()">검 색</a></span>
						</td>
					</tr>
				
			</tbody></table>
		</div>	
		
		<!-- s: table wrap-->
		<div class="table_wrap">
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="10%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
					<col width="16%" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>지점</th>
						<th>일반전기</th>
						<th>심야전기</th>
						<th>가스</th>
						<th>번경일자</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${fn:length(priceDataList) eq 0}">
						<tr>
							<td colspan="6"> 등록된 게시물이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="result" items="${priceDataList}" >
						<tr>
							<td>${result.sPagelistno}</td>
							<td><a href="#" onclick ="showTab('${result.siteCd}','${result.siteDesc}');" class="link_imp01">${result.siteDesc}</a></td>
							<td>
								<c:choose>
									<c:when test="${result.normal eq null}"> - </c:when>
									<c:otherwise> ${result.normal}</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${result.midNight eq null}"> - </c:when>
									<c:otherwise> ${result.midNight}</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${result.gas eq null}"> - </c:when>
									<c:otherwise> ${result.gas}</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${result.updateDate eq null}"> - </c:when>
									<c:otherwise> ${result.updateDate}</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- e: table wrap-->
		<div class="paging_wrap">
			<c:out value="${sitePrice.pageutil.pagingBody}" escapeXml="false" />
		</div>
		</form:form>
		<div>
			<c:out value="${sitePrice.pageutil.pagingHtml}" escapeXml="false" />
		</div> 
		<!-- s: 페이징 -->
		
		<!-- e: 페이징 -->
		 <form:form commandName="sitePrice" name="insertForm" id="insertForm" method="post">
		 	<form:hidden path="siteCd"/>
		 	<form:hidden path="useFlag"/>
			<form:hidden path="energyType"/>
			<form:hidden path="keyFlag"/>
			<form:hidden path="tagId"/>
			<form:hidden path="pciId"/>
			<form:hidden path="useFlagHistory"/>
			<form:hidden path="pciIdHistory"/>
			<form:hidden path="tagIdHistory"/>
			<form:hidden path="elecPowerHistory"/>
			<form:hidden path="elecFactor0History"/>
			<form:hidden path="elecFactor1History"/>
			
			<div id ="normalDp" style="display: none;">
				<br /><br />
				<div class="tab_wrap">
					<ul>
						<li class="on"><a href="#">일반전기요금</a></li>
						<li><a href="#" onclick= "changeDp('midNightNmList');">심야전기요금</a></li>
						<li><a href="#" onclick= "changeDp('gasNmList');">가스요금</a></li>
					</ul>
				 </div>
				
				<!-- s: search -->
				<div class="search_form_wrap">
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="10%" />
							<col width="*%" />
						</colgroup>
						
						<tbody>
							<tr>
								<th><div class="tit">지점</div></th>
								<td id="normalSiteDesc">
									
								</td>
							</tr>
							<tr>
								<th><div class="tit">적용여부</div></th>
								<td>
									<input type="radio" class ="useFlagClass" name="useFlag1" id="normalUseFlagY" value="Y" checked="checked"> <label for="">적용</label>
									<input type="radio" class ="useFlagClass" name="useFlag1" id="normalUseFlagN" value="N" style="margin-left:30px;"> <label for="">미적용</label>
								</td>
							</tr>
							<tr>
								<th><div class="tit">연동 TAG</div></th>
								<td>
									<span class="sel_wrap w01" style="width:200px;">
										<select id="normalTagId" name="tagId2">
											
										</select> 
									</span>
								</td>
							</tr>
							<tr>
								<th><div class="tit">종별선택</div></th>
								 <td id ="normalNmList">
									
								</td> 
							</tr>
						<tbody>
					</table>
				</div>
				<!-- e: search -->
				
				<!-- s: table wrap-->
				<div class="table_wrap">
					<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
						<colgroup>
							<col width="*" />
							<col width="30%" />
							<col width="20%" />
							<col width="30%" />
						</colgroup>
						<thead>
							<tr>
								<th colspan="4">기본요금 정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>지상역률(%)</th>
								<td><input type="text" style="width:95%" class ="preClass1" id="elecFactor0" name="elecFactor0" class="inp_txt w01" value=""></td>
								<th>진상역률(%)</th>
								<td><input type="text" style="width:95%" class ="preClass1" id="elecFactor1" name="elecFactor1" class="inp_txt w01" value=""></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- e: table wrap-->
				
				<div class="rtl">
					<span class="btn btn_type02 btn_size02"><a href="javascript:save('normalTagId')">저장</a></span>
				</div>
				<%-- </form:form> --%>
			</div>
			
			<div id ="midNightDp" style="display: none;">
				<br /><br />
				<div class="tab_wrap">
					<ul>
						<li><a href="#" onclick= "changeDp('normalNmList');">일반전기요금</a></li>
						<li class="on"><a href="#">심야전기요금</a></li>
						<li><a href="#" onclick= "changeDp('gasNmList');">가스요금</a></li>
					</ul>
				 </div>
				
				<!-- s: search -->
				<div class="search_form_wrap">
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="10%" />
							<col width="*%" />
						</colgroup>
						
						<tbody>
							<tr>
								<th><div class="tit">지점</div></th>
								<td id="midNightSiteDesc">
									
								</td>
							</tr>
							<tr>
								<th><div class="tit">적용여부</div></th>
								<td>
									<input type="radio" class ="useFlagClass" name="useFlag2" id="midNightUseFlagY" value="Y" checked="checked"> <label for="">적용</label>
									<input type="radio" class ="useFlagClass" name="useFlag2" id="midNightUseFlagN" value="N" style="margin-left:30px;"> <label for="">미적용</label>
								</td>
							</tr>
							<tr>
								<th><div class="tit">연동 TAG</div></th>
								<td>
								<span class="sel_wrap w01" style="width:200px;">
									<select id="midNightTagId" name="tagId2">
									</select>
								</span>
								</td>
							</tr>
							<tr>
								<th><div class="tit">종별선택</div></th>
								  <td id ="midNightNmList">
									
								</td> 
							</tr>
						<tbody>
					</table>
				</div>
				<!-- e: search -->
				
				<!-- s: table wrap-->
				<div class="table_wrap">
					<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
						<colgroup>
							<col width="*" />
							<col width="30%" />
							<col width="20%" />
							<col width="30%" />
						</colgroup>
						<thead>
							<tr>
								<th colspan="4">기본요금 정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>계약전력(Kw)</th>
								<td><input type="text" style="width:95%" class ="preClass2" id="elecPower" name="elecPower" class="inp_txt w01" value=""></td>
								<th></th>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="rtl">
					<span class="btn btn_type02 btn_size02"><a href="javascript:save('midNightTagId')">저장</a></span>
				</div>
				<%-- </form:form> --%>
			</div>
			
			<div id ="gasDp" style="display: none;">
				<%-- <form:form commandName="sitePrice" name="gasForm" id="gasForm" method="post"> --%>
				<br /><br />
				<div class="tab_wrap">
					<ul>
						<li><a href="#" onclick= "changeDp('normalNmList');">일반전기요금</a></li>
						<li><a href="#" onclick= "changeDp('midNightNmList');">심야전기요금</a></li>
						<li class="on"><a href="#">가스요금</a></li>
					</ul>
				 </div>
				
				<!-- s: search -->
				<div class="search_form_wrap">
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="10%" />
							<col width="*%" />
						</colgroup>
						
						<tbody>
							<tr>
								<th><div class="tit">지점</div></th>
								<td id="gasSiteDesc">
									
								</td>
							</tr>
							<tr>
								<th><div class="tit">적용여부</div></th>
								<td>
									<input type="radio" class ="useFlagClass" name="useFlag3" id="gasUseFlagY" value="Y" checked="checked"> <label for="">적용</label>
									<input type="radio" class ="useFlagClass" name="useFlag3" id="gasUseFlagN" value="N" style="margin-left:30px;"> <label for="">미적용</label>
								</td>
							</tr>
							<tr>
								<th><div class="tit">연동 TAG</div></th>
								<td>
									<span class="sel_wrap w01" style="width:200px;">
										<select id="gasTagId" name="tagId3">
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th><div class="tit">종별선택</div></th>
								<td id ="gasNmList">
								</td>
							</tr>
						<tbody>
					</table>
				</div>
				<!-- e: search -->
				
				<div class="rtl">
					<span class="btn btn_type02 btn_size02"><a href="javascript:save('gasTagId')">저장</a></span>
				</div>
			</div>
		</form:form>
</div>
			
