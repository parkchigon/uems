<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	
	$(document).ready(function(){
		
		setTextLengthLimit("#sgCd", 5);
		setTextLengthLimit("#sgName", 20);
		setTextLengthLimit("#sgDesc", 100);
		
		if(!isEmpty($("input[name=sgId]").val())){
			//수정화면 셋팅(컬럼 disable)
			$("input[name=sgCd]").attr("readonly","true");
			$("input[name=sgCd]").attr("class","inp_txt w01 dis");
			
			$('input:radio[name=useFlag]:input[value='+'${siteGroupView.useFlag}'+']').attr("checked", true);
		}
	});
	
	// 그룹 리스트
	function siteGroupList() {
		var f = document.frm;z
		f.action = "<c:url value='/uems/mng/site/siteGroupList.do'/>";
		f.submit();
	}
	
	// 그룹 등록 및 수정
	function siteGroupRegistExe() {	
		
		if (formValidationCheck(['sgCd', 'sgName'])){
			var f = document.frm;
			if(sgCdValidation()){
				if(confirm("해당 그룹을 저장하시겠습니까?")){
					f.action = "<c:url value='/uems/mng/site/siteGroupRegistExe.do'/>";
					f.submit();
				}
			}
		}
	}
	
	// 그룹코드 5글자 확인
	function sgCdValidation() {
		if($("input[name=sgCd]").val().length <5) {
			alert('그룹 코드를 다시 입력해주세요.');
			return false;
		}
		return true;
	}
	
	//validation 관련 alert 메시지
	function alertMessageSource(el_id){
		switch (el_id) {
			case 'sgCd':
				alert('그룹 코드를 입력해주세요.');
				break;
			case 'sgName':
				alert('그룹명을 입력해주세요.');
				break;
		}
	}
</script>

<div class="contents_wrap">
<form:form commandName="siteGroup" name="frm" id="frm" method="post">	
	<form:hidden path="sgId" value="${siteGroupView.sgId}"/>	
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">그룹 관리</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;그룹을 조회 및 관리를 합니다.</div></li>
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
					<th>그룹 코드 *</th>
					<td>
						<input type="text" style="width:500px" id="sgCd" name="sgCd" class="inp_txt w01" maxlength=5 value="<c:out value="${siteGroupView.sgCd}" escapeXml="false"/>"/>
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<c:out value="※ 그룹코드 'G'+ 'E'(1자리문자) + 000(3자리숫자) " />
					</td> 
				</tr>
				<tr>
					<th>그룹명 *</th>
					<td>
						<input type="text" style="width:500px" id="sgName" name="sgName" class="inp_txt w01" value="<c:out value="${siteGroupView.sgName}" escapeXml="false"/>"/>
					</td> 
				</tr>
				<tr>
					<th>그룹 설명</th>
					<td>
						<input type="text" style="width:800px" id="sgDesc" name="sgDesc" class="inp_txt w01" value="<c:out value="${siteGroupView.sgDesc}" escapeXml="false"/>"/>
					</td> 
				</tr>
				<tr>
					<th>사용여부 *</th>
					<td>
						<input type="radio" name="useFlag" id="useFlagY" checked="checked" value="Y" /> <label for="useFlagY">사용</label>&nbsp;&nbsp;
						<input type="radio" name="useFlag" id="useFlagN" value="N" /> <label for="useFlagN">미사용</label>
					</td> 
				</tr>
			</tbody>
		</table>
	</div>
	<!-- e: table wrap -->
	
	<!-- s: btn wrap 가운데 정렬-->
	<div class="btn_wrap02">
		<span class="btn btn_type02 btn_size03"><a href="javascript:siteGroupRegistExe();">저장</a></span>
		<span class="btn btn_type01 btn_size03"><a href="/uems/mng/site/siteGroupList.do">취소</a></span>
	</div>
	<!-- e: btn wrap-->
</form:form>
</div>
