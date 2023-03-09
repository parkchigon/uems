<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">

	$(document).ready(function(){
		selectComponent();
		selectTagMappingList();
	});
	
	// Type 선택 후 화면 구성
	function selectComponent() {
		$("input:radio[name=type]").click(function(e) {
			var entryTemplateId = '${miniDiagram.templateId}';
			var templateId = $(this).val();
			$("#templateId").val(templateId);
			if(confirm("Type 변경 시 설정된 태그가 삭제 됩니다. 해당 Type을 선택하시겠습니까?")) {
				$.ajax({
					url : "/uems/mng/miniDiagram/selectComponetListAjax.do",
					type: "POST",
					data: {templateId : templateId
						  ,siteCd : '${miniDiagram.siteCd}' },
					dataType : "json"
				}).done( function(data) {
					var componentNameList = data.componentNameList;
					var componentNameListLength = componentNameList.length;
					var tagList = data.tagList;
					var tagListLength = tagList.length;
					var thumnailFilePath = "";
					var html = "";

					<c:forEach var="group" items="${miniDiagram.componentGroup}" varStatus="status">
						html += "<dl>";
						html += "<dt>" + '${group.value}' + "</dt>";
						
						if (componentNameListLength > 0) {
							for (var i in componentNameList) {
								thumnailFilePath = componentNameList[i].thumnailFilePath;
								var componentName = componentNameList[i].componentName;
								var componentId = componentNameList[i].componentId;
								var componentTagTypeCd = componentNameList[i].tagTypeCd;
								var groupId = componentNameList[i].groupId;
								var viewNo = componentNameList[i].viewNo;
								if ( '${group.key}' == groupId ) {
									html += "<dd>";
									html += "<label><span class='mini_No'>" + viewNo + "</span>" + componentName + "</label>";
									html += "<span class='sel_wrap w01' style='width:200px;'>";
									html += "<select id='"+ groupId + "/" + componentId + "' name='tagList'>";
									html += "<option value=''>TagID</option>";
									if (tagListLength > 0) {
										for (var j in tagList) {
											var tagTypeCd = tagList[j].tagTypeCd;
											var tagId = tagList[j].tagId;
											var tagDesc = tagList[j].tagDesc;
											if ( componentTagTypeCd == tagTypeCd) {
												html += "<option value="+ tagId +">["+ tagId +"] "+ tagDesc +"</option>";
											}
										}
									}	
									html += "</select>";
									html += "</span>";
									html += "</dd>";
								}
							}
						}
						html += "</dl>";
					</c:forEach>
					
					$("#thumbnailFilePath").attr("src",thumnailFilePath);
					$("#componentArea").empty();
					$("#componentArea").append(html);
					
					if ( entryTemplateId == templateId ) {
						selectTagMappingList();
					}
				});
			} else {
				e.preventDefault();
			}
		});
	}
	
	// 태그 매핑 조회
	function selectTagMappingList() {
		
		$.ajax({
			url : "/uems/mng/miniDiagram/selectTagMappingListAjax.do",
			type: "POST",
			data: $("#frm").serialize(),
			dataType : "json"
		}).done( function(data) {
			var list = data.tagMappingList;
			
			for (var i in list) {
				$("select[name=tagList]").each(function(index) {
					var componentId = $(this).attr("id").split("/")[1];
					if(list[i].componentId == componentId) {
						$(this).val(list[i].tagId);
						return;
					}
				});
			}
		});
	}
	
	// 미니계통도 매핑
	function save(){
		if($("select[name=tagList] option:selected[value='']").length > 0) {
			alert("태그ID를 모두 선택하세요.");
			return;
		}
		
		var listIndex = 0;
		var f = document.frm;
		
		$("select[name=tagList]").each(function(index) {
			var selectId = $(this).attr("id");
			var groupId = selectId.split("/")[0];
			var componentId = selectId.split("/")[1];
			
			$("#frm").append("<input type='hidden' name='mappingList["+(index+listIndex)+"].componentId' value='"+componentId+"'/>");
			$("#frm").append("<input type='hidden' name='mappingList["+(index+listIndex)+"].groupId' value='"+groupId+"'/>");
			$("#frm").append("<input type='hidden' name='mappingList["+(index+listIndex)+"].tagId' value='"+$(this).val()+"'/>");
		});
		
		f.action = "<c:url value = '/uems/mng/miniDiagram/miniDiagramSetRegistExe.do'/>"
		f.submit();
	}
	
</script>
<form:form commandName="miniDiagram" name="frm" id="frm" method="post">	
<form:hidden path="siteId"/>
<form:hidden path="templateId"/>
<div class="contents_wrap">
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">미니계통도 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;통합센터의 각 지점별 미니계통도를 관리합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	
	<!-- s: search -->
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="10%" />
				<col width="*%" />
			</colgroup>
			
			<tbody>
				<tr>
					<th><div class="tit">지점명 :</div></th>
					<td>
						${miniDiagram.sgName} / ${miniDiagram.siteName}
					</td>
				</tr>
			<tbody>
		</table>
	</div>
	<!-- e: search -->
	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="*"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택</th>
					<th>축방냉<br/>분리형</th>
					<th>브라인<br/>일체형</th>
					<th>축/방펌프<br/>인버터</th>
					<th>방냉펌프<br/>인버터</th>
					<th>브라인펌프<br/>인버터</th>
					<th>브라인펌프<br/>정속형</th>
					<th>냉각탑1셀</th>
					<th>냉각탑2셀</th>
					<th>냉각탑2셀<br/>+인버터</th>
					<th>냉각탑3셀</th>
					<th>냉각탑1set</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="radio" name="type" id="typeA" value="0001" <c:if test="${miniDiagram.templateId eq '0001'}"> checked="checked"</c:if>> <label for="type">typeA</label></td>
					<td>○</td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeB" value="0002" <c:if test="${miniDiagram.templateId eq '0002'}"> checked="checked"</c:if>> <label for="type">typeB</label></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeC" value="0003" <c:if test="${miniDiagram.templateId eq '0003'}"> checked="checked"</c:if>> <label for="type">typeC</label></td>
					<td>○</td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeD" value="0004" <c:if test="${miniDiagram.templateId eq '0004'}"> checked="checked"</c:if>> <label for="type">typeD</label></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeE" value="0005" <c:if test="${miniDiagram.templateId eq '0005'}"> checked="checked"</c:if>> <label for="type">typeE</label></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeF" value="0006" <c:if test="${miniDiagram.templateId eq '0006'}"> checked="checked"</c:if>> <label for="type">typeF</label></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeG" value="0007" <c:if test="${miniDiagram.templateId eq '0007'}"> checked="checked"</c:if>> <label for="type">typeG</label></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeH" value="0008" <c:if test="${miniDiagram.templateId eq '0008'}"> checked="checked"</c:if>> <label for="type">typeH</label></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" name="type" id="typeI" value="0009" <c:if test="${miniDiagram.templateId eq '0009'}"> checked="checked"</c:if>> <label for="type">typeI</label></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td>○</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>○</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	
	<!-- s: contents_inner -->
	<div class="contents_wrap_inner">
		<div class="mini_area_left" id="componentArea">
			<c:forEach var="group" items="${miniDiagram.componentGroup}" varStatus="status">	
				<dl>	
					<dt>${group.value}</dt>
					<c:forEach var="result" items="${componentNameList}" varStatus="status">	
						<c:if test="${group.key eq result.groupId}">
							<dd>
								<label><span class="mini_No">${result.viewNo}</span>${result.componentName}</label>
								<span class="sel_wrap w01" style="width:200px;">
									<select id="${result.groupId}/${result.componentId}" name="tagList">
										<option value="">TagID</option>
										<c:forEach var="tag" items="${tagList}" varStatus="status">
											<c:if test="${result.tagTypeCd eq tag.tagTypeCd}">
												<option value="${tag.tagId}">[${tag.tagId}] ${tag.tagDesc}</option>
											</c:if>
										</c:forEach>
									</select>
								</span>
							</dd>
						</c:if>
					</c:forEach>
				</dl>	
			</c:forEach>
		</div>
		<div class="mini_area_right">
			<img src="${miniDiagram.thumbnailFilePath}" alt="미니계통도typeA" id="thumbnailFilePath">
		</div>
		<div class="cboth"></div>
	</div>
	<!-- e: contents_inner -->
	
	<div class="rtl">
		<span class="btn btn_type01 btn_size02"><a href="/uems/mng/miniDiagram/miniDiagramList.do">취소</a></span>
		<span class="btn btn_type02 btn_size02"><a href="javascript:save()">저장</a></span>
	</div>
	
</div>
</form:form>