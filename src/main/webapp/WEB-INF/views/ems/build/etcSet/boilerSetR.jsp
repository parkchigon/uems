<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">
</script>
			
<div class="blockDiagram_area" style="width:1212px;">
	<div class="scroll" style="height:800px;">
	
		<div class="data_area_inner">
			<dl>
				<dt>시스템 상태</dt>
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
								<th scope="row">보일러 정지/기동</th>
								<td>
									<select id="boiler_drive" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">동파방지 정지/기동</th>
								<td>
									<select id="freeze_protect_drive" name="tagList" style="width: 100%">
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
				<dt>설정관리</dt>
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
								<th scope="row">보일러 기동온도</th>
								<td>
									<select id="boiler_run_temp" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">보일러 정지온도</th>
								<td>
									<select id="boiler_stop_temp" name="tagList" style="width: 100%">
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
								<th scope="row">동파방지 기동시간</th>
								<td>
									<select id="freeze_protect_run_hour" name="tagList" style="width: 100%">
										<option value="" selected="selected" >TagID</option>
										<c:forEach var="result" items="${tagList}" varStatus="status">
											<option value="${result.tagId}">[${result.tagId}] ${result.tagDesc}</option>
										</c:forEach>
									</select>
								</td>
								<th scope="row">동파방지 정지시간</th>
								<td>
									<select id="freeze_protect_stop_hour" name="tagList" style="width: 100%">
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
							</tr>
							<tr>
								<th scope="row"><input type="text" name="displayName" /></th>
								<td>
									<select id="alarm_error003" name="alarmTagList" style="width: 100%">
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
		<dl class="left">
			<dt><span class="icon_set sys">시스템 상태</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">보일러 운전</span>
						<span class="lamp off"></span>
						<div class="switch off">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">동파방지 운전</span>
						<span class="lamp off"></span>
						<div class="switch off">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>&nbsp;</li>
					<li>&nbsp;</li>
				</ul>
			</dd>
		</dl>
		<dl class="right">
			<dt><span class="icon_set set">설정 관리</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">보일러 기동온도</span>
						<a href="#layerPop_type2" class="font_purple setPop" name="modal">0.0</a> <span class="font_yellow">℃</span>
					</li>
					<li>
						<span class="tit">보일러 정지온도</span>
						<a href="#layerPop_type2" class="font_purple setPop" name="modal">0.0</a> <span class="font_yellow">℃</span>
					</li>
					<li>
						<span class="tit">동파방지 기동시간</span>
						<a href="#layerPop_type2" class="font_purple setPop" name="modal">0.0</a> <span class="font_yellow">분</span>
					</li>
					<li>
						<span class="tit">동파방지 정지시간</span>
						<a href="#layerPop_type2" class="font_purple setPop" name="modal">0.0</a> <span class="font_yellow">분</span>
					</li>
				</ul>
			</dd>
		</dl>
		<div class="both"></div>
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
							<td><a href="#">보일러 이상</a></td>
							<td><a href="#">난방 FLOW S/W 이상</a></td>
							<td><a href="#">난방펌프 기동이상</a></td>
						</tr>
						<tr>
							<td class=""></td>
							<td class=""></td>
							<td class=""></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->