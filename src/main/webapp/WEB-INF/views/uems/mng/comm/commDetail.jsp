<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">
$(document).ready(function() {
	// radio 버튼 disabled 처리
	$("input:radio").attr("disabled", true);
});
</script>
<div class="contents_wrap">
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">통신관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 지점별 통신정보를 조회를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
			<colgroup>
				<col width="10%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지점명</th>
					<td colspan="2">
						<input type="text" value='<c:out value="${commDetail.sgName}"></c:out>' disabled="disabled">
					</td>
					<td colspan="9">
						<input type="text" value='<c:out value="${commDetail.siteName}"></c:out>' disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>지점설명</th>
					<td colspan="11">
						<input type="text" value='<c:out value="${commDetail.siteDesc}"></c:out>' disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>지점IP</th>
					<td colspan="11">
						<input type="text" value='<c:out value="${commDetail.siteIp}"></c:out>' disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>포트설명</th>
					<td colspan="2">
						<input type="text" value='<c:out value="${commDetail.pcName}"></c:out>' disabled="disabled">
					</td>
					<th>프로토콜</th>
					<td colspan="8">
						<input type="text" value='<c:out value="${commDetail.plcProtocolName}"></c:out>' disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>WORD 메모리크기</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.plcWordSize}"></c:out>' disabled="disabled">
					</td>
					<td colspan="12" rowspan="6">
						<textarea rows="13" cols="110" disabled="disabled">${commDetail.plcMemoryPosition}</textarea>
					</td>
				</tr>
				<tr>
					<th>FLOAT 메모리크기</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.plcFloatSize}"></c:out>' disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>DWORD 메모리크기</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.plcDwordSize}"></c:out>' disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>STRING 메모리크기</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.plcStringSize}"></c:out>' disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>읽기 시간초과</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.plcExceedRead}"></c:out>' disabled="disabled">초
					</td>
				</tr>
				<tr>
					<th>쓰기 시간초과</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.plcExceedWrite}"></c:out>' disabled="disabled">초
					</td>
				</tr>
				<tr>
					<th>Com Port</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.comPortName}"></c:out>' disabled="disabled">
					</td>
					<th rowspan="2">패리티 비티</th>
					<td rowspan="2">
						<ul>
							<c:forEach var="result" items="${bitParityCdId}" varStatus="status">
								<c:if test="${result.codeUseName eq commDetail.comBitParityCd}">
									<li>
										<input type="radio" id="comBitParityCd_${status.index}" name="comBitParityCd" value="${result.codeUseName}" checked="checked" />
										<label for="comBitParityCd_${status.index}">${result.codeName} Bit</label>
									</li>
								</c:if>
								<c:if test="${result.codeUseName ne commDetail.comBitParityCd}">
								<li>
									<input type="radio" id="comBitParityCd_${status.index}" name="comBitParityCd" value="${result.codeUseName}" />
									<label for="comBitParityCd_${status.index}">${result.codeName} Bit</label>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</td>
					<th rowspan="2">데이터 비트</th>
					<td rowspan="2">
						<ul>
							<c:forEach var="result" items="${bitDataCdId}" varStatus="status">
								<c:if test="${result.codeUseName eq commDetail.comBitDataCd}">
									<li>
									<input type="radio" id="comBitDataCd_${status.index}" name="comBitDataCd" value="${result.codeUseName}" checked="checked" />
									<label for="comBitDataCd_${status.index}">${result.codeName} Bit</label>
									</li>
								</c:if>
								<c:if test="${result.codeUseName ne commDetail.comBitDataCd}">
								<li>
									<input type="radio" id="comBitDataCd_${status.index}" name="comBitDataCd" value="${result.codeUseName}" />
									<label for="comBitDataCd_${status.index}">${result.codeName} Bit</label>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</td>
					<th rowspan="2">스톱 비티</th>
					<td rowspan="2">
						<ul>
							<c:forEach var="result" items="${bitStopCdId}" varStatus="status">
								<c:if test="${result.codeUseName eq commDetail.comBitStopCd}">
								<li>
									<input type="radio" id="comBitStopCd_${status.index}" name="comBitStopCd" value="${result.codeUseName}" checked="checked" />
									<label for="comBitStopCd_${status.index}">${result.codeName} Bit</label>
								</li>
								</c:if>
								<c:if test="${result.codeUseName ne commDetail.comBitStopCd}">
								<li>
									<input type="radio" id="comBitStopCd_${status.index}" name="comBitStopCd" value="${result.codeUseName}" />
									<label for="comBitStopCd_${status.index}">${result.codeName} Bit</label>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</td>
					<th rowspan="2">Tx 흐름제어</th>
					<td rowspan="2">
						<ul>
							<c:forEach var="result" items="${txCtrlCdId}" varStatus="status">
								<c:if test="${result.codeUseName eq commDetail.comTxCtrlCd}">
								<li>
									<input type="radio" id="comTxCtrlCd_${status.index}" name="comTxCtrlCd" value="${result.codeUseName}" checked="checked" />
									<label for="comTxCtrlCd_${status.index}">${result.codeName}</label>
								</li>
								</c:if>
								<c:if test="${result.codeUseName ne commDetail.comTxCtrlCd}">
								<li>
									<input type="radio" id="comTxCtrlCd_${status.index}" name="comTxCtrlCd" value="${result.codeUseName}" />
									<label for="comTxCtrlCd_${status.index}">${result.codeName}</label>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</td>
					<th rowspan="2">Rx 흐름제어</th>
					<td rowspan="2">
						<ul>
							<c:forEach var="result" items="${rxCtrlCdId}" varStatus="status">
								<c:if test="${result.codeUseName eq commDetail.comRxCtrlCd}">
								<li>
									<input type="radio" id="comRxCtrlCd_${status.index}" name="comRxCtrlCd" value="${result.codeUseName}" checked="checked" />
									<label for="comRxCtrlCd_${status.index}">${result.codeName}</label>
								</li>
								</c:if>
								<c:if test="${result.codeUseName ne commDetail.comRxCtrlCd}">
								<li>
									<input type="radio" id="comRxCtrlCd_${status.index}" name="comRxCtrlCd" value="${result.codeUseName}" />
									<label for="comRxCtrlCd_${status.index}">${result.codeName}</label>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Com Baud</th>
					<td>
						<input type="text" value='<c:out value="${commDetail.comBaudName}"></c:out>' disabled="disabled">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn_wrap03">
		<span class="btn btn_type01 btn_size03"><a href="javascript:window.history.back();">목록</a></span>
	</div>
</div>

