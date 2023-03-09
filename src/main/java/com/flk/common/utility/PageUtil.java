package com.flk.common.utility;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.builder.ToStringBuilder;

import com.flk.common.service.ServiceConfig;

public class PageUtil {

    /**
     * 페이징 HTML
     */
    private String pagingHtml;

    private String pagingName = "currPage";

    private String pagingType = "default";

    private String pagingBody;

    private HttpServletRequest req;

    private List<Object> list;

    private int currPage = 0;

    private int totRecordCount = 0;

    private int blockSize = ServiceConfig.BLOCK_SIZE;

    private int listSize = ServiceConfig.LIST_SIZE;

    private int firstIndex = 0;

    private int lastIndex = 0;
   
    private int startIndex = 0;

    public PageUtil(HttpServletRequest request) {

        this.req = request;
        String reqListSize = (request.getParameter("listSize")==null)?"15":request.getParameter("listSize");

        if (StringUtils.isNotBlank(reqListSize)) {
            this.listSize = Integer.parseInt(reqListSize);
        }
        this.currPage = Integer.parseInt(getParameter(pagingName, "1"));
        this.firstIndex = listSize * (currPage - 1) + 1;
        this.lastIndex = listSize * currPage;
        this.startIndex = listSize * (currPage - 1);
    }

    public PageUtil(HttpServletRequest req, String currPage, String listSize){
  
		this.req = req;
		String url = req.getRequestURI();
		System.out.println("url:" + url);///ems/alarm/alarmList.do
		int currPageInt = 1;
		int listSizeInt;
		if(url.equals("/ems/alarm/alarmList.do")){
			listSizeInt = 23;
		}else{
			listSizeInt = 15;			
		}
		
		currPageInt = (currPage == null || StringUtils.isBlank(currPage)) ? 1 : Integer.parseInt(currPage);
        this.currPage = currPageInt;
        if(url.equals("/ems/alarm/alarmList.do")){
        	listSizeInt = (listSize == null || StringUtils.isBlank(currPage)) ? 23 : Integer.parseInt(listSize);
        }else{
        	listSizeInt = (listSize == null || StringUtils.isBlank(currPage)) ? 15 : Integer.parseInt(listSize);        	
        }
        this.listSize = listSizeInt;
        this.firstIndex = listSizeInt * (currPageInt - 1) + 1;
        this.lastIndex = listSizeInt * currPageInt;
        this.startIndex = listSizeInt * (currPageInt - 1);
	}

	public PageUtil(HttpServletRequest request, String pagingName) {
        this.req = request;
      

        this.pagingName = pagingName;
        String reqListSize = request.getParameter("listSize");

        if (StringUtils.isNotBlank(reqListSize)) {
            this.listSize = Integer.parseInt(reqListSize);
        }

        this.currPage = Integer.parseInt(getParameter(this.pagingName, "1"));
        this.firstIndex = listSize * (currPage - 1) + 1;
        this.startIndex = listSize * (currPage - 1);
        this.lastIndex = listSize * currPage;
    }

    public String getAttribute(String key) {
        String rtn = (String) this.req.getAttribute(key);
        if (StringUtils.isEmpty(rtn)) {
            rtn = "";
        }
        return StringUtils.convertCharToAscii(rtn);
    }

    public String getAttribute(String key, String value) {
        String rtn = (String) this.req.getAttribute(key);
        if (StringUtils.isEmpty(rtn)) {
            rtn = value;
        }
        return StringUtils.convertCharToAscii(rtn);
    }

    public String getParameter(String key) {
        String rtn = this.req.getParameter(key);
        if (StringUtils.isEmpty(rtn)) {
            rtn = "";
        }
        return StringUtils.convertCharToAscii(rtn);
    }

    public String getParameter(String key, String value) {
        String rtn = this.req.getParameter(key);
        if (StringUtils.isEmpty(rtn)) {
            rtn = value;
        }
        return StringUtils.convertCharToAscii(rtn);
    }

  

    /**
     * Request Parameter정보를 input type="hidden" 문자열 생성
     * 
     * @return 문자열
     */
    public String getRequestToHiddenTag() {
        @SuppressWarnings("rawtypes")
        Enumeration e = req.getParameterNames();
        String key = "";
        String requestInfo = "";
        while (e.hasMoreElements()) {
            key = (String) e.nextElement();
            String[] value = req.getParameterValues(key);
            for (int i = 0; i < value.length; i++) {
                requestInfo += "<input type=\"hidden\" name=\"" + StringUtils.convertCharToAscii(key) + "\" id=\"" + StringUtils.convertCharToAscii(key) + "\" value=\"" + StringUtils.convertCharToAscii(value[i]) + "\">\n";
            }
        }

        return requestInfo;
    }

    public int getTotRecordCount() {
        return totRecordCount;
    }

    public void setBlockSize(int blockSize) {
        this.blockSize = blockSize;
    }

    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    public void setList(List list) {
        this.list = list;
        if (list != null && list.size() > 0) {
            Object[] rs = list.toArray();
            if (rs[0] instanceof Map) {
                Map map = (Map) rs[0];
                Object object = map.get("sTotalcount");
                if(object instanceof Integer){
                    this.totRecordCount = ((Number) object).intValue();
                }else if(object instanceof Double){
                    this.totRecordCount = ((Double) object).intValue();
                }else if(object instanceof Long){
                    this.totRecordCount = ((Long) object).intValue();
                }else if(object instanceof String){
                    this.totRecordCount = Integer.parseInt((String)object);
                }else{
                    this.totRecordCount = ((Number) object).intValue();    
                }
            } else {
                this.totRecordCount = 0;
            }

            String formName = "_pageFrm_" + this.pagingName;

            int startPage = 1; // 시작페이지
            int endPage = (this.totRecordCount - 1) / this.listSize + 1; // 마지막페이지

            int prePage = 1; // 이전페이지
            if (this.currPage > 1)
                prePage = this.currPage - 1;
            int nextPage = endPage; // 다음페이지
            if (this.currPage < endPage)
                nextPage = this.currPage + 1;

            int preBlock = 1; // 이전블럭페이지
            if (this.currPage > this.blockSize) {
                preBlock = ((this.currPage - 1) / this.blockSize - 1) * this.blockSize + 1;
            }
            
            int currBlock = 1; // 현재블럭페이지
            
            if (this.currPage > this.blockSize){
                currBlock = ((this.currPage - 1) / this.blockSize) * this.blockSize + 1;
            }
                
            int nextBlock = currBlock + this.blockSize; // 다음블럭페이지
            
            if (nextBlock > endPage){
                nextBlock = endPage;
            }

            int startLoopIdx = currBlock;
            int endLoopIdx = startLoopIdx + this.blockSize - 1;
            
            if (endLoopIdx > endPage){
                endLoopIdx = endPage;
            }

            HashMap pagingMap = (HashMap) ServiceConfig.PAGING_MAP.get(pagingType);

            pagingBody = (String) pagingMap.get("body");
            String pagingNum = (String) pagingMap.get("num");
            String pagingSelectNum = (String) pagingMap.get("select-num");
            String pagingDivision = (String) pagingMap.get("division");
            // String imgPath = ServiceConfig.SERVICE_STATIC_FILE_URL;
            String imgPath = "";

            pagingBody = pagingBody.replaceAll("::formName::", "" + formName);// 페이지이동시submit할폼이름
            pagingBody = pagingBody.replaceAll("::pagingName::", "" + this.pagingName);// 페이징처리할리스트그룹이름
            pagingBody = pagingBody.replaceAll("::startPage::", "" + startPage); // 시작페이지
            pagingBody = pagingBody.replaceAll("::preBlock::", "" + preBlock); // 이전블럭페이지
            pagingBody = pagingBody.replaceAll("::prePage::", "" + prePage); // 이전페이지
            pagingBody = pagingBody.replaceAll("::nextPage::", "" + nextPage); // 다음페이지
            pagingBody = pagingBody.replaceAll("::nextBlock::", "" + nextBlock); // 다음블럭페이지
            pagingBody = pagingBody.replaceAll("::endPage::", "" + endPage); // 마지막페이지
            pagingBody = pagingBody.replaceAll("::totRecordCount::", "" + this.totRecordCount); // 전체글수
            pagingBody = pagingBody.replaceAll("::getCurrPage()::", "" + this.currPage); // 현재페이지

            pagingNum = pagingNum.replaceAll("::formName::", "" + formName);
            pagingNum = pagingNum.replaceAll("::pagingName::", "" + this.pagingName);

            pagingSelectNum = pagingSelectNum.replaceAll("::formName::", "" + formName);
            pagingSelectNum = pagingSelectNum.replaceAll("::pagingName::", "" + this.pagingName);

            String pageHtml = " ";
            
            for (int i = startLoopIdx; i <= endLoopIdx; i++) {
                if (this.currPage == i){
                    pageHtml = pageHtml + pagingSelectNum.replaceAll("::pageNum::", "" + i).replaceAll("::Num::", "" + i);
                }
                else{
                    pageHtml = pageHtml + pagingNum.replaceAll("::pageNum::", "" + i).replaceAll("::Num::", "" + i);
                }
                    
                if (i < endLoopIdx){
                    pageHtml = pageHtml + pagingDivision;
                }
            }
            
            pagingBody = pagingBody.replaceAll("::pagingNumber::", pageHtml);
            pagingBody = pagingBody.replaceAll("::serviceStaticFileURL::", imgPath);

        }
        String action = (String) req.getAttribute("javax.servlet.forward.request_uri");
        
        if (StringUtils.isEmpty(action)){
            action = req.getServletPath();
        }

        pagingHtml = "<form name=\"_pageFrm_" + this.pagingName + "\" method=\"post\" action=\"" + action + "\">\n";
        pagingHtml += getRequestToHiddenTag();
        pagingHtml += "</form>\n";
        pagingHtml += ServiceConfig.PAGING_SCRIPT;
    }

    public void setListSize(int listSize) {
        this.listSize = listSize;
        this.firstIndex = listSize * (currPage - 1) + 1;
        this.lastIndex = listSize * currPage;
    }

    public void setPagingName(String pagingName) {
        this.pagingName = pagingName;
    }

    public void setPagingType(String pagingType) {
        this.pagingType = pagingType;
    }

    public int getBlockSize() {
        return blockSize;
    }

    public int getCurrPage() {
        return currPage;
    }

    public int getFirstIndex() {
        return firstIndex;
    }

    public int getLastIndex() {
        return lastIndex;
    }

    public List<Object> getList() {
        return list;
    }

    public int getListSize() {
        return listSize;
    }

    public String getPagingBody() {
        return pagingBody;
    }

    public String getPagingHtml() {
        return pagingHtml;
    }

    public String getPagingName() {
        return pagingName;
    }

    public String getPagingType() {
        return pagingType;
    }
    
    
    public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	@Override
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
}