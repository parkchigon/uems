<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">

	$(document).ready(function(){
		
		
		
	});
	
	
	function photoDelete(){
		var checkList = new Array(); //삭제할사진아이디리스트
		 $('input:checkbox[name="photoCheck"]').each(function() {
			 if($(this).is(":checked")){
				 checkList.push($(this).attr("id"));
			 }
		 });
		
		$("input[name=checkList]").val(checkList);
		
		 $.ajax({
				url : "/mobileWeb/deletePhotoAjax",
				type: "POST",
				data: $("#frm").serialize(),
				dataType : "json"
			}).done( function(data) {
				var result = data.result;
				if(result > 0){
					alert("선택한 사진/이미지 가 삭제되었습니다.");
					searchPhotoList($("#msqId").val());
				}else{
					alert("사진/이미지 삭제 실패");
				}
			});

	}

	
</script>
<form id="frm" name="frm" method="post">
<input type="hidden" name="groupId" />
<input type="hidden" name="layerId" />
<input type="hidden" name="checkList" />
<input type="hidden" name="msqId" id="msqId"/>
</form>
<!-- s : popup container -->

<div class="popup_container" id="photo">
	<div class="popup_header">사진정보 <a class="closePop" href="#"><span class="blind">메뉴닫기</span></a></div>
	<div class="popup_content">
		<div class="photo_area">
			<ul id="photoList">
			</ul>
		</div>
		<div class="btn_areaC mt20 both">
			<a class="btnType btn_type01" href="javascript:photoDelete();">삭제</a>
		</div>
	</div>
</div>	
