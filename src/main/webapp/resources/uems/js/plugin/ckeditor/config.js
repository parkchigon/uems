/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.language = 'ko';
	width:'100%';
	height:'200px';
	
	config.toolbarGroups = [
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		'/',
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.removeButtons = 'Save,NewPage,Print,Templates,Cut,Copy,Redo,Paste,PasteText,PasteFromWord,Undo,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Subscript,Superscript,RemoveFormat,NumberedList,Indent,Outdent,Blockquote,CreateDiv,BulletedList,JustifyLeft,JustifyCenter,JustifyBlock,JustifyRight,Language,BidiRtl,BidiLtr,Unlink,Anchor,Table,Flash,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,Format,Styles,ShowBlocks,Maximize,About';
	
	//config.startupMode = 'source';
	config.autoParagraph = false;
	config.allowedContent = true;
	//config.filebrowserUploadUrl = '/upload/upload.php'   : 이미지 업로드 경로 설정 필요 


};
	

