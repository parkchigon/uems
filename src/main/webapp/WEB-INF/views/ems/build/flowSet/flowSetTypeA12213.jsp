<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	});
</script>
<div class="blockDiagram_area typeA" style="height: 850px;">

	<div class="hw">
		<span class="pipe_hw_ud down pipe002 on" name="pipe01"><em></em></span>
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_lr right pipe002 on" name="pipe01"><em></em></span>
		<span class="pipe_hw_t_lrd corner001"></span>
		<span class="pipe_hw_ud down pipe003 on" name="pipe02"></span>
		<span class="pipe_hw_t_udr corner001"></span>
		<span class="pipe_hw_lr right pipe004 on" name="pipe03"></span>
		<span class="pipe_hw_corner_ul corner001"></span>
		<span class="pipe_hw_ud down pipe005 on" name="pipe03"></span>
		<span class="pipe_hw_corner_dl corner002"></span>
		<span class="pipe_hw_lr left pipe005 on" name="pipe03"></span>
		<span class="pipe_hw_ud down pipe004 on" name="pipe01"><em></em></span>
		<span class="pipe_hw_corner_dl corner001"></span>
		<span class="pipe_hw_lr left pipe003 on" name="pipe01"><em></em></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_ud up pipe001 on" name="pipe01"><em></em></span>
		<span class="pipe_hw_corner_ur corner001"></span>
		<span class="pipe_hw_lr right pipe001 on" name="pipe01"><em></em></span>
		
		
		<span class="sensor_u_temperature sensor001"><em id="fridge_cool_out_temp"><span></span>12345℃</em></span>
		<span class="sensor_u_temperature sensor002"><em id="fridge_cool_in_temp"><span></span>12345℃</em></span>
		
		<div class="coolingtower" id="cooltower">
			<div class="one_inner">
				<a href="#" class="power off">정지</a><!-- 모달팝업 -->
				<span class="icon_direct"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name">냉각탑</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud No1" href="#" id="coolpump_main">
				<span class="fan on"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct"></span>
			</a>
			<a class="coolpump ud No2" href="#" id="coolpump_pre">
				<span class="fan on"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct"></span>
			</a>
			<strong class="text_info">냉각수<br />펌프</strong>
			<a href="#" class="pumpchoice no1" id="coolpump_work_select">선택</a>
		</div>
	</div>
	
	<div class="chw">
	
		<span class="pipe_chw_lr left pipe001 on" name="pipe21"></span>
		<span class="pipe_chw_corner_ur corner001"></span>
		<span class="pipe_chw_ud down pipe001 on" name="pipe21"><em></em></span>
		<span class="pipe_chw_corner_dr corner002"></span>
		<span class="pipe_chw_lr right pipe006 on" name="pipe21"><em></em></span>
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_ud up pipe005 on" name="doubleTag"></span><!-- 테그네임이 2개임 -->
		<span class="pipe_chw_lr right pipe007 on" name="pipe22"><em></em></span>
		<span class="pipe_chw_t_lru corner002"></span>
		<span class="pipe_chw_lr right pipe009 on" name="pipe24"></span>
		<span class="pipe_chw_t_lru corner003"></span>
		<span class="pipe_chw_ud up pipe006 on" name="pipe23"></span>
		<span class="pipe_chw_corner_ur corner002"></span>
		<span class="pipe_chw_lr right pipe008 on" name="pipe23"></span>
		<span class="pipe_chw_corner_ul corner003"></span>
		<span class="pipe_chw_ud down pipe007 on" name="pipe23"></span>
		<span class="pipe_chw_lr right pipe010 on" name="pipe22"></span>
		<span class="pipe_chw_corner_dl corner002"></span>
		<span class="pipe_chw_ud up pipe009 on" name="pipe22"><em></em></span>
		<span class="pipe_chw_corner_ur corner003"></span>
		<span class="pipe_chw_lr right pipe012 on" name="pipe22"></span>
		<span class="pipe_chw_lr left pipe011 on" name="pipe22"></span>
		<span class="pipe_chw_corner_dr corner003"></span>
		<span class="pipe_chw_ud up pipe008 on" name="pipe22"><em></em></span>
		<span class="pipe_chw_corner_ul corner002"></span>
		<span class="pipe_chw_lr left pipe004 on" name="pipe22"><em></em></span>
		<span class="pipe_chw_t_lrd corner002"></span>
		<span class="pipe_chw_lr left pipe003 on" name="pipe21"></span>
		<span class="pipe_chw_t_lrd corner001"></span>
		<span class="pipe_chw_lr left pipe002 on" name="pipe25"></span>
		<span class="pipe_chw_t_udr corner001"></span>
		<span class="pipe_chw_ud down pipe004 on" name="pipe26"></span>
		<span class="pipe_chw_corner_dl corner001"></span>
		<span class="pipe_chw_lr left pipe005 on" name="pipe26"></span>
		<span class="pipe_chw_corner_dr corner001"></span>
		<span class="pipe_chw_ud up pipe003 on" name="pipe26"></span>
		<span class="pipe_chw_ud up pipe002 on" name="pipe21"></span>
		<span class="pipe_chw_corner_ul corner001"></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky" id="fridge_storagetank_out_temp"><span></span>12345℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky" id="fridge_storagetank_in_temp"><span></span>12345℃</em></span>
		
		<span class="sensor_r_temperature sensor001"><em class="font_sky" id="storagetank_high_temp"><span></span>12345℃</em></span>
		<span class="sensor_r_temperature sensor002"><em class="font_sky" id="storagetank_low_temp"><span></span>12345℃</em></span>
		
		<span class="sensor_l_temperature sensor001"><em class="font_sky" id="icestorage_out_temp"><span></span>12345℃</em></span>
		<span class="sensor_l_temperature sensor002"><em class="font_sky" id="icestorage_in_temp"><span></span>12345℃</em></span>
		
		<div class="symbol No1"><em id="radiant_heat_inspect_flux"><span></span>12345㎡/h</em></div>
		<div class="symbol No2"><em id="heatstorage_inspect_flux"><span></span>12345㎡/h</em></div>
		
		<div class="vv-016k No1 off" id="mv1">
			<a href="#" class="power">닫힘</a>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="vv-016k No2 off" id="mv2">
			<a href="#" class="power">닫힘</a>
			<span class="icon_direct direct"></span>
		</div>
		
		<div class="heat_storaging_tank" id="storagetank_set">
			<span class="bg" style="height:0%;"></span>
			<strong class="text"><span></span>%</strong>
			<strong class="text2 up" id="storagetank_charge_state">축냉시</strong>
			<strong class="text2 down" id="storagetank_release_state">방냉시</strong>
		</div>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1" id="fridge">
				<a href="#" class="power no1 on">정지</a>
				<span class="icon_direct no1 auto"></span>
				<span class="text no1 font_yellow" id="fridge1_compressor_volt"><span></span>123A</span>
				
				<a href="#;" class="power no2 on">정지</a>
				<span class="icon_direct no2 auto"></span>
				<span class="text no2 font_yellow" id="fridge2_compressor_volt"><span></span>123A</span>
			</div>
			<strong class="text_info power no3 setPop" id="fridge_direct"> 냉동기</strong>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump No1" href="#" id="storagetankpump_main">
				<span class="fan on"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto"></span>
			</a>
			<a class="coolpump No2" href="#" id="storagetankpump_pre">
				<span class="fan on"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto"></span>
			</a>
			<strong class="text_info no2">축냉 펌프</strong>
			<a href="#" class="pumpchoice no2" id="storagetankpump_work_select">선택</a>
		</div>
		
		<div class="coolpump_area">
			<strong class="text_info no3 font_yellow" id="icestoragepump_main_inv_frequency"><span></span>12345.0 Hz</strong>
			<a class="coolpump No3" href="#" id="icestoragepump_main">
				<span class="fan on"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto"></span>
			</a>
			<strong class="text_info no4 font_yellow" id="icestoragepump_pre_inv_frequency"><span></span>12345.0 Hz</strong>
			<a class="coolpump No4" href="#" id="icestoragepump_pre">
				<span class="fan on"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto"></span>
			</a>
			<strong class="text_info no5">방냉 펌프</strong>
			<a href="#" class="pumpchoice no3" id="icestoragepump_work">선택</a>
		</div>
	</div>
	
	
	<div class="glycol"> <!-- 빙축열 헤더부 pipe -->
		<div class="hx_plate_v"></div>
		
		<span class="pipe_glycol_lr right pipe004 on" name="pipe41"></span>
		<span class="pipe_glycol_ud up pipe002 on" name="pipe41"><em></em></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		<span class="pipe_glycol_ud down pipe003 on" name="pipe41"></span>
		<span class="pipe_glycol_t_udr corner001"></span>
		<span class="pipe_glycol_ud down pipe004 on" name="pipe42"></span>
		<span class="pipe_glycol_t_udr corner002"></span>
		<span class="pipe_glycol_lr right pipe005 on" name="pipe43"></span>
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_ud down pipe006 on" name="pipe43"></span>
		<span class="pipe_glycol_corner_dl corner003"></span>
		<span class="pipe_glycol_lr left pipe006 on" name="pipe43"></span>
		<span class="pipe_glycol_ud down pipe005 on" name="pipe41"></span>
		<span class="pipe_glycol_corner_dr corner001"></span>
		<span class="pipe_glycol_lr right pipe007 on" name="pipe41"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_ud down pipe001 on" name="pipe41"><em></em></span>
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_lr left pipe003 on" name="pipe41"></span>
		
		<!-- 
		<span class="pipe_glycol_ud up pipe004 on" name="DI_6113"></span>
		<span class="pipe_glycol_ud down pipe005 on" name="DI_6113"></span>
		 -->
		<span class="pipe_glycol_lr right pipe002 on" name="DI_6112"></span><!-- 확인?? -->
		
		<span class="sensor_u_temperature sensor001"><em class="font_yellow" id="coolwater_in_temp">123℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow" id="coolwater_out_temp">123℃</em></span>

	</div>
	
	
	<div class="glycol">
		<!-- 흡수식냉온수기#1 pipe -->
		<span class="pipe_glycol_lr right pipe107 on" name="pipe61"><em></em></span>
		<span class="pipe_glycol_corner_dl corner103"></span>
		<span class="pipe_glycol_ud up pipe108 on" name="pipe61"></span>
		<span class="pipe_glycol_ud down pipe101 on" name="pipe61"></span>
		<span class="pipe_glycol_t_udr corner101"></span>
		<span class="pipe_glycol_ud down pipe103 on" name="pipe61"></span><!-- 다른태그에 의해 동작 -->
		<span class="pipe_glycol_t_udr corner102"></span>
		<span class="pipe_glycol_corner_dl corner101"></span>
		<span class="pipe_glycol_lr left pipe105 on" name="pipe61"><em></em></span>
		
		<!-- 흡수식냉온수기#2 pipe -->
		<span class="pipe_glycol_lr right pipe108 on" name="pipe63"><em></em></span>
		<span class="pipe_glycol_corner_dl corner104"></span>
		<span class="pipe_glycol_ud up pipe109 on" name="pipe63"></span>
		<span class="pipe_glycol_ud down pipe102 on" name="pipe63"></span>
		<span class="pipe_glycol_t_udl corner101"></span>
		<span class="pipe_glycol_ud down pipe105" name="pipe63"></span><!-- 다른태그에 의해 동작 -->
		<span class="pipe_glycol_t_udl corner102"></span>
		<span class="pipe_glycol_ud down pipe107 on" name="pipe63"></span>
		<span class="pipe_glycol_corner_dl corner102"></span>
		<span class="pipe_glycol_lr left pipe106 on" name="pipe63"><em></em></span>

		<!-- SB펌프관련 pipe -->	
		<span class="pipe_glycol_lr left pipe101"></span>
		<span class="pipe_glycol_t_lrd corner101"></span>
		<span class="pipe_glycol_ud down pipe104 on" name="pipe62"></span><!-- 다른태그에 의해 동작 -->
		<span class="pipe_glycol_t_lru corner101"></span>
		<span class="pipe_glycol_lr right pipe103"></span>
		
	
		<span class="sensor_u_temperature sensor003"><em id="absorb1_in_temp"><span></span>12345℃</em></span>
		<span class="sensor_d_temperature sensor005"><em class="font_sky" id="absorb1_out_temp"><span></span>12345℃</em></span>
		<span class="sensor_u_temperature sensor004"><em id="absorb2_in_temp"><span></span>12345℃</em></span>
		<span class="sensor_d_temperature sensor006"><em class="font_sky" id="absorb2_out_temp"><span></span>12345℃</em></span>		
				
		<div class="symbol No3"><em id="absorb1_inspect_flux"><span></span>12345㎡/h</em></div>					
		<div class="symbol No4"><em id="absorb2_inspect_flux"><span></span>12345㎡/h</em></div>
		
		<div class="coolpump_area">
			<a class="coolpump ud no1" href="#" id="coolwaterpump_main">
				<span class="fan on"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct auto"></span>
			</a>
			<a class="coolpump ud no2" href="#" id="coolwaterpump_pre">
				<span class="fan on"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct auto"></span>
			</a>
			<strong class="text_info no101">냉수 펌프</strong>
			<a href="#" class="pumpchoice no4" id="coolwaterpump_work_select">선택</a>
		</div>
		
		<div class="coolpump_area">
			<a class="coolpump ud no101">
				<span class="fan on" id="absorb_pump1"></span>
				<strong class="name">#1</strong>
				<!-- <span class="icon_direct direct"></span> -->
			</a>
			<a class="coolpump ud no102">
				<span class="fan on" id="absorb_pumpsb"></span>
				<strong class="name">SB</strong>
				<!-- <span class="icon_direct direct"></span> -->
			</a>
			<a class="coolpump ud no103">
				<span class="fan on" id="absorb_pump2"></span>
				<strong class="name">#2</strong>
				<!-- <span class="icon_direct direct"></span> -->
			</a>
			<strong class="text_info no102">냉각수 펌프</strong>
		</div>


		<div class="header_lr No1">환 수 헤 더<em></em></div>
		<div class="header_lr No2">공 급 헤 더<em></em></div>

	</div>
	
<div class="refrigerating_machine_area">
		<div class="refrigerating_machine No1">
			<strong class="name">#1</strong>
			<span class="power no1 on" id="absorb1">정지</span>
		</div>
		<div class="refrigerating_machine No2">
			<strong class="name">#2</strong>
			<span class="power no2 on" id="absorb2">정지</span>
		</div>
		<strong class="text_info">흡수식냉온수기</strong>
	</div>
	
	<!-- 201710 추가 -->
	<div class="innerPop pop1" id="absorb1_gas">
		<dl>
			<dt>가스량</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="100%" />
					</colgroup>
					<tbody>
						<tr>
							<td><span></span>N㎥</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>

	<div class="innerPop pop3" id="absorb_inspect_elec">
		<dl>
			<dt>전력량</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="100%" />
					</colgroup>
					<tbody>
						<tr>
							<td><span></span>kW</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="innerPop pop2" id="absorb2_gas">
		<dl>
			<dt>가스량</dt>
			<dd>
				<table class="pop_row">
					<colgroup>
						<col width="100%" />
					</colgroup>
					<tbody>
						<tr>
							<td><span></span>N㎥</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
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
			<dt>냉각수펌프 메인<a href="#coolpump_main" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolpump_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolpump_main_auto_yn" name="tagList" style="width: 100%">
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
								<select id="coolpump_main_run_yn" name="tagList" style="width: 100%">
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
			<dt>냉각수펌프 예비<a href="#coolpump_pre" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolpump_pre" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolpump_pre_auto_yn" name="tagList" style="width: 100%">
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
								<select id="coolpump_pre_run_yn" name="tagList" style="width: 100%">
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
			<dt>냉각수펌프 운전선택<a href="#coolpump_select" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">메인선택</th>
							<td>
								<select id="coolpump_work_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">예비선택</th>
							<td>
								<select id="coolpump_work_pre" name="tagList" style="width: 100%">
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
			<dt>냉각탑<a href="#cooltower" class="buildLink" name="buildChak"></a></dt>
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
								<select id="cooltower" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="cooltower_auto_yn" name="tagList" style="width: 100%">
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
								<select id="cooltower_run_yn" name="tagList" style="width: 100%">
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
			<dt>냉수펌프 예비<a href="#coolwaterpump_pre" class="buildLink" name="buildChak"></a></dt>
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
								<select id="coolwaterpump_pre" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="coolwaterpump_pre_auto_yn" name="tagList" style="width: 100%">
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
								<select id="coolwaterpump_pre_run_yn" name="tagList" style="width: 100%">
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
			<dt>냉수펌프 운전선택<a href="#coolwaterpump_work_select" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">메인선택</th>
							<td>
								<select id="coolwaterpump_work_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">예비선택</th>
							<td>
								<select id="coolwaterpump_work_pre" name="tagList" style="width: 100%">
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
							<th scope="row"><a href="#fridge1_compressor_volt" class="underline" name="buildChak">압축기 #1 전류</a></th>
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
							<th scope="row"><a href="#fridge2_compressor_volt" class="underline" name="buildChak">압축기 #2 전류</a></th>
							<td>
								<select id="fridge1_compressor_volt" name="tagList" style="width: 100%">
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
							<th scope="row">압축기 #1 직기동</th>
							<td>
								<select id="fridge1_compressor_run" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">압축기 #2 직기동</th>
							<td>
								<select id="fridge2_compressor_run" name="tagList" style="width: 100%">
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
							<th scope="row"><a href="#icestorage_in_temp" class="underline" name="buildChak">방냉입구온도</a></th>
							<td>
								<select id="icestorage_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#icestorage_out_temp" class="underline" name="buildChak">방냉출구온도</a></th>
							<td>
								<select id="icestorage_out_temp" name="tagList" style="width: 100%">
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
			<dt>방냉 펌프 메인<a href="#icestoragepump_main" class="buildLink" name="buildChak"></a></dt>
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
								<select id="icestoragepump_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="icestoragepump_main_auto_yn" name="tagList" style="width: 100%">
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
								<select id="icestoragepump_main_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">인버터 수동주파수설정</th>
							<td>
								<select id="icestoragepump_main_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#icestoragepump_main_inv_frequency" class="underline" name="buildChak">INV 주파수</a></th>
							<td>
								<select id="icestoragepump_main_inv_frequency" name="tagList" style="width: 100%">
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
			<dt>방냉펌프 예비<a href="#icestoragepump_pre" class="buildLink" name="buildChak"></a></dt>
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
								<select id="icestoragepump_pre" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="icestoragepump_pre_auto_yn" name="tagList" style="width: 100%">
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
								<select id="icestoragepump_pre_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">인버터 수동주파수설정</th>
							<td>
								<select id="icestoragepump_pre_non_auto_output" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#icestoragepump_pre_inv_frequency" class="underline" name="buildChak">INV 주파수</a></th>
							<td>
								<select id="icestoragepump_pre_inv_frequency" name="tagList" style="width: 100%">
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
			<dt>방냉펌프 운전선택<a href="#icestoragepump_work" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">메인선택</th>
							<td>
								<select id="icestoragepump_work_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">예비선택</th>
							<td>
								<select id="icestoragepump_work_pre" name="tagList" style="width: 100%">
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
							<th scope="row"><a href="#heatstorage_inspect_flux" class="underline" name="buildChak">축열순시유량</a></th>
							<td>
								<select id="heatstorage_inspect_flux" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#radiant_heat_inspect_flux" class="underline" name="buildChak">방열순시유량</a></th>
							<td>
								<select id="radiant_heat_inspect_flux" name="tagList" style="width: 100%">
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
							<th scope="row">자동/수동</th>
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
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe01',1)" onmouseout="pipeChak('pipe01',0)" class="underline">배관01</a></th>
							<td>
								<select id="pipe01" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe02',1)" onmouseout="pipeChak('pipe02',0)" class="underline">배관02</a></th>
							<td>
								<select id="pipe02" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe03',1)" onmouseout="pipeChak('pipe03',0)" class="underline">배관03</a></th>
							<td>
								<select id="pipe03" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe21',1)" onmouseout="pipeChak('pipe21',0)" class="underline">배관21</a></th>
							<td>
								<select id="pipe21" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe22',1)" onmouseout="pipeChak('pipe22',0)" class="underline">배관22</a></th>
							<td>
								<select id="pipe22" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe23',1)" onmouseout="pipeChak('pipe23',0)" class="underline">배관23</a></th>
							<td>
								<select id="pipe23" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe24',1)" onmouseout="pipeChak('pipe24',0)" class="underline">배관24</a></th>
							<td>
								<select id="pipe24" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe25',1)" onmouseout="pipeChak('pipe25',0)" class="underline">배관25</a></th>
							<td>
								<select id="pipe25" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe26',1)" onmouseout="pipeChak('pipe26',0)" class="underline">배관26</a></th>
							<td>
								<select id="pipe26" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('doubleTag',1)" onmouseout="pipeChak('doubleTag',0)" class="underline">배관27(좌측)</a></th>
							<td>
								<select id="pipe27" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('doubleTag',1)" onmouseout="pipeChak('doubleTag',0)" class="underline">배관28(우측)</a></th>
							<td>
								<select id="pipe28" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe41',1)" onmouseout="pipeChak('pipe41',0)" class="underline">배관41</a></th>
							<td>
								<select id="pipe41" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe42',1)" onmouseout="pipeChak('pipe42',0)" class="underline">배관42</a></th>
							<td>
								<select id="pipe42" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe43',1)" onmouseout="pipeChak('pipe43',0)" class="underline">배관43</a></th>
							<td>
								<select id="pipe43" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe61',1)" onmouseout="pipeChak('pipe61',0)" class="underline">배관61</a></th>
							<td>
								흡수식 냉각수펌프 #1
							</td>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe62',1)" onmouseout="pipeChak('pipe62',0)" class="underline">배관62</a></th>
							<td>
								흡수식냉각수펌프 #sb
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" onmouseover="pipeChak('pipe63',1)" onmouseout="pipeChak('pipe63',0)" class="underline">배관63</a></th>
							<td>
								흡수식 냉각수펌프 #2
							</td>
						</tr>							
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>축냉펌프 메인<a href="#storagetankpump_main" class="buildLink" name="buildChak"></a></dt>
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
								<select id="storagetankpump_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="storagetankpump_main_auto_yn" name="tagList" style="width: 100%">
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
								<select id="storagetankpump_main_run_yn" name="tagList" style="width: 100%">
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
			<dt>축냉펌프 예비<a href="#storagetankpump_pre" class="buildLink" name="buildChak"></a></dt>
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
								<select id="storagetankpump_pre" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">수동/자동</th>
							<td>
								<select id="storagetankpump_pre_auto_yn" name="tagList" style="width: 100%">
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
								<select id="storagetankpump_pre_run_yn" name="tagList" style="width: 100%">
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
			<dt>축냉펌프 운전선택<a href="#storagetankpump_work_select" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">메인선택</th>
							<td>
								<select id="storagetankpump_work_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">예비선택</th>
							<td>
								<select id="storagetankpump_work_pre" name="tagList" style="width: 100%">
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

	<div class="data_area_inner mt10">
		<dl>
			<dt>흡수식냉온수기</dt>
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
							<th scope="row"><a href="#absorb_inspect_elec" class="underline" name="buildChak">순시전력량</a></th>
							<td>
								<select id="absorb_inspect_elec" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb1" class="underline" name="buildChak">#1 기동/정지</a></th>
							<td>
								<select id="absorb1" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#absorb1_gas" class="underline" name="buildChak">#1 가스유량</a></th>
							<td>
								<select id="absorb1_gas" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb1_inspect_flux" class="underline" name="buildChak">#1 순시유량</a></th>
							<td>
								<select id="absorb1_inspect_flux" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#absorb1_in_temp" class="underline" name="buildChak">#1 입구온도</a></th>
							<td>
								<select id="absorb1_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb1_out_temp" class="underline" name="buildChak">#1 출구온도</a></th>
							<td>
								<select id="absorb1_out_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#absorb2" class="underline" name="buildChak">#2 기동/정지</a></th>
							<td>
								<select id="absorb2" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb2_gas" class="underline" name="buildChak">#2 가스유량</a></th>
							<td>
								<select id="absorb2_gas" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#absorb2_inspect_flux" class="underline" name="buildChak">#2 순시유량</a></th>
							<td>
								<select id="absorb2_inspect_flux" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb2_in_temp" class="underline" name="buildChak">#2 입구온도</a></th>
							<td>
								<select id="absorb2_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#absorb2_out_temp" class="underline" name="buildChak">#2 출구온도</a></th>
							<td>
								<select id="absorb2_out_temp" name="tagList" style="width: 100%">
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
			<dt>흡수식냉온수기 펌프</dt>
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
							<th scope="row"><a href="#absorb_pump1" class="underline" name="buildChak">냉각수#1 기동/정지</a></th>
							<td>
								<select id="absorb_coolpump1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb_pump1" class="underline" name="buildChak">냉온수#1 기동/정지</a></th>
							<td>
								<select id="absorb_heatpump1_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#absorb_pump2" class="underline" name="buildChak">냉각수#2 기동/정지</a></th>
							<td>
								<select id="absorb_coolpump2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb_pump2" class="underline" name="buildChak">냉온수#2 기동/정지</a></th>
							<td>
								<select id="absorb_heatpump2_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><a href="#absorb_pumpsb" class="underline" name="buildChak">냉각수#SB 기동/정지</a></th>
							<td>
								<select id="absorb_coolpumpsb_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#absorb_pumpsb" class="underline" name="buildChak">냉온수#SB 기동/정지</a></th>
							<td>
								<select id="absorb_heatpumpsb_run_yn" name="tagList" style="width: 100%">
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
</div>
<!-- e : data_area -->
