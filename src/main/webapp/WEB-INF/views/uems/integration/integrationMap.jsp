<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<!-- Google Map API -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAsX0heeA2OWnq_mI-8nSsiNQOB6cUjnbo&v=3.exp&language=ko&region=kr"></script>

<script type="text/javaScript">

	var map, infowindow, markerImage = "";
	var myLatLng = "";
	var mapCenter = new google.maps.LatLng(34.151615, 127.581737);
	var marker = "";
	var displayMarkerInfo = new Array();
	var siteCdList = new Array();
	$(document).ready(function() {
		// TODO JAR 우클릭 방지
		$("body").contextmenu( function() {
			return false;
		});
		
		entryGoogleMap();
		// 실시간 태그값 조회
		setTagValue();

		// 알람리스트
		alarmLayerSet();
		// 실시간 알람 조회
		setAlarmStatus();
		// 10분단위 날씨 조회
		setSiteWeather();
		// 내일 날씨 조회
		setSiteTomorrowWeather();
	});
</script>

<div id="wrap_area">
	<div id="header">
		<h1><img src="/resources/uems/images/map/logo.png" alt="ENERZENT" /></h1>
		<strong class="toDay" id="clock"></strong>
		<div class="topUtil">
			<span class="user">${sessionScope.AUTH.mngName} 님</span>
			<!-- <a class="btn_login" href="/login/logout.do">LOGOUT</a> -->
		</div>
	</div>
	
	<div id="container">
		
		
		<!-- s : content_area -->
		<div id="content_area">
		
			<div class="left_area">
				<c:set var="doneLoop" value="false"/>	
				<!-- s : 지점선택 전 -->
		 		<div class="mini_view_area template_0">
			 		<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '0'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "0" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
		 		</div>
				<!-- s : 지점선택 전 -->	
				<div class="mini_view_area template_1">
					<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '1'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "1" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
				</div>
				<div class="mini_view_area template_2">
					<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '2'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "2" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
				</div>
				<div class="mini_view_area template_3">
					<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '3'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "3" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
				</div>
			</div>
			
			<div class="map_area">
				<div id="map_area"style="width: 100%; height: 100%"></div>
				<div class="alarm_layer open">
					<dl>
						<dt><a href="#"><span class="blind">알림창 열고 닫기</span></a></dt>
						<dd>
							<table class="alarm_layer_table">
							<caption>caption</caption>
							<colgroup>
								<col width="18%">
								<col width="24%">
								<col width="15%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col">지점</th> 
									<th scope="col">시간</th> 
									<th scope="col">태그명</th>
									<th scope="col">알람내용</th> 
								</tr>
							</tbody>
							<tbody id="alarmList">
							
							</tbody>
							</table>
						</dd>
					</dl>
				</div>
			</div>
			
			<div class="right_area">
				<!-- s : 지점선택 전 -->
		 		<div class="mini_view_area template_4">
		 			<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '4'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "4" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
		 		</div>
				<!-- s : 지점선택 전 -->
		 		<div class="mini_view_area template_5">
					<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '5'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "5" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
				</div>			
				<!-- s : 지점선택 전 -->		
				<div class="mini_view_area template_6">
					<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '6'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "6" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
				</div>
				<!-- s : 지점선택 전 -->
				<div class="mini_view_area template_7">
					<c:forEach var="template" items="${templateList}" varStatus="status">
		 				<c:if test="${template.arrayNo eq '7'}">
		 					<c:set var="doneLoop" value="true"/>
		 					<c:set var="templateFilePath" value="${template.templateFilePath}"/>
		 					<c:set var="arrayNo" value="${template.arrayNo}"/>
		 					<c:set var="siteId" value="${template.siteId}"/>
		 				</c:if>
		 			</c:forEach>
		 			
		 			<c:choose>
						<c:when test="${doneLoop eq true}">
							<c:import url="${templateFilePath}" charEncoding="UTF-8">
								<c:param name = "siteId" value = "${siteId}" />
								<c:param name = "arrayNo" value = "${arrayNo}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="/WEB-INF/views/uems/integration/miniDiagramType/defaultTemplate.jsp" charEncoding="UTF-8">
								<c:param name = "arrayNo" value = "7" />
							</c:import>
						</c:otherwise>
					</c:choose>	
					<c:set var="doneLoop" value="false"/>
				</div>
			</div>
		
		</div>
		<!-- e : content_area -->
	
	</div>
</div>

