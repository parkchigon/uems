$(document).ready(function() {
	$.fn_modal_ready();
	$.fn_lnb_ready();

	$('.popup_container').hide();
	
	$('#mask').click(function () {
		$(this).fadeOut(500);
		$('.popup_container').hide();
		$('#lnb').removeClass('on').addClass('off');
	});
});

$.fn_lnb_ready = function(){
	/* s:lnb*/
	$('a.btn_menu').click(function(e) {
		e.preventDefault();
		
		var maskHeight = $(window).height();
		var maskWidth = $(document).width();
		
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		
		$('#mask').fadeTo("fast", 0.7);
		
		$('#lnb').removeClass('off').addClass('on');
		
		if ($('#lnb').hasClass('on')) {
			$('body').removeClass('scroll_on').addClass('scroll_off');
		};
		
		/* s:팝업시 body스크롤 방지 */
		var winH = $(window).height();
		$("#container").css('height', winH - 45);
		$("#content_area").css('overflow', 'hidden');
		/* e:팝업시 body스크롤 방지 */

		
		$('.btn_lnb_close').click(function (e) {
			e.preventDefault();

			$('#mask').fadeOut(500);
			$('#lnb').removeClass('on').addClass('off');
			$('body').removeClass('scroll_off').addClass('scroll_on');
			
			/* s:팝업시 body스크롤 방지 */
			$("#container").css('height', 'calc(100% - 45px)');
			$("#content_area").css('overflow', 'auto');
			/* e:팝업시 body스크롤 방지 */
		});
		
	});
};

var scrollT;

$.fn_modal_ready = function(){
	/* s:모달팝업*/
	$('a[name=modal]').click(function(e) {
		e.preventDefault();

		var id = $(this).attr('href');

		var maskHeight = $(window).height();
		var maskWidth = $(document).width();

		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(200);
		$('#mask').fadeTo("fast", 0.7);

		var winH = $(window).height();
		var winW = $(window).width();
		scrollT = $(window).scrollTop();

		//$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);
		
		$(id).find(".popup_content").css('height', winH - 75);
		
		/* s:팝업시 body스크롤 방지 */
		$("#container").css('height', winH - 45);
		$("#content_area").css('overflow', 'hidden');
		//alert("높이 : " + scrollT)
		/* e:팝업시 body스크롤 방지 */
		
		$(".popup_container").hide();
		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
	});

	$('.closePop').click(function (e) {
		e.preventDefault();

		$('#mask').hide();
		$('.popup_container').hide();
		
		/* s:팝업시 body스크롤 방지 */
		$("#container").css('height', 'calc(100% - 45px)');
		$("#container").css('overflow', 'auto');
		$("#content_area").css('overflow', 'auto');
		$(window).scrollTop(scrollT);
		//alert("높이 : " + scrollT)
		/* e:팝업시 body스크롤 방지 */
	});
	/* e:모달팝업*/
	
};

