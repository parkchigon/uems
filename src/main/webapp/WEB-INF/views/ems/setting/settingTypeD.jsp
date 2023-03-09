<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	});
	
	
</script>

<div id="data_area">
	<div class="data_area_inner">
		<dl>
			<dt>냉동기 기동/정지 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">냉동기 1 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge1_run_temp');" class="font_purple setPop" ><span id="T03004_fridge1_run_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge2_run_temp');" class="font_purple setPop" ><span id="T03004_fridge2_run_temp" ></span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge3_run_temp');" class="font_purple setPop" ><span id="T03004_fridge3_run_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기 1 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge1_stop_temp');" class="font_purple setPop" ><span id="T03004_fridge1_stop_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge2_stop_temp');" class="font_purple setPop" ><span id="T03004_fridge2_stop_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge3_stop_temp');" class="font_purple setPop" ><span id="T03004_fridge3_stop_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기 제어 온도 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">냉동기 1 축냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge1_coldstorage_temp');" class="font_purple setPop" ><span id="T03004_fridge1_coldstorage_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 축냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge2_coldstorage_temp');" class="font_purple setPop" ><span id="T03004_fridge2_coldstorage_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 축냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge3_coldstorage_temp');" class="font_purple setPop" ><span id="T03004_fridge3_coldstorage_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기 1 동시</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge1_winter_temp');" class="font_purple setPop" ><span id="T03004_fridge1_winter_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 동시</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge2_winter_temp');" class="font_purple setPop" ><span id="T03004_fridge2_winter_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 동시</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge3_winter_temp');" class="font_purple setPop" ><span id="T03004_fridge3_winter_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기 1 냉단</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge1_coolstorage_temp');" class="font_purple setPop" ><span id="T03004_fridge1_coolstorage_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 냉단</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge2_coolstorage_temp');" class="font_purple setPop" ><span id="T03004_fridge2_coolstorage_temp"> </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 냉단</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge3_coolstorage_temp');" class="font_purple setPop" ><span id="T03004_fridge3_coolstorage_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>동시운전 제어설정</dt>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','icestorage_set_time');" class="font_purple setPop" ><span id="T03004_icestorage_set_time" > </span> </a> <span class="font_yellow">시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','icestorage_heatstorage_set');" class="font_purple setPop" ><span id="T03004_icestorage_heatstorage_set" > </span> </a> <span class="font_yellow">%</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','freeze_protect_run_temp');" class="font_purple setPop" ><span id="T03004_freeze_protect_run_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">동파방지 정지온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','freeze_protect_stop_temp');" class="font_purple setPop" ><span id="T03004_freeze_protect_stop_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">동파방지 기동시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','freeze_protect_run_time');" class="font_purple setPop" ><span id="T03004_freeze_protect_run_time" > </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row">동파방지 정지시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','freeze_protect_stop_time');" class="font_purple setPop" ><span id="T03004_freeze_protect_stop_time" > </span> </a> <span class="font_yellow">분</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','freeze_protect_alarm_temp');" class="font_purple setPop" ><span id="T03004_freeze_protect_alarm_temp" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각수 입구고온</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','coolant_enter_temp');" class="font_purple setPop" ><span id="T03004_coolant_enter_temp" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">브라인 출구 과냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','brine_exit_super_cooling_set');" class="font_purple setPop" ><span id="T03004_brine_exit_super_cooling_set" > </span> </a> <span class="font_yellow">℃</span></td>
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
							<th scope="row">브라인펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','brine_pump_stop_delay');" class="font_purple setPop" ><span id="T03004_brine_pump_stop_delay"> </span> </a> <span class="font_yellow">분</span></td>
							<th scope="row">냉각펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','coolant_pump_stop_delay');" class="font_purple setPop" ><span id="T03004_coolant_pump_stop_delay"> </span> </a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프 정지지연</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','cool_pump_stop_delay');" class="font_purple setPop" ><span id="T03004_cool_pump_stop_delay" > </span> </a> <span class="font_yellow">초</span></td>
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
			<dt>축냉시 냉동기 설정
				<div class="head_right">
					<a href="javascript:openLayerPop('#layerPop_type4','T03004','cool_storage_fridge_set');" class="btn_use" >순번3번</a>
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
							<th scope="row">냉동기 1대 정지온도 설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge1_stop_temp_set');" class="font_purple setPop" ><span id="T03004_fridge1_stop_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2대 정지온도 설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03004','fridge2_stop_temp_set');" class="font_purple setPop" ><span id="T03004_fridge2_stop_temp_set" > </span> </a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

