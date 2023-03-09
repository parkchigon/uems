package com.flk.common.utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class DateFormatUtils extends org.apache.commons.lang.time.DateFormatUtils{

	/**
	 * 오늘날짜시간 : yyyyMMddHHmmss
	 *
	 * @return
	 */
	public static String getMillisecondsTime() {
		return format(Calendar.getInstance(), "yyyyMMddHHmmssSSS", TimeZone.getTimeZone("Asia/Seoul"), Locale.KOREAN);
	}
	
	
	/**
	 * 오늘날짜
	 *
	 * @param dateFormat	포맷
	 * @return
	 */
	public static String getDateFormat(String dateFormat) {
		return format(Calendar.getInstance(), dateFormat, TimeZone.getTimeZone("Asia/Seoul"), Locale.KOREAN);
	}
	
	
	
	public static String getStringDateFormat(String date, String dateFormat) {
		String stringDate = "";
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		DateFormat format1 = new SimpleDateFormat(dateFormat);
		
		try {
			Date getDate = format.parse(date);
			stringDate = format1.format(getDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return stringDate;
	}
	
	
}
