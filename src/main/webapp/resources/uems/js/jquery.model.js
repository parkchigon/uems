$(document).ready(function() {
	$.fn_modal_ready();

	$('.model_container').hide();
	
	$('#mask').click(function () {
		$(this).hide();
		$('.model_container').hide();
	});
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

		$(id).css('top', winH/2-$(id).height()/2+scrollTop-108);
		$(id).css('left', winW/2-$(id).width()/2-250);

		$(".model_container").hide();
		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
		
		//alert(winW/2-$(id).width()/2);

	});

	$('.closePop').click(function (e) {
		e.preventDefault();

		$('#mask').hide();
		$('.model_container').hide();
	});
	/* e:모달팝업*/
	
	
	/* s:로딩중*/
	$('a[name=loading]').click(function(e) {
		e.preventDefault();

		var id = $('.loading')

		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#loading_mask').css({'width':maskWidth,'height':maskHeight});

		$('#loading_mask').fadeIn(200);
		$('#loading_mask').fadeTo("fast", 0.1);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.

	});
	/* e:로딩중*/
	
};

