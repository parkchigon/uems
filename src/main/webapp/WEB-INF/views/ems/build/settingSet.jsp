<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
$(document).ready(function() {
	selectTagMappingList();
});

// 태그 매핑 설정
function settingSetRegist() {
	if($("select[name=tagList] option:selected[value='']").length > 0) {
		alert("태그ID를 모두 선택하세요.");
		return;
	}
	
	$("select[name=tagList]").each(function(index) {
		$("#frm").append("<input type='hidden' name='tagList["+index+"].componentId' value='"+$(this).attr("id")+"'/>");
		$("#frm").append("<input type='hidden' name='tagList["+index+"].tagId' value='"+$(this).val()+"'/>");
	});
	
	$("#frm").attr("action", "/ems/build/settingSetRegistExe.do");
	$("#frm").submit();
}

// 태그 매핑 조회
function selectTagMappingList() {
	
	$.ajax({
		url : "/ems/build/selectTagMappingListAjax.do",
		type: "POST",
		data: $("#frm").serialize(),
		dataType : "json"
	}).done( function(data) {
		var list = data.tagMappingList;
		
		for(var i=0; i<list.length; i++) {
			$("select[name=tagList]").each(function(index) {
				if(list[i].componentId == $(this).attr("id")) {
					$(this).val(list[i].tagId);
					return;
				}
			});
		}
	});
}

</script>

<form id="frm" name="frm" method="POST">	
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="submenuId" name="submenuId" value="${templateInfo.submenuId}" />
	<input type="hidden" id="templateId" name="templateId" value="${templateInfo.templateId}" />
</form>		

<jsp:include page="${templateInfo.setFilePath1}" />
