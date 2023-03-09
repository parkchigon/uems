package com.flk.mng.equipment.domain;

import java.util.List;

/**
 * @author 3603
 *
 */
public class Pump extends Equipment{
	
	
	/** 펌프관리 */
	private String fpId;
	private String fpmId;
	private String pumpName;
	private String pumpTypeCd;
	private String codeName;
	private String codeId;
	private String pumpSubTypeCd;
	private String pumpSubname;
	private String motorModelName;
	private String motorModelNo;
	private String pumpModelName;
	private String pumpModelNo;
	private String spendPowerKw;
	private String spendPowerHp;
	private String elecCurrent;
	private String flowRate1;
	private String flowRate2;
	private String lift;
	private String fluidMaterial;
	private String fluidPercent;
	private String motorType;
	private String amtPumpName1;
	private String amtPumpCnt1;
	private String amtPumpName2;
	private String amtPumpCnt2;
	private List<Pump> subPump;
	
	public String getFpId() {
		return fpId;
	}
	public void setFpId(String fpId) {
		this.fpId = fpId;
	}
	public String getAmtPumpName1() {
		return amtPumpName1;
	}
	public void setAmtPumpName1(String amtPumpName1) {
		this.amtPumpName1 = amtPumpName1;
	}
	public String getAmtPumpCnt1() {
		return amtPumpCnt1;
	}
	public void setAmtPumpCnt1(String amtPumpCnt1) {
		this.amtPumpCnt1 = amtPumpCnt1;
	}
	public String getAmtPumpName2() {
		return amtPumpName2;
	}
	public void setAmtPumpName2(String amtPumpName2) {
		this.amtPumpName2 = amtPumpName2;
	}
	public String getAmtPumpCnt2() {
		return amtPumpCnt2;
	}
	public void setAmtPumpCnt2(String amtPumpCnt2) {
		this.amtPumpCnt2 = amtPumpCnt2;
	}
	public String getPumpSubname() {
		return pumpSubname;
	}
	public void setPumpSubname(String pumpSubname) {
		this.pumpSubname = pumpSubname;
	}
	public String getMotorModelName() {
		return motorModelName;
	}
	public void setMotorModelName(String motorModelName) {
		this.motorModelName = motorModelName;
	}
	public String getMotorModelNo() {
		return motorModelNo;
	}
	public void setMotorModelNo(String motorModelNo) {
		this.motorModelNo = motorModelNo;
	}
	public String getPumpModelName() {
		return pumpModelName;
	}
	public void setPumpModelName(String pumpModelName) {
		this.pumpModelName = pumpModelName;
	}
	public String getPumpModelNo() {
		return pumpModelNo;
	}
	public void setPumpModelNo(String pumpModelNo) {
		this.pumpModelNo = pumpModelNo;
	}
	
	public String getSpendPowerKw() {
		return spendPowerKw;
	}
	public void setSpendPowerKw(String spendPowerKw) {
		this.spendPowerKw = spendPowerKw;
	}
	public String getSpendPowerHp() {
		return spendPowerHp;
	}
	public void setSpendPowerHp(String spendPowerHp) {
		this.spendPowerHp = spendPowerHp;
	}
	public String getElecCurrent() {
		return elecCurrent;
	}
	public void setElecCurrent(String elecCurrent) {
		this.elecCurrent = elecCurrent;
	}
	public String getFlowRate1() {
		return flowRate1;
	}
	public void setFlowRate1(String flowRate1) {
		this.flowRate1 = flowRate1;
	}
	public String getFlowRate2() {
		return flowRate2;
	}
	public void setFlowRate2(String flowRate2) {
		this.flowRate2 = flowRate2;
	}
	public String getLift() {
		return lift;
	}
	public void setLift(String lift) {
		this.lift = lift;
	}
	public String getFluidMaterial() {
		return fluidMaterial;
	}
	public void setFluidMaterial(String fluidMaterial) {
		this.fluidMaterial = fluidMaterial;
	}
	public String getFluidPercent() {
		return fluidPercent;
	}
	public void setFluidPercent(String fluidPercent) {
		this.fluidPercent = fluidPercent;
	}
	public String getMotorType() {
		return motorType;
	}
	public void setMotorType(String motorType) {
		this.motorType = motorType;
	}
	public String getFpmId() {
		return fpmId;
	}
	public void setFpmId(String fpmId) {
		this.fpmId = fpmId;
	}
	public String getPumpName() {
		return pumpName;
	}
	public void setPumpName(String pumpName) {
		this.pumpName = pumpName;
	}
	public String getPumpTypeCd() {
		return pumpTypeCd;
	}
	public void setPumpTypeCd(String pumpTypeCd) {
		this.pumpTypeCd = pumpTypeCd;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getPumpSubTypeCd() {
		return pumpSubTypeCd;
	}
	public void setPumpSubTypeCd(String pumpSubTypeCd) {
		this.pumpSubTypeCd = pumpSubTypeCd;
	}
	public List<Pump> getSubPump() {
		return subPump;
	}
	public void setSubPump(List<Pump> subPump) {
		this.subPump = subPump;
	}

}