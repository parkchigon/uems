<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
	});

	function mngList()
	{
		var f = document.frm;
		f.searchKeyword.value = $.trim($("input[name=searchKeyword]").val());
		f.action = "<c:url value='/uems/mng/user/mngList.do'/>";
		f.submit();
	}
	
	function mngRegist(mngId)
	{
		var f = document.frm;
		f.mngId.value = mngId;
		f.action = "<c:url value='/uems/mng/user/mngRegist.do'/>";
		f.submit();
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="mng" name="frm" id="frm" method="post">	
	<form:hidden path="mngId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">유저 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 권한별 유저를 조회 및 관리를 합니다.</div></li>
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
						<span class="sel_wrap w01" style="width:195px;">
							<form:select path="searchCondition">
								<form:option value="loginId">관리자ID</form:option>
								<form:option value="mngName">관리자명</form:option>
								<form:option value="roleName">권한</form:option>
							</form:select>
						</span>
						<form:input class="inp_txt w02" path="searchKeyword" style="width:500px;" onkeydown='if(event.keyCode==13) mngList();'></form:input>
						<span class="btn btn_type02 btn_size02"><a href="javascript:mngList()">검 색</a></span>
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
			<span class="btn btn_type02 btn_size02"><a href="javascript:mngRegist('')">등 록</a></span>
		</div>
	</div>
	<!-- e: table top-->
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="10%"/>
				<col width="20%"/>
				<col width="30%"/>
				<col width="30%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>권한</th>
					<th>관리자명</th>
					<th>관리자ID</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(resultList) eq 0}">
					<tr>
						<td colspan="5"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.roleName}" escapeXml="false"/></td>
						<td><a href="javascript:mngRegist('${result.mngId}');" class="link_imp01"><c:out value="${result.mngName}" escapeXml="false"/></a></td>
						<td><c:out value="${result.loginId}" escapeXml="false"/></td>
						<td><c:out value="${result.useYn}" escapeXml="false"/></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${mng.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
</form:form>
</div>

<c:out value="${mng.pageutil.pagingHtml}" escapeXml="false" />
