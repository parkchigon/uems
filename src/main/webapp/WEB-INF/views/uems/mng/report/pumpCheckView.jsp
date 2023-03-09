<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">
	var delPhotoArr = [];
	var newPhotoArr = [];
	$(document).ready(function(){
		
		// value Setting
		<c:if test="${SUB_DETAIL_INFO_SIZE eq 0}">
			<c:forEach var="answer" items="${answerList}" varStatus="status">
				<c:if test="${subList.fpId eq answer.subFacilityId}">
					$("input[name='result_${answer.answer}']").val("${answer.result}");
					$("input[name='result_${answer.answer}']").attr("id","${answer.msaId}");
					$("input[name='result_${answer.answer}']").attr("name","result_${answer.msaId}");
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${SUB_DETAIL_INFO_SIZE ne 0}">
			<c:forEach var="subList" items="${SUB_DETAIL_INFO}" varStatus="subStatus">
				<c:forEach var="answer" items="${answerList}" varStatus="status">
					<c:if test="${subList.fpId eq answer.subFacilityId}">
						$("input[name='result_${subStatus.count}_${answer.answer}']").val("${answer.result}");
						$("input[name='result_${subStatus.count}_${answer.answer}']").attr("id","${answer.msaId}");
						$("input[name='result_${subStatus.count}_${answer.answer}']").attr("name","result_${answer.msaId}_${subList.fpId}");
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:if>
		
		
		$("input:checkbox[name^='result']").each(function(){
			if($(this).val()=='Y'){
				$(this).attr("checked",true);
			}else{
				$(this).attr("checked",false);
			}
		})
	});

	/* 삭제이미지 리스트 */
	function deletePhoto(mfqId){
		$("#li_"+mfqId).hide();
		delPhotoArr.push(mfqId);
	}
	
	/* 내용저장 */
	function saveRegularCheck(){
		
		var array = new Array();
		var request = new Object();
		var subSize = $("#subSize").val();
		console.log("subSize+++"+subSize);
		
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
			json.msId = "${maintenance.msId}";
			json.chkMonth = "${maintenance.chkMonth}";
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
			json.msId = "${maintenance.msId}";
			json.chkMonth = "${maintenance.chkMonth}";
			if(subSize > 0){
				var temp = $(this).attr("name");
				var temp2 = temp.split("_");
				json.subFacilityId = temp2[2];
			}else{
				json.subFacilityId = "-1";
			}
			array.push(json);
		})
		
		$("input[name^=checkImg_]").each(function(){
			if($(this).attr("id") != ''){
				newPhotoArr.push($(this).attr("id"));
			}
		})
		
		//작업관리 히스토리 저장 내용
		var etcArray = new Array();
		<c:forEach var="subList" items="${SUB_DETAIL_INFO}" varStatus="subStatus">
			var updateYn = "N";
			<c:forEach var="answer" items="${answerList}" varStatus="status">
				<c:if test="${subList.fpId eq answer.subFacilityId && answer.checkTypeFlag eq 'N'}">
					json = new Object();
					var subId = "${subList.fpId}";
					var etcArr ='';
					var title = "${maintenance.facilityName}(${subList.pumpSubname})";
					var updateValue = '';
					var originValue = '';
					$("textarea[class^='etc_"+subId+"']").each(function(){
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
		
		
		request.valueSet = array;          //저장할 데이터
		request.delPhotoArr = delPhotoArr; //삭제할이미지
		request.newPhotoArr = newPhotoArr; //실제저장 이미지
		request.etcValue = etcArray;	   //작업관리히스토리용 데이터
		request.siteId = "${maintenance.siteId}";
		
		// 점검내용 저장 Ajax 
		$.ajax({
			url  : "/uems/mng/check/updateRegularCheckInfo.do",
			type : "POST",
			data : JSON.stringify(request),
			dataType : "JSON",
			contentType : "application/json",
			enctype : "multipart/form-data"
		}).done(function(data){
			if(data.resultCode = "0000"){
				alert("점검내용이 저장되었습니다.");
				location.href = "/uems/mng/check/regularCheckList.do";
			}else{
				alert("점검내용 저장 실패하였습니다.");
			}
		})
		
	}
	
	function imgUpload(msId, msqId, name, facilityId){
		
		$("#msId").val(msId);
		$("#msqId").val(msqId);
		$("#subFacilityId").val(facilityId);
		
		var formData = new FormData();
		if($("input[name="+name+"]")[0].files[0] != null) {
			formData.append("uploadImg", $("input[name="+name+"]")[0].files[0]);
		}
		var params = $("#fileForm").serializeArray();
	    $.each(params, function (i, val) {
	        formData.append(val.name, val.value);
	    });
		
		$.ajax({
			url  : "/uems/mng/check/regularCheckUploadImg.do",
			type : "POST",
			data : formData,
			processData: false,
			contentType : false,
			async : false,
	        cache : false,
			enctype : "multipart/form-data",
			success: function(result){
				$("input[name="+name+"]").attr("id",result.resultMsg);
			}
		});
		
	}
	
	
	function addImg(id){
		$("#"+id).next().show();
	}
	
	function deleteImg(id){
		$("#"+id).hide();
		var tempId = $("input[name="+id+"]").attr("id");
		if(tempId != ''){
			delPhotoArr.push();
		}
		$("input[name="+id+"]").attr("name","remove");
	}
	
</script>

<div class="contents_wrap">
<form id="fileForm" name="fileForm" method="POST">
<input type="hidden" id="chkMonth" name="chkMonth" value="${maintenance.chkMonth}"/>
<input type="hidden" id="msId" name="msId" />
<input type="hidden" id="msqId" name="msqId" />
<input type="hidden" id="subFacilityId" name="subFacilityId" />
<input type="hidden" id="subSize" name="subSize" value="${SUB_DETAIL_INFO_SIZE}"/>


	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">보고서관리 - 정기점검 목록관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;정기점검 내용을 확인합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	
	<div class="scroll" style="height:calc(100% - 105px);">
	
		<!-- s: table wrap-->
		<div class="table_wrap">
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="10%"/>
					<col width="40%"/>
					<col width="10%"/>
					<col width="20%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr>
						<th colspan="5">${maintenance.facilityName}  (${maintenance.chkMonthVal} )</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>고객명</th>
						<td colspan="1">${sessionScope.SITE_INFO.sgName}  ${sessionScope.SITE_INFO.siteName}</td>
						<th>주소</th>
						<td colspan="2">${DETAIL_INFO.address}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td colspan="1">${DETAIL_INFO.phone}</td>
						<th></th>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>시운전일자</th>
						<td colspan="1">${DETAIL_INFO.testRunDate}</td>
						<th>전원</th>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>형식</th>
						<td colspan="1">${DETAIL_INFO.form}</td>
						<th>수량</th>
						<td colspan="1">${DETAIL_INFO.amtPumpName1}  ${DETAIL_INFO.amtPumpCnt1}EA</td>
						<td colspan="1">${DETAIL_INFO.amtPumpName2}  ${DETAIL_INFO.amtPumpCnt2}EA</td>
					</tr>
					<tr>
						<th>업체명</th>
						<td colspan="1">${DETAIL_INFO.salesInfo}</td>
						<th>A / S</th>
						<td colspan="2">${DETAIL_INFO.asInfo}</td>
					</tr>
				</tbody>
			</table>
			
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<thead>
					<tr>
						<th colspan="2"></th>
						<th colspan="2">${SUB_DETAIL_INFO[0].pumpSubname}</th>
						<th colspan="2">${SUB_DETAIL_INFO[1].pumpSubname}</th>
						<th colspan="2">${SUB_DETAIL_INFO[2].pumpSubname}</th>
						<th colspan="2">${SUB_DETAIL_INFO[3].pumpSubname}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th rowspan="2" colspan="2">모델번호(펌프)</th>
						<td colspan="2">${SUB_DETAIL_INFO[0].pumpModelName}</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].pumpModelName}</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].pumpModelName}</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].pumpModelName}</td>
					</tr>
					<tr>
						<td colspan="2">${SUB_DETAIL_INFO[0].pumpModelNo}</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].pumpModelNo}</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].pumpModelNo}</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].pumpModelNo}</td>
					</tr>
					<tr>
						<th rowspan="2" colspan="2">모델번호(모터)</th>
						<td colspan="2">${SUB_DETAIL_INFO[0].motorModelName}</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].motorModelName}</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].motorModelName}</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].motorModelName}</td>
					</tr>
					<tr>
						<td colspan="2">${SUB_DETAIL_INFO[0].motorModelNo}</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].motorModelNo}</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].motorModelNo}</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].motorModelNo}</td>
					</tr>
					<tr>
						<th colspan="2">전원</th>
						<td colspan="2">${SUB_DETAIL_INFO[0].powerSupply}</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].powerSupply}</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].powerSupply}</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].powerSupply}</td>
					</tr>
					<tr>
						<th rowspan="2" colspan="2">소비동력</th>
						<td colspan="2">${SUB_DETAIL_INFO[0].spendPowerKw} kw</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].spendPowerKw} kw</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].spendPowerKw} kw</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].spendPowerKw} kw</td>
					</tr>
					<tr>
						<td colspan="2">${SUB_DETAIL_INFO[0].spendPowerHp} hp</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].spendPowerHp} hp</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].spendPowerHp} hp</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].spendPowerHp} hp</td>
					</tr>
					<tr>
						<th colspan="2">전류</th>
						<td colspan="2">${SUB_DETAIL_INFO[0].elecCurrent} A</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].elecCurrent} A</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].elecCurrent} A</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].elecCurrent} A</td>
					</tr>
					<tr>
						<th colspan="2">유량 (㎡/h)</th>
						<td>${SUB_DETAIL_INFO[0].flowRate1} ㎡/h</td>
						<td>${SUB_DETAIL_INFO[0].flowRate2} lpm</td>
						<td>${SUB_DETAIL_INFO[1].flowRate1} ㎡/h</td>
						<td>${SUB_DETAIL_INFO[1].flowRate2} lpm</td>
						<td>${SUB_DETAIL_INFO[2].flowRate1} ㎡/h</td>
						<td>${SUB_DETAIL_INFO[2].flowRate2} lpm</td>
						<td>${SUB_DETAIL_INFO[3].flowRate1} ㎡/h</td>
						<td>${SUB_DETAIL_INFO[3].flowRate2} lpm</td>
					</tr>
					<tr>
						<th colspan="2">양정</th>
						<td colspan="2">${SUB_DETAIL_INFO[0].lift}</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].lift}</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].lift}</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].lift}</td>
					</tr>
					<tr>
						<th colspan="2">유체</th>
						<td>${SUB_DETAIL_INFO[0].fluidMaterial}</td>
						<td>${SUB_DETAIL_INFO[0].fluidPercent} %</td>
						<td>${SUB_DETAIL_INFO[1].fluidMaterial}</td>
						<td>${SUB_DETAIL_INFO[1].fluidPercent} %</td>
						<td>${SUB_DETAIL_INFO[2].fluidMaterial}</td>
						<td>${SUB_DETAIL_INFO[2].fluidPercent} %</td>
						<td>${SUB_DETAIL_INFO[3].fluidMaterial}</td>
						<td>${SUB_DETAIL_INFO[3].fluidPercent} %</td>
					</tr>
					<tr>
						<th colspan="2">모터형식</th>
						<td colspan="2">${SUB_DETAIL_INFO[0].motorType}</td>
						<td colspan="2">${SUB_DETAIL_INFO[1].motorType}</td>
						<td colspan="2">${SUB_DETAIL_INFO[2].motorType}</td>
						<td colspan="2">${SUB_DETAIL_INFO[3].motorType}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<c:if test="${SUB_DETAIL_INFO_SIZE > 0}">
			<c:forEach var="subList" items="${SUB_DETAIL_INFO}" varStatus="subStatus">
				<div id="sub_${subStatus.count}">
					<p class="subTitle_area">${subList.pumpSubname}</p>
					<c:forEach var="question" items="${questionList}" varStatus="status">
						<div class="chart_area">
							<dl>
								<dt>${status.count}. ${question.question}</dt>
								<dd>
									<ol>
										<c:forEach var="answer" items="${answerList}" varStatus="status">
											<c:if test="${answer.msqId eq question.msqId  && subList.fpId eq answer.subFacilityId}">
												<c:choose>
													<c:when test="${answer.checkTypeFlag eq 'Y' }">
														<li>${answer.sortNo}) ${answer.answer}
															<span class="fr">
																<label for="">확인여부</label><input type="checkbox" id="${answer.msaId}" name="result_${answer.msaId}_${subList.fpId}" value="${answer.result}"/>
															</span>
														</li>
													</c:when>
													<c:when test="${answer.checkTypeFlag eq 'E' }">
														<li>${answer.sortNo}) ${answer.answer}
															<textarea id="${answer.msaId}" name="result_${answer.msaId}_${subList.fpId}">${answer.result}</textarea>
														</li>
														<c:if test="${question.designedCode eq '01' }">
															<div class="table_wrap">
																<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
																<colgroup>
																	<col width="20%">
																	<col width="20%">
																	<col width="20%">
																	<col width="20%">
																	<col width="*">
																</colgroup>
													
																	<thead>
																		<tr>
																			<th scope="col"></th>
																			<th scope="col">기준값</th>
																			<th scope="col">측정값</th>
																			<th scope="col">측정시모드</th>
																			<th scope="col">확인기준</th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<th>소비전력[Kw] 측정</th>
																			<td>3.7Kw</td>
																			<td><input type="text" class="inp_txt w02" class="" id="" name="result_${subStatus.count}_check_power" value="" /></td>
																			<td rowspan="3"><input type="text" class="inp_txt w02" class="" id="" name="result_${subStatus.count}_mode" value="" /></td>
																			<td>MCC 판넬 확인</td>
																		</tr>
																		<tr>
																			<th>운전 전류[A] 측정</th>
																			<td>7.7A</td>
																			<td><input type="text" class="inp_txt w02" class="" id="" name="result_${subStatus.count}_check_current" value="" /></td>
																			<td>MCC 판넬 확인</td>
																		</tr>
																		<tr>
																			<th>운전 유량[㎡/h] 측정</th>
																			<td>84.2㎡/h</td>
																			<td><input type="text" class="inp_txt w02" class="" id="" name="result_${subStatus.count}_check_flow" value="" /></td>
																			<td>유량계 확인</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</c:if>
														<li> 
															<div class="photo_area">
																<ul>
																	<c:forEach var="photo" items="${photoList}" varStatus="photoStatus">
																		<c:if test="${question.msqId eq photo.msqId && subList.fpId eq photo.subFacilityId}">
																			<li id="li_${photo.mfqId}"><label for=""><img src="${photo.fileUrl}" alt="${photo.fileName}" /></label>  
																				<a href="javascript:deletePhoto('${photo.mfqId}');" class="img_del"><img src="/resources/uems/images/btn_close2.png" alt="삭제" /></a>
																				<%-- <span class="btn btn_type01 btn_size04"><a href="javascript:deletePhoto('${photo.mfqId}');">X</a></span> --%>
																			</li>
																		</c:if>
																	</c:forEach>
																</ul>
																<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_0">
																	<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_0" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_0','${subList.fpId}');" />
																	<div class="rtl">
																		<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_0');">추가</a></span>
																		<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_0');">삭 제</a></span>
																	</div>
																</div>														
																<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_1" style="display:none;">
																	<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_1" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_1','${subList.fpId}');" />
																	<div class="rtl">
																		<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_1');">추가</a></span>
																		<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_1');">삭 제</a></span>
																	</div>
																</div>														
																<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_2" style="display:none;">
																	<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_2" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_2','${subList.fpId}');" />
																	<div class="rtl">
																		<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_2');">추가</a></span>
																		<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_2');">삭 제</a></span>
																	</div>
																</div>														
																<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_3" style="display:none;">
																	<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_3" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_3','${subList.fpId}');" />
																	<div class="rtl">
																		<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_3');">추가</a></span>
																		<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_3');">삭 제</a></span>
																	</div>
																</div>														
																<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_4" style="display:none;">
																	<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_4" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_4','${subList.fpId}');" />
																	<div class="rtl">
																		<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_4');">추가</a></span>
																		<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_4');">삭 제</a></span>
																	</div>
																</div>														
															</div>
														</li>
													</c:when>
													<c:when test="${answer.checkTypeFlag eq 'N' }">
														<c:if test="${question.designedCode eq '99' }">
															<li style="display:inline;">${answer.sortNo})
																<textarea id="${answer.msaId}" name="result_${answer.msaId}_${subList.fpId}" class="etc_${subList.fpId}_${answer.sortNo}">${answer.result}</textarea>
															</li>
														</c:if>
														<c:if test="${answer.sortNo eq 10 }">
															<li> 
																<div class="photo_area">
																	<ul>
																		<c:forEach var="photo" items="${photoList}" varStatus="photoStatus">
																			<c:if test="${question.msqId eq photo.msqId && subList.fpId eq photo.subFacilityId}">
																				<li id="li_${photo.mfqId}"><label for=""><img src="${photo.fileUrl}" alt="${photo.fileName}" /></label>  
																					<a href="javascript:deletePhoto('${photo.mfqId}');" class="img_del"><img src="/resources/uems/images/btn_close2.png" alt="삭제" /></a>
																					<%-- <span class="btn btn_type01 btn_size04"><a href="javascript:deletePhoto('${photo.mfqId}');">X</a></span> --%>
																				</li>
																			</c:if>
																		</c:forEach>
																	</ul>
																	<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_0">
																		<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_0" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_0','${subList.fpId}');" />
																		<div class="rtl">
																			<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_0');">추가</a></span>
																			<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_0');">삭 제</a></span>
																		</div>
																	</div>														
																	<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_1" style="display:none;">
																		<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_1" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_1','${subList.fpId}');" />
																		<div class="rtl">
																			<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_1');">추가</a></span>
																			<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_1');">삭 제</a></span>
																		</div>
																	</div>														
																	<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_2" style="display:none;">
																		<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_2" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_2','${subList.fpId}');" />
																		<div class="rtl">
																			<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_2');">추가</a></span>
																			<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_2');">삭 제</a></span>
																		</div>
																	</div>														
																	<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_3" style="display:none;">
																		<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_3" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_3','${subList.fpId}');" />
																		<div class="rtl">
																			<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_3');">추가</a></span>
																			<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_3');">삭 제</a></span>
																		</div>
																	</div>														
																	<div class="thead_wrap cboth" id="checkImg_${question.msqId}_${subList.fpId}_4" style="display:none;">
																		<input type="file" id="" name="checkImg_${question.msqId}_${subList.fpId}_4" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_${subList.fpId}_4','${subList.fpId}');" />
																		<div class="rtl">
																			<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_${subList.fpId}_4');">추가</a></span>
																			<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_${subList.fpId}_4');">삭 제</a></span>
																		</div>
																	</div>														
																</div>
															</li>
														</c:if>
													</c:when>	
												</c:choose>
											</c:if>
										</c:forEach>
									</ol>
								</dd>
							</dl>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
			
			
		</c:if>
		<c:if test="${SUB_DETAIL_INFO_SIZE eq 0}">
			<c:forEach var="question" items="${questionList}" varStatus="status">
				<div class="chart_area">
					<dl>
						<dt>${status.count}. ${question.question}</dt>
						<dd>
							<ol>
								<c:forEach var="answer" items="${answerList}" varStatus="status">
									<c:if test="${answer.msqId eq question.msqId}">
										<c:choose>
											<c:when test="${answer.checkTypeFlag eq 'Y' }">
												<li>${answer.sortNo}) ${answer.answer}
													<span class="fr">
														<label for="">확인여부</label><input type="checkbox" id="${answer.msaId}" name="result_${answer.msaId}" value="${answer.result}"/>
													</span>
												</li>
											</c:when>
											<c:when test="${answer.checkTypeFlag eq 'E' }">
												<li>${answer.sortNo}) ${answer.answer}
													<textarea id="${answer.msaId}" name="result_${answer.msaId}">${answer.result}</textarea>
												</li>
												<c:if test="${question.designedCode eq '01' }">
													<div class="table_wrap">
														<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
														<colgroup>
															<col width="20%">
															<col width="20%">
															<col width="20%">
															<col width="20%">
															<col width="*">
														</colgroup>
											
															<thead>
																<tr>
																	<th scope="col"></th>
																	<th scope="col">기준값</th>
																	<th scope="col">측정값</th>
																	<th scope="col">측정시모드</th>
																	<th scope="col">확인기준</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<th>소비전력[Kw] 측정</th>
																	<td>3.7Kw</td>
																	<td><input type="text" class="inp_txt w02" class="" id="" name="result_check_power" value="" /></td>
																	<td rowspan="3"><input type="text" class="inp_txt w02" class="" id="" name="result_mode" value="" /></td>
																	<td>MCC 판넬 확인</td>
																</tr>
																<tr>
																	<th>운전 전류[A] 측정</th>
																	<td>7.7A</td>
																	<td><input type="text" class="inp_txt w02" class="" id="" name="result_check_current" value="" /></td>
																	<td>MCC 판넬 확인</td>
																</tr>
																<tr>
																	<th>운전 유량[㎡/h] 측정</th>
																	<td>84.2㎡/h</td>
																	<td><input type="text" class="inp_txt w02" class="" id="" name="result_check_flow" value="" /></td>
																	<td>유량계 확인</td>
																</tr>
															</tbody>
														</table>
													</div>
												</c:if>
												<li> 
													<div class="photo_area">
														<ul>
															<li><label for=""><img src="/resources/mobile/images/logo_emart.png" alt="이마트" /></label> 
																<input type="checkbox" name="" id="" />
															</li>
														</ul>
														<div class="thead_wrap cboth">
															<input type="file" id="" name="" />
															<div class="rtl">
																<span class="btn btn_type01 btn_size02"><a href="javascript:deletePhoto('');">삭 제</a></span>
															</div>
														</div>
													</div>
												</li>
											</c:when>
											<c:when test="${answer.checkTypeFlag eq 'N' }">
												<c:if test="${question.designedCode eq '99' }">
													<li style="display:inline;">${answer.sortNo})
														<textarea id="${answer.msaId}" name="result_${answer.msaId}">${answer.result}</textarea>
													</li>
												</c:if>
											</c:when>	
										</c:choose>
									</c:if>
								</c:forEach>
							</ol>
						</dd>
					</dl>
				</div>
			</c:forEach>
		</c:if>
		
	</div>
	
	<!-- s: btn wrap 가운데 정렬-->
	<div class="btn_wrap02">
		<span class="btn btn_type02 btn_size03"><a href="javascript:saveRegularCheck();">저장</a></span>
		<span class="btn btn_type01 btn_size03"><a href="/uems/mng/check/regularCheckList.do">취소</a></span>
	</div>
	<!-- e: btn wrap-->
</form>	
</div>