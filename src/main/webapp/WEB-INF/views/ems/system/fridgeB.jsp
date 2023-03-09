<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	var alarm1Page = 1;
	var alarm2Page = 1;
	var alarm3Page = 1;
	var alarm4Page = 1;

	$(document).ready(function(){
		$('.switch').click(function(){
			if($(this).hasClass('disabled') == false) {
				if($(this).hasClass('on')) {
					$(this).find('.stop').show();
					$(this).find('.start').hide();
					$(this).removeClass('on').addClass('off');
					$(this).prev('.lamp').removeClass('on').addClass('off');
				} else if($(this).hasClass('off')){
					$(this).find('.start').show();
					$(this).find('.stop').hide();
					$(this).removeClass('off').addClass('on');
					$(this).prev('.lamp').removeClass('off').addClass('on');
				}
			};
		});	
		
		// 실시간 태그 값 조회
		selectTagValue();
		// 실시간 알람 조회
		selectAlarmStatus();
	});
	
	
	// 경보 > 페이지 이동
	function moveAlarm(div, divId) {
		var page = 1;
		if (divId == 'alarm1') {
			page = alarm1Page;
		} else if (divId == 'alarm2') {
			page = alarm2Page;
		} else if (divId == 'alarm3') {
			page = alarm3Page;
		} else if (divId == 'alarm4') {
			page = alarm4Page;
		}
		
		var totalPage = Math.ceil($("#"+divId + " .warning tr").size() / 7);
		if(div == "prev") {
			if(page == "1") {
				return;
			} else {
				page = page-1;
			}
		} else if(div == "next") {
			if(page == totalPage) {
				return;
			} else {
				page = page+1;
			}
		}
		
		$("#"+divId + " .warning tr").each(function() {
			if($(this).index() >= ((page-1)*7) && $(this).index() < (page*7)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});

		if (divId == 'alarm1') {
			alarm1Page = page;
		} else if (divId == 'alarm2') {
			alarm2Page = page;
		} else if (divId == 'alarm3') {
			alarm3Page = page;
		} else if (divId == 'alarm4') {
			alarm4Page = page;
		}
	}
	
	/* 삭제하지 말것 */
	function checkDoublePipe() {
	}	
</script>
<!-- s : content_area -->
<div id="content_area">
	<div class="subTab_area">
		<ul>
			<c:forEach var="result" items="${subMenulist}" varStatus="status">
				<c:if test="${result.menuFlag eq 'Y'}">
					<c:if test="${result.submenuId eq subMenu}">
						<li class="on">
					</c:if>
					<c:if test="${result.submenuId ne subMenu}">
						<li>
					</c:if>
						<a href="javascript:emsMainTab('${result.submenuId}');">${result.submenuName}</a>
					</li>				
				</c:if>
			</c:forEach>
		</ul>
	</div>
	
	<div class="blockDiagram_area C64401">
			
		<div class="scroll" style="height:800px;">
		
			<div class="data_area_inner">
				<dl>
					<dt>냉동기 #1</dt>
					<dd>
						<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
	
							<tbody>
								<tr>
									<th scope="row">냉수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_coolwater_in_temp">0</span> ℃</td>
									<th scope="row">냉수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_cool_out_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge1_evaporator_pressure_set">0</span> kPa</td>
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge1_condenser_pressure_set">0</span> kPa</td>
									<th scope="row">증발기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_evaporator_temp">0</span> ℃</td>
									<th scope="row">응측기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_condenser_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일 차압</th>
									<td class="font_yellow"><span id="T08001_fridge1_oil_attach_set">0</span> kPa</td>
									<th scope="row">토출 온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 온도</th>
									<td class="font_yellow"><span id="T08001_fridge1_oil_temp">0</span> ℃</td>
									<th scope="row">전부하 전류</th>
									<td class="font_yellow"><span id="T08001_fridge1_fullload_electric_set">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">냉매 레벨 위치</th>
									<td class="font_yellow"><span id="T08001_fridge1_cooling_level_set">0</span> %</td>
									<th scope="row">가동 시간</th>
									<td class="font_yellow"><span id="T08001_fridge1_run_hour">0</span> hr</td>
									<th scope="row">베어링 간극차</th>
									<td class="font_yellow"><span id="T08001_fridge1_bearing_gap_set">0</span> Mils</td>
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
					<dt>냉동기 #2</dt>
					<dd>
						<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
	
							<tbody>
								<tr>
									<th scope="row">냉수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_coolwater_in_temp">0</span> ℃</td>
									<th scope="row">냉수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_cool_out_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge2_evaporator_pressure_set">0</span> kPa</td>
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge2_condenser_pressure_set">0</span> kPa</td>
									<th scope="row">증발기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_evaporator_temp">0</span> ℃</td>
									<th scope="row">응측기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_condenser_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일 차압</th>
									<td class="font_yellow"><span id="T08001_fridge2_oil_attach_set">0</span> kPa</td>
									<th scope="row">토출 온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 온도</th>
									<td class="font_yellow"><span id="T08001_fridge2_oil_temp">0</span> ℃</td>
									<th scope="row">전부하 전류</th>
									<td class="font_yellow"><span id="T08001_fridge2_fullload_electric_set">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">냉매 레벨 위치</th>
									<td class="font_yellow"><span id="T08001_fridge2_cooling_level_set">0</span> %</td>
									<th scope="row">가동 시간</th>
									<td class="font_yellow"><span id="T08001_fridge2_run_hour">0</span> hr</td>
									<th scope="row">베어링 간극차</th>
									<td class="font_yellow"><span id="T08001_fridge2_bearing_gap_set">0</span> Mils</td>
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
					<dt>냉동기 #3</dt>
					<dd>
						<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
	
							<tbody>
								<tr>
									<th scope="row">냉수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_coolwater_in_temp">0</span> ℃</td>
									<th scope="row">냉수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_cool_out_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge3_evaporator_pressure_set">0</span> kPa</td>
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge3_condenser_pressure_set">0</span> kPa</td>
									<th scope="row">증발기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_evaporator_temp">0</span> ℃</td>
									<th scope="row">응측기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_condenser_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일 차압</th>
									<td class="font_yellow"><span id="T08001_fridge3_oil_attach_set">0</span> kPa</td>
									<th scope="row">토출 온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 온도</th>
									<td class="font_yellow"><span id="T08001_fridge3_oil_temp">0</span> ℃</td>
									<th scope="row">전부하 전류</th>
									<td class="font_yellow"><span id="T08001_fridge3_fullload_electric_set">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">냉매 레벨 위치</th>
									<td class="font_yellow"><span id="T08001_fridge3_cooling_level_set">0</span> %</td>
									<th scope="row">가동 시간</th>
									<td class="font_yellow"><span id="T08001_fridge3_run_hour">0</span> hr</td>
									<th scope="row">베어링 간극차</th>
									<td class="font_yellow"><span id="T08001_fridge3_bearing_gap_set">0</span> Mils</td>
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
					<dt>냉동기 #4</dt>
					<dd>
						<table class="data_row">
						<caption>caption</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
						</colgroup>
	
							<tbody>
								<tr>
									<th scope="row">냉수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_coolwater_in_temp">0</span> ℃</td>
									<th scope="row">냉수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_coolwater_out_temp">0</span> ℃</td>
									<th scope="row">냉각수 입구온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_cool_in_temp">0</span> ℃</td>
									<th scope="row">냉각수 출구온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_cool_out_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">증발기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge4_evaporator_pressure_set">0</span> kPa</td>
									<th scope="row">응축기 압력</th>
									<td class="font_yellow"><span id="T08001_fridge4_condenser_pressure_set">0</span> kPa</td>
									<th scope="row">증발기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_evaporator_temp">0</span> ℃</td>
									<th scope="row">응측기 포화 온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_condenser_temp">0</span> ℃</td>
								</tr>
								<tr>
									<th scope="row">오일 차압</th>
									<td class="font_yellow"><span id="T08001_fridge4_oil_attach_set">0</span> kPa</td>
									<th scope="row">토출 온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_discharge_temp">0</span> ℃</td>
									<th scope="row">오일 온도</th>
									<td class="font_yellow"><span id="T08001_fridge4_oil_temp">0</span> ℃</td>
									<th scope="row">전부하 전류</th>
									<td class="font_yellow"><span id="T08001_fridge4_fullload_electric_set">0</span> %</td>
								</tr>
								<tr>
									<th scope="row">냉매 레벨 위치</th>
									<td class="font_yellow"><span id="T08001_fridge4_cooling_level_set">0</span> %</td>
									<th scope="row">가동 시간</th>
									<td class="font_yellow"><span id="T08001_fridge4_run_hour">0</span> hr</td>
									<th scope="row">베어링 간극차</th>
									<td class="font_yellow"><span id="T08001_fridge4_bearing_gap_set">0</span> Mils</td>
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
	
	<!-- s : data_area -->
	<div id="data_area">
		<div class="data_area_inner" id="alarm1">
			<dl>
				<dt><span class="icon_set danger">냉동기 #1 경보</span>
					<div class="head_right">
						<a href="javascript:moveAlarm('prev', 'alarm1');" class="btn_next pre"><span class="blind">이전페이지</span></a>
						<a href="javascript:moveAlarm('next', 'alarm1');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
							<c:set var="count" value="0"/>
							<c:forEach var="result" items="${tagMapList}" varStatus="status">
								<c:if test="${result.groupId eq 'alarm1'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<c:choose>
											<c:when test="${count > 21}">
												<tr style="display:none;">
											</c:when>
											<c:otherwise>
												<tr>
											</c:otherwise>
										</c:choose>
									</c:if>
									<td class="" id="${result.templateId}_${result.componentId}"><a href="javascript:goAlarm();">${result.displayName}</a></td>
									<c:if test="${count % 3 eq '0'}">	
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
		
		<div class="data_area_inner mt10" id="alarm2">
			<dl>
				<dt><span class="icon_set danger">냉동기 #2 경보</span>
					<div class="head_right">
						<a href="javascript:moveAlarm('prev', 'alarm2');" class="btn_next pre"><span class="blind">이전페이지</span></a>
						<a href="javascript:moveAlarm('next', 'alarm2');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
							<c:set var="count" value="0"/>
							<c:forEach var="result" items="${tagMapList}" varStatus="status">
								<c:if test="${result.groupId eq 'alarm2'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<c:choose>
											<c:when test="${count > 21}">
												<tr style="display:none;">
											</c:when>
											<c:otherwise>
												<tr>
											</c:otherwise>
										</c:choose>
									</c:if>
									<td class="" id="${result.templateId}_${result.componentId}"><a href="javascript:goAlarm();">${result.displayName}</a></td>
									<c:if test="${count % 3 eq '0'}">	
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
		
		<div class="data_area_inner mt10" id="alarm3">
			<dl>
				<dt><span class="icon_set danger">냉동기 #3 경보</span>
					<div class="head_right">
						<a href="javascript:moveAlarm('prev', 'alarm3');" class="btn_next pre"><span class="blind">이전페이지</span></a>
						<a href="javascript:moveAlarm('next', 'alarm3');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
							<c:set var="count" value="0"/>
							<c:forEach var="result" items="${tagMapList}" varStatus="status">
								<c:if test="${result.groupId eq 'alarm3'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<c:choose>
											<c:when test="${count > 21}">
												<tr style="display:none;">
											</c:when>
											<c:otherwise>
												<tr>
											</c:otherwise>
										</c:choose>
									</c:if>
									<td class="" id="${result.templateId}_${result.componentId}"><a href="javascript:goAlarm();">${result.displayName}</a></td>
									<c:if test="${count % 3 eq '0'}">	
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
		
		<div class="data_area_inner mt10" id="alarm4">
			<dl>
				<dt><span class="icon_set danger">냉동기 #4 경보</span>
					<div class="head_right">
						<a href="javascript:moveAlarm('prev', 'alarm4');" class="btn_next pre"><span class="blind">이전페이지</span></a>
						<a href="javascript:moveAlarm('next', 'alarm4');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
							<c:set var="count" value="0"/>
							<c:forEach var="result" items="${tagMapList}" varStatus="status">
								<c:if test="${result.groupId eq 'alarm4'}">
									<c:set var="count" value="${count+1}"/>
									<c:if test="${count % 3 eq '1'}">	
										<c:choose>
											<c:when test="${count > 21}">
												<tr style="display:none;">
											</c:when>
											<c:otherwise>
												<tr>
											</c:otherwise>
										</c:choose>
									</c:if>
									<td class="" id="${result.templateId}_${result.componentId}"><a href="javascript:goAlarm();">${result.displayName}</a></td>
									<c:if test="${count % 3 eq '0'}">	
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
	</div>
	<!-- e : data_area -->
</div>
<!-- e : content_area -->

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->
