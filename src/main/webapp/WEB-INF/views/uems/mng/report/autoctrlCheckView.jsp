<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">
	var delPhotoArr = [];
	var newPhotoArr = [];
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
		var updateYn = "N";
		<c:forEach var="answer" items="${answerList}" varStatus="status">
			<c:if test="${answer.checkTypeFlag eq 'N'}">
				json = new Object();
				var etcArr ='';
				var title = "${maintenance.facilityName}";
				var updateValue = '';
				var originValue = '';
				$("textarea[class^='etc_']").each(function(){
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
	
	function imgUpload(msId, msqId, name){
		
		$("#msId").val(msId);
		$("#msqId").val(msqId);
		$("#subFacilityId").val("-1");
		
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
					<col width="40%"/>
				</colgroup>
				<thead>
					<tr>
						<th colspan="4">${maintenance.facilityName}  (${maintenance.chkMonthVal} )</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>고객명</th>
						<td colspan="1">${sessionScope.SITE_INFO.sgName}  ${sessionScope.SITE_INFO.siteName}</td>
						<th>주소</th>
						<td colspan="1">${DETAIL_INFO.address}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td colspan="1">${DETAIL_INFO.phone}</td>
						<th></th>
						<td colspan="1"></td>
					</tr>
					<tr>
						<th>시운전일자</th>
						<td colspan="1">${DETAIL_INFO.testRunDate}</td>
						<th>전원</th>
						<td colspan="1"></td>
					</tr>
					<tr>
						<th>형식</th>
						<td colspan="1">${DETAIL_INFO.form}</td>
						<th></th>
						<td colspan="1"></td>
					</tr>
					<tr>
						<th>업체명</th>
						<td colspan="1">${DETAIL_INFO.salesInfo}</td>
						<th>A / S</th>
						<td colspan="1">${DETAIL_INFO.asInfo}</td>
					</tr>
				</tbody>
			</table>
			
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="10%"/>
					<col width="40%"/>
					<col width="10%"/>
					<col width="40%"/>
				</colgroup>
				<thead>
					<tr>
						<th></th>
						<th colspan="1">본체사양</th>
						<th></th>
						<th colspan="1">컨트롤 및 터치스크린</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>크기</th>
						<td colspan="1">${DETAIL_INFO.sizeW}(W) X ${DETAIL_INFO.sizeL}(L) X ${DETAIL_INFO.sizeH}(H)</td>
						<th>메이커</th>
						<td colspan="1">${DETAIL_INFO.ctrlMaker}</td>
					</tr>
					<tr>
						<th>구성</th>
						<td colspan="1">${DETAIL_INFO.component}</td>
						<th>인터넷</th>
						<td colspan="1">${DETAIL_INFO.ctrlInternet} </td>
					</tr>
					<tr>
						<th></th>
						<th colspan="1">PC-본체</th>
						<th></th>
						<th colspan="1">PC-모니터</th>
					</tr>
					<tr>
						<th>메이커</th>
						<td colspan="1">방냉펌프 : ${DETAIL_INFO.pcMaker} </td>
						<th>메이커</th>
						<td colspan="1">심야 : ${DETAIL_INFO.monMaker}</td>
					</tr>
					<tr>
						<th>모델명</th>
						<td colspan="1">${DETAIL_INFO.pcModel} </td>
						<th>모델명</th>
						<td colspan="1">${DETAIL_INFO.monModel}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
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
											<li> 
												<div class="photo_area">
													<ul>
														<c:forEach var="photo" items="${photoList}" varStatus="photoStatus">
															<c:if test="${question.msqId eq photo.msqId}">
																<li id="li_${photo.mfqId}"><label for=""><img src="${photo.fileUrl}" alt="${photo.fileName}" /></label>  
																	<a href="javascript:deletePhoto('${photo.mfqId}');" class="img_del"><img src="/resources/uems/images/btn_close2.png" alt="삭제" /></a>
																	<%-- <span class="btn btn_type01 btn_size04"><a href="javascript:deletePhoto('${photo.mfqId}');">X</a></span> --%>
																</li>
															</c:if>
														</c:forEach>
													</ul>
													<div class="thead_wrap cboth" id="checkImg_${question.msqId}_0">
														<input type="file" id="" name="checkImg_${question.msqId}_0" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_0');" />
														<div class="rtl">
															<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_0');">추가</a></span>
															<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_0');">삭 제</a></span>
														</div>
													</div>														
													<div class="thead_wrap cboth" id="checkImg_${question.msqId}_1" style="display:none;">
														<input type="file" id="" name="checkImg_${question.msqId}_1" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_1');" />
														<div class="rtl">
															<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_1');">추가</a></span>
															<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_1');">삭 제</a></span>
														</div>
													</div>														
													<div class="thead_wrap cboth" id="checkImg_${question.msqId}_2" style="display:none;">
														<input type="file" id="" name="checkImg_${question.msqId}_2" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_2');" />
														<div class="rtl">
															<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_2');">추가</a></span>
															<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_2');">삭 제</a></span>
														</div>
													</div>														
													<div class="thead_wrap cboth" id="checkImg_${question.msqId}_3" style="display:none;">
														<input type="file" id="" name="checkImg_${question.msqId}_3" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_3');" />
														<div class="rtl">
															<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_3');">추가</a></span>
															<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_3');">삭 제</a></span>
														</div>
													</div>														
													<div class="thead_wrap cboth" id="checkImg_${question.msqId}_4" style="display:none;">
														<input type="file" id="" name="checkImg_${question.msqId}_4" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_4');" />
														<div class="rtl">
															<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_4');">추가</a></span>
															<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_4');">삭 제</a></span>
														</div>
													</div>														
												</div>
											</li>
										</c:when>
										<c:when test="${answer.checkTypeFlag eq 'N' }">
											<c:if test="${question.designedCode eq '99' }">
												<li style="display:inline;">${answer.sortNo})
													<textarea id="${answer.msaId}" name="result_${answer.msaId}" class="etc_${answer.sortNo}">${answer.result}</textarea>
												</li>
											</c:if>
											<c:if test="${answer.sortNo eq 10}">
												<li> 
													<div class="photo_area">
														<ul>
															<c:forEach var="photo" items="${photoList}" varStatus="photoStatus">
																<c:if test="${question.msqId eq photo.msqId}">
																	<li id="li_${photo.mfqId}"><label for=""><img src="${photo.fileUrl}" alt="${photo.fileName}" /></label>  
																		<a href="javascript:deletePhoto('${photo.mfqId}');" class="img_del"><img src="/resources/uems/images/btn_close2.png" alt="삭제" /></a>
																		<%-- <span class="btn btn_type01 btn_size04"><a href="javascript:deletePhoto('${photo.mfqId}');">X</a></span> --%>
																	</li>
																</c:if>
															</c:forEach>
														</ul>
														<div class="thead_wrap cboth" id="checkImg_${question.msqId}_0">
															<input type="file" id="" name="checkImg_${question.msqId}_0" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_0');" />
															<div class="rtl">
																<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_0');">추가</a></span>
																<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_0');">삭 제</a></span>
															</div>
														</div>														
														<div class="thead_wrap cboth" id="checkImg_${question.msqId}_1" style="display:none;">
															<input type="file" id="" name="checkImg_${question.msqId}_1" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_1');" />
															<div class="rtl">
																<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_1');">추가</a></span>
																<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_1');">삭 제</a></span>
															</div>
														</div>														
														<div class="thead_wrap cboth" id="checkImg_${question.msqId}_2" style="display:none;">
															<input type="file" id="" name="checkImg_${question.msqId}_2" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_2');" />
															<div class="rtl">
																<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_2');">추가</a></span>
																<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_2');">삭 제</a></span>
															</div>
														</div>														
														<div class="thead_wrap cboth" id="checkImg_${question.msqId}_3" style="display:none;">
															<input type="file" id="" name="checkImg_${question.msqId}_3" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_3');" />
															<div class="rtl">
																<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_3');">추가</a></span>
																<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_3');">삭 제</a></span>
															</div>
														</div>														
														<div class="thead_wrap cboth" id="checkImg_${question.msqId}_4" style="display:none;">
															<input type="file" id="" name="checkImg_${question.msqId}_4" onchange="javascript:imgUpload('${question.msId}','${question.msqId}','checkImg_${question.msqId}_4');" />
															<div class="rtl">
																<span class="btn btn_type01 btn_size02"><a href="javascript:addImg('checkImg_${question.msqId}_4');">추가</a></span>
																<span class="btn btn_type01 btn_size02"><a href="javascript:deleteImg('checkImg_${question.msqId}_4');">삭 제</a></span>
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
	
	<!-- s: btn wrap 가운데 정렬-->
	<div class="btn_wrap02">
		<span class="btn btn_type02 btn_size03"><a href="javascript:saveRegularCheck();">저장</a></span>
		<span class="btn btn_type01 btn_size03"><a href="/uems/mng/check/regularCheckList.do">취소</a></span>
	</div>
	<!-- e: btn wrap-->
</form>	
</div>