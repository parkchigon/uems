<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">

	$(document).ready(function(){
		// 실시간 태그 값 조회
		selectTagValue();
	});
	
	/* 삭제하지 말것 */
	function checkDoublePipe() {
	}
</script>
<!-- s : content_area -->
<div id="content_area" class="screen_all">
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
	
		<div class="refrigerating_machine_area">
			<div class="refrigerating_machine_inner">
				<div id="link1" class="refrigerating_machine" style="margin:20px auto;">
					<a id="T09001_fridge1" class="power off">정지</a>
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
										<th scope="row">가동시간(월별)</th>
										<td><span id="T09001_fridge1_monthly_hour">0</span>시 <span id="T09001_fridge1_monthly_min">0</span>분</td>
										<th scope="row">가동시간(적산)</th>
										<td><span id="T09001_fridge1_accum_hour">0</span>시 <span id="T09001_fridge1_accum_min">0</span>분</td>
									</tr>
								</tbody>
							</table>
						</dd>
					</dl>
				</div>
			</div>
		
			<div class="refrigerating_machine_inner">
				<div id="link2" class="refrigerating_machine2" style="margin:20px auto;height:100px;">
					<a id="T09001_fridge2" class="power off">정지</a>
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
										<th scope="row">가동시간(월별)</th>
										<td><span id="T09001_fridge2_monthly_hour">0</span>시 <span id="T09001_fridge2_monthly_min">0</span>분</td>
										<th scope="row">가동시간(적산)</th>
										<td><span id="T09001_fridge2_accum_hour">0</span>시 <span id="T09001_fridge2_accum_min">0</span>분</td>
									</tr>
								</tbody>
							</table>
						</dd>
					</dl>
				</div>
			</div>
			
			<div class="refrigerating_machine_inner">
				<div class="ups" style="margin:40px auto 20px;">
					<a id="T09001_ups_status" class="power off">고장</a>
				</div>
			
				<div class="data_area_inner">
					<dl>
						<dt class="textC">UPS</dt>
					</dl>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- e : content_area -->


<!-- s : popup container -->
<%@ include file="/WEB-INF/views/ems/layerPopup.jsp" %>
<!-- e: popup container -->

<!-- s : Tag Form (Properties & Values) -->
<%@ include file="/WEB-INF/views/ems/system/tagForm.jsp" %>
<!-- e : Tag Form (Properties & Values) -->

