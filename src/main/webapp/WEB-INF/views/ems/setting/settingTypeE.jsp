<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	});
	
	
</script>

<div id="data_area">
	<div class="scroll" style="height:900px;">
	<div class="data_area_inner">
		<dl>
			<dt>냉각탑 제어설정</dt>
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
							<th scope="row">1그룹 기동온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_total_run_temp');" class="font_purple setPop"><span id="T03005_cooltower1_total_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">1그룹 정지온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_total_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower1_total_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑1 주간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_day_run_temp');" class="font_purple setPop"><span id="T03005_cooltower1_day_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑1 주간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_day_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower1_day_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑1 야간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_night_run_temp');" class="font_purple setPop"><span id="T03005_cooltower1_night_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑1 야간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_night_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower1_night_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑2 주간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower2_day_run_temp');" class="font_purple setPop"><span id="T03005_cooltower2_day_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑2 주간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower2_day_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower2_day_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑2 야간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_night_run_temp');" class="font_purple setPop"><span id="T03005_cooltower1_night_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑2 야간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower1_night_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower1_night_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑3 주간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower3_day_run_temp');" class="font_purple setPop"><span id="T03005_cooltower3_day_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑3 주간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower3_day_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower3_day_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑3 야간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower3_night_run_temp');" class="font_purple setPop"><span id="T03005_cooltower3_night_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑3 야간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower3_night_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower3_night_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑4 주간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower4_day_run_temp');" class="font_purple setPop"><span id="T03005_cooltower4_day_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑4 주간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower4_day_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower4_day_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑4 야간기동</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower4_night_run_temp');" class="font_purple setPop"><span id="T03005_cooltower4_night_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑4 야간정지</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','cooltower4_night_stop_temp');" class="font_purple setPop"><span id="T03005_cooltower4_night_stop_temp" ></span></a> <span class="font_yellow">℃</span></td>
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
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">냉동기1 축냉설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge1_coldstorage_temp');" class="font_purple setPop"><span id="T03005_fridge1_coldstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기1 냉방설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge1_coolstorage_temp');" class="font_purple setPop"><span id="T03005_fridge1_coolstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기2 축냉설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge2_coldstorage_temp');" class="font_purple setPop"><span id="T03005_fridge2_coldstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기2 냉방설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge2_coolstorage_temp');" class="font_purple setPop"><span id="T03005_fridge2_coolstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3 축냉설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge3_coldstorage_temp');" class="font_purple setPop"><span id="T03005_fridge3_coldstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기3 냉방설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge3_coolstorage_temp');" class="font_purple setPop"><span id="T03005_fridge3_coolstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기4 축냉설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge4_coldstorage_temp');" class="font_purple setPop"><span id="T03005_fridge4_coldstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기4 냉방설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge4_coolstorage_temp');" class="font_purple setPop"><span id="T03005_fridge4_coolstorage_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>인버터 제어 설정
				<div class="head_right">
					<div class="switch off" id="T03005_icestorage_total_manual_set_use_yn">
						<span class="stop">정지</span>
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
							<th scope="row">방냉펌프1 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage1_manual_frequency_set');" class="font_purple setPop"><span id="T03005_icestorage1_manual_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프2 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage2_manual_frequency_set');" class="font_purple setPop"><span id="T03005_icestorage2_manual_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프3 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage3_manual_frequency_set');" class="font_purple setPop"><span id="T03005_icestorage3_manual_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프4 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage4_manual_frequency_set');" class="font_purple setPop"><span id="T03005_icestorage4_manual_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프 최저 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage_min_frequency_set');" class="font_purple setPop"><span id="T03005_icestorage_min_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프 최고 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage_max_frequency_set');" class="font_purple setPop"><span id="T03005_icestorage_max_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">통합 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage_total_manual_frequency_set');" class="font_purple setPop"><span id="T03005_icestorage_total_manual_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
							<th scope="row">수동 주파수 하한값</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage_manual_frequency_min_set');" class="font_purple setPop"><span id="T03005_icestorage_manual_frequency_min_set" ></span></a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">냉단시 축냉펌프 1대 고정주파수 설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','storagetank1_fix_frequency_set');" class="font_purple setPop"><span id="T03005_storagetank1_fix_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
							<th scope="row">냉단시 축냉펌프 2대 고정주파수 설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','storagetank2_fix_frequency_set');" class="font_purple setPop"><span id="T03005_storagetank2_fix_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">냉단시 축냉펌프 3대 고정주파수 설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','storagetank3_fix_frequency_set');" class="font_purple setPop"><span id="T03005_storagetank3_fix_frequency_set" ></span></a> <span class="font_yellow">Hz</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage_time_set');" class="font_purple setPop"><span id="T03005_icestorage_time_set" ></span></a> <span class="font_yellow">시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage_heatstorage_set');" class="font_purple setPop"><span id="T03005_icestorage_heatstorage_set" ></span></a> <span class="font_yellow">%</span></td>
						</tr>
						<tr>
							<th scope="row">초기부하 지연설정설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','delay_time_set');" class="font_purple setPop"><span id="T03005_delay_time_set" ></span></a> <span class="font_yellow">분</span></td>
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
							<th scope="row">기동온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','freeze_protect_run_temp');" class="font_purple setPop"><span id="T03005_freeze_protect_run_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">정지온도</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','freeze_protect_run_time');" class="font_purple setPop"><span id="T03005_freeze_protect_run_time" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">기동시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','freeze_protect_stop_temp');" class="font_purple setPop"><span id="T03005_freeze_protect_stop_temp" ></span></a> <span class="font_yellow">분</span></td>
							<th scope="row">정지시간</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','freeze_protect_stop_time');" class="font_purple setPop"><span id="T03005_freeze_protect_stop_time" ></span></a> <span class="font_yellow">분</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>정지지연 설정</dt>
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
							<th scope="row">축냉펌프 (심야용)</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','storagetank_night_delay_time');" class="font_purple setPop"><span id="T03005_storagetank_night_delay_time" ></span></a> <span class="font_yellow">분</span></td>
							<th scope="row">축냉펌프 (주간용)</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','storagetank_day_delay_time');" class="font_purple setPop"><span id="T03005_storagetank_day_delay_time" ></span></a> <span class="font_yellow">초</span></td>
						</tr>
						<tr>
							<th scope="row">냉각수펌프 (심야용)</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','coolpump_night_delay_time');" class="font_purple setPop"><span id="T03005_coolpump_night_delay_time" ></span></a> <span class="font_yellow">분</span></td>
							<th scope="row">냉각수펌프 (주간용)</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','coolpump_day_delay_time');" class="font_purple setPop"><span id="T03005_coolpump_day_delay_time" ></span></a> <span class="font_yellow">초</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','icestorage_night_delay_time');" class="font_purple setPop"><span id="T03005_icestorage_night_delay_time" ></span></a> <span class="font_yellow">초</span></td>
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
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','freeze_protect_alarm_temp');" class="font_purple setPop"><span id="T03005_freeze_protect_alarm_temp" ></span></a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각수 입구고온</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','coolant_enter_temp');" class="font_purple setPop"><span id="T03005_coolant_enter_temp" ></span></a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">브라인 출구 과냉</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','brine_exit_super_cooling_set');" class="font_purple setPop"><span id="T03005_brine_exit_super_cooling_set" ></span></a> <span class="font_yellow">℃</span></td>
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
			<dt>기동지연 설정</dt>
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
							<th scope="row">냉동기1</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge1_run_delay_set');" class="font_purple setPop"><span id="T03005_fridge1_run_delay_set" ></span></a> <span class="font_yellow">분</span></td>
							<th scope="row">냉동기2</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge2_run_delay_set');" class="font_purple setPop"><span id="T03005_fridge2_run_delay_set" ></span></a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge3_run_delay_set');" class="font_purple setPop"><span id="T03005_fridge3_run_delay_set" ></span></a> <span class="font_yellow">분</span></td>
							<th scope="row">냉동기4</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge4_run_delay_set');" class="font_purple setPop"><span id="T03005_fridge4_run_delay_set" ></span></a> <span class="font_yellow">분</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>전류제한 설정</dt>
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
							<th scope="row">냉동기1</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge1_volt_limit_set');" class="font_purple setPop"><span id="T03005_fridge1_volt_limit_set" ></span></a> <span class="font_yellow">%</span></td>
							<th scope="row">냉동기2</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge2_volt_limit_set');" class="font_purple setPop"><span id="T03005_fridge2_volt_limit_set" ></span></a> <span class="font_yellow">%</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge3_volt_limit_set');" class="font_purple setPop"><span id="T03005_fridge3_volt_limit_set" ></span></a> <span class="font_yellow">%</span></td>
							<th scope="row">냉동기4</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge4_volt_limit_set');" class="font_purple setPop"><span id="T03005_fridge4_volt_limit_set" ></span></a> <span class="font_yellow">%</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기 제어 열량 설정</dt>
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
							<th scope="row">냉동기1 기동설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge1_heat_run_set');" class="font_purple setPop"><span id="T03005_fridge1_heat_run_set" ></span></a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기1 정지설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge1_heat_stop_set');" class="font_purple setPop"><span id="T03005_fridge1_heat_stop_set" ></span></a> <span class="font_yellow">USRT</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기2 기동설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge2_heat_run_set');" class="font_purple setPop"><span id="T03005_fridge2_heat_run_set" ></span></a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기2 정지설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge2_heat_stop_set');" class="font_purple setPop"><span id="T03005_fridge2_heat_stop_set" ></span></a> <span class="font_yellow">USRT</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3 기동설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge3_heat_run_set');" class="font_purple setPop"><span id="T03005_fridge3_heat_run_set" ></span></a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기3 정지설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge3_heat_stop_set');" class="font_purple setPop"><span id="T03005_fridge3_heat_stop_set" ></span></a> <span class="font_yellow">USRT</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기4 기동설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge4_heat_run_set');" class="font_purple setPop"><span id="T03005_fridge4_heat_run_set" ></span></a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기4 정지설정</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03005','fridge4_heat_stop_set');" class="font_purple setPop"><span id="T03005_fridge4_heat_stop_set" ></span></a> <span class="font_yellow">USRT</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
</div>
<!-- e : data_area -->

