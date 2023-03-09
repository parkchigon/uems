<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
$(document).ready(function() {
	selectSystemSubmenuSiteList();
	selectTagMappingList();
	
	// 알람태그 선택 시 알람태그명 자동 세팅
	$("select[name=alarmTagList]").change(function() {
		var text = $(this).find("option:selected[value="+$(this).val()+"]").text().split("] ");
		$(this).parent().prev().find("input[name=displayName]").val(text[1]);
	});
	
});

// 태그 매핑 설정
function etcSetRegist() {
	if($("select[name=tagList] option:selected[value='']").length > 0) {
		alert("태그ID를 모두 선택하세요.");
		return;
	}
	
	var listIndex = 0;
	
	$("select[name=alarmTagList]").each(function(index) {
		$("#frm").append("<input type='hidden' name='tagList["+index+"].componentId' value='"+$(this).attr("id")+"'/>");
		$("#frm").append("<input type='hidden' name='tagList["+index+"].tagId' value='"+$(this).val()+"'/>");
		
		// 알람 태그일 경우에만 displayName 추가
		$("#frm").append("<input type='hidden' name='tagList["+index+"].displayName' value='"+$(this).parent().prev().find("input[name=displayName]").val()+"'/>");
		listIndex++;
	});
	
	$("select[name=tagList]").each(function(index) {
		$("#frm").append("<input type='hidden' name='tagList["+(index+listIndex)+"].componentId' value='"+$(this).attr("id")+"'/>");
		$("#frm").append("<input type='hidden' name='tagList["+(index+listIndex)+"].tagId' value='"+$(this).val()+"'/>");
		
	});
	
	$("#frm").attr("action", "/ems/build/etcSetRegistExe.do");
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
			$("select[name=tagList], select[name=alarmTagList]").each(function(index) {
				if(list[i].componentId == $(this).attr("id")) {
					$(this).val(list[i].tagId);
					$(this).parent().prev().find("input[name=displayName]").val(list[i].displayName);
					return;
				}
			});
		}
	});
}

//기타설비 정보 조회
function selectSystemSubmenuSiteList() {
	
	$.ajax({
		url : "/ems/build/selectSystemSubmenuSiteListAjax.do",
		type: "POST",
		data: $("#frm").serialize(),
		dataType : "json"
	}).done( function(data) {
		var list = data.etcList;
		for(var i=0; i<list.length; i++) {
			$("#"+list[i].submenuId+"_chk").show();
			if('${templateInfo.submenuId}' == list[i].submenuId) {
				$("#"+list[i].submenuId+"_chk").removeClass("btn_type01");
				$("#"+list[i].submenuId+"_chk").addClass("btn_type02");
			}
		}
	});
}

// 기타설비 이동 및  좌측/우측 설정 화면 이동
function etcSetView(submenuId, rightSetYn) {
	$("#submenuId").val(submenuId);
	$("#rightSetYn").val(rightSetYn);
	$("#frm").attr("action", "/ems/build/etcSet.do");
	$("#frm").submit();
}

</script>

<form id="frm" name="frm" method="POST">	
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="submenuId" name="submenuId" value="${templateInfo.submenuId}" />
	<input type="hidden" id="templateId" name="templateId" value="${templateInfo.templateId}" />
	<input type="hidden" id="rightSetYn" name="rightSetYn" value="${rightSetYn}"/>
</form>

<div class="build_header_sub_area"><!-- 하단 리스트 선택시 버튼 추가됨 -->
	<strong>기타설비 선택 :</strong>
	<c:forEach var="result" items="${etcTypeList}" varStatus="status">
		<a id="${result.submenuId}_chk" class="btnType btn_type01" href="javascript:etcSetView('${result.submenuId}', 'N');" style="display: none;">${result.templateName}</a>
	</c:forEach>
</div>
<c:choose>
	<c:when test="${empty rightSetYn or rightSetYn eq 'N'}">
		<!-- 기본설정 및 좌측설정일 경우에는 setFilePath1 -->
		<jsp:include page="${templateInfo.setFilePath1}" />
	</c:when>
	<c:otherwise>
		<!-- 우측설정일 경우에는 setFilePath2 -->
		<jsp:include page="${templateInfo.setFilePath2}" />
	</c:otherwise>
</c:choose>

