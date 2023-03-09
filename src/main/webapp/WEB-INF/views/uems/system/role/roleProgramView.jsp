<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javascript" src="/resources/uems/js/plugin/jstree.min.js"></script>
<script type="text/javascript" src="/resources/uems/js/lib/tree-util-1.0.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/uems/css/themes/default/style.min.css"  /> 
<script type="text/javascript">
$(document).ready(function(){
	
	var formData = getFormData($("#frm"));
	$("#menuTree").tree_init({
		"url" : "/uems/system/role/roleMenuListAjax.do",
		"data" : formData,
		"multiple_select" : false,
		"plugins" : [ "search" ],
		"select_node" : { "callback" : selectedNode },
	});
	
	$("#checkAll").on("click", function() {
		$(".checkbox").prop("checked", this.checked);
	});
	
	$(document).on("click", ".checkbox", function() {
		if ( $(".checkbox").length == $(".checkbox:checked").length ) {
			$("#checkAll").prop("checked", true);
		} else {
			$("#checkAll").prop("checked", false);
		}
	});
});

function selectedNode(e, data) {
	
	// 값 Setting
	if ( $.tree_is_leaf(data.node) == false ) {
		$("#program_list").html(makeProgram(null, "empty"));
		$("#checkAll").prop("checked", false);
	} else {
		$("#menuId").val(data.node.id);
		
		$.ajax({
			url: "/uems/system/role/roleProgramListAjax.do",
			type: "POST",
			data: getFormData($("#frm")),
			contentType: "application/json"
		}).done (function(data) {
			
			$("#checkAll").prop("checked", false);
			if ( makeProgramList(data.roleProgramList) ) {
				if ( $(".checkbox").length != 0 && $(".checkbox").length == $(".checkbox:checked").length ) {
					$("#checkAll").prop("checked", true);
				}
			}

		}).fail(function() {
			
			alert("fail.");
		});
	}
}

function makeProgramList(list) {

	var html = "";
	
	if ( typeof list == 'undefined' || list == null ) {
		return false;
	}
	
	if ( list.length == 0 ) {
		html += "<tr><td colspan='5'>등록된 프로그램 데이터가 없습니다.</td></tr>";
	}
	
	list.forEach( function(program, index) {
		html += makeProgram(program, index);
	} );
	
	$("#program_list").html(html);
	return true;
}

function makeProgram(program, suffix) {
	
	var html = "";
	
	var programRowId = ( typeof suffix != "undefined" ) ? "program-" + suffix : "";
	var programIndex = ( typeof suffix != "undefined" ) ? suffix : "";
	var programId    = ( program && program.programId   ) ? program.programId   : "";
	var programName    = ( program && program.programName   ) ? program.programName   : "";
	var programUrl   = ( program && program.programUrl  ) ? program.programUrl  : "";
	var startProgramYn  = ( program && program.startProgramYn ) ? program.startProgramYn : "";
	var useYn        = ( program && program.useYn       ) ? program.useYn       : "";

	
	html += "<tr id=\""+programRowId+"\">\n";
	if ( suffix == "empty" ) {
		html += "	<td></td>\n";
	} else {
		html += "	<td>\n";
		if ( program.roleProgramYn == "Y" ) {
			html += "		<input type=\"checkbox\" class=\"checkbox\" id=\""+programId+"\" checked=\"checked\" >\n";
		} else {
			html += "		<input type=\"checkbox\" class=\"checkbox\" id=\""+programId+"\" >\n";
		}
		html += "	</td>\n";
	}
	html += "	<td id=\"program_id\">\n";
	html += "		<span>"+programId+"</span>\n";
	html += "	</td>\n";
	html += "	<td id=\"program_name\">\n";
	html += "		<span class=\"normal\">"+programName+"</span>\n";
	html += "	</td>\n";
	html += "	<td id=\"program_url\">\n";
	html += "		<span class=\"normal\">"+programUrl+"</span>\n";
	html += "	</td>\n";
	html += "	<td id=\"st_program_yn\">\n";
	html += "		<span class=\"normal\">"+startProgramYn+"</span>\n";
	html += "	</td>\n";
	html += "</tr>\n";
	
	return html;
}

function save() {
	
	var programIds = [];
	$(".checkbox").each(function(index, value) {
		if ( this.checked ) {
			programIds.push(value.id);
		}
	});
	
	$("#programIds").val(programIds.join());
	
	$.ajax({
		url: "/uems/system/role/roleProgramRegistExeAjax.do",
		type: "POST",
		data: getFormData($("#frm")),
		contentType: "application/json"
	}).done (function(data) {
		$("#frm > #programIds").val("");
		
		alert("저장되었습니다.");
		
		$.tree_reload("", getFormData($("#frm")));
		
	}).fail (function(data) {
		$("#frm > #programIds").val("");
		
		alert("메뉴 권한 정보 등록 실패");
		$.tree_reload("", getFormData($("#frm")));
	});
}

</script>

<div class="contents_wrap">

<form id="frm" name="frm" method="post">
	<input type="hidden" id="roleId"        name="roleId"       value="<c:out value="${role.roleId}" escapeXml="false"/>"/>
	<input type="hidden" id="programIds"    name="programIds"   value=""/>
	<input type="hidden" id="menuId"        name="menuId"       value=""/>
</form>

	<h2 class="main_title">프로그램 권한 관리 (<c:out value="${role.roleId}" escapeXml="false"/>)</h2>
	<div class="section01">
		<div class="ltr_box">
			<div class="tree_menu">
				<div class="searchWrap">
					<input class="search-input inp_txt" style="margin-bottom: 10px; width: 100%;" onKeyup="$.tree_search(this);" placeholder="검색"/>
				</div>
				<div class="btn_wrap02">
					<span class="btn btn_type03 btn_size02" style="width:200px;"><a href="javascript:$.tree_open_all();">전체 열기</a></span>
					<span class="btn btn_type01 btn_size02" style="width:200px;"><a href="javascript:$.tree_close_all();">전체 닫기</a></span>
				</div>
				<div id="menuTree" class="tree_menuWrap"></div>
			</div>
		</div>
		<div class="rtl_box">
			<!-- s: table wrap-->
			<div class="table_wrap">
				<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
					<colgroup>
						<col width="5%"/>
						<col width="20%"/>
						<col width="20%"/>
						<col width=""/>
						<col width="10%"/>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th>프로그램 ID</th>
							<th>프로그램명</th>
							<th>URL</th>
							<th>시작 여부</th>
						</tr>
					</thead>
					<tbody id="program_list">
						<tr><td></td><td></td><td></td><td></td><td></td></tr>
					</tbody>
				</table>
			</div>
			<!-- e: table wrap-->

			<!-- s: btn wrap 양쪽 정렬-->
			<div class="btn_wrap01">
				<div class="rtl">
					<span id="btn_save" class="btn btn_type01 btn_size02"><a href="javascript:history.back();">뒤로</a></span>
					<span id="btn_save" class="btn btn_type02 btn_size02"><a href="javascript:save();">저장</a></span>
				</div>
			</div>
			<!-- e: btn wrap-->
		</div>
	</div>
</div>
