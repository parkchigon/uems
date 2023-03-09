package com.flk.common.init;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.flk.system.menu.service.MenuService;

@Configuration
public class MenuServiceInit {

	private static final Logger log = LoggerFactory.getLogger(MenuServiceInit.class);
	
	@Autowired
	private MenuService menuService;	
	
    @PostConstruct
    public void init() {

        try {
        	menuService.settingMenuMap();
        } catch (Exception e) {
        	log.error(e.getMessage(), e);
            close();
        }
    }

    @PreDestroy
    public void close(){
    }

}
