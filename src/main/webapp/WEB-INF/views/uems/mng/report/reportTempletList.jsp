<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">

	function reportTempleteRegist(rtId) {
		var f = document.frm;
		f.rtId.value = rtId;
		f.action = "<c:url value='/uems/mng/report/reportTempletRegist.do'/>";
		f.submit();
	}
	

	function reportTempleteList() {
		var f = document.frm;
		f.searchKeyword.value = $.trim($("input[name=searchKeyword]").val());
		f.action = "<c:url value='/uems/mng/report/reportTempletList.do'/>";
		f.submit();
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="report" name="frm" id="frm" method="post">
	<form:hidden path="rtId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">보고서관리 - 보고서 템플릿관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;보고서 템플릿을 등록, 삭제를 관리합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="10%">
				<col width="*%">
			</colgroup>
			
			<tbody>
				<tr>
					<th><div class="tit">그룹</div></th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
						<form:select path="searchGroup">
							<form:option value="A" label="전체"/>
							<c:forEach var="siteGroup" items="${siteGroupList}" varStatus="status">
								<form:option value="${siteGroup.sgCd}" label="${siteGroup.sgName}" />
							</c:forEach>
						</form:select>
						</span>
					</td>
					<th><div class="tit">지점</div></th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="searchSite">
								<form:option value="A" label="전체"/>
								<c:forEach var="site" items="${siteList}" varStatus="status">
									<form:option value="${site.siteId}" label="${site.siteName}"/>
								</c:forEach>
							</form:select>
						</span>
					</td>
				</tr>
				<tr>
					<th><div class="tit">종류</div></th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="searchType">
								<form:option value="A" label="전체" />
								<form:option value="Y" label="연간" />
								<form:option value="M" label="월간" />
							</form:select>
						</span>
					</td>
					<th><div class="tit">제목</div></th>
					<td>
						<form:input class="inp_txt w02" path="searchKeyword" style="width:500px;" onkeydown='if(event.keyCode==13) reportTempleteList();'></form:input>
						<span class="btn btn_type02 btn_size02"><a href="javascript:reportTempleteList();">검 색</a></span>
					</td>
				</tr>
			</tbody><tbody>
		</tbody></table>
	</div>
	<div class="thead_wrap cboth">
		<div class="rtl">
			<span class="btn btn_type02 btn_size02"><a href="javascript:reportTempleteRegist('')">등 록</a></span>
		</div>
	</div>
	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="5%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="*"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>그룹</th>
					<th>지점</th>
					<th>종류</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(resultList) eq 0}">
					<tr>
						<td colspan="6"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.sgName}" escapeXml="false"/></td>
						<td><c:out value="${result.siteName}" escapeXml="false"/></td>
						<c:if test="${result.reportType eq 'M'}">
						<td><c:out value="월간" escapeXml="false"/></td>
						</c:if>
						<c:if test="${result.reportType eq 'Y'}">
						<td><c:out value="연간" escapeXml="false"/></td>
						</c:if>
						<td><a href="javascript:reportTempleteRegist('${result.rtId}');" class="link_imp01"><c:out value="${result.templateName}" escapeXml="false"/></a></td>
						<fmt:parseDate value="${result.updateDate}" var="updateDate" pattern="yyyy-MM-dd HH:mm:ss" />
						<td><fmt:formatDate value="${updateDate}" pattern="yyyy.MM.dd"/></td>
						<%-- <td><c:out value="${result.updateDate}" escapeXml="false"/></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${report.pageutil.pagingBody}" escapeXml="false" />
	</div>
	<!-- e: 페이징 -->
	<!-- e: table wrap-->
</form:form>	
</div>
<c:out value="${report.pageutil.pagingHtml}" escapeXml="false" />