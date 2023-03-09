<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/mobile/js/checkView.js"></script>
<script type="text/javascript" src="/resources/mobile/js/bridgeInterface.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	
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
	
	//작업관리 히스토리 저장 내용
	if(finishYn == 'N'){ //신규등록
		
		var etcArray = new Array();
		<c:forEach var="subList" items="${SUB_DETAIL_INFO}" varStatus="subStatus">
			json = new Object();
			var subId = "${subList.fpId}";
			var etcArr =[];
			var title = "${BASIC_INFO.facilityName}(${subList.ctowerSubName})";
			var sortNo = "";
			$("input[class^='etc_"+subId+"']").each(function(){
				var temp = $(this).attr("class").split("_");
				etcArr += "|("+temp[2]+")"+$(this).val();
			})
			json.etcContent = etcArr;
			json.etcTitle = title;
			etcArray.push(json);
		</c:forEach>
		
	}else if(finishYn == 'Y'){ // 수정일경우 변경내용 여부 체크, [펌프],[냉각탑] 은 sub장비별로 비교
		
		var etcArray = new Array();
		<c:forEach var="subList" items="${SUB_DETAIL_INFO}" varStatus="subStatus">
			var updateYn = "N";
			<c:forEach var="answer" items="${answerList}" varStatus="status">
				<c:if test="${subList.fcId eq answer.subFacilityId && answer.checkTypeFlag eq 'N'}">
					json = new Object();
					var subId = "${subList.fcId}";
					var etcArr ='';
					var title = "${BASIC_INFO.facilityName}(${subList.ctowerSubName})";
					var updateValue = '';
					var originValue = '';
					$("input[class^='etc_"+subId+"']").each(function(){
						if($(this).attr("id") == "${answer.msaId}"){
							updateValue = $(this).val();
							originValue = "${answer.result}";
						}
						var temp = $(this).attr("class").split("_");
						etcArr += "|("+temp[2]+")"+$(this).val();
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
		</c:forEach>
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
	
	alert(siteId+":"+msId+":"+chkMonth+":"+msqId+":"+subFacilityId);
	
	UEMS_Native.uploadImage(siteId, chkMonth, msId, msqId, subFacilityId);
}

</script>

<form id="viewForm">
<input type="hidden" id="msId" value="${sessionScope.SITE_INFO.msId}" />
<input type="hidden" id="chkMonth" value="${BASIC_INFO.chkMonth}" />
<input type="hidden" id="subSize" value="${SUB_DETAIL_INFO_SIZE}" />
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
	<c:if test="${SUB_DETAIL_INFO_SIZE > 0}">
		<c:forEach var="subList" items="${SUB_DETAIL_INFO}" varStatus="subStatus">
			<p class="subTitle_area">${subList.ctowerSubName}
				<c:if test="${subStatus.index eq 0}">
					<a class="fr" href="#popup01" name="modal">설비정보보기</a>
				</c:if>
			</p>
			<c:forEach var="question" items="${questionList}" varStatus="status">
				<div class="chart_area">
					<dl>
						<dt>${status.count}. ${question.question}
							<span class="fr">
								<a class="btn_camera" href="javascript:shootPicture('${question.msqId}','${subList.fcId}');"><span class="blind">사진촬영</span></a>
								<a class="btn_album" href="javascript:showPicture('${question.msqId}');"><span class="blind">앨범보기</span></a>
							</span>
						</dt>
						<dd>
							<ol>
								<c:if test="${fn:length(answerList) ne 0}">
									<c:forEach var="answer" items="${answerList}" varStatus="status">
										<c:choose>
											<c:when test="${BASIC_INFO.finishYn eq 'Y'}">
												<c:if test="${answer.msqId eq question.msqId && subList.fcId eq answer.subFacilityId}">
													<c:choose>
														<c:when test="${answer.checkTypeFlag eq 'Y' }">
															<li>${answer.sortNo}) ${answer.answer}
																<span class="fr">
																	<label for="">확인여부</label><input type="checkbox" id="${answer.msaId}" name="result_${answer.msaId}_${subList.fcId}" value="${answer.result}"/>
																</span>
														</c:when>
														<c:when test="${answer.checkTypeFlag eq 'E' }">
															<li>${answer.sortNo}) ${answer.answer}
																<textarea id="${answer.msaId}" name="result_${answer.msaId}_${subList.fcId}">${answer.result}</textarea>
														</c:when>
														<c:when test="${answer.checkTypeFlag eq 'N' }">
															<c:if test="${question.designedCode eq '01' }">
																<!-- 고정템플릿 없음 -->
															</c:if>
															<c:if test="${question.designedCode eq '99' }">
																<li style="display:inline;">${answer.sortNo})
																	<input type="text" id="${answer.msaId}" name="result_${answer.msaId}_${subList.fcId}" value="${answer.result}" style="display:inline;" class="etc_${subList.fcId}_${answer.sortNo}"/>
															</c:if>
														</c:when>
														<c:otherwise></c:otherwise>
													</c:choose>
												</c:if>
											</c:when>
											
											<c:otherwise>
												<c:if test="${answer.msqId eq question.msqId}">
													<c:choose>
														<c:when test="${answer.checkTypeFlag eq 'Y' }">
															<li>${answer.sortNo}) ${answer.answer}
																<span class="fr">
																	<label for="">확인여부</label><input type="checkbox" id="${answer.msaId}" name="result_${answer.msaId}_${subList.fcId}" value="${answer.result}"/>
																</span>
														</c:when>
														<c:when test="${answer.checkTypeFlag eq 'E' }">
															<li>${answer.sortNo}) ${answer.answer}
																<textarea id="${answer.msaId}" name="result_${answer.msaId}_${subList.fcId}">${answer.result}</textarea>
														</c:when>
														<c:when test="${answer.checkTypeFlag eq 'N' }">
															<c:if test="${question.designedCode eq '01' }">
																<!-- 고정템플릿 없음 -->
															</c:if>
															<c:if test="${question.designedCode eq '99' }">
																<li style="display:inline;">${answer.sortNo})
																	<input type="text" id="${answer.msaId}" name="result_${answer.msaId}_${subList.fcId}" value="${answer.result}" style="display:inline;" class="etc_${subList.fpId}_${answer.sortNo}"/>
															</c:if>
														</c:when>
														<c:otherwise></c:otherwise>
													</c:choose>
												</c:if>
											</c:otherwise>
										</c:choose>
										
									</c:forEach>
								</c:if>
							</ol>
						</dd>
					</dl>
				</div>	
			</c:forEach>
		</c:forEach>
	</c:if>
	<c:if test="${SUB_DETAIL_INFO_SIZE < 1}">
		<p class="subTitle_area"><a class="fr" href="#popup01" name="modal">설비정보보기</a></p>
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
												<c:if test="${question.designedCode eq '01' }">
													<!-- 고정템플릿 없음 -->
												</c:if>
												<c:if test="${question.designedCode eq '99' }">
													<li style="display:inline;">${answer.sortNo})
														<input type="text" id="${answer.msaId}" name="result_${answer.msaId}" value="${answer.result}" style="display:inline;" class="etc_${subList.fpId}_${answer.sortNo}"/>
												</c:if>
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</c:if>
						</ol>
					</dd>
				</dl>
			</div>	
		</c:forEach>
	</c:if>
	
	<div class="btn_areaC mt5">
		<a class="btnType btn_type02" href="javascript:checkComplete();">점검완료</a>
	</div>
</div>
<!-- e : content_area -->


<div class="popup_container" id="popup01">
	<div class="popup_header">설비정보 <a class="closePop" href="#"><span class="blind">메뉴닫기</span></a></div>
	<div class="popup_content">
		<table class="data_row">
		<caption>caption</caption>
		<colgroup>
			<col width="35%">
			<col width="35%">
			<col width="35%">
		</colgroup>

			<tbody>
				<tr>
					<th>고객명</th>
					<td  colspan="2">${sessionScope.SITE_INFO.sgName} ${sessionScope.SITE_INFO.siteName}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="2">${DETAIL_INFO.address}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="2">${DETAIL_INFO.phone}</td>
				</tr>
				<tr>
					<th>시운전일자</th>
					<td colspan="2">${DETAIL_INFO.testRunDate}</td>
				</tr>
				<tr>
					<th>형식</th>
					<td colspan="2">${DETAIL_INFO.form}</td>
				</tr>
				<tr>
					<th>펌프수량</th>
					<td>${DETAIL_INFO.amtPumpCnt1}EA</td>
					<td>${DETAIL_INFO.amtPumpCnt2}EA</td>
				</tr>
				<tr>
					<th>업체명</th>
					<td colspan="2">${DETAIL_INFO.salesInfo}</td>
				</tr>
				<tr>
					<th>A/S</th>
					<td colspan="2">${DETAIL_INFO.asInfo}</td>
				</tr>
			</tbody>
		</table> 
		
		<c:forEach var="subList" items="${SUB_DETAIL_INFO}" varStatus="status">
			
			<table class="data_row mt20">
			<caption>caption</caption>
			<colgroup>
				<col width="35%">
				<col width="35%">
				<col width="35%">
			</colgroup>
	
				<thead>
					<tr>
						<th scope="col" colspan="3">${subList.ctowerSubName}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>용량</th>
						<td colspan="2">${subList.volumn}</td>
					</tr>
					<tr>
						<th>모터 수량</th>
						<td colspan="2">${subList.motorCount} EA</td>
					</tr>
					<tr>
						<th>전원</th>
						<td colspan="2">${subList.powerSupply}</td>
					</tr>
					<tr>
						<th rowspan="2">소비동력</th>
						<td colspan="2">${subList.spendPowerKw} Kw</td>
					</tr>
					<tr>
						<td colspan="2">${subList.spendPowerHp} Hp</td>
					</tr>
					<tr>
						<th>전류</th>
						<td colspan="2">${subList.current}</td>
					</tr>
					<tr>
						<th>유량(㎡/h/lpm)</th>
						<td>${subList.flow1}㎡/h</td>
						<td>${subList.flow2}pm</td>
					</tr>
					<tr>
						<th>유체</th>
						<td colspan="2">${subList.fluid} </td>
					</tr>
				</tbody>
			</table>
		</c:forEach>
	</div>
</div>	
