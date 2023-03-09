<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
	
		selectSiteList($("select[name=insertCondition]").val());
		
		$("select[name=insertCondition]").change(function() {
			var arrayNo = $(this).attr('id').split("_")[1];
			selectSiteList(arrayNo, $(this).val());
		});
		
	});
	
</script>
<div class="mini_view_area">
	<dl>
		<dt>
			<span class="title"></span>
			<div class="fr">
				<select id="insertCondition_${param.arrayNo}" name="insertCondition" style="width: 130px">
					<option value="">전체</option>
					<c:forEach var="result" items="${groupAllList}" varStatus="status">
						<option value="${result.sgId}">${result.sgName}</option>
					</c:forEach>
				</select>
				
				<select id="insertCondition2_${param.arrayNo}" name="insertCondition2" style="width: 160px">
				</select>
				<a href="javascript:addIntegrationTemplate('${param.arrayNo}')" class="btn">확인</a>
			</div>
		</dt>
		<dd> </dd>
	</dl>
</div>