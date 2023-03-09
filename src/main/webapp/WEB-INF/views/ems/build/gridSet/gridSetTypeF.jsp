<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	
</script>
			
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:850px;">
		<div class="data_area_inner">
			<dl>
				<dt>시스템 상태</dt>
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
								<th scope="row">축냉운전</th>
								<td>
									<select id="storagetank_drive" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉운전</th>
								<td>
									<select id="icestorage_drive" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">동시운전</th>
								<td>
									<select id="winter_drive" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉단운전</th>
								<td>
									<select id="coolstorage_drive" name="tagList" style="width: 100%">
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
				<dt>축열조 설정</dt>
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
								<th scope="row">축냉종료 온도설정</th>
								<td>
									<select id="heatstorage_temp_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉종료 시간설정</th>
								<td>
									<select id="heatstorage_time_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉완료(해지/만빙)</th>
								<td>
									<select id="heatstorage_end" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축열량 강제설정사용</th>
								<td>
									<select id="storagetank_use_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">축열량 설정값</th>
								<td>
									<select id="storagetank_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉종료 설정온도</th>
								<td>
									<select id="icestorage_set_temp" name="tagList" style="width: 100%">
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
				<dt>냉동기 선택</dt>
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
								<th scope="row">냉동기 #1 선택</th>
								<td>
									<select id="fridge1_select" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 #2 선택</th>
								<td>
									<select id="fridge2_select" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 #3 선택</th>
								<td>
									<select id="fridge3_select" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 #4 선택</th>
								<td>
									<select id="fridge4_select" name="tagList" style="width: 100%">
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
				<dt>HEX 선택</dt>
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
								<th scope="row">HEX #1 선택</th>
								<td>
									<select id="hex1_select" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">HEX #1 선택</th>
								<td>
									<select id="hex2_select" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">HEX #3 선택</th>
								<td>
									<select id="hex3_select" name="tagList" style="width: 100%">
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
				<dt>적산관리(열량)</dt>
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
								<th scope="row">순시 축냉 열량</th>
								<td>
									<select id="inspect_storagetank_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">누적 축냉 열량</th>
								<td>
									<select id="accum_storagetank_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 방냉 열량</th>
								<td>
									<select id=inspect_icestorage_heat name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">누적 방냉 열량</th>
								<td>
									<select id="accum_icestorage_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">축냉 적산열량 리셋</th>
								<td>
									<select id="storagetank_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉 적산열량 리셋</th>
								<td>
									<select id="icestorage_accum_reset" name="tagList" style="width: 100%">
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
				<dt>적산관리(전력량)</dt>
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
								<th scope="row">일반전력 순시 전력량</th>
								<td>
									<select id="inspect_day_power_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">심야전력 순시 전력량</th>
								<td>
									<select id="inspect_night_power_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">일반전력 적산 전력량</th>
								<td>
									<select id="storagetank_day_power_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">심야전력 적산 전력량</th>
								<td>
									<select id="storagetank_night_power_set" name="tagList" style="width: 100%">
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
				<dt>적산관리(가동시간)</dt>
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
								<th scope="row">냉동기#1 가동시간</th>
								<td>
									<select id="fridge1_monthly_day_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#1 가동분</th>
								<td>
									<select id="fridge1_monthly_day_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 가동시간</th>
								<td>
									<select id="fridge2_monthly_day_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 가동분</th>
								<td>
									<select id="fridge2_monthly_day_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉동기#3 가동시간</th>
								<td>
									<select id="fridge3_monthly_day_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#3 가동분</th>
								<td>
									<select id="fridge3_monthly_day_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#4 가동시간</th>
								<td>
									<select id="fridge4_monthly_day_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#4 가동분</th>
								<td>
									<select id="fridge4_monthly_day_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">방냉펌프#1 가동시간</th>
								<td>
									<select id="icestoragepump1_storagetank_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#1 가동분</th>
								<td>
									<select id="icestoragepump1_storagetank_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#2 가동시간</th>
								<td>
									<select id="icestoragepump2_storagetank_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#2 가동분</th>
								<td>
									<select id="icestoragepump2_storagetank_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">방냉펌프#3 가동시간</th>
								<td>
									<select id="icestoragepump3_storagetank_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#3 가동분</th>
								<td>
									<select id="icestoragepump3_storagetank_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#4 가동시간</th>
								<td>
									<select id="icestoragepump4_storagetank_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#4 가동분</th>
								<td>
									<select id="icestoragepump4_storagetank_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉동기#1 적산 가동시간 리셋</th>
								<td>
									<select id="fridge1_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 적산 가동시간 리셋</th>
								<td>
									<select id="fridge2_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#3 적산 가동시간 리셋</th>
								<td>
									<select id="fridge3_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#4 적산 가동시간 리셋</th>
								<td>
									<select id="fridge4_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">방냉펌프#1 적산 가동시간 리셋</th>
								<td>
									<select id="icestoragepump1_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#2 적산 가동시간 리셋</th>
								<td>
									<select id="icestoragepump2_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#3 적산 가동시간 리셋</th>
								<td>
									<select id="icestoragepump3_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#4 적산 가동시간 리셋</th>
								<td>
									<select id="icestoragepump4_accum_reset" name="tagList" style="width: 100%">
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
				<dt>설정관리</dt>
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
								<th scope="row">인버터 제어설정</th>
								<td>
									<select id="icestorage_non_auto_control_use" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">MV3 통합밸브 제어설정</th>
								<td>
									<select id="mv3_valv_control_use" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">통합 수동주파수</th>
								<td>
									<select id="icestoragepump_non_auto_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">통합 수동제어 출력</th>
								<td>
									<select id="mv3_valv_control_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">MV3 수동 하한값 설정</th>
								<td>
									<select id="mv3_non_auto_set" name="tagList" style="width: 100%">
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
				<dt>알람</dt>
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
								<th scope="row">알람 리셋</th>
								<td>
									<select id="alarm_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error001" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error002" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error003" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error004" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error005" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error006" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error007" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error008" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error009" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error010" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error011" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error012" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error013" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error014" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error015" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error016" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error017" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error018" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error019" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error020" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error021" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error022" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error023" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error024" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error025" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error026" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error027" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error028" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error029" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error030" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error031" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error032" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error033" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error034" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error035" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error036" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error037" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error038" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error039" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error040" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error041" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error042" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
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
		<a class="btnType btn_type02" href="javascript:diagramSetRRegist();">저장</a>
	</div>
</div>

<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
		<dl class="left">
			<dt><span class="icon_set sys">시스템 상태</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">축냉운전</span>
						<span class="lamp on"></span>
						<div class="switch on">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">방냉운전</span>
						<span class="lamp off"></span>
						<div class="switch off">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">동시운전</span>
						<span class="lamp off"></span>
						<div class="switch off">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">냉단운전</span>
						<span class="lamp off"></span>
						<div class="switch off">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
				</ul>
			</dd>
		</dl>
		<dl class="right">
			<dt><span class="icon_set set">축열조 설정</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">축냉종료 온도설정</span>
						<a href="#layerPop_type3" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></a>
					</li>
					<li>
						<span class="tit">축냉종료 시간설정</span>
						<a href="#layerPop_type3" class="font_purple setPop">0</a> <span class="font_yellow">분</span></a>
					</li>
					<li>
						<span class="tit"><a href="#layerPop_type6">축냉완료</a></span>
						<span class="lamp off"></span>
						해지
					</li>
					<li>
						<span class="tit">방냉종료 설정온도</span>
						<a href="#layerPop_type3" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span>
					</li>
				</ul>
			</dd>
		</dl>
		<div class="both"></div>
	</div>
	
	<div class="data_btn_area mt10">
		<a class="small" href="#">냉동기 #1</a>
		<a class="small" href="#">냉동기 #2</a>
		<a class="small" href="#">냉동기 #3</a>
		<a class="small" href="#">냉동기 #4</a>
		<a class="small" href="#">HEX #1</a>
		<a class="small" href="#">HEX #2</a>
		<a class="small" href="#">HEX #3</a>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set chart">적산 관리</span></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="*">
					<col width="32%">
					<col width="16%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">순시 축냉 열량</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">일반전력 순시 전력량</th>
							<td class="font_yellow">00 kW</td>
						</tr>
						<tr>
							<th scope="row">누적 축냉 열량</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">심야전력 순시 전력량</th>
							<td class="font_yellow">00 kW</td>
						</tr>
						<tr>
							<th scope="row">순시 방냉 열량</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">일반전력 적산 전력량</th>
							<td class="font_yellow">00 kW</td>
						</tr>
						<tr>
							<th scope="row">누적 방냉 열량</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">심야전력 적산 전력량</th>
							<td class="font_yellow">00 kW</td>
						</tr>
						<tr>
							<th scope="row">냉동기#1 가동시간</th>
							<td class="font_yellow">0시 0분</td>
							<th scope="row">방냉펌프#1 가동시간</th>
							<td class="font_yellow">0시 0분</td>
						</tr>
						<tr>
							<th scope="row">냉동기#2 가동시간</th>
							<td class="font_yellow">0시 0분</td>
							<th scope="row">방냉펌프#2 가동시간</th>
							<td class="font_yellow">0시 0분</td>
						</tr>
						<tr>
							<th scope="row">냉동기#3 가동시간</th>
							<td class="font_yellow">0시 0분</td>
							<th scope="row">방냉펌프#3 가동시간</th>
							<td class="font_yellow">0시 0분</td>
						</tr>
						<tr>
							<th scope="row">냉동기#4 가동시간</th>
							<td class="font_yellow">0시 0분</td>
							<th scope="row">방냉펌프#4 가동시간</th>
							<td class="font_yellow">0시 0분</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>설정 관리</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="*">
					<col width="32%">
					<col width="16%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">인버터 제어설정</th>
							<td><a href="#layerPop_type4" class="btnType btn_use">사용</a></td>
							<th scope="row">MV3 통합밸브 제어설정</th>
							<td><a href="#layerPop_type4" class="btnType btn_disabled">미사용</a></td>
						</tr>
						<tr>
							<th scope="row">통합 수동주파수</th>
							<td><a href="#layerPop_type3" class="font_purple setPop">0.0</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">통합 수동제어 출력</th>
							<td><a href="#layerPop_type3" class="font_purple setPop">0.0</a> <span class="font_yellow">%</span></td>
						</tr>
						<tr>
							<th scope="row">MV3 수동 하한값 설정</th>
							<td><a href="#layerPop_type3" class="font_purple setPop">0.0</a> <span class="font_yellow">%</span></td>
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
			<dt><span class="icon_set danger">경보</span>
				<div class="head_right">
					<span class="reAlarm">알람리셋</span>
					<div class="mr5 switch off">
						<em></em>
					</div>
					<a href="#" class="btn_next pre"><span class="blind">이전페이지</span></a>
					<a href="#" class="btn_next next"><span class="blind">다음페이지</span></a>
				</div>
			</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="33.3%">
					<col width="33.3%">
					<col width="*">
				</colgroup>

					<tbody class="warning">
						<tr>
							<td class="alarm_warning"><a href="#">냉수펌프 #1 이상</a></td>
							<td class="alarm_on"><a href="#">냉수펌프 #2 이상</a></td>
							<td class=""><a href="#">냉수펌프 #3 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">브라인펌프 #1 이상</a></td>
							<td class=""><a href="#">브라인펌프 #2 이상</a></td>
							<td class=""><a href="#">브라인펌프 #3 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">냉각탑 #1-1 이상</a></td>
							<td class=""><a href="#">냉각탑 #2-1 이상</a></td>
							<td class=""><a href="#">냉각탑 #3-1 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">냉각탑 #1-2 이상</a></td>
							<td class=""><a href="#">냉각탑 #2-2 이상</a></td>
							<td class=""><a href="#">냉각탑 #3-2 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">냉동기 #1 이상</a></td>
							<td class=""><a href="#">냉동기 #2 이상</a></td>
							<td class=""><a href="#">냉동기 #3 이상</a></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

