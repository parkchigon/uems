package com.flk.mng.report.domain;

public class ManageFacility {
	
	/* TBL_MANAGE_FACILITY_RATE */
	private String mfrId;
	private String siteId;
	private String absorLoadRate05;
	private String absorLoadRate06;
	private String absorLoadRate07;
	private String absorLoadRate08;
	private String absorLoadRate09;
	private String absorLoadRate10;
	private String turboLoadRate05;
	private String turboLoadRate06;
	private String turboLoadRate07;
	private String turboLoadRate08;
	private String turboLoadRate09;
	private String turboLoadRate10;
	private String absorWorkRate05;
	private String absorWorkRate06;
	private String absorWorkRate07;
	private String absorWorkRate08;
	private String absorWorkRate09;
	private String absorWorkRate10;
	private String absorHeatEffYear;
	private String absorHeatEffRate;
	private String absorAsstEffYear;
	private String absorAsstEffRate;
	private String absorOpenDay;
	private String absorWorkHour;
	private String turboWorkRate05;
	private String turboWorkRate06;
	private String turboWorkRate07;
	private String turboWorkRate08;
	private String turboWorkRate09;
	private String turboWorkRate10;
	private String turboHeatEffYear;
	private String turboHeatEffRate;
	private String turboAsstEffYear;
	private String turboAsstEffRate;
	private String turboOpenDay;
	private String turboWorkHour;
	private String elecNightFactor;
	private String elecDayFactor;
	private String reductionElec;
	private String useFlag;
	private String updateId;
	private String updateDate;
	private String regId;
	private String regDate;
	
	/* TBL_MANAGE_FACILITY_SPEC */
	private String mfsId;
	private String chillerheaterCnt;
	private String chillerheaterVol;
	private String chillerheaterEle;
	private String chillerheaterGas;
	private String absorTowerCnt;
	private String absorTowerVol;
	private String absorTowerEle;
	private String absorPumpCnt;
	private String absorPumpVol;
	private String absorPumpEle;
	private String turboChillerCnt;
	private String turboChillerVol;
	private String turboChillerEle;
	private String turboTowerCnt;
	private String turboTowerVol;
	private String turboTowerEle;
	private String turboPumpCnt;
	private String turboPumpVol;
	private String turboPumpEle;
	private String prevAbsorAmt;
	private String prevTurboAmt;
	private String prevGasAmt;
	private String lowChillerCnt;
	private String lowChillerDayVol;
	private String lowChillerDayEle;
	private String lowChillerNightVol;
	private String lowChillerNightEle;
	private String icethermalTowerCnt;
	private String icethermalTowerVol;
	private String icethermalTowerEle;
	private String thermalStorageCnt;
	private String thermalStorageVol;
	private String heatExchangerCnt;
	private String heatExchangerVol;
	private String coolstoragePumpCnt;
	private String coolstoragePumpVol;
	private String coolstoragePumpEle;
	private String relestoragePumpCnt;
	private String relestoragePumpVol;
	private String relestoragePumpEle;
	private String brinePumpCnt;
	private String brinePumpVol;
	private String brinePumpEle;
	private String coolingPumpCnt;
	private String coolingPumpVol;
	private String coolingPumpEle;
	private String presIcethermalAmt;
	private String presEleDayAmt;
	private String presEleNightAmt;
	
	private String prevFacilityCode;
	
	public String getPrevFacilityCode() {
		return prevFacilityCode;
	}
	public void setPrevFacilityCode(String prevFacilityCode) {
		this.prevFacilityCode = prevFacilityCode;
	}
	public String getMfrId() {
		return mfrId;
	}
	public void setMfrId(String mfrId) {
		this.mfrId = mfrId;
	}
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getAbsorLoadRate05() {
		return absorLoadRate05;
	}
	public void setAbsorLoadRate05(String absorLoadRate05) {
		this.absorLoadRate05 = absorLoadRate05;
	}
	public String getAbsorLoadRate06() {
		return absorLoadRate06;
	}
	public void setAbsorLoadRate06(String absorLoadRate06) {
		this.absorLoadRate06 = absorLoadRate06;
	}
	public String getAbsorLoadRate07() {
		return absorLoadRate07;
	}
	public void setAbsorLoadRate07(String absorLoadRate07) {
		this.absorLoadRate07 = absorLoadRate07;
	}
	public String getAbsorLoadRate08() {
		return absorLoadRate08;
	}
	public void setAbsorLoadRate08(String absorLoadRate08) {
		this.absorLoadRate08 = absorLoadRate08;
	}
	public String getAbsorLoadRate09() {
		return absorLoadRate09;
	}
	public void setAbsorLoadRate09(String absorLoadRate09) {
		this.absorLoadRate09 = absorLoadRate09;
	}
	public String getAbsorLoadRate10() {
		return absorLoadRate10;
	}
	public void setAbsorLoadRate10(String absorLoadRate10) {
		this.absorLoadRate10 = absorLoadRate10;
	}
	public String getTurboLoadRate05() {
		return turboLoadRate05;
	}
	public void setTurboLoadRate05(String turboLoadRate05) {
		this.turboLoadRate05 = turboLoadRate05;
	}
	public String getTurboLoadRate06() {
		return turboLoadRate06;
	}
	public void setTurboLoadRate06(String turboLoadRate06) {
		this.turboLoadRate06 = turboLoadRate06;
	}
	public String getTurboLoadRate07() {
		return turboLoadRate07;
	}
	public void setTurboLoadRate07(String turboLoadRate07) {
		this.turboLoadRate07 = turboLoadRate07;
	}
	public String getTurboLoadRate08() {
		return turboLoadRate08;
	}
	public void setTurboLoadRate08(String turboLoadRate08) {
		this.turboLoadRate08 = turboLoadRate08;
	}
	public String getTurboLoadRate09() {
		return turboLoadRate09;
	}
	public void setTurboLoadRate09(String turboLoadRate09) {
		this.turboLoadRate09 = turboLoadRate09;
	}
	public String getTurboLoadRate10() {
		return turboLoadRate10;
	}
	public void setTurboLoadRate10(String turboLoadRate10) {
		this.turboLoadRate10 = turboLoadRate10;
	}
	public String getAbsorWorkRate05() {
		return absorWorkRate05;
	}
	public void setAbsorWorkRate05(String absorWorkRate05) {
		this.absorWorkRate05 = absorWorkRate05;
	}
	public String getAbsorWorkRate06() {
		return absorWorkRate06;
	}
	public void setAbsorWorkRate06(String absorWorkRate06) {
		this.absorWorkRate06 = absorWorkRate06;
	}
	public String getAbsorWorkRate07() {
		return absorWorkRate07;
	}
	public void setAbsorWorkRate07(String absorWorkRate07) {
		this.absorWorkRate07 = absorWorkRate07;
	}
	public String getAbsorWorkRate08() {
		return absorWorkRate08;
	}
	public void setAbsorWorkRate08(String absorWorkRate08) {
		this.absorWorkRate08 = absorWorkRate08;
	}
	public String getAbsorWorkRate09() {
		return absorWorkRate09;
	}
	public void setAbsorWorkRate09(String absorWorkRate09) {
		this.absorWorkRate09 = absorWorkRate09;
	}
	public String getAbsorWorkRate10() {
		return absorWorkRate10;
	}
	public void setAbsorWorkRate10(String absorWorkRate10) {
		this.absorWorkRate10 = absorWorkRate10;
	}
	public String getAbsorHeatEffYear() {
		return absorHeatEffYear;
	}
	public void setAbsorHeatEffYear(String absorHeatEffYear) {
		this.absorHeatEffYear = absorHeatEffYear;
	}
	public String getAbsorHeatEffRate() {
		return absorHeatEffRate;
	}
	public void setAbsorHeatEffRate(String absorHeatEffRate) {
		this.absorHeatEffRate = absorHeatEffRate;
	}
	public String getAbsorAsstEffYear() {
		return absorAsstEffYear;
	}
	public void setAbsorAsstEffYear(String absorAsstEffYear) {
		this.absorAsstEffYear = absorAsstEffYear;
	}
	public String getAbsorAsstEffRate() {
		return absorAsstEffRate;
	}
	public void setAbsorAsstEffRate(String absorAsstEffRate) {
		this.absorAsstEffRate = absorAsstEffRate;
	}
	public String getAbsorOpenDay() {
		return absorOpenDay;
	}
	public void setAbsorOpenDay(String absorOpenDay) {
		this.absorOpenDay = absorOpenDay;
	}
	public String getAbsorWorkHour() {
		return absorWorkHour;
	}
	public void setAbsorWorkHour(String absorWorkHour) {
		this.absorWorkHour = absorWorkHour;
	}
	public String getTurboWorkRate05() {
		return turboWorkRate05;
	}
	public void setTurboWorkRate05(String turboWorkRate05) {
		this.turboWorkRate05 = turboWorkRate05;
	}
	public String getTurboWorkRate06() {
		return turboWorkRate06;
	}
	public void setTurboWorkRate06(String turboWorkRate06) {
		this.turboWorkRate06 = turboWorkRate06;
	}
	public String getTurboWorkRate07() {
		return turboWorkRate07;
	}
	public void setTurboWorkRate07(String turboWorkRate07) {
		this.turboWorkRate07 = turboWorkRate07;
	}
	public String getTurboWorkRate08() {
		return turboWorkRate08;
	}
	public void setTurboWorkRate08(String turboWorkRate08) {
		this.turboWorkRate08 = turboWorkRate08;
	}
	public String getTurboWorkRate09() {
		return turboWorkRate09;
	}
	public void setTurboWorkRate09(String turboWorkRate09) {
		this.turboWorkRate09 = turboWorkRate09;
	}
	public String getTurboWorkRate10() {
		return turboWorkRate10;
	}
	public void setTurboWorkRate10(String turboWorkRate10) {
		this.turboWorkRate10 = turboWorkRate10;
	}
	public String getTurboHeatEffYear() {
		return turboHeatEffYear;
	}
	public void setTurboHeatEffYear(String turboHeatEffYear) {
		this.turboHeatEffYear = turboHeatEffYear;
	}
	public String getTurboHeatEffRate() {
		return turboHeatEffRate;
	}
	public void setTurboHeatEffRate(String turboHeatEffRate) {
		this.turboHeatEffRate = turboHeatEffRate;
	}
	public String getTurboAsstEffYear() {
		return turboAsstEffYear;
	}
	public void setTurboAsstEffYear(String turboAsstEffYear) {
		this.turboAsstEffYear = turboAsstEffYear;
	}
	public String getTurboAsstEffRate() {
		return turboAsstEffRate;
	}
	public void setTurboAsstEffRate(String turboAsstEffRate) {
		this.turboAsstEffRate = turboAsstEffRate;
	}
	public String getTurboOpenDay() {
		return turboOpenDay;
	}
	public void setTurboOpenDay(String turboOpenDay) {
		this.turboOpenDay = turboOpenDay;
	}
	public String getTurboWorkHour() {
		return turboWorkHour;
	}
	public void setTurboWorkHour(String turboWorkHour) {
		this.turboWorkHour = turboWorkHour;
	}
	public String getElecNightFactor() {
		return elecNightFactor;
	}
	public void setElecNightFactor(String elecNightFactor) {
		this.elecNightFactor = elecNightFactor;
	}
	public String getElecDayFactor() {
		return elecDayFactor;
	}
	public void setElecDayFactor(String elecDayFactor) {
		this.elecDayFactor = elecDayFactor;
	}
	public String getReductionElec() {
		return reductionElec;
	}
	public void setReductionElec(String reductionElec) {
		this.reductionElec = reductionElec;
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
	public String getMfsId() {
		return mfsId;
	}
	public void setMfsId(String mfsId) {
		this.mfsId = mfsId;
	}
	public String getChillerheaterCnt() {
		return chillerheaterCnt;
	}
	public void setChillerheaterCnt(String chillerheaterCnt) {
		this.chillerheaterCnt = chillerheaterCnt;
	}
	public String getChillerheaterVol() {
		return chillerheaterVol;
	}
	public void setChillerheaterVol(String chillerheaterVol) {
		this.chillerheaterVol = chillerheaterVol;
	}
	public String getChillerheaterEle() {
		return chillerheaterEle;
	}
	public void setChillerheaterEle(String chillerheaterEle) {
		this.chillerheaterEle = chillerheaterEle;
	}
	public String getChillerheaterGas() {
		return chillerheaterGas;
	}
	public void setChillerheaterGas(String chillerheaterGas) {
		this.chillerheaterGas = chillerheaterGas;
	}
	public String getAbsorTowerCnt() {
		return absorTowerCnt;
	}
	public void setAbsorTowerCnt(String absorTowerCnt) {
		this.absorTowerCnt = absorTowerCnt;
	}
	public String getAbsorTowerVol() {
		return absorTowerVol;
	}
	public void setAbsorTowerVol(String absorTowerVol) {
		this.absorTowerVol = absorTowerVol;
	}
	public String getAbsorTowerEle() {
		return absorTowerEle;
	}
	public void setAbsorTowerEle(String absorTowerEle) {
		this.absorTowerEle = absorTowerEle;
	}
	public String getAbsorPumpCnt() {
		return absorPumpCnt;
	}
	public void setAbsorPumpCnt(String absorPumpCnt) {
		this.absorPumpCnt = absorPumpCnt;
	}
	public String getAbsorPumpVol() {
		return absorPumpVol;
	}
	public void setAbsorPumpVol(String absorPumpVol) {
		this.absorPumpVol = absorPumpVol;
	}
	public String getAbsorPumpEle() {
		return absorPumpEle;
	}
	public void setAbsorPumpEle(String absorPumpEle) {
		this.absorPumpEle = absorPumpEle;
	}
	public String getTurboChillerCnt() {
		return turboChillerCnt;
	}
	public void setTurboChillerCnt(String turboChillerCnt) {
		this.turboChillerCnt = turboChillerCnt;
	}
	public String getTurboChillerVol() {
		return turboChillerVol;
	}
	public void setTurboChillerVol(String turboChillerVol) {
		this.turboChillerVol = turboChillerVol;
	}
	public String getTurboChillerEle() {
		return turboChillerEle;
	}
	public void setTurboChillerEle(String turboChillerEle) {
		this.turboChillerEle = turboChillerEle;
	}
	public String getTurboTowerCnt() {
		return turboTowerCnt;
	}
	public void setTurboTowerCnt(String turboTowerCnt) {
		this.turboTowerCnt = turboTowerCnt;
	}
	public String getTurboTowerVol() {
		return turboTowerVol;
	}
	public void setTurboTowerVol(String turboTowerVol) {
		this.turboTowerVol = turboTowerVol;
	}
	public String getTurboTowerEle() {
		return turboTowerEle;
	}
	public void setTurboTowerEle(String turboTowerEle) {
		this.turboTowerEle = turboTowerEle;
	}
	public String getTurboPumpCnt() {
		return turboPumpCnt;
	}
	public void setTurboPumpCnt(String turboPumpCnt) {
		this.turboPumpCnt = turboPumpCnt;
	}
	public String getTurboPumpVol() {
		return turboPumpVol;
	}
	public void setTurboPumpVol(String turboPumpVol) {
		this.turboPumpVol = turboPumpVol;
	}
	public String getTurboPumpEle() {
		return turboPumpEle;
	}
	public void setTurboPumpEle(String turboPumpEle) {
		this.turboPumpEle = turboPumpEle;
	}
	public String getPrevAbsorAmt() {
		return prevAbsorAmt;
	}
	public void setPrevAbsorAmt(String prevAbsorAmt) {
		this.prevAbsorAmt = prevAbsorAmt;
	}
	public String getPrevTurboAmt() {
		return prevTurboAmt;
	}
	public void setPrevTurboAmt(String prevTurboAmt) {
		this.prevTurboAmt = prevTurboAmt;
	}
	public String getPrevGasAmt() {
		return prevGasAmt;
	}
	public void setPrevGasAmt(String prevGasAmt) {
		this.prevGasAmt = prevGasAmt;
	}
	public String getLowChillerCnt() {
		return lowChillerCnt;
	}
	public void setLowChillerCnt(String lowChillerCnt) {
		this.lowChillerCnt = lowChillerCnt;
	}
	public String getLowChillerDayVol() {
		return lowChillerDayVol;
	}
	public void setLowChillerDayVol(String lowChillerDayVol) {
		this.lowChillerDayVol = lowChillerDayVol;
	}
	public String getLowChillerDayEle() {
		return lowChillerDayEle;
	}
	public void setLowChillerDayEle(String lowChillerDayEle) {
		this.lowChillerDayEle = lowChillerDayEle;
	}
	public String getLowChillerNightVol() {
		return lowChillerNightVol;
	}
	public void setLowChillerNightVol(String lowChillerNightVol) {
		this.lowChillerNightVol = lowChillerNightVol;
	}
	public String getLowChillerNightEle() {
		return lowChillerNightEle;
	}
	public void setLowChillerNightEle(String lowChillerNightEle) {
		this.lowChillerNightEle = lowChillerNightEle;
	}
	public String getIcethermalTowerCnt() {
		return icethermalTowerCnt;
	}
	public void setIcethermalTowerCnt(String icethermalTowerCnt) {
		this.icethermalTowerCnt = icethermalTowerCnt;
	}
	public String getIcethermalTowerVol() {
		return icethermalTowerVol;
	}
	public void setIcethermalTowerVol(String icethermalTowerVol) {
		this.icethermalTowerVol = icethermalTowerVol;
	}
	public String getIcethermalTowerEle() {
		return icethermalTowerEle;
	}
	public void setIcethermalTowerEle(String icethermalTowerEle) {
		this.icethermalTowerEle = icethermalTowerEle;
	}
	public String getThermalStorageCnt() {
		return thermalStorageCnt;
	}
	public void setThermalStorageCnt(String thermalStorageCnt) {
		this.thermalStorageCnt = thermalStorageCnt;
	}
	public String getThermalStorageVol() {
		return thermalStorageVol;
	}
	public void setThermalStorageVol(String thermalStorageVol) {
		this.thermalStorageVol = thermalStorageVol;
	}
	public String getHeatExchangerCnt() {
		return heatExchangerCnt;
	}
	public void setHeatExchangerCnt(String heatExchangerCnt) {
		this.heatExchangerCnt = heatExchangerCnt;
	}
	public String getHeatExchangerVol() {
		return heatExchangerVol;
	}
	public void setHeatExchangerVol(String heatExchangerVol) {
		this.heatExchangerVol = heatExchangerVol;
	}
	public String getCoolstoragePumpCnt() {
		return coolstoragePumpCnt;
	}
	public void setCoolstoragePumpCnt(String coolstoragePumpCnt) {
		this.coolstoragePumpCnt = coolstoragePumpCnt;
	}
	public String getCoolstoragePumpVol() {
		return coolstoragePumpVol;
	}
	public void setCoolstoragePumpVol(String coolstoragePumpVol) {
		this.coolstoragePumpVol = coolstoragePumpVol;
	}
	public String getCoolstoragePumpEle() {
		return coolstoragePumpEle;
	}
	public void setCoolstoragePumpEle(String coolstoragePumpEle) {
		this.coolstoragePumpEle = coolstoragePumpEle;
	}
	public String getRelestoragePumpCnt() {
		return relestoragePumpCnt;
	}
	public void setRelestoragePumpCnt(String relestoragePumpCnt) {
		this.relestoragePumpCnt = relestoragePumpCnt;
	}
	public String getRelestoragePumpVol() {
		return relestoragePumpVol;
	}
	public void setRelestoragePumpVol(String relestoragePumpVol) {
		this.relestoragePumpVol = relestoragePumpVol;
	}
	public String getRelestoragePumpEle() {
		return relestoragePumpEle;
	}
	public void setRelestoragePumpEle(String relestoragePumpEle) {
		this.relestoragePumpEle = relestoragePumpEle;
	}
	public String getBrinePumpCnt() {
		return brinePumpCnt;
	}
	public void setBrinePumpCnt(String brinePumpCnt) {
		this.brinePumpCnt = brinePumpCnt;
	}
	public String getBrinePumpVol() {
		return brinePumpVol;
	}
	public void setBrinePumpVol(String brinePumpVol) {
		this.brinePumpVol = brinePumpVol;
	}
	public String getBrinePumpEle() {
		return brinePumpEle;
	}
	public void setBrinePumpEle(String brinePumpEle) {
		this.brinePumpEle = brinePumpEle;
	}
	public String getCoolingPumpCnt() {
		return coolingPumpCnt;
	}
	public void setCoolingPumpCnt(String coolingPumpCnt) {
		this.coolingPumpCnt = coolingPumpCnt;
	}
	public String getCoolingPumpVol() {
		return coolingPumpVol;
	}
	public void setCoolingPumpVol(String coolingPumpVol) {
		this.coolingPumpVol = coolingPumpVol;
	}
	public String getCoolingPumpEle() {
		return coolingPumpEle;
	}
	public void setCoolingPumpEle(String coolingPumpEle) {
		this.coolingPumpEle = coolingPumpEle;
	}
	public String getPresIcethermalAmt() {
		return presIcethermalAmt;
	}
	public void setPresIcethermalAmt(String presIcethermalAmt) {
		this.presIcethermalAmt = presIcethermalAmt;
	}
	public String getPresEleDayAmt() {
		return presEleDayAmt;
	}
	public void setPresEleDayAmt(String presEleDayAmt) {
		this.presEleDayAmt = presEleDayAmt;
	}
	public String getPresEleNightAmt() {
		return presEleNightAmt;
	}
	public void setPresEleNightAmt(String presEleNightAmt) {
		this.presEleNightAmt = presEleNightAmt;
	}
	
	
}
