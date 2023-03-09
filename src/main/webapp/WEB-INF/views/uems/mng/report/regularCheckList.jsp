<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">

	$(document).ready(function(){
		
		selectSiteList($("#searchCondition").val());
		$("#siteGroup").val('${maintenance.sgId}');
		selectSiteListForView('${maintenance.sgId}');
		selectFacilityListForView('${maintenance.siteId}');
		$("#siteList").val('${maintenance.siteId}');
		$("#facilityList").val('${maintenance.facilityId2}');
		
		$("#searchCondition").change(function() {
			selectSiteList($(this).val());
		});
		$("#siteGroup").change(function(){
			selectSiteListForView($(this).val());
		})
		$("#siteList").change(function(){
			selectFacilityListForView($(this).val());
		})
		
		var date = new Date();
		var currentYear = date.getFullYear();
		var currentMonth = date.getMonth()+1;
		var monthVal = addZeros(currentMonth, 2);
		makeChkMonth(currentYear, currentMonth, monthVal);
		
		$("select[name=checkYear]").change(function(){
			var monthHtml2 = '';
			if($(this).val() == currentYear && currentMonth > 4){
				for(var i= 5; i<currentMonth+1; i++){
					monthHtml2 += '<option value='+addZeros(i, 2)+'>'+i+' 월</option>'; 
				}
			}else{
				for(var i= 5; i<11; i++){
					monthHtml2 += '<option value='+addZeros(i, 2)+'>'+i+' 월</option>'; 
				}
			}
			$("#checkMonth").empty();
			$("#checkMonth").append(monthHtml2);
		});
		
	});

	// 보고서생성
	function createRegularCheckReport() {
		if(confirm($("#searchCondition2 option:selected").text() +" "+ $("#checkYear option:selected").text() +" " 
				+ $("#checkMonth option:selected").text() + " 정기점검 보고서를 생성하시겠습니까?")) {
			$("#modelForm input[name=siteId]").val($("#searchCondition2").val());
			$("#modelForm input[name=chkMonth]").val($("#checkYear").val() + $("#checkMonth").val());
			$("#modelForm").attr("action", "/uems/mng/check/createRegularCheckReport.do");
			$("#modelForm").submit();	
		}
	}
	
	// 점검날짜 selectbox
	function makeChkMonth(currentYear, currentMonth, monthVal) {

		var yearHtml = "";
		var monthHtml = "";
		for(var i= 2015; i<currentYear+1; i++){
			yearHtml += '<option value='+i+'>'+i+' 년</option>'; 
		}
		$("#checkYear").append(yearHtml);
		$("#checkYear").val(currentYear);
		if(monthVal > 4){
			for(var i= 5; i<currentMonth+1; i++){
				monthHtml += '<option value='+addZeros(i, 2)+'>'+i+' 월</option>'; 
			}
		}else{
			for(var i= 5; i<11; i++){
				monthHtml += '<option value='+addZeros(i, 2)+'>'+i+' 월</option>'; 
			}
		}
		
		$("#checkMonth").append(monthHtml);
		$("#checkMonth").val(monthVal);
	}
	
	// 팝업용 지점 selectbox
	function selectSiteList(sgId) {
		
		if(isEmpty(sgId)) {
			var html = "";
			$("#searchCondition2").empty();
			$("#searchCondition2").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/user/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId},
				dataType : "json",
			}).done( function(data) {
				var list = data.siteList;
				var html = "";
				for(var i=0; i<list.length; i++) {
					html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
				}
				$("#searchCondition2").empty();
				$("#searchCondition2").append(html);
			});
		}
	}
	
	// 지점 별 정검항목 리스트 조회
	function selectFacilityList() {
		if(isEmpty($("#searchCondition2").val())) {
			alert("지점을 선택하세요.");
			return;
		}
		
		$.ajax({
			url : "/uems/mng/check/selectFacilityStatusListAjax.do",
			type: "POST",
			data: {siteId : $("#searchCondition2").val()
					, chkMonth : $("#checkYear").val() + $("#checkMonth").val()},
			dataType : "json",
		}).done( function(data) {
			var list = data.resultList;
			var html = "";
			for(var i=0; i<list.length; i++) {
				html += "<tr>";
				html += "	<td>" + list[i].facilityName + "</td>";
				if(list[i].finisiYn == 'Y') {
					html += "	<td>실시</td>";	
				} else {
					html += "	<td>미실시</td>";
				}
				html += "</tr>";
			}
			
			$("#facilityListTbody").empty();
			$("#facilityListTbody").append(html);

		});
		
	}
	
	// 화면용 지점 selectbox
	function selectSiteListForView(sgId) {
		
		if(isEmpty(sgId)) {
			var html = "<option value=''>전체</option>";
			$("#siteList").empty();
			$("#siteList").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/user/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId},
				dataType : "json",
			}).done( function(data) {
				var list = data.siteList;
				var html = "<option value=''>전체</option>";
				for(var i=0; i<list.length; i++) {
					html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
				}
				$("#siteList").empty();
				$("#siteList").append(html);
			});
		}
	}
	
	//화면용 지점별 장비 리스트 조회
	function selectFacilityListForView(siteId){
		$.ajax({
			url : "/uems/mng/check/selectFacilityListAjax.do",
			type: "POST",
			data: {siteId : siteId},
			dataType : "json"
		}).done( function(data) {
			var list = data.facilityList;
			var html = "";
			var length = list.length;
			
			if(length > 0){
				html += "<option value=''>장비선택</option>";
				for(var i=0; i<length; i++) {
					if(list[i].siteId == $("select[name=facilityList]").val()) {
						html += "<option value="+list[i].facilityId+"|"+list[i].siteId+" selected>" + list[i].facilityName + "</option>";
					} else {
						html += "<option value="+list[i].facilityId+"|"+list[i].siteId+" >" + list[i].facilityName + "</option>";
					}
					
				}
			}else{
				html += "<option value=''>장비없음</option>";
			}
			
			$("select[name=facilityList]").empty();
			$("select[name=facilityList]").append(html);

		});
	}
	/* 정기점검 목록관리 검색 */
	function goSearch(){
		$("#viewFrm #sgId").val($("#siteGroup option:selected").val());
		$("#viewFrm #siteId").val($("#siteList option:selected").val());
		$("#viewFrm #facilityId").val($("#facilityList option:selected").val());
		
		$("#viewFrm").attr("action","/uems/mng/check/regularCheckList.do");
		$("#viewFrm").submit();
	}
	
	/* 장비정보상세화면 */
	function goDetail(msId,chkMonth,facilityId,facilityKind,facilityName,chkMonthVal,siteName,sgName,siteId){
		$("#msId").val(msId);
		$("#chkMonth").val(chkMonth);
		$("#facilityId").val(facilityId);
		$("#facilityKind").val(facilityKind);
		$("#facilityName").val(facilityName);
		$("#chkMonthVal").val(chkMonthVal);
		$("#siteName").val(siteName);
		$("#sgName").val(sgName);
		$("#siteId").val(siteId);
		
		$("#viewFrm").attr("action", "/uems/mng/check/regularCheckDetail.do");
		$("#viewFrm").submit();
	}
	
</script>

<div class="contents_wrap">

	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">보고서관리 - 정기점검 목록관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;정기점검 내용을 확인합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->

	<!-- s: search_wrap -->
	
	<div class="search_form_wrap">
	<form id="viewFrm" method="POST">
		<input type="hidden" id="sgId" name="sgId" value="${maintenance.sgId}"/>
		<input type="hidden" id="siteId" name="siteId"/>
		<input type="hidden" id="siteName" name="siteName"/>
		<input type="hidden" id="sgName" name="sgName"/>
		<input type="hidden" id="facilityId2" name="facilityId2" />
		<input type="hidden" id="facilityId" name="facilityId" />
		<input type="hidden" id="facilityKind" name="facilityKind" />
		<input type="hidden" id="facilityName" name="facilityName" />
		<input type="hidden" id="chkMonth" name="chkMonth" />
		<input type="hidden" id="msId" name="msId" />
		<input type="hidden" id="chkMonthVal" name="chkMonthVal" />
	</form>
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="*%" />
			</colgroup>
			
			<tbody>
				<tr>
					<td>
						<span class="sel_wrap w01" style="width:150px;">
							<select id="siteGroup" name="siteGroup">
								<option value="">전체</option>
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<option value="${result.sgId}" label="${result.sgName}"><c:out value="${result.sgName}"/></option>
								</c:forEach>
							</select>
						</span>
						<span class="sel_wrap w01" style="width:150px;">
							<select id="siteList" name="siteList">
								<option value="">전체</option>
							</select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="facilityList" name="facilityList">
								<option value="">전체</option>
							</select>
						</span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:goSearch();">검 색</a></span>
					</td>
				</tr>
			<tbody>
		</table>
	</div>
	<!-- e: search_wrap -->
	
	<!-- s: list_wrap -->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="8%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="*%"/>
				<col width="15%"/>
				<col width="8%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>그룹</th>
					<th>지점명</th>
					<th>점검(장비)종류</th>
					<th>점검년월</th>
					<th>점검자</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(regularChkList) eq 0}">
					<tr>
						<td colspan="7"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${regularChkList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.sgName}" escapeXml="false"/></td>
						<td><c:out value="${result.siteName}" escapeXml="false"/></td>
						<td><a href="javascript:goDetail('${result.msId}','${result.chkMonth}','${result.facilityId}','${result.facilityKind}','${result.facilityName}','${result.chkMonthVal}','${result.siteName}','${result.sgName}','${result.siteId}');" class="link_imp01" ><c:out value="${result.facilityName}" escapeXml="false"/></a></td>
						<td><c:out value="${result.chkMonthVal}" escapeXml="false"/></td>
						<td><c:out value="${result.mngName}" escapeXml="false"/></td>
						<td><c:out value="${result.regDate}" escapeXml="false"/></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<!-- e: list_wrap -->
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${maintenance.pageutil.pagingBody}" escapeXml="false" />
	</div>
	<!-- e: 페이징 -->
	<c:out value="${maintenance.pageutil.pagingHtml}" escapeXml="false" />	
	<form id="form" name="form" method="post">
		<div class="thead_wrap cboth">
			<div class="rtl">
				<span class="btn btn_type02 btn_size02"><a href="#layerPop_type1" name="modal">보고서 생성</a></span>
			</div>
		</div>
	</form>
	
	<form id="modelForm" name="modelForm" method="post">
		<input type="hidden" name="siteId" />
		<input type="hidden" name="chkMonth" />
		<div class="model_container" id="layerPop_type1" style="width:600px;">
			<div class="model_inner">
				<div class="model_header"><h2>정기점검 보고서 생성</h2></div> 
				<div class="model_body">
					<div class="model_content">
						<div class="model_content">
							<div class="search_form_wrap">
								<!-- s: table wrap-->
								<table cellpadding="0" cellspacing="0" border="0">
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr class="first">
											<th><div class="tit">지점명</div></th>
											<td>
												<span class="sel_wrap w01" style="width:200px;">
													<select id="searchCondition" name="searchCondition">
														<c:forEach var="result" items="${groupAllList}" varStatus="status">
															<option value="${result.sgId}" label="${result.sgName}"><c:out value="${result.sgName}"/></option>
														</c:forEach>
													</select>
												</span>
												<span class="sel_wrap w01" style="width:200px;">
													<select id="searchCondition2" name="searchCondition2">
													</select>
												</span>
											</td>
										</tr>
										<tr>
											<th><div class="tit">점검날짜</div></th>
											<td>
												<span class="sel_wrap w01" style="width:180px;">
													<select id="checkYear" name="checkYear">
													</select>
												</span>
												<span class="sel_wrap w01" style="width:160px;">
													<select id="checkMonth" name="checkMonth">
													</select>
												</span>
												<span class="btn btn_type02 btn_size02"><a href="javascript:selectFacilityList();">검 색</a></span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="table_wrap">
								<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
									<colgroup>
										<col width="70%"/>
										<col width="*"/>
									</colgroup>
									<thead>
										<tr>
											<th>항목</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody id="facilityListTbody"></tbody>
								</table>
							</div>
							
							<!-- s: btn wrap 가운데 정렬-->
							<div class="model_btn_wrap">
								<span class="btn btn_type02 btn_size02"><a href="#" onclick="createRegularCheckReport();">보고서생성</a></span>
								<span class="btn btn_type03 btn_size02"><a href="#" class="closePop">취소</a></span>
							</div>
						</div>
		
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
	
