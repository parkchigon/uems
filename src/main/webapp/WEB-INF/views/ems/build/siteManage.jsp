<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		
		setTextLengthLimit("#siteCd", 5);
		setTextLengthLimit("#siteName", 20);
		setTextLengthLimit("#siteIp", 15);
		setTextLengthLimit("#plcMemoryPosition", 2000);
		
		if(isEmpty($("input[name=siteId]").val())){
			// 처음 값으로 자동 checked 처리
			$('input:radio[name=comBitParityCd]:eq(0)').attr('checked', true);
			$('input:radio[name=comBitDataCd]:eq(0)').attr('checked', true);
			$('input:radio[name=comBitStopCd]:eq(0)').attr('checked', true);
			$('input:radio[name=comTxCtrlCd]:eq(0)').attr('checked', true);
			$('input:radio[name=comRxCtrlCd]:eq(0)').attr('checked', true);
		} else {
			$("select[name=sgId]").val('${siteView.sgId}').attr("selected", true);
			$("select[name=comPortCd]").val('${plcCommView.comPortCd}').attr("selected", true);
			$("select[name=comBaudCd]").val('${plcCommView.comBaudCd}').attr("selected", true);
			
			$('input:radio[name=comBitParityCd]:input[value='+'${plcCommView.comBitParityCd}'+']').attr("checked", true);
			$('input:radio[name=comBitDataCd]:input[value='+'${plcCommView.comBitDataCd}'+']').attr("checked", true);
			$('input:radio[name=comBitStopCd]:input[value='+'${plcCommView.comBitStopCd}'+']').attr("checked", true);
			$('input:radio[name=comTxCtrlCd]:input[value='+'${plcCommView.comTxCtrlCd}'+']').attr("checked", true);
			$('input:radio[name=comRxCtrlCd]:input[value='+'${plcCommView.comRxCtrlCd}'+']').attr("checked", true);
		}
	});
	
	
	// 저장
	function siteManageRegist() {
		if (formValidationCheck(['siteCd', 'siteName', 'pcName', 'siteIp', 'plcWordSize', 'plcFloatSize'
			, 'plcExceedRead', 'plcDwordSize', 'plcStringSize', 'plcExceedWrite', 'plcMemoryPosition'])){
			if(valueValidation()) {
				var f = document.frm;
				f.action = "<c:url value='/ems/build/siteManageRegistExe.do'/>";
				f.submit();
			}
		}
	}
	
	//validation 관련 alert 메시지
	function alertMessageSource(el_id){
		
		switch (el_id) {
			case 'siteCd':
				alert('지점 코드를 입력해주세요.');
				break;
			case 'siteName':
				alert('지점명을 입력해주세요.');
				break;
			case 'pcName':
				alert('포트 설명을 입력해주세요.');
				break;
			case 'siteIp':
				alert('지점 IP를 입력해주세요.');
				break;
			case 'plcWordSize':
				alert('WORD 메모리크기를 입력해주세요.');
				break;
			case 'plcFloatSize':
				alert('FLOAT 메모리크기를 입력해주세요.');
				break;
			case 'plcExceedRead':
				alert('읽기시간 초과	를 입력해주세요.');
				break;
			case 'plcDwordSize':
				alert('DWORD 메모리크기를 입력해주세요.');
				break;
			case 'plcStringSize':
				alert('STRING 메모리크기를 입력해주세요.');
				break;
			case 'plcExceedWrite':
				alert('쓰기시간 초과	를 입력해주세요.');
				break;
			case 'plcMemoryPosition':
				alert('PLC Address를 입력해주세요.');
				break;
		}
	}
	
	
	// 지점코드 5글자 확인
	function valueValidation() {
		// 지점코드 5글자 확인
		if($("input[name=siteCd]").val().length <5) {
			alert('지점 코드를 다시 입력해주세요.');
			return false;
		}
		return true;
	}
</script>
<form:form commandName="plcComm" name="frm" id="frm" method="post">	
	<input type="hidden" name="siteId" value="${siteView.siteId}"/>
	<input type="hidden" name="pcId" value="${plcCommView.pcId}"/>	
	<div class="build_all_area">
		<div class="build_left_inner mt30">
			<table class="build_row">
			<caption>caption</caption>
			<colgroup>
				<col width="200px">
				<col width="*">
				<col width="200px">
				<col width="300px">
			</colgroup>
	
				<tbody>
					<tr>
						<th><label for="">지점코드</label></th>
						<td>
							<input type="text" id="siteCd" name="siteCd" maxlength=5 value="${siteView.siteCd}" />
						</td>
						<td colspan="2">
							<c:out value="※ 지점코드 'S'+ 'E'(1자리문자) + 000(3자리숫자) " />
						</td>
					</tr>
					<tr>
						<th><label for="">지점명</label></th>
						<td>
							<select id="sgId" name="sgId" style="width: 200px">
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</select>
							<input type="text" style="width:394px" id="siteName" name="siteName" value="${siteView.siteName}"/>
						</td>
						<th><label for="">포트설명</label></th>
						<td><input type="text" id="pcName" name="pcName" value="${plcCommView.pcName}" /></td>
					</tr>
					<tr>
						<th><label for="">지점IP</label></th>
						<td><input type="text" id="siteIp" name="siteIp" value="${siteView.siteIp}"/></td>
						<th><label for="">프로토콜</label></th>
						<td>
							<input type="text" value="${plcProtocolCdId[0].codeName}" readonly />
							<input type="hidden" id="plcProtocolCd" name="plcProtocolCd" value="${plcProtocolCdId[0].codeUseName}" />
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="build_row" style="display:none;">
			<caption>caption</caption>
			<colgroup>
				<col width="200px">
				<col width="*">
				<col width="200px">
				<col width="*">
				<col width="200px">
				<col width="300px">
			</colgroup>
	
				<tbody>
					<tr>
						<th><label for="">WORD 메모리크기</label></th>
						<td>
							<!-- <input type="text" id="plcWordSize" name="plcWordSize" value="${plcCommView.plcWordSize}" maxlength=6 /> -->
							<input type="text" id="plcWordSize" name="plcWordSize" value="400" maxlength=6 />
						</td>
						<th><label for="">FLOAT 메모리크기</label></th>
						<td>
							<!-- <input type="text" id="plcFloatSize" name="plcFloatSize" value="${plcCommView.plcFloatSize}" maxlength=6 /> -->
							<input type="text" id="plcFloatSize" name="plcFloatSize" value="0" maxlength=6 />
						</td>
						<th><label for="">읽기시간 초과</label></th>
						<td>
							<!-- <input type="text" id="plcExceedRead" name="plcExceedRead" value="${plcCommView.plcExceedRead}" style="width:120px;" maxlength=4 /> 초 -->
							<input type="text" id="plcExceedRead" name="plcExceedRead" value="0" style="width:120px;" maxlength=4 /> 초
						</td>
					</tr>
					<tr>
						<th><label for="">DWORD 메모리크기</label></th>
						<td>
							<!-- <input type="text" id="plcDwordSize" name="plcDwordSize" value="${plcCommView.plcDwordSize}" maxlength=6 /> -->
							<input type="text" id="plcDwordSize" name="plcDwordSize" value="0" maxlength=6 />
						</td>
						<th><label for="">STRING 메모리크기</label></th>
						<td>
							<!-- <input type="text" id="plcStringSize" name="plcStringSize" value="${plcCommView.plcStringSize}" maxlength=6 /> -->
							<input type="text" id="plcStringSize" name="plcStringSize" value="0" maxlength=6 />
						</td>
						<th><label for="">쓰기시간 초과</label></th>
						<td>
							<!-- <input type="text" id="plcExceedWrite" name="plcExceedWrite" value="${plcCommView.plcExceedWrite}" style="width:120px;" maxlength=4 /> 초 -->
							<input type="text" id="plcExceedWrite" name="plcExceedWrite" value="0" style="width:120px;" maxlength=4 /> 초 
						</td>
					</tr>
				</tbody>
			</table>
			<table class="build_row">
			<caption>caption</caption>
			<colgroup>
				<col width="*">
			</colgroup>
				<tbody>
					<tr>
						<td>
							<textarea id="plcMemoryPosition" name="plcMemoryPosition" style="width:100%;height :570px;">${plcCommView.plcMemoryPosition}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="build_right_inner mt30">
			<table class="build_row">
			<caption>caption</caption>
			<colgroup>
				<col width="*">
				<col width="250px">
			</colgroup>
	
				<tbody>
					<tr>
						<th><label for="">COM Port</label></th>
						<td>
							<select id="comPortCd" name="comPortCd" style="width: 200px">
								<c:forEach var="result" items="${comPortCdId}" varStatus="status">
									<option value="${result.codeUseName}">${result.codeName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th><label for="">Com Baud</label></th>
						<td>
							<select id="comBaudCd" name="comBaudCd" style="width: 200px">
								<c:forEach var="result" items="${comBaudCdId}" varStatus="status">
									<option value="${result.codeUseName}">${result.codeName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="data_area_inner mt10">
				<dl>
					<dt>패리티 비트</dt>
					<dd>
						<ul>
							<c:forEach var="result" items="${bitParityCdId}" varStatus="status">
								<li>
									<input type="radio" id="comBitParityCd_${status.index}" name="comBitParityCd" value="${result.codeUseName}" disabled/>
									<label for="comBitParityCd_${status.index}">${result.codeName} Bit</label>
								</li>
								<c:if test="${status.index==0}">
									<input type="hidden" name="comBitParityCd" value="${result.codeUseName}" />
								</c:if> 
							</c:forEach>
						</ul>
					</dd>
				</dl>
				<div class="both"></div>
			</div>
			
			<div class="data_area_inner mt10">
				<dl class="left">
					<dt>데이터 비트</dt>
					<dd>
						<ul>
							<c:forEach var="result" items="${bitDataCdId}" varStatus="status">
								<li>
									<input type="radio" id="comBitDataCd_${status.index}" name="comBitDataCd" value="${result.codeUseName}" disabled/>
									<label for="comBitDataCd_${status.index}">${result.codeName} Bit</label>
								</li>
								<c:if test="${status.index==0}">
									<input type="hidden" name="comBitDataCd" value="${result.codeUseName}" />
								</c:if>
							</c:forEach>
						</ul>
					</dd>
				</dl>
				<dl class="right">
					<dt>스톱 비트</dt>
					<dd>
						<ul>
							<c:forEach var="result" items="${bitStopCdId}" varStatus="status">
								<li>
									<input type="radio" id="comBitStopCd_${status.index}" name="comBitStopCd" value="${result.codeUseName}" disabled/>
									<label for="comBitStopCd_${status.index}">${result.codeName} Bit</label>
								</li>
								<c:if test="${status.index==0}">
									<input type="hidden" name="comBitStopCd" value="${result.codeUseName}" />
								</c:if>
							</c:forEach>
						</ul>
					</dd>
				</dl>
				<div class="both"></div>
			</div>
			
			<div class="data_area_inner mt10">
				<dl class="left">
					<dt>Tx 흐름제어</dt>
					<dd>
						<ul>
							<c:forEach var="result" items="${txCtrlCdId}" varStatus="status">
								<li>
									<input type="radio" id="comTxCtrlCd_${status.index}" name="comTxCtrlCd" value="${result.codeUseName}" disabled/>
									<label for="comTxCtrlCd_${status.index}">${result.codeName}</label>
								</li>
								<c:if test="${status.index==0}">
									<input type="hidden" name="comTxCtrlCd" value="${result.codeUseName}" />
								</c:if>
							</c:forEach>
						</ul>
					</dd>
				</dl>
				<dl class="right">
					<dt>Rx 흐름제어</dt>
					<dd>
						<ul>
							<c:forEach var="result" items="${rxCtrlCdId}" varStatus="status">
								<li>
									<input type="radio" id="comRxCtrlCd_${status.index}" name="comRxCtrlCd" value="${result.codeUseName}" disabled/>
									<label for="comRxCtrlCd_${status.index}">${result.codeName}</label>
								</li>
								<c:if test="${status.index==0}">
									<input type="hidden" name="comRxCtrlCd" value="${result.codeUseName}" />
								</c:if>
							</c:forEach>
						</ul>
					</dd>
				</dl>
				<div class="both"></div>
			</div>
			
		</div>
		
		<div class="both"></div>
		
	</div>
</form:form>	

<div class="btn_areaC mt20">
	<a class="btnType btn_type02" href="javascript:siteManageRegist();">저장</a>
</div>
