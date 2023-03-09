package com.flk.common.utility;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.flk.common.domain.MailMessage;
import com.flk.common.utility.StringUtils;


@Component
public class MailSenderUtil {
	
	public static Logger logger = LoggerFactory.getLogger(MailSenderUtil.class);
	
	@Autowired(required=false)
	private JavaMailSender javaMailSender;

	/**
	 * javaMailSender 초기화
	 * @param mailMessage
	 */
    public void init(MailMessage mailMessage) {
    	logger.debug("javaMailSender init");
    	
		if(javaMailSender == null){
			JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
			setJavaMailSender(javaMailSender, mailMessage);
			this.javaMailSender = javaMailSender;
		}
		
	}
    
    /**
     * 메일을 보내기 위한 기본 세팅
     * 
     * @param javaMailSender
     * @param mailMessage
     */
    private void setJavaMailSender(JavaMailSenderImpl javaMailSender, MailMessage mailMessage){
    	if(javaMailSender == null || StringUtils.isBlank(mailMessage.getHost()) || mailMessage.getPort() == 0 
    			|| StringUtils.isBlank(mailMessage.getUserName()) || StringUtils.isBlank(mailMessage.getPassword())){
    		throw new IllegalArgumentException("smtp서버주소와 포트와 id/pw는 필수값 입니다.");
    	}
    	
    	if(javaMailSender instanceof JavaMailSenderImpl){
    		((JavaMailSenderImpl) javaMailSender).setHost(mailMessage.getHost());
    		((JavaMailSenderImpl) javaMailSender).setPort(mailMessage.getPort());
    		
    		if(StringUtils.isNotBlank(mailMessage.getUserName())){
    			((JavaMailSenderImpl) javaMailSender).setUsername(mailMessage.getUserName());
    		}
    		if(StringUtils.isNotBlank(mailMessage.getPassword())){
    			((JavaMailSenderImpl) javaMailSender).setPassword(mailMessage.getPassword());
    		}
    		
    	}
    }
    
    /**
     * 메일 전송
     * 
     * @param mailMessage
     * @throws MessagingException
     * @throws IOException
     */
	public void send(MailMessage mailMessage) throws Exception{
		
		if(javaMailSender == null){
			init(mailMessage);
		}
		
		MimeMessage msg = this.dataSetting(mailMessage);
		
		//발송
		javaMailSender.send(msg);
		
	}

	/**
	 * 메일 발송 시 필요한 파라메터 세팅
	 * 
	 * @param mailMessage
	 * @return
	 * @throws MessagingException
	 * @throws IOException
	 */
	private MimeMessage dataSetting(MailMessage mailMessage) throws Exception {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		//필수값 체크
		if(mailMessage == null){
			throw new IllegalArgumentException();
		}
		if(StringUtils.isBlank(mailMessage.getSubject()) || StringUtils.isBlank(mailMessage.getFrom()) || mailMessage.getTo().length < 0){
			throw new IllegalArgumentException("제목과 보내는사람 받는사람은 필수값입니다.");
		}
		
		//제목 세팅
		messageHelper.setSubject(mailMessage.getSubject());
		//내용 세팅
		messageHelper.setText(mailMessage.getText());
		
		//보내는 사람 이름이 있을 경우와, 없는 경우 분리
		if(StringUtils.isNotBlank(mailMessage.getFromName())){
			messageHelper.setFrom(mailMessage.getFrom(), mailMessage.getFromName());
		}else{
			messageHelper.setFrom(mailMessage.getFrom());
		}
		
		//받는 사람
		messageHelper.setTo(this.internetAddrsssSetting(mailMessage, "to"));
		
		//참조
		InternetAddress[] target = {};
		target = this.internetAddrsssSetting(mailMessage, "cc");
		if(target != null){
			messageHelper.setCc(target);
		}
		//숨은 참조
		target = null;
		target = this.internetAddrsssSetting(mailMessage, "bcc");
		if(target != null){
			messageHelper.setBcc(target);
		}
		
		//첨부파일
		if(mailMessage.getAttachFile() != null && StringUtils.isNotBlank(mailMessage.getAttachFileName())){
			messageHelper.addAttachment(mailMessage.getAttachFileName(), mailMessage.getAttachFile());
		}else if(mailMessage.getAttachFile() != null && StringUtils.isBlank(mailMessage.getAttachFileName())){
			throw new IllegalArgumentException("첨부파일에 파일명은 필수값입니다.");
		}
		
		//html 파일 읽어오기
		if(mailMessage.getHtmlFile() != null){
			String readData = "";
			if(StringUtils.isBlank(mailMessage.getHtmlFileEncodingType())){
				readData = FileUtils.readFileToString(mailMessage.getHtmlFile(), "UTF-8");
			}else{
				readData = FileUtils.readFileToString(mailMessage.getHtmlFile(), mailMessage.getHtmlFileEncodingType());
			}
			mailMessage.setHtmlContents(readData);
		}
		
		//파일 템플릿
		//html로 된 템플릿이 있을때 html코드를 넣는다.
		if(StringUtils.isNotBlank(mailMessage.getHtmlContents())){
			messageHelper.setText(mailMessage.getHtmlContents(), true);
		}

		//html inline이 아닐경우
		if(!mailMessage.getInLineMap().isEmpty()){
			
			for(String key : mailMessage.getInLineMap().keySet()){
				//이미지파일변환
				if(mailMessage.getInLineMap().get(key) instanceof File){
					messageHelper.addInline(key , (File) mailMessage.getInLineMap().get(key));
				}
				//문자열 치환				
				if(mailMessage.getInLineMap().get(key) instanceof String){
					if(mailMessage.getHtmlContents().contains("cid:" + key)){
						messageHelper.setText(mailMessage.getHtmlContents().replaceAll("cid:"+ key, mailMessage.getInLineMap().get(key).toString()), true);
					}
				}
	        }
		}
		
		//TODO Exception 처리
        return message;
	}

	/**
	 * 메일주소 세팅
	 * 
	 * 
	 * @param mailMessage
	 * @param type (to:받는사람,cc:참조,bcc:숨은참조)
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws AddressException
	 * @throws MessagingException
	 */
	private InternetAddress[] internetAddrsssSetting(MailMessage mailMessage, String type) throws Exception {
		
		String[] target = {};
		String[] targetName = {};
		
		//validation
		if(type == "to"){
			target = mailMessage.getTo();
			if(mailMessage.getToName() != null && mailMessage.getToName().length > 0){
				targetName = mailMessage.getToName();
			}
		}else if(type == "cc"){
			if(mailMessage.getCc() != null && mailMessage.getCc().length > 0){
				target = mailMessage.getCc();
			}
			if(mailMessage.getCcName() != null){
				if(mailMessage.getCcName().length > 0)
					targetName = mailMessage.getCcName();
			}
		}else if(type == "bcc"){
			if(mailMessage.getBcc() != null && mailMessage.getBcc().length > 0){
				target = mailMessage.getBcc();
			}
			if(mailMessage.getBccName() != null && mailMessage.getBccName().length > 0){
				targetName = mailMessage.getBccName();
			}
		}else{
			throw new IllegalArgumentException("type[to:받는사람 or cc:참조 or bcc:숨은참조]은 필수값입니다.");
		}
		
		//value setting
		if(target != null){
			InternetAddress[] ia = new InternetAddress[target.length];
			for (int i=0; i < target.length ; i++) {
				//받는사람or참조or숨은참조 의 이름이 있을 경우
				if(targetName != null && targetName.length > 0){
					ia[i] = new InternetAddress(target[i], targetName[i], "UTF-8");
				}else{
					ia[i] = new InternetAddress(target[i]);
				}
			}
			return ia;
		}else{
			return null;
		}
		
		
	}
	
}
