<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/import.jsp" %>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>

<script type="text/javaScript">
	$(document).ready(function(){
		// TODO JAR 우클릭 방지
		$("body").contextmenu( function() {
			return false;
		});
		selectGeyngbuValue();
	});
	
		// 실시간 태그 값 조회
		function selectGeyngbuValue() {
			if("${sessionScope.SITE_INFO.siteCd}" != "SS004"){
				return false;
			}
			var siteCd = "${sessionScope.SITE_INFO.siteCd}";
			 $.ajax({
				url : "/ems/system/selectGeyngbuValueAjax.do",
				type: "POST",
				data: {siteCd : siteCd},
				dataType : "json",
				async : false
			}).done( function(data) {
				var list = data.tagGeyngbuList;
				var temp = list[0].tagValue;
				var humid = list[1].tagValue;
				$("span[id='temp']").text(temp);
				$("span[id='humid']").text(humid);

			}); 
			
			// TODO JAR 실시간데이터 설정한 밀리세컨드마다 한번씩 호출해야함
			setTimeout("selectGeyngbuValue()",10000);
		}

	
	
</script>
<div id="header">
	<h1>
		<c:if test="${sessionScope.SITE_INFO.sgCd eq 'GE001'}">
			<a href="#layerPop_tel" name="modal"><img src="/resources/ems/images/logo_emart.png" alt="이마트" /></a>
		</c:if>
		<c:if test="${sessionScope.SITE_INFO.sgCd eq 'GS001' && sessionScope.SITE_INFO.siteCd ne 'SS004'}">
			<img src="/resources/ems/images/logo_ssg.png" alt="신세계" />
		</c:if>
		<c:if test="${sessionScope.SITE_INFO.siteCd eq 'SS004'}">
			<img src="/resources/ems/images/seoul_terminal.png" alt="서울고속터미널" />
		</c:if>
		<span>EMS</span>
	</h1>
	<c:if test="${!empty sessionScope.SITE_INFO.siteId}">
		<h2>${sessionScope.SITE_INFO.sgName} / ${sessionScope.SITE_INFO.siteName}</h2>
	</c:if>
	<div class="topUtil">
	<c:if test="${sessionScope.SITE_INFO.siteCd eq 'SS004'}">
		<span class="weather_area">
			<span class="weather sun"><strong><span id="temp">24</span>℃</strong></span>
			<span class="weather humidity"><strong><span id="humid">30</span>%</strong></span>
		</span>
	</c:if>	
		<span class="toDay" id="clock"></span>
		<span class="user">${sessionScope.AUTH.mngName}</span>
		<a class="btn_login" href="javascript:emsLogout();">LOGOUT</a>
	</div>
</div>

	<!-- s : popup container -->
	<div class="popup_container type2" id="layerPop_tel">
		<div class="popup_inner">
			<div class="popup_header"><h2>연락처</h2></div> 
			<div class="popup_body">
				<div class="popup_content">
  			 			
					<div class="main_content">
					
						<!-- s: table wrap-->
						<div>
							<table class="pop_row">
								<colgroup>
									<col width="40%" />
									<col width="60%" />
								</colgroup>
								<tbody>
									<tr>
										<th>상황실 회선번호</th>
										<td class="textL">070-4788-9114~5</td>
									</tr>
									<tr>
										<th>육상욱 팀장</th>
										<td class="textL">010-3135-6165</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- s: btn wrap 가운데 정렬-->
						<div class="pop_btn_wrap">
							<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
							
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
