package com.flk.mng.equipment.domain;
/**
 * 축열조 및 배관
 */
public class HeatStg extends Equipment{

	/** 축열조 및 배관 KEY */
	private String fhsm;
	/** 축열조 및 배관명 */
	private String heatstgName;
	/** 시운전일자 */
	private String testRunDate;
	/** 관재질 */
	private String material;
	/** 타입 */
	private String type;
	/** 업체명 */
	private String salesInfo;
	/** A/S */
	private String asInfo;
	/** 피크부하 */
	private String peakLoad;
	/** 축열조용량 */
	private String volumn;
	/** 축열율 */
	private String rate;
	/** 크기(W) */
	private String sizeW;
	/** 크기(L) */
	private String sizeL;
	/** 크기(H) */
	private String sizeH;
	/** 캡슐수량 */
	private String capsuleAmt;
	/** 유체 */
	private String fluid;
	/** 브라인양1 */
	private String brineAmt1;
	/** 브라인양2 */
	private String brineAmt2;
	/** 관재질 */
	private String pipeMaterial;
	/** 축냉 관경 */
	private String pipeDiamStorage;
	/** 방냉 관경 */
	private String pipeDiamRelease;
	/** 자동밸브사양1 이름 */
	private String valve1Name;
	/** 자동밸브사양1 (WAY) */
	private String valve11;
	/** 자동밸브사양1 (A) */
	private String valve12;
	/** 자동밸브사양1 (EA) */
	private String valve13;
	/** 자동밸브사양2 이름 */
	private String valve2Name;
	/** 자동밸브사양2 (WAY) */
	private String valve21;
	/** 자동밸브사양2 (A) */
	private String valve22;
	/** 자동밸브사양2 (EA) */
	private String valve23;
	/** 유량계사양1 이름 */
	private String current1Name;
	/** 유량계사양1 (A) */
	private String current11;
	/** 유량계사양1 (EA) */
	private String current12;
	/** 유량계사양2 이름 */
	private String current2Name;
	/** 유량계사양2 (A) */
	private String current21;
	/** 유량계사양2 (EA) */
	private String current22;
	/** 유량계사양3 이름 */
	private String current3Name;
	/** 유량계사양3 (A) */
	private String current31;
	/** 유량계사양3 (EA) */
	private String current32;
	
	public HeatStg() {}

	public String getFhsm() {
		return fhsm;
	}

	public void setFhsm(String fhsm) {
		this.fhsm = fhsm;
	}

	public String getHeatstgName() {
		return heatstgName;
	}

	public void setHeatstgName(String heatstgName) {
		this.heatstgName = heatstgName;
	}

	public String getTestRunDate() {
		return testRunDate;
	}

	public void setTestRunDate(String testRunDate) {
		this.testRunDate = testRunDate;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSalesInfo() {
		return salesInfo;
	}

	public void setSalesInfo(String salesInfo) {
		this.salesInfo = salesInfo;
	}

	public String getAsInfo() {
		return asInfo;
	}

	public void setAsInfo(String asInfo) {
		this.asInfo = asInfo;
	}

	public String getPeakLoad() {
		return peakLoad;
	}

	public void setPeakLoad(String peakLoad) {
		this.peakLoad = peakLoad;
	}

	public String getVolumn() {
		return volumn;
	}

	public void setVolumn(String volumn) {
		this.volumn = volumn;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getSizeW() {
		return sizeW;
	}

	public void setSizeW(String sizeW) {
		this.sizeW = sizeW;
	}

	public String getSizeL() {
		return sizeL;
	}

	public void setSizeL(String sizeL) {
		this.sizeL = sizeL;
	}

	public String getSizeH() {
		return sizeH;
	}

	public void setSizeH(String sizeH) {
		this.sizeH = sizeH;
	}

	public String getCapsuleAmt() {
		return capsuleAmt;
	}

	public void setCapsuleAmt(String capsuleAmt) {
		this.capsuleAmt = capsuleAmt;
	}

	public String getFluid() {
		return fluid;
	}

	public void setFluid(String fluid) {
		this.fluid = fluid;
	}

	public String getBrineAmt1() {
		return brineAmt1;
	}

	public void setBrineAmt1(String brineAmt1) {
		this.brineAmt1 = brineAmt1;
	}

	public String getBrineAmt2() {
		return brineAmt2;
	}

	public void setBrineAmt2(String brineAmt2) {
		this.brineAmt2 = brineAmt2;
	}

	public String getPipeMaterial() {
		return pipeMaterial;
	}

	public void setPipeMaterial(String pipeMaterial) {
		this.pipeMaterial = pipeMaterial;
	}

	public String getPipeDiamStorage() {
		return pipeDiamStorage;
	}

	public void setPipeDiamStorage(String pipeDiamStorage) {
		this.pipeDiamStorage = pipeDiamStorage;
	}

	public String getPipeDiamRelease() {
		return pipeDiamRelease;
	}

	public void setPipeDiamRelease(String pipeDiamRelease) {
		this.pipeDiamRelease = pipeDiamRelease;
	}

	public String getValve1Name() {
		return valve1Name;
	}

	public void setValve1Name(String valve1Name) {
		this.valve1Name = valve1Name;
	}

	public String getValve11() {
		return valve11;
	}

	public void setValve11(String valve11) {
		this.valve11 = valve11;
	}

	public String getValve12() {
		return valve12;
	}

	public void setValve12(String valve12) {
		this.valve12 = valve12;
	}

	public String getValve13() {
		return valve13;
	}

	public void setValve13(String valve13) {
		this.valve13 = valve13;
	}

	public String getValve2Name() {
		return valve2Name;
	}

	public void setValve2Name(String valve2Name) {
		this.valve2Name = valve2Name;
	}

	public String getValve21() {
		return valve21;
	}

	public void setValve21(String valve21) {
		this.valve21 = valve21;
	}

	public String getValve22() {
		return valve22;
	}

	public void setValve22(String valve22) {
		this.valve22 = valve22;
	}

	public String getValve23() {
		return valve23;
	}

	public void setValve23(String valve23) {
		this.valve23 = valve23;
	}

	public String getCurrent1Name() {
		return current1Name;
	}

	public void setCurrent1Name(String current1Name) {
		this.current1Name = current1Name;
	}

	public String getCurrent11() {
		return current11;
	}

	public void setCurrent11(String current11) {
		this.current11 = current11;
	}

	public String getCurrent12() {
		return current12;
	}

	public void setCurrent12(String current12) {
		this.current12 = current12;
	}

	public String getCurrent2Name() {
		return current2Name;
	}

	public void setCurrent2Name(String current2Name) {
		this.current2Name = current2Name;
	}

	public String getCurrent21() {
		return current21;
	}

	public void setCurrent21(String current21) {
		this.current21 = current21;
	}

	public String getCurrent22() {
		return current22;
	}

	public void setCurrent22(String current22) {
		this.current22 = current22;
	}

	public String getCurrent3Name() {
		return current3Name;
	}

	public void setCurrent3Name(String current3Name) {
		this.current3Name = current3Name;
	}

	public String getCurrent31() {
		return current31;
	}

	public void setCurrent31(String current31) {
		this.current31 = current31;
	}

	public String getCurrent32() {
		return current32;
	}

	public void setCurrent32(String current32) {
		this.current32 = current32;
	}

}
