<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){

	});
	
	
</script>

<!-- s : content_area -->
<div id="content_area">
	<div class="alarm_area">
		<dl>
			<dt><strong>경보리스트</strong>
				<div class="head_right">
					<span>발생 : <em class="font_sky">${countList.alarmStatus01}</em></span>
					<span class="ml20">인지 : <em class="font_sky">${countList.alarmStatus02}</em></span>
					<span class="ml20">해지 : <em class="font_sky">${countList.alarmStatus03}</em></span>
				</div>
			</dt>
			<dd>
				<div  class="scroll" style="height:935px;">
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="110px">
					<col width="100px">
					<col width="200px">
					<col width="200px">
					<col width="*">
					<col width="100px">
				</colgroup>

					<thead>
						<tr>
							<th>경보날짜</th>
							<th>경보시간</th>
							<th>태그</th>
							<th>태그설명</th>
							<th>경보내용</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${alarmList}" varStatus="status">
							<c:if test="${result.alarmStatusCd eq 'ALARM_STATUS01' }">
								<tr>
									<th>${result.alarmDate}</th>
									<td>${result.alarmTime}</td>
									<td>${result.tagId}</td>
									<td>${result.tagDesc}</td>
									<td>
										<c:if test="${result.iAlarmWavCdNm ne null}">
											<audio src="/resources/ems/wav/${result.iAlarmWavCdNm}" autoplay="autoplay" loop=20 ></audio>
										</c:if>
										<c:if test="${result.iAlarmImgCdNm ne null}">
											<img src="/resources/ems/img/${result.iAlarmImgCdNm}" style="width: 25px;" />
										</c:if>
										 ${result.alarmMsg}
									</td>
									<td><a href="javascript:changeStatus('${result.alarmId}','${result.alarmStatusCd}');" class="btn btn_blue">인지</a></td>
								</tr>
							</c:if>
							<c:if test="${result.alarmStatusCd eq 'ALARM_STATUS02' }">
								<tr>
									<th>${result.alarmDate}</th>
									<td>${result.alarmTime}</td>
									<td>${result.tagId}</td>
									<td>${result.tagDesc}</td>
									<td>${result.alarmMsg}</td>
									<td><a href="javascript:changeStatus('${result.alarmId}','${result.alarmStatusCd}');" class="btn btn_blue">해제</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</dd>
		</dl>
	</div>
</div>
<!-- e : content_area -->
