<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	var alarm1Page = 1;
	var alarm2Page = 1;
	var alarm3Page = 1;
	var alarm4Page = 1;

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
	function moveAlarm(div, divId) {
		var page = 1;
		if (divId == 'alarm1') {
			page = alarm1Page;
		} else if (divId == 'alarm2') {
			page = alarm2Page;
		} else if (divId == 'alarm3') {
			page = alarm3Page;
		} else if (divId == 'alarm4') {
			page = alarm4Page;
		}
		
		var totalPage = Math.ceil($("#"+divId + " .warning tr").size() / 11);
		if(div == "prev") {
			if(page == "1") {
				return;
			} else {
				page = page-1;
			}
		} else if(div == "next") {
			if(page == totalPage) {
				return;
			} else {
				page = page+1;
			}
		}
		
		$("#"+divId + " .warning tr").each(function() {
			if($(this).index() >= ((page-1)*10) && $(this).index() < (page*10)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});

		if (divId == 'alarm1') {
			alarm1Page = page;
		} else if (divId == 'alarm2') {
			alarm2Page = page;
		} else if (divId == 'alarm3') {
			alarm3Page = page;
		} else if (divId == 'alarm4') {
			alarm4Page = page;
		}
	}
	
	/* 삭제하지 말것 */
	function checkDoublePipe() {
		var fridge1_evaporator_press = $("input[class='T12001_fridge1_evaporator_press']").val();
		$("#T12001_fridge1_evaporator_press").text(fridge1_evaporator_press);
		
		var fridge1_condenser_press = $("input[class='T12001_fridge1_condenser_press']").val();
		$("#T12001_fridge1_condenser_press").text(fridge1_condenser_press);
		
		var fridge1_press_current = $("input[class='T12001_fridge1_press_current']").val();
		$("#T12001_fridge1_press_current").text(fridge1_press_current);
		
		var fridge1_vane_rate = $("input[class='T12001_fridge1_vane_rate']").val();
		$("#T12001_fridge1_vane_rate").text(fridge1_vane_rate);
		
		var fridge1_oil_diff_press = $("input[class='T12001_fridge1_oil_diff_press']").val();
		$("#T12001_fridge1_oil_diff_press").text(fridge1_oil_diff_press);
		
		var fridge2_evaporator_press = $("input[class='T12001_fridge2_evaporator_press']").val();
		$("#T12001_fridge2_evaporator_press").text(fridge2_evaporator_press);
		
		var fridge2_condenser_press = $("input[class='T12001_fridge2_condenser_press']").val();
		$("#T12001_fridge2_condenser_press").text(fridge2_condenser_press);
		
		var fridge2_press_current = $("input[class='T12001_fridge2_press_current']").val();
		$("#T12001_fridge2_press_current").text(fridge2_press_current);
		
		var fridge2_vane_rate = $("input[class='T12001_fridge2_vane_rate']").val();
		$("#T12001_fridge2_vane_rate").text(fridge2_vane_rate);
		
		var fridge2_oil_diff_press = $("input[class='T12001_fridge2_oil_diff_press']").val();
		$("#T12001_fridge2_oil_diff_press").text(fridge2_oil_diff_press);
		
		var fridge3_evaporator_press = $("input[class='T12001_fridge3_evaporator_press']").val();
		$("#T12001_fridge3_evaporator_press").text(fridge3_evaporator_press);
		
		var fridge3_condenser_press = $("input[class='T12001_fridge3_condenser_press']").val();
		$("#T12001_fridge3_condenser_press").text(fridge3_condenser_press);
		
		var fridge3_press_current = $("input[class='T12001_fridge3_press_current']").val();
		$("#T12001_fridge3_press_current").text(fridge3_press_current);
		
		var fridge3_vane_rate = $("input[class='T12001_fridge3_vane_rate']").val();
		$("#T12001_fridge3_vane_rate").text(fridge3_vane_rate);
		
		var fridge3_oil_diff_press = $("input[class='T12001_fridge3_oil_diff_press']").val();
		$("#T12001_fridge3_oil_diff_press").text(fridge3_oil_diff_press);
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
	
	<div class="blockDiagram_area C64401">
			
		<div class="scroll" style="height:850px;">
		
			<div class="data_area_inner">
				<dl>
					<dt>냉동기 #1</dt>
					<dd>
						<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
	
							<tbody>
								<tr>
									<th scope="row">냉수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_coolwater_in_temp">0</span> ℃</td>
									<th scope="row">냉수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_cool_out_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">증발기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_evaporator_temp">0</span> ℃</td>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge1_evaporator_press">0</span> kg/㎠</td>
									<th scope="row">응축기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_temp">0</span> ℃</td>	
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_press">0</span> kg/㎠</td>	
								</tr>
								<tr>
									<th scope="row">압축기 전류</th>
									<td class="font_yellow"><span id="T12001_fridge1_press_current">0</span> A</td>
									<th scope="row">모터 권선-R 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor_winding_t_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">압축기 토출온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_discharge_temp">0</span> ℃</td>
									<th scope="row">배인 개도</th>
									<td class="font_yellow"><span id="T12001_fridge1_vane_rate">0</span> %</td>
									<th scope="row">응축기 베어링 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_bearing_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil_tank_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일차압</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil_diff_press">0</span> kg/㎠</td>
									<th scope="row"></th>
									<td></td>
									<th scope="row"></th>
									<td></td>
									<th scope="row"></th>
									<td></td>
								</tr>
								
								
								<!-- <tr>
									<th scope="row">증발기 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_evaporator2_temp">0</span> ℃</td>
									<th scope="row">응축기온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser2_temp">0</span> ℃</td>
									<th scope="row">오일차압</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil_diff_press">0</span> kg/㎠</td>
									<th scope="row">냉수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_coolwater_in_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">냉수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_cool_out_temp">0</span> ℃</td>
									<th scope="row">증발기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_evaporator_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">응축기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_temp">0</span> ℃</td>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge1_evaporator_press">0</span> kg/㎠</td>
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_press">0</span> kg/㎠</td>
									<th scope="row">증발기 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge1_evaporator2_press">0</span> kg/㎠</td>
								</tr>
								<tr>
									<th scope="row">응축기 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser2_press">0</span> kg/㎠</td>
									<th scope="row">응축기 토출온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil_tank_temp">0</span> ℃</td>
									<th scope="row">응축기 베어링 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser_bearing_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">모터 권선-R 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor_winding_t_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 압력</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil_tank_press">0</span> kg/㎠</td>
								</tr>
								<tr>
									<th scope="row">오일 펌프 압력</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil_pump_press">0</span> kg/㎠</td>
									<th scope="row">압축기 전류</th>
									<td class="font_yellow"><span id="T12001_fridge1_press_current">0</span> A</td>
									<th scope="row">ECO 레벨</th>
									<td class="font_yellow"><span id="T12001_fridge1_eco_level">0</span> %</td>
									<th scope="row">CON 레벨</th>
									<td class="font_yellow"><span id="T12001_fridge1_con_level">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">ECO 밸브</th>
									<td class="font_yellow"><span id="T12001_fridge1_eco_valve">0</span> %</td>
									<th scope="row">CON 밸브</th>
									<td class="font_yellow"><span id="T12001_fridge1_con_valve">0</span> %</td>
									<th scope="row">응축기 토출온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser2_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil2_tank_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">응축기 베어링 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_condenser2_bearing_temp">0</span> ℃</td>
									<th scope="row">모터 권선-R 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor2_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor2_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_motor2_winding_t_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일 탱크 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil2_tank_press">0</span> kg/㎠</td>
									<th scope="row">오일 펌프 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge1_oil2_pump_press">0</span> kg/㎠</td>
									<th scope="row">압축기 전류2</th>
									<td class="font_yellow"><span id="T12001_fridge1_press2_current">0</span> A</td>
									<th scope="row">ECO 레벨2</th>
									<td class="font_yellow"><span id="T12001_fridge1_eco2_level">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">CON 레벨2</th>
									<td class="font_yellow"><span id="T12001_fridge1_con2_level">0</span> %</td>
									<th scope="row">ECO 밸브2</th>
									<td class="font_yellow"><span id="T12001_fridge1_eco2_valve">0</span> %</td>
									<th scope="row">CON 밸브2</th>
									<td class="font_yellow"><span id="T12001_fridge1_con2_valve">0</span> %</td>
									<th scope="row">배인 개도</th>
									<td class="font_yellow"><span id="T12001_fridge1_vane_rate">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">디퓨져 열림 개도</th>
									<td class="font_yellow"><span id="T12001_fridge1_diffuser_open_rate">0</span> %</td>
									<th scope="row">배인 개도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_vane2_rate">0</span> %</td>
									<th scope="row">디퓨져 열림 개도2</th>
									<td class="font_yellow"><span id="T12001_fridge1_diffuser2_open_rate">0</span> %</td>
									<th scope="row"></th>
									<td></td>
								</tr> -->
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
			
			<div class="data_area_inner mt10">
				<dl>
					<dt>냉동기 #2</dt>
					<dd>
						<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
	
							<tbody>
								<tr>
									<th scope="row">냉수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_coolwater_in_temp">0</span> ℃</td>
									<th scope="row">냉수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_cool_out_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">증발기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_evaporator_temp">0</span> ℃</td>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge2_evaporator_press">0</span> kg/㎠</td>
									<th scope="row">응축기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_temp">0</span> ℃</td>	
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_press">0</span> kg/㎠</td>	
								</tr>
								<tr>
									<th scope="row">압축기 전류</th>
									<td class="font_yellow"><span id="T12001_fridge2_press_current">0</span> A</td>
									<th scope="row">모터 권선-R 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor_winding_t_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">압축기 토출온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_discharge_temp">0</span> ℃</td>
									<th scope="row">배인 개도</th>
									<td class="font_yellow"><span id="T12001_fridge2_vane_rate">0</span> %</td>
									<th scope="row">응축기 베어링 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_bearing_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil_tank_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일차압</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil_diff_press">0</span> kg/㎠</td>
									<th scope="row"></th>
									<td></td>
									<th scope="row"></th>
									<td></td>
									<th scope="row"></th>
									<td></td>
								</tr>
							
								<!-- <tr>
									<th scope="row">증발기 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_evaporator2_temp">0</span> ℃</td>
									<th scope="row">응축기온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser2_temp">0</span> ℃</td>
									<th scope="row">오일차압</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil_diff_press">0</span> kg/㎠</td>
									<th scope="row">냉수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_coolwater_in_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">냉수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_cool_out_temp">0</span> ℃</td>
									<th scope="row">증발기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_evaporator_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">응축기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_temp">0</span> ℃</td>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge2_evaporator_press">0</span> kg/㎠</td>
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_press">0</span> kg/㎠</td>
									<th scope="row">증발기 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge2_evaporator2_press">0</span> kg/㎠</td>
								</tr>
								<tr>
									<th scope="row">응축기 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser2_press">0</span> kg/㎠</td>
									<th scope="row">응축기 토출온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil_tank_temp">0</span> ℃</td>
									<th scope="row">응축기 베어링 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser_bearing_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">모터 권선-R 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor_winding_t_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 압력</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil_tank_press">0</span> kg/㎠</td>
								</tr>
								<tr>
									<th scope="row">오일 펌프 압력</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil_pump_press">0</span> kg/㎠</td>
									<th scope="row">압축기 전류</th>
									<td class="font_yellow"><span id="T12001_fridge2_press_current">0</span> A</td>
									<th scope="row">ECO 레벨</th>
									<td class="font_yellow"><span id="T12001_fridge2_eco_level">0</span> %</td>
									<th scope="row">CON 레벨</th>
									<td class="font_yellow"><span id="T12001_fridge2_con_level">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">ECO 밸브</th>
									<td class="font_yellow"><span id="T12001_fridge2_eco_valve">0</span> %</td>
									<th scope="row">CON 밸브</th>
									<td class="font_yellow"><span id="T12001_fridge2_con_valve">0</span> %</td>
									<th scope="row">응축기 토출온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser2_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil2_tank_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">응축기 베어링 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_condenser2_bearing_temp">0</span> ℃</td>
									<th scope="row">모터 권선-R 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor2_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor2_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_motor2_winding_t_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일 탱크 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil2_tank_press">0</span> kg/㎠</td>
									<th scope="row">오일 펌프 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge2_oil2_pump_press">0</span> kg/㎠</td>
									<th scope="row">압축기 전류2</th>
									<td class="font_yellow"><span id="T12001_fridge2_press2_current">0</span> A</td>
									<th scope="row">ECO 레벨2</th>
									<td class="font_yellow"><span id="T12001_fridge2_eco2_level">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">CON 레벨2</th>
									<td class="font_yellow"><span id="T12001_fridge2_con2_level">0</span> %</td>
									<th scope="row">ECO 밸브2</th>
									<td class="font_yellow"><span id="T12001_fridge2_eco2_valve">0</span> %</td>
									<th scope="row">CON 밸브2</th>
									<td class="font_yellow"><span id="T12001_fridge2_con2_valve">0</span> %</td>
									<th scope="row">배인 개도</th>
									<td class="font_yellow"><span id="T12001_fridge2_vane_rate">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">디퓨져 열림 개도</th>
									<td class="font_yellow"><span id="T12001_fridge2_diffuser_open_rate">0</span> %</td>
									<th scope="row">배인 개도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_vane2_rate">0</span> %</td>
									<th scope="row">디퓨져 열림 개도2</th>
									<td class="font_yellow"><span id="T12001_fridge2_diffuser2_open_rate">0</span> %</td>
									<th scope="row"></th>
									<td></td>
								</tr> -->
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
			
			<div class="data_area_inner mt10">
				<dl>
					<dt>상온 냉동기</dt>
					<dd>
						<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
	
							<tbody>
								<tr>
									<th scope="row">냉수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_coolwater_in_temp">0</span> ℃</td>
									<th scope="row">냉수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_cool_out_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">증발기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_evaporator_temp">0</span> ℃</td>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge3_evaporator_press">0</span> kg/㎠</td>
									<th scope="row">응축기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_temp">0</span> ℃</td>	
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_press">0</span> kg/㎠</td>	
								</tr>
								<tr>
									<th scope="row">압축기 전류</th>
									<td class="font_yellow"><span id="T12001_fridge3_press_current">0</span> A</td>
									<th scope="row">모터 권선-R 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor_winding_t_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">압축기 토출온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_discharge_temp">0</span> ℃</td>
									<th scope="row">배인 개도</th>
									<td class="font_yellow"><span id="T12001_fridge3_vane_rate">0</span> %</td>
									<th scope="row">응축기 베어링 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_bearing_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil_tank_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일차압</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil_diff_press">0</span> kg/㎠</td>
									<th scope="row"></th>
									<td></td>
									<th scope="row"></th>
									<td></td>
									<th scope="row"></th>
									<td></td>
								</tr>
								<!-- <tr>
									<th scope="row">증발기 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_evaporator2_temp">0</span> ℃</td>
									<th scope="row">응축기온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser2_temp">0</span> ℃</td>
									<th scope="row">오일차압</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil_diff_press">0</span> kg/㎠</td>
									<th scope="row">냉수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_coolwater_in_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">냉수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_cool_out_temp">0</span> ℃</td>
									<th scope="row">증발기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_evaporator_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">응축기 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_temp">0</span> ℃</td>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge3_evaporator_press">0</span>kg/㎠ </td>
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_press">0</span> kg/㎠</td>
									<th scope="row">증발기 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge3_evaporator2_press">0</span> kg/㎠</td>
								</tr>
								<tr>
									<th scope="row">응축기 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser2_press">0</span> kg/㎠</td>
									<th scope="row">응축기 토출온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil_tank_temp">0</span> ℃</td>
									<th scope="row">응축기 베어링 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser_bearing_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">모터 권선-R 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor_winding_t_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 압력</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil_tank_press">0</span> kg/㎠</td>
								</tr>
								<tr>
									<th scope="row">오일 펌프 압력</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil_pump_press">0</span> kg/㎠</td>
									<th scope="row">압축기 전류</th>
									<td class="font_yellow"><span id="T12001_fridge3_press_current">0</span> A</td>
									<th scope="row">ECO 레벨</th>
									<td class="font_yellow"><span id="T12001_fridge3_eco_level">0</span> %</td>
									<th scope="row">CON 레벨</th>
									<td class="font_yellow"><span id="T12001_fridge3_con_level">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">ECO 밸브</th>
									<td class="font_yellow"><span id="T12001_fridge3_eco_valve">0</span> %</td>
									<th scope="row">CON 밸브</th>
									<td class="font_yellow"><span id="T12001_fridge3_con_valve">0</span> %</td>
									<th scope="row">응축기 토출온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser2_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 탱크 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil2_tank_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">응축기 베어링 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_condenser2_bearing_temp">0</span> ℃</td>
									<th scope="row">모터 권선-R 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor2_winding_r_temp">0</span> ℃</td>
									<th scope="row">모터 권선-S 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor2_winding_s_temp">0</span> ℃</td>
									<th scope="row">모터 권선-T 온도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_motor2_winding_t_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일 탱크 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil2_tank_press">0</span>kg/㎠ </td>
									<th scope="row">오일 펌프 압력2</th>
									<td class="font_yellow"><span id="T12001_fridge3_oil2_pump_press">0</span> kg/㎠</td>
									<th scope="row">압축기 전류2</th>
									<td class="font_yellow"><span id="T12001_fridge3_press2_current">0</span> A</td>
									<th scope="row">ECO 레벨2</th>
									<td class="font_yellow"><span id="T12001_fridge3_eco2_level">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">CON 레벨2</th>
									<td class="font_yellow"><span id="T12001_fridge3_con2_level">0</span> %</td>
									<th scope="row">ECO 밸브2</th>
									<td class="font_yellow"><span id="T12001_fridge3_eco2_valve">0</span> %</td>
									<th scope="row">CON 밸브2</th>
									<td class="font_yellow"><span id="T12001_fridge3_con2_valve">0</span> %</td>
									<th scope="row">배인 개도</th>
									<td class="font_yellow"><span id="T12001_fridge3_vane_rate">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">디퓨져 열림 개도</th>
									<td class="font_yellow"><span id="T12001_fridge3_diffuser_open_rate">0</span> %</td>
									<th scope="row">배인 개도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_vane2_rate">0</span> %</td>
									<th scope="row">디퓨져 열림 개도2</th>
									<td class="font_yellow"><span id="T12001_fridge3_diffuser2_open_rate">0</span> %</td>
									<th scope="row"></th>
									<td></td>
								</tr> -->
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	
	<!-- s : data_area -->
	<div id="data_area"  style="height:850px;">
		<div class="data_area_inner" id="alarm1">
			<dl>
				<dt><span class="icon_set danger">냉동기 #1 경보</span>
					<div class="head_right">
						<a href="javascript:moveAlarm('prev', 'alarm1');" class="btn_next pre"><span class="blind">이전페이지</span></a>
						<a href="javascript:moveAlarm('next', 'alarm1');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
								<c:if test="${result.groupId eq 'alarm1'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<c:choose>
											<c:when test="${count > 31}">
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
		
		<div class="data_area_inner mt5" id="alarm2">
			<dl>
				<dt><span class="icon_set danger">냉동기 #2 경보</span>
					<div class="head_right">
						<a href="javascript:moveAlarm('prev', 'alarm2');" class="btn_next pre"><span class="blind">이전페이지</span></a>
						<a href="javascript:moveAlarm('next', 'alarm2');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
								<c:if test="${result.groupId eq 'alarm2'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<c:choose>
											<c:when test="${count > 31}">
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
		
		<div class="data_area_inner mt5" id="alarm3">
			<dl>
				<dt><span class="icon_set danger">상온 냉동기 경보</span>
					<div class="head_right">
						<a href="javascript:moveAlarm('prev', 'alarm3');" class="btn_next pre"><span class="blind">이전페이지</span></a>
						<a href="javascript:moveAlarm('next', 'alarm3');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
								<c:if test="${result.groupId eq 'alarm3'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<c:choose>
											<c:when test="${count > 31}">
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
</div>
<!-- e : content_area -->

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->
