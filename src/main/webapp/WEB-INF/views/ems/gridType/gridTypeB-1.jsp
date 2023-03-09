<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	var alarmPage = 1;
	
	// 경보 > 페이지 이동
	function moveAlarm(div) {
		var totalPage = Math.ceil($(".warning tr").size() / 7);
		if(div == "prev") {
			if(alarmPage == "1") {
				return;
			} else {
				alarmPage = alarmPage-1;
			}
		} else if(div == "next") {
			if(alarmPage == totalPage) {
				return;
			} else {
				alarmPage = alarmPage+1;
			}
		}
		
		$(".warning tr").each(function() {
			if($(this).index() >= ((alarmPage-1)*7) && $(this).index() < (alarmPage*7)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	}
	
</script>


<!-- s : data_area -->
<div id="data_area">
	<div class="data_area_inner">
		<dl class="left">
			<dt><span class="icon_set sys">시스템 상태</span></dt>
			<dd>
				<ul class="right_style">
					<li>
						<span class="tit">축냉운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02006_storagetank_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">방냉운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02006_icestorage_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">동시운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02006_winter_drive">
							<span class="stop">정지</span>
							<span class="start">가동</span>
							<em></em>
						</div>
					</li>
					<li>
						<span class="tit">냉단운전</span>
						<span class="lamp off"></span>
						<div class="switch off" id="T02006_coolstorage_drive">
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
						<a href="javascript:openLayerPop('#layerPop_type3','T02006','storagetank_end_temp_set');" class="font_purple setPop" ><span id="T02006_storagetank_end_temp_set" > </span> <span class="font_yellow">℃</span></a>
					</li>
					<li>
						<span class="tit">축냉종료 시간설정</span>
						<a href="javascript:openLayerPop('#layerPop_type3','T02006','storagetank_end_time_set');" class="font_purple setPop" ><span id="T02006_storagetank_end_time_set" > </span> <span class="font_yellow">분</span></a>
					</li>
					<li>
						<span class="tit"><a href="javascript:openLayerPop('#layerPop_type10','T02006','storagetank');">축냉완료</a></span>
						<span class="lamp off" id="T02006_storagetank_end"></span>
						<span id="T02006_storagetank_end_text">해지</span>
					</li>
					<li>&nbsp;</li>
				</ul>
			</dd>
		</dl>
		<div class="both"></div>
	</div>
	
	<div class="data_area_inner mt5">
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
							<td class="font_yellow"><span id="T02006_inspect_storagetank_heat"></span> USRT</td>
							<th scope="row">누적 축냉열량</th>
							<td class="font_yellow"><span id="T02006_accum_storagetank_heat"></span> USRT-hr</td>
						</tr>
						<tr>
							<th scope="row">순시 방냉열량</th>
							<td class="font_yellow"><span id="T02006_inspect_icestorage_heat"></span> USRT</td>
							<th scope="row">누적 방냉열량</th>
							<td class="font_yellow"><span id="T02006_accum_icestorage_heat" ></span> USRT-hr</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_btn_area mt5">
		<span class="freeSize mr5">축냉 열량리셋</span>
		<div class="switch off" id="T02006_accum_storagetank_heat_reset" >
			<span class="stop">&nbsp;</span>
			<span class="start">리셋</span>
			<em></em>
		</div>
		<span class="freeSize ml20 mr5">방냉 열량리셋</span>
		<div class="switch off" id="T02006_accum_icestorage_heat_reset">
			<span class="stop">&nbsp;</span>
			<span class="start">리셋</span>
			<em></em>
		</div>
	</div>
	
	<div class="data_area_inner mt5">
		<dl>
			<dt>온도 제어</dt>
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
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02006','fridge1_run_temp');" class="font_purple setPop" ><span id="T02006_fridge1_run_temp"></span></a> ℃</td>
							<th scope="row">냉동기 1-1 정지설정</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02006','fridge1_stop_temp');" class="font_purple setPop" ><span id="T02006_fridge1_stop_temp" ></span></a> ℃</td>
						</tr>
						<tr>
							<th scope="row">냉동기 2-1 기동설정</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02006','fridge2_run_temp');" class="font_purple setPop" ><span id="T02006_fridge2_run_temp"></span></a> ℃</td>
							<th scope="row">냉동기 2-1 정지설정</th>
							<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','T02006','fridge2_stop_temp');" class="font_purple setPop" ><span id="T02006_fridge2_stop_temp"></span></a> ℃</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
		<dl>
			<dt>설정 관리
				<div class="head_right">
					<a class="btn_use">경부하 운전사용</a>
					<div class="switch off" style="width: 65px;" id="T02006_lightload_use_yn">
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
						<c:set var="count" value="0"/>
						<c:forEach var="result" items="${tagMapList}" varStatus="status">
							<c:if test="${result.groupId eq 'set_control'}">
								<c:set var="count" value="${count+1}"/>
								<c:if test="${count % 2 eq '1'}">	
									<tr>
								</c:if>
								<th scope="row">${result.displayName}</th>
								<td class="font_yellow"><a href="javascript:openLayerPop('#layerPop_type3','${result.templateId}','${result.componentId}');" class="font_purple setPop" ><span id="${result.templateId}_${result.componentId}" > </span></a> <span id="UNIT_${result.componentId}" ></span></td>
								<c:if test="${count % 2 eq '0'}">	
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt5">
		<dl>
			<dt><span class="icon_set danger">경보</span>
				<div class="head_right">
					<span class="reAlarm">알람리셋</span>
					<div class="mr5 switch off" id="T02006_alarm_reset">
						<em></em>
					</div>
					<a href="javascript:moveAlarm('prev');" class="btn_next pre"><span class="blind">이전페이지</span></a>
					<a href="javascript:moveAlarm('next');" class="btn_next next"><span class="blind">다음페이지</span></a>
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
							<c:if test="${result.groupId eq 'alarm'}">
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