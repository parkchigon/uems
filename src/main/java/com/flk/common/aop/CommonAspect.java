package com.flk.common.aop;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.flk.common.domain.Constants;
import com.flk.common.enums.ErrorCodeEnum;
import com.flk.common.utility.MessageAccessUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.report.domain.Maintenance;

@Aspect
@Component
public class CommonAspect {

    private static final Logger logger = LoggerFactory.getLogger(CommonAspect.class);

	@Autowired
	@Qualifier("messageUtil")
	private MessageAccessUtil messageUtil;
	
    /**
     * Mobile 전처리
     * 
     * @param joinPoint
     * @throws Exception
     */
    @Before("execution(* com.flk.mobile..*Controller.*(..))")
    public void commonBefore(JoinPoint joinPoint) throws Exception {
    	//logger.info("##### " + joinPoint.getSignature() + " START #####");
    	
    	Object[] obj = joinPoint.getArgs();
    	
    	if (obj.length > 0) {
    		Maintenance vo = null;
    		HttpServletRequest req = null;
    		for(Object object : obj) {
    			if(object instanceof HttpServletRequest) {
    				req = (HttpServletRequest) object;
    				String url = (String) req.getRequestURI();
   				 	if(url.indexOf("Ajax") < 0) {
	   				 	for(Object object2 : obj) {
	   		    			if(object2 instanceof Maintenance) {
	   		    				 vo = (Maintenance) object2;
	   		    				 if(StringUtils.equals(System.getProperty("spring.profiles.active"), "local")) {
	   		    					 vo.setMngId("MNG_0000000000000016");
	   		    				 }
	   		    				 break;
	   		    			}
		   				}
		   				break;
		   			}
    			}
    		}
    	}
    }

    /**
     * Method 정상 실행 시
     * @param joinPoint
     * @throws Exception
     */
    @AfterReturning(pointcut ="execution(* com.flk.api..*Controller.*(..))", returning = "returnVal")
    public void commonAfterReturn(JoinPoint joinPoint, Map<String, Object> returnVal) throws Exception {
    	logger.info("##### " + joinPoint.getSignature() + " 정상케이스 #####");
		
		if(!returnVal.containsKey(Constants.RESULT_CODE)) {
			returnVal.put(Constants.RESULT_CODE, ErrorCodeEnum.SUCCESS.getResultCode());
		}
    	if(!returnVal.containsKey(Constants.RESULT_MSG)) {
    		String message = messageUtil.getMessage(ErrorCodeEnum.SUCCESS.getCode());
    		returnVal.put(Constants.RESULT_MSG, message);
    	}
    	
    	logger.info("##### Return value : "+ returnVal + " #####");
    }
    
    /**
     * Method 에외 발생 시
     * @param joinPoint
     * @throws Exception
     */
    @AfterThrowing("execution(* com.flk.api..*Controller.*(..))")
    public void commonAfterThrow(JoinPoint joinPoint) throws Exception {
    	logger.info("##### " + joinPoint.getSignature() + " 예외 발생 #####");
    }
    
    /**
     * API 후처리
     * 
     * @param joinPoint
     * @throws Exception
     */
    @After("execution(* com.flk.api..*Controller.*(..))")
    public void commonAfter(JoinPoint joinPoint) throws Exception {
    	/*logger.info("##### " + joinPoint.getSignature() + " END #####");*/
    }

}
