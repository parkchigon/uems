<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">

$(document).ready(function(){
    var minDate = new Date();
    var dd = minDate.getDate()+1;
    minDate.setDate(dd);
   $("#applyDate").datepicker("option", "minDate", minDate); //오늘포함 이전날짜는 선택할 수 없게 비활성화
});



/* 단가추가 */
function add(){ 
	$('#data01, #data02 , #data03, #data04, #data05, #data06, #data07, #data08, #data09, #data10, #applyDate').val(''); // 단가추가 버튼 클릭시 모든 데이터 초기화
	$('#addData').show(); // 단가정보 화면 노출
	$('#applyDateKey').val(''); //등록일때는 적용시작일자 null
	
}

/* 종별선택에 따른 리스트(우측상단)  */
function priceList(pciId,priceName){
	$('#pciId').val(pciId);
	$('#pName').val(priceName); //title 임시저장
	$('#priceName').text($('#pName').val()); //우측상단 title
	$('#priceName2').text($('#pName').val()); // 단가정보테이블 title 
	 var date = new Date();
	 var year = date.getFullYear(); 
	 var month = date.getMonth()+1;
	 var date = date.getDate();
	 var today = year+addZeros(month,2)+addZeros(date,2);
	
	$.ajax({
		url : "/uems/mng/commPrice/selectPriceDataListAjax.do",
		type: "POST",
		async: false,
		data: {
				pciId : pciId
			   },
		dataType : "json"
	}).done( function(data) {
			$('#addButton').show(); // 종별 선택시 단가추가 버튼 노출
		//	$('#applyDate').val($('#temp').val()); //dateformat 유지
			var list = data.priceDataList;
			var html = "";
			if(list.length >=1) {
				for(var i=0; i<list.length; i++) {
								html += '<tr>'
								html +='<td>'+list[i].applyDate+'</td>'
								html +='<td>'+list[i].data10+'</td>'
								html +='<td>'+list[i].data01+'</td>'
								html +='<td>'+list[i].data02+'</td>'
								html +='<td>'+list[i].data03+'</td>'
								html +='<td>'+list[i].data04+'</td>'
								html +='<td>'+list[i].data05+'</td>'
								html +='<td>'+list[i].data06+'</td>'
								html +='<td>'+list[i].data07+'</td>'
								html +='<td>'+list[i].data08+'</td>'
								html +='<td>'+list[i].data09+'</td>'
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
				html +='<tr><td colspan="11"> 등록된 게시물이 없습니다.</td></tr>'
			}
			$("#priceDataList").empty(); // 초기화
			$("#priceDataList").append(html);
			$('#data01, #data02 , #data03, #data04, #data05, #data06, #data07, #data08, #data09, #data10, #applyDate').val(''); //등록,수정 후 입력데이터초기화
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
			$('#data04').val(dataInfo.data04);
			$('#data05').val(dataInfo.data05);
			$('#data06').val(dataInfo.data06);
			$('#data07').val(dataInfo.data07);
			$('#data08').val(dataInfo.data08);
			$('#data09').val(dataInfo.data09);
			$('#data10').val(dataInfo.data10);
			$('#applyDate').val(dataInfo.applyDate);
	});
}

/* 중복체크 */
function valChk(){
	var chk = false;
	var applyDate = $('#applyDate').val();
	applyDate = applyDate.replace(/-/gi,"");
	var pciId = $('#pciId').val(); 
	var applyDateKey = $('#applyDateKey').val();
	var data01 = $('#data01').val();
	var data02 = $('#data02').val();
	var data03 = $('#data03').val();
	var data04 = $('#data04').val();
	var data05 = $('#data05').val();
	var data06 = $('#data06').val();
	var data07 = $('#data07').val();
	var data08 = $('#data08').val();
	var data09 = $('#data09').val();
	var data10 = $('#data10').val();
	if(applyDate == null || applyDate == ''){
		alert('적용시작일자를 입력해주세요.');
		return false;
	}
	if(data01 == '' || data02 == '' || data03 == '' || data04 == '' || data05 == '' || data06 == '' || data07 == '' || data08 == '' || data09 == '' || data10 == ''){
		alert('단가정보를 모두 입력해주세요.');
		return false;
	}
	
	if(applyDateKey == applyDate) { //적용시작일자 변경없는 경우에는 중복체크안함 
		return true;
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

function save(){ 
	var applyDate = $('#applyDate').val();
	$('#temp').val(applyDate); //날짜 dateformat 유지하기 위해서 저장
	if(valChk()){ 	//중복검사
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
				<li class="on"><a href="/uems/mng/commPrice/generalElecList.do">일반전기요금</a></li>
				<li><a href="/uems/mng/commPrice/midNightElecList.do">심야전기요금</a></li>
				<li><a href="/uems/mng/commPrice/gasList.do">가스요금</a></li>
			</ul>
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
								<tbody>
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
					</dd>
				</dl>
			</div>
			<div class="table_area_right">
				<dl>
					<dt><strong class="font_bold" id ="priceName">&nbsp; </strong><span class="rtl">(원 / kWh)</span></dt>
					<dd>
						<!-- s: table wrap-->
						<div class="table_wrap">
							<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
								<colgroup>
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="8%" />
									<col width="*" />
								</colgroup>
								<thead>
									<tr>
										<th rowspan="2">적용시작일</th>
										<th rowspan="2">기본요금</th>
										<th colspan="3">여름철(6~8월)</th>
										<th colspan="3">봄/가을철(3~5,9~10월)</th>
										<th colspan="3">겨울철(11~2월)</th>
										<th rowspan="2">수정</th>
									</tr>
									<tr>
										<th>경부하</th>
										<th>중부하</th>
										<th>최대부하</th>
										<th>경부하</th>
										<th>중부하</th>
										<th>최대부하</th>
										<th>경부하</th>
										<th>중부하</th>
										<th>최대부하</th>
									</tr>
								</thead>
								<tbody id ="priceDataList">
									
								</tbody>
							</table>
						</div>
						<!-- e: table wrap-->
					</dd>
				</dl>
			</div>
		</div>
		<!-- e: table area-->
		
		<div class="rtl" id ="addButton" style="display: none;">
			<span class="btn btn_type02 btn_size02"><a href="javascript:add()">단가추가</a></span>
		</div>
		
		<br /><br /><br /><br />
		 
		<!-- s: search -->
		<div id ="addData" style="display: none;">
		<div class="search_form_wrap">
			<table cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="10%" />
					<col width="*%" />
				</colgroup>
				
				<tbody>
					<tr>
						<th><div class="tit">단가정보</div></th>
						<td>
							<label>종별 : </label>
							<strong class="font_bold" id ="priceName2">&nbsp;</strong>
							
							<span class="rtl">
								<label style="margin-left:30px;">적용시작일자: </label>
								<span class="entry_calendar">
									<input type="text" class="datepicker" id="applyDate" name="applyDate" value="" style="width:77px;" readonly="readonly"></input>
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
					<col width="*" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">구분</th>
						<th colspan="3">전력량요금(원 / kWh)</th>
					</tr>
					<tr>
						<th>여름철(6~8월)</th>
						<th>봄/가을철(3~5,9~10월)</th>
						<th>겨울철(11~2월)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>기본요금</th>
						<td colspan="3"><input type="text" style="width:95%" id="data10" name="data10" class="inp_txt w01" value=""></td>
					</tr>
					<tr>
						<th>경부하</th>
						<td><input type="text" style="width:95%" id="data01" name="data01" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data04" name="data04" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data07" name="data07" class="inp_txt w01" value=""></td>
					</tr>
					<tr>
						<th>중부하</th>
						<td><input type="text" style="width:95%" id="data02" name="data02" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data05" name="data05" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data08" name="data08" class="inp_txt w01" value=""></td>
					</tr>
					<tr>
						<th>최대부하</th>
						<td><input type="text" style="width:95%" id="data03" name="data03" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data06" name="data06" class="inp_txt w01" value=""></td>
						<td><input type="text" style="width:95%" id="data09" name="data09" class="inp_txt w01" value=""></td>
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




