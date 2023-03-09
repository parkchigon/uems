package com.flk.mng.equipment.domain;

/**냉동기 domain
 * @author 이은비
 *
 */
public class Chiller extends Equipment {
	
	private String fsmId;
	private String chillerName;
	private String chillerTypeCd;
	private String compCount;
	private String modelNo;
	private String drivenMethod;
	private String manufactureNo;
	private String refrigName;
	private String refrigAmount;
	private String volumeNight;
	private String volumeDay;
	private String colTempNight1;
	private String colTempNight2;
	private String colTempDay1;
	private String colTempDay2;
	private String colwaterTempNight1;
	private String colwaterTempNight2;
	private String colwaterTempDay1;
	private String colwaterTempDay2;
	private String fluidNight;
	private String fluidDay;
	private String flowNight1;
	private String flowNight2;
	private String flowDay1;
	private String flowDay2;
	private String presslossNight;
	private String presslossDay;
	private String consumpowerNight;
	private String consumpowerDay;
	private String currentNight;
	private String currentDay;
	private String copNight;
	private String copDay;
	private String controlRange1;
	private String controlRange2;
	private String detail;
	private String weightProduct;
	private String weightDriven;
	private String pipeDiamWt;
	private String pipeDiamCw;
	private String codeId;
	private String codeName;
	private String chillerNo;
	private String siteId;
	
	
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getChillerNo() {
		return chillerNo;
	}
	public void setChillerNo(String chillerNo) {
		this.chillerNo = chillerNo;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getFsmId() {
		return fsmId;
	}
	public void setFsmId(String fsmId) {
		this.fsmId = fsmId;
	}
	public String getChillerName() {
		return chillerName;
	}
	public void setChillerName(String chillerName) {
		this.chillerName = chillerName;
	}
	public String getChillerTypeCd() {
		return chillerTypeCd;
	}
	public void setChillerTypeCd(String chillerTypeCd) {
		this.chillerTypeCd = chillerTypeCd;
	}
	public String getCompCount() {
		return compCount;
	}
	public void setCompCount(String compCount) {
		this.compCount = compCount;
	}
	public String getModelNo() {
		return modelNo;
	}
	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}
	public String getDrivenMethod() {
		return drivenMethod;
	}
	public void setDrivenMethod(String drivenMethod) {
		this.drivenMethod = drivenMethod;
	}
	public String getManufactureNo() {
		return manufactureNo;
	}
	public void setManufactureNo(String manufactureNo) {
		this.manufactureNo = manufactureNo;
	}
	public String getRefrigName() {
		return refrigName;
	}
	public void setRefrigName(String refrigName) {
		this.refrigName = refrigName;
	}
	public String getRefrigAmount() {
		return refrigAmount;
	}
	public void setRefrigAmount(String refrigAmount) {
		this.refrigAmount = refrigAmount;
	}
	public String getVolumeNight() {
		return volumeNight;
	}
	public void setVolumeNight(String volumeNight) {
		this.volumeNight = volumeNight;
	}
	public String getVolumeDay() {
		return volumeDay;
	}
	public void setVolumeDay(String volumeDay) {
		this.volumeDay = volumeDay;
	}
	public String getColTempNight1() {
		return colTempNight1;
	}
	public void setColTempNight1(String colTempNight1) {
		this.colTempNight1 = colTempNight1;
	}
	public String getColTempNight2() {
		return colTempNight2;
	}
	public void setColTempNight2(String colTempNight2) {
		this.colTempNight2 = colTempNight2;
	}
	public String getColTempDay1() {
		return colTempDay1;
	}
	public void setColTempDay1(String colTempDay1) {
		this.colTempDay1 = colTempDay1;
	}
	public String getColTempDay2() {
		return colTempDay2;
	}
	public void setColTempDay2(String colTempDay2) {
		this.colTempDay2 = colTempDay2;
	}
	public String getColwaterTempNight1() {
		return colwaterTempNight1;
	}
	public void setColwaterTempNight1(String colwaterTempNight1) {
		this.colwaterTempNight1 = colwaterTempNight1;
	}
	public String getColwaterTempNight2() {
		return colwaterTempNight2;
	}
	public void setColwaterTempNight2(String colwaterTempNight2) {
		this.colwaterTempNight2 = colwaterTempNight2;
	}
	public String getColwaterTempDay1() {
		return colwaterTempDay1;
	}
	public void setColwaterTempDay1(String colwaterTempDay1) {
		this.colwaterTempDay1 = colwaterTempDay1;
	}
	public String getColwaterTempDay2() {
		return colwaterTempDay2;
	}
	public void setColwaterTempDay2(String colwaterTempDay2) {
		this.colwaterTempDay2 = colwaterTempDay2;
	}
	public String getFluidNight() {
		return fluidNight;
	}
	public void setFluidNight(String fluidNight) {
		this.fluidNight = fluidNight;
	}
	public String getFluidDay() {
		return fluidDay;
	}
	public void setFluidDay(String fluidDay) {
		this.fluidDay = fluidDay;
	}
	public String getFlowNight1() {
		return flowNight1;
	}
	public void setFlowNight1(String flowNight1) {
		this.flowNight1 = flowNight1;
	}
	public String getFlowNight2() {
		return flowNight2;
	}
	public void setFlowNight2(String flowNight2) {
		this.flowNight2 = flowNight2;
	}
	public String getFlowDay1() {
		return flowDay1;
	}
	public void setFlowDay1(String flowDay1) {
		this.flowDay1 = flowDay1;
	}
	public String getFlowDay2() {
		return flowDay2;
	}
	public void setFlowDay2(String flowDay2) {
		this.flowDay2 = flowDay2;
	}
	public String getPresslossNight() {
		return presslossNight;
	}
	public void setPresslossNight(String presslossNight) {
		this.presslossNight = presslossNight;
	}
	public String getPresslossDay() {
		return presslossDay;
	}
	public void setPresslossDay(String presslossDay) {
		this.presslossDay = presslossDay;
	}
	public String getConsumpowerNight() {
		return consumpowerNight;
	}
	public void setConsumpowerNight(String consumpowerNight) {
		this.consumpowerNight = consumpowerNight;
	}
	public String getConsumpowerDay() {
		return consumpowerDay;
	}
	public void setConsumpowerDay(String consumpowerDay) {
		this.consumpowerDay = consumpowerDay;
	}
	public String getCurrentNight() {
		return currentNight;
	}
	public void setCurrentNight(String currentNight) {
		this.currentNight = currentNight;
	}
	public String getCurrentDay() {
		return currentDay;
	}
	public void setCurrentDay(String currentDay) {
		this.currentDay = currentDay;
	}
	public String getCopNight() {
		return copNight;
	}
	public void setCopNight(String copNight) {
		this.copNight = copNight;
	}
	public String getCopDay() {
		return copDay;
	}
	public void setCopDay(String copDay) {
		this.copDay = copDay;
	}
	public String getControlRange1() {
		return controlRange1;
	}
	public void setControlRange1(String controlRange1) {
		this.controlRange1 = controlRange1;
	}
	public String getControlRange2() {
		return controlRange2;
	}
	public void setControlRange2(String controlRange2) {
		this.controlRange2 = controlRange2;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getWeightProduct() {
		return weightProduct;
	}
	public void setWeightProduct(String weightProduct) {
		this.weightProduct = weightProduct;
	}
	public String getWeightDriven() {
		return weightDriven;
	}
	public void setWeightDriven(String weightDriven) {
		this.weightDriven = weightDriven;
	}
	public String getPipeDiamWt() {
		return pipeDiamWt;
	}
	public void setPipeDiamWt(String pipeDiamWt) {
		this.pipeDiamWt = pipeDiamWt;
	}
	public String getPipeDiamCw() {
		return pipeDiamCw;
	}
	public void setPipeDiamCw(String pipeDiamCw) {
		this.pipeDiamCw = pipeDiamCw;
	}
	
	
	
	
}
