package com.flk.mng.equipment.domain;

import java.util.List;

/**
 * 축열조 및 배관
 */
public class CTower extends Equipment{

	private String fcId;
	/** 축열조 및 배관 KEY */
	private String fcmId;
	/** 냉각탑명 */
	private String ctowerName;
	/** 타입 */
	private String type;
	/** 수량 */
	private String count;
	/** 하위 냉각탑명 */
	private String ctowerSubName;
	/** 용량 */
	private String volumn;
	/** 모터수량 */
	private String motorCount;
	/** 전원 */
	private String powerSupply;
	/** 소비동력(Kw) */
	private String spendPowerKw;
	/** 소비동력(HP) */
	private String spendPowerHp;
	/** 전류 */
	private String current;
	/** 유량(m2/h) */
	private String flow1;
	/** 유량(lpm) */
	private String flow2;
	/** 유체 */
	private String fluid;
	/** 약품명 1 */
	private String chemical1Name;
	/** 약품설명 1 */
	private String chemical1Desc;
	/** 약품명 2 */
	private String chemical2Name;
	/** 약품설명 2 */
	private String chemical2Desc;
	/** 약품명 3 */
	private String chemical3Name;
	/** 약품설명 3 */
	private String chemical3Desc;
	
	private List<CTower> subCTower;
	
	public CTower() {}

	public String getFcId() {
		return fcId;
	}

	public void setFcId(String fcId) {
		this.fcId = fcId;
	}

	public String getFcmId() {
		return fcmId;
	}

	public void setFcmId(String fcmId) {
		this.fcmId = fcmId;
	}

	public String getCtowerName() {
		return ctowerName;
	}

	public void setCtowerName(String ctowerName) {
		this.ctowerName = ctowerName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCtowerSubName() {
		return ctowerSubName;
	}

	public void setCtowerSubName(String ctowerSubName) {
		this.ctowerSubName = ctowerSubName;
	}

	public String getVolumn() {
		return volumn;
	}

	public void setVolumn(String volumn) {
		this.volumn = volumn;
	}

	public String getMotorCount() {
		return motorCount;
	}

	public void setMotorCount(String motorCount) {
		this.motorCount = motorCount;
	}

	public String getPowerSupply() {
		return powerSupply;
	}

	public void setPowerSupply(String powerSupply) {
		this.powerSupply = powerSupply;
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

	public String getCurrent() {
		return current;
	}

	public void setCurrent(String current) {
		this.current = current;
	}

	public String getFlow1() {
		return flow1;
	}

	public void setFlow1(String flow1) {
		this.flow1 = flow1;
	}

	public String getFlow2() {
		return flow2;
	}

	public void setFlow2(String flow2) {
		this.flow2 = flow2;
	}

	public String getFluid() {
		return fluid;
	}

	public void setFluid(String fluid) {
		this.fluid = fluid;
	}

	public String getChemical1Name() {
		return chemical1Name;
	}

	public void setChemical1Name(String chemical1Name) {
		this.chemical1Name = chemical1Name;
	}

	public String getChemical1Desc() {
		return chemical1Desc;
	}

	public void setChemical1Desc(String chemical1Desc) {
		this.chemical1Desc = chemical1Desc;
	}

	public String getChemical2Name() {
		return chemical2Name;
	}

	public void setChemical2Name(String chemical2Name) {
		this.chemical2Name = chemical2Name;
	}

	public String getChemical2Desc() {
		return chemical2Desc;
	}

	public void setChemical2Desc(String chemical2Desc) {
		this.chemical2Desc = chemical2Desc;
	}

	public String getChemical3Name() {
		return chemical3Name;
	}

	public void setChemical3Name(String chemical3Name) {
		this.chemical3Name = chemical3Name;
	}

	public String getChemical3Desc() {
		return chemical3Desc;
	}

	public void setChemical3Desc(String chemical3Desc) {
		this.chemical3Desc = chemical3Desc;
	}

	public List<CTower> getSubCTower() {
		return subCTower;
	}

	public void setSubCTower(List<CTower> subCTower) {
		this.subCTower = subCTower;
	}
	
}
