<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
</script>
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:800px;">
	
		<div class="data_area_inner">
			<dl>
				<dt>냉동기 #1 경보</dt>
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
				<dt>냉동기 #2 경보</dt>
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
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error043" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error044" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error045" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error046" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error047" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error048" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error049" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error050" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error051" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error052" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error053" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error054" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error055" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error056" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error057" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error058" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error059" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error060" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error061" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error062" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error063" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error064" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error065" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error066" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error067" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error068" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error069" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error070" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error071" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error072" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error073" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error074" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error075" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error076" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error077" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error078" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error079" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error080" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
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
				<dt>냉동기 #3 경보</dt>
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
									<select id="alarm_error081" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error082" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error083" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error084" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error085" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error086" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error087" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error088" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error089" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error090" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error091" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error092" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error093" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error094" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error095" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error096" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error097" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error098" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error099" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error100" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error101" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error102" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error103" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error104" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error105" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error106" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error107" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error108" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error109" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error110" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error111" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error112" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error113" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error114" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error115" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error116" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error117" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error118" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error119" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error120" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
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
				<dt>냉동기 #4 경보</dt>
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
									<select id="alarm_error121" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error122" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error123" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error124" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error125" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error126" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error127" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error128" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error129" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error130" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error131" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error132" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error133" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error134" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error135" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error136" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error137" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error138" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error139" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error140" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error141" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error142" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error143" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error144" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error145" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error146" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error147" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error148" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error149" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error150" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error151" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error152" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error153" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error154" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error155" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error156" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error157" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error158" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error159" name="alarmTagList" style="width: 100%">
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
									<select id="alarm_error160" name="alarmTagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${alarmTagList}" varStatus="status">
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
		<a class="btnType btn_type02" href="javascript:etcSetRegist();">저장</a>
		<span>
			<a class="btnType btn_type01" href="javascript:etcSetView('${templateInfo.submenuId}', 'N');">좌측설정</a>
		</span>
	</div>
</div>
		
<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
		<dl>
			<dt><span class="icon_set danger">냉동기 #1 경보</span>
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
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set danger">냉동기 #2 경보</span>
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
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set danger">냉동기 #3 경보</span>
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
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt><span class="icon_set danger">냉동기 #4 경보</span>
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
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->