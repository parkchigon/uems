package com.flk.common.exception;

public class FileDownloadException extends RuntimeException {

	private static final long serialVersionUID = 8588489638033167927L;
	
	public FileDownloadException() {
		super();
	}

	public FileDownloadException(String msg) {
		super(msg);
	}
}
