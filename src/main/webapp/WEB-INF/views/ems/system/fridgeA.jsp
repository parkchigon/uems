<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	var alarmPage = 1;

	$(document).ready(function(){
		$('.switch').click(function(){
			if($(this).hasClass('disabled') == false) {
				if($(this).hasClass('on')) {
					$(this).find('.stop').show();
					$(this).find('.start').hide();
					$(this).removeClass('on').addClass('off');
					$(this).prev('.lamp').removeClass('on').addClass('off');
				} else if($(this).hasClass('off')){
					$(this).find('.start').show();
					$(this).find('.stop').hide();
					$(this).removeClass('off').addClass('on');
					$(this).prev('.lamp').removeClass('off').addClass('on');
				}
			};
		});	
		
		// 실시간 태그 값 조회
		selectTagValue();
		// 실시간 알람 조회
		selectAlarmStatus();
	});
	
	
	// 경보 > 페이지 이동
	function moveAlarm(div) {
		var totalPage = Math.ceil($(".warning tr").size() / 13);
		if(div == "prev") {
			if(alarmPage == "1") {
				return;
			} else {
				alarmPage = alarmPage-1;
			}
		} else if(div == "next") {
			if(alarmPage == totalPage) {
				return;
			} else {
				alarmPage = alarmPage+1;
			}
		}
		
		$(".warning tr").each(function() {
			if($(this).index() >= ((alarmPage-1)*13) && $(this).index() < (alarmPage*13)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	}
	
</script>
<!-- s : content_area -->
<div id="content_area">
	<div class="subTab_area">
		<ul>
			<c:forEach var="result" items="${subMenulist}" varStatus="status">
				<c:if test="${result.menuFlag eq 'Y'}">
					<c:if test="${result.submenuId eq subMenu}">
						<li class="on">
					</c:if>
					<c:if test="${result.submenuId ne subMenu}">
						<li>
					</c:if>
						<a href="javascript:emsMainTab('${result.submenuId}');">${result.submenuName}</a>
					</li>				
				</c:if>
			</c:forEach>
		</ul>
	</div>
	
	<!-- 템플릿 타입별로 계통도 노출 -->
	<!-- s : flow_area -->
	<c:forEach var="result" items="${subMenulist}" varStatus="status">
		<c:if test="${result.submenuId eq 'SYS01'}">
			<jsp:include page="${result.templateFilePath1}" />
		</c:if>	
	</c:forEach>
	<!-- e : flow_area -->
	
	<!-- s : data_area -->
	<div id="data_area">
		<div class="data_area_inner">
			<dl>
				<dt>냉동기 제어 온도 설정</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="35%">
						<col width="*">
						<col width="35%">
						<col width="15%">
					</colgroup>

						<tbody>
							<tr>
								<th scope="row">냉수 입구온도</th>
								<td class="font_yellow"><span id="T04001_coolwater_in_temp"></span> ℃</td>
								<th scope="row">냉수 출구온도</th>
								<td class="font_yellow"><span id="T04001_coolwater_out_temp"></span> ℃</td>
							</tr>
							<tr>
								<th scope="row">냉각수 입구온도</th>
								<td class="font_yellow"><span id="T04001_cool_in_temp"></span> ℃</td>
								<th scope="row">냉각수 출구온도</th>
								<td class="font_yellow"><span id="T04001_cool_out_temp"></span> ℃</td>
							</tr>
							<tr>
								<th scope="row">압축기 #1 입구온도</th>
								<td class="font_yellow"><span id="T04001_compressor1_in_temp"></span> ℃</td>
								<th scope="row">압축기 #1 출구온도</th>
								<td class="font_yellow"><span id="T04001_compressor1_out_temp"></span> ℃</td>
							</tr>
							<tr>
								<th scope="row">압축기 #2 입구온도</th>
								<td class="font_yellow"><span id="T04001_compressor2_in_temp"></span> ℃</td>
								<th scope="row">압축기 #2 출구온도</th>
								<td class="font_yellow"><span id="T04001_compressor2_out_temp"></span> ℃</td>
							</tr>
							<tr>
								<th scope="row">압축기 #1 냉매 차압</th>
								<td class="font_yellow"><span id="T04001_compressor1_cooling_set"></span> kg/㎠</td>
								<th scope="row">압축기 #2 냉매 차압</th>
								<td class="font_yellow"><span id="T04001_compressor2_cooling_set"></span> kg/㎠</td>
							</tr>
							<tr>
								<th scope="row">증발기 #1 압력</th>
								<td class="font_yellow"><span id="T04001_evaporator1_pressure_set"></span> kg/㎠</td>								
								<th scope="row">증발기 #2 압력</th>
								<td class="font_yellow"><span id="T04001_evaporator2_pressure_set"></span> kg/㎠</td>
							</tr>
							<tr>
								<th scope="row">응축기 #1 압력</th>
								<td class="font_yellow"><span id="T04001_condenser1_pressure_set"></span> kg/㎠</td>
								<th scope="row">응축기 #2 압력</th>
								<td class="font_yellow"><span id="T04001_condenser2_pressure_set"></span> kg/㎠</td>
							</tr>
							<tr>
								<th scope="row">압축기 #1 전류</th>
								<td class="font_yellow"><span id="T04001_compressor1_electric_set"></span> A</td>
								<th scope="row">압축기 #2 전류</th>
								<td class="font_yellow"><span id="T04001_compressor2_electric_set"></span> A</td>
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
		
		<div class="data_area_inner mt10">
			<dl>
				<dt><span class="icon_set danger">경보</span></dt>
				<dd>
					<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="33.3%">
							<col width="33.3%">
							<col width="*">
						</colgroup>
	
						<tbody class="warning">
							<c:set var="count" value="0"/>
							<c:forEach var="result" items="${tagMapList}" varStatus="status">
								<c:if test="${result.groupId eq 'alarm' && result.submenuId ne 'SYS01'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<tr>
									</c:if>
									<td class="" id="${result.templateId}_${result.componentId}"><a href="javascript:goAlarm();">${result.displayName}</a></td>
									<c:if test="${count % 3 eq '0'}">	
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
		
	</div>
	<!-- e : data_area -->
</div>
<!-- e : content_area -->

<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->
