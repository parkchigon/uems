<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		checkDoublePipe();
		
	});
	
	function checkDoublePipe() {
		var pipe8 = $("input[class='A11203_pipe8']").val();
		var pipe9 = $("input[class='A11203_pipe9']").val();
		if(pipe8=='1') {
			$("[name='doubleTag']").removeClass("up");
			$("[name='doubleTag']").addClass("down");
			$("[name='doubleTag']").addClass("on");
		} else if (pipe9=='1') {
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
		<span class="pipe_hw_ud up pipe001" name="A11203_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe002" name="A11203_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe003" name="A11203_pipe1"><em></em></span>
		
		<span class="pipe_hw_lr right pipe001" name="A11203_pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe002" name="A11203_pipe1"><em></em></span>
		<span class="pipe_hw_lr left pipe003" name="A11203_pipe1"><em></em></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_corner_dr corner003"></span>
		
		<span class="pipe_hw_corner_ul corner001"></span>
		
		<span class="pipe_hw_corner_ur corner001"></span>
		
		<span class="sensor_u_temperature sensor001"><em><span id="A11203_fridge_cool_out_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="A11203_fridge_cool_in_temp"></span>℃</em></span>
		
		<div class="coolingtower">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1', 'A11203', 'cooltower');" class="power off" id="A11203_cooltower">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto"  id="A11203_cooltower_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name">냉각탑</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="javascript:openLayerPop('#layerPop_type1', 'A11203', 'coolpump')">
				<span class="fan" id="A11203_coolpump"></span>
				<span class="icon_direct auto" id="A11203_coolpump_auto_yn"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
		</div>
	</div>
	
	<div class="chw">
		<span class="pipe_chw_ud down pipe001" name="A11203_pipe2"></span>
		<span class="pipe_chw_ud down pipe002" name="A11203_pipe3"><em></em></span>
		<span class="pipe_chw_ud up pipe003" name="A11203_pipe2"><em></em></span>
		<span class="pipe_chw_ud up pipe004" name="A11203_pipe4"></span>
		<span class="pipe_chw_ud down pipe005" name="A11203_pipe5"><em></em></span>
		<span class="pipe_chw_ud down pipe006" name="doubleTag"></span><!-- 테그네임이 2개임 -->
		<span class="pipe_chw_ud up pipe007" name="A11203_pipe6"></span>
		<span class="pipe_chw_ud down pipe008" name="A11203_pipe6"></span>
		
		<span class="pipe_chw_lr left pipe001" name="A11203_pipe2"><em></em></span>
		<span class="pipe_chw_lr right pipe002" name="A11203_pipe10"></span>
		<span class="pipe_chw_lr right pipe003" name="A11203_pipe5"><em></em></span>
		<span class="pipe_chw_lr right pipe004" name="A11203_pipe3"><em></em></span>
		<span class="pipe_chw_lr right pipe005" name="A11203_pipe11"></span>
		<span class="pipe_chw_lr right pipe006" name="A11203_pipe2"></span>
		<span class="pipe_chw_lr right pipe007" name="A11203_pipe6"></span>
		<span class="pipe_chw_lr right pipe008" name="A11203_pipe13"></span>
		<span class="pipe_chw_lr right pipe009" name="A11203_pipe2"><em></em></span>
		<span class="pipe_chw_lr left pipe010" name="A11203_pipe12"></span>
		<span class="pipe_chw_lr right pipe011" name="A11203_pipe12"></span>
		
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
		
		<span class="sensor_u_temperature sensor001"><em class="font_sky"><span id="A11203_brinepump_mix_temp"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_sky"><span id="A11203_brinepump_out_temp"></span> ℃</em></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="A11203_fridge_storagetank_out_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="A11203_fridge_storagetank_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky"><span id="A11203_brinepump_in_temp"></span> ℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky"><span id="A11203_storagetank_high_temp"></span> ℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky"><span id="A11203_storagetank_low_temp"></span> ℃</em></span>
		
		<div class="symbol No1"><em><span id="A11203_brinepump_inspect_flux"></span> ㎡/h</em></div>
		
		<div class="vv-011k No1">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2', 'A11203', 'mv1');"></a>
			<strong class="name">MV1</strong>
			<span class="text_inner text02"><span id="A11203_mv1_per"></span>%</span>
			<span class="icon_direct auto" id="A11203_mv1_auto_yn"></span>
		</div>
		
		<div class="vv-011k up No2">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2', 'A11203', 'mv2');"></a>
			<strong class="name">MV2</strong>
			<span class="text_inner text01"><span id="A11203_mv2_per"></span>%</span>
			<span class="icon_direct auto" id="A11203_mv2_auto_yn"></span>
		</div>
		
		<div class="vv-016k No1 " id="mv3_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A11203', 'mv3');" class="power" id="A11203_mv3">닫힘</a>
			<strong class="name">MV3</strong>
			<span class="icon_direct auto" id="A11203_mv3_auto_yn"></span>
		</div>
		
		<div class="vv-016k left No2 " id="mv4_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A11203', 'mv4');" class="power" id="A11203_mv4">닫힘</a>
			<strong class="name">MV4</strong>
			<span class="icon_direct auto" id="A11203_mv4_auto_yn"></span>
		</div>
		
		<div class="vv-016k left No3" id="mv5_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A11203', 'mv5');" class="power" id="A11203_mv5">닫힘</a>
			<strong class="name">MV5</strong>
			<span class="icon_direct auto" id="A11203_mv5_auto_yn"></span>
		</div>
		
		<div class="vv-016k No4" id="mv6_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A11203', 'mv6');" class="power" id="A11203_mv6">닫힘</a>
			<strong class="name">MV6</strong>
			<span class="icon_direct auto" id="A11203_mv6_auto_yn"></span>
		</div>
		
		<div class="heat_storaging_tank">
			<span class="bg" style="height:50%;"></span>
			<strong class="text"><span id="A11203_storagetank_heatstorage"></span>%</strong>
			<strong class="text2 up" id="A11203_storagetank_charge_state">축냉시</strong>
			<strong class="text2 down" id="A11203_storagetank_release_state">방냉시</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1">
				<a href="javascript:openLayerPop('#layerPop_type7', 'A11203', 'fridge1');" class="power no1" id="A11203_fridge1">가동</a>
				<span class="icon_direct no1 auto" id="A11203_fridge1_auto_yn"></span>
				<span class="text no1 font_yellow"><span id="A11203_fridge1_compressor_volt"></span>A</span>
				
				<a href="javascript:openLayerPop('#layerPop_type7', 'A11203', 'fridge2');" class="power no2" id="A11203_fridge2">가동</a>
				<span class="icon_direct no2 auto" id="A11203_fridge2_auto_yn"></span>
				<span class="text no2 font_yellow"><span id="A11203_fridge2_compressor_volt"></span>A</span>
			</div>
			<strong class="text_info"> 냉동기</strong>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no1 font_yellow"><span id="A11203_brinepump_inv_frequency"></span> Hz</strong>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type13', 'A11203', 'brinepump_main');">
				<span class="fan" id="A11203_brinepump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A11203_brinepump_main_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1', 'A11203', 'brinepump_pre');">
				<span class="fan" id="A11203_brinepump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A11203_brinepump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no2">브라인 펌프</strong>
		</div>
	</div>
	
	<div class="glycol">
		<div class="hx_plate_v"></div>
		
		<span class="pipe_glycol_ud down pipe001" name="A11203_pipe14"><em></em></span>
		<span class="pipe_glycol_ud up pipe002" name="A11203_pipe14"><em></em></span>
		<span class="pipe_glycol_ud up pipe003" name="A11203_pipe7"></span>
		<span class="pipe_glycol_ud down pipe004" name="A11203_pipe7"></span>
		
		<span class="pipe_glycol_lr left pipe001" name="A11203_pipe14"><em></em></span>
		<span class="pipe_glycol_lr right pipe002" name="A11203_pipe15"></span>
		<span class="pipe_glycol_lr left pipe003" name="A11203_pipe14"></span>
		<span class="pipe_glycol_lr right pipe004" name="A11203_pipe14"></span>
		<span class="pipe_glycol_lr right pipe005" name="A11203_pipe7"></span>
		<span class="pipe_glycol_lr right pipe006" name="A11203_pipe14"><em></em></span>
		<span class="pipe_glycol_lr right pipe007" name="A11203_pipe14"></span>
		
		<span class="pipe_glycol_corner_ur corner001"></span>
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_ul corner003"></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		
		<span class="pipe_glycol_t_lru corner001"></span>
		<span class="pipe_glycol_t_lru corner002"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="A11203_coolwater_in_temp"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="A11203_coolwater_out_temp"></span> ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump no1" href="javascript:openLayerPop('#layerPop_type1', 'A11203', 'coolwaterpump_pre');">
				<span class="fan" id="A11203_coolwaterpump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A11203_coolwaterpump_pre_auto_yn"></span>
			</a>
			<a class="coolpump no2" href="javascript:openLayerPop('#layerPop_type1', 'A11203', 'coolwaterpump_main');">
				<span class="fan" id="A11203_coolwaterpump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A11203_coolwaterpump_main_auto_yn"></span>
			</a>
			<strong class="text_info">냉수 펌프</strong>
		</div>
		
		<div class="header No1">공<br />급<br />헤<br />더<em></em></div>
		<div class="header No2">환<br />수<br />헤<br />더<em></em></div>
	</div>
	<div class="innerPop pop1">
		<dl>
			<dt>냉수운전 선택</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup>
					<tbody>
						<tr>
							<th>메인</th>
							<td>
								<div class="switch off" id="A11203_coolwaterpump_work_main">
									<span class="stop">미사용</span>
									<span class="start">사용</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th>예비</th>
							<td>
								<div class="switch off" id="A11203_coolwaterpump_work_pre">
									<span class="stop">미사용</span>
									<span class="start">사용</span>
									<em></em>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
