<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javascript">
function goDetail(roleId){
	var f = document.frm;
	
	f.roleId.value = roleId;
	f.action = "<c:url value='/uems/system/role/roleRegist.do'/>";
	f.submit();
}

function goRoleView(roleId) {
	location.href = "<c:url value='/uems/system/role/roleView.do?roleId='/>" + roleId;
}
</script>
<div id="popDiv"></div>
				
	<div class="contents_wrap">
	<form:form commandName="role" name="frm" id="frm" method="post">
		<form:hidden path="roleId"/>
		<form:hidden path="currPage" />
		
		<h2 class="main_title">권한 그룹 관리</h2>
    				<p class="tit_type01">총 : <strong class="imp"> <c:out value="${role.pageutil.totRecordCount}" escapeXml="false" /> </strong> 건</p>
		<!-- s: table wrap-->
		<div class="table_wrap">
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="5%"/>
					<col width="*"/>
					<col width="20%"/>
					<col width="8%"/>
					<col width="10%"/>
					<col width="15%"/>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>권한명</th>
						<th>메뉴권한</th>
						<th>정렬순서</th>
						<th>사용여부</th>
						<th>등록/수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultList}" var="result" varStatus="status">
						<tr>
							<td><c:out value="${result.sPagelistno}" escapeXml="false" /></td>
							<td><a href="javascript:goDetail('${result.roleId}');" class="link_imp01"><c:out value="${result.roleName}" escapeXml="false" /></a></td>
							<td><span class="btn btn_type01 btn_size01"><a href="javascript:goRoleView('<c:out value="${result.roleId}" escapeXml="false" />');" >메뉴 권한 보기</a></span></td>
							<td><c:out value="${result.sortNum}" escapeXml="false" /></td>
							<c:choose>
								<c:when test="${result.useYn eq 'Y'}">
									<td>사용</td>
								</c:when>
								<c:otherwise>
									<td>사용안함</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${result.updateDate ne null}">
									<td><c:out value="${result.updateDate}" escapeXml="false" /></td>
								</c:when>
								<c:otherwise>
									<td><c:out value="${result.regDate}" escapeXml="false" /></td>
								</c:otherwise>
							</c:choose>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- e: table wrap-->
		<div class="paging_wrap"><c:out value="${role.pageutil.pagingBody}" escapeXml="false" /></div>
			<div class="thead_wrap cboth">
				<div class="rtl">
				<span class="btn btn_type02 btn_size02"><a href="javascript:goDetail();">등 록</a></span>
				</div>
			</div>
		</form:form>
	</div>
			
<c:out value="${role.pageutil.pagingHtml}" escapeXml="false" />
