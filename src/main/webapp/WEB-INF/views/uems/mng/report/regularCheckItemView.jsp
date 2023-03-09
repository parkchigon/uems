<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
var questionList = [];
var answerList = [];
var index;
var queDelList = [];
var ansDelList = [];
var searchVal;
var queFlag = 'N';
var ansFlag = 'N';
	$(document).ready(function(){
		
		$("select[name=sgId]").change(function(){
			selectSiteGroupList($(this).val());
		})
		
		$("select[name=searchCondition]").change(function(){
			selectFacilityList($(this).val());
		})
		
		$("select[name=searchCondition2]").change(function(){
			searchVal = $(this).val();
			selectFacilityQueList($(this).val());
		})
		
		$("select[name=searchCondition3]").change(function(){
			selectFacilityAnsList($(this).val());
		})
		
		$("#questionList").on("click", "li", function(){
			var text = $(this).text();
			index = $(this).index();
			$("#inputQueName").val(text);
		})
		
		$("#answerList").on("click", "li", function(){
			var text = $(this).text();
			index = $(this).index();
			$("#inputAnsName").val(text);
		})
		
	});

	//지점 그룹 선택 -> 각 지점 목록 조회
	function selectSiteGroupList(sgId) {
		if(isEmpty(sgId)) {
			var html = "";
			html += "<option value=''>지점선택</option>";
			
			$("select[name=searchCondition]").empty();
			$("select[name=searchCondition]").append(html);
			
			$("#siteId").val("");
			
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
					if(list[i].siteId == $("select[name=searchCondition]").val
							
							 ()) {
						html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
					} else {
						html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
					}
					
				}
				
				$("select[name=searchCondition]").empty();
				$("select[name=searchCondition]").append(html);

			});
		}
	}
	
	//지점siteId 선택시 해당 장비 리스트 조회
	function selectFacilityList(siteId){
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
					if(list[i].siteId == $("select[name=searchCondition2]").val()) {
						html += "<option value="+list[i].msId+" selected>" + list[i].facilityName + "</option>";
					} else {
						html += "<option value="+list[i].msId+" >" + list[i].facilityName + "</option>";
					}
					
				}
			}else{
				html += "<option value=''>장비없음</option>";
			}
			
			$("select[name=searchCondition2]").empty();
			$("select[name=searchCondition2]").append(html);

		});
	}
	
	// 대항목 리스트 조회
	function selectFacilityQueList(searchVal){
		$.ajax({
			url : "/uems/mng/check/selectFacilityQueListAjax.do",
			type: "POST",
			data: {msId : searchVal},
			dataType : "json"
		}).done( function(data) {
			//questionList
			var list = data.facilityQueList;
			var html = "";
			var html2 = "";
			var html3 = "";
			var length = list.length;
			
			html2 += "<option value=''>상세항목선택</option>";
			if(length > 0){
				$("#msId").val(list[0].msId);
				for(var i=0; i<length; i++) {
					if(list[i].designedCode == '00' || list[i].designedCode == '01'){
						html += "<li id='"+list[i].msqId+"'name='queList' class='N' designedCode = '"+list[i].designedCode+"'>"+list[i].question+"</li>";
						html2 += "<option value="+list[i].msqId+">"+list[i].question+"</option>";
					}else{
						html3 += "<li id='"+list[i].msqId+"'name='queList' class='N' designedCode = '"+list[i].designedCode+"'>"+list[i].question+"</li>";
					}
				}
			}
			$("#questionList").empty();
			$("#questionList").append(html);
			$("#defaultList").empty();
			$("#defaultList").append(html3);
			$("select[name=searchCondition3]").empty();
			$("select[name=searchCondition3]").append(html2);
		});
	}
	
	// 대항목 셀렉박스 선택에 따른 상세항목 리스트 조회
	function selectFacilityAnsList(searchVal){

		if(searchVal != ''){
			$.ajax({
				url : "/uems/mng/check/selectFacilityAnsListAjax.do",
				type: "POST",
				data: {searchVal : searchVal},
				dataType : "json"
			}).done( function(data) {
				//questionList
				var list = data.facilityAnsList;
				var html = "";
				var length = list.length;
				
				$("#msqId").val(searchVal);
				if(length > 0){
					for(var i=0; i<length; i++) {
						
						html += "<li id='"+list[i].msaId+"'name='ansList'>"+list[i].answer+"</li>";
					}
				}
				$("#answerList").empty();
				$("#answerList").append(html);
			});
		}
	}
	
	/* 항목 등록 */
	function add(type){
		
		if(type == 'que'){
			queFlag = 'Y';
			var inputQueName = $.trim($("#inputQueName").val());
			if(inputQueName==''){
				alert("항목내용을 입력하세요");
				return false;
			}else{
				$("#questionList").append("<li id='' name='queList' class='Y'>"+inputQueName+"</li>");
				questionList.push(inputQueName);
				$("#inputQueName").val("");
			}
		}else{
			ansFlag = 'Y';
			var inputAnsName = $.trim($("#inputAnsName").val());
			if(inputAnsName==''){
				alert("항목내용을 입력하세요");
				return false;
			}else{
				$("#answerList").append("<li name='ansList'>"+inputAnsName+"</li>");
				answerList.push(inputAnsName);
				$("#inputAnsName").val("");
			}
		}
	}
	
	/* 항목 수정 */
	function upd(type){
		if(type == 'que'){
			if ($.trim($("#inputQueName").val()) != "") {
				queFlag = 'Y';
				var inputQueName = $.trim($("#inputQueName").val());
				$("#questionList li").eq(index).text(inputQueName);
				$("#inputQueName").val("");
			} else {
				alert("빈값으로 수정할 수 없습니다!");
			}
		}else{
			if ($.trim($("#inputAnsName").val()) != "") {
				ansFlag = 'Y';
				var inputAnsName = $.trim($("#inputAnsName").val());
				$("#answerList li").eq(index).text(inputAnsName);
				$("#inputAnsName").val("");
			} else {
				alert("빈값으로 수정할 수 없습니다!");
			}
		}
	}
	
	/* 항목 삭제 */
	function del(type){
		if(type == 'que'){
			queFlag = 'Y';
			var temp = $("#questionList li").eq(index).attr("id");
			if(temp!='' && temp!=undefined){
				queDelList.push(temp);
				$("#delListArr").val(queDelList);
			}
			$("#questionList li").eq(index).remove();
			$("#inputQueName").val("");
		}else{
			ansFlag = 'Y';
			var temp = $("#answerList li").eq(index).attr("id");
			
			if(temp!='' && temp!=undefined){
				ansDelList.push(temp);
				$("#answerList li").eq(index).remove();
			}
			$("#inputAnsName").val("");
			$("#delListArr").val(ansDelList);
			
			
		}
	}
	
	/* 저장 */
	function save(types){
		if(types == 'que'){
			var queList = new Array();
			var defaultList = new Array();
			var lastIndex = 0;
			$("#questionList").children().each(function(i){
				var json = new Object();
				json.msqId = $("#questionList").children().eq(i).attr("id");
				json.question = $("#questionList").children().eq(i).text();
				json.sortNo = i+1;
				lastIndex = i+1;
				json.newYn = $("#questionList").children().eq(i).attr("class");
				json.designedCode = $("#questionList").children().eq(i).attr("designedCode");
				queList.push(json);
			});
			$("#defaultList").children().each(function(i){
				var json = new Object();
				json.msqId = $("#defaultList").children().eq(i).attr("id");
				json.question = $("#defaultList").children().eq(i).text();
				json.sortNo = i+lastIndex+1;				
				defaultList.push(json);
			});
			
			var obj = new Object();
			obj.queList = queList;
			obj.defaultList = defaultList;
			obj.delListArr = queDelList;
			obj.msId = $("#msId").val();
			obj.updateFlag = queFlag;
			$.ajax({
				url : "/uems/mng/check/saveFacilityQueListAjax.do",
				type: "POST",
				data: JSON.stringify(obj),
				dataType : "json",
				contentType: "application/json; charset=UTF-8"
			}).done( function(data) {
				//대항목 refresh
				var resultCode = data.resultCode;
				if(resultCode=='0000'){
					selectFacilityQueList(searchVal);
					alert("대항목 수정내용이 저장되었습니다.");
				}else{
					alert(data.resultMsg);
				}
			});
		}else{
			
			//if ($("#answerList").children().length == 0)
			//	return;
			
			var ansList = new Array();
			var lastIndex;
			
			$("#answerList").children().each(function(i){
				var json = new Object();
				json.msaId = $("#answerList").children().eq(i).attr("id");
				json.answer = $("#answerList").children().eq(i).text();
				json.sortNo = i+1;
				lastIndex = i+1;
				ansList.push(json);
			});
			var obj = new Object();
			obj.queList = ansList;
			obj.delListArr = ansDelList;
			obj.msqId = $("#msqId").val();
			obj.updateFlag = ansFlag;
			
			$.ajax({
				url : "/uems/mng/check/saveFacilityAnsListAjax.do",
				type: "POST",
				data: JSON.stringify(obj),
				dataType : "json",
				contentType: "application/json; charset=UTF-8"
			}).done( function(data) {
				//대항목 refresh
				var resultCode = data.resultCode;
				if(resultCode=='0000'){
					alert("상세항목 수정내용이 저장되었습니다.");
					selectFacilityAnsList($("select[name=searchCondition3]").val());
				}else{
					alert(data.resultMsg);
				}
			});
		}
		
		
	}
	
</script>

<!-- s:드래그 추가 -->
<style type="text/css">
  #trendGroupList li {cursor: pointer;}
  .ui-state-highlight { height: 1.5em; line-height: 1.2em; }
</style>
<script type="text/javaScript">
$(document).ready(function(){
	
	  $( function() {
	    $( "#questionList" ).sortable({
	      placeholder: "ui-state-highlight"
	    });
	    $( "#questionList" ).disableSelection();
	    
	    $( "#answerList" ).sortable({
	      placeholder: "ui-state-highlight"
	    });
	    $( "#answerList" ).disableSelection();
	  } );
		
	});
</script>
<!-- e:드래그 추가 -->

<style type="text/css">
	.devTrendGroup {background-color:silver}
	.devTag {background-color:silver}
</style>

<div class="contents_wrap">
<form:form commandName="maintenance" name="frm" id="frm" method="post">	
	<form:hidden path="siteId"/>
	<form:hidden path="msId"/>
	<form:hidden path="msqId"/>
	<form:hidden path="msaId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">보고서관리 - 정기점검 항목관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;정기점검 내용을 편집하고 관리합니다.</div></li>
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
					<td>
						<span class="sel_wrap w01" style="width:195px;">
							<form:select path="sgId">
								<form:option value="">지점그룹</form:option>
								<c:forEach var="result" items="${siteGroupList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:195px;">
							<form:select path="searchCondition">
								<form:option value="">지점선택</form:option>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:195px;">
							<form:select path="searchCondition2">
								<form:option value="">장비선택</form:option>
							</form:select>
						</span>
					</td>
				</tr>
			<tbody>
		</table>
	</div>
	
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0" >
			<colgroup>
				<col width="40%" />
				<col width="60%" />
			</colgroup>
			
			<tbody>
				<tr>
					<th><div class="tit">▼ 대항목</div></th>
					<th><div class="tit">▼ 상세항목</div></th>
				</tr>
				<tr>
					<td>
						<input class="inp_txt w02" id="inputQueName" style="width:200px;"/>
						<span class="btn btn_type02 btn_size02"><a href="javascript:add('que')">추가</a></span>
						<span class="btn btn_type01 btn_size02"><a href="javascript:del('que')">삭제</a></span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:upd('que')">수정</a></span>
					</td>
					<td>
						<span class="sel_wrap w01" style="width:190px;">
							<form:select path="searchCondition3">
								<form:option value="">상세항목</form:option>
								
							</form:select>
							
						</span>
						<input class="inp_txt w02" id="inputAnsName" style="width:200px;" />
						<span class="btn btn_type02 btn_size02"><a href="javascript:add('ans')">추가</a></span>
						<span class="btn btn_type01 btn_size02"><a href="javascript:del('ans')">삭제</a></span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:upd('ans')">수정</a></span>
					</td>
				</tr>
				<tr>
					<td>
						<div class="tree_menuWrap" style="overflow:auto;height:150px;width:200px;display:inline-block;">
							<ul id="questionList">
							</ul>
							<ul id="defaultList">
							</ul>
						</div>
					</td>
					<td style="padding-left:200px;" >
						<div class="tree_menuWrap" style="overflow:auto;height:150px;width:200px;display:inline-block;">
							<ul id="answerList">
							</ul>
						</div>
					</td>
				</tr>
				<tr>	
					<td>
						<span class="btn btn_type02 btn_size02" style="padding-left:200px;"><a href="javascript:save('que')">저장</a></span>
					</td>
					<td>
						<span class="btn btn_type02 btn_size02" style="padding-left:400px;"><a href="javascript:save('ans')">저장</a></span>
					</td>
				</tr>
			<tbody>
		</table>
	</div>
	
</form:form>
</div>

