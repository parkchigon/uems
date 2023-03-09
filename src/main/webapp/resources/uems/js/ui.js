$(document).ready(function(){
	openTab();
	openLnb();
	lnbClose();
	openDatapicker();
	findFile();
	popLocate(".popup_container");
});
// e: document.ready

$(window).load(function(){
});


/* s: funciton
--------------------------------------------------------- */
// 날짜선택
function openDatapicker(){
	$( ".datepicker" ).datepicker({
		dateFormat: "yy-mm-dd",
		showMonthAfterYear: true,
		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'],
		dayNames : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
		//yearSuffix: ' 년 ',
		showMonthAfterYear: true,
		changeMonth: true,
	    changeYear: true,
		onClose: function() {
			if ("schStDt" == $(this).attr("id")) {
				var startDate = $("#schStDt").datepicker('getDate');
				var endDate = $("#schEdDt").datepicker('getDate');
				if (endDate != null) {
					if (startDate > endDate) {
						alert("시작일이 종료일보다 앞설 수 없습니다. \n종료일로 설정합니다.");
						$("#schStDt").val($("#schEdDt").val());
					}
				}
			} else if ("validStDt" == $(this).attr("id")) {
				var startDate = $("#validStDt").datepicker('getDate');
				var endDate = $("#validEdDt").datepicker('getDate');
				if (endDate != null) {
					if (startDate > endDate) {
						alert("시작일이 종료일보다 앞설 수 없습니다. \n종료일로 설정합니다.");
						$("#validStDt").val($("#validEdDt").val());
					}
				}
			} else if ("dispStDate" == $(this).attr("id")) {
				var startDate = $("#dispStDate").datepicker('getDate');
				var endDate = $("#dispEdDate").datepicker('getDate');
				if (endDate != null) {
					if (startDate > endDate) {
						alert("시작일이 종료일보다 앞설 수 없습니다. \n종료일로 설정합니다.");
						$("#dispStDate").val($("#dispEdDate").val());
					}
				}
			}
		},
		beforeShow: function() {
			if ("schEdDt" == $(this).attr("id")) {
				var startDate = $("#schStDt").datepicker('getDate');
				if (startDate != null) {
					$(this).datepicker('option', 'minDate', startDate);
				}
			} else if ("validEdDt" == $(this).attr("id")) {
				var startDate = $("#validStDt").datepicker('getDate');
				if (startDate != null) {
					$(this).datepicker('option', 'minDate', startDate);
				}
			} else if ("dispEdDate" == $(this).attr("id")) {
				var startDate = $("#dispStDate").datepicker('getDate');
				if (startDate != null) {
					$(this).datepicker('option', 'minDate', startDate);
				}
			}
		}
    }).prop("readonly", true);

	$(".btn_calender").click(function(){
		$(this).prev().focus();
	})
}

// Tab
function openTab(){
	var $cont = $(".tab_content .cont");
	var $tab = $(".tab_content .tab_wrap li");

	$cont.hide();
	$cont.eq(0).show();
	$tab.click(function(){
		$cont.hide();
		$cont.eq($(this).index()).show();
		$tab.removeClass("on");
		$(this).addClass("on");
		return false;
	});
}

// 파일찾기
function findFile(){
	$(".inp_fileUpload .inp_fileFind input").change(function(){
		$(this).parent().prev().val($(this).val());
	});
}

// popup
// 팝업이 항상 화면의 가운데 있도록하는 스크립트
function popLocate(target){
	var tagLength = $(target).length;
	var bodyHeight = $("body").height();
	
	for(var i=0; i<tagLength; i++){
		var popHeight = $(target).eq(i).height();
		var marginTop = -parseInt(popHeight/2);

		if(bodyHeight > popHeight){
			$(target).eq(i).css({"margin-top":marginTop+"px"});
		}else{
			$(target).eq(i).css({
				"margin-top":0,
				"top":0
			});
		}
	}
}
// 팝업 오픈
function openPop(obj){
	$(document).on("click", obj, function(event){
		$(".dimmed").show();
		$(".popup_container").show();
	});
}
// 팝업 닫기
function closePop(obj){
	$(document).on("click", obj, function(event){
		$(".dimmed").hide();
		$(".popup_container").hide();
	});
}


//LNB
function openLnb() {
	var lnbUI = {
		click : function(target, speed) {
			var _self = this, $target = $(target);
			_self.speed = speed || 300;

			$target.each(function() {
				if (findChildren($(this))) {
					return;
				}
				$(this).addClass('noDepth');
			});

			function findChildren(obj) {
				return obj.find('> ul').length > 0;
			}

			$target.on('click', 'a', function(e) {
				e.stopPropagation();
				var $this = $(this), $depthTarget = $this.next(), $siblings = $this.parent().siblings();

				$this.parent('li').find('ul li').removeClass('on');
				$siblings.removeClass('on');
				$siblings.find('ul').slideUp(250);

				if ($depthTarget.css('display') == 'none') {
					_self.activeOn($this);
					$depthTarget.slideDown(_self.speed);
				} else {
					$depthTarget.slideUp(_self.speed);
					_self.activeOff($this);
				}

			})
		},
		activeOff : function($target) {
			$target.parent().removeClass('on');
		},
		activeOn : function($target) {
			$target.parent().addClass('on');
		}
	};

	$(function() {
		lnbUI.click('#lnb li', 300)
	});
}


function lnbClose() {
	$(".btn_lnb").click(function(){
		$(".inner_content").toggleClass("on");
		$(".left_content").toggleClass("on");
		$(this).toggleClass("on");
	});
}
