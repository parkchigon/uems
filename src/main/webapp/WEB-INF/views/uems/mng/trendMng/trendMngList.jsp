<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
var trendGroupList = [];
var trendGroupTagList = [];
	$(document).ready(function(){
		
		$("select[name=sgId]").change(function(){
			listReset();
			selectSiteGroupList($(this).val());
		})
		
		$("select[name=searchCondition]").change(function(){
			listReset();
			selectSiteList($(this).val());
		})
		
		$("#trendGroupList").on("click", "li", function(){
			$(this).siblings().removeClass();
			$(this).addClass("devTrendGroup");
			$("#tagList").empty();
			selectTrendGroup($(this).attr("id"));
		});
		
		$("#tagList").on("click", "li", function(){
			$(this).siblings().removeClass();
			$(this).addClass("devTag");
		});
		
		$("select[name=searchCondition2]").change(function(){
			tagListSelectbox($(this).val());
		});
		
	});
	
	//지점 선택 체크
	function siteChk(){
		if($("#siteId").val() == '' || $("#siteId").val() == null){
			alert("지점을 선택해주세요.");
			return false;
		}else{
			return true;
		}
	}
	
	//트랜드그룹 or 태그 추가
	function add(type){
		if(siteChk()){
			if(type == 'group'){
				var inputTgName = $.trim($("#inputTgName").val());
				if(inputTgName == ''){
					alert("트랜드 그룹명을 입력해주세요.");
					return;
				}else if($.inArray(inputTgName, trendGroupList) != -1){
					alert("중복된 그룹명 입니다.");
					return;
				}else{
					$("#trendGroupList").append("<li>"+inputTgName+"</li>");
					trendGroupList.push(inputTgName);
					$("#inputTgName").val("");
				}
			}else{
				var inputTgName = $("select[name=searchCondition3]").val();
				if(inputTgName == ''){
					alert("태그를 선택해주세요.");
					return;
				}else if($.inArray(inputTgName, trendGroupTagList) != -1){
					alert("이미 추가된 태그입니다.");
					return;
				}else{
					$("#tagList").append("<li class='devTagList' id='"+$("select[name=searchCondition3] option:selected").val()+"'>"+$("select[name=searchCondition3] option:selected").text()+"</li>");
					trendGroupTagList.push($("select[name=searchCondition3] option:selected").val());
				}
			}
		}
	}

	//트랜드그룹 or 태그 삭제
	function del(type){
		if(siteChk()){
			if(type == 'group'){
				trendGroupList.splice($.inArray($(".devTrendGroup").text(), trendGroupList), 1);
				$(".devTrendGroup").remove();
				$("#tagList").empty();
			}else{
				trendGroupTagList.splice($.inArray($(".devTag").attr("id"), trendGroupTagList), 1);
				$(".devTag").remove();
			}
		}
	}
	
	//트랜드그룹 리스트, 태그 리스트 초기화
	function listReset(){
		$("#inputTgName").val("");
		$("#trendGroupList").children().remove();
		$('select[name=searchCondition2] option:eq(0)').attr('selected', 'selected');
		$("select[name=searchCondition3]").empty();
		$("select[name=searchCondition3]").append("<option value=''>태그선택</option>");
		$("#tagList").children().remove();
	}
	
	//지점 선택 -> 해당 지점에 해당하는 트랜드 그룹 리스트 조회
	function selectSiteList(siteId){
		if(isEmpty(siteId)) {
			listReset();
			$("#siteId").val("");
		} else {
			$.ajax({
				url : "/uems/mng/trendMng/searchTrendGroupListAjax.do",
				type: "POST",
				data: {siteId : siteId},
				dataType : "json"
			}).done( function(data) {
				 var html = "";
				 var length = data.tagList.length;
				 var data = data.tagList;
				 
				 trendGroupList = [];
				 
				 if(length > 0){
					 for(var i=0; i<length; i++){
						 html += "<li id="+data[i].tgId+" >" + data[i].tgName + "</li>";
						 trendGroupList.push(data[i].tgName);
					 }
				 }
				 $("#trendGroupList").empty();
				 $("#trendGroupList").append(html);
				 
				 $("#siteId").val(siteId);
			});
		}
	}
	
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
					if(list[i].siteId == $("select[name=searchCondition]").val()) {
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
	
	//태그 타입 선택 -> 태그 리스트 조회
	function tagListSelectbox(selectedId) {
		var url = "/uems/mng/trendMng/searchTagListAjax.do";
		$.ajax({
			url: url,
			type: "POST",
			data: {tagKindCd:selectedId, siteId:$("#siteId").val()},
			dataType: "json",
			async:false
		 }).done (function(data) {
			  
			 var html = "";
			 html += "<option value=''>태그선택</option>";
			 var length = data.tagList.length;
			 var data = data.tagList;
			 
			 if(length > 0){
				 for(var i=0; i<length; i++){
					 html += "<option value="+data[i].tagId+" >" + data[i].tagDesc + "</option>";
				 }
			 }
			 $("select[name=searchCondition3]").empty();
			 $("select[name=searchCondition3]").append(html);
			 
		 });
	}
	
	// 트랜드 그룹 선택 -> 해당 트랜드 그룹에 속한 태그 리스트 조회
	function selectTrendGroup(selectedId) {
		var url = "/uems/mng/trendMng/searchTrendTagListAjax.do";
		if(selectedId != null && selectedId != ''){
			$.ajax({
				url: url,
				type: "POST",
				data: {tgId:selectedId},
				dataType: "json",
				async:false
			 }).done (function(data) {
				  
				 var html = "";
				 var length = data.tagList.length;
				 var data = data.tagList;
				 
				 trendGroupTagList = [];
				 
				 if(length > 0){
					 for(var i=0; i<length; i++){
						 html += "<li class='devTagList' id="+data[i].tagId+" >" + data[i].tagDesc + "</li>";
						 trendGroupTagList.push(data[i].tagId);
					 }
				 }
				 $("#tagList").empty();
				 $("#tagList").append(html);
			 });
		}
		
	}
	
	//저장
	function save(){
		if(siteChk()){
			var url = "/uems/mng/trendMng/trendMngSaveAjax.do";
			trendGroupList = [];
			var trendTagList = [];
			$("#trendGroupList").children().each(function(){
				trendGroupList.push($(this).text());
			});
			
			$("#tagList").children().each(function(){
				trendTagList.push($(this).attr("id"));
				//alert($(this).attr("id"));
			});
			
			var siteId = $("select[name=searchCondition] option:selected").val();
			//var tgId = $(".devTrendGroup").text();
			var tgId = "";
			$("#trendGroupList").children("li").each(function(){
				if($(this).hasClass("devTrendGroup")){
					tgId = $(this).attr("id");
				}
			});
			
			jQuery.ajaxSettings.traditional = true;
	
			$.ajax({
				url: url,
				type: "POST",
				data: {trendGroupList:trendGroupList, siteId:siteId, trendTagList:trendTagList, tgId:tgId},
				dataType: "json",
				async:false
			 }).done (function(data) {
				 if(data.result){
					 alert("저장하였습니다.");	 
				 }else{
					 alert("실패하였습니다.");
				 }
			 });
		}
	}
	
</script>


<style type="text/css">
	.devTrendGroup {background-color:silver}
	.devTag {background-color:silver}
</style>

<div class="contents_wrap">
<form:form commandName="trendGroup" name="frm" id="frm" method="post">	
	<form:hidden path="tgId"/>
	<form:hidden path="siteId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">트랜드 설정관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 장비를 조회 및 관리를 합니다.</div></li>
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
					<th><div class="tit">▼ 트랜드 그룹</div></th>
				</tr>
				<tr>
					<td>
						<input class="inp_txt w02" id="inputTgName" style="width:200px;"/>
						<span class="btn btn_type02 btn_size02"><a href="javascript:add('group')">추가</a></span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:del('group')">삭제</a></span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:save()">저장</a></span>
					</td>
					<td>
						<span class="sel_wrap w01" style="width:190px;">
							<form:select path="searchCondition2">
								<form:option value="">태그 그룹</form:option>
								<c:forEach var="result" items="${tagTypeList}" varStatus="status">
									<form:option  value="${result.codeUseName}" label="${result.codeName}"/>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:195px;">
							<form:select path="searchCondition3">
								<form:option value="">태그 선택</form:option>
							</form:select>
						</span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:add('tag')">추가</a></span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:del('tag')">삭제</a></span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:save()">저장</a></span>
					</td>
				</tr>
				<tr>
					<td>
						<div class="tree_menuWrap" style="overflow:auto;height:150px;width:200px;display:inline-block;">
							<ul id="trendGroupList">
							</ul>
						</div>
					</td>
					<td>
						<div class="tree_menuWrap" style="overflow:auto;height:150px;width:200px;display:inline-block;">
							<ul id="tagList">
							</ul>
						</div>
					</td>
				</tr>
			<tbody>
		</table>
	</div>
	<!-- <span class="btn btn_type02 btn_size02" style="float:right;"><a href="javascript:save()">저장</a></span> -->
	
</form:form>
</div>

