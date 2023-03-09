package com.flk.ems.system.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flk.common.utility.PageUtil;

public class Tag {
	private String siteCd;
	private String tagId;
	private String tagTypeCd;
	private String tagKindCd;
	private String tagName;
	private String tagDesc;
	private String tagConnTypeCd;
	private String iPlcscanAddress;
	private String iScanTime;
	private String aiMemtypeCd;
	private String aiUnitCd;
	private String aiDisplayFormat;
	private String aiCalcFilterCd;
	private String aConvertBase;
	private String aConvertFull;
	private String aConvertPlcbase;
	private String aConvertPlcfull;
	private String aiCalcScript;
	private String aCutoverValueCd;
	private String dOnDescription;
	private String dOffDescription;
	private String iAlarmUseFlag;
	private String aiAlarmHihi;
	private String aiAlarmHigh;
	private String aiAlarmLow;
	private String aiAlarmLolo;
	private String aiAlarmTypeCd;
	private String diAlarmTypeCd;
	private String iAlarmImgCd;
	private String iAlarmWavCd;
	private String aiAlarmProtectPercent;
	private String aiAlarmProtectSecond;
	private String iAlarmPriorityCd;
	private String iDataSaveFlag;
	private String iOutputUseFlag;
	private String oPlcscanStation;
	private String oPlcscanAddress;
	private String oPlcscanExtra1;
	private String oPlcscanExtra2;
	private String aoCalcFilterCd;
	private String aoCalcScript;
	private String doRelayTypeCd;
	private String doRelayPulseSec;
	private String doDelayOnSec;
	private String doDelayOffSec;
	private String useFlag;
	private String updateId;
	private String updateDate;
	private String regId;
	private String regDate;
	private String pcId;
	private String sgId;
	private String sgName;
	private String siteName;
	private String tagAiUnitCdNm;
	private String tagKindCdNm;
	private String oPlcscan;
	private String dailyRecordFlag;
	private String aiAccumulateFlag;
	
	private String tagTypeCdName;
	
	private String orderColumn;
	private String orderType;
	private String registYn;
	private List<String> tagIdArr;
	private List<String> siteCdArr;
	
	/** 검색조건 검색값 */
	private String searchKeyword;
	/** 검색조건 검색항목 */
	private String searchCondition;
	
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
	
	private MultipartFile uploadFile;
	
	public List<String> getSiteCdArr() {
		return siteCdArr;
	}
	public void setSiteCdArr(List<String> siteCdArr) {
		this.siteCdArr = siteCdArr;
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
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getTagAiUnitCdNm() {
		return tagAiUnitCdNm;
	}
	public void setTagAiUnitCdNm(String tagAiUnitCdNm) {
		this.tagAiUnitCdNm = tagAiUnitCdNm;
	}
	public String getTagKindCdNm() {
		return tagKindCdNm;
	}
	public void setTagKindCdNm(String tagKindCdNm) {
		this.tagKindCdNm = tagKindCdNm;
	}
	public String getoPlcscan() {
		return oPlcscan;
	}
	public void setoPlcscan(String oPlcscan) {
		this.oPlcscan = oPlcscan;
	}
	public String getDailyRecordFlag() {
		return dailyRecordFlag;
	}
	public void setDailyRecordFlag(String dailyRecordFlag) {
		this.dailyRecordFlag = dailyRecordFlag;
	}
	public String getAiAccumulateFlag() {
		return aiAccumulateFlag;
	}
	public void setAiAccumulateFlag(String aiAccumulateFlag) {
		this.aiAccumulateFlag = aiAccumulateFlag;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
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
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getTagTypeCd() {
		return tagTypeCd;
	}
	public void setTagTypeCd(String tagTypeCd) {
		this.tagTypeCd = tagTypeCd;
	}
	public String getTagKindCd() {
		return tagKindCd;
	}
	public void setTagKindCd(String tagKindCd) {
		this.tagKindCd = tagKindCd;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getTagDesc() {
		return tagDesc;
	}
	public void setTagDesc(String tagDesc) {
		this.tagDesc = tagDesc;
	}
	public String getTagConnTypeCd() {
		return tagConnTypeCd;
	}
	public void setTagConnTypeCd(String tagConnTypeCd) {
		this.tagConnTypeCd = tagConnTypeCd;
	}
	public String getiPlcscanAddress() {
		return iPlcscanAddress;
	}
	public void setiPlcscanAddress(String iPlcscanAddress) {
		this.iPlcscanAddress = iPlcscanAddress;
	}
	public String getiScanTime() {
		return iScanTime;
	}
	public void setiScanTime(String iScanTime) {
		this.iScanTime = iScanTime;
	}
	public String getAiMemtypeCd() {
		return aiMemtypeCd;
	}
	public void setAiMemtypeCd(String aiMemtypeCd) {
		this.aiMemtypeCd = aiMemtypeCd;
	}
	public String getAiDisplayFormat() {
		return aiDisplayFormat;
	}
	public void setAiDisplayFormat(String aiDisplayFormat) {
		this.aiDisplayFormat = aiDisplayFormat;
	}
	public String getAiCalcFilterCd() {
		return aiCalcFilterCd;
	}
	public void setAiCalcFilterCd(String aiCalcFilterCd) {
		this.aiCalcFilterCd = aiCalcFilterCd;
	}
	public String getaConvertBase() {
		return aConvertBase;
	}
	public void setaConvertBase(String aConvertBase) {
		this.aConvertBase = aConvertBase;
	}
	public String getaConvertFull() {
		return aConvertFull;
	}
	public void setaConvertFull(String aConvertFull) {
		this.aConvertFull = aConvertFull;
	}
	public String getaConvertPlcbase() {
		return aConvertPlcbase;
	}
	public void setaConvertPlcbase(String aConvertPlcbase) {
		this.aConvertPlcbase = aConvertPlcbase;
	}
	public String getaConvertPlcfull() {
		return aConvertPlcfull;
	}
	public void setaConvertPlcfull(String aConvertPlcfull) {
		this.aConvertPlcfull = aConvertPlcfull;
	}
	public String getAiCalcScript() {
		return aiCalcScript;
	}
	public void setAiCalcScript(String aiCalcScript) {
		this.aiCalcScript = aiCalcScript;
	}
	public String getaCutoverValueCd() {
		return aCutoverValueCd;
	}
	public void setaCutoverValueCd(String aCutoverValueCd) {
		this.aCutoverValueCd = aCutoverValueCd;
	}
	public String getdOnDescription() {
		return dOnDescription;
	}
	public void setdOnDescription(String dOnDescription) {
		this.dOnDescription = dOnDescription;
	}
	public String getdOffDescription() {
		return dOffDescription;
	}
	public void setdOffDescription(String dOffDescription) {
		this.dOffDescription = dOffDescription;
	}
	public String getiAlarmUseFlag() {
		return iAlarmUseFlag;
	}
	public void setiAlarmUseFlag(String iAlarmUseFlag) {
		this.iAlarmUseFlag = iAlarmUseFlag;
	}
	public String getAiAlarmHihi() {
		return aiAlarmHihi;
	}
	public void setAiAlarmHihi(String aiAlarmHihi) {
		this.aiAlarmHihi = aiAlarmHihi;
	}
	public String getAiAlarmHigh() {
		return aiAlarmHigh;
	}
	public void setAiAlarmHigh(String aiAlarmHigh) {
		this.aiAlarmHigh = aiAlarmHigh;
	}
	public String getAiAlarmLow() {
		return aiAlarmLow;
	}
	public void setAiAlarmLow(String aiAlarmLow) {
		this.aiAlarmLow = aiAlarmLow;
	}
	public String getAiAlarmLolo() {
		return aiAlarmLolo;
	}
	public void setAiAlarmLolo(String aiAlarmLolo) {
		this.aiAlarmLolo = aiAlarmLolo;
	}
	public String getAiAlarmTypeCd() {
		return aiAlarmTypeCd;
	}
	public void setAiAlarmTypeCd(String aiAlarmTypeCd) {
		this.aiAlarmTypeCd = aiAlarmTypeCd;
	}
	public String getDiAlarmTypeCd() {
		return diAlarmTypeCd;
	}
	public void setDiAlarmTypeCd(String diAlarmTypeCd) {
		this.diAlarmTypeCd = diAlarmTypeCd;
	}
	public String getiAlarmImgCd() {
		return iAlarmImgCd;
	}
	public void setiAlarmImgCd(String iAlarmImgCd) {
		this.iAlarmImgCd = iAlarmImgCd;
	}
	public String getiAlarmWavCd() {
		return iAlarmWavCd;
	}
	public void setiAlarmWavCd(String iAlarmWavCd) {
		this.iAlarmWavCd = iAlarmWavCd;
	}
	public String getAiAlarmProtectPercent() {
		return aiAlarmProtectPercent;
	}
	public void setAiAlarmProtectPercent(String aiAlarmProtectPercent) {
		this.aiAlarmProtectPercent = aiAlarmProtectPercent;
	}
	public String getAiAlarmProtectSecond() {
		return aiAlarmProtectSecond;
	}
	public void setAiAlarmProtectSecond(String aiAlarmProtectSecond) {
		this.aiAlarmProtectSecond = aiAlarmProtectSecond;
	}
	public String getiAlarmPriorityCd() {
		return iAlarmPriorityCd;
	}
	public void setiAlarmPriorityCd(String iAlarmPriorityCd) {
		this.iAlarmPriorityCd = iAlarmPriorityCd;
	}
	public String getiDataSaveFlag() {
		return iDataSaveFlag;
	}
	public void setiDataSaveFlag(String iDataSaveFlag) {
		this.iDataSaveFlag = iDataSaveFlag;
	}
	public String getiOutputUseFlag() {
		return iOutputUseFlag;
	}
	public void setiOutputUseFlag(String iOutputUseFlag) {
		this.iOutputUseFlag = iOutputUseFlag;
	}
	public String getoPlcscanStation() {
		return oPlcscanStation;
	}
	public void setoPlcscanStation(String oPlcscanStation) {
		this.oPlcscanStation = oPlcscanStation;
	}
	public String getoPlcscanAddress() {
		return oPlcscanAddress;
	}
	public void setoPlcscanAddress(String oPlcscanAddress) {
		this.oPlcscanAddress = oPlcscanAddress;
	}
	public String getoPlcscanExtra1() {
		return oPlcscanExtra1;
	}
	public void setoPlcscanExtra1(String oPlcscanExtra1) {
		this.oPlcscanExtra1 = oPlcscanExtra1;
	}
	public String getoPlcscanExtra2() {
		return oPlcscanExtra2;
	}
	public void setoPlcscanExtra2(String oPlcscanExtra2) {
		this.oPlcscanExtra2 = oPlcscanExtra2;
	}
	public String getAoCalcFilterCd() {
		return aoCalcFilterCd;
	}
	public void setAoCalcFilterCd(String aoCalcFilterCd) {
		this.aoCalcFilterCd = aoCalcFilterCd;
	}
	public String getAoCalcScript() {
		return aoCalcScript;
	}
	public void setAoCalcScript(String aoCalcScript) {
		this.aoCalcScript = aoCalcScript;
	}
	public String getDoRelayTypeCd() {
		return doRelayTypeCd;
	}
	public void setDoRelayTypeCd(String doRelayTypeCd) {
		this.doRelayTypeCd = doRelayTypeCd;
	}
	public String getDoRelayPulseSec() {
		return doRelayPulseSec;
	}
	public void setDoRelayPulseSec(String doRelayPulseSec) {
		this.doRelayPulseSec = doRelayPulseSec;
	}
	public String getDoDelayOnSec() {
		return doDelayOnSec;
	}
	public void setDoDelayOnSec(String doDelayOnSec) {
		this.doDelayOnSec = doDelayOnSec;
	}
	public String getDoDelayOffSec() {
		return doDelayOffSec;
	}
	public void setDoDelayOffSec(String doDelayOffSec) {
		this.doDelayOffSec = doDelayOffSec;
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
	public String getPcId() {
		return pcId;
	}
	public void setPcId(String pcId) {
		this.pcId = pcId;
	}
	public String getTagTypeCdName() {
		return tagTypeCdName;
	}
	public void setTagTypeCdName(String tagTypeCdName) {
		this.tagTypeCdName = tagTypeCdName;
	}
	public String getAiUnitCd() {
		return aiUnitCd;
	}
	public void setAiUnitCd(String aiUnitCd) {
		this.aiUnitCd = aiUnitCd;
	}
	public String getOrderColumn() {
		return orderColumn;
	}
	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getRegistYn() {
		return registYn;
	}
	public void setRegistYn(String registYn) {
		this.registYn = registYn;
	}
	public List<String> getTagIdArr() {
		return tagIdArr;
	}
	public void setTagIdArr(List<String> tagIdArr) {
		this.tagIdArr = tagIdArr;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
}
