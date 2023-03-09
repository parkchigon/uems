<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javascript">
var updateDrIdList = [];
var deleteDrIdList = [];
	$(document).ready(function() {
		selectSiteList($("#searchCondition").val());
		
		$("select[id=sgId]").change(function(){
			selectSiteGroupList($(this).val());
		});
		
		$("#searchCondition").change(function() {
			selectSiteList($(this).val());
		});
		
		var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = addZeros(currentDate.getMonth()+1,2);
		var day = addZeros(currentDate.getDate(),2);
		
		$("#iceSystemSdate").val(year+"-"+month+"-"+day);
		
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
		
	function search(){
		var siteId = $("select[name=siteId]").val();
		var date = $("#iceSystemSdate").val();
		if(siteChk()){
			//입력 칸 초기화
			$(".devInput").each(function(){
				$(this).val("");
				$("select[name=recordType] option:eq(0)").attr("selected", "selected");
			})
			//업데이트 항목 초기화
			updateDrIdList = [];
			//삭제 항목 초기화
			deleteDrIdList = [];
			
			date = date.split("-")[0]+date.split("-")[1]+date.split("-")[2];
			$.ajax({
				url : "/uems/mng/report/dailyRecordListAjax.do",
				type: "POST",
				data: {siteId : siteId, date : date},
				dataType : "json"
			}).done( function(data) {
				 var html = "";
				 var result = data.result;
				 
				 if(result != null){
					 $.each(result, function(i, val){
						 html += "<tr id='drId"+val.drId+"'>";
						 html += "	<td>"+val.time+"</td>";
						 html += "	<td>"+val.recordTypeNm+"</td>";
						 html += "	<td>"+val.recordName+"</td>";
						 html += "	<td><div style='cursor: pointer;'>"+val.reason+"</div><input type='text' id='reason"+val.drId+"' class='devUpdate' style='width: 100%; display: none;' value='"+val.reason+"' maxlength=50></td>";
						 html += "	<td><div style='cursor: pointer;'>"+val.result+"</div><input type='text' id='result"+val.drId+"' class='devUpdate' style='width: 100%; display: none;' value='"+val.result+"' maxlength=50></td>";
						 html += "	<td><div style='cursor: pointer;'>"+val.etc+"</div><input type='text' id='etc"+val.drId+"' class='devUpdate' style='width: 100%; display: none;' value='"+val.etc+"' maxlength=50></td>";
						 html += "	<td><span class='btn btn_type03 btn_size01'><a href=\"javascript:deleteSituation('"+val.drId+"');\">X</a></span></td>";
						 html += "</tr>";
					 });
				 }
				 
				 $("#dailyTableBody").empty();
				 $("#dailyTableBody").append(html);
				 
				 tableModifyHandller();
				 
			});
		}
	}
	
	function tableModifyHandller() {
		$("#dailyTableBody tr").on("click", function(e) {
			
			var td;
			if($(e.target)[0].tagName == "DIV") {
				td = $(e.target).parent();
			} else if($(e.target)[0].tagName == "TD") {
				td = $(e.target);
			}
			
			if(td != null) {
				
				//console.log(td.children().find("div"));
				td.find("div").hide();
				td.find("input").show();
				
				var drId = td.parent().attr("id");
				if($.inArray(drId, updateDrIdList) == -1){
					updateDrIdList.push(drId);
				}
				//console.log(td.parent());
			}
			//console.log("$(e.target)[0].attr")
		});
	}
	
	//지점 그룹 선택 -> 각 지점 목록 조회
	function selectSiteGroupList(sgId) {
		if(isEmpty(sgId)) {
			var html = "";
			html += "<option value=''>지점선택</option>";
			
			$("select[name=siteId]").empty();
			$("select[name=siteId]").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/user/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId},
				dataType : "json"
			}).done( function(data) {
				var list = data.siteList;
				var html = "";
				html += "<option value=''>지점선택</option>";
				for(var i=0; i<list.length; i++) {
					if(list[i].siteId == $("select[name=siteId]").val()) {
						html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
					} else {
						html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
					}
					
				}
				
				$("select[name=siteId]").empty();
				$("select[name=siteId]").append(html);

			});
		}
	}
	
	function deleteSituation(drId) {
		if(confirm("해당 상황일지를 삭제하시겠습니까?")) {
			$("#drId"+drId).hide();
			if($.inArray(drId, deleteDrIdList) == -1){
				deleteDrIdList.push(drId);
			}
		}
	}
	
	function refresh() {
		if(confirm("새로 고침 하시겠습니까?\n저장하지 않는 내용은 소실됩니다!")) {
			//선택한 검색조건이 있다면 해당 조건으로 새로고침, 없다면 화면 reload
			if($("select[name=sgId]").val() != "" && $("select[name=siteId]").val() != ""){
				search();
			}else{
				window.location.reload();
			}
		}
	}
	
	//지점 선택 및 날짜 선택 체크
	function siteChk(){
		var result = true;
		var siteId = $("select[name=siteId]").val();
		var date = $("#iceSystemSdate").val();
		if(siteId == '' || siteId == null){
			alert("지점을 선택해주세요.");
			result = false;
		}else if(date == '' || date == null){
			alert("날짜를 선택해주세요.");
			result = false;
		}
		return result;
	}
	
	function validation(){
		var input = false;
		var result = false;
		$(".devInput").each(function(){
			if($(this).val() != null && $(this).val() != ""){
				input = true;
			}
		});
		if(input){
			if($("#time").val() == "" || $("#recordName").val() == ""){
				alert("필수값을 입력해주세요.");
				return;
			}else{
				result = true;
			}
		}else{
			result = true;
		}
		return result;
	}
	
	function situationRegist() {
		if(siteChk() && validation()){
				if(confirm("현재 내용을 저장하시겠습니까?")) {
					var siteId = $("select[name=siteId]").val();
					var dateArray = $("#iceSystemSdate").val().split("-");
					var date = dateArray[0]+dateArray[1]+dateArray[2];
					
					var insertList = [];
					//시간, 상황발생내용 모두 입력되어 있으면 insert(필수값)
					if($("#time").val() != "" && $("#recordName").val() != ""){
						$(".devInsert").each(function(i){
							if($(this).val() == ""){
								$(this).val("");
							}
							insertList.push($(this).val());
						});
						insertList.push(siteId);
						insertList.push(date);
					}
					
					var updateList = [];
					//편집 클릭한 row가 있을 경우 업데이트할 list에 담음
					if(updateDrIdList != null){
						for(var i = 0 ; i<updateDrIdList.length ; i++){
							updateList.push(updateDrIdList[i].split("drId")[1]);
							$("#"+updateDrIdList[i]).find(".devUpdate").each(function(){
								updateList.push($(this).val());
							});
						}
					}
					
					jQuery.ajaxSettings.traditional = true;
					
					$.ajax({
						url: "/uems/mng/report/dailyRecordRegistAjax.do",
						type: "POST",
						data: {siteId:siteId, date:date, insertDailyRecordList:insertList, updateDailyRecordList:updateList, deleteDailyRecordList:deleteDrIdList},
						dataType: "json",
						async:false
					 }).done (function(data) {
						 if(data.result){
							 alert("저장하였습니다.");
							 search();
						 }else{
							 alert("실패하였습니다.");
						 }
					 });
				}
		}
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
	
	// 보고서생성
	function createSituationReport() {
		if(confirm($("#searchCondition2 option:selected").text() +" "+ $("#checkYear option:selected").text() +" " 
				+ $("#checkMonth option:selected").text() + " 상황일지 보고서를 생성하시겠습니까?")) {
			$("#modelForm input[name=siteId]").val($("#searchCondition2").val());
			$("#modelForm input[name=chkMonth]").val($("#checkYear").val() + $("#checkMonth").val());
			$("#modelForm").attr("action", "/uems/mng/report/createSituationReport.do");
			$("#modelForm").submit();	
		}
	}
</script>

<div class="contents_wrap">
<form:form commandName="dailyRecord" name="frm" id="frm" method="post">
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">보고서관리 - 상황일지 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;주요 이벤트에 대해 상황일지를 등록하고 관리합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	
	<div class="cont_wrap01">
		<span class="sel_wrap w01" style="width:195px;">
			<select id="sgId">
				<option value="">지점그룹</option>
				<c:forEach var="result" items="${groupAllList}" varStatus="status">
					<option  value="${result.sgId}">${result.sgName}</option>
				</c:forEach>
			</select>
		</span>
		<span class="sel_wrap w01" style="width:195px;">
			<form:select path="siteId">
				<form:option value="">지점선택</form:option>
			</form:select>
		</span>
		<span class="entry_calendar center">
			<fmt:parseDate value="${siteView.iceSystemSdate}" var="iceSystemSdate" pattern="yyyy년 MM월 dd일"/>
			<input type="text" class="datepicker" id="iceSystemSdate" name="iceSystemSdate" value="<fmt:formatDate value="${iceSystemSdate}" pattern="yyyy년 MM월 dd일"/>" style="width:77px;" ></input>
			<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
		</span>&nbsp;
		<span class="btn btn_type02 btn_size02"><a href="javascript:search();">검색</a></span>
		<div class="rtl">
			<span class="btn btn_type02 btn_size02"><a href="javascript:refresh();">새로고침</a></span>
			<span class="btn btn_type02 btn_size02"><a href="javascript:situationRegist()">저 장</a></span>
		</div>
	</div>

	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="10%"/>
				<col width="8%"/>
				<col width="15%"/>
				<col width="*"/>
				<col width="13%"/>
				<col width="8%"/>
				<col width="5%"/>
			</colgroup>
			<thead>
				<tr>
					<th>시간</th>
					<th>상황기준</th>
					<th>상황발생내용</th>
					<th>원인</th>
					<th>조치결과</th>
					<th>비고</th>
					<th>삭제</th>
				</tr>
				<tr>
					<td><input type="time" class="devInput devInsert" id="time" pattern="^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$" style="width: 100%"></td>
					<td>
						<span class="sel_wrap w01">
							<form:select path="recordType" class="devInsert">
								<c:forEach var="result" items="${recordTypeList}" varStatus="status">
									<form:option  value="${result.codeUseName}" label="${result.codeName}"/>
								</c:forEach>
							</form:select>
						</span>
					</td>
					<td><input type="text" class="devInput devInsert" id="recordName" style="width: 100%" maxlength=50></td>
					<td><input type="text" class="devInput devInsert" id="reason" style="width: 100%" maxlength=50></td>
					<td><input type="text" class="devInput devInsert" id="result" style="width: 100%" maxlength=50></td>
					<td><input type="text" class="devInput devInsert" id="etc" style="width: 100%" maxlength=50></td>
					<td>-</td>
				</tr>
			</thead>
			<tbody id="dailyTableBody">
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
</form:form>
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
				<div class="model_header"><h2>상황일지 보고서 생성</h2></div> 
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
											<th><div class="tit">날짜</div></th>
											<td>
												<span class="sel_wrap w01" style="width:180px;">
													<select id="checkYear" name="checkYear">
													</select>
												</span>
												<span class="sel_wrap w01" style="width:160px;">
													<select id="checkMonth" name="checkMonth">
													</select>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- s: btn wrap 가운데 정렬-->
							<div class="model_btn_wrap">
								<span class="btn btn_type02 btn_size02"><a href="#" onclick="createSituationReport();">보고서생성</a></span>
								<span class="btn btn_type03 btn_size02"><a href="#" class="closePop">취소</a></span>
							</div>
						</div>
		
					</div>
				</div>
			</div>
		</div>
	</form>
</div>