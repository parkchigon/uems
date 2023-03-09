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
									<select id="storagetank_end_temp_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉종료 시간설정</th>
								<td>
									<select id="storagetank_end_time_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉완료(해지/만빙)</th>
								<td>
									<select id="storagetank_end" name="tagList" style="width: 100%">
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
				<dt>적산관리</dt>
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
									<select id="inspect_icestorage_heat" name="tagList" style="width: 100%">
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
								<th scope="row">축냉열량 리셋</th>
								<td>
									<select id="accum_storagetank_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉열량 리셋</th>
								<td>
									<select id="accum_icestorage_heat_reset" name="tagList" style="width: 100%">
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
				<dt>온도 제어</dt>
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
								<th scope="row">냉동기 1-1 기동 설정</th>
								<td>
									<select id="fridge1_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-1 정지 설정</th>
								<td>
									<select id="fridge1_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-2 기동 설정</th>
								<td>
									<select id="fridge2_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 1-2 정지 설정</th>
								<td>
									<select id="fridge2_stop_temp" name="tagList" style="width: 100%">
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
								<th scope="row">터보용 냉각탑사용</th>
								<td>
									<select id="turbotower_use_yn" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control001" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control002" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control003" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">경부하 운전사용</th>
								<td>
									<select id="lightload_use_yn" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control004" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control005" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control006" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control007" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control008" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control009" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control010" name="setTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="set_control011" name="setTagList" style="width: 100%">
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
						<a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">℃</span></a>
					</li>
					<li>
						<span class="tit">축냉종료 시간설정</span>
						<a href="#" class="font_purple setPop" >0</a> <span class="font_yellow">분</span></a>
					</li>
					<li>
						<span class="tit"><a href="#" >축냉완료</a></span>
						<span class="lamp off"></span>
						해지
					</li>
					<li>&nbsp;</li>
				</ul>
			</dd>
		</dl>
		<div class="both"></div>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set chart">적산 관리</span></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="23%">
					<col width="23%">
					<col width="*">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">순시 축냉열량</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">누적 축냉열량</th>
							<td class="font_yellow">12345678 USRT-hr</td>
						</tr>
						<tr>
							<th scope="row">순시 방냉열량</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">누적 방냉열량</th>
							<td class="font_yellow">12345678 USRT-hr</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_btn_area mt10">
		<span class="freeSize mr5">축냉 열량리셋</span>
		<div class="switch off">
			<span class="stop">&nbsp;</span>
			<span class="start">리셋</span>
			<em></em>
		</div>
		<span class="freeSize ml20 mr5">방랭 열량리셋</span>
		<div class="switch off">
			<span class="stop">&nbsp;</span>
			<span class="start">리셋</span>
			<em></em>
		</div>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set control">온도 제어</span></dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="30%">
					<col width="*">
					<col width="30%">
					<col width="20%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">냉동기 1-1 기동설정</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">냉동기 1-1 정지설정</th>
							<td class="font_yellow">0 USRT</td>
						</tr>
						<tr>
							<th scope="row">냉동기 2-1 기동설정</th>
							<td class="font_yellow">0 USRT</td>
							<th scope="row">냉동기 2-1 정지설정</th>
							<td class="font_yellow">0 USRT</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>설정 관리
				<div class="head_right">
					<a class="btn_use">터보용 냉각탑사용</a>
					<div class="switch on">
						<span class="stop">미사용</span>
						<span class="start">사용</span>
						<em></em>
					</div>
					<a class="btn_use">경부하 운전사용</a>
					<div class="switch on">
						<span class="stop">미사용</span>
						<span class="start">사용</span>
						<em></em>
					</div>
				</div>
			</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="30%">
					<col width="*">
					<col width="30%">
					<col width="20%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">냉수출구 설정온도</th>
							<td><a href="#" class="font_purple setPop" >100.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 주간기동온도</th>
							<td><a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉단시 인버터 설정</th>
							<td><a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">냉각탑 주간정지온도</th>
							<td><a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">방냉종료 설정온도</th>
							<td><a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑 야간기동온도</th>
							<td><a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">축냉펌프 인버터 설정</th>
							<td><a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">냉각탑 야간정지온도</th>
							<td><a href="#" class="font_purple setPop" >0.0</a> <span class="font_yellow">℃</span></td>
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
							<td class="alarm_warning"><a href="#">냉각수 FLOW S/W 이상</a></td>
							<td class="alarm_on"><a href="#">축냉 FLOW S/W 이상</a></td>
							<td class=""><a href="#">냉수 FLOW S/W 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">냉동기 이상</a></td>
							<td class=""><a href="#">냉각수 고온이상</a></td>
							<td class=""><a href="#">냉각수 펌프이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">축냉 펌프이상</a></td>
							<td class=""><a href="#">방냉 펌프이상</a></td>
							<td class=""><a href="#">냉수 펌프이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">밸브 열림 이상</a></td>
							<td class=""><a href="#">밸브 닫힘 이상</a></td>
							<td class=""><a href="#">냉각탑 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">과냉 이상</a></td>
							<td class=""><a href="#">동파방지 이상</a></td>
							<td class=""><a href="#">스케너 통신 이상</a></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->
