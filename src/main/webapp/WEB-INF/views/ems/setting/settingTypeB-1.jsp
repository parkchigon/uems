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
						<c:set var="count" value="0"/>
						<c:forEach var="result" items="${tagMapList}" varStatus="status">
							<c:if test="${result.groupId eq 'inverter_control_set'}">
								<c:set var="count" value="${count+1}"/>
								<c:if test="${count % 2 eq '1'}">	
									<tr>
								</c:if>
								<th scope="row">${result.displayName}</th>
								<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','${result.templateId}','${result.componentId}');" class="font_purple setPop" ><span id="${result.templateId}_${result.componentId}" > </span></a> <span id="UNIT_${result.templateId}_${result.componentId}" ></span></td>
								<c:if test="${count % 2 eq '0'}">	
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					
					
						<!-- tr>
							<th scope="row">방냉펌프 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_manual_frequency_set');" class="font_purple setPop" ><span id="T03009_icestorage_manual_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프 최저 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_min_frequency_set');" class="font_purple setPop" ><span id="T03009_icestorage_min_frequency_set" ></span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프 최고 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_max_frequency_set');" class="font_purple setPop" ><span id="T03009_icestorage_max_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row"></th>
							<td></td>
						</tr -->
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_time_set');" class="font_purple setPop" ><span id="T03009_icestorage_time_set" > </span> </a> <span class="font_yellow">시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_heatstorage_set');" class="font_purple setPop" ><span id="T03009_icestorage_heatstorage_set" > </span> </a> <span class="font_yellow">%</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','freeze_protect_run_temp');" class="font_purple setPop" ><span id="T03009_freeze_protect_run_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">동파방지 기동시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','freeze_protect_coolwater_run_hour');" class="font_purple setPop" ><span id="T03009_freeze_protect_coolwater_run_hour" > </span> </a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">동파방지 정지시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','freeze_protect_coolwater_stop_hour');" class="font_purple setPop" ><span id="T03009_freeze_protect_coolwater_stop_hour" > </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row"></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','freeze_protect_alarm_temp');" class="font_purple setPop" ><span id="T03009_freeze_protect_alarm_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각수 입구고온</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','coolant_enter_temp');" class="font_purple setPop" ><span id="T03009_coolant_enter_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">브라인 출구 과냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','brine_exit_super_cooling_set');" class="font_purple setPop" ><span id="T03009_brine_exit_super_cooling_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row"></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','storagetank_stop_night_delay');" class="font_purple setPop" ><span id="T03009_storagetank_stop_night_delay"> </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row">야간시 냉각수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','coolantpump_stop_night_delay');" class="font_purple setPop" ><span id="T03009_coolantpump_stop_night_delay"> </span> </a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">주간시 축냉펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','storagetank_stop_day_delay');" class="font_purple setPop" ><span id="T03009_storagetank_stop_day_delay" > </span> </a> <span class="font_yellow">초</span></td>
							<th scope="row">주간시 냉각수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','coolantpump_stop_day_delay');" class="font_purple setPop" ><span id="T03009_coolantpump_stop_day_delay"> </span> </a> <span class="font_yellow">초</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','coolwaterpump_stop_delay');" class="font_purple setPop" ><span id="T03009_coolwaterpump_stop_delay" > </span> </a> <span class="font_yellow">초</span></td>
							<th scope="row">방냉펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_stop_delay');" class="font_purple setPop" ><span id="T03009_icestorage_stop_delay"> </span> </a> <span class="font_yellow">초</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
		<dl>
			<dt>
				방냉펌프 제어설정
				<div class="head_right">
					<div class="switch on" id="T03009_icestorage_use">
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_run_set');" class="font_purple setPop" ><span id="T03009_icestorage_run_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">방냉펌프 정지온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_stop_set');" class="font_purple setPop" ><span id="T03009_icestorage_stop_set" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프 대기시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03009','icestorage_delay');" class="font_purple setPop" ><span id="T03009_icestorage_delay" > </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row"></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
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
							<td><span id="T03009_icestorage_main_monthly_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
							    <span id="T03009_icestorage_main_monthly_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
							<th scope="row">방냉펌프 예비 가동시간</th>
							<td><span id="T03009_icestorage_pre_monthly_hour" class="font_yellow"> </span><span class="font_yellow">시</span>
							    <span id="T03009_icestorage_pre_monthly_min" class="font_yellow"> </span><span class="font_yellow">분</span> 
							</td>
						</tr>
						<tr>
							<th scope="row">일반전력 일 전력량</th>
							<td><span id="T03009_electric_day_set" class="font_yellow"> </span> <span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-1 주간 가동시간</th>
							<td><span id="T03009_fridge1_1_monthly_day_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
							    <span id="T03009_fridge1_1_monthly_day_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">심야전력 일 전력량</th>
							<td><span id="T03009_electric_night_set" class="font_yellow"> </span> <span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-2 주간 가동시간</th>
							<td><span id="T03009_fridge1_2_monthly_day_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
							    <span id="T03009_fridge1_2_monthly_day_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">일반전력 적산 전력량</th>
							<td><span id="T03009_electric_day_accum_set" class="font_yellow"> </span><span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-1 야간 가동시간</th>
							<td><span id="T03009_fridge1_1_monthly_night_hour" class="font_yellow"> </span><span class="font_yellow">시</span> 
							    <span id="T03009_fridge1_1_monthly_night_min" class="font_yellow"> </span><span class="font_yellow">분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">심야전력 적산 전력량</th>
							<td><span id="T03009_electric_night_accum_set" class="font_yellow"> </span><span class="font_yellow">kwh</span></td>
							<th scope="row">냉동기 1-2 야간 가동시간</th>
							<td><span id="T03009_fridge1_2_monthly_night_hour" class="font_yellow"> </span><span class="font_yellow">시</span>
							    <span id="T03009_fridge1_2_monthly_night_min" class="font_yellow"> </span><span class="font_yellow">분</span> 
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

