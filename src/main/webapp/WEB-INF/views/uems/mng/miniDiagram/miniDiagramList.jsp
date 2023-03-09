<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		
		selectSiteList($("#searchCondition").val());
		
		$("#searchCondition").change(function() {
			selectSiteList($(this).val());
		});
		
	});
	
	function selectSiteList(sgId) {
		
		if(isEmpty(sgId)) {
			var html = "";
			html += "<option value=''>전체</option>";
			
			$("#searchCondition2").empty();
			$("#searchCondition2").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/user/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId},
				dataType : "json"
			}).done( function(data) {
				var list = data.siteList;
				var html = "";
				for(var i=0; i<list.length; i++) {
					if(list[i].siteId == '${miniDiagram.searchCondition2}') {
						html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
					} else {
						html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
					}
					
				}
				
				$("#searchCondition2").empty();
				$("#searchCondition2").append(html);

			});
		}
	}

	function miniDiagramList()
	{
		var f = document.frm;
		f.action = "<c:url value='/uems/mng/miniDiagram/miniDiagramList.do'/>";
		f.submit();
	}
	
	function settingMiniDiagram(siteId, templateId, siteName, sgName, siteCd)
	{
		var f = document.frm;
		f.siteId.value = siteId;
		f.siteCd.value = siteCd;
		f.siteName.value = siteName;
		f.templateId.value = templateId;
		f.sgName.value = sgName;
		f.action = "<c:url value='/uems/mng/miniDiagram/settingMiniDiagram.do'/>";
		f.submit();
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="miniDiagram" name="frm" id="frm" method="post">	
	<form:hidden path="siteId"/>
	<form:hidden path="siteCd"/>
	<form:hidden path="siteName"/>
	<form:hidden path="sgName"/>
	<form:hidden path="templateId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">미니계통도 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;통합센터의 각 지점별 미니계통도를 관리합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="10%" />
				<col width="*%" />
			</colgroup>
			
			<tbody>
				<tr>
					<th><div class="tit">검색</div></th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="searchCondition">
								<form:option value="" label="전체"/>
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="searchCondition2" name="searchCondition2">
							</select>
						</span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:miniDiagramList()">검 색</a></span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: search -->
	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>그룹</th>
					<th>지점</th>
					<th>미니계통도타입</th>
					<th>변경ID</th>
					<th>변경일자</th>
					<th>설정여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(miniDiagramList) eq 0}">
					<tr>
						<td colspan="7"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${miniDiagramList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.sgName}" escapeXml="false"/></td>
						<td><c:out value="${result.siteName}" escapeXml="false"/></td>
						<td><c:out value="${result.templateType}" escapeXml="false"/></td>
						<td><c:out value="${result.updateId}" escapeXml="false"/></td>
						<td><c:out value="${result.updateDate}" escapeXml="false"/></td>
						<c:choose>
							<c:when test="${empty result.templateId}">
								<td><span class="btn btn_type01 btn_size01"><a href="javascript:settingMiniDiagram('${result.siteId}','${result.templateId}','${result.siteName}','${result.sgName}','${result.siteCd}')">미설정</a></span></td>
							</c:when>
							<c:otherwise>
								<td><span class="btn btn_type02 btn_size01"><a href="javascript:settingMiniDiagram('${result.siteId}','${result.templateId}','${result.siteName}','${result.sgName}','${result.siteCd}')">수정</a></span></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	
</form:form>
</div>
