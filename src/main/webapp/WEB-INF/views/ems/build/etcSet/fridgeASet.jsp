<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
</script>
			
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:800px;">
		<div class="data_area_inner">
			<dl>
				<dt>냉동기 관리</dt>
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
								<th scope="row">냉수 입구온도</th>
								<td>
									<select id="coolwater_in_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉수 출구온도</th>
								<td>
									<select id="coolwater_out_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각수 입구온도</th>
								<td>
									<select id="cool_in_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉각수 출구온도</th>
								<td>
									<select id="cool_out_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">압축기 #1 입구온도</th>
								<td>
									<select id="compressor1_in_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">압축기 #1 출구온도</th>
								<td>
									<select id="compressor1_out_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">압축기 #2 입구온도</th>
								<td>
									<select id="compressor2_in_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">압축기 #2 출구온도</th>
								<td>
									<select id="compressor2_out_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">압축기 #1 냉매 차압</th>
								<td>
									<select id="compressor1_cooling_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">압축기 #2 냉매 차압</th>
								<td>
									<select id="compressor2_cooling_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">증발기 #1 압력</th>
								<td>
									<select id="evaporator1_pressure_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">증발기 #2 압력</th>
								<td>
									<select id="evaporator2_pressure_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">응축기 #1 압력</th>
								<td>
									<select id="condenser1_pressure_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">응축기 #2 압력</th>
								<td>
									<select id="condenser2_pressure_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">압축기 #1 전류</th>
								<td>
									<select id="compressor1_electric_set" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">압축기 #2 전류</th>
								<td>
									<select id="compressor2_electric_set" name="tagList" style="width: 100%">
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
				<dt>경보</dt>
				<dd>
					<table class="data_row">
					<caption>caption</caption>
					<colgroup>
						<col width="13%">
						<col width="20.3%">
						<col width="13%">
						<col width="20.3%">
						<col width="*">
						<col width="20.3%">
					</colgroup>

						<thead>
							<tr>
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
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error007" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
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
							</tr>
							<tr>
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
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error012" name="alarmTagList" style="width: 100%">
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
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error019" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
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
							</tr>
							<tr>
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
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error024" name="alarmTagList" style="width: 100%">
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
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error031" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
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
							</tr>
							<tr>
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
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error036" name="alarmTagList" style="width: 100%">
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
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
	</div>
	<div class="btn_areaC mt5">
		<a class="btnType btn_type02" href="javascript:etcSetRegist();">저장</a>
	</div>
</div>
		
<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
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
							<th scope="row">냉수 입구온도</th>
							<td><a href="#" class="font_purple setPop">121.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉수 출구온도</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">냉각수 입구온도</th>
							<td><a href="#" class="font_purple setPop">121.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">냉각수 출구온도</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">압축기 #1 입구온도</th>
							<td><a href="#" class="font_purple setPop">121.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">압축기 #1 출구온도</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">압축기 #2 입구온도</th>
							<td><a href="#" class="font_purple setPop">121.0</a> <span class="font_yellow">℃</span></td>
							<th scope="row">압축기 #2 출구온도</th>
							<td><a href="#" class="font_purple setPop">0.0</a> <span class="font_yellow">℃</span></td>
						</tr>
						<tr>
							<th scope="row">압축기 #1 냉매 차압</th>
							<td><a href="#" class="font_purple setPop">00.00</a> <span class="font_yellow">kg/㎠</span></td>
							<th scope="row">압축기 #2 냉매 차압</th>
							<td><a href="#" class="font_purple setPop">00.00</a> <span class="font_yellow">kg/㎠</span></td>
						</tr>
						<tr>
							<th scope="row">증발기 #1 압력</th>
							<td><a href="#" class="font_purple setPop">00.00</a> <span class="font_yellow">kg/㎠</span></td>
							<th scope="row">증발기 #2 압력</th>
							<td><a href="#" class="font_purple setPop">00.00</a> <span class="font_yellow">kg/㎠</span></td>
						</tr>
						<tr>
							<th scope="row">응축기 #1 압력</th>
							<td><a href="#" class="font_purple setPop">00.00</a> <span class="font_yellow">kg/㎠</span></td>
							<th scope="row">응축기 #2 압력</th>
							<td><a href="#" class="font_purple setPop">00.00</a> <span class="font_yellow">kg/㎠</span></td>
						</tr>
						<tr>
							<th scope="row">압축기 #1 전류</th>
							<td><a href="#" class="font_purple setPop">000.0</a> <span class="font_yellow">A</span></td>
							<th scope="row">압축기 #2 전류</th>
							<td><a href="#" class="font_purple setPop">000.0</a> <span class="font_yellow">A</span></td>
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
							<td class=""><a href="#">냉수입구 온도센서 이상</a></td>
							<td class=""><a href="#">압축기 #1 토출온도 높음</a></td>
							<td class=""><a href="#">냉각수입구 온서센서 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">냉수출구 온도센서 이상</a></td>
							<td class=""><a href="#">압축기 #2 토출온도 높음</a></td>
							<td class=""><a href="#">냉각수출구 온서센서 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">냉수#1 유량 저 이상</a></td>
							<td class=""><a href="#">압축기 #1 입구온도센서 이상</a></td>
							<td class=""><a href="#">냉매#1 차압 낮음 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">냉수#2 유량 저 이상</a></td>
							<td class=""><a href="#">압축기 #1 출구온도센서 이상</a></td>
							<td class=""><a href="#">냉매#2 차압 낮음 이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">압축기 #2 입구온도센서 이상</a></td>
							<td class=""><a href="#">기동반 #1 이상</a></td>
							<td class=""><a href="#">기동반 #1 실패</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">압축기 #2 토출온도센서 이상</a></td>
							<td class=""><a href="#">기동반 #2 이상</a></td>
							<td class=""><a href="#">기동반 #2 실패</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">증발기 #1 압력센서 이상</a></td>
							<td class=""><a href="#">응축기 #1 압력센서 이상</a></td>
							<td class=""><a href="#">압력 #1 이상 접점 동작</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">증발기 #2 압력센서 이상</a></td>
							<td class=""><a href="#">응축기 #2 압력센서 이상</a></td>
							<td class=""><a href="#">압력 #2 이상 접점 동작</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">압축기 #1 모터 전원이상</a></td>
							<td class=""><a href="#">압축기 #1 전류센서 이상</a></td>
							<td class=""><a href="#">압축기 #1 전류이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">압축기 #2 모터 전원이상</a></td>
							<td class=""><a href="#">압축기 #2 전류센서 이상</a></td>
							<td class=""><a href="#">압축기 #2 전류이상</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">COMP #1 오일 이상</a></td>
							<td class=""><a href="#">COMP #1 운전중 델타 접촉기 열림</a></td>
							<td class=""><a href="#">응축기 #1 압력 높음</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">COMP #2 오일 이상</a></td>
							<td class=""><a href="#">COMP #2 운전중 델타 접촉기 열림</a></td>
							<td class=""><a href="#">응축기 #2 압력 높음</a></td>
						</tr>
						<tr>
							<td class=""><a href="#">증발기 #1 압력 낮음</a></td>
							<td class=""><a href="#">냉각수 펌프 인터록 이상</a></td>
							<td class=""><a href="#">냉수 펌프 인터록 이상</a></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->
