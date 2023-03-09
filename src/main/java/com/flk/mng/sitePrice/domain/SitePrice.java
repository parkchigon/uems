package com.flk.mng.sitePrice.domain;

import com.flk.common.utility.PageUtil;

public class SitePrice {
	private String siteCd;
	private String codeUseName;
	private String codeName;
	private String tagId;
	private String tagDesc;
	private String tagKindCd;
	private String sgId;
	private String sgName;
	private String searchCondition;
	private String searchCondition2;
	private String updateDate;
	private String updateId;
	private String regId;
	private String regDate;
	private String normal;
	private String midNight;
	private String gas;
	private String energyType;
	private String pciId;
	private String midNightTagCd;
	private String normalTagCd;
	private String gasTagCd;
	private String elecCharge;
	private String elecPower;
	private String elecFactor0;
	private String elecFactor1;
	private String useFlag;
	private String keyFlag;
	private String pciIdHistory;
	private String tagIdHistory;
	private String elecChargeHistory;
	private String elecPowerHistory;
	private String elecFactor0History;
	private String elecFactor1History;
	private String useFlagHistory;
	

	/** 페이지 사이즈*/
	private String listSize;
	/** 첫 페이지 */
	private int firstIndex;
	/** 마지막 페이지 */
	private int lastIndex;
	/** 페이지 유틸 */
	private PageUtil Pageutil;
	/** 현재 페이지*/
	private String currPage;
	


	public String getPciIdHistory() {
		return pciIdHistory;
	}

	public void setPciIdHistory(String pciIdHistory) {
		this.pciIdHistory = pciIdHistory;
	}

	public String getTagIdHistory() {
		return tagIdHistory;
	}

	public void setTagIdHistory(String tagIdHistory) {
		this.tagIdHistory = tagIdHistory;
	}

	public String getElecChargeHistory() {
		return elecChargeHistory;
	}

	public void setElecChargeHistory(String elecChargeHistory) {
		this.elecChargeHistory = elecChargeHistory;
	}

	public String getElecPowerHistory() {
		return elecPowerHistory;
	}

	public void setElecPowerHistory(String elecPowerHistory) {
		this.elecPowerHistory = elecPowerHistory;
	}

	public String getElecFactor0History() {
		return elecFactor0History;
	}

	public void setElecFactor0History(String elecFactor0History) {
		this.elecFactor0History = elecFactor0History;
	}

	public String getElecFactor1History() {
		return elecFactor1History;
	}

	public void setElecFactor1History(String elecFactor1History) {
		this.elecFactor1History = elecFactor1History;
	}

	public String getUseFlagHistory() {
		return useFlagHistory;
	}

	public void setUseFlagHistory(String useFlagHistory) {
		this.useFlagHistory = useFlagHistory;
	}


	public String getElecCharge() {
		return elecCharge;
	}

	public void setElecCharge(String elecCharge) {
		this.elecCharge = elecCharge;
	}

	public String getElecPower() {
		return elecPower;
	}

	public void setElecPower(String elecPower) {
		this.elecPower = elecPower;
	}

	public String getElecFactor0() {
		return elecFactor0;
	}

	public void setElecFactor0(String elecFactor0) {
		this.elecFactor0 = elecFactor0;
	}

	public String getElecFactor1() {
		return elecFactor1;
	}

	public void setElecFactor1(String elecFactor1) {
		this.elecFactor1 = elecFactor1;
	}

	public String getUseFlag() {
		return useFlag;
	}

	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	
	public String getCodeUseName() {
		return codeUseName;
	}

	public void setCodeUseName(String codeUseName) {
		this.codeUseName = codeUseName;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	public String getTagDesc() {
		return tagDesc;
	}

	public void setTagDesc(String tagDesc) {
		this.tagDesc = tagDesc;
	}

	public String getSiteCd() {
		return siteCd;
	}

	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}

	public String getTagKindCd() {
		return tagKindCd;
	}

	public void setTagKindCd(String tagKindCd) {
		this.tagKindCd = tagKindCd;
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

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
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

	public String getNormal() {
		return normal;
	}

	public void setNormal(String normal) {
		this.normal = normal;
	}

	public String getMidNight() {
		return midNight;
	}

	public void setMidNight(String midNight) {
		this.midNight = midNight;
	}

	public String getGas() {
		return gas;
	}

	public void setGas(String gas) {
		this.gas = gas;
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

	public String getEnergyType() {
		return energyType;
	}

	public void setEnergyType(String energyType) {
		this.energyType = energyType;
	}

	public String getPciId() {
		return pciId;
	}

	public void setPciId(String pciId) {
		this.pciId = pciId;
	}

	public String getMidNightTagCd() {
		return midNightTagCd;
	}

	public void setMidNightTagCd(String midNightTagCd) {
		this.midNightTagCd = midNightTagCd;
	}

	public String getNormalTagCd() {
		return normalTagCd;
	}

	public void setNormalTagCd(String normalTagCd) {
		this.normalTagCd = normalTagCd;
	}

	public String getGasTagCd() {
		return gasTagCd;
	}

	public void setGasTagCd(String gasTagCd) {
		this.gasTagCd = gasTagCd;
	}

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getKeyFlag() {
		return keyFlag;
	}

	public void setKeyFlag(String keyFlag) {
		this.keyFlag = keyFlag;
	}
}
