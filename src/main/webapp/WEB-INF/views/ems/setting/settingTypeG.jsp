<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	});
	
	
</script>

<div id="data_area">
	<div class="data_area_inner">
		<dl>
			<dt>인버터 제어 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">브라인펌프 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','brinepump_invert_frequency_set');" class="font_purple setPop" ><span id="T03007_brinepump_invert_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">브라인펌프 최저 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','brinepump_invert_min_frequency_set');" class="font_purple setPop" ><span id="T03007_brinepump_invert_min_frequency_set" ></span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">브라인펌프 최고 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','brinepump_invert_max_frequency_set');" class="font_purple setPop" ><span id="T03007_brinepump_invert_max_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
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
			<dt>동시운전 제어 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">방냉종료 시간설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','icestorage_time_set');" class="font_purple setPop" ><span id="T03007_icestorage_time_set" > </span> </a> <span class="font_yellow">시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','icestorage_heatstorage_set');" class="font_purple setPop" ><span id="T03007_icestorage_heatstorage_set" > </span> </a> <span class="font_yellow">%</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>동파방지 제어설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">동파방지 기동온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','freeze_protect_run_temp');" class="font_purple setPop" ><span id="T03007_freeze_protect_run_temp" > </span> </a> <span class="font_yellow">℃</span></td>
<c:choose>
	<c:when test="${sessionScope.SITE_INFO.siteId==31||sessionScope.SITE_INFO.siteId==32||sessionScope.SITE_INFO.siteId==35||sessionScope.SITE_INFO.siteId==36||sessionScope.SITE_INFO.siteId==37}">
							<th scope="row"></th>
							<td></td>
	</c:when>
	<c:otherwise>
							<th scope="row">동파방지 정지온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','freeze_protect_stop_temp');" class="font_purple setPop" ><span id="T03007_freeze_protect_stop_temp" > </span> </a> <span class="font_yellow">℃</span></td>
	</c:otherwise>
</c:choose>
						</tr>
						<tr>
							<th scope="row">동파방지 기동시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','freeze_protect_coolwater_run_hour');" class="font_purple setPop" ><span id="T03007_freeze_protect_coolwater_run_hour" > </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row">동파방지 정지시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','freeze_protect_coolwater_stop_hour');" class="font_purple setPop" ><span id="T03007_freeze_protect_coolwater_stop_hour" > </span> </a> <span class="font_yellow">분</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>알람 제어설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">동파방지 경보온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','freeze_protect_alarm_temp');" class="font_purple setPop" ><span id="T03007_freeze_protect_alarm_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각수 입구고온</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','coolant_enter_temp');" class="font_purple setPop" ><span id="T03007_coolant_enter_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">브라인 출구 과냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','brine_exit_super_cooling_set');" class="font_purple setPop" ><span id="T03007_brine_exit_super_cooling_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">밸브 개도이상 설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','valve_open_set');" class="font_purple setPop" ><span id="T03007_valve_open_set" > </span> </a> <span class="font_yellow">%</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>시간 제어설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">야간시 축냉펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','brinepump_stop_night_delay');" class="font_purple setPop" ><span id="T03007_brinepump_stop_night_delay"> </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row">야간시 냉각수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','coolantpump_stop_night_delay');" class="font_purple setPop" ><span id="T03007_coolantpump_stop_night_delay"> </span> </a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">주간시 축냉펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','brinepump_stop_day_delay');" class="font_purple setPop" ><span id="T03007_brinepump_stop_day_delay" > </span> </a> <span class="font_yellow">초</span></td>
							<th scope="row">주간시 냉각수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','coolantpump_stop_day_delay');" class="font_purple setPop" ><span id="T03007_coolantpump_stop_day_delay"> </span> </a> <span class="font_yellow">초</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03007','coolwaterpump_stop_delay');" class="font_purple setPop" ><span id="T03007_coolwaterpump_stop_delay" > </span> </a> <span class="font_yellow">초</span></td>
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
			<dt>전력량, 가동시간 관리</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">브라인펌프 메인 가동시간</th>
							<td><span id="T03007_brinepump_main_monthly_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03007_brinepump_main_monthly_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
							<th scope="row">브라인펌프 예비 가동시간</th>
							<td><span id="T03007_brinepump_pre_monthly_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03007_brinepump_pre_monthly_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">심야전력 일 전력량</th>
							<td><span id="T03007_electric_night_set" class="font_yellow"> </span> <span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-1 주간 가동시간</th>
							<td><span id="T03007_fridge1_1_monthly_day_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03007_fridge1_1_monthly_day_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">심야전력 적산 전력량</th>
							<td><span id="T03007_electric_night_accum_set" class="font_yellow"> </span> <span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-2 주간 가동시간</th>
							<td><span id="T03007_fridge1_2_monthly_day_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03007_fridge1_2_monthly_day_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 1-1 야간 가동시간</th>
							<td><span id="T03007_fridge1_1_monthly_night_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03007_fridge1_1_monthly_night_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
							<th scope="row">냉동기 1-2 야간 가동시간</th>
							<td><span id="T03007_fridge1_2_monthly_night_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03007_fridge1_2_monthly_night_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

