<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		checkDoublePipe();

	});
	
	function checkDoublePipe() {
		var pipe4 = $("input[class='A21105_pipe4']").val();
		var pipe8 = $("input[class='A21105_pipe8']").val();
		if(pipe4=='1') {
			$("[name='doubleTag']").removeClass("down");
			$("[name='doubleTag']").addClass("up");
			$("[name='doubleTag']").addClass("on");
		} else if (pipe8=='1') {
			$("[name='doubleTag']").removeClass("up");
			$("[name='doubleTag']").addClass("down");
			$("[name='doubleTag']").addClass("on");
		} else {
			$("[name='doubleTag']").removeClass("on");
		}
	}
</script>



<div class="blockDiagram_area typeA">
			
	<div class="hw">
		<span class="pipe_hw_ud up pipe001" name="A21105_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe002" name="A21105_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe003" name="A21105_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe004" name="A21105_pipe1"><em></em></span>
		
		<span class="pipe_hw_lr right pipe001" name="A21105_pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe002" name="A21105_pipe1"><em></em></span>
		<span class="pipe_hw_lr left pipe003" name="A21105_pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe004" name="A21105_pipe1"><em></em></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_corner_dr corner003"></span>
		
		<span class="pipe_hw_corner_ul corner001"></span>
		
		<span class="pipe_hw_corner_ur corner001"></span>
		
		<span class="pipe_hw_t_lru corner001"></span>
		
		<span class="sensor_u_temperature sensor001"><em><span id="A21105_fridge_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="A21105_fridge_cool_in_temp"></span>℃</em></span>
		
		<div class="coolingtower no1">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1','A21105','cooltower_main');" class="power off" id="A21105_cooltower_main">정지</a><!-- 모달팝업 -->
				<a href="javascript:openLayerPop('#layerPop_type4','A21105','cooltower_main');" class="choice" id="A21105_cooltower_main_use">선택중</a>
				<span class="icon_direct auto" id="A21105_cooltower_main_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name2">냉각탑#1</strong>
		</div>
		
		<div class="coolingtower no2">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1','A21105','cooltower_pre');" class="power off" id="A21105_cooltower_pre">정지</a><!-- 모달팝업 -->
				<a href="javascript:openLayerPop('#layerPop_type4','A21105','cooltower_pre');" class="choice" id="A21105_cooltower_pre_use">선택중</a>
				<span class="icon_direct auto" id="A21105_cooltower_pre_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name2">냉각탑#2</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="javascript:openLayerPop('#layerPop_type1','A21105','coolpump_main');">
				<span class="fan" id="A21105_coolpump_main"></span>
				<span class="icon_direct auto" id="A21105_coolpump_main_auto_yn"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
		</div>
	</div>
	
	<div class="chw">
		<span class="pipe_chw_ud down pipe001" name="A21105_pipe3"><em></em></span>
		<span class="pipe_chw_ud up pipe002" name="A21105_pipe3"></span>
		<span class="pipe_chw_ud up pipe003" name="A21105_pipe2"></span>
		<span class="pipe_chw_ud down pipe004" name="A21105_pipe2"></span>
		<span class="pipe_chw_ud up pipe005" name="doubleTag"></span><!-- 테그네임이 2개임 pipe8/pipe4/-->
		<span class="pipe_chw_ud up pipe006" name="A21105_pipe6"></span>
		<span class="pipe_chw_ud down pipe007" name="A21105_pipe6"></span>
		<span class="pipe_chw_ud up pipe008" name="A21105_pipe7"><em></em></span>
		<span class="pipe_chw_ud up pipe009" name="A21105_pipe7"><em></em></span>
		
		<span class="pipe_chw_lr left pipe001" name="A21105_pipe3"></span>
		<span class="pipe_chw_lr left pipe002" name="A21105_pipe10"></span>
		<span class="pipe_chw_lr left pipe003" name="A21105_pipe3"><em></em></span>
		<span class="pipe_chw_lr left pipe004" name="A21105_pipe7"><em></em></span>
		<span class="pipe_chw_lr left pipe005" name="A21105_pipe2"></span>
		<span class="pipe_chw_lr right pipe006" name="A21105_pipe3"><em></em></span>
		<span class="pipe_chw_lr right pipe007" name="A21105_pipe7"><em></em></span>
		<span class="pipe_chw_lr right pipe008" name="A21105_pipe6"></span>
		<span class="pipe_chw_lr right pipe009" name="A21105_pipe5"></span>
		<span class="pipe_chw_lr right pipe010" name="A21105_pipe7"></span>
		<span class="pipe_chw_lr left pipe011" name="A21105_pipe7"></span>
		<span class="pipe_chw_lr right pipe012" name="A21105_pipe7"></span>
		
		<span class="pipe_chw_corner_dl corner001"></span>
		<span class="pipe_chw_corner_dl corner002"></span>
		
		<span class="pipe_chw_corner_dr corner001"></span>
		<span class="pipe_chw_corner_dr corner002"></span>
		<span class="pipe_chw_corner_dr corner003"></span>
		
		<span class="pipe_chw_corner_ul corner001"></span>
		<span class="pipe_chw_corner_ul corner002"></span>
		<span class="pipe_chw_corner_ul corner003"></span>
		
		<span class="pipe_chw_corner_ur corner001"></span>
		<span class="pipe_chw_corner_ur corner002"></span>
		<span class="pipe_chw_corner_ur corner003"></span>
		
		<span class="pipe_chw_t_udr corner001"></span>
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_t_lru corner002"></span>
		<span class="pipe_chw_t_lru corner003"></span>
		
		<span class="pipe_chw_t_lrd corner001"></span>
		<span class="pipe_chw_t_lrd corner002"></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="A21105_fridge_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="A21105_fridge_storagetank_in_temp"></span> ℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky"><span id="A21105_storagetank_high_temp"></span> ℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky"><span id="A21105_storagetank_low_temp"></span> ℃</em></span>
		
		<span class="sensor_l_temperature sensor001"><em class="font_sky"><span id="A21105_icestorage_out_temp"></span> ℃</em></span>
		<span class="sensor_l_temperature sensor002"><em class="font_sky"><span id="A21105_icestorage_in_temp"></span> ℃</em></span>
		
		<div class="symbol No1"><em><span id="A21105_radiant_heat_inspect_flux"></span> ㎡/h</em></div>
		<div class="symbol No2"><em><span id="A21105_heatstorage_inspect_flux"></span> ㎡/h</em></div>
		
		<div class="vv-016k off" id="mv1_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A21105','mv1');" class="power" id="A21105_mv1">닫힘</a>
			<strong class="name">MV1</strong>
			<span class="icon_direct auto" id="A21105_mv1_auto_yn"></span>
		</div>
		
		<div class="heat_storaging_tank">
			<span class="bg" style="height:50%;"></span>
			<strong class="text"><span id="A21105_storagetank_heatstorage"></span>%</strong>
			<strong class="text2 up" id="A21105_storagetank_charge_state">축냉시</strong>
			<strong class="text2 down" id="A21105_storagetank_release_state">방냉시</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1">
				<a href="javascript:openLayerPop('#layerPop_type7','A21105','fridge1');" class="power no1" id="A21105_fridge1">가동</a>
				<span class="icon_direct no1" id="A21105_fridge1_auto_yn"></span>
				<span class="text no1 font_yellow"><span id="A21105_fridge1_compressor_volt"></span>A</span>
				
				<a href="javascript:openLayerPop('#layerPop_type7','A21105','fridge2');" class="power no2" id="A21105_fridge2">가동</a>
				<span class="icon_direct no2" id="A21105_fridge2_auto_yn"></span>
				<span class="text no2 font_yellow"><span id="A21105_fridge2_compressor_volt"></span>A</span>
			</div>
			<strong class="text_info"><a href="javascript:openLayerPop('#layerPop_type12','A21105','fridge_direct');" style="color:#fff;" class="power no3 setPop" id="A21105_fridge_compressor"> 냉동기</a></strong>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no1 font_yellow"><span id="A21105_storagetankpump_inv_frequency"></span> Hz</strong>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type13','A21105','storagetankpump_main');">
				<span class="fan" id="A21105_storagetankpump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A21105_storagetankpump_main_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','A21105','storagetankpump_pre');">
				<span class="fan" id="A21105_storagetankpump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A21105_storagetankpump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no2">축냉 펌프</strong>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no3 font_yellow"><span id="A21105_icestoragepump_inv_frequency"></span> Hz</strong>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type13','A21105','icestoragepump_main');">
				<span class="fan" id="A21105_icestoragepump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A21105_icestoragepump_main_auto_yn"></span>
			</a>
			<a class="coolpump No4" href="javascript:openLayerPop('#layerPop_type1','A21105','icestoragepump_pre');">
				<span class="fan" id="A21105_icestoragepump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A21105_icestoragepump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no4">방냉 펌프</strong>
		</div>
	</div>
	
	<div class="glycol">
		<div class="hx_plate_v"></div>
		
		<span class="pipe_glycol_ud down pipe001" name="A21105_pipe9"><em></em></span>
		<span class="pipe_glycol_ud up pipe002" name="A21105_pipe9"><em></em></span>
		
		<span class="pipe_glycol_lr left pipe001" name="A21105_pipe9"><em></em></span>
		<span class="pipe_glycol_lr right pipe002" name="A21105_pipe9"><em></em></span>
		<span class="pipe_glycol_lr left pipe003" name="A21105_pipe9"></span>
		<span class="pipe_glycol_lr right pipe004" name="A21105_pipe9"></span>
		
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="A21105_coolwater_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="A21105_coolwater_out_temp"></span> ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump" href="javascript:openLayerPop('#layerPop_type1','A21105','coolwaterpump_main');">
				<span class="fan" id="A21105_coolwaterpump_main"></span>
				<span class="icon_direct auto" id="A21105_coolwaterpump_main_auto_yn"></span>
			</a>
			<strong class="text_info">냉수 펌프</strong>
		</div>
		
		<div class="header No1">공<br />급<br />헤<br />더<em></em></div>
		<div class="header No2">환<br />수<br />헤<br />더<em></em></div>
	</div>
	
</div>