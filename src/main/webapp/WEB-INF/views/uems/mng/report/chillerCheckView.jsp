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
			
			$("textarea[name='result_${answer.answer}']").val("${answer.result}");
			$("textarea[name='result_${answer.answer}']").attr("id","${answer.msaId}");
			$("textarea[name='result_${answer.answer}']").attr("name","result_${answer.msaId}");
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
		
		$("select[name^='result']").each(function(){
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
						<td colspan="1">${maintenance.sgName}  ${maintenance.siteName}</td>
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
						<td colspan="1">${DETAIL_INFO.powerSupply}</td>
					</tr>
					<tr>
						<th>형식</th>
						<td colspan="1">${DETAIL_INFO.form}</td>
						<th>콤프수량</th>
						<td colspan="1">${DETAIL_INFO.compCount}EA</td>
					</tr>
					<tr>
						<th>모델번호</th>
						<td colspan="1">${DETAIL_INFO.modelNo}</td>
						<th>기동방식</th>
						<td colspan="1">${DETAIL_INFO.drivenMethod}</td>
					</tr>
					<tr>
						<th>제조번호</th>
						<td colspan="1">${DETAIL_INFO.manufactureNo}</td>
						<th>냉매</th>
						<td colspan="1">${DETAIL_INFO.refrigName}  / 냉매충전량 :  ${DETAIL_INFO.refrigAmount}</td>
					</tr>
					<tr>
						<th>업체명</th>
						<td colspan="1">${DETAIL_INFO.salesInfo}</td>
						<th>A / S</th>
						<td colspan="1">
							${DETAIL_INFO.asInfo}
						</td>
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
						<th></th>
						<th colspan="2">야간</th>
						<th colspan="2">주간</th>
						<th></th>
						<th colspan="2">야간</th>
						<th colspan="2">주간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>용량(USRt)</th>
						<td colspan="2">${DETAIL_INFO.volumeNight}</td>
						<td colspan="2">${DETAIL_INFO.volumeDay}</td>
						<th>소비전력(kw)</th>
						<td colspan="2">${DETAIL_INFO.consumpowerNight}</td>
						<td colspan="2">${DETAIL_INFO.consumpowerDay}</td>
					</tr>
					<tr>
						<th>냉수온도(℃)</th>
						<td colspan="2">${DETAIL_INFO.colTempNight1} / ${DETAIL_INFO.colTempNight2}</td>
						<td colspan="2">${DETAIL_INFO.colTempDay1} / ${DETAIL_INFO.colTempDay1}</td>
						<th>전류(A)</th>
						<td colspan="2">${DETAIL_INFO.currentNight}</td>
						<td colspan="2">${DETAIL_INFO.currentDay}</td>
					</tr>
					<tr>
						<th>냉각수온도(℃)</th>
						<td colspan="2">${DETAIL_INFO.colwaterTempNight1} / ${DETAIL_INFO.colwaterTempNight2}</td>
						<td colspan="2">${DETAIL_INFO.colwaterTempDay1} / ${DETAIL_INFO.colwaterTempDay2}</td>
						<th>C O P</th>
						<td colspan="2">${DETAIL_INFO.copNight}</td>
						<td colspan="2">${DETAIL_INFO.copDay}</td>
					</tr>
					<tr>
						<th>유체</th>
						<td colspan="2">${DETAIL_INFO.fluidDay}</td>
						<td colspan="2">${DETAIL_INFO.fluidNight}</td>
						<th>제어범위</th>
						<td colspan="4">${DETAIL_INFO.controlRange1}% ~ ${DETAIL_INFO.controlRange2}%</td>
					</tr>
					<tr>
						<th rowspan="2">유량<br/>(㎡/h/lpm)</th>
						<th colspan="2">냉수</th>
						<th colspan="2">냉각수</th>
						<th>특이사항</th>
						<td colspan="4">콤프대수제어 구성</td>
					</tr>
					<tr>
						<td>${DETAIL_INFO.flowNight1}㎡/h</td>
						<td>${DETAIL_INFO.flowNight2}pm</td>
						<td>${DETAIL_INFO.flowDay1}㎡/h</td>
						<td>${DETAIL_INFO.flowDay2}pm</td>
						<th>중량</th>
						<td colspan="2"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th rowspan="2">압력손실<br/>(kg/㎠)</th>
						<th colspan="2">냉수</th>
						<th colspan="2">냉각수</th>
						<th rowspan="2">접속관경(A)</th>
						<th colspan="2">냉수</th>
						<th colspan="2">냉각수</th>
					</tr>
					<tr>
						<td colspan="2">${DETAIL_INFO.presslossNight}</td>
						<td colspan="2">${DETAIL_INFO.presslossDay}</td>
						<td colspan="2">${DETAIL_INFO.pipeDiamWt}</td>
						<td colspan="2">${DETAIL_INFO.pipeDiamCw}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<c:forEach var="question" items="${questionList}" varStatus="status">
			<div class="chart_area">
				<dl>
					<dt>${status.count}. ${question.question}</dt>
					<dd>
						<c:if test="${question.designedCode eq '01'}">
							<c:forEach var="answer" items="${answerList}" varStatus="status">
								<c:if test="${answer.msqId eq question.msqId}">
									<c:if test="${answer.checkTypeFlag eq 'Y' }">
										<li>${answer.sortNo}) ${answer.answer}
											<span class="fr">
												<label for="">확인여부</label><input type="checkbox" id="${answer.msaId}" name="result_${answer.msaId}" value="${answer.result}"/>
											</span>
										</li>
									</c:if>
								</c:if>
							</c:forEach>
							<div class="table_wrap">
								<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="6%">
									<col width="8%">
									<col width="8%">
									<col width="8%">
									<col width="8%">
									<col width="*">
								</colgroup>
					
									<thead>
										<tr>
											<th scope="col" rowspan="2" colspan="2"></th>
											<th scope="col">단위</th>
											<th scope="col">1</th>
											<th scope="col">2</th>
											<th scope="col">3</th>
											<th scope="col">4</th>
											<th scope="col" rowspan="2" >비고</th>
										</tr>
										<tr>
											<th scope="col">시:분</th>
											<td scope="col">
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_1_hour" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="23">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
															<fmt:formatNumber value='${n}' pattern='00' />시
															</option>
														</c:forEach>
													</select>
												</span>
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_1_min" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="59">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
																<fmt:formatNumber value='${n}' pattern='00' />분
															</option>
														</c:forEach>
													</select>
												</span>
											</td>
											<td scope="col">
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_2_hour" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="23">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
															<fmt:formatNumber value='${n}' pattern='00' />시
															</option>
														</c:forEach>
													</select>
												</span>
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_2_min" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="59">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
																<fmt:formatNumber value='${n}' pattern='00' />분
															</option>
														</c:forEach>
													</select>
												</span>
											</td>
											<td scope="col">
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_3_hour" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="23">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
															<fmt:formatNumber value='${n}' pattern='00' />시
															</option>
														</c:forEach>
													</select>
												</span>
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_3_min" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="59">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
																<fmt:formatNumber value='${n}' pattern='00' />분
															</option>
														</c:forEach>
													</select>
												</span>
											</td>
											<td scope="col">
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_4_hour" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="23">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
															<fmt:formatNumber value='${n}' pattern='00' />시
															</option>
														</c:forEach>
													</select>
												</span>
												<span class="sel_wrap w01" style="width: 50px;">
													<select id="" name="result_4_min" style="width: 50px;margin-bottom: 5px;">
														<c:forEach var="n" begin="0" end="59">
															<option value="<fmt:formatNumber value='${n}' pattern='00' />">
																<fmt:formatNumber value='${n}' pattern='00' />분
															</option>
														</c:forEach>
													</select>
												</span>
											</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="col" rowspan="2" >브라인(냉수)</th>
											<th scope="col">입구온도</th>
											<th scope="col" rowspan="2">℃</th>
											<td><input type="text" class="inp_txt w02" name="result_1_brine_in_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_brine_in_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_brine_in_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_brine_in_temp" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_brine_in_temp"></textarea></td>
										</tr>
										<tr>
											<th scope="col">출구온도</th>
											<td><input type="text" class="inp_txt w02" name="result_1_brine_out_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_brine_out_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_brine_out_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_brine_out_temp" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_brine_out_temp"></textarea></td>
										</tr>
										<tr>
											<th scope="col" rowspan="2" >증발기(저압)</th>
											<th scope="col">#1: 압력</th>
											<th scope="col" rowspan="2">kg/㎠</th>
											<td><input type="text" class="inp_txt w02" name="result_1_evaporator1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_evaporator1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_evaporator1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_evaporator1" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_evaporator1"></textarea></td>
										</tr>
										<tr>
											<th scope="col">#2: 압력</th>
											<td><input type="text" class="inp_txt w02" name="result_1_evaporator2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_evaporator2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_evaporator2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_evaporator2" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_evaporator2"></textarea></td>
										</tr>
										<tr>
											<th scope="col" rowspan="2" >냉각수</th>
											<th scope="col">입구온도</th>
											<th scope="col" rowspan="2">℃</th>
											<td><input type="text" class="inp_txt w02" name="result_1_cool_in_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_cool_in_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_cool_in_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_cool_in_temp" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_cool_in_temp"></textarea></td>
										</tr>
										<tr>
											<th scope="col">출구온도</th>
											<td><input type="text" class="inp_txt w02" name="result_1_cool_out_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_cool_out_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_cool_out_temp" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_cool_out_temp" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_cool_out_temp"></textarea></td>
										</tr>
										<tr>
											<th scope="col" rowspan="2" >응축기(고압)</th>
											<th scope="col">#1: 압력</th>
											<th scope="col" rowspan="2">kg/㎠</th>
											
											<td><input type="text" class="inp_txt w02" name="result_1_condenser1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_condenser1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_condenser1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_condenser1" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_condenser1"></textarea></td>
										</tr>
										<tr>
											<th scope="col">#2: 압력</th>
											<td><input type="text" class="inp_txt w02" name="result_1_condenser2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_condenser2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_condenser2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_condenser2" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_condenser2"></textarea></td>
										</tr>
										<tr>
											<th scope="col" rowspan="2" >압축기</th>
											<th scope="col">#1: 전류</th>
											<th scope="col" rowspan="2">A</th>
											<td><input type="text" class="inp_txt w02" name="result_1_compressor1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_compressor1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_compressor1" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_compressor1" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_compressor1"></textarea></td>
										</tr>
										<tr>
											<th scope="col">#2: 전류</th>
											<td><input type="text" class="inp_txt w02" name="result_1_compressor2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_2_compressor2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_3_compressor2" value="" /></td>
											<td><input type="text" class="inp_txt w02" name="result_4_compressor2" value="" /></td>
											<td><textarea rows="5" cols="100" class="inp_txtarea" id="" name="result_etc_compressor2"></textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
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
						<c:if test="${question.designedCode ne '01'}">
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
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</ol>
						</c:if>
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