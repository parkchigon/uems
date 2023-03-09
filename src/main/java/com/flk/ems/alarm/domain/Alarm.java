package com.flk.ems.alarm.domain;

import com.flk.common.utility.PageUtil;

public class Alarm {
	
	private String alarmId;
	private String siteCd;
	private String tagId;
	private String alarmMsg;
	private String alarmStatusCd;
	private String regId;
	private String regDate;
	
	//view
	private String alarmStatus01;
	private String alarmStatus02;
	private String alarmStatus03;
	
	private String iAlarmImgCd;
	private String iAlarmImgCdNm;
	private String iAlarmWavCd;
	private String iAlarmWavCdNm;
	
	private String alarmIdArr;
	
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
	
	
	public String getiAlarmImgCd() {
		return iAlarmImgCd;
	}
	public void setiAlarmImgCd(String iAlarmImgCd) {
		this.iAlarmImgCd = iAlarmImgCd;
	}
	public String getiAlarmImgCdNm() {
		return iAlarmImgCdNm;
	}
	public void setiAlarmImgCdNm(String iAlarmImgCdNm) {
		this.iAlarmImgCdNm = iAlarmImgCdNm;
	}
	public String getiAlarmWavCd() {
		return iAlarmWavCd;
	}
	public void setiAlarmWavCd(String iAlarmWavCd) {
		this.iAlarmWavCd = iAlarmWavCd;
	}
	public String getiAlarmWavCdNm() {
		return iAlarmWavCdNm;
	}
	public void setiAlarmWavCdNm(String iAlarmWavCdNm) {
		this.iAlarmWavCdNm = iAlarmWavCdNm;
	}
	public String getAlarmStatus01() {
		return alarmStatus01;
	}
	public void setAlarmStatus01(String alarmStatus01) {
		this.alarmStatus01 = alarmStatus01;
	}
	public String getAlarmStatus02() {
		return alarmStatus02;
	}
	public void setAlarmStatus02(String alarmStatus02) {
		this.alarmStatus02 = alarmStatus02;
	}
	public String getAlarmStatus03() {
		return alarmStatus03;
	}
	public void setAlarmStatus03(String alarmStatus03) {
		this.alarmStatus03 = alarmStatus03;
	}
	public String getAlarmId() {
		return alarmId;
	}
	public void setAlarmId(String alarmId) {
		this.alarmId = alarmId;
	}
	public String getSiteCd() {
		return siteCd;
	}
	public void setSiteCd(String siteCd) {
		this.siteCd = siteCd;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getAlarmMsg() {
		return alarmMsg;
	}
	public void setAlarmMsg(String alarmMsg) {
		this.alarmMsg = alarmMsg;
	}
	public String getAlarmStatusCd() {
		return alarmStatusCd;
	}
	public void setAlarmStatusCd(String alarmStatusCd) {
		this.alarmStatusCd = alarmStatusCd;
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
	public String getAlarmIdArr() {
		return alarmIdArr;
	}
	public void setAlarmIdArr(String alarmIdArr) {
		this.alarmIdArr = alarmIdArr;
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
	
}
