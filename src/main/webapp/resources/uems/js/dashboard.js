function goIntegration() {
	var option = 'height=' + screen.height + ',width=' + screen.width + ',top=0, left=0, scrollbars=no, location=no, resizable=yes, status=no, fullscreen=yes';
	var url = "/uems/integration/main.do";
	var popup = window.open(url, 'integrationPopup', option);
	popup.moveTo(0,0);
	popup.focus();
}

//막대그래프 차트 ajax
function callAjax(year, type, siteId){
	var url = "/uems/main/select"+type+"Ajax.do";
	var titleText, yTitle, container, unit, html="", chartUnit="";
	var category, dataObj;
	var xUnit = '월';
	//총계
	if(type == 'CoolCharge'){
		titleText = '전체 냉방 사용요금';
		yTitle = '요금(';
		container = 'coolChargeChart';
		unit = '%';
	}else if(type == 'Co2Emissions'){
		titleText = '전체 CO2 배출량';
		yTitle = '배출량(';
		container = 'co2EmissionsChart';
		//unit = 'tCO²';
		unit = '';
	}else if(type == 'EnergyUsage'){
		titleText = '에너지 사용량';
		yTitle = '사용량(';
		container = 'energyUsageChart';
		//unit = 'kWh';
		unit = '';
	}else if(type == 'BranchCoolCharge'){
		titleText = '지점별 냉방 사용요금';
		yTitle = '요금(';
		container = 'branchCoolChargeChart';
		xUnit = '지점';
	}
	//지점정보
	else if(type == 'BranchTotalCoolCharge'){
		titleText = '총 냉방 사용요금';
		yTitle = '요금(';
		container = 'branchTotalCoolChargeChart';
		unit = '%';
	}else if(type == 'BranchCo2Emissions'){
		titleText = 'CO2 배출량';
		yTitle = '배출량(';
		container = 'branchCo2EmissionsChart';
		//unit = 'tCO²';
		unit = '';
	}
	
	$.ajax({
	   url: url,
	   type: "POST",
	   data: {sgId:$("select[name=sgId] option:selected").val(), year:year, siteId:siteId},
	   dataType: "json",
	   async:false
	}).done (function(data) {
	   category = data.xList;
	   dataObj = data.yList;
	   chartUnit = data.unit;
	   listCount = data.listSize;
	   $("#"+type).empty();
	   //차트별 증감표(type별로 절감비율/증감량 조회하는 값 다름)
	   if(data.reductionList != null){
		   $.each(data.reductionList, function(i, val){
			   html += '<tr>';
			   html += '	<td>' + val.xlist + '월</td>';
			   html += '	<td>';
			   if(type == 'CoolCharge' || type == 'BranchTotalCoolCharge'){
				   if(val.rate > 0){
					   html += '	<span class="font_blue">▼</span> '+val.rate;
				   }else if(val.rate < 0){
					   html += '	<span class="font_red">▲</span> '+val.rate * (-1);
				   }else{
					   html += val.rate;
				   }
			   }else{
				   html += val.diff;
			   }
			   html += 			" " + unit;
			   html += '	</td>';
			   html += '</tr>';
		   });
		   $("#"+type).append(html);
	   }
	});
	if(type == 'BranchCoolCharge'){//지점별냉방사용요금 차트에서 지점이 maxCount보다 많을 경우 x축 scrollbar SET
		var maxCount = 20;
		if (listCount>maxCount){
			var bcWidth = $("#branchCoolChargeChart").width();
			bcWidth += (listCount-maxCount)*30;
			$("#branchCoolChargeChart").css('width',bcWidth);
		}
	}
	if(type == 'EnergyUsage'){//에너지 사용량은 기온(점선그래프) 포함 이중 그래프
		Highcharts.chart(container, {
			chart: {
				type: 'column',
				height: '200'
			},
			credits: {
		        enabled: false
		    },
	        title: {
	            //text: titleText
	            style: {
                	display: 'none'
            	}
	        },
	        xAxis: {
	            categories: category,
	            title: {
	            	text: xUnit,
	                align: 'high'
	            }
	        },
	        yAxis: [
	                {
			        	min: 0,
			        	labels: {
			        		format: '{value} '+chartUnit,
			                formatter: function () {
			                    return addComma(this.value);
			                }
			             },
			            title: {
			                text: yTitle+chartUnit+')'
			            },
			            opposite: true
			        },    
	                {
			        	min: 0,
			        	labels: {
			                format: '{value} \xB0C'
			             },
			            title: {
			                text: '기온(\xB0C)'
			            },
			            plotLines: [{
			                value: 0,
			                width: 1,
			                color: '#808080'
			            }]
			        }
	        ],
	        legend: {
	        	layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        tooltip: {
	        	valueSuffix: '',
	            formatter: function() {
	            	return addComma(this.y);
	            }
	        },
	        
	        series: dataObj
	    });
	}else if(type == 'BranchCoolCharge'){//지점별냉방사용요금 차트
		Highcharts.chart(container, {
			chart: {
				type: 'column',
				height: '200'
				
			},
			credits: {
		        enabled: false
		    },
	        title: {
	            //text: titleText
	            style: {
                	display: 'none'
            	}
	        },
	        xAxis: {
	            categories: category
	        },
	        yAxis: {
	        	min: 0,
	            title: {
	                text: yTitle+chartUnit+')'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }],
	            labels: {
	                format: '{value}',
	                formatter: function () {
	                    return addComma(this.value);
	                }
	            }
	        },
	        tooltip: {
	            valueSuffix: '',
	            formatter: function() {
	            	return addComma(this.y);
	            }
	        },
	        legend: {
	        	layout: 'horizontal',
	            align: 'center',
	            verticalAlign: 'bottom',
	            borderWidth: 0
	        },
	        
	        series: dataObj
	        
	    });
	}else{
		Highcharts.chart(container, {
			chart: {
				type: 'column',
				height: '200'
				
			},
			credits: {
		        enabled: false
		    },
	        title: {
	            //text: titleText
	            style: {
                	display: 'none'
            	}
	        },
	        xAxis: {
	            categories: category,
	            title: {
	            	text: xUnit,
	                align: 'high'
	            }
	        },
	        yAxis: {
	        	min: 0,
	            title: {
	                text: yTitle+chartUnit+')'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }],
	            labels: {
	                format: '{value}',
	                formatter: function () {
	                    return addComma(this.value);
	                }
	            }
	        },
	        tooltip: {
	            valueSuffix: '',
	            formatter: function() {
	            	return addComma(this.y);
	            }
	        },
	        legend: {
	        	layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        
	        series: dataObj
	        
	    });
	}
	
	Highcharts.setOptions(Highcharts.theme);
	
}

//냉동기 축냉효율
function callChillerAjax(month, type, siteId){
	var url = "/uems/main/select"+type+"Ajax.do";
	var yTitle, unit, html="", height=200;
	var category, dataObj;
	var titleText = '냉동기 축냉 효율';
	var container = 'chillerColdstorageData';
	var xUnit = '일';
	var chillerIdx = 0;
	
	var selectChiller = document.getElementById("schChillNoCondition");
	chillerIdx = selectChiller.selectedIndex;
	if (selectChiller < 0) chillerIdx = 0;
	
	$.ajax({
		   url: url,
		   type: "POST",
		   data: {sgId:$("select[name=sgId] option:selected").val(), month:month , siteId:siteId, chillerIdx:chillerIdx},
		   dataType: "json",
		   async:false
		}).done (function(data) {
		   category = data.xList;
		   dataObj = data.yList;
		   
		   // 냉동기번호 Select박스 출력
		   var result = data.selectChillerCount;
		   selectChiller.options.length = 0;
		   for (var i=0; i<result.chillerCount; i++)
		   {
			   selectChiller.add(new Option("냉동기 "+(i+1)+"번",i),i);
		   }
		   $("select[name=schChillNoCondition] option:eq("+chillerIdx+")").attr("selected","selected");
		   
		});

		Highcharts.chart(container, {
			chart: {
				type: 'line',
				height: height
				
			},
			credits: {
		        enabled: false
		    },
	        title: {
	            //text: titleText
	            style: {
	            	display: 'none'
	        	}
	        },
	        xAxis: {
	            categories: category,
	            title: {
	            	text: xUnit,
	                align: 'high'
	            }
	        },
	        yAxis: {
	        	min: 0,
	            title: {
	                text: yTitle
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }],
	            labels: {
	                format: '{value}',
	                formatter: function () {
	                    return addComma(this.value);
	                }
	            }
	        },
	        tooltip: {
	            valueSuffix: '',
	            formatter: function() {
	            	return addComma('가동효율 : '+this.y+'%');
	            }
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        
	        plotOptions: {
	            series: {
	                connectNulls: false
	            }
	        },

	        series: dataObj
	        
	    });
		
		Highcharts.setOptions(Highcharts.theme);
}

//점선그래프 차트 ajax
function callLineAjax(year, type, siteId){
	var url = "/uems/main/select"+type+"Ajax.do";
	var titleText, yTitle, container, unit, html="", height=200;
	var category, dataObj;
	var xUnit = '월';
	if(year.length > 6){
		xUnit = '일';
	}else{
		xUnit = '월';
	}
	//지점정보
	if(type == 'MainIndicatorsData'){
		titleText = '주요 지표 데이터';
		//yTitle = '요금(천원)';
		container = 'mainIndicatorsDataChart';
		height = 207;
		//unit = '%';
	}else if(type == 'UsageChargeData'){
		titleText = '사용요금 비교 데이터';
		//yTitle = '배출량(tCO²)';
		container = 'usageChargeDataChart';
		//unit = 'tCO²';
	}
	
	$.ajax({
	   url: url,
	   type: "POST",
	   data: {sgId:$("select[name=sgId] option:selected").val(), year:year, siteId:siteId},
	   dataType: "json",
	   async:false
	}).done (function(data) {
	   category = data.xList;
	   dataObj = data.yList;
	});

	Highcharts.chart(container, {
		chart: {
			type: 'line',
			height: height
			
		},
		credits: {
	        enabled: false
	    },
        title: {
            //text: titleText
            style: {
            	display: 'none'
        	}
        },
        xAxis: {
            categories: category,
            title: {
            	text: xUnit,
                align: 'high'
            }
        },
        yAxis: {
        	min: 0,
            title: {
                text: yTitle
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }],
            labels: {
                format: '{value}',
                formatter: function () {
                    return addComma(this.value);
                }
            }
        },
        tooltip: {
            valueSuffix: '',
            formatter: function() {
            	return addComma(this.y);
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        
        plotOptions: {
            series: {
                connectNulls: false
            }
        },

        series: dataObj
        
    });
	
	Highcharts.setOptions(Highcharts.theme);
	
}


//stack 그래프 차트 ajax
function callStackAjax(month, subType, type, siteId){
	var url = "/uems/main/select"+type+"Ajax.do";
	var titleText, yTitle, container, unit, html="", height=200;
	var category, dataObj;
	var xUnit = '일';
	//지점정보
	if(type == 'MainIndicatorsData'){
		titleText = '주요 지표 데이터';
		//yTitle = '요금(천원)';
		container = 'mainIndicatorsDataChart';
		height = 207;
		//unit = '%';
	}

	$.ajax({
	   url: url,
	   type: "POST",
	   data: {sgId:$("select[name=sgId] option:selected").val(), month:month, subType:subType, siteId:siteId},
	   dataType: "json",
	   async:false
	}).done (function(data) {
	   category = data.xList;
	   dataObj = data.yList;
	});

	Highcharts.chart(container, {
		chart: {
			type: 'column',
			height: height
			
		},
		credits: {
	        enabled: false
	    },
        title: {
            //text: titleText
            style: {
            	display: 'none'
        	}
        },
        xAxis: {
            categories: category,
            title: {
            	text: xUnit,
                align: 'high'
            }
        },
        yAxis: {
        	min: 0,
            title: {
                text: yTitle
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }],
            labels: {
                format: '{value}',
                formatter: function () {
                    return addComma(this.value);
                }
            }
        },
        tooltip: {
            valueSuffix: '',
            formatter: function() {
            	return this.series.name + ' : ' + addComma(this.y) + ' USRt';
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        
        plotOptions: {
        	 column: {
                 stacking: 'normal'
             },
        	series: {
                connectNulls: false
            }
        },

        series: dataObj
        
    });
	
	Highcharts.setOptions(Highcharts.theme);
	
}

function initDatePickers() {
	
	  // datepicker Korean option
	  $.datepicker.regional['ko'] = {
	    closeText: '닫기',
	    prevText: '이전달',
	    nextText: '다음달',
	    currentText: '오늘',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    weekHeader: 'Wk',
	    dateFormat: 'yy-mm-dd',
	    firstDay: 0,
	    isRTL: false,
	    duration: 200,
	    showAnim: 'show',
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    onSelect : function(){ // 일 클릭 시 검색 
	    	var dayId = $(this).attr("id");
	    	var dayArray = $("#"+dayId).val().split('-');
	    	var day = dayArray[0]+dayArray[1]+dayArray[2];
            if(dayId == "schDate1"){		//주요 지표 데이터
            	callStackAjax($("#month").val(), $("input[name=subType]").val(),'MainIndicatorsData',$("#siteId").val());
            }else if(dayId == "schDate2"){	//사용요금 비교 데이터 --> 냉동기 축냉효율 데이터
            	callLineAjax(dayArray[1],'ChillerColdstorageData',$("#siteId").val());
            }
	    }
	  };

	  $.datepicker.setDefaults($.datepicker.regional['ko']);
	  
	  $('#schDate1').datepicker({
	    changeMonth: false,
	    changeYear: false,
	    defaultDate: $('#schDate1').val()
	  });
	  
	  $('#schDate2').datepicker({
	    changeMonth: false,
	    changeYear: false,
	    defaultDate: $('#schDate2').val()
	  });
	  
	  // monthpicker and year selector start/end year (10 year ago)
	  var currentYear = (new Date()).getFullYear();
	  var startYear = currentYear - 10;

	  var options = {
	    startYear: startYear,
	    finalYear: currentYear,
	    pattern: 'yyyy-mm',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	  };

	  $('#schMonth').monthpicker(options);
	  $('#schMonth1').monthpicker(options);
	  $('#schMonth2').monthpicker(options);
	  
	/*   // make year selector 
	  for (var i = currentYear; i >= startYear; i--) {
	    if ($("#schYear").attr("pathValue") == i) {
	      $("#schYear").append("<option value='" + i + "' selected>" + i + "</option>");
	    } else {
	      $('#schYear').append("<option value='" + i + "'>" + i + "</option>");
	    }
	  } */
	}

//지점 그룹 선택 -> 각 지점 목록 조회
function selectSiteList(sgId){
	if(isEmpty(sgId)) {
		var html = "";
		html += "<option value=''>지점선택</option>";
		
		$("select[name=siteId]").empty();
		$("select[name=siteId]").append(html);
		
	} else {
		$.ajax({
			url : "/uems/mng/user/selectSiteListAjax.do",
			type: "POST",
			data: {searchCondition : sgId},
			dataType : "json",
			async: false
		}).done( function(data) {
			var list = data.siteList;
			var html = "";
			for(var i=0; i<list.length; i++) {
				if(list[i].siteId == $("select[name=siteId]").val()) {
					html += "<option value="+list[i].siteId+" selected>" + list[i].siteName + "</option>";
				} else {
					html += "<option value="+list[i].siteId+" >" + list[i].siteName + "</option>";
				}
				if(i == 0){
					callAllAjax(list[i].siteId);
				}
			}
			
			$("select[name=siteId]").empty();
			$("select[name=siteId]").append(html);

		});
	}
}

//기간 검색 default 설정(현재 날짜)
function searchReset(year, month, day){
	
	$("select[id='month']").val(month);
	
	$("select[id='schChaMonthCondition']").val(month);
	
	$('select[id^="year"]').each(function(i){
		$("select[id='year"+i+"']").val(year);
	});
	
	$('input[id^="schMonth"]').each(function(){
		$(this).val(year+"-"+month);
	});
	
	$('input[id^="schDate"]').each(function(){
		$(this).val(year+"-"+month+"-"+day);
	});
	
	
	
}

function weatherInfo(siteId){
	$.ajax({
		url : "/uems/main/weatherInfoAjax.do",
		type: "POST",
		data: {siteId : siteId},
		dataType : "json"
	}).done( function(data) {
		var result = data.result;
		var applyClass='', time='sun', cloudyStat='';
/*		
		sun					 낮 맑음 
		sun_cloudy			 낮 구름조금 
		sun_cloudy2			 낮 구름많음 
		sun_rain			 낮 한때 비 
		
		moon				 밤 맑음 
		moon_cloudy	 		 밤 구름조금 
		moon_cloudy2  		 밤 구름많음 
		moon_rain		 	 밤 한때 비 
		
		less_rain		 	 비조금 
		less_show		 	 눈조금 
		rain				 비 
		show			 	 눈 
		rain_show	 		 비 또는 눈 
		lightning			 번개
*/
		
/*		강수형태 PTY : 없음(0) 일때
		하늘상태 SKY -> 맑음(1), 구름조금(2), 구름많음(3), 흐림(4)
		강수형태 PTY : 비(1), 비/눈(2), 눈(3)
*/
		if(result != null){
			if(result.hour < 6 && result.hour > 19){
				time = 'moon';
			}
			
			// 강수형태 : 0
			if(result.pty == '0') {
				if(result.sky == '2'){
					cloudyStat = '_cloudy';
				}else if(result.sky == '3' || result.sky == '4'){
					cloudyStat = '_cloudy2';
				}
				applyClass = time + cloudyStat;
			} else {
				if(result.pty == '1') {
					cloudyStat = 'rain';
				} else if(result.pty == '2') {
					cloudyStat = 'rain_show';
				} else if(result.pty == '3') {
					cloudyStat = 'show';
				}  
				applyClass = cloudyStat;
			}
			
			$(".weather").empty();
			$(".weather").addClass(applyClass);
			$(".weather").append("<strong>"+result.teh+"℃</strong> <em>최저기온 : "+result.tmn+"℃ / 최고기온 : "+result.tmx+"℃</em>");
			
		}

	});
	
}

var methods = {
	      init: function(options) {
	        return this.each(function() {
	          var
	            $this = $(this),
	            data = $this.data('monthpicker'),
	            year = (options && options.year) ? options.year : (new Date()).getFullYear(),
	            settings = $.extend({
	              pattern: 'mm/yyyy',
	              selectedMonth: null,
	              selectedMonthName: '',
	              selectedYear: year,
	              startYear: year - 10,
	              finalYear: year + 10,
	              monthNames: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
	              id: "monthpicker_" + (Math.random() * Math.random()).toString().replace('.', ''),
	              openOnFocus: true,
	              disabledMonths: []
	            }, options);

	          settings.dateSeparator = settings.pattern.replace(/(mmm|mm|m|yyyy|yy|y)/ig, '');

	          // If the plugin hasn't been initialized yet for this element
	          if (!data) {

	            $(this).data('monthpicker', {
	              'target': $this,
	              'settings': settings
	            });

	            if (settings.openOnFocus === true) {
	              $this.on('focus', function() {
	                $this.monthpicker('show');
	              });
	            }

	            $this.monthpicker('parseInputValue', settings);

	            $this.monthpicker('mountWidget', settings);

	            $this.on('monthpicker-click-month', function(e, month, year) {
	              $this.monthpicker('setValue', settings);
	              $this.monthpicker('hide');

	              //월 클릭 시 검색
	              var monthId = $(this).attr("id");
	              var day = settings.selectedYear + addZeros(settings.selectedMonth,2);
	              if(monthId == "schMonth"){
	            	  callAjax(day,'BranchCoolCharge');
	              }else if(monthId == "schMonth1"){		//주요 지표 데이터
	            	  callStackAjax($("#month").val(), $("input[name=subType]").val(),'MainIndicatorsData',$("#siteId").val());
	              }else if(monthId == "schMonth2"){		//사용요금 비교 데이터
	            	  callLineAjax(day,'UsageChargeData',$("#siteId").val());
	              }
	            });

	            // hide widget when user clicks elsewhere on page
	            $this.addClass("mtz-monthpicker-widgetcontainer");
	            $(document).unbind("mousedown.mtzmonthpicker").on("mousedown.mtzmonthpicker", function(e) {
	              if (!e.target.className || e.target.className.toString().indexOf('mtz-monthpicker') < 0) {
	                $(this).monthpicker('hideAll');
	              }
	            });
	          }
	        });
	      },

	      show: function() {
	        $(this).monthpicker('hideAll');
	        var widget = $('#' + this.data('monthpicker').settings.id);
	        widget.css("top", this.offset().top + this.outerHeight());
	        if ($(window).width() > (widget.width() + this.offset().left)) {
	          widget.css("left", this.offset().left);
	        } else {
	          widget.css("left", this.offset().left - widget.width());
	        }
	        widget.show();
	        widget.find('select').focus();
	        this.trigger('monthpicker-show');
	      },

	      hide: function() {
	        var widget = $('#' + this.data('monthpicker').settings.id);
	        if (widget.is(':visible')) {
	          widget.hide();
	          this.trigger('monthpicker-hide');
	        }
	      },

	      hideAll: function() {
	        $(".mtz-monthpicker-widgetcontainer").each(function() {
	          if (typeof($(this).data("monthpicker")) != "undefined") {
	            $(this).monthpicker('hide');
	          }
	        });
	      },

	      setValue: function(settings) {
	        var
	          month = settings.selectedMonth,
	          year = settings.selectedYear;
	        
	        if (settings.pattern.indexOf('mmm') >= 0) {
	          month = settings.selectedMonthName;
	        } else if (settings.pattern.indexOf('mm') >= 0 && settings.selectedMonth < 10) {
	          month = '0' + settings.selectedMonth;
	        }

	        if (settings.pattern.indexOf('yyyy') < 0) {
	          year = year.toString().substr(2, 2);
	        }

	        if (settings.pattern.indexOf('y') > settings.pattern.indexOf(settings.dateSeparator)) {
	          this.val(month + settings.dateSeparator + year);
	        } else {
	          this.val(year + settings.dateSeparator + month);
	        }

	        this.change();
	        
	      },

	      disableMonths: function(months) {
	        var
	          settings = this.data('monthpicker').settings,
	          container = $('#' + settings.id);

	        settings.disabledMonths = months;

	        container.find('.mtz-monthpicker-month').each(function() {
	          var m = parseInt($(this).data('month'));
	          if ($.inArray(m, months) >= 0) {
	            $(this).addClass('ui-state-disabled');
	          } else {
	            $(this).removeClass('ui-state-disabled');
	          }
	        });
	      },

	      mountWidget: function(settings) {
	        var
	          monthpicker = this,
	          container = $('<div id="' + settings.id + '" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" />'),
	          header = $('<div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all mtz-monthpicker" />'),
	          combo = $('<select class="mtz-monthpicker mtz-monthpicker-year" />'),
	          table = $('<table class="mtz-monthpicker" />'),
	          tbody = $('<tbody class="mtz-monthpicker" />'),
	          tr = $('<tr class="mtz-monthpicker" />'),
	          td = '',
	          selectedYear = settings.selectedYear,
	          option = null,
	          attrSelectedYear = $(this).data('selected-year'),
	          attrStartYear = $(this).data('start-year'),
	          attrFinalYear = $(this).data('final-year');

	        if (attrSelectedYear) {
	          settings.selectedYear = attrSelectedYear;
	        }

	        if (attrStartYear) {
	          settings.startYear = attrStartYear;
	        }

	        if (attrFinalYear) {
	          settings.finalYear = attrFinalYear;
	        }

	        container.css({
	          position: 'absolute',
	          zIndex: 999999,
	          whiteSpace: 'nowrap',
	          width: '250px',
	          overflow: 'hidden',
	          textAlign: 'center',
	          display: 'none',
	          top: monthpicker.offset().top + monthpicker.outerHeight(),
	          left: monthpicker.offset().left
	        });

	        combo.on('change', function() {
	          var months = $(this).parent().parent().find('td[data-month]');
	          months.removeClass('ui-state-active');
	          if ($(this).val() == settings.selectedYear) {
	            months.filter('td[data-month=' + settings.selectedMonth + ']').addClass('ui-state-active');
	          }
	          monthpicker.trigger('monthpicker-change-year', $(this).val());
	        });

	        // mount years combo
	        for (var i = settings.startYear; i <= settings.finalYear; i++) {
	          var option = $('<option class="mtz-monthpicker" />').attr('value', i).append(i);
	          if (settings.selectedYear == i) {
	            option.attr('selected', 'selected');
	          }
	          combo.append(option);
	        }
	        header.append(combo).appendTo(container);

	        // mount months table
	        for (var i = 1; i <= 12; i++) {
	          td = $('<td class="ui-state-default mtz-monthpicker mtz-monthpicker-month" style="padding:5px;cursor:default;" />').attr('data-month', i);
	          if (settings.selectedMonth == i) {
	            td.addClass('ui-state-active');
	          }
	          td.append(settings.monthNames[i - 1]);
	          tr.append(td).appendTo(tbody);
	          if (i % 3 === 0) {
	            tr = $('<tr class="mtz-monthpicker" />');
	          }
	        }

	        tbody.find('.mtz-monthpicker-month').on('click', function() {
	          var m = parseInt($(this).data('month'));
	          if ($.inArray(m, settings.disabledMonths) < 0) {
	            settings.selectedYear = $(this).closest('.ui-datepicker').find('.mtz-monthpicker-year').first().val();
	            settings.selectedMonth = $(this).data('month');
	            settings.selectedMonthName = $(this).text();
	            monthpicker.trigger('monthpicker-click-month', $(this).data('month'));
	            $(this).closest('table').find('.ui-state-active').removeClass('ui-state-active');
	            $(this).addClass('ui-state-active');
	          }
	        });

	        table.append(tbody).appendTo(container);

	        container.appendTo('body');
	      },

	      destroy: function() {
	        return this.each(function() {
	          $(this).removeClass('mtz-monthpicker-widgetcontainer').unbind('focus').removeData('monthpicker');
	        });
	      },

	      getDate: function() {
	        var settings = this.data('monthpicker').settings;
	        if (settings.selectedMonth && settings.selectedYear) {
	          return new Date(settings.selectedYear, settings.selectedMonth - 1);
	        } else {
	          return null;
	        }
	      },

	      parseInputValue: function(settings) {
	        if (this.val()) {
	          if (settings.dateSeparator) {
	            var val = this.val().toString().split(settings.dateSeparator);
	            if (settings.pattern.indexOf('m') === 0) {
	              settings.selectedMonth = val[0];
	              settings.selectedYear = val[1];
	            } else {
	              settings.selectedMonth = val[1];
	              settings.selectedYear = val[0];
	            }
	          }
	        }
	      }

	    };

$.fn.monthpicker = function(method) {
	if (methods[method]) {
	return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
	} else if (typeof method === 'object' || !method) {
	return methods.init.apply(this, arguments);
	} else {
	$.error('Method ' + method + ' does not exist on jQuery.mtz.monthpicker');
	}
};

