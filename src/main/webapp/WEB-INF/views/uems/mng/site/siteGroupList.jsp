<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
	});

	function siteGroupList() {
		var f = document.frm;
		f.searchKeyword.value = $.trim($("input[name=searchKeyword]").val());
		f.action = "<c:url value='/uems/mng/site/siteGroupList.do'/>";
		f.submit();
	}
	
	function siteGroupRegist(sgId) {
		var f = document.frm;
		f.sgId.value = sgId;
		f.action = "<c:url value='/uems/mng/site/siteGroupRegist.do'/>";
		f.submit();
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="siteGroup" name="frm" id="frm" method="post">	
	<form:hidden path="sgId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">그룹 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;그룹을 조회 및 관리를 합니다.</div></li>
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
					<th><div class="tit">그룹명</div></th>
					<td>
						<form:input class="inp_txt w02" path="searchKeyword" style="width:500px;" onkeydown='if(event.keyCode==13) siteGroupList();'></form:input>
						<span class="btn btn_type02 btn_size02"><a href="javascript:siteGroupList()">검 색</a></span>
					</td>
				</tr>
			<tbody>
		</table>
	</div>
	<!-- e: search -->
	<!-- s: btn -->
	<br><br>
	<!-- e: btn -->
	
	<!-- s: table top-->
	<div class="thead_wrap cboth">
		<div class="ltr">
			<c:choose>
				<c:when test="${fn:length(resultList) eq 0}">
					<p class="tit_type01">총 : <strong class="imp">0</strong> 명</p>
				</c:when>
				<c:otherwise>
					<p class="tit_type01">총 : <strong class="imp">${resultList[0].sTotalcount}</strong> 명</p>
				</c:otherwise>	
			</c:choose>
		</div>
		<div class="rtl">
			<span class="btn btn_type02 btn_size02"><a href="javascript:siteGroupRegist('')">등 록</a></span>
		</div>
	</div>
	<!-- e: table top-->
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="10%"/>
				<col width="30%"/>
				<col width="30%"/>
				<col width="30%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>그룹코드</th>
					<th>그룹명</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(resultList) eq 0}">
					<tr>
						<td colspan="4"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.sgCd}" escapeXml="false"/></td>
						<td><a href="javascript:siteGroupRegist('${result.sgId}');" class="link_imp01"><c:out value="${result.sgName}" escapeXml="false"/></a></td>
						<td><c:out value="${result.useFlag}" escapeXml="false"/></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${siteGroup.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
</form:form>
</div>

<c:out value="${siteGroup.pageutil.pagingHtml}" escapeXml="false" />
