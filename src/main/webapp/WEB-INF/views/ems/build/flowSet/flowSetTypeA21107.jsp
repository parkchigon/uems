<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	});
</script>
<div class="blockDiagram_area typeA" style="height: 850px;">
			
	<div class="hw">
		<span class="pipe_hw_ud up pipe001 on" name="pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe002 on" name="pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe003 on" name="pipe1"><em></em></span>
		<span class="pipe_hw_ud down pipe004 on" name="pipe1"><em></em></span>
		
		<span class="pipe_hw_lr right pipe001 on" name="pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe002 on" name="pipe1"><em></em></span>
		<span class="pipe_hw_lr left pipe003 on" name="pipe1"><em></em></span>
		<span class="pipe_hw_lr right pipe004 on" name="pipe1"><em></em></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		
		<span class="pipe_hw_corner_ul corner001"></span>
		
		<span class="pipe_hw_corner_ur corner001"></span>
		
		<span class="pipe_hw_t_lru corner001"></span>
		
		<span class="sensor_u_temperature sensor001"><em id="fridge_cool_out_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em id="fridge_cool_in_temp">12345 ℃</em></span>
		
		<div class="coolingtower no1" id="cooltower_main">
			<div class="one_inner">
				<a href="#layerPop_type1" class="power off" name="modal">정지</a><!-- 모달팝업 -->
				<a href="#layerPop_type9" class="choice on" name="modal">선택중</a>
				<span class="icon_direct direct"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name">냉각탑</strong>
		</div>
		
		<div class="coolingtower no2" id="cooltower_pre">
			<div class="one_inner">
				<a href="#layerPop_type1" class="power off" name="modal">정지</a><!-- 모달팝업 -->
				<a href="#layerPop_type9" class="choice" name="modal">미선택</a>
				<span class="icon_direct direct"></span><!-- 자동일경우 none -->
			</div>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="#" id="coolpump">
				<span class="fan on"></span>
				<span class="icon_direct direct"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
		</div>
	</div>
	
	<div class="chw">
		<span class="pipe_chw_ud down pipe001 on" name="pipe2"></span>
		<span class="pipe_chw_ud down pipe002 on" name="pipe3"><em></em></span>
		<span class="pipe_chw_ud up pipe003 on" name="pipe2"><em></em></span>
		<span class="pipe_chw_ud up pipe004 on" name="pipe4"></span>
		<span class="pipe_chw_ud down pipe005 on" name="pipe5"><em></em></span>
		<span class="pipe_chw_ud down pipe006 on" name="pipe7"></span><!-- 테그네임이 2개임 -->
		<span class="pipe_chw_ud up pipe007 on" name="pipe6"></span>
		<span class="pipe_chw_ud down pipe008 on" name="pipe6"></span>
		
		<span class="pipe_chw_lr left pipe001 on" name="pipe2"><em></em></span>
		<span class="pipe_chw_lr right pipe002 on" name="pipe9"></span>
		<span class="pipe_chw_lr right pipe003 on" name="pipe5"><em></em></span>
		<span class="pipe_chw_lr right pipe004 on" name="pipe3"><em></em></span>
		<span class="pipe_chw_lr right pipe005 on" name="pipe10"></span>
		<span class="pipe_chw_lr right pipe006 on" name="pipe2"></span>
		<span class="pipe_chw_lr right pipe007 on" name="pipe6"></span>
		<span class="pipe_chw_lr right pipe008 on" name="pipe12"></span>
		<span class="pipe_chw_lr right pipe009 on" name="pipe2"><em></em></span>
		<span class="pipe_chw_lr left pipe010 on" name="pipe11"></span>
		<span class="pipe_chw_lr right pipe011 on" name="pipe11"></span>
		
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
		
		<span class="sensor_u_temperature sensor001"><em class="font_sky" id="brinepump_mix_temp">12345 ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_sky" id="brinepump_out_temp">12345 ℃</em></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky" id="fridge_storagetank_out_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky" id="fridge_storagetank_in_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky" id="brinepump_in_temp">12345 ℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky" id="storagetank_high_temp">12345 ℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky" id="storagetank_low_temp">12345 ℃</em></span>
		
		<div class="symbol No1" id="brinepump_inspect_flux"><em>유량:158 ㎡/h</em></div>
		
		<div class="vv-011k No1" id="mv1">
			<a class="btn" href="#layerPop_type2" name="modal"></a>
			<strong class="name">MV1</strong>
			<span class="text_inner text01">100%</span>
			<span class="text_inner text02">50%</span>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="vv-016k No1 off" id="mv2">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV2</strong>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="vv-016k left No2 off" id="mv3">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV3</strong>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="vv-016k left No3 on" id="mv4">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV4</strong>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="vv-016k No4 on" id="mv5">
			<a href="#layerPop_type8" class="power" name="modal">닫힘</a>
			<strong class="name">MV5</strong>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="heat_storaging_tank" id="storagetank_set">
			<span class="bg" style="height:50%;"></span>
			<strong class="text">50%</strong>
			<strong class="text2 up" id="storagetank_charge_state">축냉시</strong>
			<strong class="text2 down" id="storagetank_release_state">방냉시</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1" id="fridge">
				<a href="#layerPop_type7" class="power no1 on" name="modal">가동</a>
				<span class="icon_direct no1 direct"></span>
				<span class="text no1 font_yellow" id="fridge1_compressor_volt">12345.7A</span>
				
				<a href="#layerPop_type7" class="power no2 on" name="modal">가동</a>
				<span class="icon_direct no2 direct"></span>
				<span class="text no2 font_yellow" id="fridge2_compressor_volt">12345.7A</span>
			</div>
			<strong class="text_info" id="fridge_direct">냉동기</strong>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no1 font_yellow" id="brinepump_inv_frequency">12345.0 Hz</strong>
			<a class="coolpump No1" href="#" id="brinepump_main">
				<span class="fan on"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump No2" href="#" id="brinepump_pre">
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<strong class="text_info no2">브라인 펌프</strong>
		</div>
	</div>
	
	<div class="glycol">
		<div class="hx_plate_v"></div>
		
		<span class="pipe_glycol_ud down pipe001 on" name="pipe13"><em></em></span>
		<span class="pipe_glycol_ud up pipe002 on" name="pipe13"><em></em></span>
		
		<span class="pipe_glycol_lr left pipe001 on" name="pipe13"><em></em></span>
		<span class="pipe_glycol_lr right pipe002 on" name="pipe13"><em></em></span>
		<span class="pipe_glycol_lr left pipe003 on" name="pipe13"></span>
		<span class="pipe_glycol_lr right pipe004 on" name="pipe13"></span>
		
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow" id="coolwater_in_temp">12345 ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow" id="coolwater_out_temp">12345 ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump no1" href="#" id="coolwaterpump_pre">
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump no2" href="#" id="coolwaterpump_main">
				<span class="fan off"></span>
				<span class="icon_direct direct"></span>
			</a>
			<strong class="text_info">냉수 펌프</strong>
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
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉각수 펌프 메인<a href="#coolpump" class="buildLink" name="buildChak"></a></dt>
			
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
								<select id="coolpump" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolpump_auto_yn" name="tagList" style="width: 100%">
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
								<select id="coolpump_run_yn" name="tagList" style="width: 100%">
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
			<dt>냉각탑 메인<a href="#cooltower_main" class="buildLink" name="buildChak"></a></dt>
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
								<select id="cooltower_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower_main_auto_yn" name="tagList" style="width: 100%">
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
								<select id="cooltower_main_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">메인 선택</th>
							<td>
								<select id="cooltower_main_use" name="tagList" style="width: 100%">
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
			<dt>냉각탑 예비<a href="#cooltower_pre" class="buildLink" name="buildChak"></a></dt>
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
								<select id="cooltower_pre" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower_pre_auto_yn" name="tagList" style="width: 100%">
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
								<select id="cooltower_pre_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">예비 선택</th>
							<td>
								<select id="cooltower_pre_use" name="tagList" style="width: 100%">
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
			<dt>냉수펌프 메인<a href="#coolwaterpump_main" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolwaterpump_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump_main_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						<tr>
						</tr>
							<th scope="row">기동/정지</th>
							<td>
								<select id="coolwaterpump_main_run_yn" name="tagList" style="width: 100%">
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
			<dt>냉동기<a href="#fridge" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">냉동기 #1 RUN</th>
							<td>
								<select id="fridge1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">냉동기 #1 수동/자동</th>
							<td>
								<select id="fridge1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 #1 기동/정지</th>
							<td>
								<select id="fridge1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">냉동기 #1 야간</th>
							<td>
								<select id="fridge1_night_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 #1 주간</th>
							<td>
								<select id="fridge1_day_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">압축기 #1 전류</th>
							<td>
								<select id="fridge1_compressor_volt" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 #2 RUN</th>
							<td>
								<select id="fridge2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">냉동기 #2 수동/자동</th>
							<td>
								<select id="fridge2_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 #2 기동/정지</th>
							<td>
								<select id="fridge2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">냉동기 #2 야간</th>
							<td>
								<select id="fridge2_night_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 #2 주간</th>
							<td>
								<select id="fridge2_day_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">압축기 #2 전류</th>
							<td>
								<select id="fridge2_compressor_volt" name="tagList" style="width: 100%">
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
			<dt>냉동기 직기동<a href="#fridge_direct" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">냉동기 #1 직기동</th>
							<td>
								<select id="fridge1_compressor_run" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">냉동기 #2 직기동</th>
							<td>
								<select id="fridge2_compressor_run" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						<tr>
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
							<th scope="row"><a href="#coolwater_in_temp" class="underline" name="buildChak">냉수 입구온도</a></th>
							<td>
								<select id="coolwater_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#coolwater_out_temp" class="underline" name="buildChak">냉수 출구온도</a></th>
							<td>
								<select id="coolwater_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge_cool_in_temp" class="underline" name="buildChak">냉동기 냉각수 입구온도</a></th>
							<td>
								<select id="fridge_cool_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge_cool_out_temp" class="underline" name="buildChak">냉동기 냉각수 출구온도</a></th>
							<td>
								<select id="fridge_cool_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#fridge_storagetank_in_temp" class="underline" name="buildChak">냉동기 축냉 입구온도</a></th>
							<td>
								<select id="fridge_storagetank_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#fridge_storagetank_out_temp" class="underline" name="buildChak">냉동기 축냉 출구온도</a></th>
							<td>
								<select id="fridge_storagetank_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#brinepump_in_temp" class="underline" name="buildChak">브라인 입구온도</a></th>
							<td>
								<select id="brinepump_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#brinepump_out_temp" class="underline" name="buildChak">브라인 출구온도</a></th>
							<td>
								<select id="brinepump_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#brinepump_mix_temp" class="underline" name="buildChak">브라인 통합믹싱 온도</a></th>
							<td>
								<select id="brinepump_mix_temp" name="tagList" style="width: 100%">
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
			<dt>브라인펌프 메인<a href="#brinepump_main" class="buildLink" name="buildChak"></a></dt>
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
								<select id="brinepump_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="brinepump_main_auto_yn" name="tagList" style="width: 100%">
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
								<select id="brinepump_main_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">인버터 수동주파수설정</th>
							<td>
								<select id="brinepump_main_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#brinepump_inv_frequency" class="underline" name="buildChak">INV 주파수</a></th>
							<td>
								<select id="brinepump_inv_frequency" name="tagList" style="width: 100%">
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
			<dt>브라인펌프 예비<a href="#brinepump_pre" class="buildLink" name="buildChak"></a></dt>
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
								<select id="brinepump_pre" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="brinepump_pre_auto_yn" name="tagList" style="width: 100%">
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
								<select id="brinepump_pre_run_yn" name="tagList" style="width: 100%">
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
							<th scope="row"><a href="#brinepump_inspect_flux" class="underline" name="buildChak">브라인 순시유량</a></th>
							<td>
								<select id="brinepump_inspect_flux" name="tagList" style="width: 100%">
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
							<th scope="row">MV1 개도</th>
							<td>
								<select id="mv1_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">MV1 역개도</th>
							<td>
								<select id="mv1_other_per" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">자동/수동</th>
							<td>
								<select id="mv1_auto_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동출력</th>
							<td>
								<select id="mv1_non_auto_output" name="tagList" style="width: 100%">
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
			<dt>MV2<a href="#mv2" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">MV2</th>
							<td>
								<select id="mv2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">자동/수동</th>
							<td>
								<select id="mv2_auto_yn" name="tagList" style="width: 100%">
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
								<select id="mv2_open_yn" name="tagList" style="width: 100%">
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
			<dt>MV3<a href="#mv3" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">MV3</th>
							<td>
								<select id="mv3" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">자동/수동</th>
							<td>
								<select id="mv3_auto_yn" name="tagList" style="width: 100%">
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
								<select id="mv3_open_yn" name="tagList" style="width: 100%">
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
			<dt>MV4<a href="#mv4" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">MV4</th>
							<td>
								<select id="mv4" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">자동/수동</th>
							<td>
								<select id="mv4_auto_yn" name="tagList" style="width: 100%">
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
								<select id="mv4_open_yn" name="tagList" style="width: 100%">
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
			<dt>MV5<a href="#mv5" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">MV5</th>
							<td>
								<select id="mv5" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">자동/수동</th>
							<td>
								<select id="mv5_auto_yn" name="tagList" style="width: 100%">
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
								<select id="mv5_open_yn" name="tagList" style="width: 100%">
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
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe7',1)" onmouseout="pipeChak('pipe7',0)" class="underline">배관7(우)</a></th>
							<td>
								<select id="pipe7" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe7',1)" onmouseout="pipeChak('pipe7',0)" class="underline">배관8(좌)</a></th>
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
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>축열조 설정<a href="#storagetank_set" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">축열조 축열량</th>
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
							<th scope="row"><a href="#storagetank_charge_state" class="underline" name="buildChak">축냉시(펌프선택)</a></th>
							<td>
								<select id="storagetank_charge_state" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#storagetank_release_state" class="underline" name="buildChak">방냉시(펌프선택)</a></th>
							<td>
								<select id="storagetank_release_state" name="tagList" style="width: 100%">
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
</div>
<!-- e : data_area -->
