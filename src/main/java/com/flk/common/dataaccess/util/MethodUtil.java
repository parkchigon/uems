package com.flk.common.dataaccess.util;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.ObjectUtils;

public class MethodUtil extends org.apache.commons.lang.reflect.MethodUtils{

	/**
	 * map의 데이터를 Object로 형 변환
	 * @param map
	 * @param obj
	 * @return
	 */
    public static Object convertToOject(FlkMap map, Object obj) {
    	
		for ( Object key : map.keySet() ) {
			try {
				invokeMethod(obj, "set" + StringUtils.capitalize((String) key), ObjectUtils.defaultIfNull(map.get(key), "").toString());
			} catch (Exception e) {
				// setter가 없으면 무시됨.
			}
		}
		
		return obj;
    }
    
    
    public static Object mapToOject(Map<String, Object> map, Object obj) {
    	
		for ( String key : map.keySet() ) {
			try {
				invokeMethod(obj, "set" + StringUtils.capitalize(key), ObjectUtils.defaultIfNull(map.get(key), "").toString());
			} catch (Exception e) {
				// setter가 없으면 무시됨.
			}
		}
		
		return obj;
    }
    
}
