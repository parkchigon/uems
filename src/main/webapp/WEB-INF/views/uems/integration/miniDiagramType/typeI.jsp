<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		
	});
	
	
</script>
	<c:forEach var="integration" items="${integrationList}" varStatus="status">
		<c:set var="siteId" value="${param.siteId}"/>
		<c:set var="arrayNo" value="${param.arrayNo}"/>
		
		<c:if test="${integration.siteId eq siteId and integration.arrayNo eq arrayNo}">
			<c:set var="siteName" value="${integration.siteName}"/>	
			<c:set var="componentId" value="${integration.componentId}"/>	
			<c:set var="weatherX" value="${integration.weatherX}"/>	
			<c:set var="weatherY" value="${integration.weatherY}"/>	
			<c:set var="siteCd" value="${integration.siteCd}"/>
			<c:set var="sgName" value="${integration.sgName}"/>
			<c:set var="sgCd" value="${integration.sgCd}"/>
		</c:if>
	</c:forEach>
	<input type="hidden" id="siteCd_${siteId}" name="siteCd" value="${siteCd}"/>
	<dl id="template_${siteCd}">
		<dt>
			<c:choose>
				<c:when test="${sgCd eq 'GE001'}">
					<span class="title emart" id="siteName"><a href="javascript:goEms(${siteId}, 'ems');"><c:out value="${siteName}"/></a></span>
				</c:when>
				<c:otherwise>
					<span class="title ssg" id="siteName"><a href="javascript:goEms(${siteId}, 'ems');"><c:out value="${siteName}"/></a></span>
				</c:otherwise>
			</c:choose>
			<!-- <img class="frequency" src="/resources/uems/images/map/icon_frequency_off.gif" alt="통신중단"> -->
			<span class="fr">
				<div class="today">현재 : 
					<span class="teh"></span>
					<span class="reh"></span>
				</div>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<div class="tomorrow">내일 : 
					<span class="weather">
						<span class="tmn"></span> / <span class="tmx"></span>
					</span>
				</div>
				&nbsp;&nbsp;
			</span>
			<a href="javascript:deleteTemplate('${siteId}','${arrayNo}');" class="close"><span class="blind">닫기</span></a>
		</dt>
		<dd>
			<div class="mini_view_inner_mask"><strong>접속이 원활하지 않습니다.</strong></div>
			<div class="mini_view_inner type9">
				<span id="fridge_storagetank_in_temp" class="temperature normal01" title="냉동기입구 온도"></span> 						<!-- 10.0℃ -->
				<span id="storagetank_high_temp" class="temperature normal02" title="축열조입구 온도"></span>								<!-- 6.5℃ -->
				<span id="storagetank_low_temp" class="temperature normal03" title="축열조출구 온도"></span>								<!-- 9.0℃ -->
				<span id="icestorage_out_temp" class="temperature normal04" title="열교환기출구 온도"></span>									<!-- 9.0℃ -->
				<span id="fridge_storagetank_out_temp" class="temperature normal05" title="냉동기출구 온도"></span>								<!-- 6.5℃  -->
				<span id="icestorage_in_temp" class="temperature normal06" title="열교환기입구 온도"> </span>									<!-- 5.0℃ -->
				<span id="fridge_cool_out_temp" class="temperature font_red hot01" title="냉각수출구 온도"> </span>                    		<!-- 30.0℃ -->
				<span id="coolwater_in_temp" class="temperature font_red hot02" title="냉수입구 온도"> </span>							<!-- 11.0℃ -->
				<span id="fridge_cool_in_temp" class="temperature font_sky cool01" title="냉각수입구 온도"></span>							<!-- 27.0℃ -->
				<span id="coolwater_out_temp" class="temperature font_sky cool02" title="냉수출구 온도"></span>             	  			<!-- 9.0℃ -->
				
				<div class="machine no01">
					<span class="">#1 <em class="play" id="cooltower1_1">가동</em> <em class="stop" id="cooltower1_2">정지</em></span>
					<span class="">#2 <em class="play" id="cooltower2_1">가동</em> <em class="stop" id="cooltower2_2">정지</em></span>
					<span class="">#3 <em class="play" id="cooltower3_1">가동</em> <em class="stop" id="cooltower3_2">정지</em></span>
					<span class="">#4 <em class="play" id="cooltower4_1">가동</em> <em class="stop" id="cooltower4_2">정지</em></span>
				</div>
				
				<div class="pump_area area01">
					<span class="pump stop" name="coolpump"></span>
					<span class="text_info">냉각수펌프</span>
				</div>
				
				<div class="machine no02">
					<span class="">#1 <em class="stop" id="fridge1">가동</em></span>
					<span class="">#2 <em class="stop" id="fridge2">가동</em></span>
					<span class="">#3 <em class="stop" id="fridge3">가동</em></span>
					<span class="">#4 <em class="stop" id="fridge4">가동</em></span>
				</div>
				
				<div class="pump_area area02">
					<span class="pump stop" name="storagetankpump"></span>
					<span class="text_info">축냉펌프</span>
				</div>
				
				<div class="machine no03 drive${siteCd}">
					<span class="" id="storagetank_heatstorage"></span>
					<!-- TEMPLATE 축열조 운전상태 -->
				</div>
				
				<div class="pump_area area03">
					<span class="pump no1" id="icestorage_inv_frequency1" name="icestoragepump1"></span>
					<span class="pump no2" id="icestorage_inv_frequency2" name="icestoragepump2"></span>
					<span class="pump no3" id="icestorage_inv_frequency3" name="icestoragepump3"></span>
					<span class="pump no4" id="icestorage_inv_frequency4" name="icestoragepump4"></span>
					<span class="text_info">방냉펌프</span>
				</div>
				
				<div class="machine no04">
					<span class="">#1 <em class="stop" id="heatchange1">미선택</em></span>
					<span class="">#2 <em class="stop" id="heatchange2">미선택</em></span>
					<span class="">#3 <em class="stop" id="heatchange3">미선택</em></span>
				</div>
				
				<div class="machine no05">
					<span class="" id="inspect_icestorage_heat"></span>
				</div>
			</div>
		</dd>
	</dl>
