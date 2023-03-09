<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
$(document).ready(function() {
	selectTagMappingList();
	
	// 알람태그 선택 시 알람태그명 자동 세팅
	$("select[name=alarmTagList], select[name=setTagList]").change(function() {
		var text = $(this).find("option:selected[value="+$(this).val()+"]").text().split("] ");
		$(this).parent().prev().find("input[name=displayName]").val(text[1]);
	});
});

// 태그 매핑 설정
function diagramSetRRegist() {
	if($("select[name=tagList] option:selected[value='']").length > 0) {
		alert("태그ID를 모두 선택하세요.");
		return;
	}
	
	var listIndex = 0;

	$("select[name=alarmTagList], select[name=setTagList]").each(function(index) {
		$("#frm").append("<input type='hidden' name='tagList["+index+"].componentId' value='"+$(this).attr("id")+"'/>");
		$("#frm").append("<input type='hidden' name='tagList["+index+"].tagId' value='"+$(this).val()+"'/>");
		
		// 알람 태그 / 설정관리 일 경우에만 displayName 추가
		$("#frm").append("<input type='hidden' name='tagList["+index+"].displayName' value='"+$(this).parent().prev().find("input[name=displayName]").val()+"'/>");
		listIndex++;
	});
	
	$("select[name=tagList]").each(function(index) {
		$("#frm").append("<input type='hidden' name='tagList["+(index+listIndex)+"].componentId' value='"+$(this).attr("id")+"'/>");
		$("#frm").append("<input type='hidden' name='tagList["+(index+listIndex)+"].tagId' value='"+$(this).val()+"'/>");
	});
	
	$("#frm").attr("action", "/ems/build/diagramSetRegistExe.do");
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
			$("select[name=tagList], select[name=alarmTagList], select[name=setTagList]").each(function(index) {
				if(list[i].componentId == $(this).attr("id")) {
					$(this).val(list[i].tagId);
					$(this).parent().prev().find("input[name=displayName]").val(list[i].displayName);
					return;
				}
			});
		}
	});
}

</script>

<form id="frm" name="frm" method="POST">	
	<input type="hidden" id="redirectUrl" name="redirectUrl" value="/ems/build/diagramSetR.do" />
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="submenuId" name="submenuId" value="${templateInfo.submenuId}" />
	<input type="hidden" id="templateId" name="templateId" value="${templateInfo.templateId}" />
</form>		

<jsp:include page="${templateInfo.setFilePath1}" />
