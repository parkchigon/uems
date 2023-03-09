package com.flk.api.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * 관리자 정보 도메인
 *
 */
public class File implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** 관리자 아이디 */
	private String mngId;
	/** 지점 아이디 */
	private String siteId;
	/** 설비 종류 */
	private String facilityKind;
	/** 설비 아이디 */
	private String facilityId;
	/** 점검항목 아이디 */
	private String checkId;
	/** 파일1 */
	private MultipartFile uploadFile1;
	/** 파일2 */
	private MultipartFile uploadFile2;
	/** 파일3 */
	private MultipartFile uploadFile3;
	/** 파일4 */
	private MultipartFile uploadFile4;
	/** 파일5 */
	private MultipartFile uploadFile5;
	/** 파일 서버 저장 경로 */
	private String filePath;
	/** 파일명 */
	private String fileName;
	/** 사진등록일 */
	private String regDate;
	/** 등록 아이디 */
	private String regId;
	/** 수징일 */
	private String updateDate;
	/** 수정아이디 */
	private String updateId;
	/** 사용여부 */
	private String useFlag;
	private String msqId;
	private String msId;
	private String chkMonth;
	private String subFacilityId;
	private String mfqId;

	
	public String getMfqId() {
		return mfqId;
	}
	public void setMfqId(String mfqId) {
		this.mfqId = mfqId;
	}
	public String getSubFacilityId() {
		return subFacilityId;
	}
	public void setSubFacilityId(String subFacilityId) {
		this.subFacilityId = subFacilityId;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getMsqId() {
		return msqId;
	}
	public void setMsqId(String msqId) {
		this.msqId = msqId;
	}
	public String getMsId() {
		return msId;
	}
	public void setMsId(String msId) {
		this.msId = msId;
	}
	public String getChkMonth() {
		return chkMonth;
	}
	public void setChkMonth(String chkMonth) {
		this.chkMonth = chkMonth;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getFacilityKind() {
		return facilityKind;
	}
	public void setFacilityKind(String facilityKind) {
		this.facilityKind = facilityKind;
	}
	public String getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}
	public String getCheckId() {
		return checkId;
	}
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}
	public MultipartFile getUploadFile1() {
		return uploadFile1;
	}
	public void setUploadFile1(MultipartFile uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}
	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}
	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}
	public MultipartFile getUploadFile3() {
		return uploadFile3;
	}
	public void setUploadFile3(MultipartFile uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}
	public MultipartFile getUploadFile4() {
		return uploadFile4;
	}
	public void setUploadFile4(MultipartFile uploadFile4) {
		this.uploadFile4 = uploadFile4;
	}
	public MultipartFile getUploadFile5() {
		return uploadFile5;
	}
	public void setUploadFile5(MultipartFile uploadFile5) {
		this.uploadFile5 = uploadFile5;
	}
	
	
}
