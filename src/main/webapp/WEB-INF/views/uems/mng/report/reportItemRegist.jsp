<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<script type="text/javaScript">
	$(document).ready(function(){
		
		var date = new Date();
		var currentYear = date.getFullYear();
		
		// TODO JAR 그룹 - 이마트만 고정으로
		$("#searchCondition").val('1').attr("disabled", true);
		selectSiteList($("#searchCondition").val());
		
		$("#searchCondition").change(function() {
			selectSiteList($(this).val());
		});

		$("#searchCondition2").change(function() {
			if(!isEmpty($("#frm input[name=siteId]").val())) {
				if($("#searchCondition2").val()!='' && confirm("저장하지 않을 경우 데이터를 잃습니다. 해당 지점을 변경하시겠습니까?")) {
					// 보고서 항목 데이터 초기화
					$("#itemDiv").hide();
					$("#itemDiv .table_wrap input, #elecNightFactor, #elecDayFactor, #reductionElec").val("");
					$("#itemDiv .table_wrap").find("span[id$=Text]").text("");
					$("select[name$=EffYear]").val(currentYear);
					selectReportItem();
				} else {
					// 기존 siteId 유지
					$("#searchCondition2").val($("#frm input[name=siteId]").val());
				}
			} else {
				selectReportItem();
			}
		});

		
		// 연도 selectbox (현재 연도에서 +-15년 선택 가능)
		var yearHtml = "";
		for(var i= currentYear-15; i<currentYear+16; i++){
			yearHtml += '<option value='+i+'>'+i+' 년</option>'; 
		}
		$("select[name$=EffYear]").append(yearHtml);
		$("select[name$=EffYear]").val(currentYear);
		$("input[name$=EffYear]").val(currentYear);
		
		// 냉온수기, 흡수식 냉각탑, 흡수식 냉각수펌프 전기 합산
		$("#chillerheaterEle, #absorTowerEle, #absorPumpEle").keyup(function() {
			$("#prevAbsorAmt").val(parseFloat($("#chillerheaterEle").val() || 0) + parseFloat($("#absorTowerEle").val() || 0) + parseFloat($("#absorPumpEle").val() || 0)); 
			$("#prevAbsorAmtText").text($("#prevAbsorAmt").val());
		});
		
		// 터보냉동기, 터보 냉각탑, 터보 냉각수펌프 전기 합산
		$("#turboChillerEle, #turboTowerEle, #turboPumpEle").keyup(function() {
			$("#prevTurboAmt").val(parseFloat($("#turboChillerEle").val() || 0) + parseFloat($("#turboTowerEle").val() || 0) + parseFloat($("#turboPumpEle").val() || 0)); 
			$("#prevTurboAmtText").text($("#prevTurboAmt").val());
		});
		
		// 냉온수기 가스 자동입력
		$("#chillerheaterGas").keyup(function() {
			$("#prevGasAmt").val($(this).val()); 
			$("#prevGasAmtText").text($("#prevGasAmt").val());
		});
		
		// 방냉펌프, 브라인펌프 전기 합산
		$("#relestoragePumpEle, #brinePumpEle").keyup(function() {
			$("#presIcethermalAmt").val(parseFloat($("#relestoragePumpEle").val() || 0) + parseFloat($("#brinePumpEle").val() || 0)); 
			$("#presIcethermalAmtText").text($("#presIcethermalAmt").val());
		});
		
		// 저온 냉동기 주간합계+빙축열용 냉각탑+축냉펌프+브라인펌프+빙축열용 냉각수펌프  전기 합산
		$("#lowChillerDayEle, #icethermalTowerEle, #coolstoragePumpEle, #brinePumpEle, #coolingPumpEle").keyup(function() {
			$("#presEleDayAmt").val(parseFloat($("#lowChillerDayEle").val() || 0) + parseFloat($("#icethermalTowerEle").val() || 0) + parseFloat($("#coolstoragePumpEle").val() || 0) 
					+ parseFloat($("#brinePumpEle").val() || 0) + parseFloat($("#coolingPumpEle").val() || 0)); 
			$("#presEleDayAmtText").text($("#presEleDayAmt").val());
		});
		
		// 저온 냉동기 야간합계+빙축열용 냉각탑+축냉펌프+브라인펌프+빙축열용 냉각수펌프  전기 합산
		$("#lowChillerNightEle, #icethermalTowerEle, #coolstoragePumpEle, #brinePumpEle, #coolingPumpEle").keyup(function() {
			$("#presEleNightAmt").val(parseFloat($("#lowChillerNightEle").val() || 0) + parseFloat($("#icethermalTowerEle").val() || 0) + parseFloat($("#coolstoragePumpEle").val() || 0) 
					 + parseFloat($("#brinePumpEle").val() || 0) + parseFloat($("#coolingPumpEle").val() || 0)); 
			$("#presEleNightAmtText").text($("#presEleNightAmt").val());
		});
		

	});
	
	// 보고서 항목 조회
	function selectReportItem() {
		var siteId = $("#searchCondition2").val();
		$("input[name=siteId]").val(siteId);
		
		$.ajax({
			url : "/uems/mng/report/selectReportItemDetailAjax.do",
			type: "POST",
			data: {siteId : siteId},
			dataType : "json"
		}).done( function(data) {
			var prevFacilityCode = data.siteInfo.prevFacilityCode;
			var specInfo = data.specInfo;
			var rateInfo = data.rateInfo;
			
			$("input[name=prevFacilityCode]").val(prevFacilityCode);
		    if(prevFacilityCode == "01") {		// 흡수식일 경우
		    	$("#itemDiv .table_wrap").find("input[name^=turbo], select[name^=turbo]").attr("disabled", true);
		    	$("#itemDiv .table_wrap").find("input[name^=chiller]").attr("disabled", false);
		    	$("#itemDiv .table_wrap").find("input[name^=absor], select[name^=absor]").attr("disabled", false);
		    } else if(prevFacilityCode == "02") {		// 터보일 경우
		    	$("#itemDiv .table_wrap").find("input[name^=chiller]").attr("disabled", true);
		    	$("#itemDiv .table_wrap").find("input[name^=absor], select[name^=absor]").attr("disabled", true);
		    	$("#itemDiv .table_wrap").find("input[name^=turbo], select[name^=turbo]").attr("disabled", false);
		    } else { // 흡수식 + 터보일 경우
		    	$("#itemDiv .table_wrap").find("input[name^=turbo], select[name^=turbo]").attr("disabled", false);
		    	$("#itemDiv .table_wrap").find("input[name^=chiller]").attr("disabled", false);
		    	$("#itemDiv .table_wrap").find("input[name^=absor], select[name^=absor]").attr("disabled", false);
		    }
		    
		    if(specInfo != null) {
		    	$("input[name=mfsId]").val(specInfo.mfsId);
			    $("#prevAbsorAmtText").text(specInfo.prevAbsorAmt);
			    $("#prevTurboAmtText").text(specInfo.prevTurboAmt);
			    $("#prevGasAmtText").text(specInfo.prevGasAmt);
			    $("#presIcethermalAmtText").text(specInfo.presIcethermalAmt);
			    $("#presEleDayAmtText").text(specInfo.presEleDayAmt);
			    $("#presEleNightAmtText").text(specInfo.presEleNightAmt);
			    
			    for (var key in specInfo) {
			    	var value = specInfo[key];
			    	if(isNaN(value)) {
			    		value = "";
			    	}
			        $("#itemDiv .table_wrap").eq(0).find("#"+key).val(value);
			    }
		    } else {
		    	$("input[name=mfsId]").val("");
		    }
		    
		    
		    if(rateInfo != null) {
			    $("input[name=mfrId]").val(rateInfo.mfrId);
			    $("#elecNightFactor").val(rateInfo.elecNightFactor);
			    $("#elecDayFactor").val(rateInfo.elecDayFactor);
			    $("#reductionElec").val(rateInfo.reductionElec);
			    
			    for (var key in rateInfo) {
			    	var value = rateInfo[key];
			    	if(isNaN(value)) {
			    		value = "";
			    	}
			        $("#itemDiv .table_wrap").eq(1).find("#"+key).val(value);
			    }
		    } else {
		    	$("input[name=mfrId]").val("");
		    }
		    
		    
		});
		
		$("#itemDiv").show();
	}
	
	// 보고서 항목 등록
	function reportItemRegist() {
		
		var prevFacilityCode = $("input[name=prevFacilityCode]").val();
		// TODO validation check 필요
		// prevFacilityCode 값에 따라 필수값 분기처리
		var checkArr = [];
		if(prevFacilityCode == "01") {		// 흡수식일 경우
			checkArr = ['chillerheaterCnt', 'chillerheaterVol', 'chillerheaterEle', 'chillerheaterGas', 'absorTowerCnt', 'absorTowerVol', 'absorTowerEle'
				, 'absorPumpCnt', 'absorPumpVol', 'absorPumpEle', 'lowChillerCnt', 'lowChillerDayVol', 'lowChillerDayEle', 'lowChillerNightVol', 'lowChillerNightEle'
				, 'absorLoadRate05', 'absorLoadRate06', 'absorLoadRate07', 'absorLoadRate08', 'absorLoadRate09', 'absorLoadRate10' 
				, 'absorWorkRate05', 'absorWorkRate06', 'absorWorkRate07', 'absorWorkRate08', 'absorWorkRate09', 'absorWorkRate10'
				, 'absorHeatEffRate', 'absorAsstEffRate', 'absorOpenDay', 'absorWorkHour', 'elecNightFactor', 'elecDayFactor', 'reductionElec'];
		} else if(prevFacilityCode == "02") {		// 터보일 경우
			checkArr = ['turboChillerCnt', 'turboChillerVol', 'turboChillerEle', 'turboTowerCnt', 'turboTowerVol', 'turboTowerEle', 'turboPumpCnt'
				, 'turboPumpVol', 'turboPumpEle', 'lowChillerCnt', 'lowChillerDayVol', 'lowChillerDayEle', 'lowChillerNightVol', 'lowChillerNightEle'
				, 'turboLoadRate05', 'turboLoadRate06', 'turboLoadRate07', 'turboLoadRate08', 'turboLoadRate09', 'turboLoadRate10'
				, 'turboWorkRate05', 'turboWorkRate06', 'turboWorkRate07', 'turboWorkRate08', 'turboWorkRate09', 'turboWorkRate10'
				, 'turboHeatEffRate', 'turboAsstEffRate', 'turboOpenDay', 'turboWorkHour', 'elecNightFactor', 'elecDayFactor', 'reductionElec'];
		} else {
			checkArr = ['chillerheaterCnt', 'chillerheaterVol', 'chillerheaterEle', 'chillerheaterGas', 'absorTowerCnt', 'absorTowerVol', 'absorTowerEle'
				, 'absorPumpCnt', 'absorPumpVol', 'absorPumpEle', 'turboChillerCnt', 'turboChillerVol', 'turboChillerEle', 'turboTowerCnt', 'turboTowerVol', 'turboTowerEle'
				, 'turboPumpCnt', 'turboPumpVol', 'turboPumpEle', 'lowChillerCnt', 'lowChillerDayVol', 'lowChillerDayEle', 'lowChillerNightVol', 'lowChillerNightEle'
				, 'absorLoadRate05', 'absorLoadRate06', 'absorLoadRate07', 'absorLoadRate08', 'absorLoadRate09', 'absorLoadRate10' 
				, 'turboLoadRate05', 'turboLoadRate06', 'turboLoadRate07', 'turboLoadRate08', 'turboLoadRate09', 'turboLoadRate10'
				, 'absorWorkRate05', 'absorWorkRate06', 'absorWorkRate07', 'absorWorkRate08', 'absorWorkRate09', 'absorWorkRate10'
				, 'absorHeatEffRate', 'absorAsstEffRate', 'absorOpenDay', 'absorWorkHour'
				, 'turboWorkRate05', 'turboWorkRate06', 'turboWorkRate07', 'turboWorkRate08', 'turboWorkRate09', 'turboWorkRate10'
				, 'turboHeatEffRate', 'turboAsstEffRate', 'turboOpenDay', 'turboWorkHour', 'elecNightFactor', 'elecDayFactor', 'reductionElec'];
		}
		
		if (formValidationCheck(checkArr)){
			if(checkNumber(checkArr)) {
				$("#frm").attr("action", "/uems/mng/report/reportItemRegistExe.do");
				$("#frm").submit();	
			}
		}
	}
	
	function checkNumber(valCheck) {
		for(var i in valCheck){
			if(isNaN($('#' + valCheck[i]).val())){
				alert("숫자를 입력해주세요.");
				$('#' + valCheck[i]).val("");
				$('#' + valCheck[i]).focus();
				return false;
			}
		}
		return true;
	}
	
	function selectSiteList(sgId) {
		
		if(isEmpty(sgId)) {
			var html = "";
			html += "<option value=''>-</option>";
			
			$("#searchCondition2").empty();
			$("#searchCondition2").append(html);
			
		} else {
			$.ajax({
				url : "/uems/mng/user/selectSiteListAjax.do",
				type: "POST",
				data: {searchCondition : sgId},
				dataType : "json"
			}).done( function(data) {
				var list = data.siteList;
				var html = "<option value=''>선택하십시오</option>";
				for(var i=0; i<list.length; i++) {
					if(list[i].siteId == '${workHistory.searchCondition2}') {
						html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
					} else {
						html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
					}
					
				}
				
				$("#searchCondition2").empty();
				$("#searchCondition2").append(html);
	
			});
		}
	}
	
	//validation 관련 alert 메시지
	function alertMessageSource(el_id){
		switch (el_id) {
			case 'chillerheaterCnt':
				alert('냉온수기 수량을 입력해주세요.');
				break;
			case 'chillerheaterVol':
				alert('냉온수기 용량을 입력해주세요.');
				break;
			case 'chillerheaterEle':
				alert('냉온수기 전기를 입력해주세요.');
				break;
			case 'chillerheaterGas':
				alert('냉온수기 가스를 입력해주세요.');
				break;
			case 'absorTowerCnt':
				alert('흡수식용 냉각탑 수량을 입력해주세요.');
				break;
			case 'absorTowerVol':
				alert('흡수식용 냉각탑 용량을 입력해주세요.');
				break;
			case 'absorTowerEle':
				alert('흡수식용 냉각탑 전기를 입력해주세요.');
				break;
			case 'absorPumpCnt':
				alert('흡수식용 냉각수펌프 수량을 입력해주세요.');
				break;
			case 'absorPumpVol':
				alert('흡수식용 냉각수펌프 용량을 입력해주세요.');
				break;
			case 'absorPumpEle':
				alert('흡수식용 냉각수펌프 전기를 입력해주세요.');
				break;
			case 'turboChillerCnt':
				alert('터보냉동기 수량을 입력해주세요.');
				break;
			case 'turboChillerVol':
				alert('터보냉동기 용량을 입력해주세요.');
				break;
			case 'turboChillerEle':
				alert('터보냉동기 전기를 입력해주세요.');
				break;
			case 'turboTowerCnt':
				alert('터보용 냉각탑 수량을 입력해주세요.');
				break;
			case 'turboTowerVol':
				alert('터보용 냉각탑 용량을 입력해주세요.');
				break;
			case 'turboTowerEle':
				alert('터보용 냉각탑 전기를 입력해주세요.');
				break;
			case 'turboPumpCnt':
				alert('터보용 냉각수펌프 수량을 입력해주세요.');
				break;
			case 'turboPumpVol':
				alert('터보용 냉각수펌프 용량을 입력해주세요.');
				break;
			case 'turboPumpEle':
				alert('터보용 냉각수펌프 전기를 입력해주세요.');
				break;
			case 'lowChillerCnt':
				alert('저온냉동기 수량을 입력해주세요.');
				break;
			case 'lowChillerDayVol':
			case 'lowChillerNightVol':
				alert('저온냉동기 용량을 입력해주세요.');
				break;
			case 'lowChillerDayEle':
			case 'lowChillerNightEle':
				alert('저온냉동기 전기를 입력해주세요.');
				break;
			case 'icethermalTowerCnt':
				alert('빙축열용 냉각탑 수량을 입력해주세요.');
				break;
			case 'icethermalTowerVol':
				alert('빙축열용 냉각탑 용량을 입력해주세요.');
				break;
			case 'icethermalTowerEle':
				alert('빙축열용 냉각탑 전기를 입력해주세요.');
				break;
			case 'thermalStorageCnt':
				alert('축열조 수량을 입력해주세요.');
				break;
			case 'thermalStorageVol':
				alert('축열조 용량을 입력해주세요.');
				break;
			case 'heatExchangerCnt':
				alert('열교환기 수량을 입력해주세요.');
				break;
			case 'heatExchangerVol':
				alert('영교환기 용량을 입력해주세요.');
				break;
			case 'coolstoragePumpCnt':
				alert('축냉펌프 수량을 입력해주세요.');
				break;
			case 'coolstoragePumpVol':
				alert('축냉펌프 용량을 입력해주세요.');
				break;
			case 'coolstoragePumpEle':
				alert('축냉펌프 전기를 입력해주세요.');
				break;
			case 'relestoragePumpCnt':
				alert('방냉펌프 수량을 입력해주세요.');
				break;
			case 'relestoragePumpVol':
				alert('방냉펌프 용량을 입력해주세요.');
				break;
			case 'relestoragePumpEle':
				alert('방냉펌프 전기를 입력해주세요.');
				break;
			case 'brinePumpCnt':
				alert('브라인펌프 수량을 입력해주세요.');
				break;
			case 'brinePumpVol':
				alert('브라인펌프 용량을 입력해주세요.');
				break;
			case 'brinePumpEle':
				alert('브라인펌프 전기를 입력해주세요.');
				break;
			case 'coolingPumpCnt':
				alert('빅축열용 냉각펌프 수량을 입력해주세요.');
				break;
			case 'coolingPumpVol':
				alert('빅축열용 냉각펌프 용량을 입력해주세요.');
				break;
			case 'coolingPumpEle':
				alert('빅축열용 냉각펌프 전기를 입력해주세요.');
				break;
			case 'absorLoadRate05':
			case 'absorLoadRate06':
			case 'absorLoadRate07':
			case 'absorLoadRate08':
			case 'absorLoadRate09':
			case 'absorLoadRate10':
				alert('흡수식 냉온수기 담당부하율을 입력해주세요.');
				break;
			case 'turboLoadRate05':
			case 'turboLoadRate06':
			case 'turboLoadRate07':
			case 'turboLoadRate08':
			case 'turboLoadRate09':
			case 'turboLoadRate10':
				alert('터보 냉동기 담당부하율을 입력해주세요.');
				break;
			case 'absorWorkRate05':
			case 'absorWorkRate06':
			case 'absorWorkRate07':
			case 'absorWorkRate08':
			case 'absorWorkRate09':
			case 'absorWorkRate10':
				alert('흡수식 장비가동율을 입력해주세요.');
				break;
			case 'absorHeatEffRate':
				alert('흡수기 열원장비효율을 입력해주세요.');
				break;
			case 'absorAsstEffRate':
				alert('흡수기 보조장비효율을 입력해주세요.');
				break;
			case 'absorOpenDay':
				alert('흡수식 오픈일수를 입력해주세요.');
				break;
			case 'absorWorkHour':
				alert('흡수식 냉방운영시간을 입력해주세요.');
				break;
			case 'turboWorkRate05':
			case 'turboWorkRate06':
			case 'turboWorkRate07':
			case 'turboWorkRate08':
			case 'turboWorkRate09':
			case 'turboWorkRate10':
				alert('터보 장비가동율을 입력해주세요.');
				break;
			case 'turboHeatEffRate':
				alert('터보 열원장비효율을 입력해주세요.');
				break;
			case 'turboAsstEffRate':
				alert('터보 보조장비효율을 입력해주세요.');
				break;
			case 'turboOpenDay':
				alert('터보 오픈일수를 입력해주세요.');
				break;
			case 'turboWorkHour':
				alert('터보 냉방운영시간을 입력해주세요.');
				break;
			case 'elecNightFactor':
				alert('심야전기배율을 입력해주세요.');
				break;
			case 'elecDayFactor':
				alert('일반전기배율을 입력해주세요.');
				break;
			case 'reductionElec':
				alert('경감용량을 입력해주세요.');
				break;
				
		}
		
	}
</script>

<div class="contents_wrap">
<form name="frm" id="frm" method="post">	
	<input type="hidden" name="siteId" />
	<input type="hidden" name="mfsId" />
	<input type="hidden" name="mfrId" />
	<input type="hidden" name="prevFacilityCode" />
	
	<!-- s: cont_wrap -->
	<div class="cont_wrap01">
		<h2 class="main_title">보고서관리 - 보고서 항목입력</h2>
		<ul class="list">
			<li><div class="icon_noti01"><i class="fa fa-info"></i>&nbsp;&nbsp;보고서 항목을 등록합니다.</div></li>
		</ul>
	</div>
	<!-- e: cont_wrap -->
	
	<div class="search_form_wrap">
		<table cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="10%" />
				<col width="*%" />
			</colgroup>
			
			<tbody>
				<tr class="rtl">
					<td>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="searchCondition" name="searchCondition">
								<c:forEach var="result" items="${groupAllList}" varStatus="status">
									<option value="${result.sgId}" label="${result.sgName}"/>
								</c:forEach>
							</select>
						</span>
						<span class="sel_wrap w01" style="width:200px;">
							<select id="searchCondition2" name="searchCondition2">
							</select>
						</span>
						<!-- <span class="btn btn_type02 btn_size02"><a href="javascript:selectReportItem();">검 색</a></span> -->
					</td>
				</tr>
			<tbody>
		</table>
	</div> 
	
	<div id="itemDiv" class="scroll" style="display:none; height:calc(100% - 50px);">
	
		<!-- s: table wrap-->
		<div class="table_wrap">
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="15%"/>
					<col width="15%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<thead>
					<tr>
						<th colspan="2" rowspan="2">구분</th>
						<th colspan="4">개선전</th>
						<th colspan="3">개선후</th>
					</tr>
					<tr>
						<th>수량</th>
						<th>용량</th>
						<th>전기(kw)</th>
						<th>가스(Nm3)</th>
						<th>수량</th>
						<th>용량</th>
						<th>전기(kw)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="2">냉온수기</th>
						<td><input type="text" class="inp_txt w02" id="chillerheaterCnt" name="chillerheaterCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="chillerheaterVol" name="chillerheaterVol" style="width: 60%" maxlength="13" />USRt</td>
						<td><input type="text" class="inp_txt w02" id="chillerheaterEle" name="chillerheaterEle" style="width: 100%" maxlength="13" /></td>
						<td><input type="text" class="inp_txt w02" id="chillerheaterGas" name="chillerheaterGas" style="width: 100%" maxlength="13" /></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th colspan="2">흡수식용 냉각탑</th>
						<td><input type="text" class="inp_txt w02" id="absorTowerCnt" name="absorTowerCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="absorTowerVol" name="absorTowerVol" style="width: 60%" maxlength="13" />CRT</td>
						<td><input type="text" class="inp_txt w02" id="absorTowerEle" name="absorTowerEle" style="width: 100%" maxlength="13" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th colspan="2">흡수식용 냉각수펌프</th>
						<td><input type="text" class="inp_txt w02" id="absorPumpCnt" name="absorPumpCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="absorPumpVol" name="absorPumpVol" style="width: 60%" maxlength="13" />kW</td>
						<td><input type="text" class="inp_txt w02" id="absorPumpEle" name="absorPumpEle" style="width: 100%" maxlength="13" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th colspan="2">터보냉동기</th>
						<td><input type="text" class="inp_txt w02" id="turboChillerCnt" name="turboChillerCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="turboChillerVol" name="turboChillerVol" style="width: 60%" maxlength="13" />USRt</td>
						<td><input type="text" class="inp_txt w02" id="turboChillerEle" name="turboChillerEle" style="width: 100%" maxlength="13" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th colspan="2">터보용 냉각탑</th>
						<td><input type="text" class="inp_txt w02" id="turboTowerCnt" name="turboTowerCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="turboTowerVol" name="turboTowerVol" style="width: 60%" maxlength="13" />CRT</td>
						<td><input type="text" class="inp_txt w02" id="turboTowerEle" name="turboTowerEle" style="width: 100%" maxlength="13" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th colspan="2">터보용 냉각수펌프</th>
						<td><input type="text" class="inp_txt w02" id="turboPumpCnt" name="turboPumpCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="turboPumpVol" name="turboPumpVol" style="width: 60%" maxlength="13" />kW</td>
						<td><input type="text" class="inp_txt w02" id="turboPumpEle" name="turboPumpEle" style="width: 100%" maxlength="13" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan="2">저온냉동기</th>
						<th>주간</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td rowspan="2"><input type="text" class="inp_txt w02" id="lowChillerCnt" name="lowChillerCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="lowChillerDayVol" name="lowChillerDayVol" style="width: 60%" maxlength="13" />USRt</td>
						<td><input type="text" class="inp_txt w02" id="lowChillerDayEle" name="lowChillerDayEle" style="width: 100%" maxlength="13" /></td>
					</tr>
					<tr>
						<th>야간</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="lowChillerNightVol" name="lowChillerNightVol" style="width: 60%" maxlength="13" />USRt</td>
						<td><input type="text" class="inp_txt w02" id="lowChillerNightEle" name="lowChillerNightEle" style="width: 100%" maxlength="13" /></td>
					</tr>
					<tr>
						<th colspan="2">빙축열용 냉각탑</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" class="inp_txt w02" id="icethermalTowerCnt" name="icethermalTowerCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="icethermalTowerVol" name="icethermalTowerVol" style="width: 60%" maxlength="13" />CRT</td>
						<td><input type="text" class="inp_txt w02" id="icethermalTowerEle" name="icethermalTowerEle" style="width: 100%" maxlength="13" /></td>
					</tr>
					<tr>
						<th colspan="2">축열조</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" class="inp_txt w02" id="thermalStorageCnt" name="thermalStorageCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="thermalStorageVol" name="thermalStorageVol" style="width: 60%" maxlength="13" />USRt-h</td>
						<td></td>
					</tr>
					<tr>
						<th colspan="2">열교환기</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" class="inp_txt w02" id="heatExchangerCnt" name="heatExchangerCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="heatExchangerVol" name="heatExchangerVol" style="width: 60%" maxlength="13" />USRt</td>
						<td></td>
					</tr>
					<tr>
						<th colspan="2">축냉펌프</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" class="inp_txt w02" id="coolstoragePumpCnt" name="coolstoragePumpCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="coolstoragePumpVol" name="coolstoragePumpVol" style="width: 60%" maxlength="13" />kW</td>
						<td><input type="text" class="inp_txt w02" id="coolstoragePumpEle" name="coolstoragePumpEle" style="width: 100%" maxlength="13" /></td>
					</tr>
					<tr>
						<th colspan="2">방냉펌프</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" class="inp_txt w02" id="relestoragePumpCnt" name="relestoragePumpCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="relestoragePumpVol" name="relestoragePumpVol" style="width: 60%" maxlength="13" />kW</td>
						<td><input type="text" class="inp_txt w02" id="relestoragePumpEle" name="relestoragePumpEle" style="width: 100%" maxlength="13" /></td>
					</tr>
					<tr>
						<th colspan="2">브라인펌프</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" class="inp_txt w02" id="brinePumpCnt" name="brinePumpCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="brinePumpVol" name="brinePumpVol" style="width: 60%" maxlength="13" />kW</td>
						<td><input type="text" class="inp_txt w02" id="brinePumpEle" name="brinePumpEle" style="width: 100%" maxlength="13" /></td>
					</tr>
					<tr>
						<th colspan="2">빙축열용 냉각수펌프</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" class="inp_txt w02" id="coolingPumpCnt" name="coolingPumpCnt" style="width: 100%" maxlength="6" /></td>
						<td class="tal"><input type="text" class="inp_txt w02" id="coolingPumpVol" name="coolingPumpVol" style="width: 60%" maxlength="13" />kW</td>
						<td><input type="text" class="inp_txt w02" id="coolingPumpEle" name="coolingPumpEle" style="width: 100%" maxlength="13" /></td>
					</tr>
					<tr>
						<th colspan="2">가스사용량</th>
						<td></td>
						<td></td>
						<td></td>
						<td class="sum"><input type="hidden" id="prevGasAmt" name="prevGasAmt" /><span id="prevGasAmtText"></span></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th rowspan="3">일반전력</th>
						<th>흡수식</th>
						<td></td>
						<td></td>
						<td class="sum"><input type="hidden" id="prevAbsorAmt" name="prevAbsorAmt" /><span id="prevAbsorAmtText"></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>터보</th>
						<td></td>
						<td></td>
						<td class="sum"><input type="hidden" id="prevTurboAmt" name="prevTurboAmt" /><span id="prevTurboAmtText"></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>빙축열</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="sum"><input type="hidden" id="presIcethermalAmt" name="presIcethermalAmt" /><span id="presIcethermalAmtText"></span></td>
					</tr>
					<tr>
						<th colspan="2">심야전력 - 주간</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="sum"><input type="hidden" id="presEleDayAmt" name="presEleDayAmt"/><span id="presEleDayAmtText"></span></td>
					</tr>
					<tr>
						<th colspan="2">심야전력 - 야간</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="sum"><input type="hidden" id="presEleNightAmt" name="presEleNightAmt" /><span id="presEleNightAmtText"></span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />
		<div class="table_wrap">
			<table cellpadding="0" cellspacing="0" border="0" class="table_list_type">
				<colgroup>
					<col width="20%"/>
					<col width="20%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">항목</th>
						<th>5월</th>
						<th>6월</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="2">흡수식 냉온수기 담당부하율(%)</th>
						<td><input type="text" class="inp_txt w02" id="absorLoadRate05" name="absorLoadRate05" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorLoadRate06" name="absorLoadRate06" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorLoadRate07" name="absorLoadRate07" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorLoadRate08" name="absorLoadRate08" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorLoadRate09" name="absorLoadRate09" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorLoadRate10" name="absorLoadRate10" style="width: 100%" maxlength="8" /></td>
					</tr>
					<tr>
						<th colspan="2">터보 냉동기 담당부하율(%)</th>
						<td><input type="text" class="inp_txt w02" id="turboLoadRate05" name="turboLoadRate05" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboLoadRate06" name="turboLoadRate06" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboLoadRate07" name="turboLoadRate07" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboLoadRate08" name="turboLoadRate08" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboLoadRate09" name="turboLoadRate09" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboLoadRate10" name="turboLoadRate10" style="width: 100%" maxlength="8" /></td>
					</tr>
					<tr>
						<th rowspan="5">흡수식</th>
						<th>장비가동율(%)</th>
						<td><input type="text" class="inp_txt w02" id="absorWorkRate05" name="absorWorkRate05" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorWorkRate06" name="absorWorkRate06" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorWorkRate07" name="absorWorkRate07" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorWorkRate08" name="absorWorkRate08" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorWorkRate09" name="absorWorkRate09" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="absorWorkRate10" name="absorWorkRate10" style="width: 100%" maxlength="8" /></td>
					</tr>
					<tr>
						<th>열원장비효율(%)</th>
						<td colspan="3">시작일  : &nbsp;&nbsp;
							<span class="sel_wrap" style="width:80%;">
								<select id="absorHeatEffYear" name="absorHeatEffYear">
								</select>
							</span>
						</td>
						<td colspan="3"><input type="text" class="inp_txt w02" id="absorHeatEffRate" name="absorHeatEffRate" style="width: 100%" maxlength="8" /></td>
					</tr>
					<tr>
						<th>보조장비효율(%)</th>
						<!-- <td colspan="3">시작일  : &nbsp;&nbsp;
							<span class="sel_wrap" style="width:80%;">
								<select id="absorAsstEffYear" name="absorAsstEffYear">
								</select>
							</span>
						</td> -->
						<td colspan="6">
							<input type="hidden" id="absorAsstEffYear" name="absorAsstEffYear" />
							<input type="text" class="inp_txt w02" id="absorAsstEffRate" name="absorAsstEffRate" style="width: 100%" maxlength="8" />
						</td>
					</tr>
					<tr>
						<th>오픈일수(day)</th>
						<td colspan="6"><input type="text" class="inp_txt w02" id="absorOpenDay" name="absorOpenDay" style="width: 100%" maxlength="3" /></td>
					</tr>
					<tr>
						<th>냉방운영시간(hr)</th>
						<td colspan="6"><input type="text" class="inp_txt w02" id="absorWorkHour" name="absorWorkHour" style="width: 100%" maxlength="3" /></td>
					</tr>
					<tr>
						<th rowspan="5">터보</th>
						<th>장비가동율(%)</th>
						<td><input type="text" class="inp_txt w02" id="turboWorkRate05" name="turboWorkRate05" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboWorkRate06" name="turboWorkRate06" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboWorkRate07" name="turboWorkRate07" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboWorkRate08" name="turboWorkRate08" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboWorkRate09" name="turboWorkRate09" style="width: 100%" maxlength="8" /></td>
						<td><input type="text" class="inp_txt w02" id="turboWorkRate10" name="turboWorkRate10" style="width: 100%" maxlength="8" /></td>
					</tr>
					<tr>
						<th>열원장비효율(%)</th>
						<td colspan="3">시작일  : &nbsp;&nbsp;
							<span class="sel_wrap" style="width:80%;">
								<select id="turboHeatEffYear" name="turboHeatEffYear">
								</select>
							</span>
						</td>
						<td colspan="3"><input type="text" class="inp_txt w02" id="turboHeatEffRate" name="turboHeatEffRate" style="width: 100%" maxlength="8" /></td>
					</tr>
					<tr>
						<th>보조장비효율(%)</th>
						<!-- <td colspan="3">시작일  : &nbsp;&nbsp;
							<span class="sel_wrap" style="width:80%;">
								<select id="turboAsstEffYear" name="turboAsstEffYear">
								</select>
							</span>
						</td> -->
						<td colspan="6">
							<input type="hidden" id="turboAsstEffYear" name="turboAsstEffYear" value=""/>
							<input type="text" class="inp_txt w02" id="turboAsstEffRate" name="turboAsstEffRate" style="width: 100%" maxlength="8" />
						</td>
					</tr>
					<tr>
						<th>오픈일수(day)</th>
						<td colspan="6"><input type="text" class="inp_txt w02" id="turboOpenDay" name="turboOpenDay" style="width: 100%" maxlength="3" /></td>
					</tr>
					<tr>
						<th>냉방운영시간(hr)</th>
						<td colspan="6"><input type="text" class="inp_txt w02" id="turboWorkHour" name="turboWorkHour" style="width: 100%" maxlength="3" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />
		<div class="search_form_wrap">
			<table cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="18%">
					<col width="*%">
					<col width="18%">
					<col width="*%">
				</colgroup>
				
				<tbody>
					<tr>
						<th><div class="tit">심야전기배율 *</div></th>
						<td>
							<input type="text" class="inp_txt w02" id="elecNightFactor" name="elecNightFactor" style="width: 100px" maxlength="8" />
						</td>
						<th><div class="tit">일반전기배율 *</div></th>
						<td>
							<input type="text" class="inp_txt w02" id="elecDayFactor" name="elecDayFactor" style="width: 100px" maxlength="8" />
						</td>
					</tr>
					<tr>
						<th><div class="tit">경감용량 *</div></th>
						<td colspan="3">
							<input type="text" class="inp_txt w02" id="reductionElec" name="reductionElec" style="width: 100px" maxlength="13" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- s: btn wrap 가운데 정렬-->
		<div class="btn_wrap02">
			<span class="btn btn_type02 btn_size03"><a href="javascript:reportItemRegist();">저장</a></span>
		</div>
		<!-- e: btn wrap-->
	</div>
</form>
</div>