
var $ = jQuery.noConflict();

var PageUtil = function (url, fname) {
    this.url = url;
    this.fname = fname;
};

PageUtil.prototype.setter = function (prop) {
    for (var key in prop) {
        $("form[name=" + this.fname + "] *[name=" + key + "]").val(prop[key]);
    }
};

/**
 * 리스트 페이지 검색초기화
 */
PageUtil.prototype.init = function (prop) {
    var param = "";
    for (var key in prop) {
        if (param == "")
            param = "?" + key + "=" + prop[key];
        else
            param = param + "&" + key + "=" + prop[key];
    }
    location.href = this.url + param;
};

/**
 * submit
 */
PageUtil.prototype.proc = function (prop, target, programId) {
    this.setter(prop);
    util.submit($("form[name=" + this.fname + "]")[0], this.url, target, programId);
};

/**
 * 보기, 수정페이지에서 목록으로 이동
 */
PageUtil.prototype.list = function (prop) {
    this.proc(prop, "_self", "List");
};

/**
 * 리스트 페이지 검색
 */
PageUtil.prototype.search = function (prop) {
    this.proc(prop, "_self", "List");
};

/**
 * 보기페이지 이동
 */
PageUtil.prototype.view = function (prop) {
    this.proc(prop, "_self", "View");
};

/**
 * 등록, 수정페이지로 이동
 */
PageUtil.prototype.writeForm = function (prop) {
    this.proc(prop, "_self", "WriteForm");
};

/**
 * 삭제처리
 */
PageUtil.prototype.del = function (prop) {
    if (confirm("삭제하시겠습니까?"))
        this.proc(prop, "_self", "Delete");
};

/**
 * 저장처리
 */
PageUtil.prototype.write = function (prop) {
    this.setter(prop);
    var f = $("form[name=" + this.fname + "]")[0];
    var msg = this.validateElements();
    if (msg != "")
        alert(msg);
    else
        util.submit(f, this.url, "_self", "Write");
};

var util = new function () {
    /**
     * 폼element 내의 checkbox나 radio의 선택여부 검사
     *
     * <pre>
     * 예제)
     * var b = util.isChecked(document.frm, &quot;UserID&quot;); // 선택된 UserID가 있는 경우 true, 없는 경우 false
     * </pre>
     *
     * @param f :
     *            폼element
     * @param n :
     *            checkbox, radio element명
     * @return 하나이상 체크된 경우 true, 아닌 경우 false
     */
    this.isChecked = function (f, n) {
        return $("input[name=" + n + "]:checked", f).size() > 0 ? true : false;
    };

    this.getCount = function (f, n) {
        return $("input[name=" + n + "]:checkbox:checked", f).size();
    };

    this.getAllValue = function (f, n, d) {
        var result = "";
        $("input[name=" + n + "]", f).each(function (i, elem) {
            result += $(this).val() + ( $("input[name=" + n + "]", f).size() - 1 == i ? "" : d );
        });

        return result;
    };

    this.getCheckedValue = function (f, n, d) {
        var result = "";
        $("input[name=" + n + "]:checked", f).each(function (i, elem) {
            result += $(this).val() + ( $("input[name=" + n + "]:checked", f).size() - 1 == i ? "" : d );
        });

        return result;
    };

    this.getUnCheckedValue = function (f, n, d) {
        var result = "";
        $("input[name=" + n + "]:not(:checked)", f).each(function (i, elem) {
            result += $(this).val() + ( $("input[name=" + n + "]:not(:checked)", f).size() - 1 == i ? "" : d );
        });

        return result;
    };

    this.nullReplace = function (val, rep) {
        if (val == null)
            return rep;
        else
            return val;
    };

    this.pagingSubmit = function (pnum, f, pname) {
        var currPage = $("input[name=" + pname + "]", f).val();
        if (currPage == null) currPage = 1;
        if (pnum != currPage) {
            this.addHiddenElement(f, pname, pnum);
            f.submit();
        }
    };


    /**
     * 지정페이지로 이동. 최상위 부모페이지만 남기고 나머지는 종료.
     *
     * @param url
     */
    this.forwardLoginPage = function (url) {
        var to = opener;
        var to2;
        if (to) {
            // 상위의 오프너페이지가 닫혀진 경우에는 자신의 페이지만 닫고 종료하도록 예외처리
            try {
                // 오프너페이지가 있는 경우
                while (to) {
                    to2 = to.opener;

                    // 오프너페이지의 오프너페이지가 있는 경우
                    if (to2) {
                        // 오프너페이지가 프레임인 경우
                        if (to.parent)
                            to.parent.close(); // 오프너페이지가 프레임인 경우 프레임 상위에서 창을 닫는다.
                        else
                        // 오프너페이지가 프레임이 아닌 경우
                            to.close(); // 오프너페이자가 프레임이 아닌 경우는 그냥 창을 닫는다.
                    }
                    else
                    // 오프너페이지의 오프너가 없는 경우에는
                    {
                        // 오프너페이지가 프레임인 경우 상위의 페이지를 지정한 주소로 이동
                        if (to.parent)
                            to.parent.location.href = url;
                        else
                        // 오프너페이지가 프레임이 아닌 경우 지정한 주소로 이동
                            to.location.href = url;
                    }

                    to = to2; // 상위의 오프너페이지가 없을 때까지 루프를 돌면서 체크
                }

                // 현재 창이 프레임인 경우 상위에서 창을 닫는다.
                if (top.parent == "[object]")
                    top.parent.self.close();
                else
                // 현재 창이 프레임이 아닌 경우 창을 닫는다.
                    top.self.close();
            }
            catch (e) {
                // 상위의 오프너페이지가 닫혀진 경우 현재 창만 닫고 끝낸다.
                if (top.parent)
                    top.parent.self.close();
                else
                    top.self.close();
            }
        }
        else if (top.parent) // 프레임인 경우 상위페이지에서 지정한 주소로 이동
        {
            top.location.href = url;
        }
        else
        // 현재 페이지에서 지정한 주소로 이동
        {
            location.href = url;
        }
    };

    /**
     * submit대응
     *
     * @param f :
     *            form
     * @param act :
     *            action
     * @param tar :
     *            target
     * @param id :
     *            programId
     */
    this.submit = function (f, act, tar, id) {
        var preAction = f.action;
        var preTarget = f.target;

        if (id != "" && id != null)
            util.addHiddenElement(f, "_programId", id);

        f.action = act;
        f.target = tar;
        f.submit();

        f.action = preAction;
        f.target = preTarget;
    };

    /**
     * hidden element 추가
     */
    this.addHiddenElement = function (f, name, value) {
        var ele;
        for (var i = 0; i < f.elements.length; i++) {
            if (name == f.elements[i].name) {
                ele = f.elements[i];
                break;
            }
        }

        if (!ele) {
            ele = document.createElement("input");
            ele.type = "hidden";
            ele.id = name;
            ele.name = name;
            ele.value = value;

            f.appendChild(ele);
        }
        else {
            ele.value = value;
        }
    };

    this.evalScript = function (html) {
        var re = /<script\b[\s\S]*?>([\s\S]*?)<\//ig;
        var match;
        while (match = re.exec(html)) {
            eval(match[1]);
        }
    };
};

var DateUtil = function (dateobj) {
    this.dateobj = dateobj;

    //$( this.dateobj ).click( function( e ){ this.value = ""; } );

    $(this.dateobj).datepicker(
        {
    		closeText: '닫기',
    		prevText: '이전달',
    		nextText: '다음달',
    		currentText: '오늘',			
    		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNames: [ '일' , '월' , '화' , '수' , '목' , '금' , '토' ],
            dayNamesShort: [ '일' , '월' , '화' , '수' , '목' , '금' , '토' ],
            dayNamesMin: [ '일' , '월' , '화' , '수' , '목' , '금' , '토' ],
            isRTL: false,
            changeYear: true,
            changeMonth: true,
            showMonthAfterYear: true,
            yearRange: '1900:2100',
    		showAnim:'show',
    		showOn: "button",
    		buttonImage: "/resources/uems/images/btn_calendar01.png",
    		buttonImageOnly: true,
            dateFormat: scriptDateFormat.replace("yyyy", "yy").replace("MM", "mm")		
        });
    this.isDate = function () {
        var flag = true;
        var msg = "";

        var iYear = 0;
        var iMonth = 0;
        var iDay = 0;
        var iDaysInMonth = null;
        var iHour = -1;
        var iMinute = -1;

        var sDateFormat = scriptDateFormat; // yyyy : 년도, mm : 월, dd : 일
        var aDaysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

        // 포멧과 비교할 날짜 길이가 같지 않다면 false 리턴
        if (sDateFormat.length != this.dateobj.value.length)
            return false;
        iYear = this.dateobj.value.substring(sDateFormat.indexOf("yyyy"), sDateFormat.indexOf("yyyy") + 4);
        iMonth = this.dateobj.value.substring(sDateFormat.indexOf("MM"), sDateFormat.indexOf("MM") + 2);
        iDaysInMonth = ( iMonth != 2 ) ? aDaysInMonth[iMonth - 1] : ( ( iYear % 4 == 0 && iYear % 100 != 0 || iYear % 400 == 0 ) ? 29 : 28 );
        iDay = this.dateobj.value.substring(sDateFormat.indexOf("dd"), sDateFormat.indexOf("dd") + 2);

        if (isNaN(iYear) || isNaN(iMonth) || isNaN(iDay))
            return false;

        if (iYear < 1 || iYear > 9999 || iMonth > 12 || iMonth < 1 || iDay < 1 || iDay > iDaysInMonth)
            return false;

        return true;
    };
};

var UrlSelectBoxUtil = function (selObj) {
    this.init = true;

    /**
     * selectbox 설정
     *
     * @param prop :
     *            properties로 파라미터 설정
     * @param chgVal :
     *            선택된코드
     * @param msg :
     *            기본메세지
     * @param searchType :
     *            기본 fxCode 테이블이 아닌 쿼리로 조회시 타입정의
     * @param callback :
     *            callback 함수 호출
     */
    this.setSelectBox = function (url, prop, chgVal, msg, searchType, callback) {

        if (!this.init)
            chgVal = "";

        // 지정되지 않은 경우 undefined로 넘어온다.
        if (searchType == undefined)
            searchType = "";

        $.ajax(
            {
                type: "POST",
                url: url + "?" + new Date().getTime(),
                data: prop,
                dataType: "json",
                async: false,
                beforeSend: function () {
                    selObj.options.length = 1;
                    selObj.options[0].text = "조회 중입니다....";
                },
                success: function (data) {
                    selObj.options.length = 0;

                    if (msg != "")
                        $(selObj).append("<option value=''>" + msg + "</option>");

                    $.each(data.codes, function (i, code) {
                        $(selObj).append("<option value='" + $.trim(code.code) + "'" + ( chgVal == $.trim(code.code) ? " selected" : "" ) + ">" + $.trim(code.codename) + "</option>");
                    });

                    $(selObj).change();

                    // searchType은 생략 가능하므로 생략됐을 경우는 콜백함수가 올수 있으므로 타입 비교 후 실행
                    if ($.isFunction(searchType))
                        searchType;
                    else if ($.isFunction(callback))
                        callback;
                },
                error: function (xhr, textStatus) {
                    alert("ERROR : " + xhr.status);
                }
            });

        this.init = false;
    };

    /**
     * selectbox 설정(setSelectBox는 최초 선택된 값이 유지가 안되지만 initSelectBox는 선택된 값이 유지가 된다.)
     *
     * @param prop :
     *            properties로 파라미터 설정
     * @param chgVal :
     *            선택된코드
     * @param msg :
     *            기본메세지
     * @param searchType :
     *            기본 fxCode 테이블이 아닌 쿼리로 조회시 타입정의
     * @param callback :
     *            callback 함수 호출
     */
    this.initSelectBox = function (prop, chgVal, msg, searchType, callback) {
        var oriInit = this.init;
        this.init = true;
        this.setSelectBox(prop, chgVal, msg, searchType, callback);
        this.init = oriInit;
    };

    /**
     * selectbox 정렬
     *
     * @param name :
     *            selectbox name
     * @param sorttype :
     *            정렬대상( text, value )
     */
    this.sortSelectBox = function (name, sorttype) {
        var selectArr = new Array();

        $("select[name=" + name + "]>option").each(function () {
            var options = new Array();
            if (sorttype == "value") {
                options.push($(this).val());
                options.push($(this).text());
            }
            else {
                options.push($(this).text());
                options.push($(this).val());
            }

            selectArr.push(options);
        });

        selectArr.sort();

        $("select[name=" + name + "]").attr("length", 0);

        var txt = "";
        var val = "";
        for (var i = 0; i < selectArr.length; i++) {
            if (sorttype == "value") {
                txt = selectArr[i][1];
                val = selectArr[i][0];
            }
            else {
                txt = selectArr[i][0];
                val = selectArr[i][1];
            }

            $("select[name=" + name + "]").append("<option value='" + val + "'>" + txt + "</option>");
        }
    };
};

var SelectBoxUtil = function (selObj) {
    this.init = true;

    /**
     * selectbox 설정
     *
     * @param prop :
     *            properties로 파라미터 설정
     * @param chgVal :
     *            선택된코드
     * @param msg :
     *            기본메세지
     * @param searchType :
     *            기본 fxCode 테이블이 아닌 쿼리로 조회시 타입정의
     * @param callback :
     *            callback 함수 호출
     */
    this.setSelectBox = function (prop, chgVal, msg, searchType, callback) {
        if (!this.init)
            chgVal = "";

        // 지정되지 않은 경우 undefined로 넘어온다.
        if (searchType == undefined)
            searchType = "";

        prop["searchType"] = $.isFunction(searchType) ? "" : searchType;

        $.ajax(
            {
                type: "POST",
                url: "/common/common/CodeDetailList.do",
                data: prop,
                dataType: "json",
                async: false,
                beforeSend: function () {
                    $(selObj).empty();
                    $(selObj).append("<option value=''>조회 중입니다</option>");
                },
                success: function (data) {
                    $(selObj).empty();
                    if (msg != "")
                        $(selObj).append("<option value=''>" + msg + "</option>");

                    $.each(data.codes, function (i, code) {
                        $(selObj).append("<option value='" + $.trim(code.code) + "'" + ( chgVal == $.trim(code.code) ? " selected" : "" ) + ">" + $.trim(code.codename.replace("&lt;br&gt;", "")) + "</option>");
                    });

                    $(selObj).change();

                    // searchType은 생략 가능하므로 생략됐을 경우는 콜백함수가 올수 있으므로 타입 비교 후 실행
                    if ($.isFunction(searchType))
                        searchType;
                    else if ($.isFunction(callback))
                        callback;
                }
            });

        this.init = false;
    };

    /**
     * selectbox 설정(setSelectBox는 최초 선택된 값이 유지가 안되지만 initSelectBox는 선택된 값이 유지가 된다.)
     *
     * @param prop :
     *            properties로 파라미터 설정
     * @param chgVal :
     *            선택된코드
     * @param msg :
     *            기본메세지
     * @param searchType :
     *            기본 fxCode 테이블이 아닌 쿼리로 조회시 타입정의
     * @param callback :
     *            callback 함수 호출
     */
    this.initSelectBox = function (prop, chgVal, msg, searchType, callback) {
        var oriInit = this.init;
        this.init = true;
        this.setSelectBox(prop, chgVal, msg, searchType, callback);
        this.init = oriInit;
    };

    /**
     * selectbox 정렬
     *
     * @param name :
     *            selectbox name
     * @param sorttype :
     *            정렬대상( text, value )
     */
    this.sort = function (sorttype) {
        var selectArr = new Array();

        $("select[name=" + this.obj.name + "]>option").each(function () {
            var options = new Array();
            if (sorttype == "value") {
                options.push($(this).val());
                options.push($(this).text());
            }
            else {
                options.push($(this).text());
                options.push($(this).val());
            }

            selectArr.push(options);
        });

        selectArr.sort();

        $("select[name=" + this.obj.name + "]").attr("length", 0);

        var txt = "";
        var val = "";
        for (var i = 0; i < selectArr.length; i++) {
            if (sorttype == "value") {
                txt = selectArr[i][1];
                val = selectArr[i][0];
            }
            else {
                txt = selectArr[i][0];
                val = selectArr[i][1];
            }

            $("select[name=" + this.obj.name + "]").append("<option value='" + val + "'>" + txt + "</option>");
        }
    };
};


var LogUtil = new function () {
    this.debug = function (log) {
        $("body").prepend(log + "<br>");
    };
};

/**
 * ***************************************************************************** ajax method *****************************************************************************
 */
$(document).ajaxError( function( evt, xhr, opt )
{
	if( xhr.status == 401 )
	{
		alert( "로그인 후 이용해 주세요." );
		util.forwardLoginPage( loginPage );
	}else if(xhr.status == 405){
		/* popup 로그인 띄우기*/
		alert( "로그인 후 이용해 주세요." );
	}else if( xhr.status == 403 ){
		alert( "허가되지 않은 접근입니다." );
	}else{
		alert( "변경되었습니다. 다시 접속하여 주십시요." );
		location.reload();
	}
		
} );

/**
 * 팝업 중앙에 띄우기
 *
 * <pre>
 * 예제)
 * fxPopCenter(&quot;SamplePopup.html&quot;, &quot;TargetName&quot;, 500, 600, &quot;yes&quot;);
 * </pre>
 *
 * @param u :
 *            이동할 URL
 * @param p :
 *            팝업타겟명
 * @param w :
 *            가로사이즈
 * @param h :
 *            세로사이즈
 * @param s :
 *            스크롤사용여부(yes/no)
 */
function fxPopCenter(u, p, w, h, s) {
    var winl = ( screen.width - w ) / 2;
    var wint = ( screen.height - h ) / 2;

    opt = 'height=' + h + ',width=' + w + ',top=' + wint + ',left=' + winl + ',scrollbars=' + s + ',resizable=no';
    w = window.open(u, p, opt);

    if (parseInt(navigator.appVersion) >= 4)
        w.window.focus();
}
/**
 * 숫자만 입력이 가능함
 */
function chkNumber(Obj) {
    var digit = /[^0-9,]/;
    if (Obj.value.search(digit) != -1) {
        alert('숫자로만 입력해주세요.');
        Obj.value = '';
        Obj.focus();
        return false;
    }
    return true;
}

/**
 * CheckBox 전체선택 체크박스이름을 진입변수로 한다.
 */
function chkall(chkName, objAll) {
    var obj = document.getElementsByName(chkName);
    var objAll = objAll;

    if (obj.length) {
        var chki = 0;
        if (objAll.checked) {
            chkstate = true;
        } else {
            chkstate = false;
        }

        for (i = 0; i < obj.length; i++) {
            // j2m, 2015-01-28 : 속성이 정의되어 있지 않는 경우 undefined이기 때문에 '== false' 대신 '!= true'로 비교.
            if ($(obj[i]).attr("disabled") != true) {
                obj[i].checked = chkstate;
            }
        }
    } else {
        if (!objAll.checked) {
            obj.checked = true;
        } else {
            obj.checked = false;
        }
    }
}

/**
 * CheckBox 선택여부 체크 체크박스이름을 진입변수로 한다.
 */
function chkCHK(chkName) {
    var obj = document.getElementsByName(chkName);

    if (obj.length) {
        var chkValue = "";
        for (i = 0; i < obj.length; i++) {
            if (obj[i].checked) {
                if (chkValue == "") {
                    chkValue = obj[i].value;
                } else {
                    chkValue += "," + obj[i].value;
                }
            }
        }

        if (chkValue == "") { // 체크한것이 없을때
            return 0;
        } else { // 체크한것이 있을때
            return chkValue;
        }
    } else {
        if (!obj.checked) {
            return 0;
        } else {
            return obj.value;
        }
    }

}

/**
 * ID는 영문/숫자 이외의 문자는 허용되지 않습니다
 */
function id_check(input) {
    var err_cnt = 0
    for (var i = 0; i < input.length; i++) {
        var val = input.charAt(i);
        if (!((val >= "0" && val <= "9") || (val >= "a" && val <= "z") || (val >= "A" && val <= "Z")))
            err_cnt++
    }
    if (err_cnt == 0) {
        return true;
    } else {
        return false;
    }
}

function setDay(t, sdate, edate) {// 일차를 파라메터로 받는다

    var now = new Date;
    if (( now.getMonth() + 1 ) < 10) {
        month = "0" + ( now.getMonth() + 1 );
    }
    else {
        month = ( now.getMonth() + 1 );
    }

    if (now.getDate() < 10) {
        date = "0" + now.getDate();
    }
    else {
        date = now.getDate();
    }

    var today = now.getFullYear() + "." + month + "." + date;// 현재날짜

    $('#' + edate).val(today);
    if (t == 'total')$('#' + sdate).val('');
    else $('#' + sdate).val(getThatday(today, t)); // 현재날짜와 일차를 파라미터로 보내서 결과리턴한다.

}

function diffDate(pStartDate, pEndDate) {
    var strSDT = new Date(pStartDate.substring(0, 4), pStartDate.substring(5, 7) - 1, pStartDate.substring(8, 10));
    var strEDT = new Date(pEndDate.substring(0, 4), pEndDate.substring(5, 7) - 1, pEndDate.substring(8, 10));
    return (strEDT.getTime() - strSDT.getTime()) / (1000 * 60 * 60 * 24);
}

// TEXTAREA 글자수 체크하기(jquery 파라미터 체크)
function textarea_length_chk(textAreaObj, field_name, limitLength) {
    if (textAreaObj == undefined || limitLength < 0) {
        return;
    }
    if (textAreaObj.val().length > limitLength) {
        alert(field_name + "는(은)  " + limitLength + "자 까지 입력 가능합니다.");
        textAreaObj.val(textAreaObj.val().substring(0, ( limitLength )));
        textAreaObj.focus();
        return false;
    }
    return true;
}

//TEXTAREA 글자수 체크하기 (일반 스크립트)
function text_length_chk(textObj, field_name, limitLength) {
    if (textObj == undefined || limitLength < 0) {
        return;
    }
    if (textObj.value.length > limitLength) {
        alert(field_name + "는(은)  " + limitLength + "자 까지 입력 가능합니다.");
        textObj.value = textObj.value.substring(0, ( limitLength ));
        textObj.focus();
        return false;
    }
    return true;
}

//TEXT BYTE 체크하기
function textarea_byte_chk(textAreaObj, field_name, limitByte) {

    var strVal = textAreaObj.val();
    var cnt = 0;

    for (var i = 0; i < strVal.length; i++) {
        if (strVal.charCodeAt(i) > 127)
            cnt += 2;
        else
            cnt += 1;

        if (cnt > (limitByte)) {
            alert(field_name + "는(은) " + limitByte + " bytes (한글 " + (limitByte / 2) + "자)까지 입력 가능합니다.");
            textAreaObj.val( strVal.substring(0, i) ) ;
            return false;
        }
    }
    return true;
}

function getThatday(today, t) { // 날짜, 일차를 파라메터로 받는다.
    var pdate = new Array();
    var pday = today.split("."); // 날짜를 구분자로 나누어 배열로 변환한다.
    var ptoday = new Date(pday[0], pday[1] - 1, pday[2]); // 데이트객체 생성한다.
    var ptimestamp = ptoday.valueOf() + 1000 * 60 * 60 * 24 * t; // t일후의 타임스탬프를 얻는다. 음수라면 이전날짜를 얻는다.
    var thatday = new Date(ptimestamp); // t일후의 날짜객체 생성한다.

    pdate[pdate.length] = thatday.getFullYear(); // 년

    if (thatday.getMonth() + 1 < 10) {
        pdate[pdate.length] = "0" + ( thatday.getMonth() + 1 ); // 월
    }
    else {
        pdate[pdate.length] = thatday.getMonth() + 1; // 월
    }

    if (thatday.getDate() < 10) {
        pdate[pdate.length] = "0" + thatday.getDate(); // 일
    }
    else {
        pdate[pdate.length] = thatday.getDate(); // 일
    }

    return pdate.join("."); // 배열을 / 구분자로 합쳐 스트링으로 변환후 반환
}

//이메일 체크
function checkEmail(addr) {
    var str = addr;
    var reg = /^((\w|[\-\.])+)@((\w|[\-\.][^(\.)\1])+)\.([A-Za-z]+)$/;
    if (str.search(reg) != -1) {
        return true;
    }
    return false;
}

function CheckPass(str) {
    var reg1 = /^[a-z0-9]{8,16}$/; // a-z 0-9 중에 8자리 부터 16자리만 허용
    var reg2 = /[a-z]/g;
    var reg3 = /[0-9]/g;
    return (reg1.test(str) && reg2.test(str) && reg3.test(str));
};

function removeHtml(text) {
	var text;
    text = text.replace(/<br>/ig, "\n"); // <br>을 엔터로 변경
    text = text.replace(/&nbsp;/ig, " "); // 공백
    // HTML 태그제거
    text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");

    // shkim.add.
    text = text.replace(/<(no)?script[^>]*>.*?<\/(no)?script>/ig, "");
    text = text.replace(/<style[^>]*>.*<\/style>/ig, "");
    text = text.replace(/<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>/ig, "");
    text = text.replace(/<\\w+\\s+[^<]*\\s*>/ig, "");
    text = text.replace(/&[^;]+;/ig, "");
    text = text.replace(/\\s\\s+/ig, "");

    return text;
}

function getFormData(form){ //form을 JSON으로 바꾸기
    var unindexed_array = form.serializeArray();
    var param = {};

    $(unindexed_array).each(function(i, v) {
        param[v.name] = v.value;
    });
    return JSON.stringify(param);
}

//레이어 팝업 열기, 닫기
function popOn(){
   $(".dimmed").show();
   $(".popup_container").show();
}
function popOff(){
   $(".dimmed").hide();
   $(".popup_container").hide();
}

function popLocate(target){
	   var nPopup = $(target).size();
	   for(i=0; i<nPopup; i++){
	      var popHeight = $(target).eq(i).height();
	      var bodyHeight = $("body").height();
	      if(popHeight < bodyHeight){
	         resizeNum = -(popHeight/2);
	         $(target).eq(i).css({
	            "position":"absolute", 
	            "margin-top":resizeNum.toFixed(0)+"px",
	            "top":"50%"
	         });
	      } else {
	         $(target).eq(i).css({
	            "position":"absolute", 
	            "margin-top":"0",
	            "top":"0px"
	         });
	      }
	   }
	}
	
function formValidationCheck(valCheck){
	for(var i in valCheck){
		if(textBoxValCheck(valCheck[i])){
			alertMessageSource(valCheck[i]); //alertMessageSource는 각 jsp 페이지에서 구현할 것
			focusInputTextBox(valCheck[i]);
			return false;
		}
	}
	return true;
}

function textBoxValCheck(id){
	var idVal = $.trim($('#' + id).val());
	if(idVal== null || idVal == ""){
		return true;
	}else{
		return false;
	}
}

function focusInputTextBox(id){
	$('#' + id).val("");
	$('#' + id).focus();	
}

//숫자체크
function fnNumberCheck(obj) {
	if (/[^0-9]/g.test(obj.value))  {
	    alert("숫자만 입력 가능합니다.");  
	    obj.focus();
	    obj.value = obj.value.replace(/[^0-9]/gi,'');
	    return false;
	}
	return true;
}

//오늘 날짜 yyyy-mm-dd 형태로 얻기
function getToday(){
	var today = new Date();
	var _year = today.getFullYear();	
	var _mon = today.getMonth()+1;
	var _date = today.getDate();
	
	if(_mon < 10)
		_mon = "0"+_mon+"";
	
	if(_date < 10)
		_date = "0"+_date+"";
	
	var _fulldate = _year + "-" + _mon + "-" + _date + "";
	
	return _fulldate;
}
//숫자로만 이루어진 휴대폰,내선 번호 체크
function hpValidation(num){
	
	if(!/^[0-9]{3}[0-9]{3,4}[0-9]{4}$/.test(num)){
		return false;
	}
	return true;
}
//내선 번호 체크
function telValidation(num){
	
	if(!/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(num)){
		return false;
	}
	return true;
}
//내선 번호 체크("-" 하이픈 제거)
function telValidation2(num){
	
	if(!/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/.test(num)){
		return false;
	}
	return true;
}
//이메일 체크
function emailValidation(email){

	if(!/\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/.test(email)) {
		return false;
	}
	return true;
}

function checkBizID(bizID)  //사업자등록번호 체크 
{ 
    // bizID는 숫자만 10자리로 해서 문자열로 넘긴다. 
    var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
    var tmpBizID, i, chkSum=0, c2, remander; 
     bizID = bizID.replace(/-/gi,''); 

     for (i=0; i<=7; i++) chkSum += checkID[i] * bizID.charAt(i); 
     c2 = "0" + (checkID[8] * bizID.charAt(8)); 
     c2 = c2.substring(c2.length - 2, c2.length); 
     chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
     remander = (10 - (chkSum % 10)) % 10 ; 

    if (Math.floor(bizID.charAt(9)) == remander) return true ; // OK! 
      return false; 
}

//수수료 체크
function percentCheck(commission) {
	var commissionArray = commission.split(".");
	
	var pattern = /^\d+(?:[.]?[\d]?[\d])?$/;
	
	if(parseInt(commissionArray[0]) > parseInt(100) || !pattern.test(commission)){
		return false;	
	}
	return true;
	
}


//치환
function replaceAll(str, searchStr, replaceStr) {
	while (str.indexOf(searchStr) != -1) {
		str = str.replace(searchStr, replaceStr);
	}
	return str;
}


function AddComma(data_value) {
	return Number(data_value).toLocaleString('en').split(".")[0];
}


//글자수 입력 제한 설정(text박스 id, 제한 길이)
function setTextLengthLimit(elementId, checkByte) {
	$(elementId).on('input', function() {
		var totalByte = 0;
		var message = $(this).val();
	    var limitMessageLength = '';

	    for(var i =0; i < message.length; i++) {
	    	totalByte += charByteSize(message.charAt(i));
	        
	    	if(totalByte == checkByte - 3){
	        	limitMessageLength = i;
	        }
	    	if(totalByte == checkByte - 2){
	        	limitMessageLength = i;
	        }
	    	if(totalByte == checkByte - 1){
	        	limitMessageLength = i;
	        }
	        if(totalByte == checkByte){
	        	limitMessageLength = i;
	        }
	     }
	     
	     if(totalByte > checkByte) {
	    	 $(elementId).val(message.substring(0, limitMessageLength + 1));
		 }
	});
}

function charByteSize(ch) {
	if (ch == null || ch.length == 0) {
		return 0;
	}

	var charCode = ch.charCodeAt(0);

	if (charCode <= 0x00007F) {
		return 1;
	} else if (charCode <= 0x0007FF) {
		return 2;
	} else if (charCode <= 0x00FFFF) {
		return 3;
	} else {
		return 4;
	}
}

/**
 * value 널 또는 공백 체크
 * true : null 또는 공백
 * false : 유효한 문자열
 * 
 * @param objId
 * @return
 */
function isEmpty(_str) {
	obj = String(_str);

	if(obj == null || obj == undefined || obj == "null" || obj == "undefined" || obj == "") return true;

	else return false;
}

/**
 * 오늘날짜 가져오기
 * 
 * @returns
 */
function getCurrentDate() {
	var now = new Date();
	var dateFormat = now.toISOString().substr(0,10);

	return dateFormat;
}



//<!--
//
//LCC DFS 좌표변환을 위한 기초 자료
//
var RE = 6371.00877; // 지구 반경(km)
var GRID = 5.0; // 격자 간격(km)
var SLAT1 = 30.0; // 투영 위도1(degree)
var SLAT2 = 60.0; // 투영 위도2(degree)
var OLON = 126.0; // 기준점 경도(degree)
var OLAT = 38.0; // 기준점 위도(degree)
var XO = 43; // 기준점 X좌표(GRID)
var YO = 136; // 기1준점 Y좌표(GRID)
//
//LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
//


function dfs_xy_conv(code, v1, v2) {
  var DEGRAD = Math.PI / 180.0;
  var RADDEG = 180.0 / Math.PI;

  var re = RE / GRID;
  var slat1 = SLAT1 * DEGRAD;
  var slat2 = SLAT2 * DEGRAD;
  var olon = OLON * DEGRAD;
  var olat = OLAT * DEGRAD;

  var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
  sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
  var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
  sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
  var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
  ro = re * sf / Math.pow(ro, sn);
  var rs = {};
  if (code == "toXY") {
      rs['lat'] = v1;
      rs['lng'] = v2;
      var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
      ra = re * sf / Math.pow(ra, sn);
      var theta = v2 * DEGRAD - olon;
      if (theta > Math.PI) theta -= 2.0 * Math.PI;
      if (theta < -Math.PI) theta += 2.0 * Math.PI;
      theta *= sn;
      rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
      rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
  }
  else {
      rs['x'] = v1;
      rs['y'] = v2;
      var xn = v1 - XO;
      var yn = ro - v2 + YO;
      ra = Math.sqrt(xn * xn + yn * yn);
      if (sn < 0.0) - ra;
      var alat = Math.pow((re * sf / ra), (1.0 / sn));
      alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

      if (Math.abs(xn) <= 0.0) {
          theta = 0.0;
      }
      else {
          if (Math.abs(yn) <= 0.0) {
              theta = Math.PI * 0.5;
              if (xn < 0.0) - theta;
          }
          else theta = Math.atan2(xn, yn);
      }
      var alon = theta / sn + olon;
      rs['lat'] = alat * RADDEG;
      rs['lng'] = alon * RADDEG;
  }
  return rs;
}

//-->

// 현재시간 YYYYMMDDHHMMSS
Date.prototype.YYYYMMDDHHMMSS = function () {
    var yyyy = this.getFullYear().toString();
    var MM = pad(this.getMonth() + 1,2);
    var dd = pad(this.getDate(), 2);
    var hh = pad(this.getHours(), 2);
    var mm = pad(this.getMinutes(), 2)
    var ss = pad(this.getSeconds(), 2)

    return yyyy + MM + dd+  hh + mm + ss;
};

function getDate() {
    d = new Date();
    return d.YYYYMMDDHHMMSS();
}

function pad(number, length) {

    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }

    return str;

}