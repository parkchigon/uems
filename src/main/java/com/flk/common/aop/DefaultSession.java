package com.flk.common.aop;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.flk.common.service.ServiceConfig;
import com.flk.system.menu.domain.Menu;

@Aspect
@Component
public class DefaultSession {

	/**
	 * 권한별 이용가능한 메뉴정보를 조회하여 메뉴데이타를 생성한다.
	 * 
	 * @param jp
	 * @throws Exception
	 */
	@Before("execution(* com.flk..*Controller.*( .. ))" )
	@Order(1)
	@SuppressWarnings("rawtypes")
	public void defaultSession(JoinPoint jp) throws Exception {

		Object[] obj = jp.getArgs();

		if (obj.length == 0) {
			return;
		}

		HttpServletRequest req = null;

		for (int i = 0; i < obj.length; i++) {
			if (obj[i] instanceof HttpServletRequest) {
				req = (HttpServletRequest) obj[i];
				break;
			}
		}

		if(req == null){
			return;
		}
		
		HttpSession session = req.getSession();

		// 요청한 URL을 구한다
		String currUrl = "";
		if (80 == req.getServerPort()) {
			currUrl = req.getServerName() + req.getRequestURI();
		} else {
			currUrl = req.getServerName() + ":" + req.getServerPort() + req.getRequestURI();
		}

		String roleId = (String) session.getAttribute("ROLE_ID");
		if (roleId == null) {
			// 세션에 롤아이디가 없는 경우 게스트롤 아이디를 셋팅
			session.setAttribute("ROLE_ID", roleId);
		}					

		// 메뉴데이타가 없는 경우만 진행
		if (ServiceConfig.MENU_MAP == null) {
			return;
		}

		@SuppressWarnings("unchecked")
		Set<String> key = ServiceConfig.MENU_MAP.keySet();
		HashMap menuMap = new HashMap();
		String loginUrl = "";
		List programList = null;

		for(Object keyValue : key){
			String roleTp = (String) keyValue;
			if (roleTp.equals(roleId)) {

				HashMap hm = (HashMap) ServiceConfig.MENU_MAP.get(roleTp);
				Set siteKey = hm.keySet();
				for (Iterator siteIterator = siteKey.iterator(); siteIterator.hasNext();) {

					String urlTp = (String) siteIterator.next();
					if (currUrl.indexOf(urlTp) > -1) {

						HashMap siteMap = (HashMap) hm.get(urlTp);
						menuMap = (HashMap) siteMap.get("MENU_MAP");
						loginUrl = (String) siteMap.get("LOGIN_URL");
						programList = (List) siteMap.get("MENU_LIST_MAP");

						// 요청에 대해서 접속 로그를 기록한다.
						Object[] objList = programList.toArray();
						Menu menuVO = new Menu();
						for (int j = 0; j < objList.length; j++) {
							Map map = (Map) objList[j];
							if (req.getRequestURI().equals(map.get("programUrl"))) {
								menuVO.setMenuId((String) map.get("menuId"));
								break;
							}
						}
						break;	                                	
					}
				}
				break;
			}
		}
		// 요청한 url에 대한 권한이 있는지 검사
		req.setAttribute("MENU_MAP", menuMap);
		req.setAttribute("LOGIN_URL", loginUrl);
		req.setAttribute("MENU_LIST_MAP", programList);

	}

}