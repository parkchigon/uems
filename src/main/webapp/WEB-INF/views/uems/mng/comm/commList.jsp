<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>

<script type="text/javaScript">
	
	function goCommDetail(siteId) {
		var f = document.frm;
		f.siteId.value = siteId;
		f.action = "<c:url value='/uems/mng/comm/commDetail.do'/>";
		f.submit();
	}

</script>
<div class="contents_wrap">
<form:form commandName="comm" name="frm" id="frm" method="post">	
	<form:hidden path="siteId"/>
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">통신관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 통신정보를 조회를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="5%"/>
				<col width="10%"/>
				<col width="15%"/>
				<col width="10%"/>
				<col width="*"/>
				<col width="*"/>
				<col width="*"/>
				<col width="*"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">번호</th>
					<th rowspan="2">그룹</th>
					<th rowspan="2">지점명</th>
					<th rowspan="2">IP</th>
					<th colspan="4">메모리크기</th>
					<th rowspan="2">Com Port</th>
					<th rowspan="2">Com Baud</th>
				</tr>
				<tr>
					<th>WORD</th>
					<th>FLOAT</th>
					<th>DWORD</th>
					<th>STRING</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(resultList) eq 0}">
					<tr>
						<td colspan="10"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.sgName}" escapeXml="false"/></td>
						<td><a href="javascript:goCommDetail('${result.siteId}');" class="link_imp01"><c:out value="${result.siteName}" escapeXml="false"/></a></td>
						<td><c:out value="${result.siteIp}" escapeXml="false"/></td>
						<td><c:out value="${result.plcWordSize}" escapeXml="false"/></td>
						<td><c:out value="${result.plcFloatSize}" escapeXml="false"/></td>
						<td><c:out value="${result.plcDwordSize}" escapeXml="false"/></td>
						<td><c:out value="${result.plcStringSize}" escapeXml="false"/></td>
						<td><c:out value="${result.comPortName}" escapeXml="false"/></td>
						<td><c:out value="${result.comBaudName}" escapeXml="false"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${comm.pageutil.pagingBody}" escapeXml="false" />
	</div>
	<!-- e: 페이징 -->
	<!-- e: table wrap-->
</form:form>
</div>
<c:out value="${comm.pageutil.pagingHtml}" escapeXml="false" />
