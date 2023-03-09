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
							<th scope="row">방냉펌프 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_manual_frequency_set');" class="font_purple setPop" ><span id="T03002_icestorage_manual_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프 최저 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_min_frequency_set');" class="font_purple setPop" ><span id="T03002_icestorage_min_frequency_set" ></span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						<c:choose>
						<c:when test="${sessionScope.SITE_INFO.siteId==27||sessionScope.SITE_INFO.siteId==28}">
						<tr>
						<th scope="row">축냉펌프압축기1대 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','storagetank_press1_frequency_set');" class="font_purple setPop" ><span id="T03002_storagetank_press1_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">축냉펌프압축기2대 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','storagetank_press2_frequency_set');" class="font_purple setPop" ><span id="T03002_storagetank_press2_frequency_set" ></span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						<tr>
							<th scope="row">방냉펌프 최고 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_max_frequency_set');" class="font_purple setPop" ><span id="T03002_icestorage_max_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_time_set');" class="font_purple setPop" ><span id="T03002_icestorage_time_set" > </span> </a> <span class="font_yellow">시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_heatstorage_set');" class="font_purple setPop" ><span id="T03002_icestorage_heatstorage_set" > </span> </a> <span class="font_yellow">%</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','freeze_protect_run_temp');" class="font_purple setPop" ><span id="T03002_freeze_protect_run_temp" > </span> </a> <span class="font_yellow">℃</span></td>
<c:choose>
	<c:when test="${sessionScope.SITE_INFO.siteId==27||sessionScope.SITE_INFO.siteId==28}">
							<th scope="row"></th>
							<td></td>
	</c:when>
	<c:otherwise>
							<th scope="row">동파방지 정지온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','freeze_protect_stop_temp');" class="font_purple setPop" ><span id="T03002_freeze_protect_stop_temp" > </span> </a> <span class="font_yellow">℃</span></td>
	</c:otherwise>
</c:choose>
						</tr>
						<tr>
							<th scope="row">동파방지 기동시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','freeze_protect_coolwater_run_hour');" class="font_purple setPop" ><span id="T03002_freeze_protect_coolwater_run_hour" > </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row">동파방지 정지시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','freeze_protect_coolwater_stop_hour');" class="font_purple setPop" ><span id="T03002_freeze_protect_coolwater_stop_hour" > </span> </a> <span class="font_yellow">분</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','freeze_protect_alarm_temp');" class="font_purple setPop" ><span id="T03002_freeze_protect_alarm_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각수 입구고온</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','coolant_enter_temp');" class="font_purple setPop" ><span id="T03002_coolant_enter_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">브라인 출구 과냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','brine_exit_super_cooling_set');" class="font_purple setPop" ><span id="T03002_brine_exit_super_cooling_set" > </span> </a> <span class="font_yellow">℃</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','storagetank_stop_night_delay');" class="font_purple setPop" ><span id="T03002_storagetank_stop_night_delay"> </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row">야간시 냉각수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','coolantpump_stop_night_delay');" class="font_purple setPop" ><span id="T03002_coolantpump_stop_night_delay"> </span> </a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">주간시 축냉펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','storagetank_stop_day_delay');" class="font_purple setPop" ><span id="T03002_storagetank_stop_day_delay" > </span> </a> <span class="font_yellow">초</span></td>
							<th scope="row">주간시 냉각수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','coolantpump_stop_day_delay');" class="font_purple setPop" ><span id="T03002_coolantpump_stop_day_delay"> </span> </a> <span class="font_yellow">초</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','coolwaterpump_stop_delay');" class="font_purple setPop" ><span id="T03002_coolwaterpump_stop_delay" > </span> </a> <span class="font_yellow">초</span></td>
							<th scope="row">방냉펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_stop_delay');" class="font_purple setPop" ><span id="T03002_icestorage_stop_delay"> </span> </a> <span class="font_yellow">초</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>
				방냉펌프 제어설정
				<div class="head_right">
					<div class="switch on" id="T03002_icestorage_use">
						<span class="stop">미사용</span>
						<span class="start">사용</span>
						<em></em>
					</div>
				</div>
			</dt>
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
							<th scope="row">방냉펌프 기동온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_run_set');" class="font_purple setPop" ><span id="T03002_icestorage_run_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">방냉펌프 정지온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_stop_set');" class="font_purple setPop" ><span id="T03002_icestorage_stop_set" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프 대기시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03002','icestorage_delay');" class="font_purple setPop" ><span id="T03002_icestorage_delay" > </span> </a> <span class="font_yellow">분</span></td>
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
							<th scope="row">방냉펌프 메인 가동시간</th>
							<td><span id="T03002_icestorage_main_monthly_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03002_icestorage_main_monthly_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
							<th scope="row">방냉펌프 예비 가동시간</th>
							<td><span id="T03002_icestorage_pre_monthly_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03002_icestorage_pre_monthly_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">일반전력 일 전력량</th>
							<td><span id="T03002_electric_day_set" class="font_yellow"> </span> <span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-1 주간 가동시간</th>
							<td><span id="T03002_fridge1_1_monthly_day_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03002_fridge1_1_monthly_day_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">심야전력 일 전력량</th>
							<td><span id="T03002_electric_night_set" class="font_yellow"> </span> <span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-2 주간 가동시간</th>
							<td><span id="T03002_fridge1_2_monthly_day_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03002_fridge1_2_monthly_day_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">일반전력 적산 전력량</th>
							<td><span id="T03002_electric_day_accum_set" class="font_yellow"> </span><span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-1 야간 가동시간</th>
							<td><span id="T03002_fridge1_1_monthly_night_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03002_fridge1_1_monthly_night_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">심야전력 적산 전력량</th>
							<td><span id="T03002_electric_night_accum_set" class="font_yellow"> </span><span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-2 야간 가동시간</th>
							<td><span id="T03002_fridge1_2_monthly_night_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
								<span id="T03002_fridge1_2_monthly_night_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

