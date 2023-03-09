<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>
<script type="text/javascript">
	var popup = null;
	$(document).ready(function() {

		var cookie_user_id = getLogin();

		if (cookie_user_id != "") { // 쿠키값이 존재하면 셋팅 
			$("#loginId").val(cookie_user_id);
			$("#cbloginId").attr("checked", true);
		}

		// 로그인 버튼 클릭시 저장 여부 
		$(".btn_login").on("click", function() {
			if ($("#cbloginId").is(":checked")) { // 저장 체크시
				saveLogin($("#loginId").val());
			} else { // 체크 해제시는 공백
				saveLogin("");
			}
		});

		$('#loginId').focus();

	});

	function login() {
		var formdata = getFormData($("#form"));

		$.ajax({
			url : '/login/loginProcessAjax.do',
			data : formdata,
			type : 'POST',
			contentType : 'application/json'
		}).done(function(data) {

			if (data.resultCode == 0) {
				var roleId = data.roleId;
				if(roleId == "ROL_0000000000000001" || roleId == "ROL_0000000000000002") {
					var option = 'height=' + screen.height + ',width=' + screen.width + ',top=0, left=0, scrollbars=no, location=no, resizable=yes, status=no, fullscreen=yes';
					var url = data.redirectUrl;
					// 구축자일 경우는 구축 메뉴로 redirect
					if(roleId == "ROL_0000000000000001") {
						url = "/ems/build/siteManage.do";
					}
					popup = window.open(url, 'emsPopup', option);
					popup.moveTo(0,0);     
					popup.focus();
				} else {
					window.location.href = data.redirectUrl;
				}
			} else if (data.resultCode == 2) { //ID는 존재 하지만 PW가 틀렸을 경우
				alert("입력하신 아이디가 존재하지 않습니다.");
				$('#loginId').focus();

			} else if (data.resultCode == 3) { // ID만 존재할 경우, ID/PWD가 존재하지 않을 경우
				alert("비밀번호를 5회 잘못 입력하셨습니다.\n관리자 문의 바랍니다.\n");
				if ($("#cbloginId").is(":checked")) {
				} else {
					$('#loginId').val("");
				}
				$('#loginPassword').val("");
				$('#loginId').focus();
			} else if (data.resultCode == 4) { //ID는 존재 하지만 PW가 틀렸을 경우
				alert("입력하신 아이디가 없거나 혹은 사용중지 중입니다.\n다시 한번 입력해 주세요");
				if ($("#cbloginId").is(":checked")) {
				} else {
					$('#loginId').val("");
				}
				$('#loginPassword').val("");
				$('#loginId').focus();

			}  else if (data.resultCode == 5) {	//사용자(현장)권한 : 유저-지점 매핑 없을 경우
				alert("하나의 지점 등록이 필요한 권한 아이디입니다.\n관리자 문의 바랍니다.\n");
				if ($("#cbloginId").is(":checked")) {
				} else {
					$('#loginId').val("");
				}
				$('#loginPassword').val("");
				$('#loginId').focus();
			} else {
				alert("입력하신 아이디 혹은 비밀번호가 일치하지 않습니다.\n다시 한번 입력해 주세요");
				if ($("#cbloginId").is(":checked")) {
				} else {
					$('#loginId').val("");
				}
				$('#loginPassword').val("");
				$('#loginId').focus();
			}

		});
	}
	/**
	 * saveLogin
	 * 로그인 정보 저장
	 * @param id
	 */
	function saveLogin(id) {
		if (id != "") {
			// userid 쿠키에 id 값을 7일간 저장
			setSave("userid", id, 7);
		} else {
			// userid 쿠키 삭제
			setSave("userid", id, -1);
		}
	}

	/**
	 * setSave
	 * Cookie에 user_id를 저장
	 * @param name
	 * @param value
	 * @param expiredays
	 */
	function setSave(name, value, expiredays) {
		var today = new Date();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ today.toGMTString() + ";";
	}

	/**
	 * getLogin
	 * 쿠키값을 가져온다.
	 * @returns {String}
	 */
	function getLogin() {
		// userid 쿠키에서 id 값을 가져온다.
		var cook = document.cookie + ";";
		var idx = cook.indexOf("userid", 0);
		var val = "";

		if (idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf("=", 0) + 1;
			end = cook.indexOf(";", begin);
			val = unescape(cook.substring(begin, end));
		}
		return val;
	}

	function getFormData(form) { //form을 JSON으로 바꾸기
		var unindexed_array = form.serializeArray();
		var param = {};

		$(unindexed_array).each(function(i, v) {
			param[v.name] = v.value;
		});
		return JSON.stringify(param);
	}
	
	
</script>
<!-- s: header container -->
<div class="header_container">
	<div class="inner_content">
		<h1 class="logo"><a href="/uems/main.do">UEMS</a></h1>
	</div>
</div>
<!-- e: header container -->

<div class="login_form_container">
	<div class="login_form_inner">
		<div class="userlogin_form">
			<h2>LOGIN</h2>
			<div class="detail">
				<form id="form" name="form" method="post">
					<input type="text" id="loginId" name="loginId" class="entry" value="" placeholder="아이디" onkeypress="if(event.keyCode==13) {login();}"
						onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" />
					<input type="password" id="loginPassword" name="loginPassword" class="entry" value="" placeholder="비밀번호" onkeypress="if(event.keyCode==13) {login();}"
						onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" />

					<div class="txt">
						<label for="cbloginId"><input type="checkbox" name="cbloginId" id="cbloginId" /> 아이디 저장</label>
					</div>
				</form>
				<a href="#" class="btn_login" id="btn_login" onclick="login(); return false;" alt="로그인" >로그인</a>
			</div>
		</div>
	</div>
</div>