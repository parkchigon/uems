<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>

<script type="text/javascript">

	$(document).ready(function() {
		var rtId = '${reportTempleteView.rtId}';
		if(rtId != '') {
			$("#btnDelete").show();
			$("#fileSettingYn").val("Y");
			var selectedGroupId = $("#siteGroup option:selected").attr("sgId");
			
			$("#site option").hide();
			$("#site option[sgId = "+selectedGroupId+"]").show();
			
		} else {
			showSiteList();
		}
	});

	function showSiteList() {
		var selectedGroupId = $("#siteGroup option:selected").attr("sgId");
		
		$("#site option").hide();
		$("#site option[sgId = "+selectedGroupId+"]").show();


		if($("#site option[sgId = "+selectedGroupId+"]").length == 0) {
			$("#site").append('<option value="" sgId="'+selectedGroupId+'" selected>없음</option>');
		} else {
			$("#site option[sgId = "+selectedGroupId+"]").first().attr("selected", true);
		}
	}
	
	function reportTempletRegist() {
		
		var groupId = $("#siteGroup option:selected").val();
		var siteId = $("#site option:selected").val()
		var reportType = $("#reportType option:selected").val();
		if(formValidationCheck(['templateName'])) {
			if(!$("#reportTemplteFile").val() && $("#fileSettingYn").val() == "N") {
				alert("템플릿 파일을 등록 해주세요.");
				return;
			} else {
				
				var confirmMsg = "";
				var rtId = '${reportTempleteView.rtId}';
				if(rtId != '') {
					confirmMsg = "수정한 템플릿을 저장 하시겠습니까?";
				} else {
					confirmMsg = "템플릿을 업로드 하시겠습니까?";
				}
				if(confirm(confirmMsg)) {
					var f = document.frm;
					f.action = "<c:url value='/uems/mng/report/reportTempletRegistExe.do'/>";
					
					if(!$("#reportTemplteFile").val()) {
						$("#reportTemplteFile").attr("name", "");
					}
					
					$("#frm").ajaxSubmit({
						success:function(responseText, statusText){
							var resultCode = responseText.resultCode;
							console.log(responseText);
							console.log(statusText);
							if(resultCode == "0000") {
								location.href = "/uems/mng/report/reportTempletList.do";
							} else if(resultCode == "9999") {
								alert("동일한 종류의 보고서 템플릿이 등록되어 있습니다.\n해당 템플릿 삭제 후 다시 시도하세요.");
								return;
							}
							
						},
						error:function(){
							alert("보고서 템플릿 등록에 실패하였습니다.");
						}
					});
				}
			}
		}
	}
	
	function reportTempletCancel() {
		
		var confirmMsg = '';
		var rtId = '${reportTempleteView.rtId}';
		if(rtId != '') {
			confirmMsg = "템플릿 수정을 취소하시겠습니까?";
		} else {
			confirmMsg = "템플릿 등록을 취소하시겠습니까?";
		}
		
		if(confirm(confirmMsg)) {
			window.history.back();
		}
	}
	
	function reportTempletDelete() {
		if(confirm("템플릿을 삭제 하시겠습니까?")) {
			$("#reportTemplteFile").attr("name", "");

			var f = document.frm;
			f.action = "<c:url value='/uems/mng/report/reportTempletDelete.do'/>";
			f.submit();
		}
		
	}
	function alertMessageSource(el_id) {
		switch (el_id) {
		case 'templateName':
			alert('제목을 입력해주세요.');
			break;
		}
	}
	
	function checkUploadTempletFile(fileObj) {
		
		if(fileObj.value != '') {
			var filePath = fileObj.value;
			var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
			var fileArr = fileName.split(".");
			var fileExt = fileArr[fileArr.length-1].toUpperCase();
	
			if(fileExt != "XLS" && fileExt != "XLSX") {
				alert("파일형식을 확인해주세요.");
				$("#reportTemplteFile").val('');
				return;
			}
	
			//console.log(fileObj.files[0].size);
			if(fileObj.files[0].size > 104857600) {
				alert("업로드 가능한 파일 사이즈를\n초과하셨습니다.");
				$("#reportTemplteFile").val('');
				return;
			}
		}
	}
</script>

<div class="contents_wrap">
<form:form commandName="report" name="frm" id="frm" method="post">
	<form:hidden path="rtId" value="${reportTempleteView.rtId}"/>	
	<form:hidden path="fileServerPath" value="${reportTempleteView.fileServerPath}"/>	
	<form:hidden path="fileName" value="${reportTempleteView.fileName}"/>
	<form:hidden path="reportSubType" value="${reportTempleteView.reportSubType}"/>	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">보고서관리 - 보고서 템플릿관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;보고서 템플릿을 등록, 삭제를 관리합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
			<colgroup>
				<col width="8%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tbody>
				<tr>
					<th>지점명</th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="siteGroup" name="siteGroupCd" onchange="javascript:showSiteList();">
							<c:if test="${fn:length(siteGroupList) eq 0}">
								<option>-</option>
							</c:if>
								
							<c:forEach var="siteGroup" items="${siteGroupList}" varStatus="status">
								<option value="">미선택</option>
								<c:if test="${reportTempleteView.sgId eq siteGroup.sgId}">
								<option value="${siteGroup.sgId}" sgId="${siteGroup.sgId}" selected="selected">${siteGroup.sgName}</option>
								</c:if>
								<c:if test="${reportTempleteView.sgId ne siteGroup.sgId}">
								<option value="${siteGroup.sgId}" sgId="${siteGroup.sgId}">${siteGroup.sgName}</option>
								</c:if>								
							</c:forEach>
							</select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="site" name="siteId">
							<c:if test="${fn:length(siteList) eq 0}">
								<option>-</option>
							</c:if>
							<c:if test="${fn:length(siteList) ne 0}">
								<c:forEach var="site" items="${siteList}" varStatus="status">
									<c:if test="${reportTempleteView.siteId eq site.siteId}">
									<option value="${site.siteId}" sgId="${site.sgId}" selected="selected" style="display: none;" >${site.siteName}</option>
									</c:if>
									<c:if test="${reportTempleteView.siteId ne site.siteId}">
									<option value="${site.siteId}" sgId="${site.sgId}" style="display: none;" >${site.siteName}</option>
									</c:if>
								</c:forEach>
							</c:if>
							</select>
						</span>
					</td> 
				</tr>
				<tr>
					<th>종류 *</th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="reportType" name="reportType">
							<c:choose>
							<c:when test="${reportTempleteView.reportType eq 'M'}">
								<option value="M" selected="selected">월간</option>
								<option value="Y">연간</option>
							</c:when>
							<c:when test="${reportTempleteView.reportType eq 'Y'}">
								<option value="M">월간</option>
								<option value="Y" selected="selected">연간</option>
							</c:when>
							<c:otherwise>
								<option value="M" selected="selected">월간</option>
								<option value="Y">연간</option>
							</c:otherwise>
							</c:choose>
							</select>
						</span>
					</td> 
				</tr>
				<tr>
					<th>제목 *</th>
					<td>
						<input type="text" style="width:800px" id="templateName" name="templateName" class="inp_txt w01" value="<c:out value="${reportTempleteView.templateName}" escapeXml="false"/>">
					</td> 
				</tr>
				<tr>
					<th>첨부파일 *</th>
					<td>
						<p>&nbsp;&nbsp;※ 확장자는 xls,xlsx형식이고, 파일사이즈는 최대 10MB 미만.</p>
						<input type="file" id="reportTemplteFile" name="reportTemplteFile" accept=".xls, .xlsx" onchange="checkUploadTempletFile(this);">
						<input type="hidden" id="fileSettingYn" value="N"/>
						<!-- 
						<div class="gp01">
							<div class="fileSet_wrap">
								<span class="btn btn_type01 btn_size02">
									<a href="/uems/common/attachfile/attachfilePopup.do" class="btnFile" onclick="fxPopFileCenter('/uems/common/attachfile/attachfilePopup.do?fileset=board&amp;fileGroup=board','filepop',404,452,'no'); return false;"><i class="fa fa-upload"></i> 파일 업로드</a>
								</span>
							</div>	
						</div>
						 -->
					</td> 
				</tr>
			</tbody>
		</table>
	</div>
	<!-- s: btn wrap 가운데 정렬-->
	<div class="btn_wrap02">
		<span class="btn btn_type02 btn_size03"><a href="javascript:reportTempletRegist();">저장</a></span>
		<span class="btn btn_type03 btn_size03" id="btnDelete" style="display: none;"><a href="javascript:reportTempletDelete();">삭제</a></span>
		<span class="btn btn_type01 btn_size03"><a href="javascript:reportTempletCancel();">취소</a></span>
	</div>
	<!-- e: btn wrap-->
</form:form>
</div>
