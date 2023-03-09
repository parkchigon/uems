<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		$('.switch').click(function(){
			if($(this).hasClass('disabled') == false) {
				if($(this).hasClass('on')) {
					$(this).find('.stop').show();
					$(this).find('.start').hide();
					$(this).removeClass('on').addClass('off');
					$(this).prev('.lamp').removeClass('on').addClass('off');
				} else if($(this).hasClass('off')){
					$(this).find('.start').show();
					$(this).find('.stop').hide();
					$(this).removeClass('off').addClass('on');
					$(this).prev('.lamp').removeClass('off').addClass('on');
				}
			};
		});	
		
		// 실시간 태그 값 조회
		selectTagValue();
	});

	/* 삭제하지 말것 */
	function checkDoublePipe() {
	}

</script>
<!-- s : content_area -->
<div id="content_area">
	<div class="subTab_area">
		<ul>
			<c:forEach var="result" items="${subMenulist}" varStatus="status">
				<c:if test="${result.menuFlag eq 'Y'}">
					<c:if test="${result.submenuId eq subMenu}">
						<li class="on">
					</c:if>
					<c:if test="${result.submenuId ne subMenu}">
						<li>
					</c:if>
						<a href="javascript:emsMainTab('${result.submenuId}');">${result.submenuName}</a>
					</li>				
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div class="blockDiagram_area">
	
		<div class="hw">
			<span class="pipe_hw_ud pipe001"></span>
			<span class="pipe_hw_ud pipe002"></span>
			<span class="pipe_hw_ud pipe003"></span>
			
			<span class="pipe_hw_lr pipe001"></span>
			<span class="pipe_hw_lr pipe002"></span>
			<span class="pipe_hw_lr pipe003"></span>
			<span class="pipe_hw_lr pipe004"></span>
			<span class="pipe_hw_lr pipe005"></span>
			<span class="pipe_hw_lr pipe006"></span>
			
			<span class="pipe_hw_corner_ur corner001"></span>
			<span class="pipe_hw_corner_ur corner002"></span>
			<span class="pipe_hw_corner_ur corner003"></span>
			
			<span class="pipe_hw_corner_dl corner001"></span>
			<span class="pipe_hw_corner_dl corner002"></span>
			<span class="pipe_hw_corner_dl corner003"></span>
			
			<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="T06001_coolwater1_in_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor002"><em class="font_yellow"><span id="T06001_coolwater2_in_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor003"><em class="font_yellow"><span id="T06001_coolwater3_in_temp"></span> ℃</em></span>
			
		</div>
		
		
		<div class="glycol">
			<span class="pipe_glycol_ud pipe001"></span>
			<span class="pipe_glycol_ud pipe002"></span>
			
			<span class="pipe_glycol_lr pipe001"></span>
			<span class="pipe_glycol_lr pipe002"></span>
			<span class="pipe_glycol_lr pipe003"></span>
			<span class="pipe_glycol_lr pipe004"></span>
			<span class="pipe_glycol_lr pipe005"></span>
			
			<span class="pipe_glycol_corner_ul corner001"></span>
			<span class="pipe_glycol_corner_ul corner002"></span>
			<span class="pipe_glycol_corner_dr corner001"></span>
			<span class="pipe_glycol_corner_dr corner002"></span>
			
			<span class="sensor_d_temperature sensor001"><em class="font_yellow"><span id="T06001_coolwater1_out_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="T06001_coolwater2_out_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor003"><em class="font_yellow"><span id="T06001_coolwater3_out_temp"></span> ℃</em></span>
			
			<div class="symbol No1"><em class="box_none"><span id="T06001_coolwater1_inspect_flux"></span> ㎡/h</em></div>
			<div class="symbol No2"><em class="box_none"><span id="T06001_coolwater2_inspect_flux"></span> ㎡/h</em></div>
			<div class="symbol No3"><em class="box_none"><span id="T06001_coolwater3_inspect_flux"></span> ㎡/h</em></div>
		</div>
		
		<div class="header_big up"><span class="text">냉<br />수<br /><br />공<br />급<br />헤<br />더</span></div>
		<div class="header_big down"><span class="text">냉<br />수<br /><br />환<br />수<br />헤<br />더</span></div>
		
		<div class="hx_plate_v No1">
			<strong class="name">#1</strong>
		</div>
		<div class="hx_plate_v No2">
			<strong class="name">#2</strong>
		</div>
		<div class="hx_plate_v No3">
			<strong class="name">#3</strong>
		</div>
		
	</div>
</div>
<!-- e : content_area -->

<!-- s : data_area -->
<div id="data_area">
	
	<div class="data_area_inner">
		<dl>
			<dt>열교환기 #1</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
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
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T06001_fridge1_monthly_hour"></span>시 <span id="T06001_fridge1_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T06001','brinepump1_accum_reset');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T06001_fridge1_accum_hour"></span>시 <span id="T06001_fridge1_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T06001_coolwater1_inspect_heat"></span>USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T06001_coolwater1_monthly_heat"></span>USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type8','T06001','coolwater1_accum_reset');" class="font_green underline">적산열량</a></th>
							<td class="textR"><span id="T06001_coolwater1_accum_heat"></span>USRT-hr</td>
							<th scope="row"></th>
							<td class="textR"></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>열교환기 #2</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
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
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T06001_fridge2_monthly_hour"></span>시 <span id="T06001_fridge2_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T06001','brinepump2_accum_reset');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T06001_fridge2_accum_hour"></span>시 <span id="T06001_fridge2_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T06001_coolwater2_inspect_heat"></span>USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T06001_coolwater2_monthly_heat"></span>USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type8','T06001','coolwater2_accum_reset');" class="font_green underline">적산열량</a></th>
							<td class="textR"><span id="T06001_coolwater2_accum_heat"></span>USRT-hr</td>
							<th scope="row"></th>
							<td class="textR"></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>열교환기 #3</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
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
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T06001_fridge3_monthly_hour"></span>시 <span id="T06001_fridge3_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type9','T06001','brinepump3_accum_reset');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T06001_fridge3_accum_hour"></span>시 <span id="T06001_fridge3_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T06001_coolwater3_inspect_heat"></span>USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T06001_coolwater3_monthly_heat"></span>USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type8','T06001','coolwater3_accum_reset');" class="font_green underline">적산열량</a></th>
							<td class="textR"><span id="T06001_coolwater3_accum_heat"></span>USRT-hr</td>
							<th scope="row"></th>
							<td class="textR"></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->	

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->
