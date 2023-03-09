<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  
<script type="text/javaScript">

	$(document).ready(function(){
		// TODO JAR 자동/수동 선택 시 자동일 경우에 운전/정지 disabled 처리 추가 필요
		$("input:radio[name=autoYn]").click(function() {
			var layerId = $("input[name=layerId]").val(); 
			if($(this).val() == 0) {	// 자동일 경우 
				$(layerId + " div[id=runYn]").addClass("disabled");
				$(layerId + " div[id=openYn]").addClass("disabled");
				// 값입력 disabled
				$('input[id=nonAutoOutput]').attr('disabled',true);
				// 주간/야간 disabled
				$('input[id=dayYn]').attr('disabled',true);
				$('input[id=nightYn]').attr('disabled',true);
			} else {
				$(layerId + " div[id=runYn]").removeClass("disabled");
				$(layerId + " div[id=openYn]").removeClass("disabled");
				// 값입력 enabled
				$('input[id=nonAutoOutput]').attr('disabled',false);
				// 주간/야간 enabled
				$('input[id=dayYn]').attr('disabled',false);
				$('input[id=nightYn]').attr('disabled',false);	
			}
		});
		
		// 주간/야간(checkbox) 클릭시 한개만 선택되어지도록 한다.
		$("input:checkbox[name=dayYn]").click(function() {
			$("input:checkbox[name=nightYn]").attr("checked", false);
		});
		
		$("input:checkbox[name=nightYn]").click(function() {
			$("input:checkbox[name=dayYn]").attr("checked", false);
		});
		
		// (경부선) 냉동기 자동교번 선택/해제일 경우 냉동기선택 처리 추가 필요
		$("input:radio[name=shift]").click(function() {
			var layerId = $("input[name=layerId]").val(); 
			if($(this).val() == 0) {	// 해제(수동)일 경우 
				// 냉동기선택 enabled
				$('input[id=unit1]').attr('disabled',false);
				$('input[id=unit2]').attr('disabled',false);
			} else {
				// 냉동기선택 disabled
				$('input[id=unit1]').attr('disabled',true);
				$('input[id=unit2]').attr('disabled',true);	
			}
		});
		
		// (경부선) 냉동기1호기/2호기 클릭시 한개만 선택되어지도록 한다.
		$("input:checkbox[name=unit1]").click(function() {
			$("input:checkbox[name=unit2]").attr("checked", false);
		});
		
		$("input:checkbox[name=unit2]").click(function() {
			$("input:checkbox[name=unit1]").attr("checked", false);
		});
		
	});

	function updateTagValueSetting(id) {
		var map = new Map();
		var groupId = $("input[name=groupId]").val();
		var templateId = $("input[name=templateId]").val();
		var checkValidationYn = false;
		var array = new Array();
		var plcNo = -1;
		
		switch (id) {
		
		// 자동/수동, 기동/정지 팝업
		case '#layerPop_type1':	
			checkValidationYn = true;
			var classObject = null;
			
			var json = new Object();
			// '자동/수동' 값 저장
			classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]");
			var autoYn = $(id+" input:radio[name=autoYn]:checked").val();		// 1:수동   0:자동
			json.tagId = classObject.attr("id");
			if (json.tagId == null) {
				checkValidationYn = false;
				alert(templateId+"_"+groupId+"_auto_yn 태그아이디가 존재하지 않습니다!");
			}
			plcNo = classObject.attr("plcno");		// 제어 PLC번호
			json.value = autoYn;
			array.push(json);
			
			// 수동일 경우에만 '기동/정지'값 저장
			if(autoYn == 1) {
				if(!$(id+" #runYn").hasClass("disabled")) {
					var value = "";
					if($(id+" #runYn").hasClass("on")) {			// 기동
						value = "1";
					} else if($(id+" #runYn").hasClass("off")) {	// 정지
						value = "0";
					} else {
						checkValidationYn = false;
						alert("오류입니다. 개발사에 문의하시기 바랍니다!");
						break;
					}
					
					json = new Object();
					classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]");
					// '자동/수동'와 '기동/정지'의 PLC번호가 틀릴 경우 에러
					if(plcNo != classObject.attr("plcno")) {
						checkValidationYn = false;
						alert("동시에 두개 plc를 제어할 수 없습니다!");
						break;
					}
					json.tagId = classObject.attr("id");
					if (json.tagId == null) {
						checkValidationYn = false;
						alert(templateId+"_"+groupId+"_run_yn 태그아이디가 존재하지 않습니다!");
					}
					json.value = value;	
					array.push(json);
				} else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
					break;
				}
			}
			break;
			
		// 자동/수동, 수동설정값
		case '#layerPop_type2':	
			checkValidationYn = true;
			var classObject = null;
			
			var json = new Object();
			// '자동/수동' 값 저장
			classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]");
			var autoYn = $(id+" input:radio[name=autoYn]:checked").val();
			json.tagId = classObject.attr("id");
			if (json.tagId == null) {
				checkValidationYn = false;
				alert(templateId+"_"+groupId+"_auto_yn 태그아이디가 존재하지 않습니다!");
			}
			plcNo = classObject.attr("plcno");		// 제어 PLC번호
			json.value = autoYn;
			array.push(json);
			
			// 수동일 경우에만 설정값 저장
			if(autoYn == 1) {
				var textId = $(id+" #nonAutoOutput").val();
				if(isEmpty(textId)) {
					checkValidationYn = false;
					alert("수동 설정값을 입력해주세요.");
					break;
				}
				if(checkOutputValidation(id, textId)) {
					
					json = new Object();
					classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]");
					// '자동/수동'와 '기동/정지'의 PLC번호가 틀릴 경우 에러
					if(plcNo != classObject.attr("plcno")) {
						checkValidationYn = false;
						alert("동시에 두개 plc를 제어할 수 없습니다!");
						break;
					}
					json.tagId = classObject.attr("id");
					if (json.tagId == null) {
						checkValidationYn = false;
						alert(templateId+"_"+groupId+"_non_auto_output 태그아이디가 존재하지 않습니다!");
					}
					json.value = $(id+" input[name=nonAutoOutput]").val();
					array.push(json);
				} else {
					checkValidationYn = false;
					alert("입력 범위가 올바르지 않습니다.");
					break;
				}
			}
			break;
			
		// 설정값
		case '#layerPop_type3':	
			checkValidationYn = true;
			var classObject = null;
			
			var textId = $(id+" #output").val();
			if(isEmpty(textId)) {
				checkValidationYn = false;
				alert("설정값을 입력해주세요.");
				break;
			}
			if(checkOutputValidation(id, textId)) {

				var json = new Object();
				classObject = $("#tagForm input[class="+templateId+"_"+groupId+"]");
				json.tagId = classObject.attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+" 태그아이디가 존재하지 않습니다!");
				}
				plcNo = classObject.attr("plcno");		// 제어 PLC번호
				json.value = $(id+" input[name=output]").val();
				array.push(json);
			} else {
				checkValidationYn = false;
				alert("입력 범위가 올바르지 않습니다.");
				break;
			}
			break;
			
		// 사용/미사용
		
		case '#layerPop_type4':
			checkValidationYn = true;
			var classObject = null;
			
			var json = new Object();
			if(groupId.indexOf("cooltower") < 0 && !groupId.endsWith("_control") && (groupId.startsWith("fridge") || groupId.startsWith("hex")
					 || groupId.startsWith("store") || groupId.startsWith("terminal") || groupId.startsWith("cool"))) {
				classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_select]");
				json.tagId = classObject.attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_select 태그아이디가 존재하지 않습니다!");
				}
			} else {
				classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_use]");
				json.tagId = classObject.attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_use 태그아이디가 존재하지 않습니다!");
				}
			}
			plcNo = classObject.attr("plcno");		// 제어 PLC번호
			var useYn = $(id+" input:radio[name=useYn]:checked").val();
			json.value = useYn;
			array.push(json);
			break;			

		case '#layerPop_type5':		// 냉동기 병렬시 압축기 설정 (3개짜리)	
		case '#layerPop_type6':		// 축냉완료 > 축열조 설정
		case '#layerPop_type8' :	// 누적 적산열량 리셋
		case '#layerPop_type9' :	// 브라인펌프, 냉동기 적산시간 리셋
		case '#layerPop_type12':	// 냉동기 병렬시 압축기 설정 (2개짜리)
		case '#layerPop_type14' :	// 누적 적산열량 리셋, 흡수식냉동기 적산 냉수열량 리셋
		case '#layerPop_type15' :	// 냉동기 가동시간 리셋
		case '#layerPop_type16':	// 냉동기 병렬시 압축기 설정 (4개짜리)	
		case '#layerPop_type17' :	// 축냉/방냉 누적 적산열량 리셋
		case '#layerPop_type18' :	// 냉동기 가동시간 리셋
		case '#layerPop_type19' :	// 흡수식냉온수기 열량 리셋 (2개짜리)
		case '#layerPop_type20' :	// 흡수식냉온수기 가동시간 리셋 (2개짜리)
		case '#layerPop_type21':	// 냉각수운전 선택
		case '#layerPop_type22':	// 축냉운전 선택
		case '#layerPop_type23':	// 방냉운전 선택
		case '#layerPop_type24':	// 냉수운전 선택
		case '#layerPop_type25':	// 상온냉각수 예비선택
		case '#layerPop_type26':	// 빙축열냉각수 예비선택
		case '#layerPop_type27':	// 브라인 예비선택
		case '#layerPop_type28':	// 빙축열냉수 예비선택
		case '#layerPop_type29':	// 상온냉수 예비선택
			var json = null;
			checkValidationYn = true;
			var classObject = null;
			var componentId = null;
			var value = "";
			var i = 0;
			
			$(id+" div[class^=switch]").each(function() {
				componentId = $(this).attr("id");
				value = "";
				if($(this).hasClass("on")) {
					value = "1";
				} else if($(this).hasClass("off")) {
					value = "0";
				} else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
				}
				
				json = new Object();
				classObject = $("#tagForm input[class="+templateId+"_"+componentId);
				json.tagId = classObject.attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+componentId+" 태그아이디가 존재하지 않습니다!");
				}
				// 제어 PLC번호 입력
				if(i==0) {
					plcNo = classObject.attr("plcno");
				} else {
					if (plcNo != classObject.attr("plcno")) {
						checkValidationYn = false;
						alert("동시에 두개 plc를 제어할 수 없습니다!");
					}
				}
				json.value = value;
				array.push(json);
				i++;
			});
			break;	
			
			
		// 자동/수동, 운전/정지, 주간, 야간		
		case '#layerPop_type7':
			checkValidationYn = true;
			
			var json = new Object();
			var autoYn = $(id+" input:radio[name=autoYn]:checked").val();
			json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").attr("id");
			plcNo = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").attr("plcno");
			json.value = autoYn;
			array.push(json);
			
			if(autoYn == "1") 	// 수동일 경우에만
			{
				// 운전/정지
				var value = "";
				if($(id+" #runYn").hasClass("on")) {			// 운전
					value = "1";
				} else if($(id+" #runYn").hasClass("off")) {	// 정지
					value = "0";
				} else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
				}
				json = new Object();
				json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_run_yn 태그아이디가 존재하지 않습니다!");
				}
				if(plcNo != $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").attr("plcno")) {
					checkValidationYn = false;
					alert("동시에 두개 plc를 제어할 수 없습니다!");
				}
				json.value = value;
				array.push(json);
				
				// 주간
				value = "0";
				if($(id+" input[id=dayYn]:checked").is(":checked")) {
					value = "1";
				}
				json = new Object();
				json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_day_yn]").attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_day_yn 태그아이디가 존재하지 않습니다!");
				}
				if(plcNo != $("#tagForm input[class="+templateId+"_"+groupId+"_day_yn]").attr("plcno")) {
					checkValidationYn = false;
					alert("동시에 두개 plc를 제어할 수 없습니다!");
				}
				json.value = value;
				array.push(json);
				
				// 야간
				value = "0";
				if($(id+" input[id=nightYn]:checked").is(":checked")) {
					value = "1";
				}
				json = new Object();
				json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_night_yn]").attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_night_yn 태그아이디가 존재하지 않습니다!");
				}
				if(plcNo != $("#tagForm input[class="+templateId+"_"+groupId+"_night_yn]").attr("plcno")) {
					checkValidationYn = false;
					alert("동시에 두개 plc를 제어할 수 없습니다!");
				}
				json.value = value;
				array.push(json);				
			}
			
			break;
			
			
		// 축냉완료 > 축열량 설정
		case '#layerPop_type10':
			checkValidationYn = true;
			var classObject = null;
			var value = "";
			
			if($("#storagetank_use_set").hasClass("on")) {
				value = "1";
			} else if($("#storagetank_use_set").hasClass("off")) {
				value = "0";
			} else {
				checkValidationYn = false;
				alert("오류입니다. 개발사에 문의하시기 바랍니다!");
			}
			var json = new Object();
			classObject = $("#tagForm input[class="+templateId+"_storagetank_use_set]");
			json.tagId = classObject.attr("id");
			if (json.tagId == null) {
				checkValidationYn = false;
				alert(templateId+"_storagetank_use_set 태그아이디가 존재하지 않습니다!");
			}
			plcNo = classObject.attr("plcno");
			json.value = value;
			array.push(json);
			
			json = new Object();
			classObject = $("#tagForm input[class="+templateId+"_storagetank_set]");
			json.tagId = classObject.attr("id");
			if (json.tagId == null) {
				checkValidationYn = false;
				alert(templateId+"_storagetank_set 태그아이디가 존재하지 않습니다!");
			}
			if(plcNo != classObject.attr("plcno")) {
				checkValidationYn = false;
				alert("동시에 두개 plc를 제어할 수 없습니다!");
			}
			json.value = $(id+" input[name=storagetank_set]").val();
			array.push(json);
			
			break;	
			
			
		// 자동/수동, 열림/닫힘
		case '#layerPop_type11':
			checkValidationYn = true;
			var classObject = null;
			
			var json = new Object();
			// '자동/수동' 값 저장
			classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]");
			var autoYn = $(id+" input:radio[name=autoYn]:checked").val();		// 1:수동   0:자동
			json.tagId = classObject.attr("id");
			if (json.tagId == null) {
				checkValidationYn = false;
				alert(templateId+"_"+groupId+"_auto_yn 태그아이디가 존재하지 않습니다!");
			}
			plcNo = classObject.attr("plcno");		// 제어 PLC번호
			json.value = autoYn;
			array.push(json);
			
			// 수동일 경우에만 '열림/닫힘'값 저장
			if(autoYn == 1) {
				if(!$(id+" #openYn").hasClass("disabled")) {
					var openYn = "";
					if($(id+" #openYn").hasClass("on")) {			// 열림
						openYn = "1";
					} else if($(id+" #openYn").hasClass("off")) {	// 닫힘
						openYn = "0";
					} else {
						checkValidationYn = false;
						alert("오류입니다. 개발사에 문의하시기 바랍니다!");
						break;
					}
					
					json = new Object();
					classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_open_yn]");
					// '자동/수동'와 '기동/정지'의 PLC번호가 틀릴 경우 에러
					if(plcNo != classObject.attr("plcno")) {
						checkValidationYn = false;
						alert("동시에 두개 plc를 제어할 수 없습니다!");
						break;
					}
					json.tagId = classObject.attr("id");
					if (json.tagId == null) {
						checkValidationYn = false;
						alert(templateId+"_"+groupId+"_open_yn 태그아이디가 존재하지 않습니다!");
					}
					json.value = openYn;	
					array.push(json);
				} else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
					break;
				}
			}
			break;
			
			
		// 자동/수동, 운전/정지, 수동설정값
		case '#layerPop_type13':	
			checkValidationYn = true;
			var classObject = null;
			
			var textId = $(id+" #nonAutoOutput").val();
			var json = new Object();
			var autoYn = $(id+" input:radio[name=autoYn]:checked").val();
			classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]");
			json.tagId = classObject.attr("id");
			if (json.tagId == null) {
				checkValidationYn = false;
				alert(templateId+"_"+groupId+"_auto_yn 태그아이디가 존재하지 않습니다!");
			}
			plcNo = classObject.attr("plcno");		// 제어 PLC번호
			json.value = autoYn;
			array.push(json);
			
			// 수동일 경우에만 '운전/정지','설정값' 값 저장
			if(autoYn == 1) {
				if(!$(id+" #runYn").hasClass("disabled")) {
					// 운전/정지					
					var runYn = "";
					if($(id+" #runYn").hasClass("on")) {
						runYn = "1";
					} else if($(id+" #runYn").hasClass("off")) {
						runYn = "0";
					} else {
						checkValidationYn = false;
						alert("오류입니다. 개발사에 문의하시기 바랍니다!");
						break;
					}
					json = new Object();
					classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]");
					// '자동/수동'와 '기동/정지'의 PLC번호가 틀릴 경우 에러
					if(plcNo != classObject.attr("plcno")) {
						checkValidationYn = false;
						alert("동시에 두개 plc를 제어할 수 없습니다!");
						break;
					}
					json.tagId = classObject.attr("id");
					if (json.tagId == null) {
						checkValidationYn = false;
						alert(templateId+"_"+groupId+"_run_yn 태그아이디가 존재하지 않습니다!");
					}
					json.value = runYn;
					array.push(json);
					// 설정값
					if(isEmpty(textId)) {
						checkValidationYn = false;
						alert("수동 설정값을 입력해주세요.");
						break;
					}
					if(checkOutputValidation(id, textId)) {
						json = new Object();
						classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_non_auto_output]");
						// '자동/수동'와 '설정값'의 PLC번호가 틀릴 경우 에러
						if(plcNo != classObject.attr("plcno")) {
							checkValidationYn = false;
							alert("동시에 두개 plc를 제어할 수 없습니다!");
							break;
						}
						json.tagId = classObject.attr("id");
						if (json.tagId == null) {
							checkValidationYn = false;
							alert(templateId+"_"+groupId+"_non_auto_output 태그아이디가 존재하지 않습니다!");
						}
						json.value = $(id+" input[name=nonAutoOutput]").val();
						array.push(json);
					} else {
						checkValidationYn = false;
						alert("입력 범위가 올바르지 않습니다.");
						break;
					}
				}  else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
					break;
				}
			}
			break;
			
		// (경부선) 자동/수동, 운전/정지, 주간/야간(한개의 태그,0:주간,1:야간)		
		case '#layerPop_type30':
			checkValidationYn = true;
			
			var json = new Object();
			var autoYn = $(id+" input:radio[name=autoYn]:checked").val();
			json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").attr("id");
			plcNo = $("#tagForm input[class="+templateId+"_"+groupId+"_auto_yn]").attr("plcno");
			json.value = autoYn;
			array.push(json);
			
			if(autoYn == "1") 	// 수동일 경우에만
			{
				// 운전/정지
				var value = "";
				if($(id+" #runYn").hasClass("on")) {			// 운전
					value = "1";
				} else if($(id+" #runYn").hasClass("off")) {	// 정지
					value = "0";
				} else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
				}
				json = new Object();
				json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_run_yn 태그아이디가 존재하지 않습니다!");
				}
				if(plcNo != $("#tagForm input[class="+templateId+"_"+groupId+"_run_yn]").attr("plcno")) {
					checkValidationYn = false;
					alert("동시에 두개 plc를 제어할 수 없습니다!");
				}
				json.value = value;
				array.push(json);
				
				// 주간/야간 (0:주간 1:야간)
				value = "";  
				if($(id+" input[id=nightYn]:checked").is(":checked")) {
					value = "1"; // 야간기동
				} else if($(id+" input[id=dayYn]:checked").is(":checked")) {
					value = "0"; // 주간기동
				} else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
				}
				json = new Object();
				json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_day_yn]").attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_day_yn 태그아이디가 존재하지 않습니다!");
				}
				if(plcNo != $("#tagForm input[class="+templateId+"_"+groupId+"_day_yn]").attr("plcno")) {
					checkValidationYn = false;
					alert("동시에 두개 plc를 제어할 수 없습니다!");
				}
				json.value = value;
				array.push(json);
							
			}
			
			break;
			
		// (경부선) 흡수식냉온수기 냉/온수선택
		case '#layerPop_type31' :
			checkValidationYn = true;
			var classObject = null;
			
			var json = new Object();
			if(groupId.endsWith("_coolhotwater")) {
				classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_heat_yn]");
				json.tagId = classObject.attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_heat_yn 태그아이디가 존재하지 않습니다!");
				}
			}
			plcNo = classObject.attr("plcno");		// 제어 PLC번호
			var useYn = $(id+" input:radio[name=useYn]:checked").val();
			json.value = useYn;
			array.push(json);
			break;
			

			// (경부선 교번선택, 교번선택[0:해제/수동,1:선택/자동], 순번선택[0:1호기, 1:2호기])
		case '#layerPop_type32':	
			checkValidationYn = true;
			var classObject = null;
			
			var json = new Object();
			var autoYn = $(id+" input:radio[name=shift]:checked").val();
			classObject = $("#tagForm input[class="+templateId+"_"+groupId+"_shift]");
			json.tagId = classObject.attr("id");
			if (json.tagId == null) {
				checkValidationYn = false;
				alert(templateId+"_"+groupId+"_auto_yn 태그아이디가 존재하지 않습니다!");
			}
			plcNo = classObject.attr("plcno");		// 제어 PLC번호
			json.value = autoYn;
			array.push(json);
			
			// 수동일 경우에만 '순번선택' 값 저장
			if(autoYn == 0) {
				value = "";  
				if($(id+" input[id=unit1]:checked").is(":checked")) {
					value = "0"; // 1호기
				} else if($(id+" input[id=unit2]:checked").is(":checked")) {
					value = "1"; // 2호기
				} else {
					checkValidationYn = false;
					alert("오류입니다. 개발사에 문의하시기 바랍니다!");
				}
				json = new Object();
				json.tagId = $("#tagForm input[class="+templateId+"_"+groupId+"_turn]").attr("id");
				if (json.tagId == null) {
					checkValidationYn = false;
					alert(templateId+"_"+groupId+"_day_yn 태그아이디가 존재하지 않습니다!");
				}
				if(plcNo != $("#tagForm input[class="+templateId+"_"+groupId+"_turn]").attr("plcno")) {
					checkValidationYn = false;
					alert("동시에 두개 plc를 제어할 수 없습니다!");
				}
				json.value = value;
				array.push(json);
			}
			break;
			
		}
		
		
		if(checkValidationYn) {
			var request = new Object();
			request.siteCd = $("#siteCd").val();
			request.plcNo = plcNo;
			request.tagList = array;
			if(array.length > 0) {
				console.log("siteCd:"+$("#siteCd").val());
				console.log("plcNo:"+plcNo);
				console.log(array.length, array);
				updateTagValue(request);
			}
		}
		
	}
	
	
	// 설정값 validation 
	function checkOutputValidation(id, textId) {
		var min = parseFloat($(id+" #minValue").text());
		var max = parseFloat($(id+" #maxValue").text());
		if(min > parseFloat(textId)) {
			return false;
		}
		if(max < parseFloat(textId)) {
			return false;
		}
		
		// 소수점2자리 실수 체크
		var pattern =  /^[-]?\d+(?:[.]?[\d]?[\d])?$/;
		return pattern.test(textId);
	}
	
</script>
<input type="hidden" name="groupId" />
<input type="hidden" name="templateId" />
<input type="hidden" name="layerId" />
<!-- s : popup container -->
<div class="popup_container type2" id="layerPop_type1">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2><a class="pop_btn btn_popup_header" href="javascript:goTrend();">트랜드보기</a></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="50%" />
								<col width="50%" />
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2"><input type="radio" id="autoY_1" name="autoYn" value="0" /><label for="autoY_1">자동</label></th>
								</tr>
								<tr>
									<th><input type="radio" id="autoN_1" name="autoYn" value="1" /><label for="autoN_1">수동</label></th>
									<td>
										<div class="switch" id="runYn">
											<span class="stop">정지</span>
											<span class="start">운전</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type1');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type2">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="40%" />
								<col width="60%" />
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2"><input type="radio" id="autoY_2" name="autoYn" value="0" /><label for="autoY_2">자동</label></th>
								</tr>
								<tr>
									<th rowspan="2" class="row"><input type="radio" id="autoN_2" name="autoYn" value="1" /><label for="autoN_2">수동</label></th>
									<td class="tit">설정값</td>
								</tr>
								<tr>
									<td>
										<input type="text" class="inputTxt" id="nonAutoOutput" name="nonAutoOutput" >
										<p class="textL mt5">ㆍ입력최소값 : <span id="minValue"></span></p>
										<p class="textL">ㆍ입력최대값 : <span id="maxValue"></span></p>
									</td>
								</tr>									
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type2');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<div class="popup_container type2" id="layerPop_type3">
	<div class="popup_inner">
		<div class="popup_header"><h2>설정값</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 	
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th>설정값 입력</th>
								</tr>
								<tr>
									<td>
										<input type="text" class="inputTxt" id="output" name="output" >
									</td>
								</tr>
								<tr>
									<td class="textL">
										<p class="textL mt5">ㆍ입력최소값 : <span id="minValue"></span></p>
										<p class="textL">ㆍ입력최대값 : <span id="maxValue"></span></p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type3');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type4">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="50%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<td><input type="radio" id="useY" name="useYn" value="1" /><label for="useY">사용</label></td>
									<td><input type="radio" id="useN" name="useYn" value="0" /><label for="useN">미사용</label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type4');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type5">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 냉동기직기동</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>병렬시 압축기 #1</th>
									<td>
										<div class="switch" id="fridge1_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>병렬시 압축기 #2</th>
									<td>
										<div class="switch" id="fridge2_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>병렬시 압축기 #3</th>
									<td>
										<div class="switch" id="fridge3_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type5');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type6">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 축열조 설정</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>축열량 강제 0%</th>
									<td>
										<div class="switch" id="heatstorage_0_per">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>축열량 강제 100%</th>
									<td>
										<div class="switch" id="heatstorage_100_per">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type6');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type7">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2><a class="pop_btn btn_popup_header" href="javascript:goTrend();">트랜드보기</a></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="50%" />
								<col width="50%" />
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2"><input type="radio" id="autoY_7" name="autoYn" value="0" /><label for="autoY_7">자동</label></th>
								</tr>
								<tr>
									<th><input type="radio" id="autoN_7" name="autoYn" value="1" /><label for="autoN_7">수동</label></th>
									<td>
										<div class="switch" id="runYn">
											<span class="stop">정지</span>
											<span class="start">운전</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<input type="checkbox" id="dayYn" name="dayYn" /><label for="dayYn">주간</label>
									</th>
									<th>
										<input type="checkbox" id="nightYn" name="nightYn" /><label for="nightYn">야간</label>
									</th>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type7');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>




<div class="popup_container type2" id="layerPop_type8">
	<div class="popup_inner">
		<div class="popup_header"><h2>냉수 누적 열량</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉수 #1 누적열량</th>
									<td>
										<div class="switch" id="coolwater1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉수 #2 누적열량</th>
									<td>
										<div class="switch" id="coolwater2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉수 #3 누적열량</th>
									<td>
										<div class="switch" id="coolwater3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type8');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

<div class="popup_container type2" id="layerPop_type9">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 가동시간 리셋</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉동기 #1 가동시간</th>
									<td>
										<div class="switch" id="fridge1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉동기 #2 가동시간</th>
									<td>
										<div class="switch" id="fridge2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉동기 #3 가동시간</th>
									<td>
										<div class="switch" id="fridge3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>브라인 #1 가동시간</th>
									<td>
										<div class="switch" id="brinepump1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>브라인 #2 가동시간</th>
									<td>
										<div class="switch" id="brinepump2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>브라인 #3 가동시간</th>
									<td>
										<div class="switch" id="brinepump3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type9');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>		

<div class="popup_container type2" id="layerPop_type10">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 축열량 설정</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="60%" />
								<col width="40%" />
							</colgroup>
							<tbody>
								<tr>
									<th>축열량 설정값</th>
									<td>
										<input type="text" id="storagetank_set" name="storagetank_set" />
									</td>
								</tr>
								<tr>
									<th>축열량 설정</th>
									<td>
										<div class="switch" id="storagetank_use_set">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type10');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type11">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2><a class="pop_btn btn_popup_header" href="javascript:goTrend();">트랜드보기</a></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="50%" />
								<col width="50%" />
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2"><input type="radio" id="autoY_11" name="autoYn" value="0" /><label for="autoY_11">자동</label></th>
								</tr>
								<tr>
									<th><input type="radio" id="autoN_11" name="autoYn" value="1" /><label for="autoN_11">수동</label></th>
									<td>
										<div class="switch" id="openYn">
											<span class="stop">닫힘</span>
											<span class="start">열림</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type11');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type12">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 냉동기직기동</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="60%" />
								<col width="40%" />
							</colgroup>
							<tbody>
								<tr>
									<th>병렬시 압축기 #1</th>
									<td>
										<div class="switch" id="fridge1_compressor_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>병렬시 압축기 #2</th>
									<td>
										<div class="switch" id="fridge2_compressor_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type12');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type13">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2><a class="pop_btn btn_popup_header" href="javascript:goTrend();">트랜드보기</a></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="40%" />
								<col width="60%" />
							</colgroup>
							<tbody>
								<tr>
									<th><input type="radio" id="autoY_13" name="autoYn" value="0" /><label for="autoY_13">자동</label></th>
									<td>
										<div class="switch" id="runYn">
											<span class="stop">정지</span>
											<span class="start">운전</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th rowspan="2" class="row"><input type="radio" id="autoN_13" name="autoYn" value="1" /><label for="autoN_13">수동</label></th>
									<td class="tit">설정값   :   <input type="text" class="inputTxt" id="nonAutoOutput" name="nonAutoOutput" style="width:120px"></td>
								</tr>
								<tr>
									<td>
										<p class="textL mt5">ㆍ입력최소값 : <span id="minValue"></span></p>
										<p class="textL">ㆍ입력최대값 : <span id="maxValue"></span></p>
									</td>
								</tr>									
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type13');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type14">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 열량리셋</h2></div>
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉수#1 누적열량</th>
									<td>
										<div class="switch" id="coolwater1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉수#2 누적열량</th>
									<td>
										<div class="switch" id="coolwater2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉수#3 누적열량</th>
									<td>
										<div class="switch" id="coolwater3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>흡수식#1 누적열량</th>
									<td>
										<div class="switch" id="absorb1_accum_heat_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>흡수식#2 누적열량</th>
									<td>
										<div class="switch" id="absorb2_accum_heat_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>흡수식#3 누적열량</th>
									<td>
										<div class="switch" id="absorb3_accum_heat_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>흡수식#4 누적열량</th>
									<td>
										<div class="switch" id="absorb4_accum_heat_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>흡수식#5 누적열량</th>
									<td>
										<div class="switch" id="absorb5_accum_heat_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type14');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type3" id="layerPop_type15">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 가동시간리셋</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉동#1 가동시간</th>
									<td>
										<div class="switch" id="fridge1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
									<th>흡수식#1 가동시간</th>
									<td>
										<div class="switch" id="absorb1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉동#2 가동시간</th>
									<td>
										<div class="switch" id="fridge2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
									<th>흡수식#2 가동시간</th>
									<td>
										<div class="switch" id="absorb2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉동#3 가동시간</th>
									<td>
										<div class="switch" id="fridge3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
									<th>흡수식#3 가동시간</th>
									<td>
										<div class="switch" id="absorb3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>브라인#1 가동시간</th>
									<td>
										<div class="switch" id="brinepump1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
									<th>흡수식#4 가동시간</th>
									<td>
										<div class="switch" id="absorb4_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>브라인#2 가동시간</th>
									<td>
										<div class="switch" id="brinepump2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
									<th>흡수식#5 가동시간</th>
									<td>
										<div class="switch" id="absorb5_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>브라인#3 가동시간</th>
									<td>
										<div class="switch" id="brinepump3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
									<th></th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type15');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


<div class="popup_container type2" id="layerPop_type16">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 냉동기직기동</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>병렬시 압축기 #1</th>
									<td>
										<div class="switch" id="fridge1_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>병렬시 압축기 #2</th>
									<td>
										<div class="switch" id="fridge2_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>병렬시 압축기 #3</th>
									<td>
										<div class="switch" id="fridge3_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>병렬시 압축기 #4</th>
									<td>
										<div class="switch" id="fridge4_run">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type16');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


<div class="popup_container type2" id="layerPop_type17">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 열량리셋</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>축냉 누적열량</th>
									<td>
										<div class="switch" id="storagetank_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>방냉 누적열량</th>
									<td>
										<div class="switch" id="icestorage_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type17');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

<div class="popup_container type2" id="layerPop_type18">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 가동시간 리셋</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉동기 #1 가동시간</th>
									<td>
										<div class="switch" id="fridge1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉동기 #2 가동시간</th>
									<td>
										<div class="switch" id="fridge2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉동기 #3 가동시간</th>
									<td>
										<div class="switch" id="fridge3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉동기 #4 가동시간</th>
									<td>
										<div class="switch" id="fridge4_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>방냉펌프 #1 가동시간</th>
									<td>
										<div class="switch" id="icestoragepump1_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>방냉펌프 #2 가동시간</th>
									<td>
										<div class="switch" id="icestoragepump2_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>방냉펌프 #3 가동시간</th>
									<td>
										<div class="switch" id="icestoragepump3_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>방냉펌프 #4 가동시간</th>
									<td>
										<div class="switch" id="icestoragepump4_accum_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type18');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

<div class="popup_container type2" id="layerPop_type19">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 흡수식냉온수기 열량리셋</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>흡수식 #1 누적열량</th>
									<td>
										<div class="switch" id="absorb1_accum_cal_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>흡수식 #2 누적열량</th>
									<td>
										<div class="switch" id="absorb2_accum_cal_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type19');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

<div class="popup_container type2" id="layerPop_type20">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 흡수식냉온수기 가동시간 리셋</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>흡수식 #1 가동시간</th>
									<td>
										<div class="switch" id="absorb1_accum_time_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>흡수식 #2 가동시간</th>
									<td>
										<div class="switch" id="absorb2_accum_time_reset">
											<span class="stop">OFF</span>
											<span class="start">ON</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type20');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

<div class="popup_container type2" id="layerPop_type21">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 냉각수운전 선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>메인</th>
									<td>
										<div class="switch" id="coolpump_work_main">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>예비</th>
									<td>
										<div class="switch" id="coolpump_work_pre">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type21');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type22">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 축냉운전 선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>메인</th>
									<td>
										<div class="switch" id="storagetankpump_work_main">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>예비</th>
									<td>
										<div class="switch" id="storagetankpump_work_pre">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type22');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type23">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 방냉운전 선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>메인</th>
									<td>
										<div class="switch" id="icestoragepump_work_main">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>예비</th>
									<td>
										<div class="switch" id="icestoragepump_work_pre">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type23');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type24">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 냉수운전 선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>메인</th>
									<td>
										<div class="switch" id="coolwaterpump_work_main">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>예비</th>
									<td>
										<div class="switch" id="coolwaterpump_work_pre">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type24');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 2018.05.08 추가 -->
<div class="popup_container type2" id="layerPop_type25">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 상온냉각수 예비선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉각수펌프 예비선택</th>
									<td>
										<div class="switch" id="coolpump3_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type25');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type26">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 빙축열냉각수 예비선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉각수펌프1 예비선택</th>
									<td>
										<div class="switch" id="coolpump1_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉각수펌프2 예비선택</th>
									<td>
										<div class="switch" id="coolpump2_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type26');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type27">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 브라인 예비선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>브라인펌프1 예비선택</th>
									<td>
										<div class="switch" id="brinepump1_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>브라인펌프2 예비선택</th>
									<td>
										<div class="switch" id="brinepump2_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type27');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type28">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 빙축열냉수 예비선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>냉수펌프1 예비선택</th>
									<td>
										<div class="switch" id="coolwaterpump1_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>냉수펌프2 예비선택</th>
									<td>
										<div class="switch" id="coolwaterpump2_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type28');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type29">
	<div class="popup_inner">
		<div class="popup_header"><h2>${sessionScope.SITE_INFO.siteName} 상온냉수 예비선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="*" />
								<col width="70px" />
							</colgroup>
							<tbody>
								<tr>
									<th>상온냉수펌프 예비선택</th>
									<td>
										<div class="switch" id="coolwaterpump3_sb_select">
											<span class="stop">미사용</span>
											<span class="start">사용</span>
											<em></em>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type29');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 경부선 냉동기 -->
<div class="popup_container type2" id="layerPop_type30">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2><a class="pop_btn btn_popup_header" href="javascript:goTrend();">트랜드보기</a></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="50%" />
								<col width="50%" />
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2"><input type="radio" id="autoY_7" name="autoYn" value="0" /><label for="autoY_7">자동</label></th>
								</tr>
								<tr>
									<th><input type="radio" id="autoN_7" name="autoYn" value="1" /><label for="autoN_7">수동</label></th>
									<td>
										<div class="switch" id="runYn">
											<span class="stop">정지</span>
											<span class="start">운전</span>
											<em></em>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<input type="checkbox" id="dayYn" name="dayYn" /><label for="dayYn">주간</label>
									</th>
									<th>
										<input type="checkbox" id="nightYn" name="nightYn" /><label for="nightYn">야간</label>
									</th>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type30');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="popup_container type2" id="layerPop_type31">
	<div class="popup_inner">
		<div class="popup_header"><h2>설비명</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="50%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<td><input type="radio" id="useY" name="useYn" value="1" /><label for="useY">난방</label></td>
									<td><input type="radio" id="useN" name="useYn" value="0" /><label for="useN">냉방</label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type31');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- 경부선 교번선택 -->
<div class="popup_container type2" id="layerPop_type32">
	<div class="popup_inner">
		<div class="popup_header"><h2>교번선택</h2></div> 
		<div class="popup_body">
			<div class="popup_content">
 			 			
				<div class="main_content">
				
					<!-- s: table wrap-->
					<div>
						<table class="pop_row">
							<colgroup>
								<col width="50%" />
								<col width="50%" />
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2"><input type="radio" id="shift" name="shift" value="1" /><label for="shift">자동</label></th>
								</tr>
								<tr>
									<th><input type="radio" id="shift" name="shift" value="0" /><label for="shift">수동 (첫순번선택)</label></th>
									<td>
										<input type="checkbox" id="unit1" name="unit1" /><label for="unit1">1호기</label>
										<input type="checkbox" id="unit2" name="unit2" /><label for="unit2">2호기</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- s: btn wrap 가운데 정렬-->
					<div class="pop_btn_wrap">
						
						<a class="pop_btn btn_type02" href="javascript:updateTagValueSetting('#layerPop_type32');">실행</a>
						<a class="pop_btn btn_type01 closePop" href="#">닫기</a>
						
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- 알림팝업 -->
<div id="layerPop2" class="alertPop">
	<dl>
		<dt><strong>기본스타일</strong></dt>
		<dd>
			<p class="textC">입력범위가 올바르지 않습니다.</p>
		
	<div class="pop_btn_wrap">
		<a class="pop_btn btn_type02" href="#">확인</a>
	</div>
		</dd>
	</dl>
	<a href="" class="closePop2"><span class="blind">닫기</span></a>
</div>
<!--// 알림팝업 -->


<!-- 시작시 팝업 -->
<div id="startPop" class="alertPop">
	<dl>
		<dt><strong>Full Screen</strong></dt>
		<dd>
			<p class="textC">Full Screen 모드로 전환됩니다.</p>
			<div class="pop_btn_wrap">
				<a class="pop_btn btn_type02" href="#">확인</a>
			</div>
		</dd>
	</dl>
</div>
<!--// 시작시팝업 -->