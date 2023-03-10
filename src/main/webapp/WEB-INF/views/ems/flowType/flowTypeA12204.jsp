<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		checkDoublePipe();

	});
	
	function checkDoublePipe() {
		var pipe9 = $("input[class='A12204_pipe9']").val();
		var pipe10 = $("input[class='A12204_pipe10']").val();
		if(pipe9=='1') {
			$("[name='doubleTag']").removeClass("up");
			$("[name='doubleTag']").addClass("down");
			$("[name='doubleTag']").addClass("on");
		} else if (pipe10=='1') {
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
		<span class="pipe_hw_ud up pipe001 on" name="A12204_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe002 on" name="A12204_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe003 on" name="A12204_pipe17"></span>
		<span class="pipe_hw_ud down pipe004 on" name="A12204_pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe005 on" name="A12204_pipe2"></span>
		
		<span class="pipe_hw_lr right pipe001 on" name="A12204_pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe002 on" name="A12204_pipe1"><em></em></span>
		<span class="pipe_hw_lr left pipe003 on" name="A12204_pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe004 on" name="A12204_pipe2"></span>
		<span class="pipe_hw_lr left pipe005 on" name="A12204_pipe2"></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		<span class="pipe_hw_corner_dl corner002"></span>
		
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_corner_dr corner003"></span>
		
		<span class="pipe_hw_corner_ul corner001"></span>
		
		<span class="pipe_hw_corner_ur corner001"></span>
		
		<span class="pipe_hw_t_lrd corner001"></span>
		<span class="pipe_hw_t_udr corner001"></span>
		
		<span class="sensor_u_temperature sensor001"><em><span id="A12204_fridge_cool_out_temp"></span> ???</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="A12204_fridge_cool_in_temp"></span>???</em></span>
		
		<div class="coolingtower">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1', 'A12204', 'cooltower');" class="power off" id="A12204_cooltower">??????</a><!-- ???????????? -->
				<span class="icon_direct auto"  id="A12204_cooltower_auto_yn"></span><!-- ??????????????? none -->
			</div>
			<strong class="name">?????????</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="javascript:openLayerPop('#layerPop_type1', 'A12204', 'coolpump_main')">
				<span class="fan" id="A12204_coolpump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A12204_coolpump_main_auto_yn"></span>
			</a>
			<a class="coolpump ud No2" href="javascript:openLayerPop('#layerPop_type1', 'A12204', 'coolpump_pre')">
				<span class="fan" id="A12204_coolpump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A12204_coolpump_pre_auto_yn"></span>
			</a>
			<strong class="text_info">?????????<br />??????</strong>
		</div>
	</div>
	
	<div class="chw">
		<span class="pipe_chw_ud down pipe001 on" name="A12204_pipe3"></span>
		<span class="pipe_chw_ud down pipe002 on" name="A12204_pipe4"><em></em></span>
		<span class="pipe_chw_ud up pipe003 on" name="A12204_pipe3"><em></em></span>
		<span class="pipe_chw_ud up pipe004 on" name="A12204_pipe5"></span>
		<span class="pipe_chw_ud down pipe005 on" name="A12204_pipe6"><em></em></span>
		<span class="pipe_chw_ud down pipe006 on" name="doubleTag"></span><!-- ??????????????? 2?????? -->
		<span class="pipe_chw_ud up pipe007 on" name="A12204_pipe7"></span>
		<span class="pipe_chw_ud down pipe008 on" name="A12204_pipe7"></span>
		
		<span class="pipe_chw_lr left pipe001 on" name="A12204_pipe3"><em></em></span>
		<span class="pipe_chw_lr right pipe002 on" name="A12204_pipe11"></span>
		<span class="pipe_chw_lr right pipe003 on" name="A12204_pipe6"><em></em></span>
		<span class="pipe_chw_lr right pipe004 on" name="A12204_pipe4"><em></em></span>
		<span class="pipe_chw_lr right pipe005 on" name="A12204_pipe12"></span>
		<span class="pipe_chw_lr right pipe006 on" name="A12204_pipe3"></span>
		<span class="pipe_chw_lr right pipe007 on" name="A12204_pipe7"></span>
		<span class="pipe_chw_lr right pipe008 on" name="A12204_pipe14"></span>
		<span class="pipe_chw_lr right pipe009 on" name="A12204_pipe3"><em></em></span>
		<span class="pipe_chw_lr left pipe010 on" name="A12204_pipe13"></span>
		<span class="pipe_chw_lr right pipe011 on" name="A12204_pipe13"></span>
		
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
		
		<span class="sensor_u_temperature sensor001"><em class="font_sky"><span id="A12204_brinepump_mix_temp"></span> ???</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_sky"><span id="A12204_brinepump_out_temp"></span> ???</em></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="A12204_fridge_storagetank_out_temp"></span> ???</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="A12204_fridge_storagetank_in_temp"></span> ???</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky"><span id="A12204_brinepump_in_temp"></span> ???</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky"><span id="A12204_storagetank_high_temp"></span> ???</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky"><span id="A12204_storagetank_low_temp"></span> ???</em></span>
		
		<div class="symbol No1"><em><span id="A12204_brinepump_inspect_flux"></span> ???/h</em></div>
		
		<div class="vv-011k No1">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2', 'A12204', 'mv1');"></a>
			<strong class="name">MV1</strong>
			<span class="text_inner text02"><span id="A12204_mv1_per"></span>%</span>
			<span class="icon_direct auto" id="A12204_mv1_auto_yn"></span>
		</div>
		
		<div class="vv-011k up No2">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2', 'A12204', 'mv2');"></a>
			<strong class="name">MV2</strong>
			<span class="text_inner text01"><span id="A12204_mv2_per"></span>%</span>
			<span class="icon_direct auto" id="A12204_mv2_auto_yn"></span>
		</div>
		
		<div class="vv-016k No1 " id="mv3_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A12204', 'mv3');" class="power" id="A12204_mv3">??????</a>
			<strong class="name">MV3</strong>
			<span class="icon_direct auto" id="A12204_mv3_auto_yn"></span>
		</div>
		
		<div class="vv-016k left No2 " id="mv4_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A12204', 'mv4');" class="power" id="A12204_mv4">??????</a>
			<strong class="name">MV4</strong>
			<span class="icon_direct auto" id="A12204_mv4_auto_yn"></span>
		</div>
		
		<div class="vv-016k left No3" id="mv5_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A12204', 'mv5');" class="power" id="A12204_mv5">??????</a>
			<strong class="name">MV5</strong>
			<span class="icon_direct auto" id="A12204_mv5_auto_yn"></span>
		</div>
		
		<div class="vv-016k No4" id="mv6_class">
			<a href="javascript:openLayerPop('#layerPop_type11', 'A12204', 'mv6');" class="power" id="A12204_mv6">??????</a>
			<strong class="name">MV6</strong>
			<span class="icon_direct auto" id="A12204_mv6_auto_yn"></span>
		</div>
		
		<div class="heat_storaging_tank">
			<span class="bg" style="height:50%;"></span>
			<strong class="text"><span id="A12204_storagetank_heatstorage"></span>%</strong>
			<strong class="text2 up" id="A12204_storagetank_charge_state">?????????</strong>
			<strong class="text2 down" id="A12204_storagetank_release_state">?????????</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1">
				<a href="javascript:openLayerPop('#layerPop_type7', 'A12204', 'fridge1');" class="power no1" id="A12204_fridge1">??????</a>
				<span class="icon_direct no1 auto" id="A12204_fridge1_auto_yn"></span>
				<span class="text no1 font_yellow"><span id="A12204_fridge1_compressor_volt"></span>A</span>
				
				<a href="javascript:openLayerPop('#layerPop_type7', 'A12204', 'fridge2');" class="power no2" id="A12204_fridge2">??????</a>
				<span class="icon_direct no2 auto" id="A12204_fridge2_auto_yn"></span>
				<span class="text no2 font_yellow"><span id="A12204_fridge2_compressor_volt"></span>A</span>
			</div>
			<strong class="text_info"> ?????????</strong>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no1 font_yellow"><span id="A12204_brinepump_inv_frequency"></span> Hz</strong>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type13', 'A12204', 'brinepump_main');">
				<span class="fan" id="A12204_brinepump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A12204_brinepump_main_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1', 'A12204', 'brinepump_pre');">
				<span class="fan" id="A12204_brinepump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A12204_brinepump_pre_auto_yn"></span>
			</a>
			<strong class="text_info no2">????????? ??????</strong>
		</div>
	</div>
	
	<div class="glycol">
		<div class="hx_plate_v"></div>
		
		<span class="pipe_glycol_ud down pipe001 on" name="A12204_pipe15"><em></em></span>
		<span class="pipe_glycol_ud up pipe002 on" name="A12204_pipe15"><em></em></span>
		<span class="pipe_glycol_ud up pipe003 on" name="A12204_pipe8"></span>
		<span class="pipe_glycol_ud down pipe004 on" name="A12204_pipe8"></span>
		
		<span class="pipe_glycol_lr left pipe001 on" name="A12204_pipe15"><em></em></span>
		<span class="pipe_glycol_lr right pipe002 on" name="A12204_pipe16"></span>
		<span class="pipe_glycol_lr left pipe003 on" name="A12204_pipe15"></span>
		<span class="pipe_glycol_lr right pipe004 on" name="A12204_pipe15"></span>
		<span class="pipe_glycol_lr right pipe005 on" name="A12204_pipe8"></span>
		<span class="pipe_glycol_lr right pipe006 on" name="A12204_pipe15"><em></em></span>
		<span class="pipe_glycol_lr right pipe007 on" name="A12204_pipe15"></span>
		
		<span class="pipe_glycol_corner_ur corner001"></span>
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_ul corner003"></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		
		<span class="pipe_glycol_t_lru corner001"></span>
		<span class="pipe_glycol_t_lru corner002"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="A12204_coolwater_in_temp"></span> ???</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="A12204_coolwater_out_temp"></span> ???</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump no1" href="javascript:openLayerPop('#layerPop_type1', 'A12204', 'coolwaterpump_pre');">
				<span class="fan" id="A12204_coolwaterpump_pre"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto" id="A12204_coolwaterpump_pre_auto_yn"></span>
			</a>
			<a class="coolpump no2" href="javascript:openLayerPop('#layerPop_type1', 'A12204', 'coolwaterpump_main');">
				<span class="fan" id="A12204_coolwaterpump_main"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto" id="A12204_coolwaterpump_main_auto_yn"></span>
			</a>
			<strong class="text_info">?????? ??????</strong>
		</div>
		
		<div class="header No1">???<br />???<br />???<br />???<em></em></div>
		<div class="header No2">???<br />???<br />???<br />???<em></em></div>
	</div>

	<div class="innerPop pop1">
		<dl>
			<dt>??????????????? ??????</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup>
					<tbody>
						<tr>
							<th>??????</th>
							<td>
								<div class="switch off" id="A12204_coolpump_work_main">
									<span class="stop">?????????</span>
									<span class="start">??????</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th>??????</th>
							<td>
								<div class="switch off" id="A12204_coolpump_work_pre">
									<span class="stop">?????????</span>
									<span class="start">??????</span>
									<em></em>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>

	<div class="innerPop pop2">
		<dl>
			<dt>???????????? ??????</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup>
					<tbody>
						<tr>
							<th>??????</th>
							<td>
								<div class="switch off" id="A12204_coolwaterpump_work_main">
									<span class="stop">?????????</span>
									<span class="start">??????</span>
									<em></em>
								</div>
							</td>
						</tr>
						<tr>
							<th>??????</th>
							<td>
								<div class="switch off" id="A12204_coolwaterpump_work_pre">
									<span class="stop">?????????</span>
									<span class="start">??????</span>
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
