<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	
</script>
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:850px;">
	
		<div class="data_area_inner">
			<dl>
				<dt>인버터 제어설정</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
	
						<thead>
							<tr>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">브라인펌프 수동 주파수</th>
								<td>
									<select id="brinepump_invert_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인펌프 최저 주파수</th>
								<td>
									<select id="brinepump_invert_min_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인펌프 최고 주파수</th>
								<td>
									<select id="brinepump_invert_max_frequency_set" name="tagList" style="width: 100%">
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
				<dt>동시운전 제어설정</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
	
						<thead>
							<tr>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">방냉종료 시간설정</th>
								<td>
									<select id="icestorage_time_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉종료 축열량설정</th>
								<td>
									<select id="icestorage_heatstorage_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"></th>
								<td></td>
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
				<dt>동파방지 제어설정</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
	
						<thead>
							<tr>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">동파방지 기동온도</th>
								<td>
									<select id="freeze_protect_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">동파방지 정지온도</th>
								<td>
									<select id="freeze_protect_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">동파방지 기동시간</th>
								<td>
									<select id="freeze_protect_coolwater_run_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">동파방지 정지시간</th>
								<td>
									<select id="freeze_protect_coolwater_stop_hour" name="tagList" style="width: 100%">
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
				<dt>알람 제어설정</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
	
						<thead>
							<tr>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">동파방지 경보온도</th>
								<td>
									<select id="freeze_protect_alarm_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각수 입구온도</th>
								<td>
									<select id="coolant_enter_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인 출구과냉</th>
								<td>
									<select id="brine_exit_super_cooling_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">밸브 개도이상 설정</th>
								<td>
									<select id="valve_open_set" name="tagList" style="width: 100%">
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
				<dt>시간 제어설정</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
	
						<thead>
							<tr>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">야간시 브라인펌프 정지지연</th>
								<td>
									<select id="brinepump_stop_night_delay" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">주간시 브라인펌프 정지지연</th>
								<td>
									<select id="brinepump_stop_day_delay" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">야간시 냉각수펌프 정지지연</th>
								<td>
									<select id="coolantpump_stop_night_delay" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">주간시 냉각수펌프 정지지연</th>
								<td>
									<select id="coolantpump_stop_day_delay" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉수펌프 정지지연</th>
								<td>
									<select id="coolwaterpump_stop_delay" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"></th>
								<td></td>
								<th scope="row"></th>
								<td></td>
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
				<dt>전력량, 가동시간 관리</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
	
						<thead>
							<tr>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
								<th>Name</th>
								<th>TagID</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">브라인펌프 메인 가동시간</th>
								<td>
									<select id="brinepump_main_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인펌프 메인 가동분</th>
								<td>
									<select id="brinepump_main_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인펌프 예비 가동시간</th>
								<td>
									<select id="brinepump_pre_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인펌프 예비 가동분</th>
								<td>
									<select id="brinepump_pre_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉동기 1-1 주간 가동시간</th>
								<td>
									<select id="fridge1_1_monthly_day_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-1 주간 가동분</th>
								<td>
									<select id="fridge1_1_monthly_day_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-1 야간 가동시간</th>
								<td>
									<select id="fridge1_1_monthly_night_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-1 야간 가동분</th>
								<td>
									<select id="fridge1_1_monthly_night_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉동기 1-2 주간 가동시간</th>
								<td>
									<select id="fridge1_2_monthly_day_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-2 주간 가동분</th>
								<td>
									<select id="fridge1_2_monthly_day_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-2 야간 가동시간</th>
								<td>
									<select id="fridge1_2_monthly_night_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-2 야간 가동분</th>
								<td>
									<select id="fridge1_2_monthly_night_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">심야전력 일 전력량</th>
								<td>
									<select id="electric_night_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">심야전력 적산 전력량</th>
								<td>
									<select id="electric_night_accum_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"></th>
								<td></td>
								<th scope="row"></th>
								<td></td>
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
	</div>
	<div class="btn_areaC mt5" style="padding-top: 10px;">
		<a class="btnType btn_type02" href="javascript:settingSetRegist();">저장</a>
	</div>
</div>
		
<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
		<dl>
			<dt>인버터 제어 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">브라인펌프 수동 주파수</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> Hz</span></td>
							<th scope="row">브라인펌프 최저 주파수</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> Hz</span></td>
						</tr>
						<tr>
							<th scope="row">브라인펌프 최고 주파수</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> Hz</span></td>
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
			<dt>동시운전 제어 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">방냉종료 시간설정</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> %</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>동파방지 제어설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">동파방지 기동온도</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> ℃</span></td>
							<th scope="row">동파방지 정지온도</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> ℃</span></td>
						</tr>
						<tr>
							<th scope="row">동파방지 기동시간</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 분</span></td>
							<th scope="row">동파방지 정지시간</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 분</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>알람 제어설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">동파방지 경보온도</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> ℃</span></td>
							<th scope="row">냉각수 입구고온</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> ℃</span></td>
						</tr>
						<tr>
							<th scope="row">브라인 출구 과냉</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> ℃</span></td>
							<th scope="row">밸브 개도이상 설정</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> %</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>시간 제어설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">야간시 브라인펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 분</span></td>
							<th scope="row">야간시 냉각수펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 분</span></td>
						</tr>
						<tr>
							<th scope="row">주간시 브라인펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 초</span></td>
							<th scope="row">주간시 냉각수펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 초</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop" >0</a><span class="font_yellow"> 초</span></td>
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
			<dt>전력량, 가동시간 관리</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">브라인펌프 메인 가동시간</th>
							<td>
								<span class="font_yellow">0 시</span> 
								<span class="font_yellow">0 분</span>
							</td>
							<th scope="row">브라인펌프 예비 가동시간</th>
							<td>
								<span class="font_yellow">0 시</span> 
								<span class="font_yellow">0 분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 1-1 주간 가동시간</th>
							<td>
								<span class="font_yellow">0 시</span> 
								<span class="font_yellow">0 분</span>
							</td>
							<th scope="row">냉동기 1-2 주간 가동시간</th>
							<td>
								<span class="font_yellow">0 시</span> 
								<span class="font_yellow">0 분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">냉동기 1-1 야간 가동시간</th>
							<td>
								<span class="font_yellow">0 시</span> 
								<span class="font_yellow">0 분</span>
							</td>
							<th scope="row">냉동기 1-2 야간 가동시간</th>
							<td>
								<span class="font_yellow">0 시</span> 
								<span class="font_yellow">0 분</span>
							</td>
						</tr>
						<tr>
							<th scope="row">심야전력 일 전력량</th>
							<td><span class="font_yellow">0 kwh</span></td>
							<th scope="row">심야전력 적산 전력량</th>
							<td><span class="font_yellow">0 kwh</span></td>
							
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

