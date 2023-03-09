<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	// 삭제하지 마세요!
	function checkDoublePipe() {
		var pipe9 = $("input[class='D80801_pipe9']").val();
		var pipe36 = $("input[class='D80801_pipe36']").val();
		if(pipe9=='1') {
			$("[name='doubleTag']").removeClass("down");
			$("[name='doubleTag']").addClass("up");
			$("[name='doubleTag']").addClass("on");
		} else if (pipe36=='1') {
			$("[name='doubleTag']").removeClass("up");
			$("[name='doubleTag']").addClass("down");
			$("[name='doubleTag']").addClass("on");
		} else {
			$("[name='doubleTag']").removeClass("on");
		}
	}
	
	// 트랜드 메뉴로 이동
	function goFridge() {
		location.href = "/ems/system/roomtempFridge.do";
	}
</script>

<div class="blockDiagram_area typeA">
	<div class="hw" style="display: ;">
		
		<span class="pipe_hw_ud up pipe001" name="D80801_pipe1"></span>
		<span class="pipe_hw_ud up pipe002" name="D80801_pipe2"></span>
		<span class="pipe_hw_ud up pipe003" name="D80801_pipe3"></span>
		<span class="pipe_hw_ud up pipe004" name="D80801_pipe4"></span>
		<span class="pipe_hw_ud down pipe005" name="D80801_pipe4"></span>
		<span class="pipe_hw_ud down pipe006" name="D80801_pipe3"></span>
		<span class="pipe_hw_ud down pipe007" name="D80801_pipe2"></span>
		<span class="pipe_hw_ud down pipe008" name="D80801_pipe1"></span>
		<span class="pipe_hw_ud down pipe009" name="D80801_pipe4"></span>
		<span class="pipe_hw_ud down pipe010" name="D80801_pipe3"></span>
		<span class="pipe_hw_ud down pipe011" name="D80801_pipe2"></span>
		<span class="pipe_hw_ud down pipe012" name="D80801_pipe1"></span>
		<span class="pipe_hw_ud down pipe013" name="D80801_pipe4"></span>
		<span class="pipe_hw_ud down pipe014" name="D80801_pipe3"></span>
		<span class="pipe_hw_ud down pipe015" name="D80801_pipe2"></span>
		
		
		<span class="pipe_hw_lr right pipe001" name="D80801_pipe1"></span>
		<span class="pipe_hw_lr right pipe002" name="D80801_pipe2"></span>
		<span class="pipe_hw_lr right pipe003" name="D80801_pipe3"></span>
		<span class="pipe_hw_lr right pipe004" name="D80801_pipe4"></span>
		<span class="pipe_hw_lr right pipe005" name="D80801_pipe2"></span>
		<span class="pipe_hw_lr right pipe006" name="D80801_pipe3"></span>
		<span class="pipe_hw_lr right pipe007" name="D80801_pipe4"></span>
		<span class="pipe_hw_lr right pipe008" name="D80801_pipe4"></span>
		<span class="pipe_hw_lr right pipe009" name="D80801_pipe3"></span>
		<span class="pipe_hw_lr right pipe010" name="D80801_pipe2"></span>
		<span class="pipe_hw_lr right pipe011" name="D80801_pipe1"></span>
		
		<span class="pipe_hw_corner_ur corner001"></span>
		<span class="pipe_hw_corner_ur corner002"></span>
		<span class="pipe_hw_corner_ur corner003"></span>
		<span class="pipe_hw_corner_ur corner004"></span>
		
		<span class="pipe_hw_corner_ul corner001"></span>
		<span class="pipe_hw_corner_ul corner002"></span>
		<span class="pipe_hw_corner_ul corner003"></span>
		<span class="pipe_hw_corner_ul corner004"></span>
		<span class="pipe_hw_corner_ul corner005"></span>
		<span class="pipe_hw_corner_ul corner006"></span>
		<span class="pipe_hw_corner_ul corner007"></span>
		
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_corner_dr corner003"></span>
		<span class="pipe_hw_corner_dr corner004"></span>
		<span class="pipe_hw_corner_dr corner005"></span>
		<span class="pipe_hw_corner_dr corner006"></span>
		<span class="pipe_hw_corner_dr corner007"></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		<span class="pipe_hw_corner_dl corner002"></span>
		<span class="pipe_hw_corner_dl corner003"></span>
		<span class="pipe_hw_corner_dl corner004"></span>
		
		<span class="sensor_u_temperature sensor001"><em><span id="D80801_fridge1_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="D80801_fridge1_cool_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em><span id="D80801_fridge2_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em><span id="D80801_fridge2_cool_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em><span id="D80801_fridge3_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em><span id="D80801_fridge3_cool_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor007"><em><span id="D80801_fridge4_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor008"><em><span id="D80801_fridge4_cool_in_temp"></span> ℃</em></span>
		
		<div class="coolingtower duo No1">
			<div class="duo_inner">
				<span class="text">1-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower1_1');" class="power off" id="D80801_cooltower1_1">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="D80801_cooltower1_1_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner">
				<span class="text">1-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower1_2');" class="power off" id="D80801_cooltower1_2">정지</a>
				<span class="icon_direct auto" id="D80801_cooltower1_2_auto_yn"></span>
			</div>
		</div>
		
		<div class="coolingtower duo No2">
			<div class="duo_inner">
				<span class="text">2-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower2_1');" class="power off" id="D80801_cooltower2_1">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="D80801_cooltower2_1_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner">
				<span class="text">2-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower2_2');" class="power off" id="D80801_cooltower2_2">정지</a>
				<span class="icon_direct auto" id="D80801_cooltower2_2_auto_yn"></span>
			</div>
		</div>
		
		<div class="coolingtower duo No3">
			<div class="duo_inner">
				<span class="text">3-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower3_1');" class="power off" id="D80801_cooltower3_1">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="D80801_cooltower3_1_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner">
				<span class="text">3-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower3_2');" class="power off" id="D80801_cooltower3_2">정지</a>
				<span class="icon_direct auto" id="D80801_cooltower3_2_auto_yn"></span>
			</div>
		</div>
		
		<div class="coolingtower duo No4">
			<div class="duo_inner">
				<span class="text">4-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower4_1');" class="power off" id="D80801_cooltower4_1">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="D80801_cooltower4_1_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner">
				<span class="text">4-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','D80801','cooltower4_2');" class="power off" id="D80801_cooltower4_2">정지</a>
				<span class="icon_direct auto" id="D80801_cooltower4_2_auto_yn"></span>
			</div>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="javascript:openLayerPop('#layerPop_type1','D80801','coolpump1');">
				<span class="fan off" id="D80801_coolpump1"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="D80801_coolpump1_auto_yn"></span>
				<span class="icon_transmit" id="D80801_coolpump1_start" style="display:none;"></span>
			</a>
			<a class="coolpump ud No2" href="javascript:openLayerPop('#layerPop_type1','D80801','coolpump2');">
				<span class="fan off" id="D80801_coolpump2"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="D80801_coolpump2_auto_yn"></span>
				<span class="icon_transmit" id="D80801_coolpump2_start" style="display:none;"></span>
			</a>
			<a class="coolpump ud No3" href="javascript:openLayerPop('#layerPop_type1','D80801','coolpump3');">
				<span class="fan off" id="D80801_coolpump3"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct auto" id="D80801_coolpump3_auto_yn"></span>
				<span class="icon_transmit" id="D80801_coolpump3_start" style="display:none;"></span>
			</a>
			<a class="coolpump ud No4" href="javascript:openLayerPop('#layerPop_type1','D80801','coolpump4');">
				<span class="fan off" id="D80801_coolpump4"></span>
				<strong class="name">#4</strong>
				<span class="icon_direct auto" id="D80801_coolpump4_auto_yn"></span>
				<span class="icon_transmit" id="D80801_coolpump4_start" style="display:none;"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
		</div>
	</div>
	
	<div class="chw">

		<span class="pipe_chw_ud down pipe001 on" name="D80801_pipe5"></span>
		<span class="pipe_chw_ud down pipe002 on" name="D80801_pipe6"></span>
		<span class="pipe_chw_ud down pipe003 on" name="D80801_pipe7"></span>
		<span class="pipe_chw_ud down pipe004 on" name="D80801_pipe8"></span>
		<span class="pipe_chw_ud up pipe005" name="doubleTag"></span><!-- 테그네임이 2개임 <span class="pipe_chw_ud up pipe005 on" name="D80801_pipe9"></span> -->
		<span class="pipe_chw_ud up pipe006 on" name="D80801_pipe10"></span>
		<span class="pipe_chw_ud up pipe007 on" name="D80801_pipe11"></span>
		<span class="pipe_chw_ud up pipe008 on" name="D80801_pipe12"></span>
		
		<span class="pipe_chw_lr left pipe001 on" name="D80801_pipe5"></span>
		<span class="pipe_chw_lr left pipe002 on" name="D80801_pipe13"></span>
		<span class="pipe_chw_lr left pipe003 on" name="D80801_pipe14"></span>
		<span class="pipe_chw_lr left pipe004 on" name="D80801_pipe15"></span>
		<span class="pipe_chw_lr right pipe005 on" name="D80801_pipe8"></span>
		<span class="pipe_chw_lr right pipe006 on" name="D80801_pipe16"></span>
		<span class="pipe_chw_lr left pipe007 on" name="D80801_pipe35"></span>
		<span class="pipe_chw_lr left pipe008 on" name="D80801_pipe16"></span>
		<span class="pipe_chw_lr left pipe009 on" name="D80801_pipe17"></span>
		<span class="pipe_chw_lr right pipe010 on" name="D80801_pipe18"></span>
		<span class="pipe_chw_lr right pipe011 on" name="D80801_pipe17"></span>
		<span class="pipe_chw_lr left pipe012 on" name="D80801_pipe19"></span>
		<span class="pipe_chw_lr right pipe013 on" name="D80801_pipe20"></span>
		<span class="pipe_chw_lr right pipe014 on" name="D80801_pipe19"></span>
		<span class="pipe_chw_lr left pipe015 on" name="D80801_pipe21"></span>
		<span class="pipe_chw_lr right pipe016 on" name="D80801_pipe22"></span>
		<span class="pipe_chw_lr right pipe017 on" name="D80801_pipe21"></span>
		<span class="pipe_chw_lr right pipe018 on" name="D80801_pipe12"></span>
		
		<span class="pipe_chw_ud up pipe009 on" name="D80801_pipe23"></span>
		<span class="pipe_chw_ud up pipe010 on" name="D80801_pipe21"></span>
		
		<span class="pipe_chw_corner_ur corner001"></span>
		
		<span class="pipe_chw_corner_dr corner001"></span>
		<span class="pipe_chw_corner_dr corner002"></span>
		
		<span class="pipe_chw_corner_dl corner001"></span>
		
		<span class="pipe_chw_t_udr corner001"></span>
		<span class="pipe_chw_t_udr corner002"></span>
		<span class="pipe_chw_t_udr corner003"></span>
		<span class="pipe_chw_t_udr corner004"></span>
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_t_lrd corner001"></span>
		<span class="pipe_chw_t_lrd corner002"></span>
		<span class="pipe_chw_t_lrd corner003"></span>
		<span class="pipe_chw_t_x corner001"></span>
		<span class="pipe_chw_t_x corner002"></span>
		
		<div class="header2 No1"></div>
		<div class="header2 No2"></div>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="D80801_fridge1_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="D80801_fridge1_storagetank_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky"><span id="D80801_fridge2_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor004"><em class="font_sky"><span id="D80801_fridge2_storagetank_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor005"><em class="font_sky"><span id="D80801_fridge3_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor006"><em class="font_sky"><span id="D80801_fridge3_storagetank_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor007"><em class="font_sky"><span id="D80801_fridge4_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor008"><em class="font_sky"><span id="D80801_fridge4_storagetank_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor009"><em class="font_sky"><span id="D80801_fridge_merge_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor010"><em class="font_sky"><span id="D80801_hex_merge_icestorage_in_temp"></span> ℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky"><span id="D80801_storagetank_high_temp"></span> ℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky"><span id="D80801_storagetank_low_temp"></span> ℃</em></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_sky"><span id="D80801_fridge_merge_storagetank_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_sky"><span id="D80801_hex_merge_icestorage_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em class="font_sky"><span id="D80801_hex1_icestorage_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_sky"><span id="D80801_hex1_icestorage_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em class="font_sky"><span id="D80801_hex2_icestorage_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em class="font_sky"><span id="D80801_hex2_icestorage_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor007"><em class="font_sky"><span id="D80801_hex3_icestorage_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor008"><em class="font_sky"><span id="D80801_hex3_icestorage_in_temp"></span> ℃</em></span>
		
		<div class="symbol No1"><em class="box_none"><span id="D80801_storagetank_inspect_flux"></span> ㎡/h</em></div>
		<div class="symbol No2"><em class="box_none"><span id="D80801_icestorage_inspect_flux"></span> ㎡/h</em></div>
		
		<a class="btn" href="javascript:openLayerPop('#layerPop_type2','D80801','mv3a');" >
			<div class="vlave51_d No1">
				<span class="text"><span id="D80801_mv3a_per"></span>%</span>
				<span class="icon_direct auto" id="D80801_mv3a_auto_yn"></span>
			</div>
		</a>
		<a class="btn" href="javascript:openLayerPop('#layerPop_type2','D80801','mv3b');" >
			<div class="vlave51_d No2">
				<span class="text"><span id="D80801_mv3b_per"></span>%</span>
				<span class="icon_direct auto" id="D80801_mv3b_auto_yn"></span>
			</div>
		</a>
		<a class="btn" href="javascript:openLayerPop('#layerPop_type2','D80801','mv3c');" >
			<div class="vlave51_d No3">
				<span class="text"><span id="D80801_mv3c_per"></span>%</span>
				<span class="icon_direct auto" id="D80801_mv3c_auto_yn"></span>
			</div>
		</a>
		<a class="btn" href="javascript:openLayerPop('#layerPop_type2','D80801','mv3d');" >
			<div class="vlave51_d No4">
				<span class="text"><span id="D80801_mv3d_per"></span>%</span>
				<span class="icon_direct auto" id="D80801_mv3d_auto_yn"></span>
			</div>
		</a>
		<div class="vv-016k No1 off" id="mv1_class">
			<a href="javascript:openLayerPop('#layerPop_type11','D80801','mv1');" class="power" id="D80801_mv1">닫힘</a>
			<strong class="name">MV1</strong>
			<span class="icon_direct auto" id="D80801_mv1_auto_yn"></span>
		</div>
		<div class="vv-016k bottom No2 off" id="mv4a_class">
			<a href="javascript:openLayerPop('#layerPop_type11','D80801','mv4a');" class="power" id="D80801_mv4a">닫힘</a>
			<strong class="name">MV4A</strong>
			<span class="icon_direct auto" id="D80801_mv4a_auto_yn"></span>
		</div>
		<div class="vv-016k bottom No3 off" id="mv4b_class">
			<a href="javascript:openLayerPop('#layerPop_type11','D80801','mv4b');" class="power" id="D80801_mv4b">닫힘</a>
			<strong class="name">MV4B</strong>
			<span class="icon_direct auto" id="D80801_mv4b_auto_yn"></span>
		</div>
		<div class="vv-016k bottom No4 off" id="mv4c_class">
			<a href="javascript:openLayerPop('#layerPop_type11','D80801','mv4c');" class="power" id="D80801_mv4c">닫힘</a>
			<strong class="name">MV4C</strong>
			<span class="icon_direct auto" id="D80801_mv4c_auto_yn"></span>
		</div>
		
		<div class="heat_storaging_tank">
			<span class="bg" style="height:50%;"></span>
			<strong class="text"><span id="D80801_storagetank_heatstorage"></span>%</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal no1">
				<strong class="name">#1</strong>
				<a href="javascript:openLayerPop('#layerPop_type7','D80801','fridge1');" class="power no1 off" id="D80801_fridge1">정지</a>
				<span class="icon_direct auto" id="D80801_fridge1_auto_yn"></span>
			</div>
			<div class="centrifugal no2">
				<strong class="name">#2</strong>
				<a href="javascript:openLayerPop('#layerPop_type7','D80801','fridge2');" class="power no1 off" id="D80801_fridge2">정지</a>
				<span class="icon_direct auto" id="D80801_fridge2_auto_yn"></span>
			</div>
			<div class="centrifugal no3">
				<strong class="name">#3</strong>
				<a href="javascript:openLayerPop('#layerPop_type7','D80801','fridge3');" class="power no1 off" id="D80801_fridge3">정지</a>
				<span class="icon_direct auto" id="D80801_fridge3_auto_yn"></span>
			</div>
			<div class="centrifugal no4">
				<strong class="name">#4</strong>
				<a href="javascript:openLayerPop('#layerPop_type7','D80801','fridge4');" class="power no1 off" id="D80801_fridge4">정지</a>
				<span class="icon_direct auto" id="D80801_fridge4_auto_yn"></span>
			</div>
			<a href="javascript:openLayerPop('#layerPop_type16','D80801','fridge_direct');" style="color:#fff;"><strong class="text_info setPop"> 냉동기</strong></a>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','D80801','storagetankpump1');">
				<strong class="name">#1</strong>
				<span class="fan off" id="D80801_storagetankpump1"></span>
				<span class="icon_direct auto" id="D80801_storagetankpump1_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','D80801','storagetankpump2');">
				<strong class="name">#2</strong>
				<span class="fan off" id="D80801_storagetankpump2"></span>
				<span class="icon_direct auto" id="D80801_storagetankpump2_auto_yn"></span>
			</a>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','D80801','storagetankpump3');">
				<strong class="name">#3</strong>
				<span class="fan off" id="D80801_storagetankpump3"></span>
				<span class="icon_direct auto" id="D80801_storagetankpump3_auto_yn"></span>
			</a>
			<a class="coolpump No4" href="javascript:openLayerPop('#layerPop_type1','D80801','storagetankpump4');">
				<strong class="name">#4</strong>
				<span class="fan off" id="D80801_storagetankpump4"></span>
				<span class="icon_direct auto" id="D80801_storagetankpump4_auto_yn"></span>
			</a>
			<strong class="text_info">축냉 펌프</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No5" href="javascript:openLayerPop('#layerPop_type13','D80801','icestoragepump1');">
				<strong class="name">#1</strong>
				<span class="text_info font_yellow"><span id="D80801_icestoragepump1_inv_frequency"></span> Hz</span>
				<span class="fan off" id="D80801_icestoragepump1"></span>
				<span class="icon_direct auto" id="D80801_icestoragepump1_auto_yn"></span>
			</a>
			<a class="coolpump No6" href="javascript:openLayerPop('#layerPop_type13','D80801','icestoragepump2');">
				<strong class="name">#2</strong>
				<span class="text_info font_yellow"><span id="D80801_icestoragepump2_inv_frequency"></span> Hz</span>
				<span class="fan off" id="D80801_icestoragepump2"></span>
				<span class="icon_direct auto" id="D80801_icestoragepump2_auto_yn"></span>
			</a>
			<a class="coolpump No7" href="javascript:openLayerPop('#layerPop_type13','D80801','icestoragepump3');">
				<strong class="name">#3</strong>
				<span class="text_info font_yellow"><span id="D80801_icestoragepump3_inv_frequency"></span> Hz</span>
				<span class="fan off" id="D80801_icestoragepump3"></span>
				<span class="icon_direct auto" id="D80801_icestoragepump3_auto_yn"></span>
			</a>
			<a class="coolpump No8" href="javascript:openLayerPop('#layerPop_type13','D80801','icestoragepump4');">
				<strong class="name">#4</strong>
				<span class="text_info font_yellow"><span id="D80801_icestoragepump4_inv_frequency"></span> Hz</span>
				<span class="fan off" id="D80801_icestoragepump4"></span>
				<span class="icon_direct auto" id="D80801_icestoragepump4_auto_yn"></span>
			</a>
			<strong class="text_info no2">방냉 펌프</strong>
		</div>
	</div>
	
	<div class="glycol">
		<div class="hx_plate_v No1">
			<strong class="name">#1</strong>
		</div>
		<div class="hx_plate_v No2">
			<strong class="name">#2</strong>
		</div>
		<div class="hx_plate_v No3">
			<strong class="name">#3</strong>
		</div>
		
		<span class="pipe_glycol_ud up pipe001 on" name="D80801_pipe24"></span>
		<span class="pipe_glycol_ud up pipe002 on" name="D80801_pipe25"></span>
		<span class="pipe_glycol_ud up pipe003 on" name="D80801_pipe26"></span>
		
		<span class="pipe_glycol_lr left pipe001 on" name="D80801_pipe27"></span>
		<span class="pipe_glycol_lr left pipe002 on" name="D80801_pipe28"></span>
		<span class="pipe_glycol_lr left pipe003 on" name="D80801_pipe29"></span>
		<span class="pipe_glycol_lr left pipe004 on" name="D80801_pipe30"></span>
		<span class="pipe_glycol_lr left pipe005 on" name="D80801_pipe31"></span>
		<span class="pipe_glycol_lr left pipe006 on" name="D80801_pipe32"></span>
		<span class="pipe_glycol_lr left pipe007 on" name="D80801_pipe33"></span>
		<span class="pipe_glycol_lr left pipe008 on" name="D80801_pipe34"></span>
		<span class="pipe_glycol_lr left pipe009 on" name="D80801_pipe26"></span>
		<span class="pipe_glycol_lr left pipe010 on" name="D80801_pipe25"></span>
		<span class="pipe_glycol_lr left pipe011 on" name="D80801_pipe24"></span>
		<span class="pipe_glycol_lr left pipe012 on" name="D80801_pipe24"><em></em></span>
		<span class="pipe_glycol_lr right pipe013 on" name="D80801_pipe24"></span>
		<span class="pipe_glycol_lr left pipe014 on" name="D80801_pipe25"><em></em></span>
		<span class="pipe_glycol_lr right pipe015 on" name="D80801_pipe25"></span>
		<span class="pipe_glycol_lr left pipe016 on" name="D80801_pipe26"><em></em></span>
		<span class="pipe_glycol_lr right pipe017 on" name="D80801_pipe26"></span>
		
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_ul corner003"></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		<span class="pipe_glycol_corner_dl corner003"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="D80801_hex1_coolwater_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_yellow"><span id="D80801_hex1_coolwater_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em class="font_yellow"><span id="D80801_hex2_coolwater_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_yellow"><span id="D80801_hex2_coolwater_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em class="font_yellow"><span id="D80801_hex3_coolwater_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em class="font_yellow"><span id="D80801_hex3_coolwater_out_temp"></span> ℃</em></span>
		
		<div class="vv-016k No3 off" id="mv2c_class">
			<a href="javascript:openLayerPop('#layerPop_type11','D80801','mv2c');" class="power" id="D80801_mv2c">닫힘</a>
			<strong class="name">MV2C</strong>
			<span class="icon_direct auto" id="D80801_mv2c_auto_yn"></span>
		</div>
		<div class="vv-016k No2 off" id="mv2b_class">
			<a href="javascript:openLayerPop('#layerPop_type11','D80801','mv2b');" class="power" id="D80801_mv2b">닫힘</a>
			<strong class="name">MV2B</strong>
			<span class="icon_direct auto" id="D80801_mv2b_auto_yn"></span>
		</div>
		<div class="vv-016k No1 off" id="mv2a_class">
			<a href="javascript:openLayerPop('#layerPop_type11','D80801','mv2a');" class="power" id="D80801_mv2a">닫힘</a>
			<strong class="name">MV2A</strong>
			<span class="icon_direct auto" id="D80801_mv2a_auto_yn"></span>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpump1_store');">
				<span class="fan off" id="D80801_coolwaterpump1_store"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpump1_store_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpump2_store');">
				<span class="fan off" id="D80801_coolwaterpump2_store"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpump2_store_auto_yn"></span>
			</a>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpump3_store');">
				<span class="fan off" id="D80801_coolwaterpump3_store"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpump3_store_auto_yn"></span>
			</a>
			<a class="coolpump No4" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpumpsb_store');">
				<span class="fan off" id="D80801_coolwaterpumpsb_store"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpumpsb_store_store_auto_yn"></span>
			</a>
			<a class="coolpump No5" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpump1_terminal');">
				<span class="fan off" id="D80801_coolwaterpump1_terminal"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpump1_terminal_auto_yn"></span>
			</a>
			<a class="coolpump No6" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpump2_terminal');">
				<span class="fan off" id="D80801_coolwaterpump2_terminal"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpump2_terminal_auto_yn"></span>
			</a>
			<a class="coolpump No7" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpump3_terminal');">
				<span class="fan off" id="D80801_coolwaterpump3_terminal"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpump3_terminal_auto_yn"></span>
			</a>
			<a class="coolpump No8" href="javascript:openLayerPop('#layerPop_type1','D80801','coolwaterpumpsb_terminal');">
				<span class="fan off" id="D80801_coolwaterpumpsb_terminal"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct auto" id="D80801_coolwaterpumpsb_terminal_auto_yn"></span>
			</a>
			<strong class="text_info">냉수 펌프</strong>
		</div>
		
		<div class="header_long No1">
			<em class="header_u"></em>
			<a style="color:#fff;" href="javascript:openLayerPop('#layerPop_type4','D80801','store1');" id="D80801_store1_select" class="text no1"><span>백화점#1</span></a>
			<a style="color:#fff;" href="javascript:openLayerPop('#layerPop_type4','D80801','store2');" id="D80801_store2_select" class="text no2"><span>백화점#2</span></a>
			<a style="color:#fff;" href="javascript:openLayerPop('#layerPop_type4','D80801','store3');" id="D80801_store3_select" class="text no3"><span>백화점#3</span></a>
			<em class="header_d"></em>
		</div>
		<div class="header_long No2">
			<em class="header_u"></em>
			<a style="color:#fff;" href="javascript:openLayerPop('#layerPop_type4','D80801','terminal1');" id="D80801_terminal1_select" class="text no1"><span>터미널#1</span></a>
			<a style="color:#fff;" href="javascript:openLayerPop('#layerPop_type4','D80801','terminal2');" id="D80801_terminal2_select" class="text no2"><span>터미널#2</span></a>
			<a style="color:#fff;" href="javascript:openLayerPop('#layerPop_type4','D80801','terminal3');" id="D80801_terminal3_select" class="text no3"><span>터미널#3</span></a>
			<em class="header_d"></em>
		</div>
		<div class="header_long No3">
			<em class="header_u"></em>
			<em class="header_d"></em>
		</div>
	</div>
	
	<div class="header_lamp">
		<dl>
			<dt><a href="javascript:goFridge();" style="color: #FFFFFF;" >상온 흡수식 냉동기</a></dt>
			<dd><span class="lamp off" id="D80801_cold_absorption_fridge_run_yn"></span><span id="D80801_cold_absorption_fridge_run_yn_text">정지중</span></dd>
		</dl>
		<dl>
			<dt><a href="javascript:goFridge();" style="color: #FFFFFF;" >상온 터보 냉동기</a></dt>
			<dd><span class="lamp off" id="D80801_cold_turbo_fridge_run_yn"></span><span id="D80801_cold_turbo_fridge_run_yn_text">정지중</span></dd>
		</dl>
	</div>
	
	<div class="footer_info">
		<p>냉수기준온도 <strong class="font_yellow"><span id="D80801_inv_control_coolwater_out_temp"></span> ℃</strong></p>
		<p>냉수설정온도 <a href="javascript:openLayerPop('#layerPop_type3','D80801','coolwater1_out_temp');" class="font_purple setPop"><strong class="font_purple font16"><span id="D80801_coolwater1_out_temp"></span> ℃</strong></a></p>
		</dl>
	</div>
	
</div>