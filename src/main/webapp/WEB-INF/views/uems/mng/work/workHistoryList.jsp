<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
	
		selectSiteList($("#searchCondition").val());
		
		$("#searchCondition").change(function() {
			selectSiteList($(this).val());
		});
		
	});

	function workHistoryList() {
		var f = document.frm;
		f.searchKeyword.value = $.trim($("input[name=searchKeyword]").val());
		f.action = "<c:url value='/uems/mng/work/workHistoryList.do'/>";
		f.submit();
	}
	
	function workHistoryRegist(workId) {
		var f = document.frm;
		f.workId.value = workId;
		f.action = "<c:url value='/uems/mng/work/workHistoryRegist.do'/>";
		f.submit();
	}
	
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
					if(list[i].siteId == '${workHistory.searchCondition2}') {
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
	
</script>

<div class="contents_wrap">
<form:form commandName="workHistory" name="frm" id="frm" method="post">	
	<form:hidden path="workId"/>
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">작업 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 작업 이력을 조회 및 관리를 합니다.</div></li>
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
				<tr class="first">
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
						<span class="sel_wrap w01" style="width:200px;">
							<select id="searchCondition2" name="searchCondition2">
							</select>
						</span>
					</td>
				</tr>
				<tr>
					<th><div class="tit">장비명</div></th>
					<td>
						<form:input class="inp_txt w02" path="searchKeyword" style="width:500px;" onkeydown='if(event.keyCode==13) workHistoryList();'></form:input>
						<span class="btn btn_type02 btn_size02"><a href="javascript:workHistoryList()">검 색</a></span>
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
			<span class="btn btn_type02 btn_size02"><a href="javascript:workHistoryRegist('')">등 록</a></span>
		</div>
	</div>
	<!-- e: table top-->
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="5%"/>
				<col width="7%"/>
				<col width="10%"/>
				<col width="15%"/>
				<col width="*"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>지점</th>
					<th>작업 일자</th>
					<th>장비</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(resultList) eq 0}">
					<tr>
						<td colspan="3"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr>
						<td><c:out value="${result.sPagelistno}" escapeXml="false"/></td>
						<td><c:out value="${result.siteName}" escapeXml="false"/></td>
						<fmt:parseDate value="${result.workDate}" var="workDate" pattern="yyyyMMdd"/>
						<td><fmt:formatDate value="${workDate}" pattern="yyyy-MM-dd"/></td>
						<td class="left"><a href="javascript:workHistoryRegist('${result.workId}');" class="link_imp01"><c:out value="${result.title}" escapeXml="false"/></a></td>
						<td class="left"><c:out value="${result.content}" escapeXml="false"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${workHistory.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
</form:form>
</div>

<c:out value="${workHistory.pageutil.pagingHtml}" escapeXml="false" />
