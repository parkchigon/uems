<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	
</script>
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:850px;">
	
		<div class="data_area_inner">
			<dl>
				<dt>냉동기 기동/정지 설정</dt>
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
								<th scope="row">냉동기 1 기동</th>
								<td>
									<select id="fridge1_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1 정지</th>
								<td>
									<select id="fridge1_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 2 기동</th>
								<td>
									<select id="fridge2_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 2 정지</th>
								<td>
									<select id="fridge2_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉동기 3 기동</th>
								<td>
									<select id="fridge3_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 3 정지</th>
								<td>
									<select id="fridge3_stop_temp" name="tagList" style="width: 100%">
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
				<dt>냉동기 제어 온도 설정</dt>
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
								<th scope="row">냉동기 1 축냉</th>
								<td>
									<select id="fridge1_coldstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1 동시</th>
								<td>
									<select id="fridge1_winter_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1 냉단</th>
								<td>
									<select id="fridge1_coolstorage_temp" name="tagList" style="width: 100%">
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
								<th scope="row">냉동기 2 축냉</th>
								<td>
									<select id="fridge2_coldstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 2 동시</th>
								<td>
									<select id="fridge2_winter_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 2 냉단</th>
								<td>
									<select id="fridge2_coolstorage_temp" name="tagList" style="width: 100%">
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
								<th scope="row">냉동기 3 축냉</th>
								<td>
									<select id="fridge3_coldstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 3 동시</th>
								<td>
									<select id="fridge3_winter_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 3 냉단</th>
								<td>
									<select id="fridge3_coolstorage_temp" name="tagList" style="width: 100%">
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
									<select id="icestorage_set_time" name="tagList" style="width: 100%">
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
									<select id="freeze_protect_run_time" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">동파방지 정지시간</th>
								<td>
									<select id="freeze_protect_stop_time" name="tagList" style="width: 100%">
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
								<th scope="row">냉각수 입구고온</th>
								<td>
									<select id="coolant_enter_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인 출구 과냉</th>
								<td>
									<select id="brine_exit_super_cooling_set" name="tagList" style="width: 100%">
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
								<th scope="row">브라인펌프 정지지연</th>
								<td>
									<select id="brine_pump_stop_delay" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각펌프 정지지연</th>
								<td>
									<select id="coolant_pump_stop_delay" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉수펌프 정지지연</th>
								<td>
									<select id="cool_pump_stop_delay" name="tagList" style="width: 100%">
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
				<dt>축냉시 냉동기 설정</dt>
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
								<th scope="row">축냉시 냉동기 설정 순번 3번</th>
								<td>
									<select id="cool_storage_fridge_set_select" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1대 정지온도 설정</th>
								<td>
									<select id="fridge1_stop_temp_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 2대 정지온도 설정</th>
								<td>
									<select id="fridge2_stop_temp_set" name="tagList" style="width: 100%">
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
	<div class="btn_areaC mt5" style="padding-top: 10px;">
		<a class="btnType btn_type02" href="javascript:settingSetRegist();">저장</a>
	</div>
</div>
		
<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
		<dl>
			<dt>냉동기 기동/정지 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">냉동기 1 기동</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 기동</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 기동</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기 1 정지</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 정지</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 정지</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기 제어 온도 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
					<col width="22%">
					<col width="11.3%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">냉동기 1 축냉</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 축냉</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 축냉</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기 1 동시</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 동시</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 동시</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기 1 냉단</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2 냉단</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 3 냉단</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
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
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">방냉종료 시간설정</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">%</span></td>
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
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">동파방지 정지온도</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">동파방지 기동시간</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">분</span></td>
							<th scope="row">동파방지 정지시간</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">분</span></td>
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
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각수 입구고온</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">브라인 출구 과냉</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
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
							<th scope="row">브라인펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">분</span></td>
							<th scope="row">냉각펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프 정지지연</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">초</span></td>
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
			<dt>축냉시 냉동기 설정
				<div class="head_right">
					<a href="#" class="btn_use">순번3번</a>
				</div>
			</dt>
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
							<th scope="row">냉동기 1대 정지온도 설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기 2대 정지온도 설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

