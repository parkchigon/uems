package com.flk.common.aop;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.flk.common.exception.AccessDenyException;
import com.flk.common.exception.RoleDenyException;
import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.StringUtils;

@Aspect
@Component
public class LoginCheck {
	/*
     * Manager Login Check
     */
	@Before("execution(* com.flk..*Controller.*( javax.servlet.http.HttpServletRequest, .. ))")
	@Order(2)
	@SuppressWarnings("unchecked")
    public void loginTargetMethod(JoinPoint jp) throws Exception {
        Object[] obj = jp.getArgs();

        if (obj.length > 0) {
        	
            for (int i = 0; i < obj.length; i++) {
                if (obj[i] instanceof HttpServletRequest) {
                    HttpServletRequest req = (HttpServletRequest) obj[i];
                    HttpSession ses = req.getSession();
                    String loginUrl = (String) req.getAttribute("LOGIN_URL");
                    String returnUrl = (String) req.getRequestURI();

                    // 로그인여부 검사
                    if (StringUtils.isEmpty(ses.getAttribute(ServiceConfig.SESSION_KEY_USER_ID))) {
                        req.setAttribute("LOGIN_URL", loginUrl);
                        req.setAttribute("RETURN_URL", returnUrl);
                        throw new AccessDenyException();
                    }
                    
                    // Ajax 요청은 제외하고 프로그램권한 체크한다
                    if(returnUrl.indexOf("Ajax") < 0  && returnUrl.indexOf("/ems/") < 0) {
                        // 요청URL 접근권한 검사
                        String reqUrl = req.getServletPath();
    					List<Map<String, String>> list = (List<Map<String, String>>) req.getAttribute("MENU_LIST_MAP");
                        Object[] objList = list.toArray();
                        String menuId = "$";

                        // 요청URL의 menuId를 구한다.
                        for (int j = 0; j < objList.length; j++) {
                            Map<String, String> map = (Map<String, String>) objList[j];//TODO 수정
                            if (reqUrl.equals(map.get("programUrl"))) {
                                // 접근가능한 URL이면 URL의 menuId를 구한다.
                                menuId += (String) map.get("menuId") + "$";
                            }
                        }

                        // menuId가 없다면 접근권한이 없는 요청이다.
                        if ("$".equals(menuId)) {
                            req.setAttribute("LOGIN_URL", loginUrl);
                            req.setAttribute("RETURN_URL", returnUrl);
                            throw new RoleDenyException(); // 접근권한이 없는 URL처리
                        }

                    }

                    break;
                }
            }
        }
    }

	@Before("execution(* com.flk..*Controller.*Ajax( javax.servlet.http.HttpServletRequest, .. ))")
	@Order(2)
    public void ajaxLoginCheck(JoinPoint jp) throws Exception {
    	
        Object[] obj = jp.getArgs();
        HttpServletRequest req;
        HttpServletResponse res;

        if (obj.length > 0) {
            req = (HttpServletRequest) obj[0];
            res = (HttpServletResponse) obj[1];
            HttpSession ses = req.getSession();

            if ("".equals(ses.getAttribute(ServiceConfig.SESSION_KEY_USER_ID)) || ses.getAttribute(ServiceConfig.SESSION_KEY_USER_ID) == null) {
                String reqLocTp = (String) req.getParameter("reqTp");
                if (StringUtils.isNotEmpty(reqLocTp)) {
                    if (reqLocTp.equals("popup")) {
                        res.setStatus(405);
                    } else {
                        res.setStatus(401);
                    }
                } else {
                    res.setStatus(401);
                }
                throw new AccessDenyException();
            }
        }
    }
}
