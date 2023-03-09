$(document).ready(function() {
	$.fn_modal_ready();

	$('.popup_container').hide();
	
	$('#mask').click(function () {
		$(this).hide();
		$('.popup_container').hide();
	});
	

});

$(document).ready(function() {
});

$.fn_modal_ready = function(){
	/* s:모달팝업*/
	$('a[name=modal]').click(function(e) {
		e.preventDefault();

		var id = $(this).attr('href');

		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(200);
		$('#mask').fadeTo("fast", 0.7);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		$(".popup_container").hide();
		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.

	});

	$('.closePop').click(function (e) {
		e.preventDefault();

		$('#mask').hide();
		$('.popup_container').hide();
	});
	/* e:모달팝업*/
	
	/* s:알림팝업*/
	$('a[name=alert]').click(function(e) {
		e.preventDefault();

		var id = $(this).attr('href');

		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		//$(".layerPop").hide();
		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.

	});
	
	$('.closePop3').click(function (e) {
		e.preventDefault();

		$(this).parent().hide();
	});
	/* e:알림팝업*/
	
	/* s:로딩중*/
	$('a[name=loading]').click(function(e) {
		e.preventDefault();

		var id = $('.loading')

		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#loading_mask').css({'width':maskWidth,'height':maskHeight});

		$('#loading_mask').fadeIn(200);
		$('#loading_mask').fadeTo("fast", 0.9);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.

	});
	/* e:로딩중*/
	
	/* s:접속오류*/
	$('a[name=error]').click(function(e) {
		e.preventDefault();

		var id = $('.error_text')

		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#error_mask').css({'width':maskWidth,'height':maskHeight});

		$('#error_mask').fadeIn(200);
		$('#error_mask').fadeTo("fast", 0.6);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.

	});
	/* e:접속오류*/
	
};

