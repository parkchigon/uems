<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		
		var sgIdVal = $("#sgIdVal").val();
		$("#siteGroup").val(sgIdVal);
		if(sgIdVal != ''){
			callAjax(sgIdVal);
		}
		
		
		$("#siteGroup").change(function(){
			var sgId = $("#siteGroup option:selected").val();
			if(sgId!=""){
				callAjax(sgId);
			}else{
				$("#siteList").empty();
			}
		})
	});

	/* 그룹별 지점리스트 ajax호출 */
	function callAjax(sgId){
		$.ajax({
			url : "/uems/mng/tag/selectSiteListAjax.do",
			type: "POST",
			data: {sgId : sgId},
			dataType : "json"
		}).done( function(data) {
			
			var length = data.siteList.length;
			var siteList = data.siteList;
			var siteHtml = '';
			if(length > 0){
				for(var i=0; i<length; i++){
					siteHtml += "<option value='"+siteList[i].siteCd+"'>"+siteList[i].siteName+"</option>";
				}
			}
			$("#siteList").empty();
			$("#siteList").append(siteHtml);
			var siteCdVal = $("#siteCdVal").val();
			if(siteCdVal!=''){
				$("#siteList").val(siteCdVal);
			}
			
		})
	}
	
	/* 리스트 검색 */
	function goSearch() {
		var f = document.frm;
		f.searchKeyword.value = $.trim($("input[name=searchKeyword]").val());
		f.action = "<c:url value='/uems/mng/tag/tagList.do'/>";
		f.submit();
	}
	
	/* 상황일지태그적용 : daily_record_flag Y/N update */
	function dailyRecordUpdate(){
		var siteCdArr=[];
		var tagIdArr=[];
		$("input[name='dailyRecordFlagChk']:checkbox").each(function(i){
			if($(this).attr("checked") == "checked"){
				siteCdArr.push($("input[name='siteCdCond']").eq(i).val());
				tagIdArr.push($("input[name='tagIdCond']").eq(i).val());
			}
		})
		$("#siteCdArr").val(siteCdArr.join(","));
		$("#tagIdArr").val(tagIdArr.join(","));
		if(siteCdArr.length > 0){
			var f = document.frm;
			f.action = "<c:url value='/uems/mng/tag/updateDailyRecordFlag.do'/>";
			f.submit();
		}else{
			alert("선택된 태그가 없습니다.");
		}
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="tag" name="frm" id="frm" method="post">	
	<input type="hidden" id="sgIdVal" value="${tag.sgId}" />
	<input type="hidden" id="siteCdVal" value="${tag.siteCd}" />
	<input type="hidden" id="siteCdArr" name="siteCdArr"  />
	<input type="hidden" id="tagIdArr" name="tagIdArr" />
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">태그 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 태그정보를 조회 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="20%" />
				<col width="*%" />
			</colgroup>
			
			<tbody>
				<tr>
					<td>
						<span class="sel_wrap w01" style="width:100px;">
							<select id="siteGroup" name="sgId">
								<option value="">전체</option>
								<option value="1" >이마트</option>
								<option value="2">신세계</option>
							</select>
						</span>
						<span class="sel_wrap w01" style="width:100px;">
							<select id="siteList" name="siteCd">
								<option value=""></option>
							</select>
						</span>
					</td>
					<td>	
						<span class="sel_wrap w01" style="width:100px;">태그타입</span>
						<span class="sel_wrap w01" style="width:100px;">
							<form:select path="searchCondition">
								<form:option value="" label="전체"/>
								<c:forEach var="result" items="${tagTypeList}" varStatus="status">
									<form:option  value="${result.codeUseName}" label="${result.codeName}"/>
								</c:forEach>
							</form:select>
						</span>
						<input type="text" name="searchKeyword" style="width:200px;" class="inp_txt w02" value="${tag.searchKeyword}" />
						<span class="btn btn_type02 btn_size02"><a href="javascript:goSearch();">검 색</a></span>
					</td>
				</tr>
			<tbody>
		</table>
	</div>
	<!-- e: search -->
	<!-- s: btn -->
	<br><br>
	<!-- e: btn -->
	
	<!-- s: table wrap-->
	
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
			<colgroup>
				<col width="5%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="6%"/>
				<col width="8%"/>
				<col width="*%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="6%"/>
				<col width="6%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="8%"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>그룹</th>
					<th>지점명</th>
					<th>태그타입</th>
					<th>태그ID</th>
					<th>태그명</th>
					<th>태그유형</th>
					<th>단위</th>
					<th>Read주소</th>
					<th>Write주소</th>
					<th>경보</th>
					<th>저장</th>
					<th>상황일지태그</th>
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
						<td><c:out value="${result.sgName}" escapeXml="false"/></td>
						<td><c:out value="${result.siteName}" escapeXml="false"/></td>
						<td><c:out value="${result.tagTypeCdNm}" escapeXml="false"/></td>
						<td><c:out value="${result.tagId}" escapeXml="false"/></td>
						<td><c:out value="${result.tagDesc}" escapeXml="false"/></td>
						<td><c:out value="${result.tagKindCdNm}" escapeXml="false"/></td>
						<td><c:out value="${result.aiUnitCd}" escapeXml="false"/></td>
						<td><c:out value="${result.iPlcscanAddress}" escapeXml="false"/></td>
						<td><c:out value="${result.oPlcscan}" escapeXml="false"/></td>
						<td><c:out value="${result.iAlarmUseFlag}" escapeXml="false"/></td>
						<td><c:out value="${result.iDataSaveFlag}" escapeXml="false"/></td>
						<td>
							<c:choose>
								<c:when test="${result.tagTypeCd eq 'TAG_TYPE2' or result.tagTypeCd eq 'TAG_TYPE4' or (result.tagTypeCd eq 'TAG_TYPE1' and result.iAlarmUseFlag eq 'N')}">
									<input type="checkbox" name="dailyRecordFlagChk" disabled/>
								</c:when>
								<c:otherwise>
									<c:if test="${result.dailyRecordFlag eq 'Y'}" >
										<input type="checkbox" name="dailyRecordFlagChk" checked="checked"/>
									</c:if>
									<c:if test="${result.dailyRecordFlag eq 'N'}" >
										<input type="checkbox" name="dailyRecordFlagChk" />
									</c:if>
								</c:otherwise>
							</c:choose>
							
							<input type="hidden" name="siteCdCond" value="${result.siteCd}"/>
							<input type="hidden" name="tagIdCond" value="${result.tagId}"/>
						</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<span class="btn btn_type01 btn_size02" style="float:right;"><a href="javascript:dailyRecordUpdate();">상황일지태그적용</a></span>
	<!-- e: table wrap-->
	
	<!-- s: 페이징 -->
	<div class="paging_wrap">
		<c:out value="${tag.pageutil.pagingBody}" escapeXml="false" />
	</div>
	
	<!-- e: 페이징 -->
</form:form>
<c:out value="${tag.pageutil.pagingHtml}" escapeXml="false" />
</div>