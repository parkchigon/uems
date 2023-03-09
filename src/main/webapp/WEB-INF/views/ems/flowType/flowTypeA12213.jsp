<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		checkDoublePipe();

	});
	
	function checkDoublePipe() {
		var pipe27 = $("input[class='A12213_pipe27']").val();
		var pipe28 = $("input[class='A12213_pipe28']").val();
		if(pipe27=='1') {
			$("[name='doubleTag']").removeClass("down");
			$("[name='doubleTag']").addClass("up");
			$("[name='doubleTag']").addClass("on");
		} else if (pipe28=='1') {
			$("[name='doubleTag']").removeClass("up");
			$("[name='doubleTag']").addClass("down");
			$("[name='doubleTag']").addClass("on");
		} else {
			$("[name='doubleTag']").removeClass("on");
		}

		var pump11 = $("input[class='A12213_absorb_coolpump1_run_yn']").val();
		var pump12 = $("input[class='A12213_absorb_heatpump1_run_yn']").val();
		if(pump11=='1' || pump12=='1'){
			$("[name='doubleTag_1']").addClass("on");
			// 흡수식 펌프#1기동
			$("#A12213_absorb_pump1").addClass("on");
		}else{
			$("[name='doubleTag_1']").removeClass("on");
			// 흡수식 펌프#1중지
			$("#A12213_absorb_pump1").removeClass("on");
		}
		
		var pump21 = $("input[class='A12213_absorb_coolpump2_run_yn']").val();
		var pump22 = $("input[class='A12213_absorb_heatpump2_run_yn']").val();
		if(pump21=='1' || pump22=='1'){
			$("[name='doubleTag_2']").addClass("on");
			// 흡수식 펌프#2기동
			$("#A12213_absorb_pump2").addClass("on");
		}else{
			$("[name='doubleTag_2']").removeClass("on");
			// 흡수식 펌프#2중지
			$("#A12213_absorb_pump2").removeClass("on");
		}
		
		var pump31 = $("input[class='A12213_absorb_coolpumpsb_run_yn']").val();
		var pump32 = $("input[class='A12213_absorb_heatpumpsb_run_yn']").val();
		if(pump31=='1' || pump32=='1'){
			$("[name='doubleTag_sb']").addClass("on");
			// 흡수식 펌프#sb기동
			$("#A12213_absorb_pumpsb").addClass("on");
		}else{
			$("[name='doubleTag_sb']").removeClass("on");
			// 흡수식 펌프#sb중지
			$("#A12213_absorb_pumpsb").removeClass("on");
		}	
		
		var flux1 = $("input[class='A12213_absorb1_inspect_flux']").val();		// #1 순시유량
		var flux2 = $("input[class='A12213_absorb2_inspect_flux']").val();		// #2 순시유량
		// 배관 흐름
		if (flux1 > 0){
			$("[name='A12213_pipe61']").addClass("on");
		}else{
			$("[name='A12213_pipe61']").removeClass("on");
		}
		if (flux2 > 0){
			$("[name='A12213_pipe63']").addClass("on");
		}else{
			$("[name='A12213_pipe63']").removeClass("on");
		}
	}
</script>

<div class="blockDiagram_area typeA">

	<div class="hw">
		<span class="pipe_hw_ud down pipe002" name="A12213_pipe01"><em></em></span>
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_lr right pipe002" name="A12213_pipe01"><em></em></span>
		<span class="pipe_hw_t_lrd corner001"></span>
		<span class="pipe_hw_ud down pipe003" name="A12213_pipe02"></span>
		<span class="pipe_hw_t_udr corner001"></span>
		<span class="pipe_hw_lr right pipe004" name="A12213_pipe03"></span>
		<span class="pipe_hw_corner_ul corner001"></span>
		<span class="pipe_hw_ud down pipe005" name="A12213_pipe03"></span>
		<span class="pipe_hw_corner_dl corner002"></span>
		<span class="pipe_hw_lr left pipe005" name="A12213_pipe03"></span>
		<span class="pipe_hw_ud down pipe004" name="A12213_pipe01"><em></em></span>
		<span class="pipe_hw_corner_dl corner001"></span>
		<span class="pipe_hw_lr left pipe003" name="A12213_pipe01"><em></em></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_ud up pipe001" name="A12213_pipe01"><em></em></span>
		<span class="pipe_hw_corner_ur corner001"></span>
		<span class="pipe_hw_lr right pipe001" name="A12213_pipe01"><em></em></span>
		
		
		<span class="sensor_u_temperature sensor001"><em><span id="A12213_fridge_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="A12213_fridge_cool_in_temp"></span> ℃</em></span>
		
		<div class="coolingtower">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1','A12213','cooltower');" class="power off" id="A12213_cooltower">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="A12213_cooltower_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name">냉각탑</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="javascript:openLayerPop('#layerPop_type1','A12213', 'coolpump_main');">
				<span class="fan" id="A12213_coolpump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct" id="A12213_coolpump_main_auto_yn"></span>
			</a>
			<a class="coolpump ud No2" href="javascript:openLayerPop('#layerPop_type1','A12213', 'coolpump_pre');">
				<span class="fan" id="A12213_coolpump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct" id="A12213_coolpump_pre_auto_yn"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
			<a href="javascript:openLayerPop('#layerPop_type21','A12213', 'coolpump_work');" class="pumpchoice no1">선택</a>
		</div>
	</div>
	
	<div class="chw">
	
		<span class="pipe_chw_lr left pipe001" name="A12213_pipe21"></span>
		<span class="pipe_chw_corner_ur corner001"></span>
		<span class="pipe_chw_ud down pipe001" name="A12213_pipe21"><em></em></span>
		<span class="pipe_chw_corner_dr corner002"></span>
		<span class="pipe_chw_lr right pipe006" name="A12213_pipe21"><em></em></span>
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_ud up pipe005" name="doubleTag"></span><!-- 테그네임이 2개임 -->
		<span class="pipe_chw_lr right pipe007" name="A12213_pipe22"><em></em></span>
		<span class="pipe_chw_t_lru corner002"></span>
		<span class="pipe_chw_lr right pipe009" name="A12213_pipe24"></span>
		<span class="pipe_chw_t_lru corner003"></span>
		<span class="pipe_chw_ud up pipe006" name="A12213_pipe23"></span>
		<span class="pipe_chw_corner_ur corner002"></span>
		<span class="pipe_chw_lr right pipe008" name="A12213_pipe23"></span>
		<span class="pipe_chw_corner_ul corner003"></span>
		<span class="pipe_chw_ud down pipe007" name="A12213_pipe23"></span>
		<span class="pipe_chw_lr right pipe010" name="A12213_pipe22"></span>
		<span class="pipe_chw_corner_dl corner002"></span>
		<span class="pipe_chw_ud up pipe009" name="A12213_pipe22"><em></em></span>
		<span class="pipe_chw_corner_ur corner003"></span>
		<span class="pipe_chw_lr right pipe012" name="A12213_pipe22"></span>
		<span class="pipe_chw_lr left pipe011" name="A12213_pipe22"></span>
		<span class="pipe_chw_corner_dr corner003"></span>
		<span class="pipe_chw_ud up pipe008" name="A12213_pipe22"><em></em></span>
		<span class="pipe_chw_corner_ul corner002"></span>
		<span class="pipe_chw_lr left pipe004" name="A12213_pipe22"><em></em></span>
		<span class="pipe_chw_t_lrd corner002"></span>
		<span class="pipe_chw_lr left pipe003" name="A12213_pipe21"></span>
		<span class="pipe_chw_t_lrd corner001"></span>
		<span class="pipe_chw_lr left pipe002" name="A12213_pipe25"></span>
		<span class="pipe_chw_t_udr corner001"></span>
		<span class="pipe_chw_ud down pipe004" name="A12213_pipe26"></span>
		<span class="pipe_chw_corner_dl corner001"></span>
		<span class="pipe_chw_lr left pipe005" name="A12213_pipe26"></span>
		<span class="pipe_chw_corner_dr corner001"></span>
		<span class="pipe_chw_ud up pipe003" name="A12213_pipe26"></span>
		<span class="pipe_chw_ud up pipe002" name="A12213_pipe21"></span>
		<span class="pipe_chw_corner_ul corner001"></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="A12213_fridge_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="A12213_fridge_storagetank_in_temp"></span> ℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky"><span id="A12213_storagetank_high_temp"></span>  ℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky"><span id="A12213_storagetank_low_temp"></span>  ℃</em></span>
		
		<span class="sensor_l_temperature sensor001"><em class="font_sky"><span id="A12213_icestorage_out_temp"></span> ℃</em></span>
		<span class="sensor_l_temperature sensor002"><em class="font_sky"><span id="A12213_icestorage_in_temp"></span> ℃</em></span>
		
		<div class="symbol No1"><em><span id="A12213_radiant_heat_inspect_flux"></span> ㎡/h</em></div>
		<div class="symbol No2"><em><span id="A12213_heatstorage_inspect_flux"></span> ㎡/h</em></div>
		
		<div class="vv-016k No1 off" id="mv1_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A12213', 'mv1');" class="power" id="A12213_mv1">닫힘</a>
			<strong class="name">MV1</strong>
			<span class="icon_direct direct" id="A12213_mv1_auto_yn"></span>
		</div>
		
		<div class="vv-016k No2 off" id="mv2_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A12213', 'mv2');" class="power" id="A12213_mv2">닫힘</a>
			<strong class="name">MV2</strong>
			<span class="icon_direct direct" id="A12213_mv2_auto_yn"></span>
		</div>
		
		<div class="heat_storaging_tank">
			<span class="bg" style="height:0%;"></span>
			<strong class="text"><span id="A12213_storagetank_heatstorage"></span>%</strong>
			<strong class="text2 up" id="A12213_storagetank_charge_state">축냉시</strong>
			<strong class="text2 down" id="A12213_storagetank_release_state">방냉시</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1">
				<a href="javascript:openLayerPop('#layerPop_type7', 'A12213', 'fridge1');" class="power no1 on" id="A12213_fridge1">정지</a>
				<span class="icon_direct no1 auto" id="A12213_fridge1_auto_yn"></span>
				<span class="text no1 font_yellow"><span id="A12213_fridge1_compressor_volt"></span>A</span>
				
				<a href="javascript:openLayerPop('#layerPop_type7', 'A12213', 'fridge2');" class="power no2 on" id="A12213_fridge2">정지</a>
				<span class="icon_direct no2 auto" id="A12213_fridge2_auto_yn"></span>
				<span class="text no2 font_yellow"><span id="A12213_fridge2_compressor_volt"></span>A</span>
			</div>
			<strong class="text_info"><a href="javascript:openLayerPop('#layerPop_type12','A12213','fridge_direct');" style="color:#fff;" class="power no3 setPop" id="A12213_fridge_direct"> 냉동기</a></strong>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no1 font_yellow"><span id="A12213_storagetankpump_main_inv_frequency"></span>Hz</strong>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type13', 'A12213', 'storagetankpump_main');">
				<span class="fan" id="A12213_storagetankpump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A12213_storagetankpump_main_auto_yn"></span>
			</a>
			<strong class="text_info no2 font_yellow"><span id="A12213_storagetankpump_pre_inv_frequency"></span>Hz</strong>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type13', 'A12213', 'storagetankpump_pre');">
				<span class="fan" id="A12213_storagetankpump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A12213_storagetankpump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no2">축냉 펌프</strong>
			<a href="javascript:openLayerPop('#layerPop_type22','A12213', 'storagetankpump_work');" class="pumpchoice no2">선택</a>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no3 font_yellow"><span id="A12213_icestoragepump_main_inv_frequency"></span>Hz</strong>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type13','A12213', 'icestoragepump_main');">
				<span class="fan" id="A12213_icestoragepump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A12213_icestoragepump_main_auto_yn"></span>
			</a>
			<strong class="text_info no4 font_yellow"><span id="A12213_icestoragepump_pre_inv_frequency"></span>Hz</strong>
			<a class="coolpump No4" href="javascript:openLayerPop('#layerPop_type13','A12213', 'icestoragepump_pre');">
				<span class="fan" id="A12213_icestoragepump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A12213_icestoragepump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no5">방냉 펌프</strong>
			<a href="javascript:openLayerPop('#layerPop_type23','A12213', 'icestoragepump_work');" class="pumpchoice no3">선택</a>
		</div>
	</div>
	
	
	<div class="glycol"> <!-- 빙축열 헤더부 pipe -->
		<div class="hx_plate_v"></div>
		
		<span class="pipe_glycol_lr right pipe004" name="A12213_pipe41"></span>
		<span class="pipe_glycol_ud up pipe002" name="A12213_pipe41"><em></em></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		<span class="pipe_glycol_ud down pipe003" name="A12213_pipe41"></span>
		<span class="pipe_glycol_t_udr corner001"></span>
		<span class="pipe_glycol_ud down pipe004" name="A12213_pipe42"></span>
		<span class="pipe_glycol_t_udr corner002"></span>
		<span class="pipe_glycol_lr right pipe005" name="A12213_pipe43"></span>
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_ud down pipe006" name="A12213_pipe43"></span>
		<span class="pipe_glycol_corner_dl corner003"></span>
		<span class="pipe_glycol_lr left pipe006" name="A12213_pipe43"></span>
		<span class="pipe_glycol_ud down pipe005" name="A12213_pipe41"></span>
		<span class="pipe_glycol_corner_dr corner001"></span>
		<span class="pipe_glycol_lr right pipe007" name="A12213_pipe41"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_ud down pipe001" name="A12213_pipe41"><em></em></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_lr left pipe003" name="A12213_pipe41"></span>
		
		<!-- 
		<span class="pipe_glycol_ud up pipe004 on" name="DI_6113"></span>
		<span class="pipe_glycol_ud down pipe005 on" name="DI_6113"></span>
		 -->
		<span class="pipe_glycol_lr right pipe002 on" name="DI_6112"></span><!-- 확인?? -->
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="A12213_coolwater_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="A12213_coolwater_out_temp"></span> ℃</em></span>

	</div>
	

	<div class="glycol">
		<!-- 흡수식냉온수기#1 pipe -->
		<span class="pipe_glycol_lr right pipe107" name="A12213_pipe61"><em></em></span>
		<span class="pipe_glycol_corner_dl corner103"></span>
		<span class="pipe_glycol_ud up pipe108" name="A12213_pipe61"></span>
		<span class="pipe_glycol_ud down pipe101" name="A12213_pipe61"></span>
		<span class="pipe_glycol_t_udr corner101"></span>
		<span class="pipe_glycol_ud down pipe103" name="doubleTag_1"></span><!-- 다른태그에 의해 동작 -->
		<span class="pipe_glycol_t_udr corner102"></span>
		<span class="pipe_glycol_corner_dl corner101"></span>
		<span class="pipe_glycol_lr left pipe105" name="A12213_pipe61"><em></em></span>
		
		<!-- 흡수식냉온수기#2 pipe -->
		<span class="pipe_glycol_lr right pipe108" name="A12213_pipe63"><em></em></span>
		<span class="pipe_glycol_corner_dl corner104"></span>
		<span class="pipe_glycol_ud up pipe109" name="A12213_pipe63"></span>
		<span class="pipe_glycol_ud down pipe102" name="A12213_pipe63"></span>
		<span class="pipe_glycol_t_udl corner101"></span>
		<span class="pipe_glycol_ud down pipe105" name="doubleTag_2"></span><!-- 다른태그에 의해 동작 -->
		<span class="pipe_glycol_t_udl corner102"></span>
		<span class="pipe_glycol_ud down pipe107" name="A12213_pipe63"></span>
		<span class="pipe_glycol_corner_dl corner102"></span>
		<span class="pipe_glycol_lr left pipe106" name="A12213_pipe63"><em></em></span>

		<!-- SB펌프관련 pipe -->	
		<span class="pipe_glycol_lr left pipe101"></span>
		<span class="pipe_glycol_t_lrd corner101"></span>
		<span class="pipe_glycol_ud down pipe104" name="doubleTag_sb"></span><!-- 다른태그에 의해 동작 -->
		<span class="pipe_glycol_t_lru corner101"></span>
		<span class="pipe_glycol_lr right pipe103"></span>
		
	
		<span class="sensor_u_temperature sensor003"><em><span id="A12213_absorb1_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor005"><em class="font_sky"><span id="A12213_absorb1_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em><span id="A12213_absorb2_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor006"><em class="font_sky"><span id="A12213_absorb2_out_temp"></span> ℃</em></span>		
				
		<div class="symbol No3"><em><span id="A12213_absorb1_inspect_flux"></span> ㎡/h</em></div>					
		<div class="symbol No4"><em><span id="A12213_absorb2_inspect_flux"></span> ㎡/h</em></div>
		
		<div class="coolpump_area">
			<a class="coolpump ud no1" href="javascript:openLayerPop('#layerPop_type1','A12213', 'coolwaterpump_main');">
				<span class="fan" id="A12213_coolwaterpump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A12213_coolwaterpump_main_auto_yn"></span>
			</a>
			<a class="coolpump ud no2" href="javascript:openLayerPop('#layerPop_type1','A12213', 'coolwaterpump_pre');">
				<span class="fan" id="A12213_coolwaterpump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A12213_coolwaterpump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no101">냉수 펌프</strong>
			<a href="javascript:openLayerPop('#layerPop_type24','A12213', 'coolwaterpump_work');" class="pumpchoice no4">선택</a>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud no101">
				<span class="fan" id="A12213_absorb_pump1"></span>
				<strong class="name">#1</strong>
				<!-- <span class="icon_direct direct"></span> -->
			</a>
			<a class="coolpump ud no102">
				<span class="fan" id="A12213_absorb_pumpsb"></span>
				<strong class="name">SB</strong>
				<!-- <span class="icon_direct direct"></span> -->
			</a>
			<a class="coolpump ud no103">
				<span class="fan" id="A12213_absorb_pump2"></span>
				<strong class="name">#2</strong>
				<!-- <span class="icon_direct direct"></span> -->
			</a>
			<strong class="text_info no102">냉온수 펌프</strong>
		</div>


		<div class="header_lr No1">환 수 헤 더<em></em></div>
		<div class="header_lr No2">공 급 헤 더<em></em></div>

	</div>
	
	<!-- e:201710 추가 -->

	<div class="refrigerating_machine_area">
		<div class="refrigerating_machine No1">
			<strong class="name">#1</strong>
			<span class="power no1 on" id="A12213_absorb1">정지</span>
		</div>
		<div class="refrigerating_machine No2">
			<strong class="name">#2</strong>
			<span class="power no2 on" id="A12213_absorb2">정지</span>
		</div>
		<strong class="text_info">흡수식냉온수기</strong>
	</div>
	
	<!-- 201710 추가 -->
	<div class="innerPop pop1">
		<dl>
			<dt>가스량</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="100%" />
					</colgroup>
					<tbody>
						<tr>
							<td><span id="A12213_absorb1_gas"></span>㎥</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>

	<div class="innerPop pop3">
		<dl>
			<dt>전력량</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="100%" />
					</colgroup>
					<tbody>
						<tr>
							<td><span id="A12213_absorb_inspect_elec"></span>kWh</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="innerPop pop2">
		<dl>
			<dt>가스량</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="100%" />
					</colgroup>
					<tbody>
						<tr>
							<td><span id="A12213_absorb2_gas"></span>㎥</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>

	

