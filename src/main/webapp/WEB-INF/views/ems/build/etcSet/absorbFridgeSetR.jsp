<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
</script>
			
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:800px;">
	
		<div class="data_area_inner">
			<dl>
				<dt>흡수식냉동기 #1 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="fridge1_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="fridge1_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="fridge1_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="fridge1_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="fridge1_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="fridge1_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="fridge1_accum_heat" name="tagList" style="width: 100%">
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
				<dt>흡수식냉동기 #2 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="fridge2_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="fridge2_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="fridge2_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="fridge2_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="fridge2_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="fridge2_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="fridge2_accum_heat" name="tagList" style="width: 100%">
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
				<dt>흡수식냉동기 #3 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="fridge3_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="fridge3_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="fridge3_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="fridge3_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="fridge3_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="fridge3_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="fridge3_accum_heat" name="tagList" style="width: 100%">
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
				<dt>흡수식냉동기 #4 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="fridge4_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="fridge4_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="fridge4_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="fridge4_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="fridge4_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="fridge4_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="fridge4_accum_heat" name="tagList" style="width: 100%">
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
				<dt>흡수식냉동기 #5 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="fridge5_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="fridge5_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="fridge5_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="fridge5_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="fridge5_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="fridge5_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="fridge5_accum_heat" name="tagList" style="width: 100%">
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
				<dt>열교환기 #1 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="heatchange1_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="heatchange1_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="heatchange1_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="heatchange1_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="heatchange1_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="heatchange1_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="heatchange1_accum_heat" name="tagList" style="width: 100%">
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
				<dt>열교환기 #2 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="heatchange2_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="heatchange2_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="heatchange2_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="heatchange2_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="heatchange2_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="heatchange2_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="heatchange2_accum_heat" name="tagList" style="width: 100%">
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
				<dt>열교환기 #3 가동시간 & 열량</dt>
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
								<th scope="row">가동시간(월별 : 시)</th>
								<td>
									<select id="heatchange3_monthly_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(월별 : 분)</th>
								<td>
									<select id="heatchange3_monthly_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">가동시간(적산 : 시)</th>
								<td>
									<select id="heatchange3_accum_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">가동시간(적산 : 분)</th>
								<td>
									<select id="heatchange3_accum_min" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">순시 열량</th>
								<td>
									<select id="heatchange3_inspect_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">월간 순시 열량</th>
								<td>
									<select id="heatchange3_monthly_heat" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">적산열량</th>
								<td>
									<select id="heatchange3_accum_heat" name="tagList" style="width: 100%">
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
				<dt>가동시간 리셋</dt>
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
								<th scope="row">냉동기#1 가동시간</th>
								<td>
									<select id="fridge1_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#2 가동시간</th>
								<td>
									<select id="fridge2_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉동기#3 가동시간</th>
								<td>
									<select id="fridge3_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">브라인#1 가동시간</th>
								<td>
									<select id="brinepump1_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인#2 가동시간</th>
								<td>
									<select id="brinepump2_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">브라인#3 가동시간</th>
								<td>
									<select id="brinepump3_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">흡수식#1 가동시간</th>
								<td>
									<select id="absorb1_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">흡수식#2 가동시간</th>
								<td>
									<select id="absorb2_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">흡수식#3 가동시간</th>
								<td>
									<select id="absorb3_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">흡수식#4 가동시간</th>
								<td>
									<select id="absorb4_accum_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">흡수식#5 가동시간</th>
								<td>
									<select id="absorb5_accum_reset" name="tagList" style="width: 100%">
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
				<dt>누적열량 리셋</dt>
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
								<th scope="row">냉수#1 누적열량</th>
								<td>
									<select id="coolwater1_accum_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉수#2 누적열량</th>
								<td>
									<select id="coolwater2_accum_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">냉수#3 누적열량</th>
								<td>
									<select id="coolwater3_accum_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">흡수식#1 누적열량</th>
								<td>
									<select id="absorb1_accum_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">흡수식#2 누적열량</th>
								<td>
									<select id="absorb2_accum_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">흡수식#3 누적열량</th>
								<td>
									<select id="absorb3_accum_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">흡수식#4 누적열량</th>
								<td>
									<select id="absorb4_accum_heat_reset" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">흡수식#5 누적열량</th>
								<td>
									<select id="absorb5_accum_heat_reset" name="tagList" style="width: 100%">
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
		<a class="btnType btn_type02" href="javascript:etcSetRegist();">저장</a>
		<span>
			<a class="btnType btn_type01" href="javascript:etcSetView('${templateInfo.submenuId}', 'N');">좌측설정</a>
		</span>
	</div>
</div>

<!-- s : data_area -->
<div id="data_area">

<div class="scroll" style="height:880px;">
	
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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
							<td class="textR">182시 2분</td>
							<th scope="row"><a href="#" class="underline">가동시간(적산)</a></th>
							<td class="textR">2727시 11분</td>
						</tr>
						<tr>
							<th scope="row" class="font_green">순시열량</th>
							<td class="textR">183USRT</td>
							<th scope="row" class="font_green">월간 적산열량</th>
							<td class="textR">183USRT-hr</td>
						</tr>
						<tr>
							<th scope="row"><a href="#" class="font_green underline">적산열량</a></th>
							<td class="textR">12345678USRT-hr</td>
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