<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
</script>
<div class="blockDiagram_area">

	<div class="scroll" style="height:800px;">
	
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
			
			<span class="sensor_u_temperature sensor001"><em class="font_yellow" id="coolwater1_in_temp">12345678 ℃</em></span>
			<span class="sensor_u_temperature sensor002"><em class="font_yellow" id="coolwater2_in_temp">12345678 ℃</em></span>
			<span class="sensor_u_temperature sensor003"><em class="font_yellow" id="coolwater3_in_temp">12345678 ℃</em></span>
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
			
			<span class="sensor_d_temperature sensor001"><em class="font_yellow" id="coolwater1_out_temp">12345678 ℃</em></span>
			<span class="sensor_d_temperature sensor002"><em class="font_yellow" id="coolwater2_out_temp">12345678 ℃</em></span>
			<span class="sensor_d_temperature sensor003"><em class="font_yellow" id="coolwater3_out_temp">12345678 ℃</em></span>
			
			<div class="symbol No1" id="coolwater1_inspect_flux">158 ㎡/h</div>
			<div class="symbol No2" id="coolwater2_inspect_flux">158 ㎡/h</div>
			<div class="symbol No3" id="coolwater3_inspect_flux">158 ㎡/h</div>
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
	
	<div class="btn_areaC mt5" style="padding-top: 10px;">
		<a class="btnType btn_type02" href="javascript:etcSetRegist();">저장</a>
		<span>
			<a class="btnType btn_type01" href="javascript:etcSetView('${templateInfo.submenuId}', 'Y');">우측설정</a>
		</span>
	</div>
</div>

<!-- s : data_area -->
<div id="data_area">
	<div class="scroll" style="height:870px;">
		
		<div class="data_area_inner">
			<dl>
				<dt>냉수 온도</dt>
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
								<th scope="row"><a href="#coolwater1_in_temp" class="underline" name="buildChak">냉수 #1 입구온도</a></th>
								<td>
									<select id="coolwater1_in_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><a href="#coolwater1_out_temp" class="underline" name="buildChak">냉수#1 출구온도</a></th>
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
								<th scope="row"><a href="#coolwater2_in_temp" class="underline" name="buildChak">냉수#2 입구온도</a></th>
								<td>
									<select id="coolwater2_in_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><a href="#coolwater2_out_temp" class="underline" name="buildChak">냉수#2 출구온도</a></th>
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
								<th scope="row"><a href="#coolwater3_in_temp" class="underline" name="buildChak">냉수#3 입구온도</a></th>
								<td>
									<select id="coolwater3_in_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><a href="#coolwater3_out_temp" class="underline" name="buildChak">냉수#3 출구온도</a></th>
								<td>
									<select id="coolwater3_out_temp" name="tagList" style="width: 100%">
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
				<dt>유량</dt>
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
								<th scope="row"><a href="#coolwater1_inspect_flux" class="underline" name="buildChak">흡수식냉수#1 순시유량</a></th>
								<td>
									<select id="coolwater1_inspect_flux" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><a href="#coolwater2_inspect_flux" class="underline" name="buildChak">흡수식냉수#2 순시유량</a></th>
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
								<th scope="row"><a href="#coolwater3_inspect_flux" class="underline" name="buildChak">흡수식냉수#3 순시유량</a></th>
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
	</div>
</div>
<!-- e : data_area -->
