package com.flk.mng.site.domain;

import com.flk.common.utility.PageUtil;

public class Site {
	
	/** 지점 아이디*/
	private String siteId;
	/** 지점 코드 */
	private String siteCd;
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
	/** 등록 아이디 */
	private String regId;
	/** 등록 일시 */
	private String regDate;
	/** 수정 아이디 */
	private String updateId;
	/** 수정 일시 */
	private String updateDate;
	/** 지점 그룹 아이디 */
	private String sgId;
	/** 지점 그룹 명 */
	private String sgName;
	/** 사용여부 */
	private String useFlag;
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
	
	/** 사용 리스트 조회 여부 */
	private String useListYn;
	
	/** 기상청 x,y좌표 */
	private String weatherX;
	private String weatherY;
	private String sgCd;
	private String remarks;
	/** 기존 열원구분 */
	private String prevFacilityCode;
	/** 운영기간 */
	private String statStartDay;
	private String statEndDay;
	
	public Site() { }
	
	public Site(int lastIndex, String useListYn) {
		this.lastIndex = lastIndex;
		this.useListYn = useListYn;
	}
	
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
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
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
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
	public String getUseListYn() {
		return useListYn;
	}
	public void setUseListYn(String useListYn) {
		this.useListYn = useListYn;
	}
	public String getWeatherX() {
		return weatherX;
	}
	public void setWeatherX(String weatherX) {
		this.weatherX = weatherX;
	}
	public String getWeatherY() {
		return weatherY;
	}
	public void setWeatherY(String weatherY) {
		this.weatherY = weatherY;
	}
	public String getSgCd() {
		return sgCd;
	}
	public void setSgCd(String sgCd) {
		this.sgCd = sgCd;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getPrevFacilityCode() {
		return prevFacilityCode;
	}
	public void setPrevFacilityCode(String prevFacilityCode) {
		this.prevFacilityCode = prevFacilityCode;
	}

	public String getStatStartDay() {
		return statStartDay;
	}

	public void setStatStartDay(String statStartDay) {
		this.statStartDay = statStartDay;
	}

	public String getStatEndDay() {
		return statEndDay;
	}

	public void setStatEndDay(String statEndDay) {
		this.statEndDay = statEndDay;
	}
	
	
}
