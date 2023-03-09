package com.flk.mng.report.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.flk.common.utility.PageUtil;

public class Maintenance {

	private String mngId;
	private String msqId;
	private String msId;
	private String msaId;
	private String mcqId;
	/** 장비 종류 */
	private String facilityKind;
	/** 장비 이름 */
	private String facilityName;
	/** 장비 아이디 */
	private String facilityId;
	private String facilityId2;
	/** 점검 대항목 */
	private String question;
	/** 점검 소항목 */
	private String answer;
	/** 정렬 */
	private String sortNo;
	/** 사용 여부 */
	private String useFlag;
	/** 체크형태 여부 */
	private String checkTypeFlag;
	/** 등록 아이디 */
	private String regId;
	/** 등록 날짜 */
	private String regDate;
	/** 수정 아이디 */
	private String updateId;
	/** 수정 날짜 */
	private String updateDate;
	/** 적용 날짜 (점검항목수정일) */
	private String applyDate;
	/** 디자인코드 */
	private String designedCode;
	/** 점검 월 */
	private String chkMonth;
	private String chkMonthVal;
	/** 점검 결과 값 */
	private String result;
	/** 지점 그룹 아이디 */
	private String sgId;
	/** 지점 그룹 코드 */
	private String sgCd;
	/** 지점 그룹 명 */
	private String sgName;	
	/** 지점 아이디*/
	private String siteId;
	/** 지점 코드 */
	private String siteCd;
	/** 지점 명*/
	private String siteName;
	/** 검색조건 검색항목 */
	private String searchCondition;
	/** 검색조건 검색항목 */
	private String searchCondition2;
	/** 검색조건 검색항목 */
	private String searchCondition3;
	/**  */
	private String searchVal;
	/** 화면 삭제 리스트 */
	private String[] delListArr;
	/** 화면 이미지 리스트 */
	private ArrayList<String> newListArr;
	private ArrayList<String> realDelListArr;
	/** 유동항목리스트 */
	private List<Maintenance> queList;
	/** 고정항목리스트 */
	private List<Maintenance> defaultList;
	/** 수정항목리스트 */
	private String[] updListArr;
	/** 등록/수정 여부 */
	private String updateFlag;
	/** 신규msq_id */
	private String newMsqId;
	/** 점검완료여부 */
	
	private String finishYn;
	
	private String finishYnVal;
	
	/** 화면용 선택 년도 */
	private String checkYear;
	/** 화면용 선택 월 */
	private String checkMonth;
	/** 서브장비ID */
	private String subFacilityId;
	
	/** 점검항목별 파일정보 */
	private String mfqId;
	private String fileName;
	private String filePath;
	private MultipartFile uploadImg;
	
	/** 화면호출 카운트 구분값 */
	private Integer count;
	
	/** checkList */
	private List<String> checkList;
	private String fileUrl;
	/** 페이지 유틸 */
	private PageUtil Pageutil;
	/** 페이지 사이즈 */
	private String listSize;
	/** 첫 페이지 */
	private int firstIndex;
	/** 마지막 페이지 */
	private int lastIndex;
	/** 현재 페이지 */
	private String currPage;
	
	private String mngName;
	
	private MultipartFile regularCheckImg;
	
	private String newYn;
	
	private String firstYn;
	
	
	public String getFirstYn() {
		return firstYn;
	}

	public void setFirstYn(String firstYn) {
		this.firstYn = firstYn;
	}

	public String getNewYn() {
		return newYn;
	}

	public void setNewYn(String newYn) {
		this.newYn = newYn;
	}

	public MultipartFile getUploadImg() {
		return uploadImg;
	}

	public void setUploadImg(MultipartFile uploadImg) {
		this.uploadImg = uploadImg;
	}

	public MultipartFile getRegularCheckImg() {
		return regularCheckImg;
	}

	public void setRegularCheckImg(MultipartFile regularCheckImg) {
		this.regularCheckImg = regularCheckImg;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	public String getChkMonthVal() {
		return chkMonthVal;
	}

	public void setChkMonthVal(String chkMonthVal) {
		this.chkMonthVal = chkMonthVal;
	}

	public String getFacilityId2() {
		return facilityId2;
	}

	public void setFacilityId2(String facilityId2) {
		this.facilityId2 = facilityId2;
	}

	public String getMngName() {
		return mngName;
	}

	public void setMngName(String mngName) {
		this.mngName = mngName;
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

	public String getCurrPage() {
		return currPage;
	}

	public void setCurrPage(String currPage) {
		this.currPage = currPage;
	}

	public PageUtil getPageutil() {
		return Pageutil;
	}

	public void setPageutil(PageUtil pageutil) {
		Pageutil = pageutil;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}


	public List<String> getCheckList() {
		return checkList;
	}

	public void setCheckList(List<String> checkList) {
		this.checkList = checkList;
	}

	public String getFacilityName() {
		return facilityName;
	}

	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}

	public String getFinishYnVal() {
		return finishYnVal;
	}

	public void setFinishYnVal(String finishYnVal) {
		this.finishYnVal = finishYnVal;
	}
	
	public String getMfqId() {
		return mfqId;
	}

	public void setMfqId(String mfqId) {
		this.mfqId = mfqId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getSubFacilityId() {
		return subFacilityId;
	}

	public void setSubFacilityId(String subFacilityId) {
		this.subFacilityId = subFacilityId;
	}

	public String getMcqId() {
		return mcqId;
	}

	public void setMcqId(String mcqId) {
		this.mcqId = mcqId;
	}

	public String getCheckYear() {
		return checkYear;
	}

	public void setCheckYear(String checkYear) {
		this.checkYear = checkYear;
	}

	public String getCheckMonth() {
		return checkMonth;
	}

	public void setCheckMonth(String checkMonth) {
		this.checkMonth = checkMonth;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public String getFinishYn() {
		return finishYn;
	}

	public void setFinishYn(String finishYn) {
		this.finishYn = finishYn;
	}

	public String getNewMsqId() {
		return newMsqId;
	}

	public void setNewMsqId(String newMsqId) {
		this.newMsqId = newMsqId;
	}

	public List<Maintenance> getDefaultList() {
		return defaultList;
	}

	public void setDefaultList(List<Maintenance> defaultList) {
		this.defaultList = defaultList;
	}

	public String getUpdateFlag() {
		return updateFlag;
	}

	public void setUpdateFlag(String updateFlag) {
		this.updateFlag = updateFlag;
	}

	public String getMsaId() {
		return msaId;
	}

	public void setMsaId(String msaId) {
		this.msaId = msaId;
	}

	public String[] getUpdListArr() {
		return updListArr;
	}

	public void setUpdListArr(String[] updListArr) {
		this.updListArr = updListArr;
	}

	public List<Maintenance> getQueList() {
		return queList;
	}

	public void setQueList(List<Maintenance> queList) {
		this.queList = queList;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public String getSgId() {
		return sgId;
	}

	public void setSgId(String sgId) {
		this.sgId = sgId;
	}

	public String getSgCd() {
		return sgCd;
	}

	public void setSgCd(String sgCd) {
		this.sgCd = sgCd;
	}

	public String getSgName() {
		return sgName;
	}

	public void setSgName(String sgName) {
		this.sgName = sgName;
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

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getSearchCondition3() {
		return searchCondition3;
	}

	public void setSearchCondition3(String searchCondition3) {
		this.searchCondition3 = searchCondition3;
	}

	public String getMsqId() {
		return msqId;
	}

	public void setMsqId(String msqId) {
		this.msqId = msqId;
	}

	public String getMsId() {
		return msId;
	}

	public void setMsId(String msId) {
		this.msId = msId;
	}

	public String getFacilityKind() {
		return facilityKind;
	}

	public void setFacilityKind(String facilityKind) {
		this.facilityKind = facilityKind;
	}

	public String getFacilityId() {
		return facilityId;
	}

	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getSortNo() {
		return sortNo;
	}

	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}

	public String getUseFlag() {
		return useFlag;
	}

	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCheckTypeFlag() {
		return checkTypeFlag;
	}

	public void setCheckTypeFlag(String checkTypeFlag) {
		this.checkTypeFlag = checkTypeFlag;
	}

	public String getSiteId() {
		return siteId;
	}

	public void setSiteId(String siteId) {
		this.siteId = siteId;
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

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getDesignedCode() {
		return designedCode;
	}

	public void setDesignedCode(String designedCode) {
		this.designedCode = designedCode;
	}

	public String getChkMonth() {
		return chkMonth;
	}

	public void setChkMonth(String chkMonth) {
		this.chkMonth = chkMonth;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public ArrayList<String> getNewListArr() {
		return newListArr;
	}

	public void setNewListArr(ArrayList<String> newListArr) {
		this.newListArr = newListArr;
	}

	public String[] getDelListArr() {
		return delListArr;
	}

	public void setDelListArr(String[] delListArr) {
		this.delListArr = delListArr;
	}

	public ArrayList<String> getRealDelListArr() {
		return realDelListArr;
	}

	public void setRealDelListArr(ArrayList<String> realDelListArr) {
		this.realDelListArr = realDelListArr;
	}
	
	
}
