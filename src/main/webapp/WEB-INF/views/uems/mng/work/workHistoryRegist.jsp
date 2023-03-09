<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script src="/resources/uems/js/plugin/ckeditor/ckeditor.js"></script>
<script src="/resources/uems/js/plugin/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="/resources/uems/js/lib/editor-util-1.1.js"></script>

<script type="text/javaScript">
	
	$(document).ready(function(){
		
		setTextLengthLimit("#title", 200);
		
		if(isEmpty($("#workId").val())) {
			$("#workDate").val(getCurrentDate());
		} else {
			$("select[name=sgId]").val('${workHistoryView.sgId}').attr("selected", true);
		}
		
		//CKEDITOR 사이즈 조정
		//CKEDITOR.replace('content', {width:'100%', height:'280px'}); 
		
		selectSiteList($("#sgId").val());
		
		$("#sgId").change(function() {
			selectSiteList($(this).val());
		});
		
	});
	
	// 작업이력 리스트
	function workHistoryList() {
		var f = document.frm;
		f.action = "<c:url value='/uems/mng/work/workHistoryList.do'/>";
		f.submit();
	}
	
	// 작업이력 등록 및 수정
	function workHistoryRegistExe() {	
		
		if(isEmpty($("#workDate").val())) {
			alert('작업일자를 선택해주세요.');
			return;
		}
		
		if (formValidationCheck(['title'])){
			var f = document.frm;
			if(confirm("해당 작업이력을 저장하시겠습니까?")){
				f.action = "<c:url value='/uems/mng/work/workHistoryRegistExe.do'/>";
				f.submit();
			}
		}
	}
	
	//validation 관련 alert 메시지
	function alertMessageSource(el_id){
		switch (el_id) {
			case 'title':
				alert('제목을 입력해주세요.');
				break;
		}
	}
	
	// 작업이력 삭제
	function deleteWorkHistory() {
		var f = document.frm;

		if(confirm("해당 작업이력을 삭제하시겠습니까?")){
			f.action = "<c:url value='/uems/mng/work/workHistoryRemoveExe.do'/>";
			f.submit();
		}
	}
	
	function selectSiteList(sgId) {
		
		$.ajax({
			url : "/uems/mng/user/selectSiteListAjax.do",
			type: "POST",
			data: {searchCondition : sgId},
			dataType : "json"
		}).done( function(data) {
			var list = data.siteList;
			var html = "";
			for(var i=0; i<list.length; i++) {
				if(list[i].siteId == '${workHistoryView.siteId}') {
					html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
				} else {
					html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
				}
			}
			
			$("#siteId").empty();
			$("#siteId").append(html);
			
		});
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="workHistory" name="frm" id="frm" method="post">	
	<form:hidden path="workId" value="${workHistoryView.workId}"/>	
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">작업 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 작업 이력을 조회 및 관리를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
			<colgroup>
				<col width="8%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th>지점명 *</th>
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="sgId">
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="siteId" name="siteId">
							</select>
						</span>
					</td>
				</tr>
				<tr>
					<th>작업 일자 *</th>
					<td>
						<span class="entry_calendar">
							<fmt:parseDate value="${workHistoryView.workDate}" var="workDate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="workDate" name="workDate" value="<fmt:formatDate value="${workDate}" pattern="yyyy-MM-dd"/>" style="width:77px;" ></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td>
				</tr>				
				<tr>
					<th>장비 *</th>
					<td>
						<input type="text" name="title" id="title" value="<c:out value="${workHistoryView.title}" escapeXml="false" /> " class="inp_txt w01"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="content" name="content" style="width:100%; height:280px; resize:none;"><c:out value="${workHistoryView.content}" escapeXml="false" /></textarea> 
					</td>
				</tr>
				<tr>
				<th>첨부파일</th>
				<td>
					<p>※ 이미지는 (.jpg / .gif / .png)파일만 올릴 수 있습니다.</p>
					<div class="gp01">
						<div class="fileSet_wrap">
							<div id="board" uploadType="file" checked_yn="Y" class="fileset" json="board" fileSize="${workHistoryView.fileSize}" serverType="<spring:eval expression="@config['environment.type']"/>" editor="fileUtil" ref="<c:out value='${workHistory.workId}'/>" designTy="admin">
							</div>
						</div>
					</div>
					</td>
				</tr>		
			</tbody>
		</table>
	</div>
	<!-- e: table wrap -->
	
	<!-- s: btn wrap 가운데 정렬-->
	<div class="btn_wrap02">
		<span class="btn btn_type02 btn_size03"><a href="javascript:workHistoryRegistExe();">저장</a></span>
		<c:if test="${not empty workHistoryView.workId}">
			<span class="btn btn_type02 btn_size03"><a href="javascript:deleteWorkHistory();">삭제</a></span>
		</c:if>
		<span class="btn btn_type01 btn_size03"><a href="/uems/mng/work/workHistoryList.do">취소</a></span>
	</div>
	<!-- e: btn wrap-->
</form:form>
</div>
