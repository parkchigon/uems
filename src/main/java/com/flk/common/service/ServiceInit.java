package com.flk.common.service;

import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.w3c.dom.NodeList;

import com.flk.common.utility.XMLUtil;

@Service
public class ServiceInit {

	private static final Logger log = LoggerFactory.getLogger(ServiceInit.class);
	
    @Value("#{config['config.service.init']}")
    private String initXml;
    
    @PostConstruct
    public void init() {

        try {
            
            XMLUtil xu = new XMLUtil(initXml);

            ServiceConfig.SERVICE_TITLE = xu.getNodeValue("/init/service/title");
            ServiceConfig.SERVICE_LOGIN_PAGE = xu.getNodeValue("/init/service/loginPage");
            ServiceConfig.SERVICE_MAIN_PAGE = xu.getNodeValue("/init/service/mainPage");

            ServiceConfig.FORMAT_DATE = xu.getNodeValue("/init/format/date");
            ServiceConfig.FORMAT_DATETIME = xu.getNodeValue("/init/format/datetime");
            
            ServiceConfig.BLOCK_SIZE = Integer.parseInt(xu.getNodeValue("/init/list/blockSize"));
            ServiceConfig.LIST_SIZE = Integer.parseInt(xu.getNodeValue("/init/list/listSize"));
            
			ServiceConfig.SESSION_KEY_USER_ID = xu.getNodeValue( "/init/session/userId" );
			ServiceConfig.SESSION_KEY_USER_NAME = xu.getNodeValue( "/init/session/userName" );
			
			
            NodeList nodes = xu.getNodes("/init/paging");
            String pagingType = "";

            for (int i = 0; i < nodes.getLength(); i++) {
                pagingType = xu.getAttributeValue("/init/paging", i, "type");

                HashMap<String,String> pagingOptionMap = new HashMap<String,String>();
                pagingOptionMap.put("body", xu.getNodeValue("/init/paging/body", i));
                pagingOptionMap.put("num", xu.getNodeValue("/init/paging/num", i));
                pagingOptionMap.put("select-num", xu.getNodeValue("/init/paging/select-num", i));
                pagingOptionMap.put("division", xu.getNodeValue("/init/paging/division", i));

                ServiceConfig.PAGING_MAP.put(pagingType, pagingOptionMap);
            }
            ServiceConfig.PAGING_SCRIPT = xu.getNodeValue("/init/paging-script");

//            /**
//             * 회원 가입시 인증 체크 사용 유무
//             */
//            ServiceConfig.EMAIL_CERT_CHECK_YN = xu.getNodeValue("/init//defaultSetting/emialCertCheckYn");
//            if(StringUtils.isEmpty(ServiceConfig.EMAIL_CERT_CHECK_YN)){
//                ServiceConfig.EMAIL_CERT_CHECK_YN = "N";
//            }
//            
//            ServiceConfig.AUTH_SESSION_USE_YN = xu.getNodeValue("/init//defaultSetting/authSessionUseYn");
//            if(StringUtils.isEmpty(ServiceConfig.AUTH_SESSION_USE_YN)){
//                ServiceConfig.AUTH_SESSION_USE_YN = "N";
//            }            
            
            ServiceConfig.xu = xu;
            
        } catch (Exception e) {
        	log.error(e.getMessage(), e);
            close();
        }
    }

    @PreDestroy
    public void close(){
        //자원 반환등 종료
    }

}
