$(document).ready(function(){
	
});
// e: document.ready

Map = function(){
	  this.map = new Object();
	 };  
	 Map.prototype = {   
	     put : function(key, value){
	      value = string.strNvl(value) == "" ? "" : value.toString();
	         this.map[key] = value;
	     },   
	     get : function(key){   
	         return this.map[key];
	     },
	     containsKey : function(key){    
	      return key in this.map;
	     },
	     containsValue : function(value){    
	      for(var prop in this.map){
	       if(this.map[prop] == value) return true;
	      }
	      return false;
	     },
	     isEmpty : function(key){    
	      return (this.size() == 0);
	     },
	     clear : function(){   
	      for(var prop in this.map){
	       delete this.map[prop];
	      }
	     },
	     remove : function(key){    
	      delete this.map[key];
	     },
	     keys : function(){   
	         var keys = new Array();   
	         for(var prop in this.map){   
	             keys.push(prop);
	         }   
	         return keys;
	     },
	     values : function(){   
	      var values = new Array();   
	         for(var prop in this.map){   
	          values.push(this.map[prop]);
	         }   
	         return values;
	     },
	     size : function(){
	       var count = 0;
	       for (var prop in this.map) {
	         count++;
	       }
	       return count;
	     }
	 };


/* s: funciton
--------------------------------------------------------- */
var string = {
	strNvl : function(value) {
		if(value == null || value == undefined || value == "undefined") {
			return "";
		}
	}
}


//validation check
var validation = {

	// form validation check
	// 1. 필수항목 체크
	// 2. 숫자항목 체크
	fn_checkForm : function(formId) {
		var bRslt = true;
		if(bRslt)	bRslt = validation.fn_checkReq(formId);
		if(bRslt)	bRslt = validation.fn_checkNum(formId);
		
		return bRslt;
	}
	
	// 1. 필수항목 체크
	, fn_checkReq : function(formId) {
		var bCheckEach = true;
		$("#"+formId).find("input").each(function(){
			if($(this).attr("val_req") && bCheckEach) {
				if($(this).val() == "") {
					alert($(this).attr("title")+" 은(는) 필수 입력 항목입니다.");
					$(this).focus();
					bCheckEach = false;
					return;
				}
			}
		});
		return bCheckEach;
	}
	
	// 2. 숫자항목 체크
	, fn_checkNum : function(formId) {
		var bCheckEach = true;
		var re
		$("#"+formId).find("input").each(function(){
			if($(this).attr("val_num") && bCheckEach) {
				if(/[^0-9]/g.test($(this).val()) && $(this).val() != "") {
					alert($(this).attr("title")+" 은(는) 숫자 입력 항목입니다.");
					$(this).focus();
					bCheckEach = false;
					return;
				}
			}
		});
		return bCheckEach;
	}
	
};
	