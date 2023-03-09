<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		
		setTextLengthLimit("input[name=tagId]", 7);
		setTextLengthLimit("input[name=tagDesc]", 10);
		setTextLengthLimit("input[name=aiCalcScript]", 50);
		setTextLengthLimit("input[name=aoCalcScript]", 50);
		setTextLengthLimit("input[name=dOnDescription]", 50);
		setTextLengthLimit("input[name=dOffDescription]", 50);
		
		
		goSearch('reg_date', 'DESC');
		
		// AI 계산필터 > 스크립트 선택 시
		$("input:radio[name=aiCalcFilterCd]").change(function() {
			var checkedVal = $(this).val();
			if(checkedVal == 'AI_CALC_FILTER6') {
				$("input[name=aiCalcScript]").attr("disabled", false);
			} else {
				$("input[name=aiCalcScript]").attr("disabled", true);
			}
		});
		
		// AO 계산필터 > 스크립트 선택 시
		$("input:radio[name=aoCalcFilterCd]").change(function() {
			var checkedVal = $(this).val();
			if(checkedVal == 'AO_CALC_FILTER3') {
				$("input[name=aoCalcScript]").attr("disabled", false);
			} else {
				$("input[name=aoCalcScript]").attr("disabled", true);
			}
		});
		
		// AIO 출력으로 사용 체크 시
		$("input:checkbox[name=iOutputUseFlagChk]").change(function () {
			if($(this).is(':checked')) {
				$("#aiOutputUseDiv1, #aiOutputUseDiv2").find("input").attr("disabled", false);
				$("#diOutputUseDiv1, #diOutputUseDiv2").find("input").attr("disabled", false);
			} else {
				$("#aiOutputUseDiv1, #aiOutputUseDiv2").find("input").attr("disabled", true);
				$("#diOutputUseDiv1, #diOutputUseDiv2").find("input").attr("disabled", true);
			}
		});
		
		// 리스트 헤더영역 선택 시 리스트 정렬
		$(".lineUp").click(function() {
			var orderColumn = $(this).attr("id");
			var orderType = "DESC";
			
			// 오름차순 : listUp, 내림차순 : listDown
			if(!$(this).hasClass("listUp") && !$(this).hasClass("listDown")) {
				$(this).addClass("listDown");
			} else if($(this).hasClass("listUp")) {
				$(this).removeClass("listUp");
				$(this).addClass("listDown");
			}  else if($(this).hasClass("listDown")) {
				$(this).removeClass("listDown");
				$(this).addClass("listUp");
				orderType = "ASC";
			}
			
			goSearch(orderColumn, orderType);
		});
		
	});
	
	// 태그 등록 및 수정
	function tagRegist(tagTypeCd, formId) {
		
		if (formValidationCheck([formId+' #tagId', formId+' #tagDesc'])){
			if(confirm("해당 태그를 저장하시겠습니까?")) {
				if($("#"+formId+" #useFlagChk").is(':checked')) {	// 태그 사용 여부
					$("#"+formId+" input[name=useFlag]").val("Y");
				} else {
					$("#"+formId+" input[name=useFlag]").val("N");
				}
				if($("#"+formId+" #iAlarmUseFlagChk").is(':checked')) {	// 경보 사용 여부
					$("#"+formId+" input[name=iAlarmUseFlag]").val("Y");
					if(tagTypeCd == "TAG_TYPE3") {		// DI일 경우에만 tagKindCd '알람'으로 세팅
						$("#"+formId+" input[name=tagKindCd]").val("TAG_KIND10");	
					} else {
						$("#"+formId+" input[name=tagKindCd]").val("TAG_KIND11");
					}
				} else {
					$("#"+formId+" input[name=iAlarmUseFlag]").val("N");
				}
				if($("#"+formId+" #iDataSaveFlagChk").is(':checked')) {	// 통계자료 저장 여부
					$("#"+formId+" input[name=iDataSaveFlag]").val("Y");
				} else {
					$("#"+formId+" input[name=iDataSaveFlag]").val("N");
				}
				if($("#"+formId+" #iOutputUseFlagChk").is(':checked')) {	// 출력 사용 여부
					$("#"+formId+" input[name=iOutputUseFlag]").val("Y");
				} else {
					$("#"+formId+" input[name=iOutputUseFlag]").val("N");
				}
				
				$("#"+formId+" input[name=tagTypeCd]").val(tagTypeCd);
				$("#"+formId).attr("action", "/ems/build/tagRegistExe.do");
				$("#"+formId).submit();
			}
		}
	}
	
	// 태그 리스트 조회
	function goSearch(orderColumn, orderType) {
		
		var siteCd = $("#siteCd").val();
		
		$.ajax({
			url : "/ems/build/selectTagListAjax.do",
			type: "POST",
			data: {siteCd : siteCd
					, orderColumn : orderColumn
					, orderType : orderType},
			dataType : "json",
		}).done( function(data) {
			var list = data.tagList;
			var html = "";
			if(list != null) {
				for(var i=0; i<list.length; i++) {
					html += "<tr>";
					html += "	<td>";
					html += "		<input type='checkbox' id='tagIdChk_"+list[i].tagId+"' name='tagIdChk' value='"+list[i].tagId+"' />";
					html += "		<label for='tagIdChk_"+list[i].tagId+"'>"+list[i].tagTypeCdName+"</label>";
					html += "	</td>";
					html += "	<td><a class='underline' href='javascript:openTagModifyPop(\""+list[i].tagTypeCdName+"\", \""+list[i].tagId+"\")';>"+list[i].tagId+"</a></td>";
					html += "	<td><a class='underline' href='javascript:openTagModifyPop(\""+list[i].tagTypeCdName+"\", \""+list[i].tagId+"\")';>"+list[i].tagDesc+"</a></td>";
					html += "	<td>"+list[i].useFlag+"</td>";
					html += "	<td>"+list[i].oPlcscanStation+"</td>";
					html += "	<td>"+list[i].iPlcscanAddress+"</td>";
					html += "	<td>"+list[i].oPlcscanAddress+"</td>";
					html += "	<td>"+list[i].oPlcscanExtra1+"</td>";
					html += "</tr>";
				}
				
				 $("#tagListTbody").empty();
				 $("#tagListTbody").append(html);
			}
		});
	}
	
	// 태그 팝업 open
	function openTagRegistPop(tagType, registYn) {
		var id = "";
		if(tagType == "AI") {
			id = "#layerPop_type1";
		} else if(tagType == "AO") {
			id = "#layerPop_type2";
		} else if(tagType == "DI") {
			id = "#layerPop_type3";
		} else {
			id = "#layerPop_type4";
		}
		
		$("input[name=registYn]").val(registYn);
		openMaskPopup(id);
		
		if($("input[name=registYn]").val() == "Y") {
			$("a[id$=DeleteBtn]").hide();
			$("#"+tagType+"TagForm #tagId").attr("readonly", false);
			defaultValueSetting(tagType, id);
		} else {
			$("a[id$=DeleteBtn]").show();
			$("#"+tagType+"TagForm #tagId").attr("readonly", true);	// 태그ID 수정 불가
		}
	}
	
	// 태그 수정 정보 조회
	function openTagModifyPop(tagType, tagId) {
		openTagRegistPop(tagType, 'N');
		
		var siteCd = $("#siteCd").val();
		
		$.ajax({
			url : "/ems/build/selectTagViewAjax.do",
			type: "POST",
			data: {siteCd : siteCd
					, tagId : tagId},
			dataType : "json",
		}).done( function(data) {
			var tagInfo = data.tagInfo;
			var key = Object.keys(tagInfo);
			var value = Object.values(tagInfo);
			for(var i=0; i<key.length; i++) {
				$("#"+tagType+"TagForm #"+key[i]).val(value[i]);
			}
			// 라디오,체크박스 값 세팅
			$("#"+tagType+"TagForm input:radio[name=aiMemtypeCd]:input[value="+tagInfo.aiMemtypeCd+"]").attr("checked", true);
			$("#"+tagType+"TagForm input:radio[name=aiCalcFilterCd]:input[value="+tagInfo.aiCalcFilterCd+"]").attr("checked", true);
			$("#"+tagType+"TagForm input:radio[name=aiAccumulateFlag]:input[value="+tagInfo.aiAccumulateFlag+"]").attr("checked", true);
			if(tagInfo.aiCalcFilterCd == "AI_CALC_FILTER6") {
				$("#"+tagType+"TagForm #aiCalcScript").attr("disabled", false);
			} else {
				$("#"+tagType+"TagForm #aiCalcScript").attr("disabled", true);	
			}
			$("#"+tagType+"TagForm input:radio[name=aCutoverValueCd]:input[value="+tagInfo.aCutoverValueCd+"]").attr("checked", true);
			$("#"+tagType+"TagForm input:radio[name=aoCalcFilterCd]:input[value="+tagInfo.aoCalcFilterCd+"]").attr("checked", true);
			if(tagInfo.aoCalcFilterCd == "AO_CALC_FILTER3") {
				$("#"+tagType+"TagForm #aoCalcScript").attr("disabled", false);
			} else {
				$("#"+tagType+"TagForm #aoCalcScript").attr("disabled", true);
			}
			$("#"+tagType+"TagForm input:radio[name=doRelayTypeCd]:input[value="+tagInfo.doRelayTypeCd+"]").attr("checked", true);
			
			if(tagInfo.useFlag == "Y") {
				$("#"+tagType+"TagForm input:checkbox[name=useFlagChk]").attr("checked", true);
			} else {
				$("#"+tagType+"TagForm input:checkbox[name=useFlagChk]").attr("checked", false);
			}
			if(tagInfo.iDataSaveFlag == "Y") {
				$("#"+tagType+"TagForm input:checkbox[name=iDataSaveFlagChk]").attr("checked", true);
			} else {
				$("#"+tagType+"TagForm input:checkbox[name=iDataSaveFlagChk]").attr("checked", false);
			}
			
			if(tagInfo.iOutputUseFlag == "Y") {
				$("#"+tagType+"TagForm input:checkbox[name=iOutputUseFlagChk]").attr("checked", true);
			} else {
				$("#"+tagType+"TagForm input:checkbox[name=iOutputUseFlagChk]").attr("checked", false);
			}
			if(tagInfo.iAlarmUseFlag == "Y") {
				$("#"+tagType+"TagForm input:checkbox[name=iAlarmUseFlagChk]").attr("checked", true);
			} else {
				$("#"+tagType+"TagForm input:checkbox[name=iAlarmUseFlagChk]").attr("checked", false);
			}
			
			
		});
	}

	// 등록 시 기본값 세팅
	function defaultValueSetting(tagType, id) {
		$("input:text, select").val("");
		$("input:checkbox[name=useFlagChk], input:checkbox[name=iDataSaveFlagChk]").attr("checked", true);
		switch (tagType) {
			case "AI":
				$(id + " #aiOutputUseDiv1, #aiOutputUseDiv2").find("input").attr("disabled", true);
				$(id + " input:radio[name=aCutoverValueCd]:eq(0)").attr("checked", true);
				$(id + " input:radio[name=aoCalcFilterCd]:eq(0)").attr("checked", true);
			break;
			case "AO":
				$(id + " input:radio[name=aCutoverValueCd]:eq(0)").attr("checked", true);
				$(id + " input:radio[name=aoCalcFilterCd]:eq(0)").attr("checked", true);
				break;
			case "DI":
				$(id + " #diOutputUseDiv1, #diOutputUseDiv2").find("input").attr("disabled", true);
				break;
			case "DO":
				break;				
		}
	}
	
	// 태그 삭제
	function deleteTag(formId) {
		var tagId = $("#"+formId+" #tagId").val();
		if(confirm("태그 '"+tagId+"'를 삭제하시겠습니까?")) {
			var tagIdArr = new Array();
			tagIdArr.push(tagId);
			
			$("input[name=tagIdArr]").val(tagIdArr);
			$("#tagListForm").attr("action", "/ems/build/tagRemoveExe.do");
			$("#tagListForm").submit();
		}
	}
	
	// 태그 리스트 삭제
	function deleteTagList() {
		if($("input:checkbox[name=tagIdChk]:checked").length > 0) {
			if(confirm("선택한 태그를 삭제하시겠습니까?")) {
				var tagIdArr = new Array();
				$("input:checkbox[name=tagIdChk]:checked").each(function() {
					tagIdArr.push($(this).val());
				});
				
				$("input[name=tagIdArr]").val(tagIdArr);
				$("#tagListForm").attr("action", "/ems/build/tagRemoveExe.do");
				$("#tagListForm").submit();
			}
		} else {
			alert("태그ID를 선택해주세요.");
			return;
		}
	}
	
	//validation 관련 alert 메시지
	function alertMessageSource(el_id){
		if(el_id.endsWith("tagId")) {
			alert("태그 ID를 입력해주세요.");
			return;
		} else if(el_id.endsWith("tagDesc")) {
			alert("태그 설명을 입력해주세요.");
			return;
		}
	}
	
	// 엑셀 업로드
	function excelUpload(fileObj) {
		var filePath = fileObj.value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
		var fileArr = fileName.split(".");
		var fileKind = fileArr[fileArr.length-1];
		
		$("#excelUploadForm").submit();
		showLoading();
	}
	
	// 엑셀 다운로드
	function excelDownload() {
		$("#tagListForm").attr("action", "/ems/build/tagListExcelDownload.do");
		$("#tagListForm").submit();
	}
	
</script>
<form id="tagListForm" name="tagListForm" method="POST">	
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}" />
	<input type="hidden" id="tagIdArr" name="tagIdArr" />
	<input type="hidden" id="formId" name="formId" />
</form>		
<div class="build_all_area">
	
	<table class="data_row">
	<caption>caption</caption>
	<colgroup>
		<col width="100px">
		<col width="200px">
		<col width="*">
		<col width="150px">
		<col width="200px">
		<col width="200px">
		<col width="200px">
		<col width="200px">
	</colgroup>
		<thead>
			<tr>
				<th><a href="javascript:;" id="tag_type_cd" class="lineUp">종류</a></th><!-- 오름차순 : listUp, 내림차순 : listDown -->
				<th><a href="javascript:;" id="tag_id" class="lineUp">태그</a></th>
				<th><a href="javascript:;" id="tag_desc" class="lineUp">설명</a></th>
				<th><a href="javascript:;" id="use_flag" class="lineUp">사용</a></th>
				<th><a href="javascript:;" id="o_plcscan_station" class="lineUp">Station</a></th>
				<th><a href="javascript:;" id="i_plcscan_address" class="lineUp">Addr_In</a></th>
				<th><a href="javascript:;" id="o_plcscan_address" class="lineUp">Addr_Out</a></th>
				<th><a href="javascript:;" id="o_plcscan_extra1" class="lineUp">Extra1</a></th>
			</tr>
		</thead>
		<tbody id="tagListTbody">
		</tbody>
	</table>
	
</div>

<div class="btn_areaR mt20">
	<span class="fl">
		<a class="btnType btn_type02" href="javascript:openTagRegistPop('AI', 'Y');" >AI추가</a>
		<a class="btnType btn_type02" href="javascript:openTagRegistPop('AO', 'Y');" >AO추가</a>
		<a class="btnType btn_type02" href="javascript:openTagRegistPop('DI', 'Y');" >DI추가</a>
		<a class="btnType btn_type02" href="javascript:openTagRegistPop('DO', 'Y');" >DO추가</a>
	</span>
	<div class="filebox"> 
		<label for="ex_fileUp" class="btnType btn_type01">엑셀가져오기</label> 
		<form id="excelUploadForm" name="excelUploadForm" method="POST" enctype="multipart/form-data" action="/ems/build/tagListExcelUpload.do">
			<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}" />
			<input type="file" id="ex_fileUp" name="uploadFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" onchange="excelUpload(this);"/>
		</form>
	</div>
	
	<a class="btnType btn_type01" href="javascript:excelDownload();">엑셀내보내기</a>
	<a class="btnType btn_type01" href="javascript:deleteTagList();">태그 삭제</a>
</div>

<!-- s : popup container -->
<form id="AITagForm" name="AITagForm">	
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}" />
	<input type="hidden" id="tagTypeCd" name="tagTypeCd" />
	<input type="hidden" id="registYn" name="registYn" />
	<input type="hidden" id="useFlag" name="useFlag" value="N" />
	<input type="hidden" id="iAlarmUseFlag" name="iAlarmUseFlag" value="N" />
	<input type="hidden" id="iDataSaveFlag" name="iDataSaveFlag" value="N" />
	<input type="hidden" id="iOutputUseFlag" name="iOutputUseFlag" value="N" />
	<div class="popup_container ai" id="layerPop_type1">
		<div class="popup_inner">
			<div class="popup_header"><h2>AI추가</h2></div> 
			<div class="popup_body">
				<div class="popup_content">
	 			 			
					<div class="main_content">
					
						<!-- s: pop wrap-->
						<div class="build_content">
							<div class="build_layer_inner">
								<table class="build_row">
								<caption>caption</caption>
								<colgroup>
									<col width="60px">
									<col width="*">
								</colgroup>
				
									<tbody>
										<tr>
											<th><label for="">사용</label></th>
											<td>
												<input type="checkbox" id="useFlagChk" name="useFlagChk" checked="checked" />
											</td>
										</tr>
										<tr>
											<th><label for="">이름</label></th>
											<td>
												<input type="text" id="tagId" name="tagId" maxlength=7 style="width: 210px" />
											</td>
										</tr>
										<tr>
											<th><label for="">설명</label></th>
											<td>
												<input type="text" id="tagDesc" name="tagDesc" style="width: 210px" />
											</td>
										</tr>
										<tr>
											<th><label for="">태그유형</label></th>
											<td>
												<select id="tagKindCd" name="tagKindCd" style="width: 212px">
													<c:forEach var="result" items="${tagKindCdId}" varStatus="status">
														<option value="${result.codeUseName}">${result.codeName}</option>	
													</c:forEach>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="build_layer">
									<p class="build_layer_title">메모리종류</p>
									<input type="radio" id="aiMemtypeCd_0" name="aiMemtypeCd" checked="checked" value="AI_MEMTYPE01" /><label for="aiMemtypeCd_0">WORD</label><br />
									<input type="radio" id="aiMemtypeCd_1" name="aiMemtypeCd" value="AI_MEMTYPE05" /><label for="aiMemtypeCd_1">DWORD</label><br />
									<input type="radio" id="aiMemtypeCd_2" name="aiMemtypeCd" value="AI_MEMTYPE06" /><label for="aiMemtypeCd_2">int</label><br />
									<input type="radio" id="aiMemtypeCd_3" name="aiMemtypeCd" value="AI_MEMTYPE08" /><label for="aiMemtypeCd_3">word HL</label><br />
									<input type="radio" id="aiMemtypeCd_4" name="aiMemtypeCd" value="AI_MEMTYPE09" /><label for="aiMemtypeCd_4">word LH</label>
								</div>
							</div>
							
							<div class="build_layer_area layer01">
								<p class="title">AI</p>
								
								<div class="dp_ib">
									<div class="build_layer"  style="height : 90px">
										<p class="build_layer_title">PLC_SCAN</p>
										
										<table class="build_row">
										<caption>caption</caption>
										<colgroup>
											<col width="60px">
											<col width="*">
										</colgroup>
						
											<tbody>
												<tr>
													<th><label for="">주소</label></th>
													<td>
														<input type="text" id="iPlcscanAddress" name="iPlcscanAddress" maxlength=10 />
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<table class="build_row mt10">
									<caption>caption</caption>
									<colgroup>
										<col width="60px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">단위</label></th>
												<td>
													<select id="aiUnitCd" name="aiUnitCd" style="width: 202px">
														<c:forEach var="result" items="${aiUnitCdId}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="">표시형식</label></th>
												<td>
													<input type="text" id="aiDisplayFormat" name="aiDisplayFormat" style="width: 200px" maxlength=4 />
												</td>
											</tr>
										</tbody>
									</table>
									<p class="list_tit">검색시간</p>
									<p><input type="text" id="iScanTime" name="iScanTime" style="width: 200px" maxlength=5 /> 밀리초</p>
								</div>
								
								<div class="build_layer">
									<p class="build_layer_title">계산필터</p>
									<p class="list"><input type="radio" id="aiCalcFilterCd_0" name="aiCalcFilterCd" value="AI_CALC_FILTER1" checked="checked" /><label for="aiCalcFilterCd_0">비례적</label></p>
									<p class="list"><input type="radio" id="aiCalcFilterCd_1" name="aiCalcFilterCd" value="AI_CALC_FILTER3"/><label for="aiCalcFilterCd_1">계측기 값</label></p>
									<p class="list">
										<input type="radio" id="aiCalcFilterCd_2" name="aiCalcFilterCd" value="AI_CALC_FILTER6" /><label for="aiCalcFilterCd_2">스크립트</label><br />
										<input type="text" id="aiCalcScript" name="aiCalcScript" disabled />
									</p>
									
									<p class="list_tit">계산범위 초과시</p>
									<c:forEach var="result" items="${aCutovervalueCd}" varStatus="status">
										<p class="list">
											<input type="radio" id="ai_aCutoverValueCd_${status.index}" name="aCutoverValueCd" value="${result.codeUseName}" />
											<label for="ai_aCutoverValueCd_${status.index}">${result.codeName}</label>
										</p>
									</c:forEach>
								</div>
								
								<div class="build_layer" style="height : 280px; ">
									<p class="build_layer_title">변환값</p>
									<table class="build_row">
									<caption>caption</caption>
									<colgroup>
										<col width="60px">
										<col width="*">
									</colgroup>
										<tbody>
											<tr>
												<th><label for="">Full</label></th>
												<td>
													<input type="text" id="aConvertBase" name="aConvertBase" maxlength=18 />
												</td>
											</tr>
											<tr>
												<th><label for="">Base</label></th>
												<td>
													<input type="text" id="aConvertFull" name="aConvertFull"  maxlength=18 />
												</td>
											</tr>
											<tr>
												<th><label for="">PlcFull</label></th>
												<td>
													<input type="text" id="aConvertPlcfull" name="aConvertPlcfull" maxlength=18 />
												</td>
											</tr>
											<tr>
												<th><label for="">PlcBase</label></th>
												<td>
													<input type="text" id="aConvertPlcbase" name="aConvertPlcbase" maxlength=18 />
												</td>
											</tr>
										</tbody>
									</table>
									<br />
									<p class="build_layer_title">적산값 여부</p>
									<p class="list">
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="aiAccumulateFlag_0" name="aiAccumulateFlag" value="Y"  /><label for="aiAccumulateFlag_0">예</label>
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="aiAccumulateFlag_1" name="aiAccumulateFlag" value="N" checked="checked"/><label for="aiAccumulateFlag_1">아니요</label>
									</p>
								</div>
							</div>
							
							<div class="build_layer_area layer02">
								<p class="title">AIO</p>
								
								<p class="mb10"><input type="checkbox" id="iOutputUseFlagChk" name="iOutputUseFlagChk" /><label for="iOutputUseFlag">출력으로 사용</label></p>
								
								<div class="build_layer" id="aiOutputUseDiv1">
									<p class="build_layer_title">PLC_SCAN</p>
									
									<table class="build_row">
									<caption>caption</caption>
									<colgroup>
										<col width="60px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">스테이션</label></th>
												<td>
													<input type="text" id="oPlcscanStation" name="oPlcscanStation" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">주소</label></th>
												<td>
													<input type="text" id="oPlcscanAddress" name="oPlcscanAddress" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra1</label></th>
												<td>
													<input type="text" id="oPlcscanExtra1" name="oPlcscanExtra1" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra2</label></th>
												<td>
													<input type="text" id="oPlcscanExtra2" name="oPlcscanExtra2" maxlength=10 />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="build_layer mt20" id="aiOutputUseDiv2">
									<p class="build_layer_title">계산필터</p>
									<c:forEach var="result" items="${aoCalcfilterCdId}" varStatus="status">
										<p class="list">
											<input type="radio" id="ai_aoCalcFilterCd_${status.index}" name="aoCalcFilterCd" value="${result.codeUseName}" />
											<label for="ai_aoCalcFilterCd_${status.index}">${result.codeName}</label>
											<c:if test="${result.codeUseName eq 'AO_CALC_FILTER3' }">
												<input type="text" id="aoCalcScript" name="aoCalcScript" disabled />
											</c:if>
										</p>
									</c:forEach>
								</div>
							</div>
							
							<div class="build_layer_area layer03">
								<p class="title">경보</p>
								
								<div class="build_layer2">
									<p class="mb10">
										<input type="checkbox" id="iAlarmUseFlagChk" name="iAlarmUseFlagChk" /><label for="iAlarmUseFlag">경보 사용</label>&nbsp;&nbsp;
										<input type="checkbox" id="iDataSaveFlagChk" name="iDataSaveFlagChk" checked /><label for="">통계자료저장</label>
									</p>
								
									<table class="build_row mt10">
									<caption>caption</caption>
									<colgroup>
										<col width="120px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">경보조건</label></th>
												<td>
													<select id="aiAlarmTypeCd" name="aiAlarmTypeCd" style="width: 200px">
														<c:forEach var="result" items="${aiAlarmtypeCdId}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="">우선순위</label></th>
												<td>
													<select id="iAlarmPriorityCd" name="iAlarmPriorityCd" style="width: 200px">
														<c:forEach var="result" items="${iAlarmpriorityCdid}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="">경보음성파일</label></th>
												<td>
													<select id="iAlarmWavCd" name="iAlarmWavCd" style="width: 200px">
														<c:forEach var="result" items="${iAlarmwavCdid}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="">경보그래픽파일</label></th>
												<td>
													<select id="iAlarmImgCd" name="iAlarmImgCd" style="width: 200px">
														<c:forEach var="result" items="${iAlarmimgCdid}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="build_layer">
									<p class="build_layer_title">경보레벨</p>
									
									<table class="build_row">
									<caption>caption</caption>
									<colgroup>
										<col width="60px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">High</label></th>
												<td>
													<input type="text" id="aiAlarmHigh" name="aiAlarmHigh" maxlength=18 />
												</td>
											</tr>
											<tr>
												<th><label for="">Low</label></th>
												<td>
													<input type="text" id="aiAlarmLow" name="aiAlarmLow" maxlength=18 />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="build_layer2 ml20">
									<p class="list_tit">과변화시 경보지연</p>
									<p><input type="text" id="aiAlarmProtectPercent" name="aiAlarmProtectPercent" style="width: 200px" maxlength=5 /> % 변화시</p>
									<p><input type="text" id="aiAlarmProtectSecond" name="aiAlarmProtectSecond" style="width: 200px" maxlength=5 /> 초간 지연</p>
								</div>
							</div>
						</div>
						<!-- s: btn wrap 가운데 정렬-->
						<div class="pop_btn_wrap">
							<a class="pop_btn btn_type02" href="javascript:tagRegist('TAG_TYPE1', 'AITagForm');">저장</a>
							<a id="aiDeleteBtn" class="pop_btn btn_type01" href="javascript:deleteTag('AITagForm');">삭제</a>
							<a class="pop_btn btn_type01" href="javascript:closeMaskPopup();">취소</a>
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</div>
</form>
<form id="AOTagForm" name="AOTagForm">	
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}" />
	<input type="hidden" id="tagTypeCd" name="tagTypeCd" />
	<input type="hidden" id="registYn" name="registYn" />
	<input type="hidden" id="useFlag" name="useFlag" value="N" />
	<div class="popup_container ao" id="layerPop_type2">
		<div class="popup_inner">
			<div class="popup_header"><h2>AO추가</h2></div> 
			<div class="popup_body">
				<div class="popup_content">
	 			 			
					<div class="main_content">
					
						<!-- s: pop wrap-->
						<div class="build_content">
							<div class="build_layer_inner">
								<table class="build_row">
								<caption>caption</caption>
								<colgroup>
									<col width="60px">
									<col width="*">
								</colgroup>
				
									<tbody>
										<tr>
											<th><label for="">사용</label></th>
											<td>
												<input type="checkbox" id="useFlagChk" name="useFlagChk" checked="checked" />
											</td>
										</tr>
										<tr>
											<th><label for="">이름</label></th>
											<td>
												<input type="text" id="tagId" name="tagId" maxlength=7 style="width: 210px" />
											</td>
										</tr>
										<tr>
											<th><label for="">설명</label></th>
											<td>
												<input type="text" id="tagDesc" name="tagDesc" style="width: 210px" />
											</td>
										</tr>
										<tr>
											<th><label for="">태그유형</label></th>
											<td>
												<select id="tagKindCd" name="tagKindCd" style="width: 212px">
													<c:forEach var="result" items="${tagKindCdId}" varStatus="status">
														<option value="${result.codeUseName}">${result.codeName}</option>	
													</c:forEach>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="build_layer_area layer01">
								<p class="title">AO</p>
								
								<div class="dp_ib">
									<div class="build_layer"  style="height : 208px">
										<p class="build_layer_title">PLC_SCAN</p>
										
										<table class="build_row">
										<caption>caption</caption>
										<colgroup>
											<col width="60px">
											<col width="*">
										</colgroup>
						
											<tbody>
											<tr>
												<th><label for="">스테이션</label></th>
												<td>
													<input type="text" id="oPlcscanStation" name="oPlcscanStation" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">주소</label></th>
												<td>
													<input type="text" id="oPlcscanAddress" name="oPlcscanAddress" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra1</label></th>
												<td>
													<input type="text" id="oPlcscanExtra1" name="oPlcscanExtra1" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra2</label></th>
												<td>
													<input type="text" id="oPlcscanExtra2" name="oPlcscanExtra2" maxlength=10 />
												</td>
											</tr>
											</tbody>
										</table>
									</div>
									
									<table class="build_row mt10">
									<caption>caption</caption>
									<colgroup>
										<col width="60px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">단위</label></th>
												<td>
													<select id="aiUnitCd" name="aiUnitCd" style="width: 202px">
														<c:forEach var="result" items="${aiUnitCdId}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="build_layer">
									<p class="build_layer_title">계산필터</p>
									<c:forEach var="result" items="${aoCalcfilterCdId}" varStatus="status">
										<p class="list">
											<input type="radio" id="ao_aoCalcFilterCd_${status.index}" name="aoCalcFilterCd" value="${result.codeUseName}" />
											<label for="ao_aoCalcFilterCd_${status.index}">${result.codeName}</label>
											<c:if test="${result.codeUseName eq 'AO_CALC_FILTER3' }">
												<input type="text" id="aoCalcScript" name="aoCalcScript" disabled />
											</c:if>
										</p>
									</c:forEach>
									
									<p class="list_tit">계산범위 초과시</p>
									<c:forEach var="result" items="${aCutovervalueCd}" varStatus="status">
										<p class="list">
											<input type="radio" id="ao_aCutoverValueCd_${status.index}" name="aCutoverValueCd" value="${result.codeUseName}" />
											<label for="ao_aCutoverValueCd_${status.index}">${result.codeName}</label>
										</p>
									</c:forEach>
								</div>
								
								<div class="build_layer">
									<p class="build_layer_title">변환값</p>
									
									<table class="build_row">
									<caption>caption</caption>
									<colgroup>
										<col width="60px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">Full</label></th>
												<td>
													<input type="text" id="aConvertBase" name="aConvertBase" maxlength=18 />
												</td>
											</tr>
											<tr>
												<th><label for="">Base</label></th>
												<td>
													<input type="text" id="aConvertFull" name="aConvertFull"  maxlength=18 />
												</td>
											</tr>
											<tr>
												<th><label for="">PlcFull</label></th>
												<td>
													<input type="text" id="aConvertPlcfull" name="aConvertPlcfull" maxlength=18 />
												</td>
											</tr>
											<tr>
												<th><label for="">PlcBase</label></th>
												<td>
													<input type="text" id="aConvertPlcbase" name="aConvertPlcbase" maxlength=18 />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- s: btn wrap 가운데 정렬-->
						<div class="pop_btn_wrap">
							<a class="pop_btn btn_type02" href="javascript:tagRegist('TAG_TYPE2', 'AOTagForm');">저장</a>
							<a id="aoDeleteBtn" class="pop_btn btn_type01" href="javascript:deleteTag('AOTagForm');">삭제</a>
							<a class="pop_btn btn_type01" href="javascript:closeMaskPopup();">취소</a>
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</div>
</form>
<form id="DITagForm" name="DITagForm">
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}" />
	<input type="hidden" id="tagTypeCd" name="tagTypeCd" />
	<input type="hidden" id="registYn" name="registYn" />
	<input type="hidden" id="useFlag" name="useFlag" value="N" />
	<input type="hidden" id="iAlarmUseFlag" name="iAlarmUseFlag" value="N" />
	<input type="hidden" id="iDataSaveFlag" name="iDataSaveFlag" value="N" />
	<input type="hidden" id="iOutputUseFlag" name="iOutputUseFlag" value="N" />
	<input type="hidden" id="tagKindCd" name="tagKindCd" value="TAG_KIND11" /> <!-- ON/OFF 기본값 -> 경보사용 선택 시 TAG_KIND10 -->
	<div class="popup_container di" id="layerPop_type3">
		<div class="popup_inner">
			<div class="popup_header"><h2>DI추가</h2></div> 
			<div class="popup_body">
				<div class="popup_content">
	 			 			
					<div class="main_content">
					
						<!-- s: pop wrap-->
						<div class="build_content">
							<div class="build_layer_inner">
								<table class="build_row">
								<caption>caption</caption>
								<colgroup>
									<col width="60px">
									<col width="*">
								</colgroup>
				
									<tbody>
										<tr>
											<th><label for="">사용</label></th>
											<td>
												<input type="checkbox" id="useFlagChk" name="useFlagChk" checked="checked" />
											</td>
										</tr>
										<tr>
											<th><label for="">이름</label></th>
											<td>
												<input type="text" id="tagId" name="tagId" maxlength=7 style="width: 210px" />
											</td>
										</tr>
										<tr>
											<th><label for="">설명</label></th>
											<td>
												<input type="text" id="tagDesc" name="tagDesc" style="width: 210px" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="build_layer_area layer01">
								<p class="title">DI</p>
								
								<div class="dp_ib">
									<div class="build_layer"  style="height : 90px">
										<p class="build_layer_title">PLC_SCAN</p>
										
										<table class="build_row">
										<caption>caption</caption>
										<colgroup>
											<col width="60px">
											<col width="*">
										</colgroup>
						
											<tbody>
												<tr>
													<th><label for="">주소</label></th>
													<td>
														<input type="text" id="iPlcscanAddress" name="iPlcscanAddress" maxlength=10 />
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<table class="build_row mt10">
									<caption>caption</caption>
									<colgroup>
										<col width="80px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">ON 설명</label></th>
												<td>
													<input type="text" id="dOnDescription" name="dOnDescription" style="width: 200px" />
												</td>
											</tr>
											<tr>
												<th><label for="">OFF 설명</label></th>
												<td>
													<input type="text" id="dOffDescription" name="dOffDescription"  style="width: 200px" />
												</td>
											</tr>
										</tbody>
									</table>
									<p class="list_tit">검색시간</p>
									<p><input type="text" id="iScanTime" name="iScanTime" style="width: 200px" maxlength=5 /> 밀리초</p>
								</div>
							</div>
							
							<div class="build_layer_area layer02">
								<p class="title">DIO</p>
								
								<p class="mb10"><input type="checkbox" id="iOutputUseFlagChk" name="iOutputUseFlagChk" /><label for="iOutputUseFlag">출력으로 사용</label></p>
								
								<div class="build_layer" id="diOutputUseDiv1">
									<p class="build_layer_title">PLC_SCAN</p>
									
									<table class="build_row">
									<caption>caption</caption>
									<colgroup>
										<col width="60px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">스테이션</label></th>
												<td>
													<input type="text" id="oPlcscanStation" name="oPlcscanStation" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">주소</label></th>
												<td>
													<input type="text" id="oPlcscanAddress" name="oPlcscanAddress" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra1</label></th>
												<td>
													<input type="text" id="oPlcscanExtra1" name="oPlcscanExtra1" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra2</label></th>
												<td>
													<input type="text" id="oPlcscanExtra2" name="oPlcscanExtra2" maxlength=10 />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="build_layer mt20" id="diOutputUseDiv2">
									<p class="build_layer_title">릴레이 종류</p>
									
									<p class="list"><input type="radio" id="di_doRelayTypeCd_0" name="doRelayTypeCd" value="DO_RELAY_TYPE1" checked="checked" /><label for="di_doRelayTypeCd_0">래치</label></p>
									<p class="list">
										<label for="" class="label">ON지연</label>
										<input type="text" id="doDelayOnSec" name="doDelayOnSec" style="width: 150px" maxlength="3" /> 초
									</p>
									<p class="list">
										<label for="" class="label">OFF지연</label>
										<input type="text" id="doDelayOffSec" name="doDelayOffSec" style="width: 150px" maxlength="3" /> 초
									</p>
									<p class="list"><input type="radio" id="di_doRelayTypeCd_1" name="doRelayTypeCd" value="DO_RELAY_TYPE2" /><label for="di_doRelayTypeCd_1">펄스</label></p>
									<p class="list">
										<label for="" class="label">펄스시간</label>
										<input type="text" id="doRelayPulseSec" name="doRelayPulseSec" style="width: 150px" maxlength="3" /> 초
									</p>
								</div>
							</div>
							
							<div class="build_layer_area layer03">
								<p class="title">경보</p>
								
								<div class="build_layer2">
									<p class="mb10">
										<input type="checkbox" id="iAlarmUseFlagChk" name="iAlarmUseFlagChk" /><label for="iAlarmUseFlag">경보 사용</label>&nbsp;&nbsp;
										<input type="checkbox" id="iDataSaveFlagChk" name="iDataSaveFlagChk" checked /><label for="">통계자료저장</label>
									</p>
								
									<table class="build_row mt10">
									<caption>caption</caption>
									<colgroup>
										<col width="120px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">경보조건</label></th>
												<td>
													<select id="aiAlarmTypeCd" name="aiAlarmTypeCd" style="width: 200px">
														<c:forEach var="result" items="${aiAlarmtypeCdId}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="">우선순위</label></th>
												<td>
													<select id="iAlarmPriorityCd" name="iAlarmPriorityCd" style="width: 200px">
														<c:forEach var="result" items="${iAlarmpriorityCdid}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="">경보음성파일</label></th>
												<td>
													<select id="iAlarmWavCd" name="iAlarmWavCd" style="width: 200px">
														<c:forEach var="result" items="${iAlarmwavCdid}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
											<tr>
												<th><label for="">경보그래픽파일</label></th>
												<td>
													<select id="iAlarmImgCd" name="iAlarmImgCd" style="width: 200px">
														<c:forEach var="result" items="${iAlarmimgCdid}" varStatus="status">
															<option value="${result.codeUseName}">${result.codeName}</option>	
														</c:forEach>
													</select>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- s: btn wrap 가운데 정렬-->
						<div class="pop_btn_wrap">
							<a class="pop_btn btn_type02" href="javascript:tagRegist('TAG_TYPE3', 'DITagForm');">저장</a>
							<a id="diDeleteBtn" class="pop_btn btn_type01" href="javascript:deleteTag('DITagForm');">삭제</a>
							<a class="pop_btn btn_type01" href="javascript:closeMaskPopup();">취소</a>
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</div>
</form>
<form id="DOTagForm" name="DOTagForm">
	<input type="hidden" id="siteCd" name="siteCd" value="${sessionScope.SITE_INFO.siteCd}" />
	<input type="hidden" id="tagTypeCd" name="tagTypeCd" />
	<input type="hidden" id="registYn" name="registYn" />
	<input type="hidden" id="useFlag" name="useFlag" value="N" />
	<input type="hidden" id="tagKindCd" name="tagKindCd" value="TAG_KIND11" />	
	<div class="popup_container do" id="layerPop_type4">
		<div class="popup_inner">
			<div class="popup_header"><h2>DO추가</h2></div> 
			<div class="popup_body">
				<div class="popup_content">
	 			 			
					<div class="main_content">
					
						<!-- s: pop wrap-->
						<div class="build_content">
							<div class="build_layer_inner">
								<table class="build_row">
								<caption>caption</caption>
								<colgroup>
									<col width="60px">
									<col width="*">
								</colgroup>
				
									<tbody>
										<tr>
											<th><label for="">사용</label></th>
											<td>
												<input type="checkbox" id="useFlagChk" name="useFlagChk" checked="checked" />
											</td>
										</tr>
										<tr>
											<th><label for="">이름</label></th>
											<td>
												<input type="text" id="tagId" name="tagId" maxlength=7 style="width: 210px" />
											</td>
										</tr>
										<tr>
											<th><label for="">설명</label></th>
											<td>
												<input type="text" id="tagDesc" name="tagDesc" style="width: 210px" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="build_layer_area layer01">
								<p class="title">DO</p>
								
								<div class="build_layer">
									<p class="build_layer_title">PLC_SCAN</p>
									
									<table class="build_row">
									<caption>caption</caption>
									<colgroup>
										<col width="80px">
										<col width="*">
									</colgroup>
					
										<tbody>
											<tr>
												<th><label for="">스테이션</label></th>
												<td>
													<input type="text" id="oPlcscanStation" name="oPlcscanStation" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">주소</label></th>
												<td>
													<input type="text" id="oPlcscanAddress" name="oPlcscanAddress" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra1</label></th>
												<td>
													<input type="text" id="oPlcscanExtra1" name="oPlcscanExtra1" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">Extra2</label></th>
												<td>
													<input type="text" id="oPlcscanExtra2" name="oPlcscanExtra2" maxlength=10 />
												</td>
											</tr>
											<tr>
												<th><label for="">ON 설명</label></th>
												<td>
													<input type="text" id="dOnDescription" name="dOnDescription" />
												</td>
											</tr>
											<tr>
												<th><label for="">OFF 설명</label></th>
												<td>
													<input type="text" id="dOffDescription" name="dOffDescription" />
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="build_layer">
									<p class="build_layer_title">릴레이 종류</p>
									
									<p class="list"><input type="radio" id="do_doRelayTypeCd_0" name="doRelayTypeCd" value="DO_RELAY_TYPE1" checked="checked" /><label for="do_doRelayTypeCd_0">래치</label></p>
									<p class="list">
										<label for="" class="label">ON지연</label>
										<input type="text" id="doDelayOnSec" name="doDelayOnSec" style="width: 150px" maxlength="3" /> 초
									</p>
									<p class="list">
										<label for="" class="label">OFF지연</label>
										<input type="text" id="doDelayOffSec" name="doDelayOffSec" style="width: 150px" maxlength="3" /> 초
									</p>
									<p class="list"><input type="radio" id="do_doRelayTypeCd_1" name="doRelayTypeCd" value="DO_RELAY_TYPE2" /><label for="do_doRelayTypeCd_1">펄스</label></p>
									<p class="list">
										<label for="" class="label">펄스시간</label>
										<input type="text" id="doRelayPulseSec" name="doRelayPulseSec" style="width: 150px" maxlength="3" /> 초
									</p>
								</div>
							</div>
							
						</div>
						<!-- s: btn wrap 가운데 정렬-->
						<div class="pop_btn_wrap">
							<a class="pop_btn btn_type02" href="javascript:tagRegist('TAG_TYPE4', 'DOTagForm');">저장</a>
							<a id="doDeleteBtn" class="pop_btn btn_type01" href="javascript:deleteTag('DOTagForm');">삭제</a>
							<a class="pop_btn btn_type01" href="javascript:closeMaskPopup();">취소</a>
						</div>
					</div>
	
				</div>
			</div>
		</div>
	</div>
</form>
<!-- e: popup container -->