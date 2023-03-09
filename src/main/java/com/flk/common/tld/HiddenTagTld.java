package com.flk.common.tld;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.flk.common.utility.StringUtils;

public class HiddenTagTld {

	@SuppressWarnings("rawtypes")
	public static String getTagInfo(){

		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();

		Enumeration e = request.getParameterNames();
		String requestInfo = "";
		while( e.hasMoreElements() )
		{
			String key = (String)e.nextElement();
			String[] value = request.getParameterValues( key );
			for( int i = 0; i < value.length; i++ )
			{
				requestInfo += "<input type=\"hidden\" name=\"" + StringUtils.convertCharToAscii( key ) + "\" id=\"" + 
						StringUtils.convertCharToAscii( key ) + "\" value=\"" + StringUtils.convertCharToAscii( value[i] ) + "\">\n";
			}
		}
		return requestInfo;
	}

}

