<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">
	$(document).ready(function(){
	});
	
	function goCheckView(msId,facilityKind,finishYn,facilityId,facilityName){
		$("#msId").val(msId);
		$("#facilityName").val(facilityName);
		$("#facilityKind").val(facilityKind);
		$("#finishYn").val(finishYn);
		$("#facilityId").val(facilityId);
		$("#firstYn").val("N");
		$("#lnbFrm").submit();
	}
</script>

<!-- s : lnb -->
<div id="lnb">
	<form id="lnbFrm" name="lnbFrm" method="POST" action="/mobileWeb/uappCheckView">
		<input type="hidden" id="msId" name="msId" />
		<input type="hidden" id="facilityId" name="facilityId" />
		<input type="hidden" id="facilityKind" name="facilityKind" />
		<input type="hidden" id="facilityName" name="facilityName" />
		<input type="hidden" id="finishYn" name="finishYn" />
		<input type="hidden" id="count" name="count" value="1" />
		<input type="hidden" id="sgId" name="sgId" value="${sessionScope.SITE_INFO.sgId}" />
		<input type="hidden" id="siteName" name="siteName" value="${sessionScope.SITE_INFO.siteName}" />
		<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
		<input type="hidden" id="chkMonth" name="chkMonth" value="${sessionScope.SITE_INFO.chkMonth}" />
		<input type="hidden" id="checkYear" name="checkYear" value="${sessionScope.checkYear}" />
		<input type="hidden" id="checkMonth" name="checkMonth" value="${sessionScope.checkMonth}" />
		<input type="hidden" id="firstYn" name="firstYn" value="${BASIC_INFO.firstYn}" />
	</form>
	<h2 class="lnd_header">${sessionScope.SITE_INFO.siteName} 빙축열<a class="btn_lnb_close" href="#"><span class="blind">메뉴닫기</span></a></h2>
		<div class="scroll" style="height: calc(100% - 45px);">
		<c:forEach var="list" items="${FACILITY_LIST}" varStatus="status">
			<a class="btn_lnb menu1" href="javascript:goCheckView('${list.msId}','${list.facilityKind}','${list.finishYn}','${list.facilityId}','${list.facilityName}')">${list.facilityName}<span class="fr">Status: ${list.finishYnVal}</span></a>
		</c:forEach>
	</div>
</div>
<!-- e : lnb -->

