<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javascript" src="/resources/uems/js/plugin/jstree.min.js"></script>
<script type="text/javascript" src="/resources/uems/js/lib/tree-util-1.0.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/uems/css/themes/default/style.min.css"  /> 
<script type="text/javascript">
$(document).ready(function(){
	
	$("#codeTree").tree_init( {
		"url" : "/uems/system/code/codeListConnectByAjax.do",
		"multiple_select" : false,
		"data" : getFormData($("#frm")),
		"plugins" : [ "contextmenu", "dnd", "search" ],
		"select_node" : { "callback" : selectedNode },
		"move_node"  : { "callback" : movedNode },
		"refresh"    : { "callback" : refreshCallback },
		"loaded"     : { "callback" : loadedCallback },
		"contextmenu" : {
			"items"  : ["create", "edit", "remove"],
			"create" : { "callback" : createdNode },
			"edit"   : { "callback" : editedNode },
			"remove" : { "callback" : deletedNode }
		},
	});
});

function selectedNode(e, data) {
	
	if ( $("#mode").val() == "create" ) {
		$.tree_reload();
	}
	
	// 값 Setting
	$("#code_id").text(data.node.id);
	$("#code_parent").text(data.node.parent);
	$("#code_use_name > span").text(data.node.original.codeUseName);
	$("#code_detail_div > span").text(data.node.original.codeDetailDivision);
	$("#code_name > span").text(data.node.text);
	$("#code_use_yn > span").text(data.node.original.useYn);
	$("#systemCodeYn > span").text(data.node.original.systemCodeYn);
	$("#code_content > span").text(data.node.original.codeContent);
	
	setMode("normal");
}

function movedNode(e, data) {
	
	if ( "#" == data.parent ) {
		alert("Root 메뉴로는 이동할 수 없습니다.");
		$.tree_reload();
		return false;
	}
	
	var old_parent = data.old_parent;
	var parent = data.parent;
	
	// parent == old_parent
	if ( parent == old_parent ) {
		// Parent Node의 모든 Child 업데이트
		var $parent = $.tree_get_node(parent);
		
		$("#codeIds").val($parent.children);
		updateOrder({ "success" : function() { $.tree_reload(); }});
		
	} else {
		// Old Parent Node의 Child 업데이트
		var $old_parent = $.tree_get_node(data.old_parent);
		
		$("#codeIds").val($old_parent.children);
		$("#parentCodeId").val(old_parent);
		updateOrder({
			"success" : function() {
				// New Parent Node의 Child 업데이트
				var $parent = $.tree_get_node(parent);
				
				$("#codeIds").val($parent.children);
				$("#parentCodeId").val(parent);
				updateOrder({ "success" : function() { $.tree_reload(); }});
			}
		});
		
	}
}

function refreshCallback() {
	
	// form reset
	$("#frm > input").not("#mode").val("");
	
	setMode("normal");
}

function loadedCallback() {
	
	if ( $("#codeId").val() ) {
		$.tree_node_click($("#codeId").val());
		$("#frm > input").not("#mode").val("");
	} else {
		$.tree_node_click();
	}
}

function updateOrder(args) {
	
	var success = function() { console.log("success"); };
	var fail = function() { console.log("fail"); };
	
	if ( typeof args != "undefined" ) {
		if ( typeof args.success != "undefined" && args.success != null ) {
			success = args.success;
		}
		
		if ( typeof args.fail != "undefined" && args.fail != null ) {
			fail = args.fail;
		}
	}
	
	var formData = getFormData($("#frm"));
	$.ajax({
		url: "/uems/system/code/codeOrderUpdateExeAjax.do",
		type: "POST",
		data: formData,
		contentType: "application/json"
	})
	.done ( success )
	.fail ( fail );
}

function createdNode(tree_ref, node) {
	
	$("#code_id").text("");
	$("#code_use_name > input").val("");
	$("#code_name > input").val("");
	$("#code_detail_div > input").val("");
	$("#code_content > input").val("");
	$("#code_use_yn > div > input[name=\"code_use_yn\"]:radio[value=\"Y\"]").prop("checked", true);
	$("#systemCodeYn > div > input[name=\"systemCodeYn\"]:radio[value=\"N\"]").prop("checked", true);
	
	setMode("create");
}

function editedNode(tree_ref, node) {
	
	if ( "Y" == node.original.systemCodeYn ) {
		alert("시스템 코드는 수정할 수 없습니다.");
		return false;
	}
	
	$("#code_use_name > input").val($("#code_use_name > span").text());
	$("#code_name > input").val($("#code_name > span").text());
	$("#code_detail_div > input").val($("#code_detail_div > span").text());
	$("#code_content > input").val($("#code_content > span").text());
	$("#code_use_yn > div > input[name=\"code_use_yn\"]:radio[value=\""+$("#code_use_yn > span").text()+"\"]").prop("checked", true);
	$("#systemCodeYn > div > input[name=\"systemCodeYn\"]:radio[value=\""+$("#systemCodeYn > span").text()+"\"]").prop("checked", true);
	$("#code_content > input").val($("#code_content > span").text());

	setMode("modify");
}

function deletedNode(tree_ref, node) {
	
	if ( "Y" == node.original.systemCodeYn && ! confirm("시스템 코드입니다. 시스템에 심각한 문제가 발생할 수 있습니다.\n삭제하시겠습니까?") ) {
		return false;
	}
	
	if ( ! $.tree_is_leaf($("#code_id").text()) ) {
		alert("하위 코드를 먼저 삭제하세요.");
		return false;
	}
	
	if(confirm('삭제하시겠습니까?')) {
		tree_ref.delete_node(node);
		
		setMode("delete");
		save();
	}
}

function save() {
	
	var mode = $("#mode").val();
	var url = "";
	switch ( mode ) {
	case "create":
		url = "/uems/system/code/codeRegistExeAjax.do";

		var parentNode = $.tree_get_node($("#code_parent").text());
		
		$("#codeUseName").val($("#code_use_name > input").val());
		$("#codeName").val($("#code_name > input").val());
		$("#codeDetailDivision").val($("#code_detail_div > input").val());
		$("#codeContent").val($("#code_content > input").val());
		$("#parentCodeId").val(parentNode.id);
		
		$("#useYn").val($("input[name='code_use_yn']:checked").val());
		$("#systemCodeYn").val($("input[name='systemCodeYn']:checked").val());
		// Order No는 등록되는 메뉴의 Parent의 Child 수로 계산함. (마지막에 추가됨)
		$("#sortNum").val(parentNode.children.length);
		
		break;
	case "modify":
		url = "/uems/system/code/codeRegistExeAjax.do";

		var currentNode = $.tree_get_node($("#code_id").text());
		
		$("#codeId").val(currentNode.id);
		$("#codeUseName").val($("#code_use_name > input").val());
		$("#codeName").val($("#code_name > input").val());
		$("#codeDetailDivision").val($("#code_detail_div > input").val());
		$("#codeContent").val($("#code_content > input").val());
		$("#parentCodeId").val(currentNode.parent);
		
		$("#useYn").val($("input[name='code_use_yn']:checked").val());
		$("#systemCodeYn").val($("input[name='systemCodeYn']:checked").val());
		$("#sortNum").val(currentNode.original.sortNum);
		break;
	case "delete":
		url = "/uems/system/code/codeDeleteExeAjax.do";
		
		$("#codeId").val($("#code_id").text());
		break;
	default:
		url = "";
		break;
	}
	
	$.ajax({
		url: url,
		type: "POST",
		data: getFormData($("#frm")),
		contentType: "application/json"
	}).done (function(data) {

		$.tree_reload($("#code_parent").text());
		
		if ( data.result == 'fail' ) {
			
			switch ( mode ) {
			case 'create' : alert("등록에 실패하였습니다.");
				break;
			case 'modify' : alert("수정에 실패하였습니다.");
				break;
			case 'delete' : alert("삭제에 실패하였습니다.");
				break;
			}
		}
		
		
	}).fail (function() {

		alert("실패하였습니다.");
		$.tree_reload();
	});
}

function cancel() {

	$("#code_parent > span").text("");
	$("#code_use_name > span").text("");
	$("#code_detail_div > span").text("");
	$("#code_name > span").text("");
	$("#code_use_yn > span").text("");
	$("#systemCodeYn > span").text("");
	$("#code_content > span").text("");
	$.tree_reload();
}

function setMode(mode) {
	
	$(".create, .modify, .delete, .normal").hide();
	
	$("#mode").val(mode);
	$("."+mode).show();
}

</script>

<div class="contents_wrap">

<form id="frm" name="frm" method="post">
	<input type="hidden" id="codeId"        name="codeId"        value="<c:out value="${codeId}" escapeXml="false"/>"/>
	<input type="hidden" id="codeUseName"     name="codeUseName"     value=""/>
	<input type="hidden" id="codeDetailDivision" name="codeDetailDivision" value=""/>
	<input type="hidden" id="codeName"        name="codeName"        value=""/>
	<input type="hidden" id="parentCodeId"  name="parentCodeId"  value=""/>
	<input type="hidden" id="sortNum"     name="sortNum"     value=""/>
	<input type="hidden" id="useYn"       name="useYn"       value=""/>
	<input type="hidden" id="systemCodeYn"     name="systemCodeYn"     value=""/>
	<input type="hidden" id="codeContent"   name="codeContent"   value=""/>
	<input type="hidden" id="codeIds"       name="codeIds"       value=""/>
	<input type="hidden" id="mode"        name="mode"        value=""/>
</form>
	<h2 class="main_title">코드 관리</h2>

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
				<div id="codeTree" class="tree_menuWrap"></div>
			</div>
		</div>
		
		<div class="rtl_box">
			<!-- s: table wrap-->
			<div class="table_wrap">
				<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
					<colgroup>
						<col width="20%" />
						<col width="80%" />
					</colgroup>
					<tbody>
						<tr>
							<th>· 코드 사용 명</th>
							<td id="code_use_name">
								<span class="normal"></span>
								<input type="text" class="inp_txt w01 modify create" style="display: none;" />
							</td>
						</tr>
						<tr>
							<th>· 코드 ID</th>
							<td id="code_id"></td>
							
						</tr>
						<tr>
							<th>· 상위 코드 ID</th>
							<td id="code_parent"></td>
							
						</tr>
						<tr>
							<th>· 코드 상세 구분</th>
							<td id="code_detail_div">
								<span class="normal"></span>
								<input type="text" class="inp_txt w01 modify create" style="display: none;" />
							</td>
						</tr>
						<tr>
							<th>· 코드 명</th>
							<td id="code_name">
								<span class="normal"></span>
								<input type="text" class="inp_txt w01 modify create" style="display: none;" />
							</td>
						</tr>
						<tr>
							<th>· 코드 내용</th>
							<td id="code_content">
								<span class="normal"></span>
								<input type="text" class="inp_txt w01 modify create" style="display: none;" />
							</td>
						</tr>
						<tr>
							<th>· 사용여부</th>
							<td id="code_use_yn">
								<span class="normal"></span>
								<div class="modify create" style="display: none;">
									<input type="radio" name="code_use_yn" value="Y" checked="checked"/> Y&nbsp;&nbsp;
									<input type="radio" name="code_use_yn" value="N" /> N
								</div>
							</td>
						</tr>
						<tr>
							<th>· 시스템코드 여부</th>
							<td id="systemCodeYn">
								<span class="normal"></span>
								<div class="modify create" style="display: none;">
									<input type="radio" name="systemCodeYn" value="Y" checked="checked"/> Y&nbsp;&nbsp;
									<input type="radio" name="systemCodeYn" value="N" /> N
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e: table wrap -->

			<!-- s: btn wrap 양쪽 정렬-->
			<div class="btn_wrap01">
				<div class="rtl modify create" id="btnmodify" style="display: none;">
					<span class="btn btn_type02 btn_size02"><a href="javascript:save();">저장</a></span>
					<span class="btn btn_type01 btn_size02"><a href="javascript:cancel();">취소</a></span>
				</div>
			</div>
			<!-- e: btn wrap-->
		</div>

	</div>
</div>

