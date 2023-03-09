<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
$(document).ready(function() {
	
	selectSystemSubmenuSiteList();
	
	// 기타설비 선택 시 버튼 추가
	$("input:checkbox[name=templateIdChk]").change(function() {
		if($(this).is(':checked')) {
			$("#"+$(this).attr("id")+"_chk").show();
		} else {
			$("#"+$(this).attr("id")+"_chk").hide();
		}
	});
	
});

// 기타설비 저장
function etcTypeRegist() {
	
	if($("input:checkbox[name=templateIdChk]:checked").length > 0) {
		if(confirm("기타설비 변경 시 설정된 태그가 삭제 됩니다. 해당 기타설비를 선택하시겠습니까?")) {
			
			$("input:checkbox[name=templateIdChk]").each(function(index) {
				$("#frm").append("<input type='hidden' name='templateList["+index+"].submenuId' value='"+$(this).attr("id")+"'/>");
				$("#frm").append("<input type='hidden' name='templateList["+index+"].templateId' value='"+$(this).val()+"'/>");
				if($(this).is(':checked')) {
					$("#frm").append("<input type='hidden' name='templateList["+index+"].deleteYn' value='N'/>");
				} else {
					$("#frm").append("<input type='hidden' name='templateList["+index+"].deleteYn' value='Y'/>");
				}
			});
			
			$("#frm").attr("action", "/ems/build/etcRegistExe.do");
			$("#frm").submit();
		}
	}
}


// 기타설비 정보 조회
function selectSystemSubmenuSiteList() {
	
	$.ajax({
		url : "/ems/build/selectSystemSubmenuSiteListAjax.do",
		type: "POST",
		data: $("#frm").serialize(),
		dataType : "json"
	}).done( function(data) {
		var list = data.etcList;
		for(var i=0; i<list.length; i++) {
			$("input:checkbox[id="+list[i].submenuId+"]").attr("checked", true);
			$("#"+list[i].submenuId+"_chk").show();
		}
	});
}

</script>

<form id="frm" name="frm" method="POST">	
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="etcSubmenuYn" name="etcSubmenuYn" value="Y" />
</form>		

<div class="build_header_sub_area"><!-- 하단 리스트 선택시 버튼 추가됨 -->
	<strong>기타설비 선택 :</strong>
	<c:forEach var="result" items="${etcTypeList}" varStatus="status">
		<a id="${result.submenuId}_chk" class="btnType btn_type01" href="javascript:;" style="display: none;">${result.templateName}</a>
	</c:forEach>
</div>

<div class="build_all_area" style="height:800px;">

	<div class="etcChoice_area">
		<c:forEach var="result" items="${etcTypeList}" varStatus="status">
			<dl>
				<dd><img src="${result.thumbnailFilePath}" alt="${result.templateName}" /></dd>
				<dt>
					<input type="checkbox" id="${result.submenuId}" name="templateIdChk" value="${result.templateId}" />
					<label for="${result.submenuId}">${result.templateName}</label>
					<input type="hidden" name="submenuId" value="${result.submenuId}" />
				</dt>
			</dl>
		</c:forEach>
	</div>
</div>

<div class="btn_areaC mt20">
	<a class="btnType btn_type02" href="javascript:etcTypeRegist();">저장</a>
</div>
