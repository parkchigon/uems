package com.flk.common.enums;

public enum FacilityEnum {
	// 01:펌프 
	PUMP("01", "펌프", "pumpCheckView"),
	// 02:열교환기 
	HEATEXC("02", "열교환기" ,"heatexcCheckView"),
	// 03:냉동기 
	CHILLER("03", "냉동기", "chillerCheckView"),
	// 04:축열조 
	HEATSTG("04", "축열조", "heatstgCheckView"),
	// 05:냉각탑 
	CTOWER("05", "냉각탑", "ctowerCheckView"),
	// 06:자동제어 
	AUTOCTRL("06", "자동제어", "autoctrlCheckView"),
	// 07:심야전기MCC
	ELECMSS("07", "심야전기MCC", "elecmccCheckView"),
	;
	
	private String code;
	private String value;
	private String url;
	
	private FacilityEnum(String code, String value, String url) {
		this.code = code;
		this.value = value;
		this.url = url;
	}

	public String getCode() {
		return code;
	}

	public String getValue() {
		return value;
	}
	
	public String getUrl() {
		return url;
	}

	public static FacilityEnum enumOf(String code) {
		if (code == null)
            return null;
        else if (code.equals("01"))
            return PUMP;
        else if (code.equals("02"))
            return HEATEXC;
        else if (code.equals("03"))
            return CHILLER;
        else if (code.equals("04"))
            return HEATSTG;
        else if (code.equals("05"))
            return CTOWER;
        else if (code.equals("06"))
            return AUTOCTRL;
        else if (code.equals("07"))
            return ELECMSS;
        else
            return null;
	}
	
}
