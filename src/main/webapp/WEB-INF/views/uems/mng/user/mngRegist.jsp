<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		
		setTextLengthLimit("#loginId", 20);
		setTextLengthLimit("#mngName", 20);
		setTextLengthLimit("#memo", 500);
		
		var mngId = $("input[name=mngId]").val();
		
		//수정 화면시 값 셋팅
		if(!isEmpty(mngId)){
			
			var roleId = '${mngView.roleId}';
			
			if (roleId == "ROL_0000000000000002") {	// 사용자(현장)일 경우
				$("#siteNameSelectTr").show();
				$("#siteIdSelect").val('${mngView.siteId}')
				$("#siteIdSelect").attr("class","inp_txt w01 dis");
				$("#siteIdSelect").attr("disabled","true");
			} else {
				$("#siteNameSelectTr").hide();
			}
			
			//업체명 셋팅
			$("select[name=roleIdParam]").val("<c:out value="${mngView.roleId}" escapeXml='false'/>").attr("selected", true);
			$("select[name=roleIdParam]").attr("class","inp_txt w01 dis");
			$("select[name=roleIdParam]").attr("disabled","true");
			
			//수정화면 셋팅(컬럼 disable , 로긴 Id 중복체크 삭제)
			$("input[name=loginId]").attr("readonly","true");
			$("input[name=loginId]").attr("class","inp_txt w01 dis");
			$("input[name=loginPassword]").attr("readonly","true");
			$("input[name=loginPassword]").attr("class","inp_txt w01 dis");
			$("input[name=loginPasswordConfirm]").attr("readonly","true");
			$("input[name=loginPasswordConfirm]").attr("class","inp_txt w01 dis");
			
			//중복체크 버튼 삭제
			$(".removeLoginIdCheck").remove();
			
			//휴대폰 중복 체크 피하기
			$("#loginIdConfirmValue").val("Y");
			
			//휴대폰 번호 셋팅
			var mngCellNumValue = $("input[name=mngCellNum]").val();
			
			var mngCellNumLength = mngCellNumValue.length;
			var mngCellNumFirstValue = mngCellNumValue.substring(0,3);
			var mngCellNumSecondValue = mngCellNumValue.substring(3,mngCellNumLength-4);
			var mngCellNumTripleValue = mngCellNumValue.substring(mngCellNumLength-4,mngCellNumLength);
			
			$("select[name=mngCellNumFirst]").val(mngCellNumFirstValue).attr("selected", true);
			$("input[name=mngCellNumSecond]").val(mngCellNumSecondValue);
			$("input[name=mngCellNumTriple]").val(mngCellNumTripleValue);
			
			//이메일 주소 셋팅
			var mngEmailArray = $("input[name=mngEmail]").val().split("@");
			$("input[name=mngEmailFirst]").val(mngEmailArray[0]);
			$("input[name=mngEmailSecond]").val(mngEmailArray[1]);
			
		}
		
		$("#roleIdParam").change(function() {
			var roleId = $(this).val();
			
			if (roleId == "ROL_0000000000000002") {	// 사용자(현장)일 경우
				$("#siteNameSelectTr").show();
			}  else {	// 그 외 
				$("#siteNameSelectTr").hide();
			}
		});
		
	});
	
	function mngList() {
		var f = document.frm;
		f.action = "<c:url value='/uems/mng/user/mngList.do'/>";
		f.submit();
	}
	
	function mngRegistExe() {	
		var f = document.frm;
		
		//휴대폰번호,권한 아이디 값 셋팅
		f.mngCellNum.value=$("select[name=mngCellNumFirst]").val()+$("input[name=mngCellNumSecond]").val()+$("input[name=mngCellNumTriple]").val();
		f.roleId.value=$("select[name=roleIdParam] option:selected").attr("class");
		
		if(validation()){
			if(confirm("해당 관리자를 저장하시겠습니까?")){
				f.action = "<c:url value='/uems/mng/user/mngRegistExe.do'/>";
				f.submit();
			}
		}
	}
	
	function emailSet() {
		$("input[name=mngEmailSecond]").val($("select[name=mngEmailTriple]").val());
	}
	
	function loginIdConfirm(){
		var url = "/uems/mng/user/checkLoginId.do";
		var loginId = $("input[name=loginId]").val();
		
		if(loginId == "" || loginId == null){
			alert("관리자ID를 입력하세요");
			return ;
		}else if(!loginIdValidation(loginId)){
			alert("관리자ID는 영문소문자,숫자조합으로 4~16자이어야 합니다.");
			return ;
		}
		
		$.ajax({
			url : url,
			type: "POST",
			data: {loginId : loginId},
			dataType : "json"
		}).done( function(data) {
			var result = data.result
			if(result == "Y"){
				alert("사용 할 수 있는 ID입니다.");
			}else if(result == "N"){
				alert("해당 ID가 이미 존재합니다.");
			}else{
				alert("ID 중복체크 실패.");
			}
			
			$("#loginIdConfirmValue").val(result);
			
		}).fail(function() {
			alert("Connection Error");
		});
	}
	
	function validation() {
		var mngId = $("input[name=mngId]").val();
		var roleId = $("select[name=roleIdParam]").val();
		var loginId = $("input[name=loginId]").val();
		var mngName = $("input[name=mngName]").val();
		var loginPassword = $("input[name=loginPassword]").val();
		var loginPasswordConfirm = $("input[name=loginPasswordConfirm]").val();
		var mngCellNum = $("input[name=mngCellNum]").val();
		var mngEmailFirst = $("input[name=mngEmailFirst]").val();
		var mngEmailSecond = $("input[name=mngEmailSecond]").val();
		var loginIdConfirmValue = $("#loginIdConfirmValue").val();
		
		//등록화면만 체크
		if(isEmpty(mngId) && isEmpty(roleId)){
			alert("권한을 선택하세요");
			return false;
		}
		
		//필수 값 체크
		if(isEmpty(loginId)){
			alert("관리자ID를 입력하세요");
			return false;
		}else if(!loginIdValidation(loginId)){
			alert("관리자ID는 영문소문자,숫자조합으로 4~16자이어야 합니다.");
			return false;
		}else if(loginIdConfirmValue == "" || loginIdConfirmValue == null || loginIdConfirmValue == "N"){
			alert("관리자ID 중복확인을 하세요");
			return false;
		}else if(mngName == "" || mngName == null){
			alert("관리자명을 입력하세요");
			return false;
		}
		
		//등록화면만 체크
		if(isEmpty(mngId)){
			if(loginPassword == "" || loginPassword == null){
				alert("접속비밀번호를 입력하세요");
				return false;
			}else if(!loginPasswordValidation(loginPassword)){
				//alert("영문 대문자, 소문자, 숫자, 특수문자 조합으로 9~16자이어야 합니다.");
				alert("영문 소문자, 숫자 조합으로 7~16자이어야 합니다.");
				return false;
			}else if(loginPasswordConfirm == "" || loginPasswordConfirm == null){
				alert("접속비밀번호확인을 입력하세요");
				return false;
			}else if(loginPassword != loginPasswordConfirm){
				alert("접속비밀번호가 다릅니다.");
				return false;
			}
		}
		
		//옵션 값 체크
		if(!isEmpty(mngCellNum)){
			if(!hpValidation(mngCellNum)){
				alert("연락처를 올바르게 입력하세요");
				return false;
			}
		}
		if((!isEmpty(mngEmailFirst)) || (!isEmpty(mngEmailSecond))){
			
			$("input[name=mngEmail]").val(mngEmailFirst+"@"+mngEmailSecond);
			var mngEmail = $("input[name=mngEmail]").val();
			
			if(!emailValidation(mngEmail)){
				alert("이메일 주소를 올바르게 입력하세요");
				return false;
			}
		}
		
		return true;
		
	}
	
	function loginIdValidation(loginId)
	{
		 if(!/^[a-z0-9]{4,16}$/.test(loginId)){ 
	        return false;
		 }
		  
		 var chk_num = loginId.search(/[0-9]/g); 
		 var chk_eng = loginId.search(/[a-z]/g);

		 if(chk_num < 0 || chk_eng < 0){ 
		 	return false;
		 }
		 return true;
	}
	
	function loginPasswordValidation(loginPassword)
	{
		//if(!/^[a-zA-Z0-9!@#$%^&*()+=_-]{9,16}$/.test(loginPassword)){
		//	return false;
		//}
		//if(!/^[a-z0-9!@#$%^&*()+=_-]{7,16}$/.test(loginPassword)){
		//	return false;
		//}
		if(!/(?=.*\d)(?=.*[a-z]).{7,16}/.test(loginPassword)){
			alert(1);
			return false;
		}
		

		var type_cnt = 0;
		var chk_num = loginPassword.search(/[0-9]/g); 
		var chk_eng_1= loginPassword.search(/[a-z]/g);
		//var chk_eng_2 = loginPassword.search(/[A-Z]/g);
		//var chk_spl = loginPassword.search(/[!@#$%^&*()+=_-]/g);
		
		 if(chk_num < 0 || chk_eng_1 < 0){ 
			 return false;
		 }
		 return true;
		
		/*
		if(chk_num >= 0) { type_cnt++; }
		if(chk_eng_1 >= 0) { type_cnt++; }
		if(chk_eng_2 >= 0) { type_cnt++; }
		if(chk_spl >= 0) { type_cnt++; }
		if (type_cnt < 2) { 
			return false; 
		} else {
			return true;
		}
		*/
	}
	
	function loginIdConfirmReset(){
		$("#loginIdConfirmValue").val("");
	}
	
	function deleteMng() {
		var f = document.frm;
		
		if(confirm("해당 관리자를 삭제하시겠습니까?")){
			f.action = "<c:url value='/uems/mng/user/mngRemoveExe.do'/>";
			f.submit();
		}
	}
	
</script>

<div class="contents_wrap">
<form:form commandName="mng" name="frm" id="frm" method="post">	
	<form:hidden path="mngId" value="${mngView.mngId}"/>
	<form:hidden path="mngCellNum" value="${mngView.mngCellNum}"/>
	<form:hidden path="mngEmail" value="${mngView.mngEmail}"/>
	<form:hidden path="roleId" />
	<input type="hidden" id="loginIdConfirmValue" />
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">유저 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;각 권한별 유저를 조회 및 관리를 합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->	
	<!-- s: table wrap-->
	<div class="table_wrap">
		<table cellpadding="0" cellspacing="0" border="0" class="table_write_type">
			<colgroup>
				<col width="8%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th>권한 *</th>
					<td>
						<span class="sel_wrap w01" style="width:400px">
							<select id="roleIdParam" name="roleIdParam" >
								<c:forEach var="result" items="${rollAllList}" varStatus="status">
									<option value="<c:out value="${result.roleId}" escapeXml="false"/>" class="${result.roleId}"><c:out value="${result.roleName}" escapeXml="false"/></option>
								</c:forEach>
							</select>	
						</span>
					</td> 
				</tr>
				<tr id="siteNameSelectTr" style="display:none;">
					<th>사이트명 *</th>
					<td>
						<span class="sel_wrap w01" style="width:400px">
							<select id="siteIdSelect" name="siteId" >
								<c:forEach var="result" items="${siteAllList}" varStatus="status">
									<option value="<c:out value="${result.siteId}" escapeXml="false"/>"><c:out value="${result.sgName} / ${result.siteName}" escapeXml="false"/></option>
								</c:forEach>
							</select>	
						</span>
					</td> 
				</tr>	
				<tr>
					<th>관리자ID *</th>
					<td>
						<input type="text" style="width:400px" id="loginId" name="loginId" class="inp_txt w01" maxlength=16 onchange="javascript:loginIdConfirmReset()" value="<c:out value="${mngView.loginId}" escapeXml="false"/>"/>
						<span class="btn btn_type01 btn_size02 removeLoginIdCheck"><a href="javascript:loginIdConfirm()">중복확인</a></span>
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<c:out value="※ 영문 소문자,숫자 조합으로 4~16자리" />
					</td> 
				</tr>
				<tr>
					<th>관리자명 *</th>
					<td>
						<input type="text" style="width:400px" id="mngName" name="mngName" class="inp_txt w01" value="<c:out value="${mngView.mngName}" escapeXml="false"/>"/>
					</td> 
				</tr>
				<tr>
					<th>접속비밀번호 *</th>
					<td>
						<input type="password" style="width:400px" name="loginPassword" class="inp_txt w01" maxlength=16 value=""/>
						&nbsp;&nbsp;&nbsp;&nbsp; ※ 영문/숫자 조합으로 7자리~16자리
					</td> 
				</tr>
				<tr>
					<th>접속비밀번호확인 *</th>
					<td>
						<input type="password" style="width:400px" name="loginPasswordConfirm" class="inp_txt w01" maxlength=16 value=""/>
					</td> 
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<span class="sel_wrap w01" style="width:80px">
							<select id="" name="mngCellNumFirst">
								<option value="" selected="selected">선택</option>
								<c:forEach var="result" items="${phonePrenumList}" varStatus="status">
									<option value="${result.codeName}"><c:out value="${result.codeName}" escapeXml="false"/></option>
								</c:forEach>
							</select>
						</span>
						&nbsp;&nbsp;-&nbsp;&nbsp;
						<input type="text" style="width:80px" name="mngCellNumSecond" class="inp_txt w01" maxlength=4 value=""/>
						&nbsp;&nbsp;-&nbsp;&nbsp;
						<input type="text" style="width:80px" name="mngCellNumTriple" class="inp_txt w01" maxlength=4 value=""/>
					</td> 
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" style="width:150px" name="mngEmailFirst" class="inp_txt w01" maxlength=24  value=""/>
						&nbsp;&nbsp; @ &nbsp;&nbsp;
						<input type="text" style="width:150px" name="mngEmailSecond" class="inp_txt w01" maxlength=24  value=""/>
						&nbsp;&nbsp;
						<span class="sel_wrap w01" style="width:150px">
							<select id="" name="mngEmailTriple" onchange="emailSet();">
								<option value="" selected="selected">직접입력</option>
								<c:forEach var="result" items="${emailList}" varStatus="status">
									<option value="${result.codeName}"><c:out value="${result.codeName}" escapeXml="false"/></option>
								</c:forEach>
							</select>
						</span>
					</td> 
				</tr>
				<tr>
					<th>비고</th>
					<td>
						<textarea rows="5" cols="100" class="inp_txtarea h01" id="memo" name="memo"><c:out value="${mngView.memo}" escapeXml="false"/></textarea>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<!-- e: table wrap -->
	
	<!-- s: btn wrap 가운데 정렬-->
	<div class="btn_wrap02">
		<span class="btn btn_type02 btn_size03"><a href="javascript:mngRegistExe()">저장</a></span>
		<c:if test="${not empty sessionScope.ROLE_ID and ((sessionScope.ROLE_ID eq 'ROL_9999999999999999') or (sessionScope.ROLE_ID eq 'ROL_0000000000000003'))}">
			<c:if test="${not empty mngView.mngId and (mngView.roleId ne 'ROL_9999999999999999') and (mngView.roleId ne 'ROL_0000000000000003')}">
				<span class="btn btn_type02 btn_size03"><a href="javascript:deleteMng();">삭제</a></span>
			</c:if>		
		</c:if>
		<span class="btn btn_type01 btn_size03"><a href="/uems/mng/user/mngList.do">취소</a></span>
	</div>
	<!-- e: btn wrap-->
</form:form>
</div>
