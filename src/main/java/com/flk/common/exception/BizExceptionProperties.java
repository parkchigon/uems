package com.flk.common.exception;

/**
 * Exception 처리를 담당한다. <br />
 * 생성자의 인자는 message.properties에 등록된 메세지 코드이다. <br />
 * message.properties 파일을 사용하지 않을 경우 BizException 클래스를 사용한다. <br />
 * @author JoAhra
 *
 */
public class BizExceptionProperties extends Exception {

	private static final long serialVersionUID = -2621451172479838641L;

	/**
	 * Exception 정의
	 */
	protected Exception exception;

	protected String code;
	protected String msg;
	protected String resultCode;
	protected String[] msgArgs;
	
	public BizExceptionProperties() {
		super();
		this.exception = null;
	}

	public BizExceptionProperties(String code) {
		super();
		this.code = code;
		this.resultCode = getResultCode(code);
		this.exception = null;
	}
	
	public BizExceptionProperties(String code, String[] msgArgs) {
		super();
		this.code = code;
		this.msgArgs = msgArgs;
		this.resultCode = getResultCode(code);
		this.exception = null;
	}

	public BizExceptionProperties(Exception e) {
		super();
		this.exception = e;
	}

	public BizExceptionProperties(String msg, Exception e) {
		super(msg);
		this.exception = e;
		this.msg = msg;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String[] getMsgArgs() {
		return msgArgs;
	}

	public void setMsgArgs(String[] msgArgs) {
		this.msgArgs = msgArgs;
	}


	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultCode(String code) {
		String[] msgCodeArray = code.split("\\.");
		if(msgCodeArray.length == 3) {
			return msgCodeArray[2];
		}
		
		return "";
	}
}

