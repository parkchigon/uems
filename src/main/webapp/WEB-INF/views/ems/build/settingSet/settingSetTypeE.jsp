<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	
</script>
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:850px;">
	
		<div class="data_area_inner">
			<dl>
				<dt>냉각탑 제어설정</dt>
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
								<th scope="row">냉각탑 1그룹 통합 기동온도</th>
								<td>
									<select id="cooltower1_total_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑 1그룹 통합 정지온도</th>
								<td>
									<select id="cooltower1_total_stop_temp" name="tagList" style="width: 100%">
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
							<tr>
								<th scope="row">냉각탑#1 주간 기동온도</th>
								<td>
									<select id="cooltower1_day_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#1 주간 정지온도</th>
								<td>
									<select id="cooltower1_day_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#2 주간 기동온도</th>
								<td>
									<select id="cooltower2_day_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#2 주간 정지온도</th>
								<td>
									<select id="cooltower2_day_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉각탑#3 주간 기동온도</th>
								<td>
									<select id="cooltower3_day_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#3 주간 정지온도</th>
								<td>
									<select id="cooltower3_day_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#4 주간 기동온도</th>
								<td>
									<select id="cooltower4_day_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#4 주간 정지온도</th>
								<td>
									<select id="cooltower4_day_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉각탑#1 야간 기동온도</th>
								<td>
									<select id="cooltower1_night_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#1 야간 정지온도</th>
								<td>
									<select id="cooltower1_night_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#2 야간 기동온도</th>
								<td>
									<select id="cooltower2_night_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#2 야간 정지온도</th>
								<td>
									<select id="cooltower2_night_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉각탑#3 야간 기동온도</th>
								<td>
									<select id="cooltower3_night_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#3 야간 정지온도</th>
								<td>
									<select id="cooltower3_night_stop_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#4 야간 기동온도</th>
								<td>
									<select id="cooltower4_night_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각탑#4 야간 정지온도</th>
								<td>
									<select id="cooltower4_night_stop_temp" name="tagList" style="width: 100%">
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
								<th scope="row">냉동기 1 냉방</th>
								<td>
									<select id="fridge1_coolstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 2 축냉</th>
								<td>
									<select id="fridge2_coldstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 2 냉방</th>
								<td>
									<select id="fridge2_coolstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
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
								<th scope="row">냉동기 3 냉방</th>
								<td>
									<select id="fridge3_coolstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 4 축냉</th>
								<td>
									<select id="fridge4_coldstorage_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기 4 냉방</th>
								<td>
									<select id="fridge4_coolstorage_temp" name="tagList" style="width: 100%">
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
								<th scope="row">방냉펌프#1 수동주파수</th>
								<td>
									<select id="icestorage1_manual_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#2 수동주파수</th>
								<td>
									<select id="icestorage2_manual_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#3 수동주파수</th>
								<td>
									<select id="icestorage3_manual_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프#4 수동주파수</th>
								<td>
									<select id="icestorage4_manual_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">방냉인버터 통합 수동 제어 사용</th>
								<td>
									<select id="icestorage_total_manual_set_use_yn" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프 최저 주파수</th>
								<td>
									<select id="icestorage_min_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프 최고 주파수</th>
								<td>
									<select id="icestorage_max_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">방냉펌프 통합 수동 주파수</th>
								<td>
									<select id="icestorage_total_manual_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">방냉펌프 수동 주파수 하한값</th>
								<td>
									<select id="icestorage_manual_frequency_min_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉펌프 1대 고정주파수</th>
								<td>
									<select id="storagetank1_fix_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉펌프 2대 고정주파수</th>
								<td>
									<select id="storagetank2_fix_frequency_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉펌프 3대 고정주파수</th>
								<td>
									<select id="storagetank3_fix_frequency_set" name="tagList" style="width: 100%">
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
								<th scope="row">초기부하 지연시간설정</th>
								<td>
									<select id="delay_time_set" name="tagList" style="width: 100%">
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
				<dt>정지지연 설정</dt>
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
								<th scope="row">축냉 펌프 (야간용)</th>
								<td>
									<select id="storagetank_night_delay_time" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">축냉 펌프 (주간용)</th>
								<td>
									<select id="storagetank_day_delay_time" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각수 펌프 (야간용)</th>
								<td>
									<select id="coolpump_night_delay_time" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각수 펌프 (주간용)</th>
								<td>
									<select id="coolpump_day_delay_time" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">방냉 펌프 (야간용)</th>
								<td>
									<select id="icestorage_night_delay_time" name="tagList" style="width: 100%">
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
				<dt>기동 지연 설정</dt>
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
								<th scope="row">냉동기#1 기동지연</th>
								<td>
									<select id="fridge1_run_delay_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 기동지연</th>
								<td>
									<select id="fridge2_run_delay_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#3 기동지연</th>
								<td>
									<select id="fridge3_run_delay_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#4 기동지연</th>
								<td>
									<select id="fridge4_run_delay_set" name="tagList" style="width: 100%">
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
				<dt>전류 제한 설정</dt>
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
								<th scope="row">냉동기#1 전류제한</th>
								<td>
									<select id="fridge1_volt_limit_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 전류제한</th>
								<td>
									<select id="fridge2_volt_limit_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#3 전류제한</th>
								<td>
									<select id="fridge3_volt_limit_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#4 전류제한</th>
								<td>
									<select id="fridge4_volt_limit_set" name="tagList" style="width: 100%">
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
				<dt>냉동기 제어 열량 설정</dt>
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
								<th scope="row">냉동기#1 열량 기동 설정</th>
								<td>
									<select id="fridge1_heat_run_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#1 열량 정지 설정</th>
								<td>
									<select id="fridge1_heat_stop_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 열량 기동 설정</th>
								<td>
									<select id="fridge2_heat_run_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 열량 정지 설정</th>
								<td>
									<select id="fridge2_heat_stop_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">냉동기#3 열량 기동 설정</th>
								<td>
									<select id="fridge3_heat_run_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#3 열량 정지 설정</th>
								<td>
									<select id="fridge3_heat_stop_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#4 열량 기동 설정</th>
								<td>
									<select id="fridge4_heat_run_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#4 열량 정지 설정</th>
								<td>
									<select id="fridge4_heat_stop_set" name="tagList" style="width: 100%">
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
	<div class="btn_areaC mt5" style="padding-top: 10px;">
		<a class="btnType btn_type02" href="javascript:settingSetRegist();">저장</a>
	</div>
</div>

<!-- s : data_area -->
<div id="data_area">
<div class="scroll" style="height:900px;">
	<div class="data_area_inner">
		<dl>
			<dt>냉각탑 제어설정</dt>
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
							<th scope="row">1그룹 기동온도</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">1그룹 정지온도</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑1 주간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑1 주간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑1 야간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑1 야간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑2 주간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑2 주간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑2 야간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑2 야간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑3 주간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑3 주간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑3 야간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑3 야간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑4 주간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑4 주간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각탑4 야간기동</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각탑4 야간정지</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">℃</span></td>
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
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>
					<tbody>
						<tr>
							<th scope="row">냉동기1 축냉설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기1 냉방설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기2 축냉설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기2 냉방설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3 축냉설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기3 냉방설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기4 축냉설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉동기4 냉방설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>인버터 제어 설정
				<div class="head_right">
					<div class="switch on">
						<span class="stop">정지</span>
						<span class="start">사용</span>
						<em></em>
					</div>
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
							<th scope="row">방냉펌프1 수동 주파수</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프2 수동 주파수</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프3 수동 주파수</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프4 수동 주파수</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프 최저 주파수</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">방냉펌프 최고 주파수</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">통합 수동 주파수</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">수동 주파수 하한값</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">냉단시 축냉펌프 1대 고정주파수 설정</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
							<th scope="row">냉단시 축냉펌프 2대 고정주파수 설정</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">냉단시 축냉펌프 3대 고정주파수 설정</th>
							<td><a href="#" class="font_purple setPop">00</a> <span class="font_yellow">Hz</span></td>
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
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">방냉종료 시간설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">시</span></td>
							<th scope="row">방냉종료 축열량설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">시</span></td>
						</tr>
						<tr>
							<th scope="row">초기부하 지연설정설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">시</span></td>
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
					<col width="35%">
					<col width="*">
					<col width="35%">
					<col width="15%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">기동온도</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">정지온도</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">기동시간</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
							<th scope="row">정지시간</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>정지지연 설정</dt>
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
							<th scope="row">축냉펌프 (심야용)</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
							<th scope="row">축냉펌프 (주간용)</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">냉각수펌프 (심야용)</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
							<th scope="row">냉각수펌프 (주간용)</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">방냉펌프</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">초</span></td>
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
			<dt>기동지연 설정</dt>
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
							<th scope="row">냉동기1</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
							<th scope="row">냉동기2</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
							<th scope="row">냉동기4</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">분</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>전류제한 설정</dt>
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
							<th scope="row">냉동기1</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">%</span></td>
							<th scope="row">냉동기2</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">%</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">%</span></td>
							<th scope="row">냉동기4</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">%</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>냉동기 제어 열량 설정</dt>
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
							<th scope="row">냉동기1 기동설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기1 정지설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기2 기동설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기2 정지설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기3 기동설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기3 정지설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
						</tr>
						<tr>
							<th scope="row">냉동기4 기동설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
							<th scope="row">냉동기4 정지설정</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">USRT</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
</div>
<!-- e : data_area -->
