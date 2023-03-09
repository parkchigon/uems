<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	 	selectSiteList($("#searchCondition").val());
		$("#searchCondition").change(function() {
			selectSiteList($(this).val());
		});
	});
	
	function goSearch() { // 검색
		var f = document.frm;
		f.action = "<c:url value='/uems/mng/data/dataList.do'/>"	
		f.submit();
	}
	
	function goRegist(month,siteId) { //등록,상세 화면 이동
		var f = document.frm;
		f.month.value = month;
		f.currPage.value = ${data.currPage};
		f.siteId.value = siteId;
		f.action = "<c:url value='/uems/mng/data/dataRegist.do'/>";
		f.submit();
	}
	
	function selectSiteList(sgId) { //지점별 리스트
			var flag = "list"
			if(isEmpty(sgId)) {
				var html = "";
				html += "<option value=''>전체</option>";
				
				$("#searchCondition2").empty();
				$("#searchCondition2").append(html);
				
			} else {
				$.ajax({
					url : "/uems/mng/data/selectSiteListAjax.do",
					type: "POST",
					data: {searchCondition : sgId
							,flag : flag},
					dataType : "json"
				}).done( function(data) {
					var list = data.siteList;
					var html = "";
					for(var i=0; i<list.length; i++) {
						if(list[i].siteId == '${data.searchCondition2}') {
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
<form:form commandName="data" name="frm" id="frm" method="post">	
	<form:hidden path="month"/>
	<input type ="hidden" id ="siteId" name = "siteId" value ="" />
	<input type ="hidden" id ="currPage" name = "currPage" value ="" />
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">월별운영데이터관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;월별운영데이터를 조회 및 관리를 합니다.</div></li>
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
				<tr class="rtl">
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
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="year">
								<form:option value="" label="전체"/>
								<c:forEach var="result" items="${yearList}" varStatus="status">
									<form:option value="${result}">${result}</form:option>
								</c:forEach>
							</form:select>
						</span>
						<span class="btn btn_type02 btn_size02"><a href="javascript:goSearch()">검 색</a></span>
					</td>
				</tr>
			<tbody>
		</table>
	</div> 
	<br><br>

	 <div class="thead_wrap cboth">
	 
	 <div class="ltr">
			<c:choose>
				<c:when test="${fn:length(dataList) eq 0}">
					<p class="tit_type01">총 : <strong class="imp">0</strong>개</p>
				</c:when>
				<c:otherwise>
					<p class="tit_type01">총 : <strong class="imp">${dataList[0].sTotalcount}</strong>개</p>
				</c:otherwise>	
			</c:choose>
		</div>
	</div>
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="5%"/>
				<col width="15%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>지점</th>
					<th>년월</th>
					<th>냉방사용요금(기존)</th>
					<th>냉방사용요금(빙축)</th>
					<th>에너지사용량(기존)</th>
					<th>에너지사용량(빙축)</th>
					<th>탄소배출량(기존)</th>
					<th>탄소배출량(빙축)</th>
					<th>냉방부하량</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(dataList) eq 0}">
					<tr>
						<td colspan="10"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${dataList}" varStatus="status">
					<tr>
						<td>${result.sPagelistno}</td>
						<td><a href="javascript:goRegist('${result.month}' , '${result.siteId}');" class="link_imp01">${result.siteDesc}</a></td>
						<td>${result.month}</td>
						<td>${result.prevCoolCharge}</td>
						<td>${result.presCoolCharge}</td>
						<td>${result.prevEnergyAmount}</td>
						<td>${result.presEnergyAmount}</td>
						<td>${result.prevTcoAmount}</td>
						<td>${result.presTcoAmount}</td>
						<td>${result.coolingLoadAmount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="rtl">
			<span class="btn btn_type02 btn_size02"><a href="javascript:goRegist()">등 록</a></span>
	</div>
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${data.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
</form:form>
</div>
<c:out value="${data.pageutil.pagingHtml}" escapeXml="false" />