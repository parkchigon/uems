<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	var alarmPage = 1;

	$(document).ready(function(){
		// 스위치 선택 시 control 연동인 경우
		$('#night_set').click(function(){
			$('#night_set').removeClass('btn_dim_red').addClass('btn_red');
			$('#day_set').removeClass('btn_red').addClass('btn_dim_red');
		});
		$('#day_set').click(function(){
			$('#night_set').removeClass('btn_red').addClass('btn_dim_red');
			$('#day_set').removeClass('btn_dim_red').addClass('btn_red');
		});
	});
	
	// 설정관리 > 야간/주간 설정
	function dayNightTempSet(div) {
		// dayTempTbody : 주간설정
		// nightTempTbody : 야간설정
		$("tbody[id$=TempTbody]").hide();
		$("#"+div+"TempTbody").show();
	}
	
	// 경보 > 페이지 이동
	function moveAlarm(div) {
		var totalPage = Math.ceil($(".warning tr").size() / 9);
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
			if($(this).index() >= ((alarmPage-1)*9) && $(this).index() < (alarmPage*9)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	}
	
</script>


<div id="data_area">
	<div class="data_area_inner">
		<dl class="left">
			<dt><span class="icon_set sys">시스템 상태</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">축냉운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02003_storagetank_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">방냉운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02003_icestorage_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">동시운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02003_winter_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">냉단운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02003_coolstorage_drive">
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
						<a href="javascript:openLayerPop('#layerPop_type3','T02003','heatstorage_temp_set');" class="font_purple setPop"><span id="T02003_heatstorage_temp_set">0</span> <span class="font_yellow">℃</span></a>
					</li>
					<li>
						<span class="tit">축냉종료 시간설정</span>
						<a href="javascript:openLayerPop('#layerPop_type3','T02003','heatstorage_time_set');" class="font_purple setPop"><span id="T02003_heatstorage_time_set">0</span> <span class="font_yellow">분</span></a>
					</li>
					<li>
						<span class="tit"><a href="javascript:openLayerPop('#layerPop_type6','T02003','heatstorage');">축냉완료</a></span>
						<span class="lamp off" id="T02003_heatstorage_end"></span>
						<span id="T02003_heatstorage_end_text">해지</span>
					</li>
					<li>
						<span class="tit">방냉종료 설정온도</span>
						<a href="javascript:openLayerPop('#layerPop_type3','T02003','icestorage_set_temp');" class="font_purple setPop"><span id="T02003_icestorage_set_temp">0</span> <span class="font_yellow">℃</span></a>
					</li>
				</ul>
			</dd>
		</dl>
		<div class="both"></div>
	</div>
	
	<div class="data_btn_area mt10">
		<a href="javascript:openLayerPop('#layerPop_type4','T02003','fridge1');" class="btn_dim_red" id="T02003_fridge1_select">냉동기 #1</a>
		<a href="javascript:openLayerPop('#layerPop_type4','T02003','fridge2');" class="btn_dim_red" id="T02003_fridge2_select">냉동기 #2</a>
		<a href="javascript:openLayerPop('#layerPop_type4','T02003','fridge3');" class="btn_dim_red"  id="T02003_fridge3_select">냉동기 #3</a>
		<a href="javascript:openLayerPop('#layerPop_type4','T02003','hex1');" class="btn_dim_red" id="T02003_hex1_select">HEX #1</a>
		<a href="javascript:openLayerPop('#layerPop_type4','T02003','hex2');" class="btn_dim_red" id="T02003_hex2_select">HEX #2</a>
		<a href="javascript:openLayerPop('#layerPop_type4','T02003','hex3');" class="btn_dim_red" id="T02003_hex3_select">HEX #3</a>
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
							<th scope="row">순시 냉수#1 열량</th>
							<td class="font_yellow"><span id="T02003_coolwater1_inspect_heat">0</span> USRT</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T02003','brinepump1_accum_reset');" class="setPop">브라인 펌프#1 가동시간</a></th>
							<td class="font_yellow"><span id="T02003_brinepump1_accum_hour">0</span>시 <span id="T02003_brinepump1_accum_min">0</span>분</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type8','T02003','coolwater1_accum_reset');" class="setPop">누적 냉수#1 열량</a></th>
							<td class="font_yellow"><span id="T02003_coolwater1_accum_heat">0</span> USRT-hr</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T02003','fridge1_accum_reset');" class="setPop">냉동기#1 가동시간</a></th>
							<td class="font_yellow"><span id="T02003_fridge1_accum_hour">0</span>시 <span id="T02003_fridge1_accum_min">0</span>분</span></td>
						</tr>
						<tr>
							<th scope="row">순시 냉수#2 열량</th>
							<td class="font_yellow"><span id="T02003_coolwater2_inspect_heat">0</span> USRT</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T02003','brinepump2_accum_reset');" class="setPop">브라인 펌프#2 가동시간</a></th>
							<td class="font_yellow"><span id="T02003_brinepump2_accum_hour">0</span>시 <span id="T02003_brinepump2_accum_min">0</span>분</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type8','T02003','coolwater2_accum_reset');" class="setPop">누적 냉수#2 열량</a></th>
							<td class="font_yellow"><span id="T02003_coolwater2_accum_heat">0</span> USRT-hr</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T02003','fridge2_accum_reset');" class="setPop">냉동기#2 가동시간</a></th>
							<td class="font_yellow"><span id="T02003_fridge2_accum_hour">0</span>시 <span id="T02003_fridge2_accum_min">0</span>분</span></td>
						</tr>
						<tr>
							<th scope="row">순시 냉수#3 열량</th>
							<td class="font_yellow"><span id="T02003_coolwater3_inspect_heat">0</span> USRT</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T02003','brinepump3_accum_reset');" class="setPop">브라인 펌프#3 가동시간</a></th>
							<td class="font_yellow"><span id="T02003_brinepump3_accum_hour">0</span>시 <span id="T02003_brinepump3_accum_min">0</span>분</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type8','T02003','coolwater3_accum_reset');" class="setPop">누적 냉수#3 열량</a></th>
							<td class="font_yellow"><span id="T02003_coolwater3_accum_heat">0</span> USRT-hr</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T02003','fridge3_accum_reset');" class="setPop">냉동기#3 가동시간</a></th>
							<td class="font_yellow"><span id="T02003_fridge3_accum_hour">0</span>시 <span id="T02003_fridge3_accum_min">0</span>분</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>설정 관리
				<div class="head_right">
					<a href="javascript:openLayerPop('#layerPop_type4','T02003','cooltower1');" class="btn_disabled" id="T02003_cooltower1_use">냉각탑1 <span id="T02003_cooltower1_use_text">미사용</span></a>
					<a href="javascript:openLayerPop('#layerPop_type4','T02003','cooltower2');" class="btn_disabled" id="T02003_cooltower2_use">냉각탑2 <span id="T02003_cooltower2_use_text">미사용</span></a>
					<a href="javascript:openLayerPop('#layerPop_type4','T02003','cooltower3');" class="btn_disabled" id="T02003_cooltower3_use">냉각탑3 <span id="T02003_cooltower3_use_text">미사용</span></a>
					<a href="javascript:dayNightTempSet('night');" class="btn_dim_red" id="night_set">야간설정</a>
					<a href="javascript:dayNightTempSet('day');" class="btn_red" id="day_set">주간설정</a>
				</div>
			</dt>
			<dd>
				<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="20%">
						<col width="13.3%">
						<col width="20%">
						<col width="13.3%">
						<col width="20%">
						<col width="13.3%">
					</colgroup>
					<tbody id="nightTempTbody">
						<tr>
							<th scope="row">냉각탑 1-1 기동</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_1_night_run_temp');" class="font_purple setPop"><span id="T02003_cooltower1_1_night_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-1 기동</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_1_night_run_temp');" class="font_purple setPop"><span id="T02003_cooltower2_1_night_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-1 기동</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_1_night_run_temp');" class="font_purple setPop"><span id="T02003_cooltower3_1_night_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑 1-1 정지</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_1_night_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower1_1_night_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-1 정지</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_1_night_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower2_1_night_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-1 정지</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_1_night_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower3_1_night_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑 1-2 기동</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_2_night_run_temp');" class="font_purple setPop"><span id="T02003_cooltower1_2_night_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-2 기동</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_2_night_run_temp');" class="font_purple setPop"><span id="T02003_cooltower2_2_night_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-2 기동</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_2_night_run_temp');" class="font_purple setPop"><span id="T02003_cooltower3_2_night_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑 1-2 정지</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_2_night_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower1_2_night_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-2 정지</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_2_night_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower2_2_night_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-2 정지</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_2_night_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower3_2_night_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
					<tbody id="dayTempTbody" style="display:none;">
						<tr>
							<th scope="row">냉각탑 1-1 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_1_day_run_temp');" class="font_purple setPop"><span id="T02003_cooltower1_1_day_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-1 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_1_day_run_temp');" class="font_purple setPop"><span id="T02003_cooltower2_1_day_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-1 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_1_day_run_temp');" class="font_purple setPop"><span id="T02003_cooltower3_1_day_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑 1-1 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_1_day_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower1_1_day_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-1 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_1_day_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower2_1_day_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-1 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_1_day_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower3_1_day_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑 1-2 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_2_day_run_temp');" class="font_purple setPop"><span id="T02003_cooltower1_2_day_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-2 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_2_day_run_temp');" class="font_purple setPop"><span id="T02003_cooltower2_2_day_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-2 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_2_day_run_temp');" class="font_purple setPop"><span id="T02003_cooltower3_2_day_run_temp">0</span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑 1-2 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower1_2_day_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower1_2_day_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 2-2 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower2_2_day_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower2_2_day_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 3-2 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T02003','cooltower3_2_day_stop_temp');" class="font_purple setPop"><span id="T02003_cooltower3_2_day_stop_temp">0</span></a> <span class="font_yellow">℃</span></td>
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
					<div class="mr5 switch off" id="T02003_alarm_reset">
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
										<c:when test="${count > 27}">
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