package com.flk.common.utility;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class FileImageUtil {

	@Value("#{config['common.domain']}")
    private String serverDomain;
	@Value("#{config['common.port']}")
	private String serverPort;
	@Value("#{config['maintenance.file.image.url']}")
	private String maintenanceUrl;	
	
	//장비 이미지 URL 만들기
	public String getMaintenanceImageUrl(String chkMonth, String fileName, String fileExt) {
		return "http://"+serverDomain+":"+serverPort+maintenanceUrl+chkMonth+"/"+fileName+"?fileExt="+fileExt;
	}
}
