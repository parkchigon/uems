<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$(".inner_content").attr("style", "padding-left: 0px;");
});



</script>
<div class="contents_wrap">
	<div class="section01">
		<div class="ltr_box" style="width:49%;">
			<!-- s: table top-->
			<div class="thead_wrap cboth">
				<div class="ltr">
					<h3>FAQ</h3>
				</div>
			</div>
			<!-- e: table top-->

			<!-- s: table wrap-->
			<div class="table_wrap">
				<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
					<colgroup>
						<col width="5%"/>
						<col width="*"/>
						<col width="20%"/>
						<col width="20%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등록자</th>
							<th>등록일</th>
						</tr>
						<tr>
							<td colspan="4">
								등록된 게시글이 없습니다.
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- e: table wrap-->
		</div>
	</div>	
</div>
<!-- e: main content -->

