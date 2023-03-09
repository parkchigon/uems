package com.flk.system.code.domain;

import java.io.Serializable;
import java.util.ArrayList;

public class Code implements Serializable{

	/**
	 *  코드 전체겅의
	 */
	private static final long serialVersionUID = -7794891471504883697L;
	/** 코드아이디  */
	private String codeId = "";
	/** 코드사용명 */
	private String codeUseName = "";
	/** 코드세부구분 */
	private String codeDetailDivision = "";
	/** 코드명 */
	private String codeName = "";
	/** 부모코드아이디 */
	private String parentCodeId = "";
	/** 시스템코드여부 */
	private String systemCodeYn = "";
	/** 사용여부 */
	private String useYn = "";
	/** 삭제여부 */
	private String deleteYn = "";
	/** 코드내용 */
	private String codeContent = "";
	/** 정렬 순서*/
	private String sortNum;

	/** 코드아이디리스트 */
	private ArrayList<String> codeIds;
	
	/** 등록아이디 */
	private String regId = "";

	/** 수정아이디 */
	private String updateId = "";

	/** 등록일시 */
	private String regDate = "";
	/** 수정일시 */
	private String updateDate = "";
	
	private String parentCodeUseName;
	
	
	public String getParentCodeUseName() {
		return parentCodeUseName;
	}
	public void setParentCodeUseName(String parentCodeUseName) {
		this.parentCodeUseName = parentCodeUseName;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeUseName() {
		return codeUseName;
	}
	public void setCodeUseName(String codeUseName) {
		this.codeUseName = codeUseName;
	}
	public String getCodeDetailDivision() {
		return codeDetailDivision;
	}
	public void setCodeDetailDivision(String cdDetailDiv) {
		this.codeDetailDivision = cdDetailDiv;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getParentCodeId() {
		return parentCodeId;
	}
	public void setParentCodeId(String parentCodeId) {
		this.parentCodeId = parentCodeId;
	}
	public String getSystemCodeYn() {
		return systemCodeYn;
	}
	public void setSystemCodeYn(String systemCodeYn) {
		this.systemCodeYn = systemCodeYn;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getCodeContent() {
		return codeContent;
	}
	public void setCodeContent(String codeContent) {
		this.codeContent = codeContent;
	}
	public ArrayList<String> getCodeIds() {
		return codeIds;
	}
	public void setCodeIds(ArrayList<String> codeIds) {
		this.codeIds = codeIds;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getSortNum() {
		return sortNum;
	}
	public void setSortNum(String sortNum) {
		this.sortNum = sortNum;
	}
	

}
