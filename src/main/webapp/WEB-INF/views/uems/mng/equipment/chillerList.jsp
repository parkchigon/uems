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
		var flag = "list"
		if(isEmpty(sgId)) {
			var html = "";
			html += "<option value=''>전체</option>";
			
			$("#searchCondition2").empty();
			$("#searchCondition2").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/equipment/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId
						,flag : flag},
				dataType : "json"
			}).done( function(data) {
				var list = data.siteList;
				var html = "";
				for(var i=0; i<list.length; i++) {
					if(list[i].siteId == '${chiller.searchCondition2}') {
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
	
	function goRegist(fsmId){
		var f = document.frm;
		f.currPage.value = ${chiller.currPage};
		f.fsmId.value = fsmId;
		f.action = "<c:url value='/uems/mng/equipment/chillerRegist.do'/>";
		f.submit();
	}
	
	function goSearch(){
		var f = document.frm;
		f.action = "<c:url value='/uems/mng/equipment/chillerList.do'/>"
		f.submit();
	}
</script>

<div class="contents_wrap">
<form:form commandName="chiller" name="frm" id="frm" method="post">
	<form:hidden path="fsmId"/>
	<input type ="hidden" id ="currPage" name = "currPage" value ="" />
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">장비관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 장비를 조회 및 관리를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	 <div class="tab_wrap">
		<ul>
			<li><a href="/uems/mng/equipment/pumpList.do">펌프관리</a></li>
			<li><a href="/uems/mng/equipment/heatExcList.do">열교환기관리</a></li>
			<li class="on"><a href="#">냉동기관리</a></li>
			<li><a href="/uems/mng/equipment/autoCtrlList.do">자동제어</a></li>
			<li><a href="/uems/mng/equipment/heatStgList.do">축열조 및 배관</a></li>
			<li><a href="/uems/mng/equipment/elecMccList.do">심야전기MCC</a></li>
			<li><a href="/uems/mng/equipment/cTowerList.do">냉각탑</a></li>
		</ul>
	 </div>
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
						<form:input class="inp_txt w02" path="searchKeyword" style="width:300px;" onkeydown='if(event.keyCode==13) goSearch();'></form:input>
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
				<c:when test="${fn:length(chillerList) eq 0}">
					<p class="tit_type01">총 : <strong class="imp">0</strong>개</p>
				</c:when>
				<c:otherwise>
					<p class="tit_type01">총 : <strong class="imp">${chillerList[0].sTotalcount}</strong>개</p>
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
				<col width="15%"/>
				<col width="15%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>지점</th>
					<th>장비명</th>
					<th>형식</th>
					<th>모델번호</th>
					<th>제조번호</th>
					<th>콤프수량</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${fn:length(chillerList) eq 0}">
					<tr>
						<td colspan="7"> 등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="result" items="${chillerList}" >
					<tr>
						<td>${result.sPagelistno}</td>
						<td>${result.siteDesc}</td>
						<td><a href="javascript:goRegist('${result.fsmId}');" class="link_imp01">${result.chillerName}</a></td>
						<td>${result.form}</td>
						<td>${result.modelNo}</td>
						<td>${result.manufactureNo}</td>
						<td>${result.compCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap-->
	<div class="rtl">
			<span class="btn btn_type02 btn_size02"><a href="javascript:goRegist('')">등 록</a></span>
	</div>
	 <!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${chiller.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
</form:form>
 </div>
<c:out value="${chiller.pageutil.pagingHtml}" escapeXml="false" />