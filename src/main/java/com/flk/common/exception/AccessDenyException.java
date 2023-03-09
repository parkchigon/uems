package com.flk.common.exception;

/**
 * 
 * 접근 제한 예외
 *
 */
public class AccessDenyException extends RuntimeException {

	private static final long serialVersionUID = -2310235629517721586L;

	public AccessDenyException() {
		super();
	}

	public AccessDenyException(String msg) {
		super(msg);
	}
	
}
