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
			<span class="pipe_hw_ud pipe004"></span>
			<span class="pipe_hw_ud pipe005"></span>
			<span class="pipe_hw_ud pipe006"></span>
			<span class="pipe_hw_ud pipe007"></span>
			
			<span class="pipe_hw_lr pipe001"></span>
			<span class="pipe_hw_lr pipe002"></span>
			<span class="pipe_hw_lr pipe003"></span>
			<span class="pipe_hw_lr pipe004"></span>
			<span class="pipe_hw_lr pipe005"></span>
			<span class="pipe_hw_lr pipe006"></span>
			<span class="pipe_hw_lr pipe007"></span>
			<span class="pipe_hw_lr pipe008"></span>
			<span class="pipe_hw_lr pipe009"></span>
			<span class="pipe_hw_lr pipe010"></span>
			<span class="pipe_hw_lr pipe011"></span>
			<span class="pipe_hw_lr pipe012"></span>
			<span class="pipe_hw_lr pipe013"></span>
			<span class="pipe_hw_lr pipe014"></span>
			<span class="pipe_hw_lr pipe015"></span>
			
			<span class="pipe_hw_corner_ur corner001"></span>
			<span class="pipe_hw_corner_ur corner002"></span>
			<span class="pipe_hw_corner_ur corner003"></span>
			
			<span class="pipe_hw_corner_ul corner001"></span>
			<span class="pipe_hw_corner_ul corner002"></span>
			<span class="pipe_hw_corner_ul corner003"></span>
			<span class="pipe_hw_corner_ul corner004"></span>
			
			<span class="pipe_hw_corner_dl corner001"></span>
			<span class="pipe_hw_corner_dl corner002"></span>
			<span class="pipe_hw_corner_dl corner003"></span>
			
			<span class="pipe_hw_corner_dr corner001"></span>
			<span class="pipe_hw_corner_dr corner002"></span>
			<span class="pipe_hw_corner_dr corner003"></span>
			<span class="pipe_hw_corner_dr corner004"></span>
			
			<span class="sensor_d_temperature sensor001"><em class="font_yellow"><span id="T07001_fridge1_in_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="T07001_fridge2_in_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor003"><em class="font_yellow"><span id="T07001_fridge3_in_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor004"><em class="font_yellow"><span id="T07001_fridge4_in_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor005"><em class="font_yellow"><span id="T07001_fridge5_in_temp"></span> ℃</em></span>
			
			<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="T07001_heatchange1_in_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor002"><em class="font_yellow"><span id="T07001_heatchange2_in_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor003"><em class="font_yellow"><span id="T07001_heatchange3_in_temp"></span> ℃</em></span>
			
		</div>
		
		
		<div class="glycol">
			<span class="pipe_glycol_ud pipe001"></span>
			<span class="pipe_glycol_ud pipe002"></span>
			<span class="pipe_glycol_ud pipe003"></span>
			<span class="pipe_glycol_ud pipe004"></span>
			<span class="pipe_glycol_ud pipe005"></span>
			<span class="pipe_glycol_ud pipe006"></span>
			
			<span class="pipe_glycol_lr pipe001"></span>
			<span class="pipe_glycol_lr pipe002"></span>
			<span class="pipe_glycol_lr pipe003"></span>
			<span class="pipe_glycol_lr pipe004"></span>
			<span class="pipe_glycol_lr pipe005"></span>
			<span class="pipe_glycol_lr pipe006"></span>
			<span class="pipe_glycol_lr pipe007"></span>
			<span class="pipe_glycol_lr pipe008"></span>
			<span class="pipe_glycol_lr pipe009"></span>
			<span class="pipe_glycol_lr pipe010"></span>
			<span class="pipe_glycol_lr pipe011"></span>
			<span class="pipe_glycol_lr pipe012"></span>
			<span class="pipe_glycol_lr pipe013"></span>
			<span class="pipe_glycol_lr pipe014"></span>
			
			<span class="pipe_glycol_corner_ul corner001"></span>
			<span class="pipe_glycol_corner_ul corner002"></span>
			
			<span class="pipe_glycol_corner_ur corner001"></span>
			<span class="pipe_glycol_corner_ur corner002"></span>
			<span class="pipe_glycol_corner_ur corner003"></span>
			<span class="pipe_glycol_corner_ur corner004"></span>
			
			<span class="pipe_glycol_corner_dr corner001"></span>
			<span class="pipe_glycol_corner_dr corner002"></span>
			
			<span class="pipe_glycol_corner_dl corner001"></span>
			<span class="pipe_glycol_corner_dl corner002"></span>
			<span class="pipe_glycol_corner_dl corner003"></span>
			<span class="pipe_glycol_corner_dl corner004"></span>
			
			<span class="sensor_d_temperature sensor001"><em class="font_yellow"><span id="T07001_heatchange1_out_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="T07001_heatchange2_out_temp"></span> ℃</em></span>
			<span class="sensor_d_temperature sensor003"><em class="font_yellow"><span id="T07001_heatchange3_out_temp"></span> ℃</em></span>
			
			<span class="sensor_u_temperature sensor001"><em class="font_yellow"><span id="T07001_fridge1_out_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor002"><em class="font_yellow"><span id="T07001_fridge2_out_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor003"><em class="font_yellow"><span id="T07001_fridge3_out_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor004"><em class="font_yellow"><span id="T07001_fridge4_out_temp"></span> ℃</em></span>
			<span class="sensor_u_temperature sensor005"><em class="font_yellow"><span id="T07001_fridge5_out_temp"></span> ℃</em></span>
			
			<div class="symbol No1"><span id="T07001_heatchange1_inspect_flux"></span> ㎡/h</div>
			<div class="symbol No2"><span id="T07001_heatchange2_inspect_flux"></span> ㎡/h</div>
			<div class="symbol No3"><span id="T07001_heatchange3_inspect_flux"></span> ㎡/h</div>
			<div class="symbol No4"><span id="T07001_fridge1_inspect_flux"></span> ㎡/h</div>
			<div class="symbol No5"><span id="T07001_fridge2_inspect_flux"></span> ㎡/h</div>
			<div class="symbol No6"><span id="T07001_fridge3_inspect_flux"></span> ㎡/h</div>
			<div class="symbol No7"><span id="T07001_fridge4_inspect_flux"></span> ㎡/h</div>
			<div class="symbol No8"><span id="T07001_fridge5_inspect_flux"></span> ㎡/h</div>
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
		
		
		<div id="link1" class="refrigerating_machine No1">
			<strong class="name">#1</strong>
			<a id="T07001_fridge1" class="power off">정지</a>
		</div>
		
		<div id="link1" class="refrigerating_machine No2">
			<strong class="name">#2</strong>
			<a id="T07001_fridge2" class="power off">정지</a>
		</div>
		
		<div id="link1" class="refrigerating_machine No3">
			<strong class="name">#3</strong>
			<a id="T07001_fridge3" class="power off">정지</a>
		</div>
		
		<div id="link1" class="refrigerating_machine No4">
			<strong class="name">#4</strong>
			<a id="T07001_fridge4" class="power off">정지</a>
		</div>
		
		<div id="link1" class="refrigerating_machine No5">
			<strong class="name">#5</strong>
			<a id="T07001_fridge5" class="power off">정지</a>
		</div>
	</div>
</div>
<!-- e : content_area -->
	
<!-- s : data_area -->
<div id="data_area">
<div class="scroll" style="height:940px;">
	
	<div class="data_area_inner">
		<dl>
			<dt>흡수식냉동기 #1</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_fridge1_monthly_hour"></span>시 <span id="fridge1_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_fridge1_accum_hour"></span>시 <span id="fridge1_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_fridge1_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_fridge1_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_fridge1_accum_heat"></span> USRT-hr</td>
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
			<dt>흡수식냉동기 #2</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_fridge2_monthly_hour"></span>시 <span id="T07001_fridge2_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_fridge2_accum_hour"></span>시 <span id="T07001_fridge2_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_fridge2_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_fridge2_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_fridge2_accum_heat"></span> USRT-hr</td>
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
			<dt>흡수식냉동기 #3</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_fridge3_monthly_hour"></span>시 <span id="T07001_fridge3_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_fridge3_accum_hour"></span>시 <span id="T07001_fridge3_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_fridge3_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_fridge3_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_fridge3_accum_heat"></span> USRT-hr</td>
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
			<dt>흡수식냉동기 #4</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_fridge4_monthly_hour"></span>시 <span id="T07001_fridge4_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_fridge4_accum_hour"></span>시 <span id="T07001_fridge4_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_fridge4_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_fridge4_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_fridge4_accum_heat"></span> USRT-hr</td>
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
			<dt>흡수식냉동기 #5</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="25%">
					<col width="25%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_fridge5_monthly_hour"></span>시 <span id="T07001_fridge5_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_fridge5_accum_hour"></span>시 <span id="T07001_fridge5_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_fridge5_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_fridge5_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_fridge5_accum_heat"></span> USRT-hr</td>
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

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_heatchange1_monthly_hour"></span>시 <span id="T07001_heatchange1_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_heatchange1_accum_hour"></span>시 <span id="T07001_heatchange1_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_heatchange1_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_heatchange1_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_heatchange1_accum_heat"></span> USRT-hr</td>
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

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_heatchange2_monthly_hour"></span>시 <span id="T07001_heatchange2_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_heatchange2_accum_hour"></span>시 <span id="T07001_heatchange2_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_heatchange2_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_heatchange2_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_heatchange2_accum_heat"></span> USRT-hr</td>
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

					<tbody>
						<tr>
							<th scope="row">가동시간(월별)</th>
							<td class="textR"><span id="T07001_heatchange3_monthly_hour"></span>시 <span id="T07001_heatchange3_monthly_min"></span>분</td>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type15','T07001','integration_time');" class="underline">가동시간(적산)</a></th>
							<td class="textR"><span id="T07001_heatchange3_accum_hour"></span>시 <span id="T07001_heatchange3_accum_min"></span>분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR"><span id="T07001_heatchange3_inspect_heat"></span> USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR"><span id="T07001_heatchange3_monthly_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="javascript:openLayerPop('#layerPop_type14','T07001','integration_cal');" class="font_green underline">적산월량</a></th>
							<td class="textR"><span id="T07001_heatchange3_accum_heat"></span> USRT-hr</td>
							<th scope="row"></th>
							<td class="textR"></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
</div>
<!-- e : data_area -->

<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->	

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->
