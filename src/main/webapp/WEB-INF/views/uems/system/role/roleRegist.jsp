<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	var roleId = '${roleId}';
	var useYn = '${Role.useYn}';
	var f = document.frm;
	f.action = "<c:url value='/uems/system/role/roleRegistExe.do'/>";
	
	if(useYn == "Y"){
		$("input:radio[name='useYn']:radio[value='Y']").attr("checked",true);
	}else if(useYn == "" || useYn == "undefined" || useYn =="null"){
		$("input:radio[name='useYn']:radio[value='Y']").attr("checked",true);
	}else{
		$("input:radio[name='useYn']:radio[value='N']").attr("checked",true);
	}
	
	if (roleId == "undefined" || roleId =="null"){
		$("#modButton").hide();
		$("#delButton").hide();
	}else{
		$("#regButton").hide();
	}
	
	$("#regButton").click(function(){
		f.roleId.value = '';
		f.submit();
	});
	$("#modButton").click(function(){
		f.roleId.value = '${roleId}'
		f.submit();
	});
	$("#delButton").click(function(){
		f.action = "<c:url value='/uems/system/role/roleDelete.do'/>";
		f.roleId.value = '${roleId}'
		f.submit();
	});
	$("#cnButton").click(function(){
		location.href="/uems/system/role/roleList.do";
	});
	
});
</script>
		<form:form commandName="role" name="frm" id="frm" method="post">
		<form:hidden path="roleId"/>
				
				<div class="contents_wrap">
					
					<h2 class="main_title">권한 그룹 관리</h2>
					
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
							<!-- TODO 부모권한 선택 수정필요 -->
								<tr>
									<th>· 권한명</th>
									<td colspan="3">
										<input type="text" name="roleName" value="${Role.roleName}" class="inp_txt w02"/>
									</td>
								</tr>
								<tr>
									<th>· 정렬순서</th>
									<td colspan="3">
										<input type="text" name="sortNum" value="${Role.sortNum}" OnKeyUp="fnNumberCheck(this);" class="inp_txt w02"/>
									</td>
								</tr>
								<tr>
									<th>· 사용여부</th>
									<td colspan="3">
										<input type="radio" name="useYn" value="Y" id="valueY" class="" checked="checked"/> <label for="radio01">Y</label>&nbsp;&nbsp;
										<input type="radio" name="useYn" value="N" id="valueN" class="" /> <label for="radio02">N</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- e: table wrap -->
					
					<!-- s: btn wrap 가운데 정렬-->
					<div class="btn_wrap02">
						<span id="regButton" class="btn btn_type02 btn_size03"><a href="#">등록</a></span>
						<span id="modButton"class="btn btn_type02 btn_size03"><a href="#">수정</a></span>
						<span id="cnButton" class="btn btn_type01 btn_size03"><a href="#">취소</a></span>
						<span id="delButton" class="btn btn_type03 btn_size03"><a href="#">삭제</a></span>
					</div>
					<!-- e: btn wrap-->
				</div>
				<!-- e: main content -->

		<!-- e: body container --> 
		</form:form>
