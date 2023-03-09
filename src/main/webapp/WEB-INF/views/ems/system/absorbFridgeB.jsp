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
				<dt>흡수식냉동기 #1</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="25%">
						<col width="*">
						<col width="25%">
						<col width="25%">
					</colgroup>
	
						<tbody>
							<tr>
								<th scope="row">가동시간(월별)</th>
								<td class="textR"><span id="T10001_absorb1_monthly_hour"></span>시 <span id="T10001_absorb1_monthly_min"></span>분</td>
								<th scope="row"><a href="javascript:openLayerPop('#layerPop_type20','T10001','accum_time_reset');" class="underline">가동시간(적산)</a></th>
								<td class="textR"><span id="T10001_absorb1_accum_hour"></span>시 <span id="T10001_absorb1_accum_min"></span>분</td>
							</tr>
							<tr>
								<th scope="row" class="font_green">순시열량</th>
								<td class="textR"><span id="T10001_absorb1_inspect_heat"></span> USRT</td>
								<th scope="row" class="font_green">월간 적산열량</th>
								<td class="textR"><span id="T10001_absorb1_monthly_heat"></span> USRT-hr</td>
							</tr>
							<tr>
								<th scope="row"><a href="javascript:openLayerPop('#layerPop_type19','T10001','accum_cal_reset');" class="font_green underline">적산월량</a></th>
								<td class="textR"><span id="T10001_absorb1_accum_heat"></span> USRT-hr</td>
								<th scope="row"></th>
								<td class="textR"></td>
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
		
		<div class="data_area_inner mt10">
			<dl>
				<dt>흡수식냉동기 #2</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="25%">
						<col width="*">
						<col width="25%">
						<col width="25%">
					</colgroup>
	
						<tbody>
							<tr>
								<th scope="row">가동시간(월별)</th>
								<td class="textR"><span id="T10001_absorb2_monthly_hour"></span>시 <span id="T10001_absorb2_monthly_min"></span>분</td>
								<th scope="row"><a href="javascript:openLayerPop('#layerPop_type20','T10001','accum_time_reset');" class="underline">가동시간(적산)</a></th>
								<td class="textR"><span id="T10001_absorb2_accum_hour"></span>시 <span id="T10001_absorb2_accum_min"></span>분</td>
							</tr>
							<tr>
								<th scope="row" class="font_green">순시열량</th>
								<td class="textR"><span id="T10001_absorb2_inspect_heat"></span> USRT</td>
								<th scope="row" class="font_green">월간 적산열량</th>
								<td class="textR"><span id="T10001_absorb2_monthly_heat"></span> USRT-hr</td>
							</tr>
							<tr>
								<th scope="row"><a href="javascript:openLayerPop('#layerPop_type19','T10001','accum_cal_reset');" class="font_green underline">적산월량</a></th>
								<td class="textR"><span id="T10001_absorb2_accum_heat"></span> USRT-hr</td>
								<th scope="row"></th>
								<td class="textR"></td>
							</tr>
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
