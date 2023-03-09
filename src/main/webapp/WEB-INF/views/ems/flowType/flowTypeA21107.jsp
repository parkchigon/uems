<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		checkDoublePipe();

	});
	
	function checkDoublePipe() {
		var pipe7 = $("input[class='A21107_pipe7']").val();
		var pipe8 = $("input[class='A21107_pipe8']").val();
		if(pipe7=='1') {
			$("[name='doubleTag']").removeClass("up");
			$("[name='doubleTag']").addClass("down");
			$("[name='doubleTag']").addClass("on");
		} else if (pipe8=='1') {
			$("[name='doubleTag']").removeClass("down");
			$("[name='doubleTag']").addClass("up");
			$("[name='doubleTag']").addClass("on");
		} else {
			$("[name='doubleTag']").removeClass("on");
		}
	}
</script>



<div class="blockDiagram_area typeA">
			
	<div class="hw">
		<span class="pipe_hw_ud up pipe001" name="A21107_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe002" name="A21107_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe003" name="A21107_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe004" name="A21107_pipe1"><em></em></span>
		
		<span class="pipe_hw_lr right pipe001" name="A21107_pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe002" name="A21107_pipe1"><em></em></span>
		<span class="pipe_hw_lr left pipe003" name="A21107_pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe004" name="A21107_pipe1"><em></em></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		
		<span class="pipe_hw_corner_ul corner001"></span>
		
		<span class="pipe_hw_corner_ur corner001"></span>
		
		<span class="pipe_hw_t_lru corner001"></span>
		
		<span class="sensor_u_temperature sensor001"><em><span id="A21107_fridge_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="A21107_fridge_cool_in_temp"></span>℃</em></span>
		
		<div class="coolingtower no1">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1','A21107','cooltower_main');" class="power off" id="A21107_cooltower_main">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="A21107_cooltower_main_auto_yn"></span><!-- 자동일경우 none -->
				<a href="javascript:openLayerPop('#layerPop_type4', 'A21107','cooltower_main');" class="choice on" id="A21107_cooltower_main_use">선택중</a>
			</div>
			<strong class="name2">냉각탑#1</strong>
		</div>
		
		<div class="coolingtower no2">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1','A21107','cooltower_pre');" class="power off" id="A21107_cooltower_pre">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="A21107_cooltower_pre_auto_yn"></span><!-- 자동일경우 none -->
				<a href="javascript:openLayerPop('#layerPop_type4', 'A21107','cooltower_pre');" class="choice on" id="A21107_cooltower_pre_use">선택중</a>
			</div>
			<strong class="name2">냉각탑#2</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="javascript:openLayerPop('#layerPop_type1','A21107','coolpump');">
				<span class="fan" id="A21107_coolpump"></span>
				<span class="icon_direct auto" id="A21107_coolpump_auto_yn"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
		</div>
	</div>
	
	<div class="chw">
		<span class="pipe_chw_ud down pipe001" name="A21107_pipe2"></span>
		<span class="pipe_chw_ud down pipe002" name="A21107_pipe3"><em></em></span>
		<span class="pipe_chw_ud up pipe003" name="A21107_pipe2"><em></em></span>
		<span class="pipe_chw_ud up pipe004" name="A21107_pipe4"></span>
		<span class="pipe_chw_ud down pipe005" name="A21107_pipe5"><em></em></span>
		<span class="pipe_chw_ud down pipe006" name="doubleTag"></span><!-- 테그네임이 2개임 -->
		<span class="pipe_chw_ud up pipe007" name="A21107_pipe6"></span>
		<span class="pipe_chw_ud down pipe008" name="A21107_pipe6"></span>
		
		<span class="pipe_chw_lr left pipe001" name="A21107_pipe2"><em></em></span>
		<span class="pipe_chw_lr right pipe002" name="A21107_pipe9"></span>
		<span class="pipe_chw_lr right pipe003" name="A21107_pipe5"><em></em></span>
		<span class="pipe_chw_lr right pipe004" name="A21107_pipe3"><em></em></span>
		<span class="pipe_chw_lr right pipe005" name="A21107_pipe10"></span>
		<span class="pipe_chw_lr right pipe006" name="A21107_pipe2"></span>
		<span class="pipe_chw_lr right pipe007" name="A21107_pipe6"></span>
		<span class="pipe_chw_lr right pipe008" name="A21107_pipe12"></span>
		<span class="pipe_chw_lr right pipe009" name="A21107_pipe2"><em></em></span>
		<span class="pipe_chw_lr left pipe010" name="A21107_pipe11"></span>
		<span class="pipe_chw_lr right pipe011" name="A21107_pipe11"></span>
		
		<span class="pipe_chw_corner_dr corner001"></span>
		
		<span class="pipe_chw_corner_ul corner001"></span>
		<span class="pipe_chw_corner_ul corner002"></span>
		<span class="pipe_chw_corner_ul corner003"></span>
		
		<span class="pipe_chw_corner_ur corner001"></span>
		<span class="pipe_chw_corner_ur corner002"></span>
		
		<span class="pipe_chw_t_udr corner001"></span>
		<span class="pipe_chw_t_udr corner002"></span>
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_t_lru corner002"></span>
		<span class="pipe_chw_t_lru corner003"></span>
		<span class="pipe_chw_t_lru corner004"></span>
		<span class="pipe_chw_t_lru corner005"></span>
		
		<span class="pipe_chw_t_lrd corner001"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_sky"><span id="A21107_brinepump_mix_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_sky"><span id="A21107_brinepump_out_temp"></span> ℃</em></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="A21107_fridge_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="A21107_fridge_storagetank_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky"><span id="A21107_brinepump_in_temp"></span> ℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky"><span id="A21107_storagetank_high_temp"></span> ℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky"><span id="A21107_storagetank_low_temp"></span> ℃</em></span>
		
		<div class="symbol No1"><em><span id="A21107_brinepump_inspect_flux"></span> ㎡/h</em></div>
		
		<div class="vv-011k No1" id="mv1_class">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','A21107','mv1');" id="A21107_mv1"></a>
			<strong class="name">MV1</strong>
			<span class="text_inner text01"><span id="A21107_mv1_per"></span>%</span>
			<span class="text_inner text02"><span id="A21107_mv1_other_per"></span>%</span>
			<span class="icon_direct auto" id="A21107_mv1_auto_yn"></span>
		</div>
		
		<div class="vv-016k No1 off" id="mv2_class">
			<a href="javascript:openLayerPop('#layerPop_type11','A21107','mv2');" class="power" id="A21107_mv2">닫힘</a>
			<strong class="name">MV2</strong>
			<span class="icon_direct auto" id="A21107_mv2_auto_yn"></span>
		</div>
		
		<div class="vv-016k left No2 off" id="mv3_class">
			<a href="javascript:openLayerPop('#layerPop_type11','A21107','mv3');" class="power" id="A21107_mv3">닫힘</a>
			<strong class="name">MV3</strong>
			<span class="icon_direct auto" id="A21107_mv3_auto_yn"></span>
		</div>
		
		<div class="vv-016k left No3 off" id="mv4_class">
			<a href="javascript:openLayerPop('#layerPop_type11','A21107','mv4');" class="power" id="A21107_mv4">닫힘</a>
			<strong class="name">MV4</strong>
			<span class="icon_direct auto" id="A21107_mv4_auto_yn"></span>
		</div>
		
		<div class="vv-016k No4 off" id="mv5_class">
			<a href="javascript:openLayerPop('#layerPop_type11','A21107','mv5');" class="power" id="A21107_mv5">닫힘</a>
			<strong class="name">MV5</strong>
			<span class="icon_direct auto" id="A21107_mv5_auto_yn"></span>
		</div>
		
		<div class="heat_storaging_tank">
			<span class="bg" style="height:50%;"></span>
			<strong class="text"><span id="A21107_storagetank_heatstorage"></span>%</strong>
			<strong class="text2 up" id="A21107_storagetank_charge_state">축냉시</strong>
			<strong class="text2 down" id="A21107_storagetank_release_state">방냉시</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1">
				<a href="javascript:openLayerPop('#layerPop_type7','A21107','fridge1');" class="power no1" id="A21107_fridge1">가동</a>
				<span class="icon_direct no1 auto" id="A21107_fridge1_auto_yn"></span>
				<span class="text no1 font_yellow"><span id="A21107_fridge1_compressor_volt"></span> A</span>
				
				<a href="javascript:openLayerPop('#layerPop_type7','A21107','fridge2');" class="power no2" id="A21107_fridge2">가동</a>
				<span class="icon_direct no2 auto" id="A21107_fridge2_auto_yn"></span>
				<span class="text no2 font_yellow"><span id="A21107_fridge2_compressor_volt"></span> A</span>
			</div>
			<strong class="text_info"><a href="javascript:openLayerPop('#layerPop_type12','A21107','fridge_direct');" style="color:#fff;" class="power no3 setPop" id="A21107_fridge_direct"> 냉동기</a></strong>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no1 font_yellow"><span id="A21107_brinepump_inv_frequency"></span> Hz</strong>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type13','A21107','brinepump_main');">
				<span class="fan" id="A21107_brinepump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A21107_brinepump_main_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','A21107','brinepump_pre');">
				<span class="fan" id="A21107_brinepump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A21107_brinepump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no2">브라인 펌프</strong>
		</div>
	</div>
	
	<div class="glycol">
		<div class="hx_plate_v"></div>
		
		<span class="pipe_glycol_ud down pipe001" name="A21107_pipe13"><em></em></span>
		<span class="pipe_glycol_ud up pipe002" name="A21107_pipe13"><em></em></span>
		
		<span class="pipe_glycol_lr left pipe001" name="A21107_pipe13"><em></em></span>
		<span class="pipe_glycol_lr right pipe002" name="A21107_pipe13"><em></em></span>
		<span class="pipe_glycol_lr left pipe003" name="A21107_pipe13"></span>
		<span class="pipe_glycol_lr right pipe004" name="A21107_pipe13"></span>
		
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="A21107_coolwater_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="A21107_coolwater_out_temp"></span> ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump no1" href="javascript:openLayerPop('#layerPop_type1','A21107','coolwaterpump_main');">
				<span class="fan" id="A21107_coolwaterpump_main"></span>
				<span class="icon_direct auto" id="A21107_coolwaterpump_main_auto_yn"></span>
			</a>
			<strong class="text_info">냉수 펌프</strong>
		</div>
		
		<div class="header No1">공<br />급<br />헤<br />더<em></em></div>
		<div class="header No2">환<br />수<br />헤<br />더<em></em></div>
	</div>
	
</div>
	
