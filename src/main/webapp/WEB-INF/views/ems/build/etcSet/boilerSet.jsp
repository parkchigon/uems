<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
</script>
<div class="blockDiagram_area" style="height:750px;">

	<div class="chw">
		<span class="pipe_chw_ud down pipe001" name="pipe1"></span>
		<span class="pipe_chw_ud up pipe002" name="pipe1"></span>
		<span class="pipe_chw_ud down pipe003" name="pipe1"></span>
		<span class="pipe_chw_ud up pipe004" name="pipe1"></span>
		<span class="pipe_chw_ud up pipe005" name="pipe3"></span>
		<span class="pipe_chw_ud down pipe006" name="pipe3"></span>
		
		<span class="pipe_chw_lr left pipe001" name="pipe1"></span>
		<span class="pipe_chw_lr left pipe002" name="pipe1"></span>
		<span class="pipe_chw_lr left pipe003" name="pipe1"></span>
		<span class="pipe_chw_lr right pipe004" name="pipe3"></span>
		<span class="pipe_chw_lr right pipe005" name="pipe1"></span>
		<span class="pipe_chw_lr right pipe006" name="pipe2"></span>
		<span class="pipe_chw_lr right pipe007" name="pipe1"></span>
		
		<span class="pipe_chw_corner_ur corner001"></span>
		<span class="pipe_chw_corner_ur corner002"></span>
		<span class="pipe_chw_corner_ur corner003"></span>
		
		<span class="pipe_chw_corner_ul corner001"></span>
		<span class="pipe_chw_corner_ul corner002"></span>
		<span class="pipe_chw_corner_ul corner003"></span>
		
		<span class="pipe_chw_corner_dr corner001"></span>
		<span class="pipe_chw_corner_dr corner002"></span>
		
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_t_lru corner002"></span>
		
		<span class="sensor_u_temperature sensor001"><em id="out_temp" class="font_sky">12345678 ℃</em></span>
		<span class="sensor_d_temperature sensor001"><em id="in_temp" class="font_sky">12345678 ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump No1" href="#layerPop_type1" id="boiler_pump1" name="modal">
				<span class="fan off"></span>
			</a>
			<a class="coolpump No2" href="#layerPop_type1" id="boiler_pump2" name="modal">
				<span class="fan off"></span>
			</a>
			<strong class="text_info">난방순환펌프</strong>
		</div>
		
	</div>
	
	<div class="header_lr"><span class="text">2차측부하</span></div>
	
	<div id="boiler" class="boiler">
		<a href="#layerPop_type1" class="power on" name="modal">가동</a>
	</div>
</div>

<div class="btn_areaC mt5">
	<a class="btnType btn_type02" href="javascript:etcSetRegist();">저장</a>
	<span>
		<a class="btnType btn_type01" href="javascript:etcSetView('${templateInfo.submenuId}', 'Y');">우측설정</a>
	</span>
</div>

<!-- s : data_area -->
<div id="data_area">
<div class="scroll" style="height:870px;">
	
	<div class="data_area_inner">
		<dl>
			<dt>보일러<a href="#boiler" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">보일러</th>
							<td>
								<select id="boiler" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">자동/수동</th>
							<td>
								<select id="boiler_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">운전/정지</th>
							<td>
								<select id="boiler_auto_yn" name="tagList" style="width: 100%">
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
							<th scope="row"><a href="#in_temp" class="underline" name="buildChak">난방 입구온도</a></th>
							<td>
								<select id="boiler_in_temp" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row"><a href="#out_temp" class="underline" name="buildChak">난방 출구온도</a></th>
							<td>
								<select id="boiler_out_temp" name="tagList" style="width: 100%">
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
			<dt>난방순환펌프 예비<a href="#boiler_pump1" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">난방펌프 예비</th>
							<td>
								<select id="boilerpump_pre" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">자동/수동</th>
							<td>
								<select id="boilerpump_pre_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">운전/정지</th>
							<td>
								<select id="boilerpump_pre_auto_yn" name="tagList" style="width: 100%">
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
			<dt>난방순환펌프 메인<a href="#boiler_pump2" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">난방펌프 메인</th>
							<td>
								<select id="boilerpump_main" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">자동/수동</th>
							<td>
								<select id="boilerpump_main_run_yn" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">운전/정지</th>
							<td>
								<select id="boilerpump_main_auto_yn" name="tagList" style="width: 100%">
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
