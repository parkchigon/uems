package com.flk.common.exception;

/**
 * 
 * 권한 제한 예외
 *
 */
public class RoleDenyException extends RuntimeException {

	private static final long serialVersionUID = -2310235629517721586L;

	public RoleDenyException() {
		super();
	}

	public RoleDenyException(String msg) {
		super(msg);
	}
}
