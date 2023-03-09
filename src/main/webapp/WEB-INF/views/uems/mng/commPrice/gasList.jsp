<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>

<script type="text/javaScript">
$(document).ready(function(){
    var minDate = new Date();
    var dd = minDate.getDate()+1;
    minDate.setDate(dd);
   $("#applyDate").datepicker("option", "minDate", minDate); //오늘 이전날짜는 선택할 수 없게 비활성화
});

/* 단가추가 */
function add(){ 
	$('#data01, #data02 , #data03, #applyDate').val(''); // 단가추가 버튼 클릭시 모든 데이터 초기화
	$('#addData').show(); // 단가정보 화면 노출
	$('#applyDateKey').val(''); //등록일때는 적용시작일자 null
	
}

/* 종별선택에 따른 리스트(우측상단)  */
function priceList(pciId,title){
	console.log(title);
	$('#pciId').val(pciId);
	$('#title').text(title); //우측상단 title
	$('#title2').text(title); // 단가정보테이블 title 
	$('#pName').val(title); //title 임시저장
	 var date = new Date();
	 var year = date.getFullYear();
	 var month = date.getMonth()+1;
	 var date = date.getDate();
	
	 var today = year+addZeros(month,2)+addZeros(date,2);
	$.ajax({
		url : "/uems/mng/commPrice/selectPriceDataListAjax.do",
		type: "POST",
		data: {
				pciId : pciId
			   },
		dataType : "json"
	}).done( function(data) {
			$('#addButton').show(); // 종별 선택시 단가추가 버튼 노출
			var list = data.priceDataList;
			var html = "";
			if(list.length >=1) {
				for(var i=0; i<list.length; i++) {
					html += '<tr>'
						html +='<td>'+list[i].applyDate+'</td>'
						html +='<td>'+list[i].data01+'</td>'
						html +='<td>'+list[i].data02+'</td>'
						html +='<td>'+list[i].data03+'</td>'
						html +='<td>'
						if(list[i].applyDate > today){ 
							html +='<span class="btn btn_type01 btn_size01"><a href="#" onclick="modifyData('+list[i].applyDate+');">수정</a></span>'
						} else {//적용시작일이 오늘포함 이전이면 비활성화
							html +='<span class="btn btn_type03 btn_size01"><a href="#" onclick="javascript:void(0);">수정</a></span>'
						}
						html +='</td>'
					html +='</tr>';
				}
			}else{
				html +='<tr><td colspan="10"> 등록된 게시물이 없습니다.</td></tr>'
			}
			$("#priceDataList").empty(); // 초기화
			$("#priceDataList").append(html);
			$('#data01, #data02 , #data03, #applyDate').val(''); //등록,수정 후 입력데이터초기화
	});
}

/* 상세정보 불러오기(하단테이블)  */
function modifyData(applyDate){
	$('#addData').show();
	$('#applyDateKey').val(applyDate);
	var pciId = $('#pciId').val();
	$.ajax({
		url : "/uems/mng/commPrice/selectPriceDataInfoAjax.do",
		type: "POST",
		data: {
				pciId : pciId
				,applyDate : applyDate
			   },
		dataType : "json"
	}).done( function(data) {
			var  dataInfo = data.priceDataInfo;
			$('#data01').val(dataInfo.data01);
			$('#data02').val(dataInfo.data02);
			$('#data03').val(dataInfo.data03);
			$('#applyDate').val(dataInfo.applyDate);
	});
}

/* 단가데이터 등록,수정시 중복체크 */
function valChk(){
	var chk = false;
	var applyDate = $('#applyDate').val();
	applyDate = applyDate.replace(/-/gi,"");
	var pciId = $('#pciId').val(); 
	var applyDateKey = $('#applyDateKey').val();
	var data01 = $('#data01').val();
	var data02 = $('#data02').val();
	var data03 = $('#data03').val();
	if(applyDate == null || applyDate == ''){
		alert('적용시작일자를 입력해주세요.');
		return false;
	}
	if(applyDateKey == applyDate) { //적용시작일자 변경없는 경우에는 중복체크안함 
		return true;
	}
	if(data01 == '' || data02 == '' || data03 == ''){
		alert('단가정보를 모두 입력해주세요.');
		return false;
	}
	
	$.ajax({
		url : "/uems/mng/commPrice/dataCount.do",
		type: "POST",
		data: {applyDate : applyDate
			   ,pciId : pciId},
		dataType : "json",
		async: false
	}).done( function(data) {
		if(data >= 1){
			alert('이미 존재하는 데이터입니다.');
			$('#applyDate').val($('#temp').val()); // 실패시 날짜 dateformat 유지
			chk = false;
		}else{
			chk = true;
		}
	});
	return chk;
}
/* 수정,등록 */
function save(){ 
	var applyDate = $('#applyDate').val();
	$('#temp').val(applyDate); //날짜 dateformat 유지하기 위해서 저장
	if(valChk()){ //중복검사
		if(confirm("저장하시겠습니까?")){
			document.frm.applyDate.value = applyDate.replace(/-/gi,"");
			$.ajax({
				url : "/uems/mng/commPrice/commPriceRegistExe.do",
				type: "POST",
				data:  $("#frm").serialize(),
				dataType : "json"
			}).done( function(data) {
				priceList($('#pciId').val(),$('#pName').val());
			});
		 }	
	}
}

/* 종별추가 */
function goRegistNm(){
	var priceName = $('#priceName').val();
	if(priceName == '' || priceName == null){ // 유효성확인
		alert('종명을 입력해주세요.');
		return false;
	}
	
	$.ajax({
		url : "/uems/mng/commPrice/commPriceRegistNmExe.do",
		type: "POST",
		data:  {priceName : priceName},
		dataType : "json"
	}).done( function(data) {
		if(data.priceNmList == null || data.priceNmList == ''){ //중복체크
			alert('이미 존재하는 이름입니다.');
		}else{
			$('#layerPop_type1').hide();
			$('#mask').hide();
			var html = "";
			var list = data.priceNmList;
			if(list.length >=1) {
				for(var i=0; i<list.length; i++) {
					 html +="<tr><td><a href='#' onclick ='priceList(\""+list[i].pciId+"\",\""+list[i].priceName+"\");' class='link_imp01'>"+list[i].priceName+"</a></td></tr>"
				}
			}
			$("#gasCpnyList").empty();
			$("#gasCpnyList").append(html);
		}
	});
}

</script>

<div class="contents_wrap">
	<form:form commandName="commPrice" name="frm" id="frm" method="post">
		<input type ="hidden" id ="pciId" name = "pciId" value ="" />
		<input type ="hidden" id ="pName" name = "pName" value ="" />
		<input type ="hidden" id ="temp" name = "temp" value ="" />
		<input type ="hidden" id ="applyDateKey" name = "applyDateKey" value ="" />
		<!-- s: cont_wrap -->
		<div class="cont_wrap01">
			<h2 class="main_title">공통단가 관리</h2>
			<ul class="list">
				<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;공통적용 가능한 가스, 전기요금을 관리합니다.</div></li>
			</ul>
		</div>
		<!-- e: cont_wrap -->	
		
		<div class="tab_wrap">
			<ul>
				<li><a href="/uems/mng/commPrice/generalElecList.do">일반전기요금</a></li>
				<li><a href="/uems/mng/commPrice/midNightElecList.do">심야전기요금</a></li>
				<li class="on"><a href="/uems/mng/commPrice/gasList.do">가스요금</a></li>
			</ul>
			<span class="txt01"></span>
		 </div>
		 
		<!-- s: table area-->
		<div class="table_area">
			<div class="table_area_left">
				<dl>
					<dt>종별선택</dt>
					<dd>
						<!-- s: table wrap-->
						<div class="table_wrap">
							<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
								<colgroup>
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<th>종별</th>
									</tr>
								</thead>
								<tbody id="gasCpnyList">
									<c:if test="${fn:length(commPriceList) eq 0}">
										<tr>
											<td> 등록된 게시물이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="result" items="${commPriceList}" >
										<tr>
											<td><a href="#" onclick ="priceList('${result.pciId}','${result.priceName}')" class="link_imp01">${result.priceName}</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- e: table wrap-->
						
						<div class="rtl">
							<span class="btn btn_type02 btn_size02"><a href="#layerPop_type1" name="modal">종별추가</a></span>
						</div>
					</dd>
				</dl>
			</div>
			<div class="table_area_right">
				<dl>
					<dt><strong class="font_bold" id ="title">&nbsp; </strong> <span class="rtl">(원 / MJ)</span></dt>
					<dd>
						<!-- s: table wrap-->
						<div class="table_wrap">
							<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
								<colgroup>
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th>적용시작일</th>
										<th>동절기(12~3월)</th>
										<th>하절기(5~9월)</th>
										<th>기타(4, 10~11월)</th>
										<th>수정</th>
									</tr>
								</thead>
								<tbody id ="priceDataList">
									
								</tbody>
							</table>
						</div>
						<!-- e: table wrap-->
						
						<div class="rtl" id ="addButton" style="display: none;">
							<span class="btn btn_type02 btn_size02"><a href="javascript:add()">단가추가</a></span>
						</div>
					</dd>
				</dl>
			</div>
		</div>
		<!-- e: table area-->
		
		<br /><br /><br /><br />
		
		<!-- s: search -->
		<div id ="addData" style="display: none;">
		<div class="search_form_wrap">
			<table cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="15%" />
					<col width="*%" />
				</colgroup>
				
				<tbody>
					<tr>
						<th><div class="tit">단가정보</div></th>
						<td>
							<label>종별 : </label>
							<strong class="font_bold" id ="title2">서울도시가스</strong>
							
							<span class="rtl">
								<label style="margin-left:30px;">적용시작일자 : </label>
								<span class="entry_calendar">
									<input type="text" class="datepicker" id="applyDate" name="applyDate" value="" style="width:77px;" readonly="">
									<a href="#" class="btn_calender"><i class="fa fa-calendar"></i></a>
								</span>
							</span>
						</td>
					</tr>
				<tbody>
			</table>
		</div>
		<!-- e: search -->
		
		<!-- s: table wrap-->
		<div class="table_wrap">
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">구분</th>
						<th colspan="3">가스량요금(원/MJ)</th>
					</tr>
					<tr>
						<th>동절기(12~3월)</th>
						<th>하절기(5~9월)</th>
						<th>기타(4, 10~11월)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>원/MJ</th>
						<td><input type="text" style="width:95%" id="data01" name="data01" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data02" name="data02" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data03" name="data03" class="inp_txt w01" value=""></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- e: table wrap-->
		
		<div class="rtl">
			<span class="btn btn_type02 btn_size02"><a href="javascript:save()">저장</a></span>
		</div>
		</div>
	</form:form>
	</div>




<div class="model_container" id="layerPop_type1">
	<div class="model_inner">
		<div class="model_header"><h2>가스요금 종목추가</h2></div> 
		<div class="model_body">
			<div class="model_content">
 			 			
				<div class="model_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="100px" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th>종명</th>
									<td><input type="text" id="priceName" name="priceName" value="" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="model_btn_wrap">
						<span class="btn btn_type02 btn_size02"><a href="#" onclick="goRegistNm();">확인</a></span>
						<span class="btn btn_type03 btn_size02"><a href="#" class="closePop">취소</a></span>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>