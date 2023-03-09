package com.flk.mng.data.domain;

import com.flk.common.utility.PageUtil;

public class Data {
	private String sRnum;
	private String siteId;
	private String month;
	private String prevCoolCharge;
	private String presCoolCharge;
	private String prevEnergyAmount;
	private String presEnergyAmount;
	private String prevTcoAmount;
	private String presTcoAmount;
	private String coolingLoadAmount;
	private String nightelecDayAmount;		
	private String nightelecNightAmount;	
	private String elecPowerfactorCharge;
	private String elecDiscountCharge;
	private String chargeApplyPower;
	private String gasAverageCalorie;
	private String manullyFlag;
	private String regId;
	private String updateId;
	private String siteDesc;
	private String year;
	private String years;
	private String sgId;
	private String monthKey;
	private String siteIdKey;
	private String dayelecAmount;
	
	private String billBasicCharge1;
	private String heatingCharge;
	private String heatUsageCharge;
	private String heatUsageAmount;
	private String coolingCharge;
	
	private String flag;
	private String sgCd;
	private String siteCd;
	
	private String statStartDate;
	private String statEndDate;
	private String rfId;
	
	private String elecDayFactor;
	private String elecNightFactor;
	
	public String getRfId() {
		return rfId;
	}
	public void setRfId(String rfId) {
		this.rfId = rfId;
	}
	public String getStatStartDate() {
		return statStartDate;
	}
	public void setStatStartDate(String statStartDate) {
		this.statStartDate = statStartDate;
	}
	public String getStatEndDate() {
		return statEndDate;
	}
	public void setStatEndDate(String statEndDate) {
		this.statEndDate = statEndDate;
	}
	public String getSgCd() {
		return sgCd;
	}
	public void setSgCd(String sgCd) {
		this.sgCd = sgCd;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	/** 검색조건 검색항목1 */
	private String searchCondition;
	/** 검색조건 검색항목2 */
	private String searchCondition2;
	
	
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
	
	private String fileSize;
	
	
	public String getBillBasicCharge1() {
		return billBasicCharge1;
	}
	public void setBillBasicCharge1(String billBasicCharge1) {
		this.billBasicCharge1 = billBasicCharge1;
	}
	public String getHeatingCharge() {
		return heatingCharge;
	}
	public void setHeatingCharge(String heatingCharge) {
		this.heatingCharge = heatingCharge;
	}
	public String getHeatUsageCharge() {
		return heatUsageCharge;
	}
	public void setHeatUsageCharge(String heatUsageCharge) {
		this.heatUsageCharge = heatUsageCharge;
	}
	public String getHeatUsageAmount() {
		return heatUsageAmount;
	}
	public void setHeatUsageAmount(String heatUsageAmount) {
		this.heatUsageAmount = heatUsageAmount;
	}
	public String getCoolingCharge() {
		return coolingCharge;
	}
	public void setCoolingCharge(String coolingCharge) {
		this.coolingCharge = coolingCharge;
	}
	public String getDayelecAmount() {
		return dayelecAmount;
	}
	public void setDayelecAmount(String dayelecAmount) {
		this.dayelecAmount = dayelecAmount;
	}
	public String getMonthKey() {
		return monthKey;
	}
	public void setMonthKey(String monthKey) {
		this.monthKey = monthKey;
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
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchCondition2() {
		return searchCondition2;
	}
	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}
	public String getPrevTcoAmount() {
		return prevTcoAmount;
	}
	public void setPrevTcoAmount(String prevTcoAmount) {
		this.prevTcoAmount = prevTcoAmount;
	}
	public String getPresTcoAmount() {
		return presTcoAmount;
	}
	public void setPresTcoAmount(String presTcoAmount) {
		this.presTcoAmount = presTcoAmount;
	}
	public String getCoolingLoadAmount() {
		return coolingLoadAmount;
	}
	public void setCoolingLoadAmount(String coolingLoadAmount) {
		this.coolingLoadAmount = coolingLoadAmount;
	}
	public String getNightelecDayAmount() {
		return nightelecDayAmount;
	}
	public void setNightelecDayAmount(String nightelecDayAmount) {
		this.nightelecDayAmount = nightelecDayAmount;
	}
	public String getNightelecNightAmount() {
		return nightelecNightAmount;
	}
	public void setNightelecNightAmount(String nightelecNightAmount) {
		this.nightelecNightAmount = nightelecNightAmount;
	}
	public String getElecPowerfactorCharge() {
		return elecPowerfactorCharge;
	}
	public void setElecPowerfactorCharge(String elecPowerfactorCharge) {
		this.elecPowerfactorCharge = elecPowerfactorCharge;
	}
	public String getElecDiscountCharge() {
		return elecDiscountCharge;
	}
	public void setElecDiscountCharge(String elecDiscountCharge) {
		this.elecDiscountCharge = elecDiscountCharge;
	}
	public String getChargeApplyPower() {
		return chargeApplyPower;
	}
	public void setChargeApplyPower(String chargeApplyPower) {
		this.chargeApplyPower = chargeApplyPower;
	}
	public String getManullyFlag() {
		return manullyFlag;
	}
	public void setManullyFlag(String manullyFlag) {
		this.manullyFlag = manullyFlag;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getPrevCoolCharge() {
		return prevCoolCharge;
	}
	public void setPrevCoolCharge(String prevCoolCharge) {
		this.prevCoolCharge = prevCoolCharge;
	}
	public String getPresCoolCharge() {
		return presCoolCharge;
	}
	public void setPresCoolCharge(String presCoolCharge) {
		this.presCoolCharge = presCoolCharge;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getPrevEnergyAmount() {
		return prevEnergyAmount;
	}
	public void setPrevEnergyAmount(String prevEnergyAmount) {
		this.prevEnergyAmount = prevEnergyAmount;
	}
	public String getPresEnergyAmount() {
		return presEnergyAmount;
	}
	public void setPresEnergyAmount(String presEnergyAmount) {
		this.presEnergyAmount = presEnergyAmount;
	}
	public String getSiteDesc() {
		return siteDesc;
	}
	public void setSiteDesc(String siteDesc) {
		this.siteDesc = siteDesc;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getsRnum() {
		return sRnum;
	}
	public void setsRnum(String sRnum) {
		this.sRnum = sRnum;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}
	public String getSiteIdKey() {
		return siteIdKey;
	}
	public void setSiteIdKey(String siteIdKey) {
		this.siteIdKey = siteIdKey;
	}
	public String getGasAverageCalorie() {
		return gasAverageCalorie;
	}
	public void setGasAverageCalorie(String gasAverageCalorie) {
		this.gasAverageCalorie = gasAverageCalorie;
	}
	public String getElecDayFactor() {
		return elecDayFactor;
	}
	public void setElecDayFactor(String elecDayFactor) {
		this.elecDayFactor = elecDayFactor;
	}
	public String getElecNightFactor() {
		return elecNightFactor;
	}
	public void setElecNightFactor(String elecNightFactor) {
		this.elecNightFactor = elecNightFactor;
	}

}
