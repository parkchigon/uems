package com.flk.common.interceptor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.MDC;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.flk.common.AuthDefine;
import com.flk.common.utility.CommonLogUtil;
import com.flk.common.utility.DateFormatUtils;
import com.flk.common.utility.RandomStringUtils;
import com.flk.common.utility.RandomUtils;
import com.flk.common.utility.StringUtils;
import com.flk.mng.user.domain.Mng;

/**
 * 컨트롤러의 전반적인 전후 처리를 위한 인터셉터 클래스. <br/>
 * 시스템 점검, 요청 정보 등을 다룬다.
 * 
 */
public class CeWebInterceptor extends HandlerInterceptorAdapter implements MessageSourceAware  {

	
	private static final Logger reqInfoLog  = CommonLogUtil.reqInfoLog;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		/**
		 *  TRACE ID 생성
		 */
		MDC.put("traceId", getTrId(request));
		
		if (reqInfoLog.isInfoEnabled()) {
			
			StringBuilder builder = new StringBuilder();
			
			Mng mng = (Mng)request.getSession().getAttribute(AuthDefine.AUTH_SESSION_VO);
			
			if(mng != null){
				builder.append("\n=========== SessionInfo ").append(mng.toString());
			}
			
			if (("application/json".equalsIgnoreCase(request.getContentType()))) {
				String jsonBody = getRequestBody(request);
				if((jsonBody.indexOf("loginPassword") > -1)){
					builder.append("\n=========== JsonBody ").append("Log Write Filter");
				}else{
					builder.append("\n=========== JsonBody ").append(getRequestBody(request));	
				}
			}
           
			Enumeration<String> enumer = request.getParameterNames();
			
			if(enumer.hasMoreElements()){
				builder.append("\n=========== Parameters  =============\n");
				
				while (enumer.hasMoreElements()) {
					
					String name = enumer.nextElement();
					if (!StringUtils.isNumeric(name)){
						if (request.getParameterValues(name).length > 1){
							builder.append(name + "[]").append("=");
							for (int i = 0 ; i < request.getParameterValues(name).length ; i++ ){
								builder.append((request.getParameterValues(name))[i]);
								if (i == request.getParameterValues(name).length -1){
									if(enumer.hasMoreElements()){
										builder.append("\n");
									}
								} else {
									builder.append(", ");
								}
							}
						} else {
							if(!name.equals("loginPassword") && !name.equals("accountNum")){//계좌번호,비밀번호,제외
								if(StringUtils.isNotEmpty(request.getParameter(name))){
									builder.append(" ").append(name).append(" : ").append(request.getParameter(name)).append("\n");	
								}
							}
						}
					}
				}	
				builder.append("============================================");
			}
			
			StringBuilder reqPackage = new StringBuilder();
			reqPackage.append("[REQ]").append(",").append(request.getRemoteAddr()).append(",")
				.append(request.getMethod()).append(",")
				.append(request.getRequestURI());
			reqPackage.append(builder.toString());
			reqInfoLog.info(reqPackage.toString());
		}
		request.setAttribute("transactionTime", System.currentTimeMillis());
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		
		String dispatcherType = request.getDispatcherType().toString();
		
		if (reqInfoLog.isInfoEnabled()) {
		
			StringBuilder builder = new StringBuilder();
			
			if (!("FORWARD".equalsIgnoreCase(dispatcherType)) && !("INCLUDE".equalsIgnoreCase(dispatcherType))) {
				builder.append("[RES]").append(",");	
			}else{
				builder.append("[RES - " + dispatcherType + "]").append(",");
			}
			
			builder.append(request.getRemoteAddr()).append(",")
				.append(request.getMethod()).append(",")
				.append(request.getRequestURI()).append(",")
				.append((System.currentTimeMillis() - (Long)request.getAttribute("transactionTime")));
			reqInfoLog.info(builder.toString());
		}
		
		if (!("FORWARD".equalsIgnoreCase(dispatcherType.toString())) && !("INCLUDE".equalsIgnoreCase(dispatcherType))) {
			MDC.clear();
		}
		
	}

	public void setMessageSource(MessageSource messageSource) {
		
	}
	
	private String getTrId(HttpServletRequest httpServletRequest){
		return "TR_"+DateFormatUtils.getMillisecondsTime() + RandomStringUtils.randomAlphabetic(1) + RandomUtils.nextInt(10000);
	}	
	
	private String getRequestBody(HttpServletRequest httpServletRequest) throws IOException  {
        BufferedReader reader = new BufferedReader(new InputStreamReader(httpServletRequest.getInputStream()));//TODO 유병운 라이브러리로 변경
        
        String line = null;
        StringBuilder inputBuffer = new StringBuilder();
        do {
         	line = reader.readLine();
        	if (null != line) {
        		inputBuffer.append(line.trim());
        	}
        } while (line != null);
        reader.close();
        return inputBuffer.toString().trim();
    }

}
