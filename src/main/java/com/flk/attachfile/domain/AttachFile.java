package com.flk.attachfile.domain;

import java.io.Serializable;

/**
 * 
 * 파일 첨부 도메인
 *
 */
public class AttachFile implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/** 파일 아이디 */
	private String fileId;
	/** 파일 명 */
	private String fileName;
	/** 파일 확장자 */
	private String fileExtension;
	/** 파일 물리 경로 */
	private String filePhysicalPath;
	/** 파일 사이즈 */
	private String fileSize;
	/** 파일 참조 아이디 */
	private String fileReferenceId;
	/** 파일 그룹 */
	private String fileGroup;
	/** 등록 아이디 */
	private String regId;
	/** 대표 여부 */
	private String delegateYn;
	/** 이미지 실 경로 */
	private String fileRealPath;
	/** 파일 다운 수 */
	private String fileDownCount;
	/** 이미지 원본 경로 */
	private String fileOrgPath;
	
	/** 이미지 세로 */
	private String imgHeight;
	/** 이미지 가로 */
	private String imgWidth;
	/** 수정 타입 */
	private String editorType;
	/** 접근 아이피 */
	private String accessIp;
	/** 이전 파일 아이디 */
	private String oldFileId; // 파일 복사용 이전 파일 아이디(상품 복사)
	/**전체 파일 갯수 */
	private String fileTotalCnt;
	/** folder 저장할 Path */
	private String folder;
	/** JSON 파일 */
	private String fileset;
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileExtension() {
		return fileExtension;
	}
	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}
	public String getFilePhysicalPath() {
		return filePhysicalPath;
	}
	public void setFilePhysicalPath(String filePhysicalPath) {
		this.filePhysicalPath = filePhysicalPath;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileReferenceId() {
		return fileReferenceId;
	}
	public void setFileReferenceId(String fileReferenceId) {
		this.fileReferenceId = fileReferenceId;
	}
	public String getFileGroup() {
		return fileGroup;
	}
	public void setFileGroup(String fileGroup) {
		this.fileGroup = fileGroup;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getDelegateYn() {
		return delegateYn;
	}
	public void setDelegateYn(String delegateYn) {
		this.delegateYn = delegateYn;
	}
	public String getFileRealPath() {
		return fileRealPath;
	}
	public void setFileRealPath(String fileRealPath) {
		this.fileRealPath = fileRealPath;
	}
	public String getFileDownCount() {
		return fileDownCount;
	}
	public void setFileDownCount(String fileDownCount) {
		this.fileDownCount = fileDownCount;
	}
	public String getFileOrgPath() {
		return fileOrgPath;
	}
	public void setFileOrgPath(String fileOrgPath) {
		this.fileOrgPath = fileOrgPath;
	}
	public String getImgHeight() {
		return imgHeight;
	}
	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}
	public String getImgWidth() {
		return imgWidth;
	}
	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}
	public String getEditorType() {
		return editorType;
	}
	public void setEditorType(String editorType) {
		this.editorType = editorType;
	}
	public String getAccessIp() {
		return accessIp;
	}
	public void setAccessIp(String accessIp) {
		this.accessIp = accessIp;
	}
	public String getOldFileId() {
		return oldFileId;
	}
	public void setOldFileId(String oldFileId) {
		this.oldFileId = oldFileId;
	}
	public String getFileTotalCnt() {
		return fileTotalCnt;
	}
	public void setFileTotalCnt(String fileTotalCnt) {
		this.fileTotalCnt = fileTotalCnt;
	}
	public String getFolder() {
		return folder;
	}
	public void setFolder(String folder) {
		this.folder = folder;
	}
	public String getFileset() {
		return fileset;
	}
	public void setFileset(String fileset) {
		this.fileset = fileset;
	}
	
}