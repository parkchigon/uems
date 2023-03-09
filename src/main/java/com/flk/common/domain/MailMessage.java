package com.flk.common.domain;

import java.io.File;
import java.util.Date;
import java.util.Map;

public class MailMessage implements org.springframework.mail.MailMessage{
	
	//메일서버
	private String host;
	//메일서버 포트
	private int port;
	//메일서버 id
	private String userName;
	//메일서버 password
	private String password;
	//보내는사람
	private String from;
	//보내는 사람 이름
	private String fromName;
	//답변 받는 사람
	private String replyTo;
	//받는 사람
	private String[] to;
	//받는 사람 이름
	private String[] toName;
	//참조
	private String[] cc;
	//참조 사람 이름
	private String[] ccName;
	//숨은 참조
	private String[] bcc;
	//숨은 참조 이름
	private String[] bccName;
	//보내는 날짜
	private Date sentDate;
	//제목
	private String subject;
	//내용
	private String text;
	//첨부파일
	private File attachFile;
	//변환할 첨부파일 이름
	private String attachFileName;
	//html template으로 보낼 메일 내용
	private String htmlContents;
	//html template으로 보낼 내용 바꿔치기 할 내용
	private Map<String, Object> inLineMap;
	//template html 파일 
	private File htmlFile;
	//template html 파일 인코딩 방식 (기본 UTF-8)
	private String htmlFileEncodingType;
	
	public String getHtmlFileEncodingType() {
		return htmlFileEncodingType;
	}
	public void setHtmlFileEncodingType(String htmlFileEncodingType) {
		this.htmlFileEncodingType = htmlFileEncodingType;
	}
	public File getHtmlFile() {
		return htmlFile;
	}
	public void setHtmlFile(File htmlFile) {
		this.htmlFile = htmlFile;
	}
	public Map<String, Object> getInLineMap() {
		return inLineMap;
	}
	public void setInLineMap(Map<String, Object> inLineMap) {
		this.inLineMap = inLineMap;
	}
	public File getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(File attachFile) {
		this.attachFile = attachFile;
	}
	public String getAttachFileName() {
		return attachFileName;
	}
	public void setAttachFileName(String attachFileName) {
		this.attachFileName = attachFileName;
	}
	public String getHtmlContents() {
		return htmlContents;
	}
	public void setHtmlContents(String htmlContents) {
		this.htmlContents = htmlContents;
	}
	public String[] getBccName() {
		return bccName;
	}
	public void setBccName(String[] bccName) {
		this.bccName = bccName;
	}
	public void setBccName(String bccName) {
		this.bccName = new String[1];
		this.bccName[0] = bccName;
	}
	public String[] getCcName() {
		return ccName;
	}
	public void setCcName(String ccName) {
		this.ccName = new String[1];
		this.ccName[0] = ccName;
	}
	public void setCcName(String[] ccName) {
		this.ccName = ccName;
	}
	public String[] getToName() {
		return toName;
	}
	public void setToName(String[] toName) {
		this.toName = toName;
	}
	public void setToName(String toName) {
		this.toName = new String[1];
		this.toName[0] = toName;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getReplyTo() {
		return replyTo;
	}
	public void setReplyTo(String replyTo) {
		this.replyTo = replyTo;
	}
	public String[] getTo() {
		return to;
	}
	public void setTo(String[] to) {
		this.to = to;
	}
	public String[] getCc() {
		return cc;
	}
	public void setCc(String[] cc) {
		this.cc = cc;
	}
	public String[] getBcc() {
		return bcc;
	}
	public void setBcc(String[] bcc) {
		this.bcc = bcc;
	}
	public Date getSentDate() {
		return sentDate;
	}
	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public void setTo(String to){
		this.to = new String[1];
		this.to[0] = to;
	}
	public void setCc(String cc){
		this.cc = new String[1];
		this.cc[0] = cc;
	}
	public void setBcc(String bcc){
		this.bcc = new String[1];
		this.bcc[0] = bcc;
	}
}
