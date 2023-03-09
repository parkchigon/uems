var $jq = jQuery.noConflict();

	$jq.fn.jReplaceAll = function( obj , array){
		var returnHtml = "";
		$jq.each(array,function(key , value){
			var chglen = obj.split(key);
			var html = [] , h = 0;
			for(i=0; i<chglen.length; i++){
				html[h++] = chglen[i];
			}
			obj = html.join(value);
		});
		return obj;
	};	

/*
 * 화면을 읽어서 등록버튼을 세팅한다.
 * */
	/************************************************************************
	 * 관리자 화면 ENT_FILE_ID,ENT_FILE_NM,ENT_FILE_SIZE,ENT_FILE_GRP,FILE_TP
	 ************************************************************************/
	var updateFileAdminHtml1 		= 	'<div id="ENT_FILE_ID">' +
										'<div class="file_img"><dt>' +
										'<a href="javascript:EDITORS.setFile(\'ENT_FILE_NM\',\'ENT_FILE_ID\',\'FILE_TP\');">' +
										'<img src="/resources/uems/js/plugin/uploadify/image/FILE_TP" border="0" />ENT_FILE_NM</a>'+
										'<span calss="cancel"><a href="javascript:EDITORS.fileremove(\'ENT_FILE_ID\',\'div\',\'ENT_FILE_GRP\');">'+
										'<img src="/resources/uems/js/plugin/uploadify/btn_filedel.gif" border="0" /></a></span>' +
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N">' +
										'</div></div>';
	
	var updateFileAdminHtml2 		= 	'<div id="ENT_FILE_ID">' +
										'<div class="file_data">' +
										'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
										//'<img src="/resources/uems/js/plugin/uploadify/image/FILE_TP" border="0" />ENT_FILE_NM&nbsp;(ENT_FILE_SIZE byte)</a>'+
										'<img src="/resources/uems/js/plugin/uploadify/image/FILE_TP" border="0" />ENT_FILE_NM</a>'+
										'<span calss="cancel"><a href=\'javascript:EDITORS.fileremove("ENT_FILE_ID");\'>&nbsp;'+
										'<img src="/resources/uems/js/plugin/uploadify/btn_filedel.gif" border="0" /></a></span>' +
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N">' +
										'</div></div>';				
	
	var updateImageAdminHtml 		= 	'<div id="ENT_FILE_ID">' +
										'<dl class="file_img"><dt>' +
										'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
										'<img src="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID"  width="95" height="55"  border="0" /></a></dt>'+
										'<dd class="delete"><a href=\'javascript:fileUtil.fileremove("ENT_FILE_ID");\'>'+
										'<img src="/resources/uems/js/plugin/uploadify/btn_filedel.gif" border="0" /></a></dd>' +
										'<dd class="name" title="ENT_FILE_NM">ENT_FILE_NM</dd>'+
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N"></dl>' +
										'</div>';	
	
	
	var updateEditorAdminHtml 		= 	'<div id="ENT_FILE_ID">' +
										'<dl class="file_img"><dt>' +
										'<a href="javascript:EDITORS.setImage(\'IMG_PATH\',\'ENT_FILE_ID\',\'SERVER_TYPE\');">' +
										'<img src="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID"  width="95" height="55"  border="0" /></a></dt>'+
										'<dd class="delete"><a href="javascript:EDITORS.fileremove(\'ENT_FILE_ID\',\'div\',\'ENT_FILE_GRP\');">'+
										'<img src="/resources/uems/js/plugin/uploadify/btn_filedel.gif" border="0" /></a></dd>' +
										'<dd><a href="javascript:EDITORS.setImage(\'IMG_PATH\',\'ENT_FILE_ID\');">ENT_FILE_NM</a></dd>'+
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N"></dl>' +
										'</div>';	
	
	var updateProductImageAdminHtml  = 	'<div id="ENT_FILE_ID">' +
										'<dl class="file_img"><dt>' +
										'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
										'<img src="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID"  width="95" height="55"  border="0" /></a></dt>'+
										'<dd class="delete"><a href=\'javascript:fileUtil.fileremove("ENT_FILE_ID","div","ENT_FILE_GRP");\'>'+
										'<img src="/resources/uems/js/plugin/uploadify/btn_filedel.gif" border="0" /></a></dd>' +
										'<label for="ENT_FILE_GRP_"><input type="radio" class="productThum" name="delegateYn" refId="ENT_FILE_ID" value="ENT_FILE_ID" id="ENT_FILE_GRP_" CHECKED_YN /> 대표이미지</label>'+
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP" class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N"></dl>' +
										'</div>';	
	/***************************************************************************************************************************************************/
	
	/************************************************************************
	 * 사용자 화면 ENT_FILE_ID,ENT_FILE_NM,ENT_FILE_SIZE,ENT_FILE_GRP,FILE_TP
	 ************************************************************************/				
	var updateFileUserHtml1 		= 	'<div id="ENT_FILE_ID">' +
										'<div class="file_img"><dt>' +
										'<a href="javascript:EDITORS.setFile(\'ENT_FILE_NM\',\'ENT_FILE_ID\',\'FILE_TP\');">' +
										'<img src="/images/common/blt/FILE_TP"  alt="파일" />ENT_FILE_NM</a>'+
										'<span calss="cancel"><a class="btnFile" href="javascript:EDITORS.fileremove(\'ENT_FILE_ID\',\'div\',\'ENT_FILE_GRP\');">'+
										' 삭제</a></span>' +
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N">' +
										'</div></div>';
	
	var updateFileUserHtml2 		= 	'<div id="ENT_FILE_ID">' +
										'<div class="file_data">' +
										'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
										'<img src="/images/common/blt/FILE_TP"  alt="파일" />ENT_FILE_NM&nbsp;(ENT_FILE_SIZE byte)</a>'+
										'<span calss="cancel"><a class="btnFile" href=\'javascript:EDITORS.fileremove("ENT_FILE_ID");\'>&nbsp;'+
										' 삭제</a></span>' +
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N">' +
										'</div></div>';				

	var updateImageUserHtml 		= 	'<div id="ENT_FILE_ID">' +
										'<dl class="file_img"><dt>' +
										'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
										'<img src="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID"  width="95" height="55"  border="0" /></a></dt>'+
										'<dd class="delete"><a class="btnFile" href=\'javascript:fileUtil.fileremove("ENT_FILE_ID");\'>'+
										' 삭제</a></dd>' +
										'<dd>ENT_FILE_NM</dd>'+
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N"></dl>' +
										'</div>';		
	
	var updateEditorUserHtml 		= 	'<div id="ENT_FILE_ID">' +
										'<dl class="file_img"><dt>' +
										'<a href="javascript:EDITORS.setImage(\'IMG_PATH\',\'ENT_FILE_ID\',\'SERVER_TYPE\');">' +
										'<img src="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID"  width="95" height="55"  border="0" /></a></dt>'+
										'<dd class="delete"><a class="btnFile" href="javascript:EDITORS.fileremove(\'ENT_FILE_ID\',\'div\',\'ENT_FILE_GRP\');">'+
										' 삭제</a></dd>' +
										'<dd><a href="javascript:EDITORS.setImage(\'IMG_PATH\',\'ENT_FILE_ID\');">ENT_FILE_NM</a></dd>'+
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N"></dl>' +
										'</div>';

	var updateFileEventHtml 		= 	'<div id="ENT_FILE_ID">' +
										'<div class="file_img"><dt>' +
										'ENT_FILE_NM'+
										'<span calss="cancel"><a class="btnFile" href="javascript:EDITORS.fileremove(\'ENT_FILE_ID\',\'div\',\'ENT_FILE_GRP\');">'+
										' 삭제</a></span>' +
										'<input type="hidden" name="fileids" grp="ENT_FILE_GRP"  class="ENT_FILE_ID" value="upd*ENT_FILE_ID*N">' +
										'</div></div>';
	
$jq( document ).ready( function(){
	$jq( '.fileset' ).each( function()
	{
		var selFile     = $jq( this );
		var fileset 	= selFile.attr( 'json' );  		//파일을 설정값을 가지고 온다.
		var fileGroup 	= selFile.attr( 'id' );	   		//파일업로드 하고 적용될부분
		var uploadType 	= selFile.attr( 'uploadType' ); /* image , editor , file     */
        var designTy 	= selFile.attr( 'designTy' ); 	 //디자인 변경작업을 하면된다.
		if( selFile.attr( 'file' ) != 'down' )
		{
			var setButton = '<span class="btn btn_type01 btn_size02"><a href="/uems/common/attachfile/attachfilePopup.do" class="btnFile" onclick="fxPopFileCenter(\'/uems/common/attachfile/attachfilePopup.do?fileset=' + fileset + 
			'&fileGroup=' + fileGroup + '\',\'filepop\',404,452,\'no\'); return false;">';
			
			if(uploadType=='image'){
				selFile.before( setButton+'<i class="fa fa-upload"></i> 파일 업로드</a>' );
			}else if(uploadType=='editor'){
                if(designTy == 'user'){
                    selFile.before( setButton+'이미지 찾기</a>' );
                }else{
                    selFile.before( setButton+'<i class="fa fa-upload"></i> 파일 업로드</a>' );
                }
			}else if(uploadType=='product'){
				selFile.before( setButton+'<i class="fa fa-upload"></i> 파일 업로드</a>' );
			}else{
                if(designTy == 'user'){
                    selFile.before( setButton+'파일 찾기</a>' );
                }else{
                    selFile.before( setButton+'<i class="fa fa-upload"></i> 파일 업로드</a>' );
                }
			}
		}
	});

	fileUtil.initFileList();
	
	
	$jq('.productThum').live('change',function(){
		var nowId = $(this).val();
		$jq('.productThum').each(function(){
			var tg = $('.'+$jq(this).val());
			
			var fileval = tg.val().split('*');
			
			if ( fileval[0] != 'del' ){
				if(nowId == $jq(this).val()){
					tg.val('reg*'+fileval[1]+"*Y");
				}else{
					tg.val('reg*'+fileval[1]+"*N");
				}
			}
			
			
		});
		
	});
		
});

var fileUtil = new function()
{
	this.setFile = function( type , group , filenum , id )
	{
		var script			= '';
		var folder			= '';
		var fileExtension 	= '';
		var fileDesc 		= '';
		var queueSizeLimit 	= '';
		var simUploadLimit 	= '';
		var sizeLimit 		= '';

		$jq.getJSON('/resources/uems/js/plugin/uploadify/json/'+type+'.html', function(data) {

			script			= data.script+"?fileGroup="+group;
			folder			= data.folder;
			fileExtension 	= data.fileExtension;
			fileDesc 		= data.fileDesc;

			if(data.script== undefined ){
				script = '/uems/common/attachfile/attachfileRegistExe.do';
			}

			queueSizeLimit = data.size[0]-filenum;
			simUploadLimit = data.size[1];

			var fileMaxSize = $jq( opener.document ).find('div[id='+group+']').attr('fileSize');
			if(fileMaxSize != undefined && fileMaxSize != "" && fileMaxSize != null){
				sizeLimit	   = parseInt(fileMaxSize)*1024*1024;
			}else{
				sizeLimit	   = data.size[2]*1024*1024;
			}
			
			$jq('#'+id).uploadify(
					{
						'uploader' 	: '/resources/uems/js/plugin/uploadify/uploadify.swf' ,
						'script' 	: script ,
						'cancelImg' : '/resources/uems/js/plugin/uploadify/cancel.png' ,
						'buttonImg'   : '/resources/uems/images/btn_file02.gif' ,
						'height'      : 26,
						'width'       : 80 ,
						'folder' 	: folder ,
						'multi' 	: true ,
						'auto' 		: true ,
						'fileExtension' 	: fileExtension ,
						'fileDesc' 	: fileDesc ,
						'sizeLimit' : sizeLimit,
						'queueID' 	: 'custom-queue' ,
						'queueSizeLimit' : queueSizeLimit ,
						'simUploadLimit' : simUploadLimit ,
						'removeCompleted' : false ,
						'onSelect'    : function(event,ID,fileObj) {
							  $jq('#custom-queue').show();
							  var filenum = queueSizeLimit - ($jq('div .uploadifyQueueItem').size()+1);
							  if(filenum==0) filenum =1;
							  $jq('#fileupload').uploadifySettings('simUploadLimit',filenum);
						},
						'onSelectOnce' : function( event, data )
						{
							$jq( '#status-message' ).text( data.filesSelected + ' files have been added to the queue.' );
						} ,
						'onAllComplete' : function( event, data )
						{
							$jq( '#status-message' ).text( data.filesUploaded + ' files uploaded, ' + data.errors + ' errors.' );
							$jq('#apply').attr('style','cursor:pointer; vertical-align:top;').show();

						},
						'onQueueFull'    : function (event,queueSizeLimit) {
						    alert("더이상 파일을 추가 할수 없습니다.");
						    return false;
						},
						'onComplete'  : function(event, ID, fileObj, response, data) {
							
							$jq('#'+id+ID).attr('title',$jq.trim(response));
							
							$jq('#'+id+ID).attr('fileSize',$jq.trim(fileObj.size));
							$jq('#'+id+ID).attr('path',folder+$jq.trim(response)+fileObj.type);
							$jq('#'+id+ID).attr('type',fileObj.type);
							$jq('#apply').css('vertical-align:top');
						},
						'onError'     : function (event,ID,fileObj,errorObj) {
						    alert(errorObj.type + ' Error: ' + errorObj.info);
						}
					}
			);
		});
	};

	this.fileremove = function(id, attp ,fileGroup){
		var targetNm = $jq(attp+'[target='+fileGroup+']');
		
		var check = $('input[refId='+id+']').val();
		if(check){
			if((!$('input[refId='+id+']').is(":checked"))){
				$jq('div[id='+id+']').fadeOut('fast', function() {
					var fileval = $jq('input[class='+id+']').val().split('*');
				
					$jq('input[class='+id+']').val('del*'+fileval[1]+"*"+fileval[2]);
					$jq('input[class='+id+']').attr('grp','del');
				});
			}else{
				alert("대표이미지는 삭제 할수 없습니다.");	
			}		
			
		}else{
			$jq('div[id='+id+']').fadeOut('fast', function() {
				var fileval = $jq('input[class='+id+']').val().split('*');
		
				if(fileval[0]=='upd'){
					$jq('input[class='+id+']').val('del*'+fileval[1]+"*"+fileval[2]);
					$jq('input[class='+id+']').attr('grp','del');
				}else{
					$jq("#" + id).remove();
					if(targetNm.find('div').size()==0){
						targetNm.empty();
					}
				}
			});			
		}
		
	};

	this.filedown = function(id){
		location.href='/uems/common/attachfile/fileDown.do?fileId='+id;
	};

	this.setImages = function(response)
	{
	    this.response = response;
		if (this.response.substr(0, 2) == 'OK') {
	        var files = null;
	        try {
	            files = eval("[" + this.response.substr(3) + "]"); //substr(3):반환받은 문자에서 필요없는 문자("OK,")를 잘라낸다.
	        }
	        catch (e) {
	            alert(e.message);
	        }
	        if (files != null) {
	            for (var i = 0; i < files.length; i++) {
					tinyMCE.activeEditor.execCommand(
	            			'mceInsertContent',
	            			false,
	            			"<img src='" + files[i].storageUrl + "'>"
	            	);
	            }
	        }
	    }
	    else {
	        demo.innerHTML += "failed";
	    }
	};

	this.replace = function()
	{

	};

	this.iframeResize = function( frameobj, minSize )
	{
		var body;
		var h;

		body = ( frameobj.contentWindow.document.getElementsByTagName( 'BODY' ) )[0];
		h = parseInt( body.scrollHeight ) + 5;
		frameobj.style.height = ( h < minSize ? minSize : h ) + 'px';
	};

	/**
	 * 폼element 내의 checkbox나 radio의 선택여부 검사
	 * <pre>
	 * 예제)
	 * var b = util.isChecked(document.frm, "UserID"); // 선택된 UserID가 있는 경우 true, 없는 경우 false
	 * </pre>
	 *
	 * @param f : 폼element
	 * @param n : checkbox, radio element명
	 * @return 하나이상 체크된 경우 true, 아닌 경우 false
	 */
	this.isChecked = function( f, n )
	{
		return $jq( "input[name=" + n + "]:checked", f ).size() > 0 ? true : false;
	};

	this.checkedCount = function( f, n )
	{
		return $jq( "input[name=" + n + "]:checkbox:checked", f ).size();
	};

	this.checkedValue = function( f, n, d )
	{
		var result = "";
		$jq( "input[name=" + n + "]:checked", f ).each( function( i, elem )
		{
			result += $jq( this ).val() + ( $jq( "input[name=" + n + "]:checked", f ).size() - 1 == i ? "" : d );
		});

		return result;
	};

	/**
	 * submit대응
	 * @param f : form
	 * @param act : action
	 * @param tar : target
	 * @param id : programId
	 */
	this.submit = function( f, act, tar, id )
	{
		var preAction = f.action;
		var preTarget = f.target;

		if( id != "" && id != null )
			util.addHiddenElement( f, "_programId", id );

		f.action = act;
		f.target = tar;
		f.submit();

		f.action = preAction;
		f.target = preTarget;
	};

	this.initFileList = function( f, act, tar, id )
	{
		$jq( '.fileset' ).each( function()
		{
			var selFile     = $jq( this );
			var fileset 	= selFile.attr( 'json' );  		//파일을 설정값을 가지고 온다.
			var fileGroup 	= selFile.attr( 'id' );	   		//파일업로드 하고 적용될부분
			var uploadType 	= selFile.attr( 'uploadType' ); /* image , editor , file     */
			var editors 	= selFile.attr( 'editor' );
			var designTy 	= selFile.attr( 'designTy' ); 	 //디자인 변경작업을 하면된다.
			var fileDownCheck 	= selFile.attr( 'fileDownCheck' ); 	 //파일 다운로드시 로그인 체크

			//var filenum 	= selFile.find( 'input' ).size();

			//VIEW 화면에서 다운로드 화면을 세팅한다.
			if( selFile.attr( 'file' ) == 'down' ){

				var downFileAdminHtml 		= 	'<div class="file_data">' +
												'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
												'<img src="/resources/uems/js/plugin/uploadify/image/FILE_TP" border="0" />ENT_FILE_NM&nbsp;(ENT_FILE_SIZE byte)</a>'+
												'</div>';
				var downImageAdminHtml 		= 	'<dl class="file_img">' +
												'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
												'<dt><img src="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID" width="95" height="55" /></dt></a>'+
												'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +'<dd> ENT_FILE_NM </dd></a></dl>';
				var downFileUserHtml 		= 	'<div class="file_data file">' +
												'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
												'<img src="/images/common/blt/FILE_TP"  alt="파일" />ENT_FILE_NM&nbsp;(ENT_FILE_SIZE byte)</a>'+
												'</div>';
				var downImageUserHtml 		= 	'<dl class="file_img">' +
												'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +
												'<dt><img src="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID" width="95" height="55" /></dt></a>'+
												'<a href="/uems/common/attachfile/fileDown.do?fileId=ENT_FILE_ID">' +'<dd> ENT_FILE_NM </dd></a></dl>';
				$jq.ajax({
					type : "POST" ,
					url	 : "/uems/common/attachfile/attachfileList.do",
					dataType : "json",
					data : {
						'fileReferenceId' : selFile.attr( 'ref' ) ,
						'fileGroup' : fileGroup
					},
					success : function(data){
						$jq.each( data, function( index, entry )
						{
							var ent_fileid 			= entry['fileId'];
							var ent_fileName 		= entry['fileName'];
							var ent_fileGroup 		= entry['fileGroup'];
							var ent_fileExtension 	= entry['fileExtension'];
							var ent_fileSize		= entry['fileSize'];

							var replaceNames		= { 'ENT_FILE_ID' : ent_fileid , 'ENT_FILE_NM': ent_fileName  ,
														'ENT_FILE_SIZE' : ent_fileSize  , 'ENT_FILE_GRP': ent_fileGroup ,
														'FILE_TP' : fileExtensionType(ent_fileExtension)};
							if(designTy=='admin'){
								if(uploadType=='file'){
									$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(downFileAdminHtml).jReplaceAll(downFileAdminHtml,replaceNames) );
								}else if(uploadType=='image'){
									$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(downImageAdminHtml).jReplaceAll(downImageAdminHtml,replaceNames) );
								}else if(uploadType=='editor'){
									$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(downImageAdminHtml).jReplaceAll(downImageAdminHtml,replaceNames) );
								}
							}else if(designTy=='user'){
								if(uploadType=='file'){
									if(fileDownCheck == 'Y'){
										var downFileLoginCheckUserHtml 		= 	'<div class="file_data file">' +
										'<a href="javascript:alert(\'' + '로그인 후 이용 해주세요.' +'\');util.forwardLoginPage(\'' + '/member/login/Login.do' +'\');">' +
										'<img src="/images/common/blt/FILE_TP"  alt="파일" />ENT_FILE_NM&nbsp;(ENT_FILE_SIZE byte)</a>'+
										'</div>';
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(downFileLoginCheckUserHtml).jReplaceAll(downFileLoginCheckUserHtml,replaceNames) );
									}else{
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(downFileUserHtml).jReplaceAll(downFileUserHtml,replaceNames) );
									}
								}else if(uploadType=='image'){
									$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(downImageUserHtml).jReplaceAll(downImageUserHtml,replaceNames) );
								}else if(uploadType=='editor'){
									$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(downImageUserHtml).jReplaceAll(downImageUserHtml,replaceNames) );
								}
							}
						} );
					},
					complete : function(xhr,textStatus){
						if(designTy=='admin'){
							if(uploadType=='file'){
								if(selFile.find('a').size() == 0){
									$jq( 'div[id=' + fileGroup + ']' ).text( "등록된 파일이 없습니다." );
								}
							}else{
								if(selFile.find('a').size() == 0){
									$jq( 'div[id=' + fileGroup + ']' ).text( "등록된 파일이 없습니다." );
								}
							}

						}else if(designTy=='user'){
							if(uploadType=='file'){
								if(selFile.find('a').size() == 0){
									$jq( 'div[id=' + fileGroup + ']' ).text( "등록된 파일이 없습니다." );
								}
							}else{
								if(selFile.find('a').size() == 0){
									$jq( 'div[id=' + fileGroup + ']' ).text( "등록된 파일이 없습니다." );
								}
							}
						}
					}
				});

			}else{
				//수정 화면으로 들어 왔을때 SCRIPT
				if( selFile.attr( 'ref' ) != '' && selFile.attr( 'ref' ) != undefined )
				{
					$jq.ajax({
						type : "POST" ,
						url	 : "/uems/common/attachfile/attachfileList.do",
						dataType : "json",
						data : {
							'fileReferenceId' : selFile.attr( 'ref' ) ,
							'fileGroup' : fileGroup
						},
						success : function(data){
							
							$jq.each( data, function( index, entry )
							{
								var ent_fileid 			= entry['fileId'];
								var ent_fileName 		= entry['fileName'];
								var ent_fileGroup 		= entry['fileGroup'];
								var ent_fileExtension 	= entry['fileExtension'];
								var ent_fileSize 		= entry['fileSize'];

								//var imagpath 			= entry['fileRealPath']+entry['fileId']+'.'+entry['fileExtension'];
								var serverType 	= $jq('div[id='+ent_fileGroup+']').attr('serverType');			//저장할에디터
								var imagpath 			= entry['domainPath'] + "/imageLoad" + entry['filePhyPath'];

								var CHECKED_YN 			= entry['delegateYn'];
								if(CHECKED_YN == "Y"){
									CHECKED_YN = "checked=checked"
								}
								
								var replaceNames		= { 'ENT_FILE_ID'   : ent_fileid     , 'ENT_FILE_NM': ent_fileName + ' ('+ent_fileSize+' byte)' ,
															'ENT_FILE_SIZE' : ent_fileSize   , 'ENT_FILE_GRP': ent_fileGroup ,
															'IMG_PATH'      : imagpath       , 'EDITORS'     : editors , 'CHECKED_YN': CHECKED_YN , 'SERVER_TYPE': serverType ,
															'FILE_TP'       : fileExtensionType(ent_fileExtension)};
								
									
								if(designTy=='admin'){
									if(uploadType=='file'){
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateFileAdminHtml2).jReplaceAll(updateFileAdminHtml2,replaceNames) );
									}else if(uploadType=='image'){
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateImageAdminHtml).jReplaceAll(updateImageAdminHtml,replaceNames) );
									}else if(uploadType=='editor'){
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateEditorAdminHtml).jReplaceAll(updateEditorAdminHtml,replaceNames) );
									}else if(uploadType=='product'){
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateProductImageAdminHtml).jReplaceAll(updateProductImageAdminHtml,replaceNames) );
									}

								}else if(designTy=='user'){
									if(uploadType=='file'){
										if(editors != '' && editors != undefined){
											$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateFileUserHtml1).jReplaceAll(updateFileUserHtml1,replaceNames) );
										}else{
											$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateFileUserHtml2).jReplaceAll(updateFileUserHtml2,replaceNames) );
										}
									}else if(uploadType=='image'){
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateImageUserHtml).jReplaceAll(updateImageUserHtml,replaceNames) );

									}else if(uploadType=='editor'){
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateEditorUserHtml).jReplaceAll(updateEditorUserHtml,replaceNames) );
									}else if(uploadType=='event'){
										$jq( 'div[id=' + ent_fileGroup + ']' ).append( $jq(updateFileEventHtml).jReplaceAll(updateFileEventHtml,replaceNames) );
									}
								}
							});
						},
						complete : function(xhr,textStatus){
						}
					});
				}
			}
		} );
	};
};
function fxPopFileCenter( u, p, w, h, s )
{
	var winl = ( screen.width - w ) / 2;
	var wint = ( screen.height - h ) / 2;

	opt = 'height=' + h + ',width=' + w + ',top=' + wint + ',left=' + winl + ',scrollbars=' + s + ',resizable=no';
	w = window.open( u, p, opt );

	if( parseInt( navigator.appVersion ) >= 4 )
		w.window.focus();
}	
//FILE TYPE ICON 반환
function fileExtensionType( ent_fileExtension )
{
	var returnExtType = "";
	if(ent_fileExtension.indexOf('pdf') != -1) 
		returnExtType =  'icon_pdf.gif';
	else if(ent_fileExtension.indexOf('hwp') != -1) 
		returnExtType =  'icon_hwp.gif';
	else if(ent_fileExtension.indexOf('doc') != -1) 
		returnExtType =  'icon_doc.gif';
	else if(ent_fileExtension.indexOf('ppt') != -1)
		returnExtType =  'icon_ppt.gif';
	else if(ent_fileExtension.indexOf('xls') != -1) 
		returnExtType =  'icon_xls.gif';
	else if(ent_fileExtension.indexOf('zip') != -1) 
		returnExtType =  'icon_zip.gif';								
	else{
		returnExtType =  'icon_file.gif';
		//returnExtType =  'ico_attach.gif';
	}
		
	return returnExtType;
}
