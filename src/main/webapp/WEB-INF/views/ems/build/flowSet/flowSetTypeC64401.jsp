<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	});
</script>

<div class="blockDiagram_area" style="height: 850px;">
	
	<div class="hw">
		<span class="pipe_hw_ud down pipe001" name="pipe9"></span>
		<span class="pipe_hw_ud down pipe002" name="pipe8"></span>
		<span class="pipe_hw_ud down pipe003" name="pipe7"></span>
		<span class="pipe_hw_ud up pipe004" name="pipe9"></span>
		<span class="pipe_hw_ud up pipe005" name="pipe8"></span>
		<span class="pipe_hw_ud up pipe006" name="pipe7"></span>
		<span class="pipe_hw_ud down pipe007" name="pipe7"></span>
		<span class="pipe_hw_ud down pipe008" name="pipe8"></span>
		<span class="pipe_hw_ud up pipe009" name="pipe4"></span>
		<span class="pipe_hw_ud up pipe010" name="pipe6"></span>
		<span class="pipe_hw_ud up pipe011" name="pipe5"></span>
		<span class="pipe_hw_ud down pipe012" name="pipe4"></span>
		<span class="pipe_hw_ud down pipe013" name="pipe6"></span>
		<span class="pipe_hw_ud down pipe014" name="pipe5"></span>
		<span class="pipe_hw_ud down pipe017" name="pipe7"></span>
		<span class="pipe_hw_ud down pipe018" name="pipe8"></span>
		<span class="pipe_hw_ud down pipe019" name="pipe9"></span>
		
		<span class="pipe_hw_lr right pipe001" name="pipe9"></span>
		<span class="pipe_hw_lr right pipe002" name="pipe8"></span>
		<span class="pipe_hw_lr right pipe003" name="pipe7"></span>
		<span class="pipe_hw_lr right pipe004" name="pipe9"></span>
		<span class="pipe_hw_lr right pipe005" name="pipe8"></span>
		<span class="pipe_hw_lr right pipe006" name="pipe7"></span>
		<span class="pipe_hw_lr right pipe007" name="pipe4"></span>
		<span class="pipe_hw_lr right pipe008" name="pipe3"></span>
		<span class="pipe_hw_lr right pipe009" name="pipe2"></span>
		<span class="pipe_hw_lr right pipe010" name="pipe1"></span>
		<span class="pipe_hw_lr right pipe011" name="pipe9"></span>
		<span class="pipe_hw_lr right pipe012" name="pipe8"></span>
		<span class="pipe_hw_lr right pipe013" name="pipe7"></span>
		<span class="pipe_hw_lr left pipe014" name="pipe7"></span>
		<span class="pipe_hw_lr left pipe015" name="pipe8"></span>
		<span class="pipe_hw_lr left pipe016" name="pipe9"></span>
		
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
		
		<span class="sensor_u_temperature sensor001"><em id="cool1_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em id="cool1_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em id="cool2_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em id="cool2_in_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em id="cool3_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em id="cool3_in_temp">12345 ℃</em></span>
		
		<div class="coolpump_area">
			<span id="coolpumpsb" class="coolpump No4">
				<span class="fan off"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="coolpump3" class="coolpump No3">
				<span class="fan off"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="coolpump2" class="coolpump No2">
				<span class="fan off"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="coolpump1" class="coolpump No1">
				<span class="fan off"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct"></span>
			</span>
			<strong class="text_info">냉각수펌프</strong>
		</div>
		
		<div class="coolingtower duo No1">
			<div id="cooltower1_1" class="duo_inner">
				<span class="text">1-1</span>
				<span class="power off">정지</span><!-- 모달팝업 -->
				<span class="icon_direct auto"></span><!-- 자동일경우 none -->
			</div>
			<div id="cooltower1_2" class="duo_inner">
				<span class="text">1-2</span>
				<span class="power off">정지</span>
				<span class="icon_direct direct"></span>
			</div>
		</div>
		<div class="coolingtower duo No2">
			<div id="cooltower2_1" class="duo_inner">
				<span class="text">2-1</span>
				<span class="power off">정지</span>
				<span class="icon_direct direct"></span>
			</div>
			<div id="cooltower2_2" class="duo_inner">
				<span class="text">2-2</span>
				<span class="power off">정지</span>
				<span class="icon_direct direct"></span>
			</div>
		</div>
		<div class="coolingtower duo No3">
			<div id="cooltower3_1" class="duo_inner">
				<span class="text">3-1</span>
				<span class="power off">정지</span>
				<span class="icon_direct direct"></span>
			</div>
			<div id="cooltower3_2" class="duo_inner">
				<span class="text">3-2</span>
				<span class="power off" name="modal">정지</span>
				<span class="icon_direct direct"></span>
			</div>
		</div>
	</div>
	
	<div class="chw">
		<span class="pipe_chw_ud down pipe001" name="pipe17"></span>
		<span class="pipe_chw_ud down pipe002" name="pipe21"></span>
		<span class="pipe_chw_ud up pipe003" name="pipe13"></span>
		<span class="pipe_chw_ud up pipe004" name="pipe14"></span>
		<span class="pipe_chw_ud down pipe005" name="pipe12"></span>
		<span class="pipe_chw_ud down pipe006" name="pipe13"></span>
		<span class="pipe_chw_ud down pipe007" name="pipe15"></span>
		<span class="pipe_chw_ud down pipe008" name="pipe16"></span>
		
		<span class="pipe_chw_lr left pipe001" name="pipe17"></span>
		<span class="pipe_chw_lr left pipe002" name="pipe18"></span>
		<span class="pipe_chw_lr left pipe003" name="pipe19"></span>
		<span class="pipe_chw_lr right pipe004" name="pipe21"></span>
		<span class="pipe_chw_lr right pipe005" name="pipe22"></span>
		<span class="pipe_chw_lr right pipe006" name="pipe20"></span>
		<span class="pipe_chw_lr right pipe007" name="pipe13"></span>
		<span class="pipe_chw_lr right pipe008" name="pipe10"></span>
		<span class="pipe_chw_lr right pipe009" name="pipe11"></span>
		<span class="pipe_chw_lr right pipe010" name="pipe12"></span>
		<span class="pipe_chw_lr right pipe011" name="pipe17"></span>
		<span class="pipe_chw_lr right pipe012" name="pipe18"></span>
		<span class="pipe_chw_lr right pipe013" name="pipe19"></span>
		<span class="pipe_chw_lr left pipe014" name="pipe23"></span>
		<span class="pipe_chw_lr right pipe015" name="pipe23"></span>
		<span class="pipe_chw_lr left pipe016" name="pipe24"></span>
		<span class="pipe_chw_lr right pipe017" name="pipe24"></span>
		<span class="pipe_chw_lr left pipe018" name="pipe25"></span>
		<span class="pipe_chw_lr right pipe019" name="pipe25"></span>
		
		<span class="pipe_chw_ud up pipe009" name="pipe17"></span>
		<span class="pipe_chw_ud up pipe010" name="pipe18"></span>
		<span class="pipe_chw_ud up pipe011" name="pipe19"></span>
		
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
		
		<span class="sensor_d_temperature sensor001"><em id="fridge1_out_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em id="fridge1_in_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em id="fridge2_out_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor004"><em id="fridge2_in_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor005"><em id="fridge3_out_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor006"><em id="fridge3_in_temp" class="font_sky">12345 ℃</em></span>
		
		<span class="sensor_l_temperature sensor001"><em id="storagetank_high_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_l_temperature sensor002"><em id="storagetank_low_temp" class="font_sky">12345 ℃</em></span>
		
		<span class="sensor_d_temperature sensor007"><em id="brinepumpsb_out_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor008"><em id="brinepump1_out_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor009"><em id="brinepump2_out_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor010"><em id="brinepump3_out_temp" class="font_sky">12345 ℃</em></span>
		
		<span class="sensor_u_temperature sensor001"><em id="brinepump_mix_temp" class="font_sky">12345 ℃</em></span>
		<strong class="temperature t001">12345<em class="font_yellow"> ℃</em></strong>
		<span class="sensor_u_temperature sensor002"><em id="heatchange1_in_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em id="heatchange2_in_temp" class="font_sky">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em id="heatchange3_in_temp" class="font_sky">12345 ℃</em></span>
		
		<div class="centrifugal_area">
			<div id="fridge1" class="centrifugal No1">
				<strong class="name">#1</strong>
				<span class="power off">정지</span>
				<span class="icon_direct direct"></span>
			</div>
			<div id="fridge2" class="centrifugal No2">
				<strong class="name">#2</strong>
				<span class="power off">정지</span>
				<span class="icon_direct direct"></span>
			</div>
			<div id="fridge3" class="centrifugal No3">
				<strong class="name">#3</strong>
				<span class="power off">정지</span>
			</div>
			<strong id="fridge_text" class="text_info">냉동기</strong>
		</div>
		
		<div class="avg_temperature_area">
			평균온도
			<span id="brinepump_avg_temp" class="text_info font_sky">12345 ℃</span>
		</div>
		
		<div class="coolpump_area">
			<span id="brinepumpsb" class="coolpump No4" href="#">
				<span class="fan off"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="brinepump1" class="coolpump No1" href="#">
				<span class="fan off"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="brinepump2" class="coolpump No2" href="#">
				<span class="fan off"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="brinepump3" class="coolpump No3" href="#">
				<span class="fan off"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct direct"></span>
			</span>
			<strong class="text_info">브라인펌프</strong>
		</div>
		
		<div id="mv2" class="vv-011k No1">
			<span class="btn"></span>
			<strong class="name">MV2</strong>
			<span class="text_inner text01">100%</span>
			<span class="text_inner text02">50%</span>
			<span class="icon_direct direct"></span>
		</div>
		<div id="mv1a" class="vv-011k No2">
			<span class="btn"></span>			
			<strong class="name">MV1A</strong>
			<span class="text_inner text01">100%</span>
			<span class="text_inner text02">50%</span>
			<span class="icon_direct direct"></span>
		</div>
		<div id="mv1b" class="vv-011k No3">
			<span class="btn"></span>
			<strong class="name">MV1B</strong>
			<span class="text_inner text01">100%</span>
			<span class="text_inner text02">50%</span>
			<span class="icon_direct direct"></span>
		</div>
		<div id="mv1c" class="vv-011k No4">
			<span class="btn"></span>
			<strong class="name">MV1C</strong>
			<span class="text_inner text01">100%</span>
			<span class="text_inner text02">50%</span>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="heat_storaging_tank"></div>
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
		
		<span class="pipe_glycol_lr left pipe001" name="pipe34"></span>
		<span class="pipe_glycol_lr left pipe002" name="pipe33"></span>
		<span class="pipe_glycol_lr left pipe003" name="pipe32"></span>
		<span class="pipe_glycol_lr right pipe004" name="pipe34"></span>
		<span class="pipe_glycol_lr right pipe005" name="pipe28"></span>
		<span class="pipe_glycol_lr right pipe006" name="pipe34"></span>
		<span class="pipe_glycol_lr right pipe007" name="pipe33"></span>
		<span class="pipe_glycol_lr right pipe008" name="pipe27"></span>
		<span class="pipe_glycol_lr right pipe009" name="pipe33"></span>
		<span class="pipe_glycol_lr right pipe010" name="pipe32"></span>
		<span class="pipe_glycol_lr right pipe011" name="pipe26"></span>
		<span class="pipe_glycol_lr right pipe012" name="pipe32"></span>
		<span class="pipe_glycol_lr right pipe013" name="pipe29"></span>
		<span class="pipe_glycol_lr left pipe014" name="pipe32"></span>
		<span class="pipe_glycol_lr right pipe015" name="pipe32"></span>
		<span class="pipe_glycol_lr left pipe016" name="pipe33"></span>
		<span class="pipe_glycol_lr right pipe017" name="pipe33"></span>
		<span class="pipe_glycol_lr left pipe018" name="pipe34"></span>
		<span class="pipe_glycol_lr right pipe019" name="pipe34"></span>
		
		<span class="pipe_glycol_ud down pipe001" name="pipe31"></span>
		<span class="pipe_glycol_ud down pipe002" name="pipe30"></span>
		<span class="pipe_glycol_ud down pipe003" name="pipe29"></span>
		<span class="pipe_glycol_ud up pipe004" name="pipe31"></span>
		<span class="pipe_glycol_ud up pipe005" name="pipe30"></span>
		<span class="pipe_glycol_ud up pipe006" name="pipe29"></span>
		<span class="pipe_glycol_ud down pipe007" name="pipe32"></span>
		<span class="pipe_glycol_ud down pipe008" name="pipe33"></span>
		<span class="pipe_glycol_ud down pipe009" name="pipe34"></span>
		<span class="pipe_glycol_ud up pipe010" name="pipe32"></span>
		<span class="pipe_glycol_ud up pipe011" name="pipe33"></span>
		<span class="pipe_glycol_ud up pipe012" name="pipe34"></span>
		
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
		
		<div id="coolwater3_inspect_flux" class="symbol No1"><em class="box_none">유량:158 ㎡/h</em></div>
		<div id="coolwater2_inspect_flux" class="symbol No2"><em class="box_none">유량:158 ㎡/h</em></div>
		<div id="coolwater1_inspect_flux" class="symbol No3"><em class="box_none">유량:158 ㎡/h</em></div>
		
		<span class="sensor_u_temperature sensor001"><em id="coolwater1_in_temp" class="font_yellow">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em id="coolwater1_out_temp" class="font_yellow">12345 ℃</em></span>
		<strong id="coolwater1_out_set" class="temperature t002">12345<em class="font_yellow"> ℃</em></strong>
		<span class="sensor_u_temperature sensor003"><em id="coolwater2_in_temp" class="font_yellow">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em id="coolwater2_out_temp" class="font_yellow">12345 ℃</em></span>
		<strong id="coolwater2_out_set" class="temperature t003">12345<em class="font_yellow"> ℃</em></strong>
		<span class="sensor_u_temperature sensor005"><em id="coolwater3_in_temp" class="font_yellow">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em id="coolwater3_out_temp" class="font_yellow">12345 ℃</em></span>
		<strong id="coolwater3_out_set" class="temperature t004">12345<em class="font_yellow"> ℃</em></strong>
		
		<div class="coolpump_area">
			<span id="coolwaterpump3" class="coolpump No3">
				<span class="fan off"></span>
				<strong class="name">#3</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="coolwaterpump2" class="coolpump No2">
				<span class="fan off"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="coolwaterpump1" class="coolpump No1">
				<span class="fan off"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct"></span>
			</span>
			<span id="coolwaterpumpsb" class="coolpump No4">
				<span class="fan off"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct"></span>
			</span>
			<strong class="text_info">냉수펌프</strong>
		</div>
		
		<div class="header No1">공<br />급<br />헤<br />더<em></em></div>
		<div class="header No2">환<br />수<br />헤<br />더<em></em></div>
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
							<th scope="row"><a href="#cool1_in_temp" class="underline" name="buildChak">냉각수 #1 입구온도</a></th>
							<td>
								<select id="cool1_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#cool1_out_temp" class="underline" name="buildChak">냉각수 #1 출구온도</a></th>
							<td>
								<select id="cool1_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#cool2_in_temp" class="underline" name="buildChak">냉각수 #2 입구온도</a></th>
							<td>
								<select id="cool2_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#cool2_out_temp" class="underline" name="buildChak">냉각수 #2 출구온도</a></th>
							<td>
								<select id="cool2_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#cool3_in_temp" class="underline" name="buildChak">냉각수 #3 입구온도</a></th>
							<td>
								<select id="cool3_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#cool3_out_temp" class="underline" name="buildChak">냉각수 #3 출구온도</a></th>
							<td>
								<select id="cool3_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge1_in_temp" class="underline" name="buildChak">냉동기 #1 입구온도</a></th>
							<td>
								<select id="fridge1_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge1_out_temp" class="underline" name="buildChak">냉동기 #1 출구온도</a></th>
							<td>
								<select id="fridge1_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge2_in_temp" class="underline" name="buildChak">냉동기 #2 입구온도</a></th>
							<td>
								<select id="fridge2_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge2_out_temp" class="underline" name="buildChak">냉동기 #2 출구온도</a></th>
							<td>
								<select id="fridge2_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge3_in_temp" class="underline" name="buildChak">냉동기 #3 입구온도</a></th>
							<td>
								<select id="fridge3_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge3_out_temp" class="underline" name="buildChak">냉동기 #3 출구온도</a></th>
							<td>
								<select id="fridge3_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#storagetank_high_temp" class="underline" name="buildChak">축냉조 상부온도</a></th>
							<td>
								<select id="storagetank_high_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#storagetank_low_temp" class="underline" name="buildChak">축냉조 하부온도</a></th>
							<td>
								<select id="storagetank_low_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#brinepump1_out_temp" class="underline" name="buildChak">브라인 펌프 #1 출구온도</a></th>
							<td>
								<select id="brinepump1_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#brinepump2_out_temp" class="underline" name="buildChak">브라인 펌프 #2 출구온도</a></th>
							<td>
								<select id="brinepump2_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#brinepump3_out_temp" class="underline" name="buildChak">브라인 펌프 #3 출구온도</a></th>
							<td>
								<select id="brinepump3_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#brinepumpsb_out_temp" class="underline" name="buildChak">브라인 펌프 SB 출구온도</a></th>
							<td>
								<select id="brinepumpsb_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#brinepump_avg_temp" class="underline" name="buildChak">브라인 펌프 평균온도</a></th>
							<td>
								<select id="brinepump_avg_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#brinepump_mix_temp" class="underline" name="buildChak">브라인 통합믹싱 온도</a></th>
							<td>
								<select id="brinepump_mix_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#coolwater1_in_temp" class="underline" name="buildChak">냉수 #1 입구온도</a></th>
							<td>
								<select id="coolwater1_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#coolwater1_out_temp" class="underline" name="buildChak">냉수 #1 출구온도</a></th>
							<td>
								<select id="coolwater1_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#coolwater2_in_temp" class="underline" name="buildChak">냉수 #2 입구온도</a></th>
							<td>
								<select id="coolwater2_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#coolwater2_out_temp" class="underline" name="buildChak">냉수 #2 출구온도</a></th>
							<td>
								<select id="coolwater2_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#coolwater3_in_temp" class="underline" name="buildChak">냉수 #3 입구온도</a></th>
							<td>
								<select id="coolwater3_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#coolwater3_out_temp" class="underline" name="buildChak">냉수 #3 출구온도</a></th>
							<td>
								<select id="coolwater3_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#heatchange1_in_temp" class="underline" name="buildChak">열교환기 #1 입구온도</a></th>
							<td>
								<select id="heatchange1_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#heatchange2_in_temp" class="underline" name="buildChak">열교환기 #2 입구온도</a></th>
							<td>
								<select id="heatchange2_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#heatchange3_in_temp" class="underline" name="buildChak">열교환기 #3 입구온도</a></th>
							<td>
								<select id="heatchange3_in_temp" name="tagList" style="width: 100%">
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
			<dt>냉수 출구온도설정</dt>
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
							<th scope="row"><a href="#coolwater1_out_set" class="underline" name="buildChak">냉수 #1 출구설정</a></th>
							<td>
								<select id="coolwater1_out_set" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#coolwater2_out_set" class="underline" name="buildChak">냉수 #2 출구설정</a></th>
							<td>
								<select id="coolwater2_out_set" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#coolwater3_out_set" class="underline" name="buildChak">냉수 #3 출구설정</a></th>
							<td>
								<select id="coolwater3_out_set" name="tagList" style="width: 100%">
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
			<dt>냉각수 펌프 SB<a href="#coolpumpsb" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolpumpsb" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolpumpsb_run_yn" name="tagList" style="width: 100%">
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
								<select id="coolpumpsb_auto_yn" name="tagList" style="width: 100%">
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
							<th scope="row"></th>
							<td></td>
						</tr>
						<%-- <tr>
							<th scope="row">야간</th>
							<td>
								<select id="tagList" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">주간</th>
							<td>
								<select id="tagList" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr> --%>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>브라인 펌프 #1<a href="#brinepump1" class="buildLink" name="buildChak"></a></dt>
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
								<select id="brinepump1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="brinepump1_run_yn" name="tagList" style="width: 100%">
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
								<select id="brinepump1_auto_yn" name="tagList" style="width: 100%">
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
			<dt>브라인 펌프 #2<a href="#brinepump2" class="buildLink" name="buildChak"></a></dt>
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
								<select id="brinepump2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="brinepump2_run_yn" name="tagList" style="width: 100%">
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
								<select id="brinepump2_auto_yn" name="tagList" style="width: 100%">
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
			<dt>브라인 펌프 #3<a href="#brinepump3" class="buildLink" name="buildChak"></a></dt>
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
								<select id="brinepump3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="brinepump3_run_yn" name="tagList" style="width: 100%">
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
								<select id="brinepump3_auto_yn" name="tagList" style="width: 100%">
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
			<dt>브라인 펌프 SB<a href="#brinepumpsb" class="buildLink" name="buildChak"></a></dt>
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
								<select id="brinepumpsb" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="brinepumpsb_run_yn" name="tagList" style="width: 100%">
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
								<select id="brinepumpsb_auto_yn" name="tagList" style="width: 100%">
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
			<dt>냉수 순시유량</dt>
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
							<th scope="row"><a href="#coolwater1_inspect_flux" class="underline" name="buildChak">냉수 #1 순시유량</a></th>
							<td>
								<select id="coolwater1_inspect_flux" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#coolwater2_inspect_flux" class="underline" name="buildChak">냉수 #2 순시유량</a></th>
							<td>
								<select id="coolwater2_inspect_flux" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#coolwater3_inspect_flux" class="underline" name="buildChak">냉수 #3 순시유량</a></th>
							<td>
								<select id="coolwater3_inspect_flux" name="tagList" style="width: 100%">
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
			<dt>냉수 펌프 #1<a href="#coolwaterpump1" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolwaterpump1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump1_run_yn" name="tagList" style="width: 100%">
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
								<select id="coolwaterpump1_auto_yn" name="tagList" style="width: 100%">
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
			<dt>냉수 펌프 #2<a href="#coolwaterpump2" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolwaterpump2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump2_run_yn" name="tagList" style="width: 100%">
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
								<select id="coolwaterpump2_auto_yn" name="tagList" style="width: 100%">
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
			<dt>냉수 펌프 #3<a href="#coolwaterpump3" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolwaterpump3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump3_run_yn" name="tagList" style="width: 100%">
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
								<select id="coolwaterpump3_auto_yn" name="tagList" style="width: 100%">
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
			<dt>냉수 펌프 SB<a href="#coolwaterpumpsb" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolwaterpumpsb" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpumpsb_run_yn" name="tagList" style="width: 100%">
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
								<select id="coolwaterpumpsb_auto_yn" name="tagList" style="width: 100%">
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
			<dt>MV1A 밸브<a href="#mv1a" class="buildLink" name="buildChak"></a></dt>
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
								<select id="mv1a_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">역개도</th>
							<td>
								<select id="mv1a_other_per" name="tagList" style="width: 100%">
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
								<select id="mv1a_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv1a_non_auto_output" name="tagList" style="width: 100%">
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
			<dt>MV1B 밸브<a href="#mv1b" class="buildLink" name="buildChak"></a></dt>
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
								<select id="mv1b_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">역개도</th>
							<td>
								<select id="mv1b_other_per" name="tagList" style="width: 100%">
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
								<select id="mv1b_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv1b_non_auto_output" name="tagList" style="width: 100%">
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
			<dt>MV1C 밸브<a href="#mv1c" class="buildLink" name="buildChak"></a></dt>
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
								<select id="mv1c_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">역개도</th>
							<td>
								<select id="mv1c_other_per" name="tagList" style="width: 100%">
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
								<select id="mv1c_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv1c_non_auto_output" name="tagList" style="width: 100%">
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
			<dt>MV2 밸브<a href="#mv2" class="buildLink" name="buildChak"></a></dt>
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
								<select id="mv2_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">역개도</th>
							<td>
								<select id="mv2_other_per" name="tagList" style="width: 100%">
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
								<select id="mv2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv2_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">출구온도설정</th>
							<td>
								<select id="mv2_out_set_temp" name="tagList" style="width: 100%">
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
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
</div>
<!-- e : data_area -->
</div>