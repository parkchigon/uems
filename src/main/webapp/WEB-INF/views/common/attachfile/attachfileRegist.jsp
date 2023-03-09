<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>파일첨부</title>
<link type="text/css" rel="stylesheet" href="/resources/uems/css/default.css"  /> 
<link type="text/css" href="/resources/uems/js/lib/jquery/jquery-ui.css" rel="stylesheet"/>
<link rel="stylesheet" href="/resources/uems/js/plugin/uploadify/uploadify.css" type="text/css" />
<link rel="stylesheet" href="/resources/uems/js/plugin/uploadify/css/uploadify.styling.css" type="text/css" />
<link href="/resources/uems/css/font-awesome.css" rel="stylesheet" media="screen"/>

<script type="text/javascript" src="/resources/uems/js/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/uems/js/lib/jquery/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/uems/js/lib/jquery/jquery-ui.js"></script>

<script type="text/javascript" src="/resources/uems/js/lib/file-util-1.0.js?20160508"></script>
<script type="text/javascript" src="/resources/uems/js/plugin/uploadify/swfobject.js"></script>
<script type="text/javascript" src="/resources/uems/js/plugin/uploadify/jquery.uploadify.v2.1.4.min.js"></script>

<script type="text/javascript">
	//         
	var $jq = jQuery.noConflict();
	$jq( document ).ready( function()
	{
		var filenum 	= $jq( opener.document ).find('input[grp='+'<c:out value="${attachfileVO.fileGroup}"/>'+']').size(); 				//파일 갯수를 체크한다.
		var fileGroup 	= '<c:out value="${attachfileVO.fileGroup}"/>';																	//파일 업로드할 장소
		var uploadType 	= $jq( opener.document ).find('div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']').attr('uploadType');		//파일 업로드유형 (image,editor,file)
		var editors 	= $jq( opener.document ).find('div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']').attr('editor');			//저장할에디터
		var designTy 	= $jq( opener.document ).find('div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']').attr('designTy');		//디자인 유형을 정의
		var fileMaxSize = $jq( opener.document ).find('div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']').attr('fileSize');		//파일사이즈설정체크
		
		var serverType 	= $jq( opener.document ).find('div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']').attr('serverType');			//저장할에디터
		
		/**Product Type*/
		var CHECKED_YN = $jq( opener.document ).find('div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']').attr('checked_yn');		//대표이미지사용유무
		
		
		$jq.getJSON('/resources/uems/js/plugin/uploadify/json/<c:out value="${attachfileVO.fileset}"/>.html', function(data) {
			
			var settMsg1     = " 최대 " + (data.size[0]-filenum)+"개까지  파일을 업로드 할수 있습니다.";
			var setSize = "";     
			if(fileMaxSize != undefined && fileMaxSize != "" && fileMaxSize != null){
				setSize      = "최대 각 <strong>" + fileMaxSize+"M</strong> 크기까지 파일 업로드가 가능합니다.<br />";
			}else{
				setSize      = "최대 각 <strong>" + data.size[2]+"M</strong> 크기까지 파일 업로드가 가능합니다.<br />";	
			}
			
			var setType      = "<strong>"+data.fileDesc + "</strong>파일만 업로드 가능합니다<br />";      
			if(data.fileDesc == null || data.fileDesc == ''){
				setType= "<strong>모든파일</strong>이 업로드가 가능합니다<br />";
			}
			$jq('h4').append(settMsg1);
			$jq('h4').after(setSize+setType);
			
		});
		
		//UPLOAD 화면을 세팅한다.
		fileUtil.setFile( '<c:out value="${attachfileVO.fileset}"/>', '<c:out value="${attachfileVO.fileGroup}"/>', filenum ,'fileupload' );
		
		$jq( '#apply' ).click( function()
		{	
			$jq( '.completed' ).each( function( i )
			{
				var fileName 		= $jq( this ).children( '.fileName' ).text();
				var fileId   		= $jq( this ).attr( 'title' );
				var imagpath   	 	= $jq( this ).attr( 'path' );
				
				var domain   	 	= "<spring:eval expression="@config['flk.ip.path']"/>";//서버환경에 맞게 도메인 변경
				imagpath = domain + "/imageLoad" + imagpath;
				
				var ent_fileExtension   	= $jq( this ).attr( 'type' );
				var ent_fileSize   			= $jq( this ).attr( 'fileSize' );
				
				var replaceNames		= { 'ENT_FILE_ID' : fileId  , 'ENT_FILE_NM': fileName  ,
											'ENT_FILE_GRP': fileGroup , 'FILE_TP': fileExtensionType(ent_fileExtension) ,
											'IMG_PATH': imagpath    , 'EDITORS': editors , 'CHECKED_YN': CHECKED_YN , 'SERVER_TYPE': serverType ,
											'upd': 'reg'};
				if(designTy=='admin'){
					if(uploadType=='file'){
						if(serverType != '' && serverType != undefined){
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateFileAdminHtml2).jReplaceAll(updateFileAdminHtml2,replaceNames) );
						}else{
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateFileAdminHtml2).jReplaceAll(updateFileAdminHtml2,replaceNames) );
						}
					}else if(uploadType=='image'){
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateImageAdminHtml).jReplaceAll(updateImageAdminHtml,replaceNames) );		
					}else if(uploadType=='editor'){
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateEditorAdminHtml).jReplaceAll(updateEditorAdminHtml,replaceNames) );	
					}else if(uploadType=='product'){
						if($jq(opener.document).find(".productThum:checked").size() > 0){
							replaceNames.CHECKED_YN = "";
						}
						$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateProductImageAdminHtml).jReplaceAll(updateProductImageAdminHtml,replaceNames) );
					}		
				}else if(designTy=='user'){
					if(uploadType=='file'){
						if(serverType != '' && serverType != undefined){
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateFileUserHtml1).jReplaceAll(updateFileUserHtml1,replaceNames) );
						}else{
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateFileUserHtml2).jReplaceAll(updateFileUserHtml2,replaceNames) );
						}
					}else if(uploadType=='image'){
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateImageUserHtml).jReplaceAll(updateImageUserHtml,replaceNames) );		
					}else if(uploadType=='editor'){
							$jq( opener.document ).find( 'div[id='+'<c:out value="${attachfileVO.fileGroup}"/>'+']' ).append( $jq(updateEditorUserHtml).jReplaceAll(updateEditorUserHtml,replaceNames) );	
					}		
				}
			} );
			if( $jq( '.uploadifyQueueItem' ).size() == 0 )
			{
				alert( '선택된 파일 없습니다.\n 파일을 선택하여 주세요!' );
				return;
			}
			self.close();
		} );
		
	} );
</script>
<!-- See style.css -->
<style type="text/css">
#custom-demo .uploadifyQueueItem {
	background-color: #FFFFFF;
	border: none;
	border-bottom: 1px solid #E5E5E5;
	font: 11px Verdana, Geneva, sans-serif;
	height: 50px;
	margin-top: 0;
	padding: 10px;
	width: 350px;
}
#custom-demo .uploadifyError {
	background-color: #FDE5DD !important;
	border: none !important;
	border-bottom: 1px solid #FBCBBC !important;
}
#custom-demo .uploadifyQueueItem .cancel {
	float: right;
}
#custom-demo .uploadifyQueue .completed {
	color: #C5C5C5;
}
#custom-demo .uploadifyProgress {
	background-color: #E5E5E5;
	margin-top: 10px;
	width: 100%;
}
#custom-demo .uploadifyProgressBar {
	background-color: #0099FF;
	height: 3px;
	width: 1px;
}
#custom-demo #custom-queue {
	border: 1px solid #E5E5E5;
	height: 213px;
	margin-bottom: 10px;
	width: 370px;
}
</style>
</head>
<body>
<div class="dimmed"> </div>
<div id="pop02" class="popup_container" style="position: absolute; margin-top: -221px; top: 50%;">
<div class="popup_inner w01"><!-- w01~ 로 넓이 조절-->
	<div class="popup_header"><h1>파일업로드</h1></div>
	<div class="popup_body">
		<div class="popup_content">
		<h4><i class="fa fa-info"></i></h4>
			<div class="popUpload">
				<div class="demo-box">
					<div id="status-message">파일 리스트(<strong>파일업로드</strong> 버튼을 선택하여 업로드 하여주세요)</div>
					<div id="custom-queue" class="uploadifyQueue" style="display: none;"></div>
				</div>
				<div id="totfilelist" style="display: none;"></div>
			</div>
			<div class="BTN05">
				<input id="fileupload" type="file" name="Filedata" width="80" style="display: none;" height="26"/>
		   	    <span class="btn btn_type02 btn_size02" id="apply" style="padding-bottom: 16px;"><a href="#"><i class="fa fa-files-o"></i> 파일적용</a></span>
		   	</div>
		</div>
	</div>
</div>
</div>
<!-- //팝업 스타일 2 -->

</body>
</html>