<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<ol>
						<c:choose>
							<c:when test="${question.designedCode eq '00' }">
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
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:if>
							</c:when>
							<c:when test="${question.designedCode eq '01' }">
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
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:if>
								<!-- 이미지삽입 -->
								<img src="/resources/uems/images/heatstg_regularCheck.png" alt="축열조그래프" width="250" height="200"/>
							</c:when>
							<c:when test="${question.designedCode eq '99' }">
								<c:if test="${fn:length(answerList) ne 0}">
									<c:forEach var="answer" items="${answerList}" varStatus="status">
										<c:if test="${answer.msqId eq question.msqId}">
											<li style="display:inline;">${answer.sortNo})
												<input type="text" id="${answer.msaId}" name="result_${answer.msaId}" value="${answer.result}" style="display:inline;" class="etc_${answer.sortNo}"/>
										</c:if>
									</c:forEach>
								</c:if>
							</c:when>
						</c:choose>
					</ol>
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
					<th>관 재질</th>
					<td>${DETAIL_INFO.material}</td>
				</tr>
				<tr>
					<th>형식</th>
					<td>${DETAIL_INFO.form}</td>
				</tr>
				<tr>
					<th>타입</th>
					<td>${DETAIL_INFO.type}</td>
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
				<col width="30%">
				<col width="17.5%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th colspan="3">축열조 사양</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>피크부하</th>
					<td colspan="2">${DETAIL_INFO.peakLoad} USRt</td>
				</tr>
				<tr>
					<th>축열조용량</th>
					<td colspan="2">${DETAIL_INFO.volumn} USRt-hr </td>
				</tr>
				<tr>
					<th>축열율</th>
					<td colspan="2">${DETAIL_INFO.rate} %</td>
				</tr>
				<tr>
					<th>크 기</th>
					<td colspan="2">${DETAIL_INFO.sizeW} X ${DETAIL_INFO.sizeL} X ${DETAIL_INFO.sizeH} </td>
				</tr>
				<tr>
					<th>캡슐수량</th>
					<td colspan="2">${DETAIL_INFO.capsuleAmt} Kcal/h</td>
				</tr>
				<tr>
					<th>유 체</th>
					<td colspan="2">${DETAIL_INFO.fluid} </td>
				</tr>
				<tr>
					<th>브라인량</th>
					<td colspan="2">${DETAIL_INFO.brineAmt1}ton / ${DETAIL_INFO.brineAmt2}% </td>
				</tr>
			</tbody>
		</table>
		
		<table class="data_row mt20">
			<caption>caption</caption>
			<colgroup>
				<col width="30%">
				<col width="15%">
				<col width="*%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th colspan="5">배관</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>관 재질</th>
					<td colspan="4">${DETAIL_INFO.pipeMaterial}</td>
				</tr>
				<tr>
					<th>관 경</th>
					<td colspan="4">${DETAIL_INFO.pipeDiamStorage}A / ${DETAIL_INFO.pipeDiamRelease}A</td>
				</tr>
				<tr>
					<th rowspan="2">자동밸브사양</th>
					<td>${DETAIL_INFO.valve1Name} </td>
					<td>${DETAIL_INFO.valve11} -WAY</td>
					<td>${DETAIL_INFO.valve12} A</td>
					<td>${DETAIL_INFO.valve13} EA</td>
				</tr>
				<tr>
					<td>${DETAIL_INFO.valve2Name} </td>
					<td>${DETAIL_INFO.valve21} -WAY</td>
					<td>${DETAIL_INFO.valve22} A</td>
					<td>${DETAIL_INFO.valve23} EA</td>
				</tr>
				<tr>
					<th rowspan="3">유량계사양</th>
					<td colspan="2">${DETAIL_INFO.current1Name} </td>
					<td>${DETAIL_INFO.current11} A</td>
					<td>${DETAIL_INFO.current12} EA</td>
				</tr>
				<tr>
					<td colspan="2">${DETAIL_INFO.current2Name} </td>
					<td>${DETAIL_INFO.current21} A</td>
					<td>${DETAIL_INFO.current22} EA</td>
				</tr>
				<tr>
					<td colspan="2">${DETAIL_INFO.current3Name} </td>
					<td>${DETAIL_INFO.current31} A</td>
					<td>${DETAIL_INFO.current32} EA</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>	