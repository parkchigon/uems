<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		$('.switch').click(function(){
			if($(this).hasClass('disabled') == false) {
				var value = "";
				if($(this).hasClass('on')) {
					$(this).find('.stop').show();
					$(this).find('.start').hide();
					$(this).removeClass('on').addClass('off');
					$(this).prev('.lamp').removeClass('on').addClass('off');
					value = "0";
				} else if($(this).hasClass('off')){
					$(this).find('.start').show();
					$(this).find('.stop').hide();
					$(this).removeClass('off').addClass('on');
					$(this).prev('.lamp').removeClass('off').addClass('on');
					value = "1";
				}
				
				if($(this).attr("id").endsWith("alarm_reset")) {				// 경보 > 알람 리셋
					if(value == "1") {
						var json = new Object();
						var array = new Array();
						json.tagId = $("#tagForm input[class="+$(this).attr("id")+"]").attr("id");
						var plcNo = $("#tagForm input[class="+$(this).attr("id")+"]").attr("plcno");		// 제어 PLC번호
						json.value = value;
						array.push(json);
						var request = new Object();
						request.siteCd = $("#siteCd").val();
						request.plcNo = plcNo;
						request.tagList = array;
						if(array.length > 0) {
							console.log("siteCd:"+$("#siteCd").val());
							console.log("plcNo:"+plcNo);
							console.log(array.length, array);
							updateAlarmReset();
							updateTagValue(request);
						}
					}
					return;
				} else if ($(this).attr("id").indexOf("_drive") > 0) {	// 시스템상태 > 운전 선택 시
					var json = new Object();
					var array = new Array();
					json.tagId = $("#tagForm input[class="+$(this).attr("id")+"]").attr("id");
					var plcNo = $("#tagForm input[class="+$(this).attr("id")+"]").attr("plcno");		// 제어 PLC번호
					json.value = value;
					array.push(json);
					
					var request = new Object();
					request.siteCd = $("#siteCd").val();
					request.plcNo = plcNo;
					request.tagList = array;
					if(array.length > 0) {
						console.log("siteCd:"+$("#siteCd").val());
						console.log("plcNo:"+plcNo);
						console.log(array.length, array);
						updateTagValue(request);
					}
				} 	
			};
		});	
		// 실시간 태그 값 조회
		selectTagValue();
	});
	
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
	<div class="blockDiagram_area">
	
		<div class="chw">
			<span class="pipe_chw_ud down pipe001" name="T05001_pipe1"></span>
			<span class="pipe_chw_ud up pipe002" name="T05001_pipe1"></span>
			<span class="pipe_chw_ud down pipe003" name="T05001_pipe1"></span>
			<span class="pipe_chw_ud up pipe004" name="T05001_pipe1"></span>
			<span class="pipe_chw_ud up pipe005" name="T05001_pipe3"></span>
			<span class="pipe_chw_ud down pipe006" name="T05001_pipe3"></span>
			
			<span class="pipe_chw_lr left pipe001" name="T05001_pipe1"></span>
			<span class="pipe_chw_lr left pipe002" name="T05001_pipe1"></span>
			<span class="pipe_chw_lr left pipe003" name="T05001_pipe1"></span>
			<span class="pipe_chw_lr right pipe004" name="T05001_pipe3"></span>
			<span class="pipe_chw_lr right pipe005" name="T05001_pipe1"></span>
			<span class="pipe_chw_lr right pipe006" name="T05001_pipe2"></span>
			<span class="pipe_chw_lr right pipe007" name="T05001_pipe1"></span>
			
			<span class="pipe_chw_corner_ur corner001"></span>
			<span class="pipe_chw_corner_ur corner002"></span>
			<span class="pipe_chw_corner_ur corner003"></span>
			
			<span class="pipe_chw_corner_ul corner001"></span>
			<span class="pipe_chw_corner_ul corner002"></span>
			<span class="pipe_chw_corner_ul corner003"></span>
			
			<span class="pipe_chw_corner_dr corner001"></span>
			<span class="pipe_chw_corner_dr corner002"></span>
			
			<span class="pipe_chw_t_lru corner001"></span>
			<span class="pipe_chw_t_lru corner002"></span>
			
			<span class="sensor_u_temperature sensor001"><em class="font_sky"><span id="T05001_boiler_out_temp"></span>℃</em></span>
			<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="T05001_boiler_in_temp"></span>℃</em></span>
			
			<div class="coolpump_area">
				<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1', 'T05001', 'boilerpump_pre');">
					<span class="fan" id="T05001_boilerpump_pre"></span>
				</a>
				<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1', 'T05001', 'boilerpump_main');">
					<span class="fan" id="T05001_boilerpump_main"></span>
				</a>
				<strong class="text_info">난방순환펌프</strong>
			</div>
			
		</div>
		
		<div class="header_lr"><span class="text">2차측부하</span></div>
		
		<div class="boiler">
			<a href="javascript:openLayerPop('#layerPop_type1', 'T05001', 'boiler');" class="power on" id="T05001_boiler">가동</a>
		</div>
		
	</div>
</div>
<!-- e : content_area -->

<!-- s : data_area -->
<div id="data_area">
	
	<div id="data_area">
			
		<div class="data_area_inner">
			<dl class="left">
				<dt><span class="icon_set sys">시스템 상태</span></dt>
				<dd>
					<ul class="right_style">
						<li>
							<span class="tit">보일러 운전</span>
							<span class="lamp on"></span>
							<div class="switch off" id="T05001_boiler_drive">
								<span class="stop">정지</span>
								<span class="start">가동</span>
								<em></em>
							</div>
						</li>
						<li>
							<span class="tit">동파방지 운전</span>
							<span class="lamp off"></span>
							<div class="switch off" id="T05001_freeze_protect_drive">
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
							<a href="javascript:openLayerPop('#layerPop_type3', 'T05001', 'boiler_run_temp');" class="font_purple setPop" ><span id="T05001_boiler_run_temp"></span><span class="font_yellow"> ℃</span></a>
						</li>
						<li>
							<span class="tit">보일러 정지온도</span>
							<a href="javascript:openLayerPop('#layerPop_type3', 'T05001', 'boiler_stop_temp');" class="font_purple setPop"><span id="T05001_boiler_stop_temp"></span><span class="font_yellow"> ℃</span></a>
						</li>
						<li>
							<span class="tit">동파방지 기동시간</span>
							<a href="javascript:openLayerPop('#layerPop_type3', 'T05001', 'freeze_protect_run_hour');" class="font_purple setPop"><span id="T05001_freeze_protect_run_hour"></span><span class="font_yellow"> 분</span></a>
						</li>
						<li>
							<span class="tit">동파방지 정지시간</span>
							<a href="javascript:openLayerPop('#layerPop_type3', 'T05001', 'freeze_protect_stop_hour');" class="font_purple setPop"><span id="T05001_freeze_protect_stop_hour"></span><span class="font_yellow"> 분</span></a>
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
						<div class="mr5 switch off" id="T05001_alarm_reset">
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
							<c:forEach var="result" items="${tagMapList}" varStatus="status">
								<c:if test="${result.groupId eq 'alarm'}">
									<td class="" id="${result.templateId}_${result.componentId}"><a href="javascript:goAlarm();">${result.displayName}</a></td>
								</c:if>
							</c:forEach>
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
		</div>
	</div>
	
</div>
<!-- e : data_area -->

<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->	

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->
