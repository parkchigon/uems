<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>

<script type="text/javaScript">
	$(document).ready(function(){
	
		<c:if test="${LIST eq 'NULL'}">
			alert("점검목록이 없습니다!");
		</c:if>
		
		var date = new Date();
		var yearHtml = "";
		var monthHtml = "";
		var currentYear = date.getFullYear();
		var currentMonth = date.getMonth()+1;
		for(var i= 2015; i<currentYear+1; i++){
			yearHtml += '<option value='+i+'>'+i+' 년</option>'; 
		}
		$("#checkYear").append(yearHtml);
		$("#checkYear").val(currentYear);
		
		for(var i= 4; i<currentMonth+1; i++){
			if(i<10){
				monthHtml += '<option value=0'+i+'>'+i+' 월</option>'; 
			}else{
				monthHtml += '<option value='+i+'>'+i+' 월</option>'; 
			}
		}
		$("#checkMonth").append(monthHtml);
		if(currentMonth < 10){
			$("#checkMonth").val("0"+currentMonth);
		}else{
			$("#checkMonth").val(currentMonth);
		}
		
		$("select[name=checkYear]").change(function(){
			var monthHtml2 = '';
			if($(this).val()==currentYear){
				if(currentMonth > 4){
					for(var i= 4; i<currentMonth+1; i++){
						if(i<10){
							monthHtml2 += '<option value=0'+i+'>'+i+' 월</option>'; 
						}else{
							monthHtml2 += '<option value='+i+'>'+i+' 월</option>'; 
						}
					}
				}
			}else{
				for(var i= 4; i<12; i++){
					if(i<10){
						monthHtml2 += '<option value=0'+i+'>'+i+' 월</option>'; 
					}else{
						monthHtml2 += '<option value='+i+'>'+i+' 월</option>'; 
					} 
				}
			}
			$("#checkMonth").empty();
			$("#checkMonth").append(monthHtml2);
		})

		
		
	});

	/* 점검시작 버튼 클릭 시 --> 해당지점 장비점검화면으로 이동  +  해당지점의 장비점검 상태값 변경 */
	function startCheck(){
		
		var year = $("#checkYear option:selected").val();
		var month = $("#checkMonth option:selected").val();
		$("#chkMonth").val(year+month);
		
		frm.action = "<c:url value='/mobileWeb/uappCheckView'/>";
		frm.submit();
	}
</script>

<div id="wrap_area">
<form id="frm" name="frm" method="post">
	<input type="hidden" id="siteId" name="siteId" value="${sessionScope.SITE_INFO.siteId}" />
	<input type="hidden" id="sgId" name="sgId" value="${sessionScope.SITE_INFO.sgId}" />
	<input type="hidden" id="siteName" name="siteName" value="${sessionScope.SITE_INFO.siteName}" />
	<input type="hidden" id="sgName" name="sgName" value="${sessionScope.SITE_INFO.sgName}" />
	<input type="hidden" id="chkMonth" name="chkMonth" />
	<input type="hidden" id="finishYn" name="finishYn" value="N" />
	<input type="hidden" id="count" name="count" value="0" />
	<input type="hidden" id="firstYn" name="firstYn" value="Y" />
		
	<div class="search_area">
		<c:if test="${sessionScope.SITE_INFO.sgId eq '1'}">
			<img src="/resources/mobile/images/logo_emart.png" alt="이마트" />
		</c:if>
		<c:if test="${sessionScope.SITE_INFO.sgId eq '2'}">
			<img src="/resources/mobile/images/logo_ssg.png" alt="신세계" />
		</c:if>
		<dl>
			<dt>${sessionScope.SITE_INFO.siteName}</dt>
			<dd>
				<select id="checkYear" name="checkYear" style="width: 120px;">
				</select>
				<select id="checkMonth" name="checkMonth" style="width: 80px;margin-left: 15px;">
				</select>
			</dd>
		</dl>
		<div class="btn_areaC mt5">
			<a class="btnType btn_type02 btn_big" href="javascript:startCheck();">점검시작</a>
		</div>
	</div>
</form>	
</div>
</body>
</html>