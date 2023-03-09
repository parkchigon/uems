<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	// 삭제하지 마세요!
	function checkDoublePipe() {
	}
	
</script>

<div class="blockDiagram_area typeH">

	<div class="hw">
		<span class="pipe_hw_ud down pipe001" name="C64402_pipe9"></span>
		<span class="pipe_hw_ud down pipe002" name="C64402_pipe8"></span>
		<span class="pipe_hw_ud down pipe003" name="C64402_pipe7"></span>
		<span class="pipe_hw_ud up pipe004" name="C64402_pipe9"></span>
		<span class="pipe_hw_ud up pipe005" name="C64402_pipe8"></span>
		<span class="pipe_hw_ud up pipe006" name="C64402_pipe7"></span>
		<span class="pipe_hw_ud down pipe007" name="C64402_pipe7"></span>
		<span class="pipe_hw_ud down pipe008" name="C64402_pipe8"></span>
		<span class="pipe_hw_ud up pipe009" name="C64402_pipe4"></span>
		<span class="pipe_hw_ud up pipe010" name="C64402_pipe6"></span>
		<span class="pipe_hw_ud up pipe011" name="C64402_pipe5"></span>
		<span class="pipe_hw_ud down pipe012" name="C64402_pipe4"></span>
		<span class="pipe_hw_ud down pipe013" name="C64402_pipe6"></span>
		<span class="pipe_hw_ud down pipe014" name="C64402_pipe5"></span>
		<span class="pipe_hw_ud down pipe017" name="C64402_pipe7"></span>
		<span class="pipe_hw_ud down pipe018" name="C64402_pipe8"></span>
		<span class="pipe_hw_ud down pipe019" name="C64402_pipe9"></span>
		
		<span class="pipe_hw_lr right pipe001" name="C64402_pipe9"></span>
		<span class="pipe_hw_lr right pipe002" name="C64402_pipe8"></span>
		<span class="pipe_hw_lr right pipe003" name="C64402_pipe7"></span>
		<span class="pipe_hw_lr right pipe004" name="C64402_pipe9"></span>
		<span class="pipe_hw_lr right pipe005" name="C64402_pipe8"></span>
		<span class="pipe_hw_lr right pipe006" name="C64402_pipe7"></span>
		<span class="pipe_hw_lr right pipe007" name="C64402_pipe4"></span>
		<span class="pipe_hw_lr right pipe008" name="C64402_pipe3"></span>
		<span class="pipe_hw_lr right pipe009" name="C64402_pipe2"></span>
		<span class="pipe_hw_lr right pipe010" name="C64402_pipe1"></span>
		<span class="pipe_hw_lr right pipe011" name="C64402_pipe9"></span>
		<span class="pipe_hw_lr right pipe012" name="C64402_pipe8"></span>
		<span class="pipe_hw_lr right pipe013" name="C64402_pipe7"></span>
		<span class="pipe_hw_lr left pipe014" name="C64402_pipe7"></span>
		<span class="pipe_hw_lr left pipe015" name="C64402_pipe8"></span>
		<span class="pipe_hw_lr left pipe016" name="C64402_pipe9"></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		<span class="pipe_hw_corner_dl corner002"></span>
		<span class="pipe_hw_corner_dl corner003"></span>
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_corner_dr corner003"></span>
		<span class="pipe_hw_corner_dr corner004"></span>
		<span class="pipe_hw_corner_dr corner005"></span>
		<span class="pipe_hw_corner_ul corner001"></span>
		<span class="pipe_hw_corner_ul corner002"></span>
		<span class="pipe_hw_corner_ul corner003"></span>
		<span class="pipe_hw_corner_ul corner004"></span>
		<span class="pipe_hw_corner_ul corner005"></span>
		<span class="pipe_hw_corner_ul corner006"></span>
		<span class="pipe_hw_corner_ul corner007"></span>
		<span class="pipe_hw_corner_ur corner001"></span>
		<span class="pipe_hw_corner_ur corner002"></span>
		<span class="pipe_hw_corner_ur corner003"></span>
		<span class="pipe_hw_corner_ur corner004"></span>
		<span class="pipe_hw_t_x corner001"></span>
		<span class="pipe_hw_t_x corner002"></span>
		<span class="pipe_hw_t_x corner003"></span>
		<span class="pipe_hw_t_x corner004"></span>
		<span class="pipe_hw_t_lru corner001"></span>
		<span class="pipe_hw_t_lru corner002"></span>
		
		<span class="sensor_u_temperature sensor001"><em><span id="C64402_cool1_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="C64402_cool1_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em><span id="C64402_cool2_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em><span id="C64402_cool2_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em><span id="C64402_cool3_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em><span id="C64402_cool3_in_temp"></span> ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump No4" href="javascript:openLayerPop('#layerPop_type1','C64402','coolpumpsb');">
				<span class="fan off" id="C64402_coolpumpsb"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct auto" id="C64402_coolpumpsb_auto_yn"></span>
			</a>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','C64402','coolpump3');">
				<span class="fan off" id="C64402_coolpump3"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct auto" id="C64402_coolpump3_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','C64402','coolpump2');">
				<span class="fan off" id="C64402_coolpump2"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="C64402_coolpump2_auto_yn"></span>
			</a>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','C64402','coolpump1');">
				<span class="fan off" id="C64402_coolpump1"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="C64402_coolpump1_auto_yn"></span>
			</a>
			<strong class="text_info">냉각수펌프</strong>
		</div>
		
		<div class="coolingtower duo No1">
			<div class="duo_inner">
				<span class="text">1-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','C64402','cooltower1_1');" class="power off" id="C64402_cooltower1_1">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="C64402_cooltower1_1_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner">
				<span class="text">1-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','C64402','cooltower1_2');" class="power off" id="C64402_cooltower1_2">정지</a>
				<span class="icon_direct auto" id="C64402_cooltower1_2_auto_yn"></span>
			</div>
		</div>
		<div class="coolingtower duo No2">
			<div class="duo_inner">
				<span class="text">2-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','C64402','cooltower2_1');" class="power off" id="C64402_cooltower2_1">정지</a>
				<span class="icon_direct auto" id="C64402_cooltower2_1_auto_yn"></span>
			</div>
			<div class="duo_inner">
				<span class="text">2-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','C64402','cooltower2_2');" class="power off" id="C64402_cooltower2_2">정지</a>
				<span class="icon_direct auto" id="C64402_cooltower2_2_auto_yn"></span>
			</div>
		</div>
		<div class="coolingtower duo No3">
			<div class="duo_inner">
				<span class="text">3-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','C64402','cooltower3_1');" class="power off" id="C64402_cooltower3_1">정지</a>
				<span class="icon_direct auto" id="C64402_cooltower3_1_auto_yn"></span>
			</div>
			<div class="duo_inner">
				<span class="text">3-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','C64402','cooltower3_2');" class="power off" id="C64402_cooltower3_2">정지</a>
				<span class="icon_direct auto" id="C64402_cooltower3_2_auto_yn"></span>
			</div>
		</div>
	</div>
	
	<div class="chw">
		<span class="pipe_chw_ud down pipe001" name="C64402_pipe17"></span>
		<span class="pipe_chw_ud down pipe002" name="C64402_pipe21"></span>
		<span class="pipe_chw_ud up pipe003" name="C64402_pipe13"></span>
		<span class="pipe_chw_ud up pipe004" name="C64402_pipe14"></span>
		<span class="pipe_chw_ud down pipe005" name="C64402_pipe12"></span>
		<span class="pipe_chw_ud down pipe006" name="C64402_pipe13"></span>
		<span class="pipe_chw_ud down pipe007" name="C64402_pipe15"></span>
		<span class="pipe_chw_ud down pipe008" name="C64402_pipe16"></span>
		<span class="pipe_chw_ud down pipe012" name="C64402_pipe35"></span>
		<span class="pipe_chw_ud down pipe013" name="C64402_pipe20"></span>
		<span class="pipe_chw_ud down pipe014" name="C64402_pipe22"></span>
		
		<span class="pipe_chw_lr left pipe001" name="C64402_pipe17"></span>
		<span class="pipe_chw_lr left pipe002" name="C64402_pipe18"></span>
		<span class="pipe_chw_lr left pipe003" name="C64402_pipe19"></span>
		<span class="pipe_chw_lr right pipe004" name="C64402_pipe21"></span>
		<span class="pipe_chw_lr right pipe005" name="C64402_pipe22"></span>
		<span class="pipe_chw_lr right pipe006" name="C64402_pipe20"></span>
		<span class="pipe_chw_lr right pipe007" name="C64402_pipe13"></span>
		<span class="pipe_chw_lr right pipe008" name="C64402_pipe10"></span>
		<span class="pipe_chw_lr right pipe009" name="C64402_pipe11"></span>
		<span class="pipe_chw_lr right pipe010" name="C64402_pipe12"></span>
		<span class="pipe_chw_lr right pipe011" name="C64402_pipe17"></span>
		<span class="pipe_chw_lr right pipe012" name="C64402_pipe18"></span>
		<span class="pipe_chw_lr right pipe013" name="C64402_pipe19"></span>
		<span class="pipe_chw_lr left pipe014" name="C64402_pipe23"></span>
		<span class="pipe_chw_lr right pipe015" name="C64402_pipe23"></span>
		<span class="pipe_chw_lr left pipe016" name="C64402_pipe24"></span>
		<span class="pipe_chw_lr right pipe017" name="C64402_pipe24"></span>
		<span class="pipe_chw_lr left pipe018" name="C64402_pipe25"></span>
		<span class="pipe_chw_lr right pipe019" name="C64402_pipe25"></span>
		
		<span class="pipe_chw_ud up pipe009" name="C64402_pipe17"></span>
		<span class="pipe_chw_ud up pipe015" name="C64402_pipe36"></span>
		<span class="pipe_chw_ud up pipe016" name="C64402_pipe17"></span>
		<span class="pipe_chw_ud up pipe010" name="C64402_pipe18"></span>
		<span class="pipe_chw_ud up pipe017" name="C64402_pipe37"></span>		
		<span class="pipe_chw_ud up pipe018" name="C64402_pipe18"></span>
		<span class="pipe_chw_ud up pipe011" name="C64402_pipe19"></span>
		<span class="pipe_chw_ud up pipe019" name="C64402_pipe38"></span>
		
		<span class="pipe_chw_corner_ur corner001"></span>
		<span class="pipe_chw_corner_ur corner002"></span>
		
		<span class="pipe_chw_corner_ul corner001"></span>
		<span class="pipe_chw_corner_ul corner002"></span>
		<span class="pipe_chw_corner_ul corner003"></span>
		<span class="pipe_chw_corner_ul corner004"></span>
		<span class="pipe_chw_corner_ul corner005"></span>
		
		<span class="pipe_chw_corner_dr corner001"></span>
		<span class="pipe_chw_corner_dr corner002"></span>
		
		<span class="pipe_chw_corner_dl corner001"></span>
		<span class="pipe_chw_corner_dl corner002"></span>
		
		<span class="pipe_chw_t_x corner001"></span>
		<span class="pipe_chw_t_x corner002"></span>
		<span class="pipe_chw_t_x corner003"></span>
		
		<span class="pipe_chw_t_udr corner001"></span>
		<span class="pipe_chw_t_udr corner002"></span>
		<span class="pipe_chw_t_udr corner003"></span>
		<span class="pipe_chw_t_udr corner004"></span>
		<span class="pipe_chw_t_udr corner005"></span>
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_t_lru corner002"></span>
		<span class="pipe_chw_t_lru corner003"></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="C64402_fridge1_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="C64402_fridge1_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky"><span id="C64402_fridge2_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor004"><em class="font_sky"><span id="C64402_fridge2_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor005"><em class="font_sky"><span id="C64402_fridge3_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor006"><em class="font_sky"><span id="C64402_fridge3_in_temp"></span> ℃</em></span>

		<span class="sensor_l_temperature sensor001"><em class="font_sky"><span id="C64402_storagetank_high_temp"></span> ℃</em></span>
		<span class="sensor_l_temperature sensor002"><em class="font_sky"><span id="C64402_storagetank_low_temp"></span> ℃</em></span>

		<span class="sensor_d_temperature sensor007"><em class="font_sky"><span id="C64402_brinepumpsb_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor008"><em class="font_sky"><span id="C64402_brinepump1_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor009"><em class="font_sky"><span id="C64402_brinepump2_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor010"><em class="font_sky"><span id="C64402_brinepump3_out_temp"></span> ℃</em></span>

		<span class="sensor_u_temperature sensor001"><em class="font_sky"><span id="C64402_brinepump_mix_temp"></span> ℃</em></span>
		<a href="javascript:openLayerPop('#layerPop_type3','C64402','mv2_out_set_temp');" ><strong class="temperature t001"><span id="C64402_mv2_out_set_temp"></span><em class="font_yellow"> ℃</em></strong></a>
		<span class="sensor_u_temperature sensor002"><em class="font_sky"><span id="C64402_heatchange1_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em class="font_sky"><span id="C64402_heatchange2_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_sky"><span id="C64402_heatchange3_in_temp"></span> ℃</em></span>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1">
				<strong class="name">#1</strong>
				<a href="javascript:openLayerPop('#layerPop_type7','C64402','fridge1');" class="power off" id="C64402_fridge1">정지</a>
				<span class="icon_direct auto" id="C64402_fridge1_auto_yn"></span>
			</div>
			<div class="centrifugal No2">
				<strong class="name">#2</strong>
				<a href="javascript:openLayerPop('#layerPop_type7','C64402','fridge2');" class="power off" id="C64402_fridge2">정지</a>
				<span class="icon_direct auto" id="C64402_fridge2_auto_yn"></span>
			</div>
			<div class="centrifugal No3">
				<strong class="name">#3</strong>
				<a href="javascript:openLayerPop('#layerPop_type7','C64402','fridge3');" class="power off" id="C64402_fridge3">정지</a>
				<span class="icon_direct auto" id="C64402_fridge3_auto_yn"></span>
			</div>
			<a href="javascript:openLayerPop('#layerPop_type5','C64402','fridge_direct');" style="color:#fff;"><strong class="text_info setPop"> 냉동기</strong></a>
		</div>
		
		<div class="avg_temperature_area">
			평균온도
			<span class="text_info font_sky"><span id="C64402_brinepump_avg_temp"></span> ℃</span>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No4" href="javascript:openLayerPop('#layerPop_type1','C64402','brinepumpsb');">
				<span class="fan off" id="C64402_brinepumpsb"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct auto" id="C64402_brinepumpsb_auto_yn"></span>
			</a>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','C64402','brinepump1');">
				<span class="fan off" id="C64402_brinepump1"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="C64402_brinepump1_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','C64402','brinepump2');">
				<span class="fan off" id="C64402_brinepump2"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="C64402_brinepump2_auto_yn"></span>
			</a>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','C64402','brinepump3');">
				<span class="fan off" id="C64402_brinepump3"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct auto" id="C64402_brinepump3_auto_yn"></span>
			</a>
			<strong class="text_info">브라인펌프</strong>
		</div>
		
		<div class="vv-011k No1">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','C64402','mv2');" ></a>
			<strong class="name">MV2</strong>
			<span class="text_inner text01"><span id="C64402_mv2_other_per"></span>%</span>
			<span class="text_inner text02"><span id="C64402_mv2_per"></span>%</span>
			<span class="icon_direct auto" id="C64402_mv2_auto_yn"></span>
		</div>
		<div class="vv-011k No2">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','C64402','mv1a');" ></a>
			<strong class="name">MV1A</strong>
			<span class="text_inner text01"><span id="C64402_mv1a_per"></span>%</span>
			<span class="text_inner text02"><span id="C64402_mv1a_other_per"></span>%</span>
			<span class="icon_direct auto" id="C64402_mv1a_auto_yn"></span>
		</div>
		<div class="vv-011k No3">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','C64402','mv1b');" ></a>
			<strong class="name">MV1B</strong>
			<span class="text_inner text01"><span id="C64402_mv1b_per"></span>%</span>
			<span class="text_inner text02"><span id="C64402_mv1b_other_per"></span>%</span>
			<span class="icon_direct auto" id="C64402_mv1b_auto_yn"></span>
		</div>
		<div class="vv-011k No4">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','C64402','mv1c');" ></a>
			<strong class="name">MV1C</strong>
			<span class="text_inner text01"><span id="C64402_mv1c_per"></span>%</span>
			<span class="text_inner text02"><span id="C64402_mv1c_other_per"></span>%</span>
			<span class="icon_direct auto" id="C64402_mv1c_auto_yn"></span>
		</div>
		
		<div class="heat_storaging_tank"></div>
		
		<div class="vv-016k left No1 off" id="mv3_class">
			<a href="javascript:openLayerPop('#layerPop_type11','C64402','mv3');" class="power" id="C64402_mv3">닫힘</a>
			<strong class="name">MV3</strong>
			<span class="icon_direct auto" id="C64402_mv3_auto_yn"></span>
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
		
		<span class="pipe_glycol_lr left pipe001" name="C64402_pipe34"></span>
		<span class="pipe_glycol_lr left pipe002" name="C64402_pipe33"></span>
		<span class="pipe_glycol_lr left pipe003" name="C64402_pipe32"></span>
		<span class="pipe_glycol_lr right pipe004" name="C64402_pipe34"></span>
		<span class="pipe_glycol_lr right pipe005" name="C64402_pipe28"></span>
		<span class="pipe_glycol_lr right pipe006" name="C64402_pipe34"></span>
		<span class="pipe_glycol_lr right pipe007" name="C64402_pipe33"></span>
		<span class="pipe_glycol_lr right pipe008" name="C64402_pipe27"></span>
		<span class="pipe_glycol_lr right pipe009" name="C64402_pipe33"></span>
		<span class="pipe_glycol_lr right pipe010" name="C64402_pipe32"></span>
		<span class="pipe_glycol_lr right pipe011" name="C64402_pipe26"></span>
		<span class="pipe_glycol_lr right pipe012" name="C64402_pipe32"></span>
		<span class="pipe_glycol_lr right pipe013" name="C64402_pipe29"></span>
		<span class="pipe_glycol_lr left pipe014" name="C64402_pipe32"></span>
		<span class="pipe_glycol_lr right pipe015" name="C64402_pipe32"></span>
		<span class="pipe_glycol_lr left pipe016" name="C64402_pipe33"></span>
		<span class="pipe_glycol_lr right pipe017" name="C64402_pipe33"></span>
		<span class="pipe_glycol_lr left pipe018" name="C64402_pipe34"></span>
		<span class="pipe_glycol_lr right pipe019" name="C64402_pipe34"></span>
		
		<span class="pipe_glycol_ud down pipe001" name="C64402_pipe31"></span>
		<span class="pipe_glycol_ud down pipe002" name="C64402_pipe30"></span>
		<span class="pipe_glycol_ud down pipe003" name="C64402_pipe29"></span>
		<span class="pipe_glycol_ud up pipe004" name="C64402_pipe31"></span>
		<span class="pipe_glycol_ud up pipe005" name="C64402_pipe30"></span>
		<span class="pipe_glycol_ud up pipe006" name="C64402_pipe29"></span>
		<span class="pipe_glycol_ud down pipe007" name="C64402_pipe32"></span>
		<span class="pipe_glycol_ud down pipe008" name="C64402_pipe33"></span>
		<span class="pipe_glycol_ud down pipe009" name="C64402_pipe34"></span>
		<span class="pipe_glycol_ud up pipe010" name="C64402_pipe32"></span>
		<span class="pipe_glycol_ud up pipe011" name="C64402_pipe33"></span>
		<span class="pipe_glycol_ud up pipe012" name="C64402_pipe34"></span>
		
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_ul corner003"></span>
		<span class="pipe_glycol_corner_ul corner004"></span>
		<span class="pipe_glycol_corner_ul corner005"></span>
		<span class="pipe_glycol_corner_ul corner006"></span>
		
		<span class="pipe_glycol_corner_dr corner001"></span>
		
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		<span class="pipe_glycol_corner_dl corner003"></span>
		<span class="pipe_glycol_corner_dl corner004"></span>
		<span class="pipe_glycol_corner_dl corner005"></span>
		<span class="pipe_glycol_corner_dl corner006"></span>
		<span class="pipe_glycol_corner_dl corner007"></span>
		
		<span class="pipe_glycol_t_x corner001"></span>
		<span class="pipe_glycol_t_x corner002"></span>
		<span class="pipe_glycol_t_x corner003"></span>
		<span class="pipe_glycol_t_x corner004"></span>
		
		<span class="pipe_glycol_t_lrd corner001"></span>
		<span class="pipe_glycol_t_lrd corner002"></span>
		
		<div class="symbol No1"><em class="box_none"><span id="C64402_coolwater3_inspect_flux"></span> ㎡/h</em></div>
		<div class="symbol No2"><em class="box_none"><span id="C64402_coolwater2_inspect_flux"></span> ㎡/h</em></div>
		<div class="symbol No3"><em class="box_none"><span id="C64402_coolwater1_inspect_flux"></span> ㎡/h</em></div>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="C64402_coolwater1_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_yellow"><span id="C64402_coolwater1_out_temp"></span> ℃</em></span>
		<a href="javascript:openLayerPop('#layerPop_type3','C64402','coolwater1_out_set');" ><strong class="temperature t002"><span id="C64402_coolwater1_out_set"></span><em class="font_yellow"> ℃</em></strong></a>
		<span class="sensor_u_temperature sensor003"><em class="font_yellow"><span id="C64402_coolwater2_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_yellow"><span id="C64402_coolwater2_out_temp"></span> ℃</em></span>
		<a href="javascript:openLayerPop('#layerPop_type3','C64402','coolwater2_out_set');" ><strong class="temperature t003"><span id="C64402_coolwater2_out_set"></span><em class="font_yellow"> ℃</em></strong></a>
		<span class="sensor_u_temperature sensor005"><em class="font_yellow"><span id="C64402_coolwater3_in_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em class="font_yellow"><span id="C64402_coolwater3_out_temp"></span> ℃</em></span>
		<a href="javascript:openLayerPop('#layerPop_type3','C64402','coolwater3_out_set');" ><strong class="temperature t004"><span id="C64402_coolwater3_out_set"></span><em class="font_yellow"> ℃</em></strong></a>
		
		<div class="coolpump_area">
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','C64402','coolwaterpump3');">
				<span class="fan off" id="C64402_coolwaterpump3"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct auto" id="C64402_coolwaterpump3_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','C64402','coolwaterpump2');">
				<span class="fan off" id="C64402_coolwaterpump2"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="C64402_coolwaterpump2_auto_yn"></span>
			</a>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','C64402','coolwaterpump1');">
				<span class="fan off" id="C64402_coolwaterpump1"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="C64402_coolwaterpump1_auto_yn"></span>
			</a>
			<a class="coolpump No4" href="javascript:openLayerPop('#layerPop_type1','C64402','coolwaterpumpsb');">
				<span class="fan off" id="C64402_coolwaterpumpsb"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct auto" id="C64402_coolwaterpumpsb_auto_yn"></span>
			</a>
			<strong class="text_info">냉수펌프</strong>
		</div>
		
		<div class="header No1">공<br />급<br />헤<br />더<em></em></div>
		<div class="header No2">환<br />수<br />헤<br />더<em></em></div>
	</div>
	
	
	
</div>
