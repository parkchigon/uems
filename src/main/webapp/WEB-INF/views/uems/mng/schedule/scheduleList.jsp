<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<style type="text/css">
	.table_wrap td {
		padding: 3px 3px;
	}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		//지점검색부분
		selectSiteList('${scheduleRecord.searchCondition}');

		//운전모드검색부분
		selectdriveIdSel();
		
		//신규등록 지점리스트 초기화
		selectSiteTypeList('${scheduleRecord.searchCondition}','${scheduleRecord.searchCondition2}');
		
		$("#searchCondition").change(function(){
			selectSiteList($(this).val());
		});

		$("select[name=siteType]").change(function(){
			var siteCd = ""; 
			if('${scheduleRecord.searchCondition2}'=='') {
				siteCd = $(this).val();
			} else {
				siteCd = '${scheduleRecord.searchCondition2}';
			}
			selectDriveList(siteCd);
			selectTagList(siteCd);
		});
		
		$("select[name=years]").change(function(){
			scheduleOutdayList();
		});
		
		var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = addZeros(currentDate.getMonth()+1,2);
		var day = addZeros(currentDate.getDate(),2);
		
		$("#scheduleOutday").val(year+"-"+month+"-"+day);
		
	});
	
	function registReset(){
		$("select[name=siteType]").empty();
		$("select[name=driveType]").empty();
		var html = "<option value=''>운전모드 선택</option>";
		$("select[name=driveType]").append(html);
		$("select[name=tagType]").empty();
		var html = "<option value=''>확인태그 선택</option>";
		$("select[name=tagType]").append(html);
		$("input[name=time1]").val("");
		$("input[name=time2]").val("");
	}
	
	function search() {
		var f = document.frm;
		f.action = "<c:url value='/uems/mng/schedule/scheduleList.do'/>";
		f.submit();
	}
	
	function selectdriveIdSel() {
		$("select[name=driveId] option[value='${scheduleRecord.driveId}']").attr("selected", "selected");
	}
		
/* 	function search2(){
		
		registReset();
		
		var sgId = $("select[name=sgId]").val();		
		var siteCd = $("select[name=siteCd]").val();
		var driveId = $("select[name=driveId]").val();
		
		//입력 칸 초기화
		$(".devInput").each(function(){
			$(this).val("");
			$("select[name=driveType] option:eq(0)").attr("selected", "selected");
		})
		//신규등록 지점리스트 초기화
		selectSiteTypeList(sgId);

		$.ajax({
			url : "/uems/mng/schedule/scheduleRecordListAjax.do",
			type: "POST",
			data: {sgId : sgId, siteCd : siteCd, driveId : driveId},
			dataType : "json"
		}).done( function(data) {
			 var html = "";
			 var result = data.result;
			 //console.log(result);
			 
			 if(result != null && result.length != 0){
				 $.each(result, function(i, val){
					 html += "<tr id='scheduleId"+val.siId+"'>";
					 html += "	<td>"+val.siteName+"</td>";
					 html += "	<td>"+val.wTagDesc+" ("+val.tagId01+")</td>";
					 html += "	<td>"+val.rTagDesc+" ("+val.readTagId+")</td>";
					 html += "	<td><input type='time' value='"+val.tagTime01+"' id='time1' name='time1"+val.siId+"' pattern='^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$' style='width: 100%'></td>";
					 html += "	<td><input type='time' value='"+val.tagTime02+"' id='time2' name='time2"+val.siId+"' pattern='^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$' style='width: 100%'></td>";
					 if(val.controlValue == "1")      html += "	<td>"+val.wTagDesc + " 시작  " +val.controlDate.substring(0,4) +"년"+val.controlDate.substring(5,7) +"월"+val.controlDate.substring(8,10)+"일"+ val.controlDate.substring(11,13)+"시"+val.controlDate.substring(14,16)+"분"+"</td>";
					 else if(val.controlValue == "0") html += "	<td>"+val.wTagDesc + " 종료  " +val.controlDate.substring(0,4) +"년"+val.controlDate.substring(5,7) +"월"+val.controlDate.substring(8,10)+"일"+ val.controlDate.substring(11,13)+"시"+val.controlDate.substring(14,16)+"분"+"</td>";
					 else                             html += "	<td></td>";
					 if (val.applyFlag == "Y")	html += "  <td><input type='checkbox' name='scheduleFlag"+val.siId+"' checked></td>";
					 else					 	html += "  <td><input type='checkbox' name='scheduleFlag"+val.siId+"' ></td>";
					 html += "  <td><span class='btn btn_type02 btn_size01'><a href='javascript:scheduleEdit(\""+val.siId+"\");'>변경</a></span> ";
					 html += "  <span class='btn btn_type02 btn_size01'><a href='javascript:deleteSchedule(\""+val.siId+"\");' name='modal'>삭제</a></span></td>";
					 html += "  <td><a href='javascript:modal_popup(\"#layerPop_type1\",\""+val.siId+"\");'><i class='fa fa-calendar-check-o'></i></a></td>";
					 html += "</tr>";
				 });
			 } else {
				 	 html += "<tr>";
				 	 html += "  <td colspan='9'> 등록된 스케줄제어가 없습니다.</td>";
				 	 html += "</tr>";
			 }
			 
			 $("#schedeulTableBody").empty();
			 document.getElementById("schedeulTableBody").innerHTML += html;
			 
		});
		
	} */
	
	function modal_popup(id, siId) {

		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(200);
		$('#mask').fadeTo("fast", 0.7);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();
		
		$(id).css('top', winH/2-$(id).height()/2+scrollTop-108);
		$(id).css('left', winW/2-$(id).width()/2-250);

		$(".model_container").hide();
		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
		
		$("input[name=siId]").val(siId);
		$("#years option:eq(0)").prop("selected", true);

		// 검색년도 초기화
		$("select[name=years] option:eq(0)").prop("selected", "selected");
		
		scheduleOutdayList();
	}
	
	function scheduleOutdayList(){
		
		var siId = $("input[name=siId]").val();
		
		if (siId==null && siId=="") {
			alert("제어ID를 가져올 수 없습니다.");
			return;
		}
		
		var years = $("select[name=years]").val();
		
		$.ajax({
			url : "/uems/mng/schedule/scheduleOutdayListAjax.do",
			type: "POST",
			data: {siId : siId, years : years},
			dataType : "json"
		}).done( function(data) {
			 var html = "";
			 var result = data.outday;

			 if(result != null && result.length != 0){
				 $.each(result, function(i, val){
					 html += "<tr>";
					 html += "	<td class='center'>"+val.dateFormat+"</td>";
					 html += "	<td class='center'><span class='btn btn_type03 btn_size01'><a href=\"javascript:scheduleOutdayDelete('"+val.date+"');\">삭제</a></span></td>";
					 html += "</tr>";
				 });
			 } else {
					 html += "<tr>";
					 html += "	<td colspan='2' style='padding:25px 10px; text-align: center;'> 등록된 휴점일이 없습니다.</td>";
					 html += "</tr>";
			 }
			 
			 $("#schedeulOutdayBody").empty();
			 document.getElementById("schedeulOutdayBody").innerHTML += html;
			 
		});
		
	}
	
	//지점 그룹 선택 -> 각 지점 목록 조회
	function selectSiteList(sgId) {

		if(isEmpty(sgId)) {
			var html = "";
			html += "<option value=''>지점</option>";
			
			$("#searchCondition2").empty();
			$("#searchCondition2").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/user/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId},
				dataType : "json"
			}).done( function(data) {
				var list = data.siteList;
				var html = "";
				html += "<option value=''>지점</option>";
				for(var i=0; i<list.length; i++) {
					if(list[i].siteCd == '${scheduleRecord.searchCondition2}') {
						html += "<option value="+list[i].siteCd+" selected>" + list[i].siteName + "</option>";
					} else {
						html += "<option value="+list[i].siteCd+" >" + list[i].siteName + "</option>";
					}
				}
				
				$("#searchCondition2").empty();
				$("#searchCondition2").append(html);

			});
		}
	}
	
	//검색시 '신규등록'의 지점선택 리스트 추가
	function selectSiteTypeList(sgId, siteCd) {
		$.ajax({
			url : "/uems/mng/user/selectSiteListAjax.do",
			type: "POST",
			data: {searchCondition : sgId},
			dataType : "json"
		}).done( function(data) {
			var list = data.siteList;
			if (siteCd != "") {
				document.getElementById("siteType").setAttribute("onFocus", "this.initialSelect = this.selectedIndex");
				document.getElementById("siteType").setAttribute("onChange", "this.selectedIndex = this.initialSelect");
			} else {
				document.getElementById("siteType").setAttribute("onFocus", "");
				document.getElementById("siteType").setAttribute("onChange", "");
			}
			var html = "";
			html += "<option value=''>지점선택</option>";
			for(var i=0; i<list.length; i++) {
				if(list[i].siteCd == siteCd) {
					html += "<option value="+list[i].siteCd+" selected>" + list[i].siteName + "</option>";
				} else {
					html += "<option value="+list[i].siteCd+" >" + list[i].siteName + "</option>";
				}
				
			}
			 
			$("select[name=siteType]").empty();
			$("select[name=siteType]").append(html);

		});
		
		//운전모드, 확인태그 select리스트 추가
		selectDriveList(siteCd);
		selectTagList(siteCd);

	}


	function selectDriveList(siteCd) {
		if(isEmpty(siteCd)) {
			var html = "";
			html += "<option value=''>운전모드 선택</option>";
			
			$("select[name=driveType]").empty();
			$("select[name=driveType]").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/schedule/selectDriveListAjax.do",
				type: "POST",
				data: {searchCondition : siteCd},
				dataType : "json"
			}).done( function(data) {
				var list = data.driveList;
				var html = "";
				html += "<option value=''>운전모드 선택</option>";
				for(var i=0; i<list.length; i++) {
					if(list[i].tagId == $("select[name=driveType]").val()) {
						html += "<option value="+list[i].tagId+" selected>"+list[i].tagDesc+"("+list[i].tagId+")</option>";
					} else {
						html += "<option value="+list[i].tagId+" >"+list[i].tagDesc+"("+list[i].tagId+")</option>";
					}
				}
				
				$("select[name=driveType]").empty();
				$("select[name=driveType]").append(html);

			});
		}
	}
	
	//지점 선택 -> 확인태그 조회
	function selectTagList(siteCd) {
		if(isEmpty(siteCd)) {
			var html = "";
			html += "<option value=''>확인태그 선택</option>";
			
			$("select[name=tagType]").empty();
			$("select[name=tagType]").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/schedule/selecttagListAjax.do",
				type: "POST",
				data: {searchCondition : siteCd},
				dataType : "json"
			}).done( function(data) {
				var list = data.tagList;
				var html = "";
				html += "<option value=''>확인태그 선택</option>";
				for(var i=0; i<list.length; i++) {
					if(list[i].tagId == $("select[name=tagType]").val()) {
						html += "<option value="+list[i].tagId+" selected>"+list[i].tagDesc+"("+list[i].tagId+")</option>";
					} else {
						html += "<option value="+list[i].tagId+" >"+list[i].tagDesc+"("+list[i].tagId+")</option>";
					}
					
				}
				
				$("select[name=tagType]").empty();
				$("select[name=tagType]").append(html);

			});
		}
	}
	
	function validation(){

		if($("#siteType").val()==null || $("#siteType").val()==""){
			alert("지점을 입력해야 합니다!");
			return false;
		}
		if($("#driveType").val()==null || $("#driveType").val()==""){
			alert("운전모드를 입력해야 합니다!");
			return false;
		}
		if($("#tagType").val()==null || $("#tagType").val()==""){
			alert("확인태그를 입력해야 합니다.!");
			return false;
		}
		if($("#time1").val()=="" && $("#time2").val()==""){
			alert("시작시간과 종료시간은 1개 이상 입력해야 합니다..");
			return false;
		}
		
		return true;
	}
	
	function scheduleRegist() {
		
		if(validation()){
			if(confirm("현재 내용을 저장하시겠습니까?")) {
				var siteType = $("select[name=siteType]").val();
				var driveType = $("select[name=driveType]").val();
				var tagType = $("select[name=tagType]").val();
				var time1 = $("input[name=time1]").val();
				var time2 = $("input[name=time2]").val();
				var scheduleFlag = "";
				if($("input[name=scheduleFlag]").attr("checked") == "checked") {
					scheduleFlag = "Y";
				} else {
					scheduleFlag = "N";
				}

				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url: "/uems/mng/schedule/scheduleRecordRegistAjax.do",
					type: "POST",
					data: {siteCd : siteType
						, tagId01 : driveType
						, readTagId : tagType
						, tagTime01 : time1
						, tagTime02 : time2
						, applyFlag : scheduleFlag
					},
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
	
	function scheduleEdit(siId) {
		
		if (siId==null || siId=='') {
			alert("수정ID값이 존재하지 않습니다!");
			return;
		}
		
		if($("#time1"+siId).val()=="" && $("#time2"+siId).val()==""){
			alert("시작시간과 종료시간은 1개 이상 입력해야 합니다..");
			return false;
		}
		
		console.log('${scheduleRecord.currPage}');
		
		if(confirm("현재 내용으로 수정하시겠습니까?")) {
			var time1 = $("input[name=time1"+siId+"]").val();
			var time2 = $("input[name=time2"+siId+"]").val();
			var scheduleFlag = "";
			if($("input[name=scheduleFlag"+siId+"]").attr("checked") == "checked") {
				scheduleFlag = "Y";
			} else {
				scheduleFlag = "N";
			}

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: "/uems/mng/schedule/scheduleRecordEditAjax.do",
				type: "POST",
				data: {siId : siId
					, tagTime01 : time1
					, tagTime02 : time2
					, applyFlag : scheduleFlag
					, currPage : '${scheduleRecord.currPage}'
				},
				dataType: "json",
				async:false
			 }).done (function(data) {
				 if(data.result){
					 alert("수정하였습니다.");
					 search();
				 }else{
					 alert("실패하였습니다.");
				 }
			 });
		}
	}
	
	function scheduleOutdayRegist() {
		
		var siId = $("input[name=siId]").val();
		var date = $("#scheduleOutday").val();
		date = date.split("-")[0]+date.split("-")[1]+date.split("-")[2];
		//console.log(date);
		
		 $.ajax({
			url: "/uems/mng/schedule/scheduleOutdayRegistAjax.do",
			type: "POST",
			data: {siId:siId, date: date},
			dataType: "json",
			async:false
		 }).done (function(data) {
			 if(data.result){
				 alert("저장하였습니다.");
			 }else{
				 alert("실패하였습니다.");
			 }
		 });
			
		scheduleOutdayList();
		
	} 

	function deleteSchedule(siId) {
		
		if (siId==null || siId=='') {
			alert("삭제ID값이 존재하지 않습니다!");
			return;
		}
		
		if(confirm("해당 스케줄을 삭제하시겠습니까?")) {

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: "/uems/mng/schedule/scheduleRecordDeleteAjax.do",
				type: "POST",
				data: {siId : siId},
				dataType: "json",
				async:false
			 }).done (function(data) {
				 if(data.result){
					 alert("삭제하였습니다.");
					 search();
				 }else{
					 alert("실패하였습니다.");
				 }
			 });
		}
	}
	
	function scheduleOutdayDelete(delDate) {
		
		var siId = $("input[name=siId]").val();
		
		if (siId=="" || delDate=="") {
			alert()
		}
		
		if(confirm("해당 일자를 삭제하시겠습니까?")) {
			 $.ajax({
				url: "/uems/mng/schedule/scheduleOutdayDeleteAjax.do",
				type: "POST",
				data: {siId:siId, date: delDate},
				dataType: "json",
				async:false
			 }).done (function(data) {
				 if(data.result){
					 alert("삭제하였습니다.");
				 }else{
					 alert("실패하였습니다.");
				 }
			 });
			
			scheduleOutdayList();
		}
	} 
	
	function sheduleOutdayClear() {
		$("input[name=siId]").val("");
	}
</script>



<div class="contents_wrap">
<form:form commandName="scheduleRecord" name="frm" id="frm" method="post">
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">스케줄관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;빙축열 운전모드 스케줄을 관리합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="10%" />
				<col width="*%" />
			</colgroup>
			
			<tbody>
				<tr>
					<th><div class="tit">검색</div></th>
					<td>
						<span class="sel_wrap w01" style="width:195px;">
							<form:select path="searchCondition">
								<form:option value="" label="지점그룹"/>
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:195px;">
							<select id="searchCondition2" name="searchCondition2">
							</select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select name="driveId">
								<option value="">운전모드 선택</option>
								<option value="축냉운전">축냉운전</option>
								<option value="방냉운전">방냉운전</option>
								<option value="냉단운전">냉단운전</option>
								<option value="동시운전">동시운전</option>
							</select>
						</span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:search();">검 색</a></span>
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
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="*"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>지점</th>
					<th>운전모드(제어)</th>
					<th>확인태그(읽기)</th>
					<th>시작 시간</th>
					<th>종료 시간</th>
					<th>마지막 제어 결과</th>
					<th>적용</th>
					<th>삭제</th>
					<th>제외일등록</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<th>
							<span class="sel_wrap w01">
								<span class="sel_wrap w01" style="width:195px;">
									<form:select path="siteType">
										<option value="">지점선택</option>
										<c:forEach var="result" items="${siteList}" varStatus="status">
											<form:option  value="${result.siteCd}" label="${result.siteName}"/>
										</c:forEach>
									</form:select>
								</span>
							</span>
						</th>
						<th>
							<span class="sel_wrap w01">
								<form:select path="driveType">
									<form:option value="">운전모드 선택</form:option>
								</form:select>
							</span>
						</th>
						<th>
							<span class="sel_wrap w01">
								<form:select path="tagType">
									<form:option value="">확인태그 선택</form:option>
								</form:select>
							</span>
						</th>
						<th><input type="time" id="time1" name="time1" pattern="^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$" style="width: 100%"></th>
						<th><input type="time" id="time2" name="time2" pattern="^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$" style="width: 100%"></th>
						<th></th>
						<th><input type="checkbox" name="scheduleFlag" checked></th>
						<th><span class="btn btn_type02 btn_size02"><a href="javascript:scheduleRegist();">신규등록</a></span></th>
						<th>
							<!-- <a href="#layerPop_type1" name="modal"><i class="fa fa-calendar-check-o"></i></a> -->
						</th>
					</tr>
				<c:if test="${fn:length(scheduleList) eq 0}">
					<tr>
						<td colspan="9"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${scheduleList}" varStatus="status">
					<tr id="'scheduleId'${result.siId}">
					 	<td>${result.siteName}</td>
					 	<td>${result.wTagDesc} (${result.tagId01})</td>
					 	<td>${result.rTagDesc} (${result.readTagId})</td>
					 	<td><input type="time" value="${result.tagTime01}" id="time1" name="time1${result.siId}" pattern="^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$" style="width: 100%"></td>
					 	<td><input type="time" value="${result.tagTime02}" id="time1" name="time2${result.siId}" pattern="^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$" style="width: 100%"></td>
					<c:choose>
						<c:when test="${result.controlValue eq '1.000'}">
							<td>${result.wTagDesc} 시작 ${result.controlDate.substring(0,4)}년${result.controlDate.substring(5,7)}월${result.controlDate.substring(8,10)}일${result.controlDate.substring(11,13)}시${result.controlDate.substring(14,16)}분</td>
						</c:when>
						<c:when test="${result.controlValue eq '0.000'}">
							<td>${result.wTagDesc} 종료 ${result.controlDate.substring(0,4)}년${result.controlDate.substring(5,7)}월${result.controlDate.substring(8,10)}일${result.controlDate.substring(11,13)}시${result.controlDate.substring(14,16)}분</td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${result.applyFlag=='Y'}">
							<td><input type="checkbox" name="scheduleFlag${result.siId}" checked></td>
						</c:when>
						<c:otherwise>
							<td><input type="checkbox" name="scheduleFlag${result.siId}"></td>
						</c:otherwise>
					</c:choose>
						<td><span class="btn btn_type02 btn_size01"><a href="javascript:scheduleEdit('${result.siId}');">변경</a></span>
						<span class="btn btn_type02 btn_size01"><a href="javascript:deleteSchedule('${result.siId}');">삭제</a></span></td>
						<td><a href="javascript:modal_popup('#layerPop_type1','${result.siId}');"><i class="fa fa-calendar-check-o"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
<!-- 			<tbody id="schedeulTableBody">
			</tbody>	 -->
		</table>
	</div>
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${scheduleRecord.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
	</form:form>
	<!-- e: table wrap-->

</div>
<c:out value="${scheduleRecord.pageutil.pagingHtml}" escapeXml="false" />

<div class="model_container" id="layerPop_type1">
	<input type="hidden" name="siId" value=""/>
	<div class="model_inner">
		<div class="model_header"><h2>스케줄 제외일 등록</h2></div> 
		<div class="model_body">
			<div class="model_content">
				
					<div class="thead_wrap cboth">
						<div class="rtl">
							<span class="sel_wrap w01" style="width:60px;">
								년도검색
							</span>
							<span class="sel_wrap w01" style="width:70px;">
								<select id="years" name="years">
									<option value="">전체</option>
									<c:set var="today" value="<%=new java.util.Date() %>"/>
									<fmt:formatDate value="${today }" pattern="yyyy" var="start"/>
									<c:forEach begin="0" end="10" var="idx" step="1">
										<option value="<c:out value="${(start+1)- idx }"/>"><c:out value="${(start+1)- idx }"></c:out> </option>
									</c:forEach>
								</select>
							</span>
						</div>
					</div>
					<div class="search_form_wrap" style="height: 295px;overflow: auto;">
						<!-- s: table wrap-->
						<table cellpadding="0" cellspacing="0" border="0">
							<colgroup>
								<col width="*">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th class="center">미운전일자</th>
									<th class="center">삭제</th>
								</tr>
							</thead>
							<tbody id="schedeulOutdayBody">
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
								<tr>
									<td class="center">2018년 5월 14일</td>
									<td class="center"><span class="btn btn_type03 btn_size01"><a href="#">삭제</a></span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="thead_wrap cboth">
						<div class="rtl">
							<span >일자추가 :</span>
							<span class="entry_calendar center">
							<fmt:parseDate value="${siteView.iceSystemSdate}" var="iceSystemSdate" pattern="yyyy년 MM월 dd일"/>
							<input type="texy" class="datepicker" id="scheduleOutday" name="scheduleOutday" value="<fmt:formatDate value='${scheduleOutday}' pattern='yyyy년 MM월 dd일'/>" style="width:77px;"></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
							</span>
							<span class="btn btn_type02 btn_size02"><a href="javascript:scheduleOutdayRegist();">추가</a></span>
						</div>
					</div>
					<div class="thead_wrap cboth" style="color:red;font-size:12px;'">
						- 휴무일 전일 <ins>운전시작</ins>에 대한 휴무일(익일) <ins>운전종료</ins> 스케줄이 있을 경우 <ins>운전종료</ins>제어는 실행 됩니다.<br/>
						- 휴무일 당일 <ins>운전시작</ins>에 대한 익일 <ins>운전종료</ins> 스케줄은 실행되지 않습니다.
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div style="text-align:center; margin-top:10px;">
						<span class="btn btn_type03 btn_size02"><a href="javascript:sheduleOutdayClear();" class="closePop">닫기</a></span>
					</div>

			</div>
		</div>
	</div>
</div>

