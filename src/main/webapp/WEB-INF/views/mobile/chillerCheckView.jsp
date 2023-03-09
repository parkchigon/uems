<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/mobile/js/checkView.js"></script>
<script type="text/javascript" src="/resources/mobile/js/bridgeInterface.js"></script>
<script type="text/javaScript">

$(document).ready(function(){
	
		// value Setting
		<c:forEach var="answer" items="${answerList}" varStatus="status">
			$("input[name='result_${answer.answer}']").val("${answer.result}");
			$("input[name='result_${answer.answer}']").attr("id","${answer.msaId}");
			$("input[name='result_${answer.answer}']").attr("name","result_${answer.msaId}");
			
			$("select[name='result_${answer.answer}']").val("${answer.result}");
			$("select[name='result_${answer.answer}']").attr("id","${answer.msaId}");
			$("select[name='result_${answer.answer}']").attr("name","result_${answer.msaId}");
		</c:forEach>
		
		$("input:checkbox[name^='result']").each(function(){
			if($(this).val()=='Y'){
				$(this).attr("checked",true);
			}else{
				$(this).attr("checked",false);
			}
		})
	});
	
	// 점검완료 > 저장 
	function checkComplete(){
		var array = new Array();
		var request = new Object();
		var subSize = $("#subSize").val();
		var finishYn = "${BASIC_INFO.finishYn}";
		
		$("input:checkbox[name^='result']").each(function(){
			if($(this).is(":checked")){
				$(this).val("Y");
			}else{
				$(this).val("N");
			}
		});
		
		$("input[name^='result']").each(function(){
			json = new Object();
			json.msaId = $(this).attr("id");
			json.result = $(this).val();
			json.msId = "${sessionScope.SITE_INFO.msId}";
			json.chkMonth = $("#chkMonth").val();
			if(subSize > 0){
				var temp = $(this).attr("name");
				var temp2 = temp.split("_");
				json.subFacilityId = temp2[2];
			}else{
				json.subFacilityId = "-1";
			}
			array.push(json);
		});
		
		$("textarea").each(function(){
			json = new Object();
			json.msaId = $(this).attr("id");
			json.result = $(this).val();
			json.msId = "${sessionScope.SITE_INFO.msId}";
			json.chkMonth = $("#chkMonth").val();
			if(subSize > 0){
				var temp = $(this).attr("name");
				var temp2 = temp.split("_");
				json.subFacilityId = temp2[2];
			}else{
				json.subFacilityId = "-1";
			}
			array.push(json);
		})
		
		$("select[name^='result']").each(function(){
			json = new Object();
			json.msaId = $(this).attr("id");
			json.result = $(this).val();
			json.msId = "${sessionScope.SITE_INFO.msId}";
			json.chkMonth = $("#chkMonth").val();
			if(subSize > 0){
				var temp = $(this).attr("name");
				var temp2 = temp.split("_");
				json.subFacilityId = temp2[2];
			}else{
				json.subFacilityId = "-1";
			}
			array.push(json);
		})
		//작업관리 히스토리 저장 내용
		if(finishYn == 'N'){ //신규등록
			
			var etcArray = new Array();
			json = new Object();
			var etcArr =[];
			var title = "${BASIC_INFO.facilityName}";
			var sortNo = "";
			$("input[class^='etc_']").each(function(){
				var temp = $(this).attr("class").split("_");
				etcArr += "|("+temp[1]+")"+$(this).val();
			})
			json.etcContent = etcArr;
			json.etcTitle = title;
			etcArray.push(json);
			
		}else if(finishYn == 'Y'){ // 수정일경우 변경내용 여부 체크
			
			var etcArray = new Array();
			var updateYn = "N";
			<c:forEach var="answer" items="${answerList}" varStatus="status">
				<c:if test="${answer.checkTypeFlag eq 'N'}">
					json = new Object();
					var etcArr ='';
					var title = "${BASIC_INFO.facilityName}";
					var updateValue = '';
					var originValue = '';
					$("input[class^='etc_']").each(function(){
						if($(this).attr("id") == "${answer.msaId}"){
							updateValue = $(this).val();
							originValue = "${answer.result}";
						}
						var temp = $(this).attr("class").split("_");
						etcArr += "|("+temp[1]+")"+$(this).val();
						if(updateValue != originValue){
							updateYn = "Y";
						}
					})
				</c:if>
			</c:forEach>
			if(updateYn == "Y"){
				json.etcContent = etcArr;
				json.etcTitle = title;
				etcArray.push(json);
			}
		}
		
		request.valueSet = array;
		request.finishYn = "${BASIC_INFO.finishYn}";
		request.siteId = "${sessionScope.SITE_INFO.siteId}";
		request.etcValue = etcArray;
		
		// 점검내용 저장 Ajax 
		var text;
		var finishYn = "${BASIC_INFO.finishYn}";
		if(finishYn == "Y"){
			text = "수정";
		}else{
			text = "저장";
		}
		$.ajax({
			url  : "/mobileWeb/insertCheckValueAjax",
			type : "POST",
			data : JSON.stringify(request),
			dataType : "JSON",
			contentType : "application/json"
		}).done(function(data){
			if(data.resultCode = "0000"){
				alert("점검내용이"+text+"되었습니다.");
				reload();
			}else{
				alert("점검내용 "+text+"을 실패하였습니다.");
			}
		})
	}
	
	// 저장or수정 후 화면 reload
	function reload(){
		
		$("#msId").val("${BASIC_INFO.msId}");
		$("#facilityName").val("${BASIC_INFO.facilityName}");
		$("#facilityKind").val("${BASIC_INFO.facilityKind}");
		$("#finishYn").val("Y");
		$("#facilityId").val("${BASIC_INFO.facilityId}");
		$("#lnbFrm").submit();
	}

	function shootPicture(msqId,subFacilityId){
		var siteId = "${sessionScope.SITE_INFO.siteId}";
		var msId = "${sessionScope.SITE_INFO.msId}";
		var chkMonth = $("#chkMonth").val();
		
		UEMS_Native.uploadImage(siteId, chkMonth, msId, msqId, subFacilityId);
	}
</script>

<form id="viewForm">
<input type="hidden" id="msId" value="${sessionScope.SITE_INFO.msId}" />
<input type="hidden" id="chkMonth" value="${BASIC_INFO.chkMonth}" />
<input type="hidden" id="subSize" value="0" />
<input type="hidden" id="checkList" value="" />
<input type="hidden" id="firstYn" value="${BASIC_INFO.firstYn}" />
</form>

<div class="content_head_area">
	<h3>${BASIC_INFO.facilityName}</h3>
	<div class="fr">
		Status : 
		<c:choose>
			<c:when test="${BASIC_INFO.finishYn eq 'N'}"> 점검중 </c:when>
			<c:otherwise> 점검완료 </c:otherwise>
		</c:choose>
	</div>
</div>

<!-- s : content_area -->
<div id="content_area">
	<p class="subTitle_area">
		<a class="fr" href="#popup01" name="modal">설비정보보기</a>
	</p>
	<c:forEach var="question" items="${questionList}" varStatus="status">
		<div class="chart_area">
			<dl>
				<dt>${status.count}. ${question.question}
					<span class="fr">
						<a class="btn_camera" href="javascript:shootPicture('${question.msqId}','-1');"><span class="blind">사진촬영</span></a>
						<a class="btn_album" href="javascript:showPicture('${question.msqId}');"><span class="blind">앨범보기</span></a>
					</span>
				</dt>
				<dd>
					<c:choose>
						<c:when test="${question.designedCode eq '01'}">
							<table class="data_row">
								<caption>caption</caption>
								<colgroup>
									<col width="25%">
									<col width="35%">
									<col width="*">
								</colgroup>
					
								<thead>
									<tr>
										<th scope="col" colspan="3"><strong>단위: 1</strong></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th rowspan="15">
											<select id="" name="result_1_hour" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="23">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
													<fmt:formatNumber value='${n}' pattern='00' />시
													</option>
												</c:forEach>
											</select>
											<select id="" name="result_1_min" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="59">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
														<fmt:formatNumber value='${n}' pattern='00' />분
													</option>
												</c:forEach>
											</select>
										</th>
										<th colspan="2">브라인(냉수)</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" name="result_1_brine_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_1_brine_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">증발기(저압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_1_evaporator1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_1_evaporator2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">냉각수</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" name="result_1_cool_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_1_cool_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">응축기(고압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_1_condenser1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_1_condenser2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">압축기</th>
									</tr>
									<tr>
										<th>#1: 전류(A)</th>
										<td><input type="text" name="result_1_compressor1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 전류(A)</th>
										<td><input type="text" name="result_1_compressor2" value="" /></td>
									</tr>
								</tbody>
							</table>
							
							<table class="data_row mt20">
							<caption>caption</caption>
							<colgroup>
								<col width="25%">
								<col width="35%">
								<col width="*">
							</colgroup>
				
								<thead>
									<tr>
										<th scope="col" colspan="3"><strong>단위: 2</strong></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th rowspan="15">
											<select id="" name="result_2_hour" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="23">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
													<fmt:formatNumber value='${n}' pattern='00' />시
													</option>
												</c:forEach>
											</select>
											<select id="" name="result_2_min" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="59">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
														<fmt:formatNumber value='${n}' pattern='00' />분
													</option>
												</c:forEach>
											</select>
										</th>
										<th colspan="2">브라인(냉수)</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" name="result_2_brine_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_2_brine_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">증발기(저압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_2_evaporator1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_2_evaporator2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">냉각수</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" name="result_2_cool_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_2_cool_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">응축기(고압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_2_condenser1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_2_condenser2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">압축기</th>
									</tr>
									<tr>
										<th>#1: 전류(A)</th>
										<td><input type="text" name="result_2_compressor1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 전류(A)</th>
										<td><input type="text" name="result_2_compressor2" value="" /></td>
									</tr>
								</tbody>
							</table>
							
							<table class="data_row mt20">
							<caption>caption</caption>
							<colgroup>
								<col width="25%">
								<col width="35%">
								<col width="*">
							</colgroup>
				
								<thead>
									<tr>
										<th scope="col" colspan="3"><strong>단위: 3</strong></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th rowspan="15">
											<select id="" name="result_3_hour" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="23">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
													<fmt:formatNumber value='${n}' pattern='00' />시
													</option>
												</c:forEach>
											</select>
											<select id="" name="result_3_min" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="59">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
														<fmt:formatNumber value='${n}' pattern='00' />분
													</option>
												</c:forEach>
											</select>
										</th>
										<th colspan="2">브라인(냉수)</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" id="" name="result_3_brine_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_3_brine_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">증발기(저압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_3_evaporator1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_3_evaporator2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">냉각수</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" name="result_3_cool_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_3_cool_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">응축기(고압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_3_condenser1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_3_condenser2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">압축기</th>
									</tr>
									<tr>
										<th>#1: 전류(A)</th>
										<td><input type="text" name="result_3_compressor1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 전류(A)</th>
										<td><input type="text" name="result_3_compressor2" value="" /></td>
									</tr>
								</tbody>
							</table>
							
							<table class="data_row mt20">
							<caption>caption</caption>
							<colgroup>
								<col width="25%">
								<col width="35%">
								<col width="*">
							</colgroup>
				
								<thead>
									<tr>
										<th scope="col" colspan="3"><strong>단위: 4</strong></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<tr>
										<th rowspan="15">
											<select id="" name="result_4_hour" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="23">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
													<fmt:formatNumber value='${n}' pattern='00' />시
													</option>
												</c:forEach>
											</select>
											<select id="" name="result_4_min" style="width: 50px;margin-bottom: 5px;">
												<c:forEach var="n" begin="0" end="59">
													<option value="<fmt:formatNumber value='${n}' pattern='00' />">
														<fmt:formatNumber value='${n}' pattern='00' />분
													</option>
												</c:forEach>
											</select>
										</th>
										<th colspan="2">브라인(냉수)</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" name="result_4_brine_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_4_brine_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">증발기(저압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_4_evaporator1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_4_evaporator2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">냉각수</th>
									</tr>
									<tr>
										<th>입구온도(℃)</th>
										<td><input type="text" name="result_4_cool_in_temp" value="" /></td>
									</tr>
									<tr>
										<th>출구온도(℃)</th>
										<td><input type="text" name="result_4_cool_out_temp" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">응축기(고압)</th>
									</tr>
									<tr>
										<th>#1: 압력(kg/㎠)</th>
										<td><input type="text" name="result_4_condenser1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 압력(kg/㎠)</th>
										<td><input type="text" name="result_4_condenser2" value="" /></td>
									</tr>
									
									<tr>
										<th colspan="2">압축기</th>
									</tr>
									<tr>
										<th>#1: 전류(A)</th>
										<td><input type="text" name="result_4_compressor1" value="" /></td>
									</tr>
									<tr>
										<th>#2: 전류(A)</th>
										<td><input type="text" name="result_4_compressor2" value="" /></td>
									</tr>
								</tbody>
							</table>
							<table class="data_row mt20">
								<caption>caption</caption>
								<colgroup>
									<col width="25%">
									<col width="35%">
									<col width="*">
								</colgroup>
					
									<tbody>
										<tr>
											<th rowspan="15">
												비고
											</th>
											<th colspan="2">브라인(냉수)</th>
										</tr>
										<tr>
											<th>입구온도(℃)</th>
											<td><input type="text" name="result_etc_brine_in_temp" value="" /></td>
										</tr>
										<tr>
											<th>출구온도(℃)</th>
											<td><input type="text" name="result_etc_brine_out_temp" value="" /></td>
										</tr>
										
										<tr>
											<th colspan="2">증발기(저압)</th>
										</tr>
										<tr>
											<th>#1: 압력(kg/㎠)</th>
											<td><input type="text" name="result_etc_evaporator1" value="" /></td>
										</tr>
										<tr>
											<th>#2: 압력(kg/㎠)</th>
											<td><input type="text" name="result_etc_evaporator2" value="" /></td>
										</tr>
										
										<tr>
											<th colspan="2">냉각수</th>
										</tr>
										<tr>
											<th>입구온도(℃)</th>
											<td><input type="text" name="result_etc_cool_in_temp" value="" /></td>
										</tr>
										<tr>
											<th>출구온도(℃)</th>
											<td><input type="text" name="result_etc_cool_out_temp" value="" /></td>
										</tr>
										
										<tr>
											<th colspan="2">응축기(고압)</th>
										</tr>
										<tr>
											<th>#1: 압력(kg/㎠)</th>
											<td><input type="text" name="result_etc_condenser1" value="" /></td>
										</tr>
										<tr>
											<th>#2: 압력(kg/㎠)</th>
											<td><input type="text" name="result_etc_condenser2" value="" /></td>
										</tr>
										
										<tr>
											<th colspan="2">압축기</th>
										</tr>
										<tr>
											<th>#1: 전류(A)</th>
											<td><input type="text" name="result_etc_compressor1" value="" /></td>
										</tr>
										<tr>
											<th>#2: 전류(A)</th>
											<td><input type="text" name="result_etc_compressor2" value="" /></td>
										</tr>
									</tbody>
								</table>
									
						</c:when>
						<c:otherwise>
							<ol>
								<c:if test="${fn:length(answerList) ne 0}">
									<c:forEach var="answer" items="${answerList}" varStatus="status">
										<c:if test="${answer.msqId eq question.msqId}">
											<c:choose>
												<c:when test="${answer.checkTypeFlag eq 'Y' }">
													<li>${answer.sortNo}) ${answer.answer}
														<span class="fr">
															<label for="">확인여부</label><input type="checkbox" id="${answer.msaId}" name="result_${answer.msaId}" value="${answer.result}"/>
														</span>
												</c:when>
												<c:when test="${answer.checkTypeFlag eq 'E' }">
													<li>${answer.sortNo}) ${answer.answer}
														<textarea id="${answer.msaId}" name="result_${answer.msaId}">${answer.result}</textarea>
												</c:when>
												<c:when test="${answer.checkTypeFlag eq 'N' }">
													<c:if test="${question.designedCode eq '99' }">
														<li style="display:inline;">${answer.sortNo})
															<input type="text" id="${answer.msaId}" name="result_${answer.msaId}" value="${answer.result}" style="display:inline;" class="etc_${answer.sortNo}"/>
													</c:if>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:if>
							</ol>
						</c:otherwise>
					</c:choose>
				</dd>
			</dl>
		</div>	
	</c:forEach>
	
	
	<div class="btn_areaC mt5">
		<a class="btnType btn_type02" href="javascript:checkComplete();">점검완료</a>
	</div>
</div>
<!-- e : content_area -->


<!-- layerPopup -->
<div class="popup_container" id="popup01">
	<div class="popup_header">설비정보 <a class="closePop" href="#"><span class="blind">메뉴닫기</span></a></div>
	<div class="popup_content">
		<table class="data_row">
		<caption>caption</caption>
		<colgroup>
			<col width="35%">
			<col width="*">
		</colgroup>

			<tbody>
				<tr>
					<th>고객명</th>
					<td>${sessionScope.SITE_INFO.sgName} ${sessionScope.SITE_INFO.siteName}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${DETAIL_INFO.address}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${DETAIL_INFO.phone}</td>
				</tr>
				<tr>
					<th>시운전일자</th>
					<td>${DETAIL_INFO.testRunDate}</td>
				</tr>
				<tr>
					<th>전원</th>
					<td>${DETAIL_INFO.powerSupply}</td>
				</tr>
				<tr>
					<th>형식</th>
					<td>${DETAIL_INFO.form}</td>
				</tr>
				<tr>
					<th>콤프수량</th>
					<td>${DETAIL_INFO.compCount}EA</td>
				</tr>
				<tr>
					<th>모델번호</th>
					<td>${DETAIL_INFO.modelNo}</td>
				</tr>
				<tr>
					<th>기동방식</th>
					<td>${DETAIL_INFO.drivenMethod}</td>
				</tr>
				<tr>
					<th>제조번호</th>
					<td>${DETAIL_INFO.manufactureNo}</td>
				</tr>
				<tr>
					<th>냉매</th>
					<td>${DETAIL_INFO.refrigName}  /  ${DETAIL_INFO.refrigAmount}</td>
				</tr>
				<tr>
					<th>업체명</th>
					<td>${DETAIL_INFO.salesInfo}</td>
				</tr>
				<tr>
					<th>A/S</th>
					<td>${DETAIL_INFO.asInfo}</td>
				</tr>
			</tbody>
		</table>
		
		<table class="data_row mt20">
			<caption>caption</caption>
			<colgroup>
				<col width="*">
				<col width="17.5%">
				<col width="17.5%">
				<col width="17.5%">
				<col width="17.5%">
			</colgroup>

			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col" colspan="2">야간</th>
					<th scope="col" colspan="2">주간</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>용량(USRt)</th>
					<td colspan="2">${DETAIL_INFO.volumeNight}</td>
					<td colspan="2">${DETAIL_INFO.volumeDay}</td>
				</tr>
				<tr>
					<th>냉수온도(℃)</th>
					<td colspan="2">${DETAIL_INFO.colTempNight1} / ${DETAIL_INFO.colTempNight2}</td>
					<td colspan="2">${DETAIL_INFO.colTempDay1} / ${DETAIL_INFO.colTempDay1}</td>
				</tr>
				<tr>
					<th>냉각수온도(℃)</th>
					<td colspan="2">${DETAIL_INFO.colwaterTempNight1} / ${DETAIL_INFO.colwaterTempNight2}</td>
					<td colspan="2">${DETAIL_INFO.colwaterTempDay1} / ${DETAIL_INFO.colwaterTempDay2}</td>
				</tr>
				<tr>
					<th>유체</th>
					<td colspan="2">${DETAIL_INFO.fluidDay}</td>
					<td colspan="2">${DETAIL_INFO.fluidNight}</td>
				</tr>
				<tr>
					<th rowspan="2">유량(㎡/h/lpm)</th>
					<th colspan="2">냉수</th>
					<th colspan="2">냉각수</th>
				</tr>
				<tr>
					<td>${DETAIL_INFO.flowNight1}㎡/h</td>
					<td>${DETAIL_INFO.flowNight2}pm</td>
					<td>${DETAIL_INFO.flowDay1}㎡/h</td>
					<td>${DETAIL_INFO.flowDay2}pm</td>
				</tr>
				<tr>
					<th rowspan="2">압력손실(kg/㎠)</th>
					<th colspan="2">냉수</th>
					<th colspan="2">냉각수</th>
				</tr>
				<tr>
					<td colspan="2">${DETAIL_INFO.presslossNight}</td>
					<td colspan="2">${DETAIL_INFO.presslossDay}</td>
				</tr>
				<tr>
					<th>소비전력(kw)</th>
					<td colspan="2">${DETAIL_INFO.consumpowerNight}</td>
					<td colspan="2">${DETAIL_INFO.consumpowerDay}</td>
				</tr>
				<tr>
					<th>전류(A)</th>
					<td colspan="2">${DETAIL_INFO.currentNight}</td>
					<td colspan="2">${DETAIL_INFO.currentDay}</td>
				</tr>
				<tr>
					<th>COP</th>
					<td colspan="2">${DETAIL_INFO.copNight}</td>
					<td colspan="2">${DETAIL_INFO.copDay}</td>
				</tr>
				<tr>
					<th>제어범위</th>
					<td colspan="4">${DETAIL_INFO.controlRange1}% ~ ${DETAIL_INFO.controlRange2}%</td>
				</tr>
				<tr>
					<th>특이사항</th>
					<td colspan="4">콤프대수제어 구성</td>
				</tr>
				<tr>
					<th>중량</th>
					<th>제품</th>
					<td>${DETAIL_INFO.weightProduct}ton</td>
					<th>운전</th>
					<td>${DETAIL_INFO.weightDriven}ton</td>
				</tr>
				<tr>
					<th rowspan="2">접속관경(A)</th>
					<th colspan="2">냉수</th>
					<th colspan="2">냉각수</th>
				</tr>
				<tr>
					<td colspan="2">${DETAIL_INFO.pipeDiamWt}</td>
					<td colspan="2">${DETAIL_INFO.pipeDiamCw}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>	