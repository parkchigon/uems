<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
</script>
<div class="blockDiagram_area" style="width:1212px; height:750px;">

	<div class="refrigerating_machine_area">
		<div class="refrigerating_machine_inner">
			<div id="link1" class="refrigerating_machine" style="margin:20px auto;">
				<a href="#layerPop_type1" class="power off" name="modal">정지</a>
			</div>
		
			<div class="data_area_inner">
				<dl>
					<dt class="textC">상온 흡수식 냉동기</dt>
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
									<th scope="row">정지/기동</th>
									<td >1234시 30분</td>
									<th scope="row">가동시간(월별)</th>
									<td>1234시 30분</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
		</div>
	
		<div class="refrigerating_machine_inner">
			<div id="link2" class="refrigerating_machine2" style="margin:20px auto;height:100px;">
				<a href="#layerPop_type1" class="power off" name="modal">정지</a>
			</div>
		
			<div class="data_area_inner">
				<dl>
					<dt class="textC">상온 터보 냉동기</dt>
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
									<th scope="row">정지/기동</th>
									<td>1234시 30분</td>
									<th scope="row">가동시간(월별)</th>
									<td>1234시 30분</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
		</div>
		
		<div class="refrigerating_machine_inner">
			<div id="link3" class="ups" style="margin:40px auto 20px;">
				<a href="#layerPop_type1" class="power off">정상</a>
			</div>
		
			<div class="data_area_inner">
				<dl>
					<dt class="textC">UPS</dt>
				</dl>
			</div>
		</div>
	</div>
</div>

<div class="btn_areaC mt5">
	<a class="btnType btn_type02" href="javascript:etcSetRegist();">저장</a>
</div>

<!-- s : data_area -->
<div id="data_area">
<div class="scroll" style="height:870px;">
	
	<div class="data_area_inner">
		<dl>
			<dt>상온 흡수식 냉동기<a href="#link1" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">정지/기동</th>
							<td>
								<select id="fridge1" name="tagList" style="width: 100%">
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
							<th scope="row">가동시간(월별)</th>
							<td>
								<select id="fridge1_monthly_hour" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">가동분(월별)</th>
							<td>
								<select id="fridge1_monthly_min" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">가동시간(적산)</th>
							<td>
								<select id="fridge1_accum_hour" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">가동분(적산)</th>
							<td>
								<select id="fridge1_accum_min" name="tagList" style="width: 100%">
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
			<dt>상온 터보 냉동기<a href="#link2" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">정지/기동</th>
							<td>
								<select id="fridge2" name="tagList" style="width: 100%">
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
							<th scope="row">가동시간(월별)</th>
							<td>
								<select id="fridge2_monthly_hour" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">가동분(월별)</th>
							<td>
								<select id="fridge2_monthly_min" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">가동시간(적산)</th>
							<td>
								<select id="fridge2_accum_hour" name="tagList" style="width: 100%">
									<option value="" selected="selected" >TagID</option>
									<c:forEach var="result" items="${tagList}" varStatus="status">
										<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
									</c:forEach>
								</select>
							</td>
							<th scope="row">가동분(적산)</th>
							<td>
								<select id="fridge2_accum_min" name="tagList" style="width: 100%">
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
			<dt>UPS<a href="#link3" class="buildLink" name="buildChak"></a></dt>
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
							<th scope="row">정지/기동</th>
							<td>
								<select id="ups_status" name="tagList" style="width: 100%">
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