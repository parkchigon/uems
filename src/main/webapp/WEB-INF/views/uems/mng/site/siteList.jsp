<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
	});

	function siteList() {
		var f = document.frm;
		f.searchKeyword.value = $.trim($("input[name=searchKeyword]").val());
		f.action = "<c:url value='/uems/mng/site/siteList.do'/>";
		f.submit();
	}
	
	function siteRegist(siteId) {
		var f = document.frm;
		f.siteId.value = siteId;
		f.action = "<c:url value='/uems/mng/site/siteRegist.do'/>";
		f.submit();
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="site" name="frm" id="frm" method="post">	
	<form:hidden path="siteId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">지점 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;지점를 조회 및 관리를 합니다.</div></li>
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
					<th><div class="tit">지점명</div></th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="searchCondition">
								<form:option value="" label="전체"/>
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>
						<form:input class="inp_txt w02" path="searchKeyword" style="width:500px;" onkeydown='if(event.keyCode==13) siteList();'></form:input>
						<span class="btn btn_type02 btn_size02"><a href="javascript:siteList()">검 색</a></span>
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
			<span class="btn btn_type02 btn_size02"><a href="javascript:siteRegist('')">등 록</a></span>
		</div>
	</div>
	<!-- e: table top-->
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="10%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>지점코드</th>
					<th>그룹명</th>
					<th>지점명</th>
					<th>지역명</th>
					<th>지점IP</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(resultList) eq 0}">
					<tr>
						<td colspan="7"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.siteCd}" escapeXml="false"/></td>
						<td><c:out value="${result.sgName}" escapeXml="false"/></td>
						<td><a href="javascript:siteRegist('${result.siteId}');" class="link_imp01"><c:out value="${result.siteName}" escapeXml="false"/></a></td>
						<td><c:out value="${result.regionCdName}" escapeXml="false"/></td>
						<td><c:out value="${result.siteIp}" escapeXml="false"/></td>
						<td><c:out value="${result.useFlag}" escapeXml="false"/></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${site.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
</form:form>
</div>

<c:out value="${site.pageutil.pagingHtml}" escapeXml="false" />
