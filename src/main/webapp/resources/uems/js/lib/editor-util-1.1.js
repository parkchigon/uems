var EditorConference = EditorConference || {};

EditorConference = (function() {
	
	var app = {} , editor = {};	
	
	app.init = function(id) {
		editor = $('#'+id).ckeditor().editor;
	};
	
	app.init = function(id, config) {
		editor = $('#'+id).ckeditor().editor;
		editor.config.customConfig = config;
	};

	app.updateElement = function(id) {
		editor = editor.updateElement();
	};
	
	app.getData = function(){
		return editor.getData();
	};
	
	app.setData = function(val){
		return editor.setData(val);
	};
	
	app.setImage = function(imgPath ,id , serviceTp){
		var contentData = app.getData();
		
		if(serviceTp == "local"){
			contentData = contentData + "<img src='/uems/common/attachfile/fileDown.do?fileId=" + id + "' id="+id+">";	
		}else{
			//imageLoad 로 변경 로컬을 제외한
			contentData = contentData + "<img src='"+imgPath+"' id="+id+">";	
		}
		app.setData(contentData);
	};	
	
	
	app.fileremove = function(id, attp ,fileGroup){
		var targetNm = $(attp+'[target='+fileGroup+']');
 		$('div[id='+id+']').fadeOut('fast', function() { 
			var fileval = $('input[class='+id+']').val().split('*');
			if(fileval[0]=='upd'){
				$('input[class='+id+']').val('del*'+fileval[1]);
				$('input[class='+id+']').attr('grp','del');
			}else{
				$("#" + id).remove();
				if(targetNm.find('div').size()==0){
					targetNm.empty();
				}					
			}
		});
	};
	
	return app;
	
})();