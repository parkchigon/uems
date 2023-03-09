<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>
<script type="text/javascript" src="/resources/uems/js/lib/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/uems/js/dashboard.js"></script>
<script type="text/javascript">

	function reportList() {
		var f = document.frm;
		f.searchKeyword.value = $.trim($("input[name=searchKeyword]").val());
		f.action = "<c:url value='/uems/report.do'/>";
		f.submit();
	}
	
	function downloadReport(rfId, reportName) {
		
		if(confirm('"' + reportName + '"를 다운로드 하시겠습니까?')) {
			var f = document.frm;
			f.rfId.value = rfId;
			f.action = "<c:url value='/uems/report/download.do'/>";
			f.submit();
		}
	}
</script>

<div id="header">
	<h1><img src="/resources/uems/images/total/logo.png" alt="ENERZENT" /></h1>
	<div class="topUtil">
		<span class="user">${sessionScope.AUTH.mngName} 님</span>
		<a class="btn_login" href="/login/logout.do">LOGOUT</a>
	</div>
	<div id="gnb">
		<a href="/uems/main.do">총계</a>
		<a href="/uems/branchInfo.do">지점정보</a>
		<a href="#" class="on">보고서</a>
	</div>
	<div class="header_right">
		<span class="toDay" id="clock">2017년 05월 25일(월) 10:00:00</span>
		<div class="links">
			<a href="/uems/mng/site/siteGroupList.do">관리</a>
			<a href="javascript: goIntegration();">통합센터</a>
		</div>
	</div>
</div>

<div id="container">
	
	<!-- s : content_area -->
	<div id="content_area">
		<div class="info_head_area">
			<h3 class="title">보고서</h3>
			<ul class="list">
				<li>각 지점별 일간/월간 자동 생성된 보고서를 다운로드 합니다.</li>
			</ul>
		</div>
		<form:form commandName="report" name="frm" id="frm" method="post">
			<form:hidden path="rfId"/>
			 
		<div class="table_head_area textR">
			<div class="dp_ib">
				<form:select path="searchGroup">
					<form:option value="A" label="전체"/>
					<c:forEach var="siteGroup" items="${siteGroupList}" varStatus="status">
						<form:option value="${siteGroup.sgCd}" label="${siteGroup.sgName}" />
					</c:forEach>
				</form:select>
				
				<form:select path="searchSite">
					<form:option value="A" label="전체"/>
					<c:forEach var="site" items="${siteList}" varStatus="status">
						<form:option value="${site.siteId}" label="${site.siteName}"/>
					</c:forEach>
				</form:select>

				<form:input class="inp_txt w02" path="searchKeyword" style="width:200px;" onkeydown='if(event.keyCode==13) reportList();'></form:input>
				<a class="btnType btn_type02" href="javascript:reportList();">검색</a>
			</div>
		</div>
		</form:form>
		<div class="table_body_wrap">
			<table class="table_wrap col">
			<caption>caption</caption>
			<colgroup>
				<col width="120px">
				<col width="150px">
				<col width="120px">
				<col width="120px">
				<col width="120px">
				<col width="*">
				<col width="150px">
			</colgroup>

				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">그룹</th>
						<th scope="col">지점</th>
						<th scope="col">구분</th>
						<th scope="col">보고서 일자</th>
						<th scope="col">보고서 제목</th>
						<th scope="col">생성 일자</th>
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
							<fmt:parseDate value="${result.reportStartDate}" var="reportStartDate" pattern="yyyyMMdd" />
							<td><fmt:formatDate value="${reportStartDate}" pattern="yyyy-MM"/></td>
							<td class="textL"><a href="javascript:downloadReport('${result.rfId}', '${result.reportName}');"><span class="ico_fileSet ico_xls"><span class="blind">xls파일</span></span> <c:out value="${result.reportName}" escapeXml="false"/></a></td>
							<fmt:parseDate value="${result.regDate}" var="reportRegDate" pattern="yyyy-MM-dd HH:mm:ss" />
							<td><fmt:formatDate value="${reportRegDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="paging_area">
		    <div class="paging">
	    		<c:out value="${fn:replace(fn:replace(fn:replace(report.pageutil.pagingBody, 'start', 'first'), 'prev', 'pre'), 'end', 'last')}" escapeXml="false" />
		    </div>
		</div>
		
	</div>
	
	<c:out value="${report.pageutil.pagingHtml}" escapeXml="false" />
	<!-- e : content_area -->
	
	<!-- s : footer -->
	<div id="footer">
		<img src="/resources/uems/images/total/logo_footer.png" alt="ENERZENT" /> <span>Copyright (C) ENERZENT CO., LTD, All Rights Reserved.</span>
	</div>
	<!-- e : footer -->
</div>