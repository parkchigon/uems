package com.flk.mng.comm.domain;

import com.flk.common.utility.PageUtil;

public class Comm {

	
	/** pc 아이디 */
	private String pcId; 
	/** 사이트(지점) 코드 예) BE001 BS001 */
	private String siteCd;
	/** PLC 포트설명 (site별 unique) */
	private String pcName;
	/** 프로토콜 드라이버명칭 (DLL-XGT Serial) */
	private String plcProtocolCd; 
	/** 프로토콜 드라이버명칭 (DLL-XGT Serial) */
	private String plcProtocolName; 
	/** 읽기시간초과 [millisecond] */
	private String plcExceedRead;
	/** 쓰기시간초과 [millisecond] */
	private String plcExceedWrite;
	/** 포트번호 */
	private String comPortCd;
	/** 포트번호 이름 */
	private String comPortName;
	/** 포트속도 */
	private String comBaudCd;
	/** 포트속도 이름 */
	private String comBaudName;
	/** 데이터비트 */
	private String comBitDataCd;
	/** 패리티비트 */
	private String comBitParityCd;
	/** 스톱비트 */
	private String comBitStopCd;
	/** Tx 흐름제어 */
	private String comTxCtrlCd;
	/** Rx 흐름제어 */
	private String comRxCtrlCd;
	/** WORD크기 */
	private String plcWordSize;
	/** FLOAT크기 */
	private String plcFloatSize;
	/** DWORD크기 */
	private String plcDwordSize;
	/** STRING크기 */
	private String plcStringSize;
	/** DOUBLE크기 */
	private String plcDoubleSize;
	/** INT64크기 */
	private String plcInt64Size;
	/** PLC Address */
	private String plcMemoryPosition;
	/** 사용여부 */
	private String useFlag;
	/** 변경사용자 ID */
	private String updateId;
	/** 변경 일자 */
	private String updateDate;
	/** 등록사용자 ID */
	private String regId;
	/** 등록 일자 */
	private String regDate;

	
	
	
	/** 지점 아이디*/
	private String siteId;
	/** 지점 명*/
	private String siteName;
	/** 지점 설명 */
	private String siteDesc;
	/** 현장  IP Address */
	private String siteIp;
	/** 회사법인번호 */
	private String companyNo;
	/** 현장 주소 */
	private String address;
	/** 지역코드 */
	private String regionCd;
	/** 지역코드명 */
	private String regionCdName;
	/** 연면적 */
	private String totalArea;
	/** 연면적 */
	private String iceSystemSdate;
	/** 담당자 이름 */
	private String chargePersonName;
	/** 담당자 전화번호 */
	private String chargePersonTel;
	/** 기술운영팀 전화번호 */
	private String techOperationTel;
	/** 전화번호 */
	private String telNo;
	/** 지점 위도 */
	private String regionX;
	/** 지점 경도 */
	private String regionY;
	/** 지점 그룹 아이디 */
	private String sgId;
	/** 지점 그룹 명 */
	private String sgName;
	
	
	
	
	
	
	
	
	
	
	/** 페이지 사이즈 */
	private String listSize;
	/** 첫 페이지 */
	private int firstIndex;
	/** 마지막 페이지 */
	private int lastIndex;
	/** 페이지 유틸 */
	private PageUtil Pageutil;
	/** 현재 페이지 */
	private String currPage;
	public String getPcId() {
		return pcId;
	}
	public void setPcId(String pcId) {
		this.pcId = pcId;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getPcName() {
		return pcName;
	}
	public void setPcName(String pcName) {
		this.pcName = pcName;
	}
	public String getPlcProtocolCd() {
		return plcProtocolCd;
	}
	public void setPlcProtocolCd(String plcProtocolCd) {
		this.plcProtocolCd = plcProtocolCd;
	}
	public String getPlcProtocolName() {
		return plcProtocolName;
	}
	public void setPlcProtocolName(String plcProtocolName) {
		this.plcProtocolName = plcProtocolName;
	}
	public String getPlcExceedRead() {
		return plcExceedRead;
	}
	public void setPlcExceedRead(String plcExceedRead) {
		this.plcExceedRead = plcExceedRead;
	}
	public String getPlcExceedWrite() {
		return plcExceedWrite;
	}
	public void setPlcExceedWrite(String plcExceedWrite) {
		this.plcExceedWrite = plcExceedWrite;
	}
	public String getComPortCd() {
		return comPortCd;
	}
	public void setComPortCd(String comPortCd) {
		this.comPortCd = comPortCd;
	}
	public String getComPortName() {
		return comPortName;
	}
	public void setComPortName(String comPortName) {
		this.comPortName = comPortName;
	}
	public String getComBaudCd() {
		return comBaudCd;
	}
	public void setComBaudCd(String comBaudCd) {
		this.comBaudCd = comBaudCd;
	}
	public String getComBaudName() {
		return comBaudName;
	}
	public void setComBaudName(String comBaudName) {
		this.comBaudName = comBaudName;
	}
	public String getComBitDataCd() {
		return comBitDataCd;
	}
	public void setComBitDataCd(String comBitDataCd) {
		this.comBitDataCd = comBitDataCd;
	}
	public String getComBitParityCd() {
		return comBitParityCd;
	}
	public void setComBitParityCd(String comBitParityCd) {
		this.comBitParityCd = comBitParityCd;
	}
	public String getComBitStopCd() {
		return comBitStopCd;
	}
	public void setComBitStopCd(String comBitStopCd) {
		this.comBitStopCd = comBitStopCd;
	}
	public String getComTxCtrlCd() {
		return comTxCtrlCd;
	}
	public void setComTxCtrlCd(String comTxCtrlCd) {
		this.comTxCtrlCd = comTxCtrlCd;
	}
	public String getComRxCtrlCd() {
		return comRxCtrlCd;
	}
	public void setComRxCtrlCd(String comRxCtrlCd) {
		this.comRxCtrlCd = comRxCtrlCd;
	}
	public String getPlcWordSize() {
		return plcWordSize;
	}
	public void setPlcWordSize(String plcWordSize) {
		this.plcWordSize = plcWordSize;
	}
	public String getPlcFloatSize() {
		return plcFloatSize;
	}
	public void setPlcFloatSize(String plcFloatSize) {
		this.plcFloatSize = plcFloatSize;
	}
	public String getPlcDwordSize() {
		return plcDwordSize;
	}
	public void setPlcDwordSize(String plcDwordSize) {
		this.plcDwordSize = plcDwordSize;
	}
	public String getPlcStringSize() {
		return plcStringSize;
	}
	public void setPlcStringSize(String plcStringSize) {
		this.plcStringSize = plcStringSize;
	}
	public String getPlcDoubleSize() {
		return plcDoubleSize;
	}
	public void setPlcDoubleSize(String plcDoubleSize) {
		this.plcDoubleSize = plcDoubleSize;
	}
	public String getPlcInt64Size() {
		return plcInt64Size;
	}
	public void setPlcInt64Size(String plcInt64Size) {
		this.plcInt64Size = plcInt64Size;
	}
	public String getPlcMemoryPosition() {
		return plcMemoryPosition;
	}
	public void setPlcMemoryPosition(String plcMemoryPosition) {
		this.plcMemoryPosition = plcMemoryPosition;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSiteDesc() {
		return siteDesc;
	}
	public void setSiteDesc(String siteDesc) {
		this.siteDesc = siteDesc;
	}
	public String getSiteIp() {
		return siteIp;
	}
	public void setSiteIp(String siteIp) {
		this.siteIp = siteIp;
	}
	public String getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRegionCd() {
		return regionCd;
	}
	public void setRegionCd(String regionCd) {
		this.regionCd = regionCd;
	}
	public String getRegionCdName() {
		return regionCdName;
	}
	public void setRegionCdName(String regionCdName) {
		this.regionCdName = regionCdName;
	}
	public String getTotalArea() {
		return totalArea;
	}
	public void setTotalArea(String totalArea) {
		this.totalArea = totalArea;
	}
	public String getIceSystemSdate() {
		return iceSystemSdate;
	}
	public void setIceSystemSdate(String iceSystemSdate) {
		this.iceSystemSdate = iceSystemSdate;
	}
	public String getChargePersonName() {
		return chargePersonName;
	}
	public void setChargePersonName(String chargePersonName) {
		this.chargePersonName = chargePersonName;
	}
	public String getChargePersonTel() {
		return chargePersonTel;
	}
	public void setChargePersonTel(String chargePersonTel) {
		this.chargePersonTel = chargePersonTel;
	}
	public String getTechOperationTel() {
		return techOperationTel;
	}
	public void setTechOperationTel(String techOperationTel) {
		this.techOperationTel = techOperationTel;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public String getRegionX() {
		return regionX;
	}
	public void setRegionX(String regionX) {
		this.regionX = regionX;
	}
	public String getRegionY() {
		return regionY;
	}
	public void setRegionY(String regionY) {
		this.regionY = regionY;
	}
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
	}
	public String getSgName() {
		return sgName;
	}
	public void setSgName(String sgName) {
		this.sgName = sgName;
	}
	public String getListSize() {
		return listSize;
	}
	public void setListSize(String listSize) {
		this.listSize = listSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public PageUtil getPageutil() {
		return Pageutil;
	}
	public void setPageutil(PageUtil pageutil) {
		Pageutil = pageutil;
	}
	public String getCurrPage() {
		return currPage;
	}
	public void setCurrPage(String currPage) {
		this.currPage = currPage;
	}
	
	
	
	
}
