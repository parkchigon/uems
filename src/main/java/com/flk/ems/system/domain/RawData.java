package com.flk.ems.system.domain;

import java.util.ArrayList;

public class RawData {
	private String siteId;
	private String tagId;
	private String tagValue;
	private String regDate;
	private String diffSec;
	private String siteCd;
	private String tagKindCd;
	
	//tbl_stat_**
	private String statDate;
	private String reprocFlag;
	private String statTime;
	private String tagValueSum;
	private String tagValuAvg;
	private String updateId;
	private String updateDate;
	private String statMonth;
	private String statYear;
	
	//view
	private String tagType;
	private String tagTypeName;
	private String startDate;
	private String endDate;
	private String term;
	private ArrayList<String> tagValueArr;
	private ArrayList<String> tagTypeValueArr;
	private String minHourStart;
	private String minHourEnd;
	private String realTimeType;
	private String refreshYn;	
	private String tgId;
	private String iAlarmUseFlag;
	
	//비교모니터링 view
	private String firstYear;
	private String secondYear;
	private String firstMonth;
	private String secondMonth;
	private String firstDay;
	private String secondDay;
	private String firstDate;
	private String secondDate;
	private String firstLastDate;
	private String secondLastDate;
	
	private double diffMax;
	private double diffMin;
	private double diffAvg;
	private double diffMaxRt;
	private double diffMinRt;
	private double diffAvgRt;
	
	private double maxTagValue;
	private double minTagValue;
	private double avgTagValue;
	private String tagDate;
	
	private String title1;
	private String title2;
	private String title3;
	private String title4;
	
	private String monitoringType;
	
	//지표모니터링
	private String analCode;
	private String analName;
	private String statType;
	private String statHour;
	private double analValue;
	
	
	public String getTagTypeName() {
		return tagTypeName;
	}
	public void setTagTypeName(String tagTypeName) {
		this.tagTypeName = tagTypeName;
	}
	public ArrayList<String> getTagTypeValueArr() {
		return tagTypeValueArr;
	}
	public void setTagTypeValueArr(ArrayList<String> tagTypeValueArr) {
		this.tagTypeValueArr = tagTypeValueArr;
	}
	public double getAnalValue() {
		return analValue;
	}
	public void setAnalValue(double analValue) {
		this.analValue = analValue;
	}
	public String getStatHour() {
		return statHour;
	}
	public void setStatHour(String statHour) {
		this.statHour = statHour;
	}
	public String getAnalCode() {
		return analCode;
	}
	public void setAnalCode(String analCode) {
		this.analCode = analCode;
	}
	public String getAnalName() {
		return analName;
	}
	public void setAnalName(String analName) {
		this.analName = analName;
	}
	public String getStatType() {
		return statType;
	}
	public void setStatType(String statType) {
		this.statType = statType;
	}
	public String getMonitoringType() {
		return monitoringType;
	}
	public void setMonitoringType(String monitoringType) {
		this.monitoringType = monitoringType;
	}
	public String getTitle1() {
		return title1;
	}
	public void setTitle1(String title1) {
		this.title1 = title1;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	public String getTitle3() {
		return title3;
	}
	public void setTitle3(String title3) {
		this.title3 = title3;
	}
	public String getTitle4() {
		return title4;
	}
	public void setTitle4(String title4) {
		this.title4 = title4;
	}
	public double getMaxTagValue() {
		return maxTagValue;
	}
	public void setMaxTagValue(double maxTagValue) {
		this.maxTagValue = maxTagValue;
	}
	public double getMinTagValue() {
		return minTagValue;
	}
	public void setMinTagValue(double minTagValue) {
		this.minTagValue = minTagValue;
	}
	public double getAvgTagValue() {
		return avgTagValue;
	}
	public void setAvgTagValue(double avgTagValue) {
		this.avgTagValue = avgTagValue;
	}
	public String getTagDate() {
		return tagDate;
	}
	public void setTagDate(String tagDate) {
		this.tagDate = tagDate;
	}
	public double getDiffMax() {
		return diffMax;
	}
	public void setDiffMax(double diffMax) {
		this.diffMax = diffMax;
	}
	public double getDiffMin() {
		return diffMin;
	}
	public void setDiffMin(double diffMin) {
		this.diffMin = diffMin;
	}
	public double getDiffAvg() {
		return diffAvg;
	}
	public void setDiffAvg(double diffAvg) {
		this.diffAvg = diffAvg;
	}
	public double getDiffMaxRt() {
		return diffMaxRt;
	}
	public void setDiffMaxRt(double diffMaxRt) {
		this.diffMaxRt = diffMaxRt;
	}
	public double getDiffMinRt() {
		return diffMinRt;
	}
	public void setDiffMinRt(double diffMinRt) {
		this.diffMinRt = diffMinRt;
	}
	public double getDiffAvgRt() {
		return diffAvgRt;
	}
	public void setDiffAvgRt(double diffAvgRt) {
		this.diffAvgRt = diffAvgRt;
	}
	public String getFirstDate() {
		return firstDate;
	}
	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}
	public String getSecondDate() {
		return secondDate;
	}
	public void setSecondDate(String secondDate) {
		this.secondDate = secondDate;
	}
	public String getFirstYear() {
		return firstYear;
	}
	public void setFirstYear(String firstYear) {
		this.firstYear = firstYear;
	}
	public String getSecondYear() {
		return secondYear;
	}
	public void setSecondYear(String secondYear) {
		this.secondYear = secondYear;
	}
	public String getFirstMonth() {
		return firstMonth;
	}
	public void setFirstMonth(String firstMonth) {
		this.firstMonth = firstMonth;
	}
	public String getSecondMonth() {
		return secondMonth;
	}
	public void setSecondMonth(String secondMonth) {
		this.secondMonth = secondMonth;
	}
	public String getFirstDay() {
		return firstDay;
	}
	public void setFirstDay(String firstDay) {
		this.firstDay = firstDay;
	}
	public String getSecondDay() {
		return secondDay;
	}
	public void setSecondDay(String secondDay) {
		this.secondDay = secondDay;
	}
	public String getTgId() {
		return tgId;
	}
	public void setTgId(String tgId) {
		this.tgId = tgId;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getTagValue() {
		return tagValue;
	}
	public void setTagValue(String tagValue) {
		this.tagValue = tagValue;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getDiffSec() {
		return diffSec;
	}
	public void setDiffSec(String diffSec) {
		this.diffSec = diffSec;
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
	public String getStatDate() {
		return statDate;
	}
	public void setStatDate(String statDate) {
		this.statDate = statDate;
	}
	public String getReprocFlag() {
		return reprocFlag;
	}
	public void setReprocFlag(String reprocFlag) {
		this.reprocFlag = reprocFlag;
	}
	public String getStatTime() {
		return statTime;
	}
	public void setStatTime(String statTime) {
		this.statTime = statTime;
	}
	public String getTagValueSum() {
		return tagValueSum;
	}
	public void setTagValueSum(String tagValueSum) {
		this.tagValueSum = tagValueSum;
	}
	public String getTagValuAvg() {
		return tagValuAvg;
	}
	public void setTagValuAvg(String tagValuAvg) {
		this.tagValuAvg = tagValuAvg;
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
	public String getStatMonth() {
		return statMonth;
	}
	public void setStatMonth(String statMonth) {
		this.statMonth = statMonth;
	}
	public String getStatYear() {
		return statYear;
	}
	public void setStatYear(String statYear) {
		this.statYear = statYear;
	}
	public String getTagType() {
		return tagType;
	}
	public void setTagType(String tagType) {
		this.tagType = tagType;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public ArrayList<String> getTagValueArr() {
		return tagValueArr;
	}
	public void setTagValueArr(ArrayList<String> tagValueArr) {
		this.tagValueArr = tagValueArr;
	}
	public String getMinHourStart() {
		return minHourStart;
	}
	public void setMinHourStart(String minHourStart) {
		this.minHourStart = minHourStart;
	}
	public String getMinHourEnd() {
		return minHourEnd;
	}
	public void setMinHourEnd(String minHourEnd) {
		this.minHourEnd = minHourEnd;
	}
	public String getRealTimeType() {
		return realTimeType;
	}
	public void setRealTimeType(String realTimeType) {
		this.realTimeType = realTimeType;
	}
	public String getRefreshYn() {
		return refreshYn;
	}
	public void setRefreshYn(String refreshYn) {
		this.refreshYn = refreshYn;
	}
	public String getiAlarmUseFlag() {
		return iAlarmUseFlag;
	}
	public void setiAlarmUseFlag(String iAlarmUseFlag) {
		this.iAlarmUseFlag = iAlarmUseFlag;
	}
	public String getFirstLastDate() {
		return firstLastDate;
	}
	public void setFirstLastDate(String firstLastDate) {
		this.firstLastDate = firstLastDate;
	}
	public String getSecondLastDate() {
		return secondLastDate;
	}
	public void setSecondLastDate(String secondLastDate) {
		this.secondLastDate = secondLastDate;
	}
	
	
}
