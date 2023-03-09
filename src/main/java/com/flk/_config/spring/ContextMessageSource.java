package com.flk._config.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

@Configuration
public class ContextMessageSource {

	@Bean
    public ReloadableResourceBundleMessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames(
        		"classpath:/config/common/message"
        		, "classpath:/egovframework/rte/fdl/idgnr/messages/idgnr");
        messageSource.setCacheSeconds(60);
        return messageSource;
    }
}
