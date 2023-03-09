package com.flk.common.tld;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MenuTld {

    /** The logger. */
    //private static Logger logger = LoggerFactory.getLogger(MenuUtil.class);

    @SuppressWarnings("rawtypes")
    public static String getMenuUrl(HashMap menuMap, Object[] programList){

		String programUrl = "";
		ArrayList subMenuList = (ArrayList) menuMap.get("subNodeList");
		HashMap subMenuMap = new HashMap();
		if(subMenuList.size() > 0){
			subMenuMap = (HashMap) subMenuList.get(0);
			String menuId = (String) subMenuMap.get("menuId");
			for(int i = 0; i < programList.length; i++){
				Map programMap = (Map) programList[i];
				String programMenuId = (String) programMap.get("menuId");
				if(StringUtils.equals(menuId, programMenuId) && StringUtils.equals("Y", (String) programMap.get("startProgramYn"))){
					programUrl = (String) programMap.get("programUrl");
					break;
				}
			}
		}else{
			programUrl = (String) menuMap.get("programUrl");
		}

		if(programUrl == null || StringUtils.isEmpty(programUrl))
			programUrl = getMenuUrl(subMenuMap, programList);

		return programUrl;
	}

    @SuppressWarnings("rawtypes")
	public static String getMenuNavi(HashMap menuMap, String menuId){
		String menuNavi = "";
		ArrayList subNodeList = (ArrayList) menuMap.get("subNodeList");
		HashMap subMenuMap = new HashMap();
		for (int i = 0; i < subNodeList.size(); i++){
			subMenuMap = (HashMap) subNodeList.get(i);
			if (StringUtils.equals(menuId, (String) subMenuMap.get("menuId"))){
				menuNavi = (String) subMenuMap.get("menuName");
				break;
			}

			menuNavi = getMenuNavi(subMenuMap, menuId);
			if(StringUtils.isNotEmpty(menuNavi)){
				menuNavi = subMenuMap.get("menuName") + " &gt; " + menuNavi;
				break;
			}
		}

		return menuNavi;
	}

	@SuppressWarnings("rawtypes")
	public static String getMenuPath(HashMap menuMap, String menuId){
		String menuPath = "";
		ArrayList subNodeList = (ArrayList) menuMap.get("subNodeList");
		HashMap subMenuMap = new HashMap();
		for (int i = 0; i < subNodeList.size(); i++) {
			subMenuMap = (HashMap) subNodeList.get(i);
			if (menuId.equals((String) subMenuMap.get("menuId"))) {
				menuPath = (String) subMenuMap.get("menuId");
				break;
			}

			menuPath = getMenuPath(subMenuMap, menuId);
			if(StringUtils.isNotEmpty(menuPath)){
				menuPath = subMenuMap.get("menuId") + "," + menuPath;
				break;
			}
		}

		return menuPath;
	}
 
    public static HttpServletRequest getRequest(){
    	ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    	HttpServletRequest request = sra.getRequest();
    	return request;
    }
    
    @SuppressWarnings("rawtypes")
    public static JSONArray getMenuInfo(){
    	
    	HttpServletRequest request = getRequest();
    	
    	HashMap topMenuMap = (HashMap)request.getAttribute("MENU_MAP"); // 전체메뉴정보
		ArrayList menuList = (ArrayList)topMenuMap.get("subNodeList"); // 메뉴리스트
		List programList = (List)request.getAttribute("MENU_LIST_MAP"); // 프로그램리스트
		Object[] objProgramList = programList.toArray();
		String requestUrl = (String)request.getAttribute("javax.servlet.forward.request_uri"); //요청URL
		String menuNavi = ""; // 네비게이션에 보여줄 현재 메뉴위치
		String menuId = "";	// 선택된 메뉴아이디
		HashMap selectTopMenuMap = null; // 선택된 메뉴

		// 요청url 해당하는 menuId를 조회한다.
		for(int i = 0; i < objProgramList.length; i++){
			Map programMap = (Map)objProgramList[i];
			if(StringUtils.equals(requestUrl, (String)programMap.get("programUrl"))){
				menuId = (String)programMap.get("menuId");
				request.setAttribute("MENU_ID", menuId);
				break;
			}
		}
		
		// 메뉴수만큼 루프돌면서 탑메뉴를 구성한다.
		String selectMenuCheck = "";
		JSONArray jsonArr = new JSONArray();
		for(int i = 0; i < menuList.size(); i++){
			JSONObject obj = new JSONObject();
			HashMap menuMap = (HashMap)menuList.get(i);
			if(StringUtils.isEmpty(menuNavi)) menuNavi = getMenuNavi(menuMap, menuId);
			
			selectMenuCheck = "";//선택메뉴초기화
			
			if(StringUtils.isNotEmpty(menuNavi) && selectTopMenuMap == null){
				selectTopMenuMap = menuMap;
				selectMenuCheck = "on";
			}
			if(StringUtils.equals("Y", (String)menuMap.get("useYn"))){
				obj.put("menuUrl", getMenuUrl(menuMap, objProgramList));
				obj.put("menuName", menuMap.get("menuName"));
				obj.put("menuOn", selectMenuCheck);
			}
			
			jsonArr.add(obj);
		}
		
		return jsonArr;
    }
    
    @SuppressWarnings("rawtypes")
    public static JSONArray getSubMenuInfo(){
    	
    	HttpServletRequest request = getRequest();
    	HashMap topMenuMap = (HashMap)request.getAttribute("MENU_MAP"); // 전체메뉴정보
		ArrayList menuList = (ArrayList)topMenuMap.get("subNodeList"); // 메뉴리스트
		List programList = (List)request.getAttribute("MENU_LIST_MAP"); // 프로그램리스트
		Object[] objProgramList = programList.toArray();
		String requestUrl = (String)request.getAttribute("javax.servlet.forward.request_uri"); //요청URL
		String menuNavi = ""; // 네비게이션에 보여줄 현재 메뉴위치
		String menuId = "";	// 선택된 메뉴아이디
		String menuPath = ""; // 선택된 메뉴의 상위메뉴코드 포함된 문자열
		HashMap selectTopMenuMap = null; // 선택된 메뉴

		// 요청url 해당하는 menuId를 조회한다.
		for(int i = 0; i < objProgramList.length; i++){
			Map programMap = (Map)objProgramList[i];
			if(StringUtils.equals(requestUrl, (String)programMap.get("programUrl"))){
				menuId = (String)programMap.get("menuId");
				break;
			}
		}
		
		// 메뉴수만큼 루프돌면서 탑메뉴를 구성한다.
		for(int i = 0; i < menuList.size(); i++)
		{
			HashMap menuMap = (HashMap)menuList.get(i);
			if(StringUtils.isEmpty(menuNavi)) menuNavi = getMenuNavi(menuMap, menuId);
			if(StringUtils.isEmpty(menuPath)) menuPath = getMenuPath(menuMap, menuId);
			
			if(StringUtils.isNotEmpty(menuNavi) && selectTopMenuMap == null){
				selectTopMenuMap = menuMap;
			}
		}
    	
    	ArrayList selectMenuList = (ArrayList)selectTopMenuMap.get("subNodeList");

    	JSONArray jsonArr = new JSONArray();
    	jsonArr.add(0, selectTopMenuMap.get("menuName"));	// 최상단메뉴이름
    	
    	if(selectMenuList != null){
    		for(int i = 0; i < selectMenuList.size(); i++){
    			JSONObject obj = new JSONObject();
    			JSONArray json2Arr = new JSONArray();
    			HashMap menuMap = (HashMap)selectMenuList.get(i);
    			String currMenuId = (String)menuMap.get("menuId");
    			
    			/** 2depth*/
    			String menuOn = "";
    			String menu2Style = "";
    			if(menuPath.indexOf(currMenuId) > -1){
    				menuOn = "on";
    				menu2Style = "display: block;";
    			}
    			
    			obj.put("menuUrl", getMenuUrl(menuMap, objProgramList));
    			obj.put("menuName", menuMap.get("menuName"));	
    			obj.put("menuOn", menuOn);
    			obj.put("menu2Style", menu2Style);
    			
    			ArrayList subNodeList = (ArrayList)menuMap.get("subNodeList");
    			/** 3depth*/
			    for(int j = 0; j < subNodeList.size(); j++){
			    	JSONObject obj2 = new JSONObject();
			        HashMap menu2Map = (HashMap)subNodeList.get(j);
			        
			        // 해당 2뎁스 메뉴의 하위뎁스메뉴만
	    			if(StringUtils.equals((String) menuMap.get("menuId"), (String) menu2Map.get("parentmenuId"))) {
				        obj2.put("menu2Url", getMenuUrl(menu2Map, objProgramList));
				        obj2.put("menu2Name", menu2Map.get("menuName"));
				        json2Arr.add(obj2);
	    			}
			    }
			    obj.put("menu2List", json2Arr);
			    jsonArr.add(obj);
    		}
    	}
    	return jsonArr;
	}
    
}
