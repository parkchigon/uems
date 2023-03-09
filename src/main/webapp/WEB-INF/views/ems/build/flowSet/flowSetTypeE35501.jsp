<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	});
</script>

<div class="blockDiagram_area typeA" style="height: 850px; width:1212px;">
	
	<div class="hw" style="display: ;">
		
		<span class="pipe_hw_ud up pipe001 on" name="pipe1"></span>
		<span class="pipe_hw_ud up pipe002 on" name="pipe2"></span>
		<span class="pipe_hw_ud up pipe003 on" name="pipe3"></span>
		<span class="pipe_hw_ud up pipe004 on" name="pipe4"></span>
		<span class="pipe_hw_ud down pipe005 on" name="pipe4"></span>
		<span class="pipe_hw_ud down pipe006 on" name="pipe3"></span>
		<span class="pipe_hw_ud down pipe007 on" name="pipe2"></span>
		<span class="pipe_hw_ud down pipe008 on" name="pipe1"></span>
		<span class="pipe_hw_ud down pipe009 on" name="pipe4"></span>
		<span class="pipe_hw_ud down pipe010 on" name="pipe3"></span>
		<span class="pipe_hw_ud down pipe011 on" name="pipe2"></span>
		<span class="pipe_hw_ud down pipe012 on" name="pipe1"></span>
		<span class="pipe_hw_ud down pipe013 on" name="pipe4"></span>
		<span class="pipe_hw_ud down pipe014 on" name="pipe3"></span>
		<span class="pipe_hw_ud down pipe015 on" name="pipe2"></span>
		
		
		<span class="pipe_hw_lr right pipe001 on" name="pipe1"></span>
		<span class="pipe_hw_lr right pipe002 on" name="pipe2"></span>
		<span class="pipe_hw_lr right pipe003 on" name="pipe3"></span>
		<span class="pipe_hw_lr right pipe004 on" name="pipe4"></span>
		<span class="pipe_hw_lr right pipe005 on" name="pipe2"></span>
		<span class="pipe_hw_lr right pipe006 on" name="pipe3"></span>
		<span class="pipe_hw_lr right pipe007 on" name="pipe4"></span>
		<span class="pipe_hw_lr right pipe008 on" name="pipe4"></span>
		<span class="pipe_hw_lr right pipe009 on" name="pipe3"></span>
		<span class="pipe_hw_lr right pipe010 on" name="pipe2"></span>
		<span class="pipe_hw_lr right pipe011 on" name="pipe1"></span>
		
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
		
		<span class="sensor_u_temperature sensor001"><em id="fridge_merge_storagetank_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em id="hex_merge_icestorage_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em id="hex1_icestorage_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em id="hex1_icestorage_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em id="hex2_icestorage_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em id="hex2_icestorage_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor007"><em id="hex3_icestorage_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor008"><em id="hex3_icestorage_in_temp">12345 ℃</em></span>
		
		<div class="coolingtower duo No1">
			<div class="duo_inner" id="cooltower1_1">
				<span class="text">1-1</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a><!-- 모달팝업 -->
				<span class="icon_direct direct"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner" id="cooltower1_2">
				<span class="text">1-2</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a>
				<span class="icon_direct direct"></span>
			</div>
		</div>
		
		<div class="coolingtower duo No2">
			<div class="duo_inner" id="cooltower2_1">
				<span class="text">2-1</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a><!-- 모달팝업 -->
				<span class="icon_direct direct"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner" id="cooltower2_2">
				<span class="text">2-2</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a>
				<span class="icon_direct direct"></span>
			</div>
		</div>
		
		<div class="coolingtower duo No3">
			<div class="duo_inner" id="cooltower3_1">
				<span class="text">3-1</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a><!-- 모달팝업 -->
				<span class="icon_direct direct"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner" id="cooltower3_2">
				<span class="text">3-2</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a>
				<span class="icon_direct direct"></span>
			</div>
		</div>
		
		<div class="coolingtower duo No4">
			<div class="duo_inner" id="cooltower4_1">
				<span class="text">4-1</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a><!-- 모달팝업 -->
				<span class="icon_direct direct"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner" id="cooltower4_2">
				<span class="text">4-2</span>
				<a href="#layerPop_type1" class="power off" name="modal">정지</a>
				<span class="icon_direct direct"></span>
			</div>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="#" id="coolpump1">
				<span class="fan on"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct"></span>
				<span class="icon_transmit"></span>
			</a>
			<a class="coolpump ud No2" href="#" id="coolpump2">
				<span class="fan off"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct"></span>
				<span class="icon_transmit"></span>
			</a>
			<a class="coolpump ud No3" href="#" id="coolpump3">
				<span class="fan off"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct direct"></span>
				<span class="icon_transmit"></span>
			</a>
			<a class="coolpump ud No4" href="#" id="coolpump4">
				<span class="fan off"></span>
				<strong class="name">#4</strong>
				<span class="icon_direct direct"></span>
				<span class="icon_transmit"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
		</div>
	</div>
	
	<div class="chw">
		<div class="header2 No1"></div>
		<div class="header2 No2"></div>
	
		<span class="pipe_chw_ud down pipe001 on" name="pipe5"></span>
		<span class="pipe_chw_ud down pipe002 on" name="pipe6"></span>
		<span class="pipe_chw_ud down pipe003 on" name="pipe7"></span>
		<span class="pipe_chw_ud down pipe004 on" name="pipe8"></span>
		<span class="pipe_chw_ud up pipe005 on" name="pipe9"></span>
		<span class="pipe_chw_ud up pipe006 on" name="pipe10"></span>
		<span class="pipe_chw_ud up pipe007 on" name="pipe11"></span>
		<span class="pipe_chw_ud up pipe008 on" name="pipe12"></span>
		
		<span class="pipe_chw_lr left pipe001 on" name="pipe5"></span>
		<span class="pipe_chw_lr left pipe002 on" name="pipe13"></span>
		<span class="pipe_chw_lr left pipe003 on" name="pipe14"></span>
		<span class="pipe_chw_lr left pipe004 on" name="pipe15"></span>
		<span class="pipe_chw_lr right pipe005 on" name="pipe8"></span>
		<span class="pipe_chw_lr right pipe006 on" name="pipe16"></span>
		<span class="pipe_chw_lr left pipe007 on" name="pipe35"></span>
		<span class="pipe_chw_lr left pipe008 on" name="pipe16"></span>
		<span class="pipe_chw_lr left pipe009 on" name="pipe17"></span>
		<span class="pipe_chw_lr right pipe010 on" name="pipe18"></span>
		<span class="pipe_chw_lr right pipe011 on" name="pipe17"></span>
		<span class="pipe_chw_lr left pipe012 on" name="pipe19"></span>
		<span class="pipe_chw_lr right pipe013 on" name="pipe20"></span>
		<span class="pipe_chw_lr right pipe014 on" name="pipe19"></span>
		<span class="pipe_chw_lr left pipe015 on" name="pipe21"></span>
		<span class="pipe_chw_lr right pipe016 on" name="pipe22"></span>
		<span class="pipe_chw_lr right pipe017 on" name="pipe21"></span>
		
		<span class="pipe_chw_ud up pipe009 on" name="pipe23"></span>
		<span class="pipe_chw_ud up pipe010 on" name="pipe21"></span>
		
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
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky" id="fridge1_storagetank_out_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky" id="fridge1_storagetank_in_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky" id="fridge2_storagetank_out_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor004"><em class="font_sky" id="fridge2_storagetank_in_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor005"><em class="font_sky" id="fridge3_storagetank_out_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor006"><em class="font_sky" id="fridge3_storagetank_in_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor007"><em class="font_sky" id="fridge4_storagetank_out_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor008"><em class="font_sky" id="fridge4_storagetank_in_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor009"><em class="font_sky" id="fridge_merge_storagetank_out_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor010"><em class="font_sky" id="hex_merge_icestorage_in_temp">12345 ℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky" id="storagetank_high_temp">12345 ℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky" id="storagetank_low_temp">12345 ℃</em></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_sky" id="fridge1_cool_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_sky" id="fridge1_cool_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em class="font_sky" id="fridge2_cool_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_sky" id="fridge2_cool_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em class="font_sky" id="fridge3_cool_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em class="font_sky" id="fridge3_cool_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor007"><em class="font_sky" id="fridge4_cool_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor008"><em class="font_sky" id="fridge4_cool_in_temp">12345 ℃</em></span>
		
		<div class="symbol No1" id="storagetank_inspect_flux"><em class="box_none">유량:158 ㎡/h</em></div>
		<div class="symbol No2" id="icestorage_inspect_flux"><em class="box_none">유량:158 ㎡/h</em></div>
		
		<div class="vlave51_d No1" id="mv3a_per">
			<span class="text">55%</span>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vlave51_d No2" id="mv3b_per">
			<span class="text">55%</span>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vlave51_d No3" id="mv3c_per">
			<span class="text">55%</span>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vlave51_d No4" id="mv3d_per">
			<span class="text">55%</span>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="vv-016k No1 off" id="mv1">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV1</strong>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vv-016k bottom No2 off" id="mv4a">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV4A</strong>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vv-016k bottom No3 off" id="mv4b">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV4B</strong>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vv-016k bottom No4 off" id="mv4c">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV4C</strong>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="heat_storaging_tank" id="storagetank_heatstorage">
			<span class="bg" style="height:50%;"></span>
			<strong class="text">50%</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal no1" id="fridge1">
				<strong class="name">#1</strong>
				<a href="#layerPop_type7" class="power no1 on" name="modal">가동</a>
				<span class="icon_direct direct"></span>
			</div>
			<div class="centrifugal no2" id="fridge2">
				<strong class="name">#2</strong>
				<a href="#layerPop_type7" class="power no1 off" name="modal">정지</a>
				<span class="icon_direct direct"></span>
			</div>
			<div class="centrifugal no3" id="fridge3">
				<strong class="name">#3</strong>
				<a href="#layerPop_type7" class="power no1 off" name="modal">정지</a>
				<span class="icon_direct direct"></span>
			</div>
			<div class="centrifugal no4" id="fridge4">
				<strong class="name">#4</strong>
				<a href="#layerPop_type7" class="power no1 off" name="modal">정지</a>
				<span class="icon_direct direct"></span>
			</div>
			<strong class="text_info" id="fridge_text">냉동기</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No1" href="#" id="storagetankpump1">
				<strong class="name">#1</strong>
				<span class="fan on"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No2" href="#" id="storagetankpump2">
				<strong class="name">#2</strong>
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No3" href="#" id="storagetankpump3">
				<strong class="name">#3</strong>
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No4" href="#" id="storagetankpump4">
				<strong class="name">#4</strong>
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<strong class="text_info">축냉 펌프</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No5" href="#" id="icestoragepump1">
				<strong class="name">#1</strong>
				<span class="text_info font_yellow" id="icestoragepump1_inv_frequency">12345.0 Hz</span>
				<span class="fan on"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No6" href="#" id="icestoragepump2">
				<strong class="name">#2</strong>
				<span class="text_info font_yellow" id="icestoragepump2_inv_frequency">12345.0 Hz</span>
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No7" href="#" id="icestoragepump3">
				<strong class="name">#3</strong>
				<span class="text_info font_yellow" id="icestoragepump3_inv_frequency">12345.0 Hz</span>
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No8" href="#" id="icestoragepump4">
				<strong class="name">#4</strong>
				<span class="text_info font_yellow" id="icestoragepump4_inv_frequency">12345.0 Hz</span>
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
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
		
		<span class="pipe_glycol_ud up pipe001 on" name="pipe24"></span>
		<span class="pipe_glycol_ud up pipe002 on" name="pipe25"></span>
		<span class="pipe_glycol_ud up pipe003 on" name="pipe26"></span>
		
		<span class="pipe_glycol_lr left pipe001 on" name="pipe27"></span>
		<span class="pipe_glycol_lr left pipe002 on" name="pipe28"></span>
		<span class="pipe_glycol_lr left pipe003 on" name="pipe29"></span>
		<span class="pipe_glycol_lr left pipe004 on" name="pipe30"></span>
		<span class="pipe_glycol_lr left pipe005 on" name="pipe31"></span>
		<span class="pipe_glycol_lr left pipe006 on" name="pipe32"></span>
		<span class="pipe_glycol_lr left pipe007 on" name="pipe33"></span>
		<span class="pipe_glycol_lr left pipe008 on" name="pipe34"></span>
		<span class="pipe_glycol_lr left pipe009 on" name="pipe26"></span>
		<span class="pipe_glycol_lr left pipe010 on" name="pipe25"></span>
		<span class="pipe_glycol_lr left pipe011 on" name="pipe24"></span>
		<span class="pipe_glycol_lr left pipe012 on" name="pipe24"><em></em></span>
		<span class="pipe_glycol_lr right pipe013 on" name="pipe24"></span>
		<span class="pipe_glycol_lr left pipe014 on" name="pipe25"><em></em></span>
		<span class="pipe_glycol_lr right pipe015 on" name="pipe25"></span>
		<span class="pipe_glycol_lr left pipe016 on" name="pipe26"><em></em></span>
		<span class="pipe_glycol_lr right pipe017 on" name="pipe26"></span>
		
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_ul corner003"></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		<span class="pipe_glycol_corner_dl corner003"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow" id="hex1_coolwater_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_yellow" id="hex1_coolwater_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em class="font_yellow" id="hex2_coolwater_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_yellow" id="hex2_coolwater_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em class="font_yellow" id="hex3_coolwater_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em class="font_yellow" id="hex3_coolwater_out_temp">12345 ℃</em></span>
		
		<div class="vv-016k No3 off" id="mv2c">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV2C</strong>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vv-016k No2 off" id="mv2b">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV2B</strong>
			<span class="icon_direct direct"></span>
		</div>
		<div class="vv-016k No1 off" id="mv2a">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV2A</strong>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No1" href="#" id="coolwaterpump1_store">
				<span class="fan off"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No2" href="#" id="coolwaterpump2_store">
				<span class="fan off"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No3" href="#" id="coolwaterpump3_store">
				<span class="fan off"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No4" href="#" id="coolwaterpumpsb_store">
				<span class="fan off"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No5" href="#" id="coolwaterpump1_terminal">
				<span class="fan off"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No6" href="#" id="coolwaterpump2_terminal">
				<span class="fan off"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No7" href="#" id="coolwaterpump3_terminal">
				<span class="fan off"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No8" href="#" id="coolwaterpumpsb_terminal">
				<span class="fan off"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct"></span>
			</a>
			<strong class="text_info">냉수 펌프</strong>
		</div>
		
		<div class="header_long No1">
			<em class="header_u"></em>
			<span class="text no1" id="store1_select">백화점#1</span>
			<span class="text no2" id="store2_select">백화점#2</span>
			<span class="text no3" id="store3_select">백화점#3</span>
			<em class="header_d"></em>
		</div>
		<div class="header_long No2">
			<em class="header_u"></em>
			<span class="text no1" id="terminal1_select">터미널#1</span>
			<span class="text no2" id="terminal2_select">터미널#2</span>
			<span class="text no3" id="terminal3_select">터미널#3</span>
			<em class="header_d"></em>
		</div>
		<div class="header_long No3">
			<em class="header_u"></em>
			<em class="header_d"></em>
		</div>
	</div>
	
	<div class="header_lamp">
		<dl>
			<dt id="cold_absorption_fridge_run_yn">상온 흡수식 냉동기</dt>
			<dd><span class="lamp off"></span> 정지중</dd>
		</dl>
		<dl>
			<dt id="cold_turbo_fridge_run_yn">상온 터보 냉동기</dt>
			<dd><span class="lamp off"></span> 정지중</dd>
		</dl>
	</div>
	
	<div class="footer_info">
		<p>냉수기준온도 <strong class="font_yellow" id="inv_control_coolwater_out_temp">50.0℃</strong></p>
		<p>냉수설정온도 <strong class="font_red" id="coolwater1_out_temp">50.0℃</strong></p>
		</dl>
	</div>
</div>

<div class="btn_areaC mt5">
	<a class="btnType btn_type02" href="javascript:diagramSetLRegist();">저장</a>
</div>



<!-- s : data_area -->
<div id="data_area">
<div class="scroll" style="height:870px;">
	
	<div class="data_area_inner">
		<dl>
			<dt>냉각탑 #1-1<a href="#cooltower1_1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower1_1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower1_1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower1_1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각탑 #1-2<a href="#cooltower1_2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower1_2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower1_2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower1_2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각탑 #2-1<a href="#cooltower2_1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower2_1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower2_1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower2_1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각탑 #2-2<a href="#cooltower2_2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower2_2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower2_2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower2_2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각탑 #3-1<a href="#cooltower3_1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower3_1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower3_1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower3_1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각탑 #3-2<a href="#cooltower3_2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower3_2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower3_2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower3_2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각탑 #4-1<a href="#cooltower4_1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower4_1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower4_1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower4_1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각탑 #4-2<a href="#cooltower4_2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="cooltower4_2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="cooltower4_2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower4_2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉각수 펌프 #1<a href="#coolpump1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolpump1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolpump1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolpump1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">START신호</th>
							<td>
								<select id="coolpump1_start" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉각수 펌프 #2<a href="#coolpump2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolpump2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolpump2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolpump2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">START신호</th>
							<td>
								<select id="coolpump2_start" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉각수 펌프 #3<a href="#coolpump3" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolpump3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolpump3_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolpump3_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">START신호</th>
							<td>
								<select id="coolpump3_start" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉각수 펌프 #4<a href="#coolpump4" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolpump4" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolpump4_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolpump4_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">START신호</th>
							<td>
								<select id="coolpump4_start" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>

	<div class="data_area_inner mt10">
		<dl>
			<dt>축냉 펌프 #1<a href="#storagetankpump1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="storagetankpump1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="storagetankpump1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="storagetankpump1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>축냉 펌프 #2<a href="#storagetankpump2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="storagetankpump2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="storagetankpump2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="storagetankpump2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>축냉 펌프 #3<a href="#storagetankpump3" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="storagetankpump3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="storagetankpump3_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="storagetankpump3_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>축냉 펌프 #4<a href="#storagetankpump4" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="storagetankpump4" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="storagetankpump4_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="storagetankpump4_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>방냉 펌프 #1<a href="#icestoragepump1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#icestoragepump1_inv_frequency" class="underline" name="buildChak">인버터 주파수</a></th>
							<td>
								<select id="icestoragepump1_inv_frequency" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">RUN</th>
							<td>
								<select id="icestoragepump1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">기동/정지</th>
							<td>
								<select id="icestoragepump1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="icestoragepump1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">인버터 수동주파수설정</th>
							<td>
								<select id="icestoragepump1_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>방냉 펌프 #2<a href="#icestoragepump2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#icestoragepump2_inv_frequency" class="underline" name="buildChak">인버터 주파수</a></th>
							<td>
								<select id="icestoragepump2_inv_frequency" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">RUN</th>
							<td>
								<select id="icestoragepump2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">기동/정지</th>
							<td>
								<select id="icestoragepump2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="icestoragepump2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">인버터 수동주파수설정</th>
							<td>
								<select id="icestoragepump2_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>방냉 펌프 #3<a href="#icestoragepump3" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#icestoragepump3_inv_frequency" class="underline" name="buildChak">인버터 주파수</a></th>
							<td>
								<select id="icestoragepump3_inv_frequency" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">RUN</th>
							<td>
								<select id="icestoragepump3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">기동/정지</th>
							<td>
								<select id="icestoragepump3_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="icestoragepump3_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">인버터 수동주파수설정</th>
							<td>
								<select id="icestoragepump3_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>방냉 펌프 #4<a href="#icestoragepump4" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#icestoragepump4_inv_frequency" class="underline" name="buildChak">인버터 주파수</a></th>
							<td>
								<select id="icestoragepump4_inv_frequency" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">RUN</th>
							<td>
								<select id="icestoragepump4" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">기동/정지</th>
							<td>
								<select id="icestoragepump4_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="icestoragepump4_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">인버터 수동주파수설정</th>
							<td>
								<select id="icestoragepump4_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 백화점 #1<a href="#coolwaterpump1_store" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpump1_store" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump1_store_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump1_store_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 백화점 #2<a href="#coolwaterpump2_store" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpump2_store" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump2_store_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump2_store_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 백화점 #3<a href="#coolwaterpump3_store" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpump3_store" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump3_store_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump3_store_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 백화점 SB<a href="#coolwaterpumpsb_store" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpumpsb_store" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpumpsb_store_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpumpsb_store_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 터미널 #1<a href="#coolwaterpump1_terminal" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpump1_terminal" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump1_terminal_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump1_terminal_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 터미널 #2<a href="#coolwaterpump2_terminal" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpump2_terminal" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump2_terminal_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump2_terminal_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 터미널 #3<a href="#coolwaterpump3_terminal" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpump3_terminal" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump3_terminal_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump3_terminal_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉수펌프 터미널 SB<a href="#coolwaterpumpsb_terminal" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="coolwaterpumpsb_terminal" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpumpsb_terminal_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpumpsb_terminal_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>백화점</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#store1_select" class="underline" name="buildChak">백화점#1 선택</a></th>
							<td>
								<select id="store1_select" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#store2_select" class="underline" name="buildChak">백화점#2 선택</a></th>
							<td>
								<select id="store2_select" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#store3_select" class="underline" name="buildChak">백화점#3 선택</a></th>
							<td>
								<select id="store3_select" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>터미널</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#terminal1_select" class="underline" name="buildChak">터미널#1 선택</a></th>
							<td>
								<select id="terminal1_select" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#terminal2_select" class="underline" name="buildChak">터미널#2 선택</a></th>
							<td>
								<select id="terminal2_select" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#terminal3_select" class="underline" name="buildChak">터미널#3 선택</a></th>
							<td>
								<select id="terminal3_select" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>냉동기 #1<a href="#fridge1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="fridge1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="fridge1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="fridge1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"></th>
							<td></td>
						</tr>
						<tr>
							<th scope="row">야간</th>
							<td>
								<select id="fridge1_night_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">주간</th>
							<td>
								<select id="fridge1_day_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기 #2<a href="#fridge2" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="fridge2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="fridge2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="fridge2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"></th>
							<td></td>
						</tr>
						<tr>
							<th scope="row">야간</th>
							<td>
								<select id="fridge2_night_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">주간</th>
							<td>
								<select id="fridge2_day_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기 #3<a href="#fridge3" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="fridge3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="fridge3_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="fridge3_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"></th>
							<td></td>
						</tr>
						<tr>
							<th scope="row">야간</th>
							<td>
								<select id="fridge3_night_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">주간</th>
							<td>
								<select id="fridge3_day_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>

	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기 #4<a href="#fridge4" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">RUN</th>
							<td>
								<select id="fridge4" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="fridge4_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동/자동</th>
							<td>
								<select id="fridge4_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"></th>
							<td></td>
						</tr>
						<tr>
							<th scope="row">야간</th>
							<td>
								<select id="fridge4_night_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">주간</th>
							<td>
								<select id="fridge4_day_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
		
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기직기동<a href="#fridge_text" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">냉동기 병렬시 압축기 #1</th>
							<td>
								<select id="fridge1_run" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">냉동기 병렬시 압축기 #2</th>
							<td>
								<select id="fridge2_run" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 병렬시 압축기 #3</th>
							<td>
								<select id="fridge3_run" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">냉동기 병렬시 압축기 #4</th>
							<td>
								<select id="fridge4_run" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	


	<div class="data_area_inner mt10">
		<dl>
			<dt>온도</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#fridge1_storagetank_in_temp" class="underline" name="buildChak">냉동기#1 축냉 입구온도</a></th>
							<td>
								<select id="fridge1_storagetank_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge1_storagetank_out_temp" class="underline" name="buildChak">냉동기#1 축냉 출구온도</a></th>
							<td>
								<select id="fridge1_storagetank_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge1_cool_in_temp" class="underline" name="buildChak">냉동기#1 냉각수 입구온도</a></th>
							<td>
								<select id="fridge1_cool_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge1_cool_out_temp" class="underline" name="buildChak">냉동기#1 냉각수 출구온도</a></th>
							<td>
								<select id="fridge1_cool_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge2_storagetank_in_temp" class="underline" name="buildChak">냉동기#2 축냉 입구온도</a></th>
							<td>
								<select id="fridge2_storagetank_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge2_storagetank_out_temp" class="underline" name="buildChak">냉동기#2 축냉 출구온도</a></th>
							<td>
								<select id="fridge2_storagetank_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge2_cool_in_temp" class="underline" name="buildChak">냉동기#2 냉각수 입구온도</a></th>
							<td>
								<select id="fridge2_cool_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge2_cool_out_temp" class="underline" name="buildChak">냉동기#2 냉각수 출구온도</a></th>
							<td>
								<select id="fridge2_cool_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge3_storagetank_in_temp" class="underline" name="buildChak">냉동기#3 축냉 입구온도</a></th>
							<td>
								<select id="fridge3_storagetank_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge3_storagetank_out_temp" class="underline" name="buildChak">냉동기#3 축냉 출구온도</a></th>
							<td>
								<select id="fridge3_storagetank_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge3_cool_in_temp" class="underline" name="buildChak">냉동기#3 냉각수 입구온도</a></th>
							<td>
								<select id="fridge3_cool_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge3_cool_out_temp" class="underline" name="buildChak">냉동기#3 축냉 출구온도</a></th>
							<td>
								<select id="fridge3_cool_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge4_storagetank_in_temp" class="underline" name="buildChak">냉동기#4 축냉 입구온도</a></th>
							<td>
								<select id="fridge4_storagetank_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge4_storagetank_out_temp" class="underline" name="buildChak">냉동기#4 축냉 출구온도</a></th>
							<td>
								<select id="fridge4_storagetank_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge4_cool_in_temp" class="underline" name="buildChak">냉동기#4 냉각수 입구온도</a></th>
							<td>
								<select id="fridge4_cool_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge4_cool_out_temp" class="underline" name="buildChak">냉동기#4 축냉 출구온도</a></th>
							<td>
								<select id="fridge4_cool_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge_merge_storagetank_in_temp" class="underline" name="buildChak">냉동기 통합 축냉 입구온도</a></th>
							<td>
								<select id="fridge_merge_storagetank_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge_merge_storagetank_out_temp" class="underline" name="buildChak">냉동기 통합 축냉 출구온도</a></th>
							<td>
								<select id="fridge_merge_storagetank_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#hex_merge_icestorage_in_temp" class="underline" name="buildChak">HEX 통합 방냉 입구온도</a></th>
							<td>
								<select id="hex_merge_icestorage_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#hex_merge_icestorage_out_temp" class="underline" name="buildChak">HEX 통합 방냉 출구온도</a></th>
							<td>
								<select id="hex_merge_icestorage_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#hex1_icestorage_in_temp" class="underline" name="buildChak">HEX#1 방냉 입구온도</a></th>
							<td>
								<select id="hex1_icestorage_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#hex1_icestorage_out_temp" class="underline" name="buildChak">HEX#1 방냉 출구온도</a></th>
							<td>
								<select id="hex1_icestorage_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#hex1_coolwater_in_temp" class="underline" name="buildChak">HEX#1 냉수 입구온도</a></th>
							<td>
								<select id="hex1_coolwater_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#hex1_coolwater_out_temp" class="underline" name="buildChak">HEX#1 냉수 출구온도</a></th>
							<td>
								<select id="hex1_coolwater_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#hex2_icestorage_in_temp" class="underline" name="buildChak">HEX#2 방냉 입구온도</a></th>
							<td>
								<select id="hex2_icestorage_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#hex2_icestorage_out_temp" class="underline" name="buildChak">HEX#2 방냉 출구온도</a></th>
							<td>
								<select id="hex2_icestorage_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#hex2_coolwater_in_temp" class="underline" name="buildChak">HEX#2 냉수 입구온도</a></th>
							<td>
								<select id="hex2_coolwater_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#hex2_coolwater_out_temp" class="underline" name="buildChak">HEX#2 냉수 출구온도</a></th>
							<td>
								<select id="hex2_coolwater_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#hex3_icestorage_in_temp" class="underline" name="buildChak">HEX#3 방냉 입구온도</a></th>
							<td>
								<select id="hex3_icestorage_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#hex3_icestorage_out_temp" class="underline" name="buildChak">HEX#3 방냉 출구온도</a></th>
							<td>
								<select id="hex3_icestorage_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#hex3_coolwater_in_temp" class="underline" name="buildChak">HEX#3 냉수 입구온도</a></th>
							<td>
								<select id="hex3_coolwater_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#hex3_coolwater_out_temp" class="underline" name="buildChak">HEX#3 냉수 출구온도</a></th>
							<td>
								<select id="hex3_coolwater_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#inv_control_coolwater_out_temp" class="underline" name="buildChak">인버터 제어용  냉수 출구온도</a></th>
							<td>
								<select id="inv_control_coolwater_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#coolwater1_out_temp" class="underline" name="buildChak">냉수#1 출구설정</a></th>
							<td>
								<select id="coolwater1_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
		
	<div class="data_area_inner mt10">
		<dl>
			<dt>MV1<a href="#mv1" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">MV1</th>
							<td>
								<select id="mv1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">열림/닫힘</th>
							<td>
								<select id="mv1_open_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV2A<a href="#mv2a" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">MV2A</th>
							<td>
								<select id="mv2a" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv2a_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">열림/닫힘</th>
							<td>
								<select id="mv2a_open_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV2B<a href="#mv2b" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">MV2B</th>
							<td>
								<select id="mv2b" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv2b_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">열림/닫힘</th>
							<td>
								<select id="mv2b_open_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV2C<a href="#mv2c" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">MV2C</th>
							<td>
								<select id="mv2c" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv2c_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">열림/닫힘</th>
							<td>
								<select id="mv2c_open_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV3A<a href="#mv3a_per" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">개도</th>
							<td>
								<select id="mv3a_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv3a_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv3a_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV3B<a href="#mv3b_per" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">개도</th>
							<td>
								<select id="mv3b_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv3b_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv3b_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV3C<a href="#mv3c_per" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">개도</th>
							<td>
								<select id="mv3c_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv3c_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv3c_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV3D<a href="#mv3d_per" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">개도</th>
							<td>
								<select id="mv3d_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv3d_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv3d_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV4A<a href="#mv4a" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">MV4A</th>
							<td>
								<select id="mv4a" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv4a_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">열림/닫힘</th>
							<td>
								<select id="mv4a_open_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV4B<a href="#mv4b" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">MV4B</th>
							<td>
								<select id="mv4b" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv4b_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">열림/닫힘</th>
							<td>
								<select id="mv4b_open_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>MV4C<a href="#mv4c" class="buildLink" name="buildChak"></a></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">MV4C</th>
							<td>
								<select id="mv4c" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="mv4c_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">열림/닫힘</th>
							<td>
								<select id="mv4c_open_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>축열량</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#storagetank_heatstorage" class="underline" name="buildChak">축열량</a></th>
							<td>
								<select id="storagetank_heatstorage" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#storagetank_high_temp" class="underline" name="buildChak">축열조 상부온도</a></th>
							<td>
								<select id="storagetank_high_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#storagetank_low_temp" class="underline" name="buildChak">축열조 하부온도</a></th>
							<td>
								<select id="storagetank_low_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
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
			<dt>순시유량</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#storagetank_inspect_flux" class="underline" name="buildChak">축냉 순시유량</a></th>
							<td>
								<select id="storagetank_inspect_flux" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#icestorage_inspect_flux" class="underline" name="buildChak">방냉 순시유량</a></th>
							<td>
								<select id="icestorage_inspect_flux" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>상온냉동기</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>

					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#cold_absorption_fridge_run_yn" class="underline" name="buildChak">상온 흡수식냉동기 RUN</a></th>
							<td>
								<select id="cold_absorption_fridge_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#cold_turbo_fridge_run_yn" class="underline" name="buildChak">상온 터보냉동기 RUN</a></th>
							<td>
								<select id="cold_turbo_fridge_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>배관</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
					<col width="20%">
					<col width="30%">
				</colgroup>
	
					<thead>
						<tr>
							<th>Name</th>
							<th>TagID</th>
							<th>Name</th>
							<th>TagID</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe1',1)" onmouseout="pipeChak('pipe1',0)" class="underline">배관1</a></th>
							<td>
								<select id="pipe1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe2',1)" onmouseout="pipeChak('pipe2',0)" class="underline">배관2</a></th>
							<td>
								<select id="pipe2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe3',1)" onmouseout="pipeChak('pipe3',0)" class="underline">배관3</a></th>
							<td>
								<select id="pipe3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe4',1)" onmouseout="pipeChak('pipe4',0)" class="underline">배관4</a></th>
							<td>
								<select id="pipe4" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe5',1)" onmouseout="pipeChak('pipe5',0)" class="underline">배관5</a></th>
							<td>
								<select id="pipe5" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe6',1)" onmouseout="pipeChak('pipe6',0)" class="underline">배관6</a></th>
							<td>
								<select id="pipe6" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe7',1)" onmouseout="pipeChak('pipe7',0)" class="underline">배관7</a></th>
							<td>
								<select id="pipe7" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe8',1)" onmouseout="pipeChak('pipe8',0)" class="underline">배관8</a></th>
							<td>
								<select id="pipe8" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe9',1)" onmouseout="pipeChak('pipe9',0)" class="underline">배관9</a></th>
							<td>
								<select id="pipe9" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe10',1)" onmouseout="pipeChak('pipe10',0)" class="underline">배관10</a></th>
							<td>
								<select id="pipe10" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe11',1)" onmouseout="pipeChak('pipe11',0)" class="underline">배관11</a></th>
							<td>
								<select id="pipe11" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe12',1)" onmouseout="pipeChak('pipe12',0)" class="underline">배관12</a></th>
							<td>
								<select id="pipe12" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe13',1)" onmouseout="pipeChak('pipe13',0)" class="underline">배관13</a></th>
							<td>
								<select id="pipe13" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe14',1)" onmouseout="pipeChak('pipe14',0)" class="underline">배관14</a></th>
							<td>
								<select id="pipe14" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe15',1)" onmouseout="pipeChak('pipe15',0)" class="underline">배관15</a></th>
							<td>
								<select id="pipe15" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe16',1)" onmouseout="pipeChak('pipe16',0)" class="underline">배관16</a></th>
							<td>
								<select id="pipe16" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe17',1)" onmouseout="pipeChak('pipe17',0)" class="underline">배관17</a></th>
							<td>
								<select id="pipe17" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe18',1)" onmouseout="pipeChak('pipe18',0)" class="underline">배관18</a></th>
							<td>
								<select id="pipe18" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe19',1)" onmouseout="pipeChak('pipe19',0)" class="underline">배관19</a></th>
							<td>
								<select id="pipe19" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe20',1)" onmouseout="pipeChak('pipe20',0)" class="underline">배관20</a></th>
							<td>
								<select id="pipe20" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe21',1)" onmouseout="pipeChak('pipe21',0)" class="underline">배관21</a></th>
							<td>
								<select id="pipe21" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe22',1)" onmouseout="pipeChak('pipe22',0)" class="underline">배관22</a></th>
							<td>
								<select id="pipe22" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe23',1)" onmouseout="pipeChak('pipe23',0)" class="underline">배관23</a></th>
							<td>
								<select id="pipe23" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe24',1)" onmouseout="pipeChak('pipe24',0)" class="underline">배관24</a></th>
							<td>
								<select id="pipe24" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe25',1)" onmouseout="pipeChak('pipe25',0)" class="underline">배관25</a></th>
							<td>
								<select id="pipe25" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe26',1)" onmouseout="pipeChak('pipe26',0)" class="underline">배관26</a></th>
							<td>
								<select id="pipe26" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe27',1)" onmouseout="pipeChak('pipe27',0)" class="underline">배관27</a></th>
							<td>
								<select id="pipe27" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe28',1)" onmouseout="pipeChak('pipe28',0)" class="underline">배관28</a></th>
							<td>
								<select id="pipe28" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe29',1)" onmouseout="pipeChak('pipe29',0)" class="underline">배관29</a></th>
							<td>
								<select id="pipe29" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe30',1)" onmouseout="pipeChak('pipe30',0)" class="underline">배관30</a></th>
							<td>
								<select id="pipe30" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe31',1)" onmouseout="pipeChak('pipe31',0)" class="underline">배관31</a></th>
							<td>
								<select id="pipe31" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe32',1)" onmouseout="pipeChak('pipe32',0)" class="underline">배관32</a></th>
							<td>
								<select id="pipe32" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe33',1)" onmouseout="pipeChak('pipe33',0)" class="underline">배관33</a></th>
							<td>
								<select id="pipe33" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe34',1)" onmouseout="pipeChak('pipe34',0)" class="underline">배관34</a></th>
							<td>
								<select id="pipe34" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe35',1)" onmouseout="pipeChak('pipe35',0)" class="underline">배관35</a></th>
							<td>
								<select id="pipe35" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
</div>
<!-- e : data_area -->
</div>