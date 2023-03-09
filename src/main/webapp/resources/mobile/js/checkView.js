$(document).ready(function(){
	//e.preventDefault();
	
	if($("#firstYn").val()=='Y'){
		
		var maskHeight = $(window).height();
		var maskWidth = $(document).width();
		
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		
		$('#mask').fadeTo("fast", 0.7);
		
		$('#lnb').addClass('on');
		
		if ($('#lnb').hasClass('on')) {
			$('body').removeClass('scroll_on').addClass('scroll_off');
		};
		
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
	}
});

function showPicture(msqId){

	
	var id = "#photo";

	var maskHeight = $(window).height();
	var maskWidth = $(document).width();

	$('#mask').css({'width':maskWidth,'height':maskHeight});

	$('#mask').fadeIn(200);
	$('#mask').fadeTo("fast", 0.7);

	var winH = $(window).height();
	var winW = $(window).width();
	scrollT = $(window).scrollTop();

	$(id).css('left', winW/2-$(id).width()/2);
	
	$(id).find(".popup_content").css('height', winH - 75);
	
	/* s:팝업시 body스크롤 방지 */
	$("#content_area").css('overflow', 'hidden');
	//alert("높이 : " + scrollT)
	/* e:팝업시 body스크롤 방지 */

	$(".popup_container").hide();
	$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
	
	
	searchPhotoList(msqId);
	$("#frm #msqId").val(msqId);
	$("#photo").show();
}

function searchPhotoList(msqId){
	
	var msqId = msqId;
	var msId = $("#viewForm #msId").val();
	var chkMonth = $("#viewForm #chkMonth").val();
	 
	$.ajax({
		url : "/mobileWeb/selectPhotoListAjax",
		type: "POST",
		data: {msqId:msqId, msId:msId, chkMonth:chkMonth},
		dataType : "json",
	}).done(function(data) {
		var data = data.photoList;
		var html = '';
		if(data.length > 0){
			for(var i=0; i<data.length; i++){
				html += '<li><label for="">';
				html += '<img src="'+data[i].fileUrl+'" alt="'+data[i].fileName+'" height="150" />';
				html += '</label><input type="checkbox" name="photoCheck" id="'+data[i].mfqId+'" />';
				html += '</li>';
			}
		}
		$("#photoList").empty();
		$("#photoList").append(html);
	});
}
