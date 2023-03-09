package com.flk.system.program.domain;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 프로그램 도메인
 *
 */
public class Program{
 
	/** 프로그램아이디 */
    private String programId = "";
	
	/** 프로그램명 */
    private String programName = "";
    
	/** 프로그램 URL */
    private String programUrl = "";
    
	/** 시작프로그램여부 */
    private String startProgramYn = "";
    
    /** 등록 일시 */
    private String regDate;
    
    /** 수정 아이디 */
    private String updateId;
    
    /** 수정 일시 */
    private String modDate;
    
    /** 등록 아이디 */
    private String regId;
    
	/** 메뉴아이디 */
    private String menuId = "";
    
    /** 사용 여부 */
    private String useYn;
    
    public String getProgramId() {
        return programId;
    }

    public void setProgramId(String programId) {
        this.programId = programId;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public String getProgramUrl() {
        return programUrl;
    }

    public void setProgramUrl(String programUrl) {
        this.programUrl = programUrl;
    }

    public String getStartProgramYn() {
        return startProgramYn;
    }

    public void setStartProgramYn(String startProgramYn) {
        this.startProgramYn = startProgramYn;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuId() {
        return menuId;
    }

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
