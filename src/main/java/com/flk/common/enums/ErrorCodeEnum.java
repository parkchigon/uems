package com.flk.common.enums;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.flk.common.utility.MessageAccessUtil;


/**
 * DB로 관리하기 힘든경우 공통된 오류 메시지를 관리를 위한 열거형
 * ErrorCodeEnum.SUCCESS.getCode(); -> 코드 반환
 * ErrorCodeEnum.SUCCESS.getMessage(); -> 해당 코드에 대한 메시지 반환(message.properties 파일에서 반환)
 * 
 * @author JoAhra
 *
 */
public enum ErrorCodeEnum {
    // 처리성공 코드
    SUCCESS("info.code.0000"),
    // 필수값 미입력
    NOT_PARAMETER("error.code.1001"),
    // 처리실패 코드(처리도중 오류가 발생했습니다.)
    FAIL("error.code.1002"),
    // 지원하지않는 Method 요청
    NOT_METHOD("error.code.1003"),
    // 잘못된 Content_Type 요청
    NOT_CONTENT_TYPE("error.code.1004"),
    // 잘못된 요청
    BAD_REQUEST("error.code.1005"),
    // NOT FOUND
    NOT_FOUND("error.code.1006"),
    // 아이디 또는 비밀번호가 틀렸을 경우
    LOGIN_ERR_INVALID_ID_PASSWORD("error.code.2001"),
    // 운영자 권한이 아닐경우
    NOT_ADMIN_ROLE("error.code.2002"),
    ;

    private String code;

    private ErrorCodeEnum(String code) {
        this.code = code;
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getResultCode() {
		String[] msgCodeArray = this.code.split("\\.");
		if(msgCodeArray.length == 3) {
			return msgCodeArray[2];
		}
		return "";
	}
	
	public String getMessage() {
		String message = "";
		try {
			// 메시지 액세스 유틸 가져오기
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			HttpSession session = request.getSession();
			ServletContext conext = session.getServletContext();
			WebApplicationContext wContext = WebApplicationContextUtils.getWebApplicationContext(conext);
			MessageAccessUtil messageUtil = (MessageAccessUtil)wContext.getBean("message");
			
			message = messageUtil.getMessage(this.code);
		} catch(Exception ex) {
		}
		
		return message;
	}
}
