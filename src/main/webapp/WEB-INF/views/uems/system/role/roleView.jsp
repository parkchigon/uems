<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javascript" src="/resources/uems/js/plugin/jstree.min.js"></script>
<script type="text/javascript" src="/resources/uems/js/lib/tree-util-1.0.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/uems/css/themes/default/style.min.css"  /> 
<script type="text/javascript">
$(document).ready(function(){
	refresh();
});

function checkedNode(e, data) {
}

function uncheckedNode(e, data) {
}

function save(id, index) {
	
	// 부모노드의 id까지 저장함.(중복 제거)
	var menuIds = $.tree_get_checked()
		.reduce( function(list, menuId) {
			var id = menuId;
			while ( true ) {
				if (list.indexOf(id) < 0 ) list.push(id);
				id = $.tree_get_parent(id);
				if ( id == "#" ) break;
			}
			return list;
		}, [] );
	
	$("#menuIds").val(menuIds);
	
	$.ajax({
		url: "/uems/system/role/roleMenuRegistExeAjax.do",
		type: "POST",
		data: getFormData($("#frm")),
		contentType: "application/json"
	}).done (function(data) {
		
		$("#frm > #menuIds").val("");
		
		alert("저장되었습니다.");
		
		refresh();
	}).fail (function(data) {
		alert("메뉴 권한 정보 저장에 실패하였습니다.");
		refresh();
	});
}

function refresh() {
	
	$("#menuTree").empty().jstree('destroy');
	var formData = getFormData($("#frm"));
	$("#menuTree").tree_init({
		"url" : "/uems/system/role/roleMenuListConnectByAjax.do",
		"data" : formData,
		"multiple_select" : true,
		"plugins" : [ "checkbox", "search" ],
		"check_node" : { "callback" : checkedNode },
		"uncheck_node" : { "callback" : uncheckedNode },
	});
}

function goProgramRole(roleId) {
	location.href="<c:url value='/uems/system/role/roleProgramView.do?roleId='/>" + roleId;
}

</script>

<div class="contents_wrap">

<form id="frm" name="frm" method="post">
	<input type="hidden" id="roleId"        name="roleId"       value="<c:out value="${role.roleId}" escapeXml="false"/>"/>
	<input type="hidden" id="menuIds"       name="menuIds"      value=""/>
	<input type="hidden" id="mode"          name="mode"         value=""/>
</form>

	<h2 class="main_title">메뉴 권한 관리</h2>
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
				<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
					<colgroup>
						<col width="15%" />
						<col width="85%" />
					</colgroup>
					<tbody>
						<tr>
							<th>· 권한 ID</th>
							<td id="role_id"><c:out value="${role.roleId}" escapeXml="false"/></td>
							
						</tr>
						<tr>
							<th>· 권한 명</th>
							<td id="role_name"><c:out value="${role.roleName}" escapeXml="false"/></td>
						</tr>
						<tr>
							<th>· 사용여부</th>
							<td id="role_use_yn">
								<span><c:out value="${role.useYn}" escapeXml="false"/></span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e: table wrap -->
			<div class="btn_wrap01">
				<div class="rtl">
					<span class="btn btn_type01 btn_size02"><a href="/uems/system/role/roleList.do">목록</a></span>
					<span class="btn btn_type02 btn_size02"><a href="javascript:save();">저장</a></span>
					<span class="btn btn_type01 btn_size02"><a href="javascript:goProgramRole('<c:out value="${role.roleId}" escapeXml="false" />');">프로그램 권한 관리</a></span>
				</div>
			</div>
		</div>
	</div>
</div>
