<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	var alarmPage = 1;
	
	// 경보 > 페이지 이동
	function moveAlarm(div) {
		var totalPage = Math.ceil($(".warning tr").size() / 7);
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
			if($(this).index() >= ((alarmPage-1)*7) && $(this).index() < (alarmPage*7)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	}
	
</script>

<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
		<dl class="left">
			<dt><span class="icon_set sys">시스템 상태</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">축냉운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02005_storagetank_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">방냉운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02005_icestorage_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">동시운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02005_winter_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">냉단운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02005_coolstorage_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
				</ul>
			</dd>
		</dl>
		
		<dl class="right">
			<dt><span class="icon_set set">축열조 설정</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">축냉종료 온도설정</span>
						<a href="javascript:openLayerPop('#layerPop_type3','T02005','heatstorage_temp_set');" class="font_purple setPop"><span id="T02005_heatstorage_temp_set"></span> <span class="font_yellow">℃</span></a>
					</li>
					<li>
						<span class="tit">축냉종료 시간설정</span>
						<a href="javascript:openLayerPop('#layerPop_type3','T02005','heatstorage_time_set');" class="font_purple setPop"><span id="T02005_heatstorage_time_set"></span> <span class="font_yellow">분</span></a>
					</li>
					<li>
						<span class="tit"><a href="javascript:openLayerPop('#layerPop_type10','T02005','heatstorage');">축냉완료</a></span>
						<span class="lamp off" id="T02005_heatstorage_end"></span>
						<span id="T02005_heatstorage_end_text">해지</span>
					</li>
					<li>
						<span class="tit">방냉종료 설정온도</span>
						<a href="javascript:openLayerPop('#layerPop_type3','T02005','icestorage_set_temp');" class="font_purple setPop"><span id="T02005_icestorage_set_temp"></span> <span class="font_yellow">℃</span></a>
					</li>
				</ul>
			</dd>
		</dl>
		<div class="both"></div>
	</div>
	
	<div class="data_btn_area mt10">
		<a class="small" href="javascript:openLayerPop('#layerPop_type4','T02005','fridge1');" id="T02005_fridge1_select">냉동기 #1</a>
		<a class="small" href="javascript:openLayerPop('#layerPop_type4','T02005','fridge2');" id="T02005_fridge2_select">냉동기 #2</a>
		<a class="small" href="javascript:openLayerPop('#layerPop_type4','T02005','fridge3');" id="T02005_fridge3_select">냉동기 #3</a>
		<a class="small" href="javascript:openLayerPop('#layerPop_type4','T02005','fridge4');" id="T02005_fridge4_select">냉동기 #4</a>
		<a class="small" href="javascript:openLayerPop('#layerPop_type4','T02005','hex1');" id="T02005_hex1_select">HEX #1</a>
		<a class="small" href="javascript:openLayerPop('#layerPop_type4','T02005','hex2');" id="T02005_hex2_select">HEX #2</a>
		<a class="small" href="javascript:openLayerPop('#layerPop_type4','T02005','hex3');" id="T02005_hex3_select">HEX #3</a>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set chart">적산 관리</span></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="*">
					<col width="32%">
					<col width="16%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">순시 축냉 열량</th>
							<td class="font_yellow"><span id="T02005_inspect_storagetank_heat">0</span> USRT</td>
							<th scope="row">일반전력 순시 전력량</th>
							<td class="font_yellow"><span id="T02005_inspect_day_power_set">0</span> kW</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type17','T02005','accum_storagetank_heat');" class="setPop">누적 축냉 열량</a></th>
							<td class="font_yellow"><span id="T02005_accum_storagetank_heat">0</span> USRT-hr</td>
							<th scope="row">심야전력 순시 전력량</th>
							<td class="font_yellow"><span id="T02005_inspect_night_power_set">0</span> kW</td>
						</tr>
						<tr>
							<th scope="row">순시 방냉 열량</th>
							<td class="font_yellow"><span id="T02005_inspect_icestorage_heat">0</span> USRT</td>
							<th scope="row">일반전력 적산 전력량</th>
							<td class="font_yellow"><span id="T02005_storagetank_day_power_set">0</span> MWh</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type17','T02005','accum_storagetank_heat');" class="setPop">누적 방냉 열량</a></th>
							<td class="font_yellow"><span id="T02005_accum_icestorage_heat">0</span> USRT-hr</td>
							<th scope="row">심야전력 적산 전력량</th>
							<td class="font_yellow"><span id="T02005_storagetank_night_power_set">0</span> MWh</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','fridge1_monthly_day_min');" class="setPop">냉동기#1 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_fridge1_monthly_day_hour">0</span>시 <span id="T02005_fridge1_monthly_day_min">0</span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','icestoragepump1_storagetank_min');" class="setPop">방냉펌프#1 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_icestoragepump1_storagetank_hour">0</span>시 <span id="T02005_icestoragepump1_storagetank_min">0</span>분</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','fridge2_monthly_day_min');" class="setPop">냉동기#2 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_fridge2_monthly_day_hour">0</span>시 <span id="T02005_fridge2_monthly_day_min">0</span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','icestoragepump2_storagetank_min');" class="setPop">방냉펌프#2 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_icestoragepump2_storagetank_hour">0</span>시 <span id="T02005_icestoragepump2_storagetank_min">0</span>분</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','fridge3_monthly_day_min');" class="setPop">냉동기#3 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_fridge3_monthly_day_hour">0</span>시 <span id="T02005_fridge3_monthly_day_min">0</span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','icestoragepump3_storagetank_min');" class="setPop">방냉펌프#3 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_icestoragepump3_storagetank_hour">0</span>시 <span id="T02005_icestoragepump3_storagetank_min">0</span>분</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','fridge4_monthly_day_min');" class="setPop">냉동기#4 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_fridge4_monthly_day_hour">0</span>시 <span id="T02005_fridge4_monthly_day_min">0</span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type18','T02005','icestoragepump4_storagetank_min');" class="setPop">방냉펌프#4 가동시간</a></th>
							<td class="font_yellow"><span id="T02005_icestoragepump4_storagetank_hour">0</span>시 <span id="T02005_icestoragepump4_storagetank_min">0</span>분</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>설정 관리</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="*">
					<col width="32%">
					<col width="16%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">인버터 제어설정</th>
							<td>
								<a href="javascript:openLayerPop('#layerPop_type4','T02005','icestorage_non_auto_control');" class="btnType btn_use" id="T02005_icestorage_non_auto_control_use">
									<span id="T02005_icestorage_non_auto_control_use_text">미사용</span>
								</a>
							</td>
							<th scope="row">MV3 통합밸브 제어설정</th>
							<td>
								<a href="javascript:openLayerPop('#layerPop_type4','T02005','mv3_valv_control');" class="btnType btn_use" id="T02005_mv3_valv_control_use">
									<span id="T02005_mv3_valv_control_use_text">미사용</span>
								</a>
							</td>
						</tr>
						<tr>
							<th scope="row">통합 수동주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02005','icestoragepump_non_auto_set');" class="font_purple setPop"><span id="T02005_icestoragepump_non_auto_set">0</span></a> <span class="font_yellow">Hz</span></td>
							<th scope="row">통합 수동제어 출력</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02005','mv3_valv_control_set');" class="font_purple setPop"><span id="T02005_mv3_valv_control_set">0</span></a> <span class="font_yellow">%</span></td>
						</tr>
						<tr>
							<th scope="row">MV3 수동 하한값 설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02005','mv3_non_auto_set');" class="font_purple setPop"><span id="T02005_mv3_non_auto_set">0</span></a> <span class="font_yellow">%</span></td>
							<th scope="row"></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set danger">경보</span>
				<div class="head_right">
					<span class="reAlarm">알람리셋</span>
					<div class="mr5 switch off" id="T02005_alarm_reset">
						<em></em>
					</div>
					<a href="javascript:moveAlarm('prev');" class="btn_next pre"><span class="blind">이전페이지</span></a>
					<a href="javascript:moveAlarm('next');" class="btn_next next"><span class="blind">다음페이지</span></a>
				</div>
			</dt>
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
							<c:if test="${result.groupId eq 'alarm'}">
								<c:set var="count" value="${count+1}"/>
								<c:if test="${count % 3 eq '1'}">	
									<c:choose>
										<c:when test="${count > 21}">
											<tr style="display:none;">
										</c:when>
										<c:otherwise>
											<tr>
										</c:otherwise>
									</c:choose>
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