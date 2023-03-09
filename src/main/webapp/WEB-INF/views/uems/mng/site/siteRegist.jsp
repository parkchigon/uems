<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	
	$(document).ready(function(){
		
		setTextLengthLimit("#siteCd", 5);
		setTextLengthLimit("#siteName", 20);
		setTextLengthLimit("#siteDesc", 100);
		setTextLengthLimit("#siteIp", 15);
		setTextLengthLimit("#companyNo", 30);
		setTextLengthLimit("#address", 100);
		setTextLengthLimit("#telNo", 45);
		setTextLengthLimit("#totalArea", 10);
		setTextLengthLimit("#chargePersonName", 20);
		setTextLengthLimit("#chargePersonTel", 15);
		setTextLengthLimit("#techOperationTel", 20);
		setTextLengthLimit("#regionX", 20);
		setTextLengthLimit("#regionY", 20);
		setTextLengthLimit("#remarks", 500);
		
		if(isEmpty($("#remarks").val())) {
			$("#remarks").val("고지서 고객번호 : \n팀뷰어ID/PW : ");
		}
		
		if(!isEmpty($("input[name=siteId]").val())){
			//수정화면 셋팅(컬럼 disable)
			$("input[name=siteCd]").attr("readonly","true");
			$("input[name=siteCd]").attr("class","inp_txt w01 dis");
			
			$("select[name=sgId]").val('${siteView.sgId}').attr("selected", true);
			$("select[name=sgId]").attr("class","inp_txt w01 dis");
			$("select[name=sgId]").attr("disabled", true);
			
			$("select[name=regionCd]").val('${siteView.regionCd}').attr("selected", true);
			$("select[name=prevFacilityCode]").val('${siteView.prevFacilityCode}').attr("selected", true);
			$("select[name=statStartDay]").val('${siteView.statStartDay}').attr("selected", true);
			$("select[name=statEndDay]").val('${siteView.statEndDay}').attr("selected", true);
			if('${siteView.statStartDay}' == "01") {
				$("#statEndDay").attr("disabled", true);
			}
			$('input:radio[name=useFlag]:input[value='+'${siteView.useFlag}'+']').attr("checked", true);
		} else {
			// 초기값 통계월시작일 1일 ~ 익월종료일 31일 세팅
			$("#statEndDay").val("31").attr("disabled", true);
		}
		
		$("#statStartDay").change(function() {
			if($(this).val() == "01") {
				$("#statEndDay").val("31").attr("disabled", true);
			} else {
				$("#statEndDay").attr("disabled", false);
			}
		});
	});
	
	// 지점 리스트
	function siteList() {
		var f = document.frm;
		f.action = "<c:url value='/uems/mng/site/siteList.do'/>";
		f.submit();
	}
	
	// 지점 등록 및 수정
	function siteRegistExe() {	
		
		if (formValidationCheck(['siteCd', 'siteName', 'siteDesc', 'siteIp', 'regionX', 'regionY'])){
			
			var f = document.frm;
			if(valueValidation()){
				if(confirm("해당 지점를 저장하시겠습니까?")){
					
					var lat = $("#regionX").val();	// 위도
					var lon = $("#regionY").val();	// 경도
					var xy = dfs_xy_conv("toXY", lat, lon);
					
					// 기상청 관련 x,y 좌표 값 세팅
			        $("#weatherX").val(xy.x);
			        $("#weatherY").val(xy.y);
			        
					f.action = "<c:url value='/uems/mng/site/siteRegistExe.do'/>";
					f.submit();
				}
			}
		}
	}
	
	function valueValidation() {
		// 지점코드 5글자 확인
		if($("input[name=siteCd]").val().length <5) {
			alert('지점 코드를 다시 입력해주세요.');
			return false;
		}
		return true;
	}
	
	//validation 관련 alert 메시지
	function alertMessageSource(el_id){
		
		switch (el_id) {
			case 'siteCd':
				alert('지점 코드를 입력해주세요.');
				break;
			case 'siteName':
				alert('지점명을 입력해주세요.');
				break;
			case 'siteDesc':
				alert('지점 설명을 입력해주세요.');
				break;
			case 'siteIp':
				alert('지점 IP를 입력해주세요.');
				break;
			case 'regionX':
				alert('위도를 입력해주세요.');
				break;
			case 'regionY':
				alert('경도를 입력해주세요.');
				break;
		}
		
	}
</script>

<div class="contents_wrap">
<form:form commandName="site" name="frm" id="frm" method="post">	
	<form:hidden path="siteId" value="${siteView.siteId}"/>	
	<form:hidden path="weatherX" value="${siteView.weatherX}"/>	
	<form:hidden path="weatherY" value="${siteView.weatherY}"/>	
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">지점 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;지점를 조회 및 관리를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th>지점 코드 *</th>
					<td colspan="3">
						<input type="text" style="width:400px" id="siteCd" name="siteCd" class="inp_txt w01" maxlength=5 value="<c:out value="${siteView.siteCd}" escapeXml="false"/>"/>
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<c:out value="※ 지점코드 'S'+ 'E'(1자리문자) + 000(3자리숫자) " />
					</td> 
				</tr>
				<tr>
					<th>지점명 *</th>
					<td colspan="3">
						<span class="sel_wrap w01" style="width:200px;">
							<form:select path="sgId">
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<form:option  value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</form:select>
						</span>					
						<input type="text" style="width:400px" id="siteName" name="siteName" class="inp_txt w01" value="<c:out value="${siteView.siteName}" escapeXml="false"/>"/>
					</td> 
				</tr>
				<tr>
					<th>지점 설명 *</th>
					<td colspan="3">
						<input type="text" id="siteDesc" name="siteDesc" class="inp_txt w01" value="<c:out value="${siteView.siteDesc}" escapeXml="false"/>"/>
					</td> 
				</tr>
				<tr>
					<th>회사법인번호</th>
					<td>
						<input type="text" style="width:400px" id="companyNo" name="companyNo" class="inp_txt w01" value="<c:out value="${siteView.companyNo}" escapeXml="false"/>"/>
					</td> 
					<th>전화번호</th>
					<td>
						<input type="text" style="width:400px" id="telNo" name="telNo" class="inp_txt w01" value="<c:out value="${siteView.telNo}" escapeXml="false"/>"/>
					</td> 
				</tr>		
				<tr>
					<th>지점 IP *</th>
					<td colspan="3">
						<input type="text" style="width:400px" id="siteIp" name="siteIp" class="inp_txt w01" value="<c:out value="${siteView.siteIp}" escapeXml="false"/>"/>
					</td> 
				</tr>
				<tr>
					<th>사용여부 *</th>
					<td colspan="3">
						<input type="radio" name="useFlag" id="useFlagY" checked="checked" value="Y" /> <label for="useFlagY">사용</label>&nbsp;&nbsp;
						<input type="radio" name="useFlag" id="useFlagN" value="N" /> <label for="useFlagN">미사용</label>
					</td> 
				</tr>				
				<tr>
					<th>지역 *</th>
					<td colspan="3">
						<span class="sel_wrap w01" style="width:200px">
							<select id="regionCd" name="regionCd">
								<c:forEach var="result" items="${regionList}" varStatus="status">
									<option value="${result.codeUseName}"><c:out value="${result.codeName}" escapeXml="false"/></option>
								</c:forEach>
							</select>
						</span>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">
						<input type="text" id="address" name="address" class="inp_txt w01" value="<c:out value="${siteView.address}" escapeXml="false"/>"/>
					</td> 
				</tr>	
				<tr>
					<th>연면적</th>
					<td>
						<input type="text" style="width:400px" id="totalArea" name="totalArea" class="inp_txt w01" value="<c:out value="${siteView.totalArea}" escapeXml="false"/>"/>
					</td> 
					<th>빙축열운영 시작일</th>
					<td>
						<span class="entry_calendar">
							<fmt:parseDate value="${siteView.iceSystemSdate}" var="iceSystemSdate" pattern="yyyyMMdd"/>
							<input type="text" class="datepicker" id="iceSystemSdate" name="iceSystemSdate" value="<fmt:formatDate value="${iceSystemSdate}" pattern="yyyy-MM-dd"/>" style="width:77px;" ></input>
							<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
						</span>
					</td> 					
				</tr>
				<tr>
					<th>담당자 이름</th>
					<td>
						<input type="text" style="width:400px" id="chargePersonName" name="chargePersonName" class="inp_txt w01" value="<c:out value="${siteView.chargePersonName}" escapeXml="false"/>"/>
					</td> 
					<th>담당자 전화번호</th>
					<td>
						<input type="text" style="width:400px" id="chargePersonTel" name="chargePersonTel" class="inp_txt w01" value="<c:out value="${siteView.chargePersonTel}" escapeXml="false"/>"/>
					</td> 
				</tr>		
				<tr>
					<th>기술운영팀 전화번호</th>
					<td colspan="3">
						<input type="text" style="width:400px" id="techOperationTel" name="techOperationTel" class="inp_txt w01" value="<c:out value="${siteView.techOperationTel}" escapeXml="false"/>"/>
					</td> 
				</tr>	
				<tr>
					<th>위도 *</th>
					<td colspan="3">
						<input type="text" style="width:400px" id="regionX" name="regionX" class="inp_txt w01" value="<c:out value="${siteView.regionX}" escapeXml="false"/>"/>
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<c:out value="※ 구글 맵에서 위도/경도 확인 가능 " />
					</td> 
					
				</tr>
				<tr>
					<th>경도 *</th>
					<td colspan="3">
						<input type="text" style="width:400px" id="regionY" name="regionY" class="inp_txt w01" value="<c:out value="${siteView.regionY}" escapeXml="false"/>"/>
					</td> 
				</tr>
				<tr>
					<th>기존 열원구분 *</th>
					<td colspan="3">
						<span class="sel_wrap w01" style="width:200px">
							<select id="prevFacilityCode" name="prevFacilityCode">
								<option value="01">흡수식</option>
								<option value="02">터보</option>
								<option value="03">흡수식+터보</option>
								<option value="04">기타</option>
							</select>
						</span>
					</td> 
				</tr>
				<tr>
					<th>운영기간 *</th>
					<td colspan="3">
						통계월 시작일&nbsp;&nbsp;
						<span class="sel_wrap w01" style="width:200px">
							<select id="statStartDay" name="statStartDay">
								<c:forEach begin="1" end="31" var="day">
									<fmt:formatNumber value='${day}' pattern='00' var="start" />
									<option value="${start}">${start} 일</option>
								</c:forEach>
							</select>
						</span>
						&nbsp;&nbsp; ~ &nbsp;&nbsp; 
						익월 종료일 &nbsp;&nbsp; 
						<span class="sel_wrap w01" style="width:200px">
							<select id="statEndDay" name="statEndDay">
								<c:forEach begin="1" end="31" var="day">
									<fmt:formatNumber value='${day}' pattern='00' var="end" />
									<option value="${end}">${end} 일</option>
								</c:forEach>
							</select>
						</span>
					</td> 
				</tr>
				<tr>
					<th>비고</th>
					<td colspan="3">
						<textarea rows="5" cols="100" class="inp_txtarea h01" id="remarks" name="remarks"><c:out value="${siteView.remarks}" escapeXml="false"/></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap -->
	
	<!-- s: btn wrap 가운데 정렬-->
	<div class="btn_wrap02">
		<span class="btn btn_type02 btn_size03"><a href="javascript:siteRegistExe();">저장</a></span>
		<span class="btn btn_type01 btn_size03"><a href="/uems/mng/site/siteList.do">취소</a></span>
	</div>
	<!-- e: btn wrap-->
</form:form>
</div>
