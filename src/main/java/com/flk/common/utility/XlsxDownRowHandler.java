package com.flk.common.utility;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@SuppressWarnings("rawtypes")
public abstract class XlsxDownRowHandler implements ResultHandler {

    private int rowNum;

    @SuppressWarnings("unused")
    private int sheetNum;

    private XSSFWorkbook workbook;

    @SuppressWarnings("unused")
    private XSSFSheet sheet;

    private LinkedHashMap<String, String> excelMap;
    
    @SuppressWarnings("unused")
    private int maxRowCountPerSheet;

    // 엑셀 파일 작성 객체.
    private SpreadsheetWriter shWriter;

    private Map<String, XSSFCellStyle> styles;

    public XlsxDownRowHandler(XSSFWorkbook workbook, Map<String, XSSFCellStyle> wbStyle, SpreadsheetWriter shWriter) {
        this.workbook = workbook;
        this.shWriter = shWriter;

        this.styles = wbStyle;

        init(0);
    }

    public XlsxDownRowHandler(XSSFWorkbook workbook, Map<String, XSSFCellStyle> wbStyle, SpreadsheetWriter shWriter, int maxRowCountPerSheet) {
        this.workbook = workbook;
        this.shWriter = shWriter;

        this.styles = wbStyle;

        init(maxRowCountPerSheet);
    }

    private void init(int maxRowCountPerSheet) {
        this.rowNum = 0;
        this.sheetNum = 1;
        this.excelMap = new LinkedHashMap<String, String>();
        this.excelMap = generateExcelMap();
        this.maxRowCountPerSheet = maxRowCountPerSheet;
    }

    @Override
    public void handleResult(ResultContext rs) {
		Map dataMap = (Map) rs.getResultObject();
        if (this.rowNum == 0) {
        	// header 생성.
            createSheetTiles();
        }
        addRow(dataMap, this.styles.get("data"));
    }

    /**
     * title row 작성
     * 
     * @param wb
     * @param excelMap
     * @return
     */
    private void createSheetTiles() {
        //addRow(this.excelMap, this.styles.get("header"));
        addRowHeader(this.excelMap, this.styles.get("header"));
    }

    /*
     * @SuppressWarnings({ "rawtypes", "unused" }) private void addRow(Map
     * dataMap) throws RuntimeException { addRow(dataMap, null); }
     */
    private void addRow(Map dataMap, XSSFCellStyle cellStyle) throws RuntimeException {
        Iterator keyData = this.excelMap.keySet().iterator();
        int i = 0;
        try {
            this.shWriter.insertRow(this.rowNum);

            while (keyData.hasNext()) {
                String key = (String) keyData.next();
                String value = "";
                if(dataMap.get(key) != null){
                    if(dataMap.get(key) instanceof String){
                        value = (String) dataMap.get(key);
                    }else{
                        if(dataMap.get(key) instanceof Integer){
                            value = ((Integer) dataMap.get(key)).toString();
                        }else if(dataMap.get(key) instanceof Long){
                            value = ((Long) dataMap.get(key)).toString();
                        }else if(dataMap.get(key) instanceof Double){
                            value = ((Double) dataMap.get(key)).toString();
                        }else {
                            value = (dataMap.get(key)).toString();
                        }
                    }                	
                }

                // ** 한글일 때 파일 깨짐.!!!
                value = changeXmlStr(value);
                if (cellStyle != null) {
                	this.shWriter.createCell(i, value, cellStyle.getIndex());
                } else {
                    this.shWriter.createCell(i, value);
                }

                i++;
            }
            this.shWriter.endRow();

        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }

        this.rowNum++;
    }
    
    private void addRowHeader(Map dataMap, XSSFCellStyle cellStyle) throws RuntimeException {
        Iterator keyData = this.excelMap.keySet().iterator();
        int i=0;
        try {
            this.shWriter.insertRow(this.rowNum);

            // 영문 Header
            while (keyData.hasNext()) {
                String key = (String) keyData.next();
                String value = "";
                if(dataMap.get(key) != null){
                	value = key;
                }
                
                if (cellStyle != null) {
                    this.shWriter.createCell(i, value, cellStyle.getIndex());
                } else {
                    this.shWriter.createCell(i, value);
                }
                i++;
            }
            this.shWriter.endRow();
            
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
        this.rowNum++;
        addRow(this.excelMap, this.styles.get("header"));
    }
    
    /**
     * @param param
     * @return
     */
    public static String changeXmlStr(String param) {
        if (param == null)
            param = "";
        else {
            param = param.replaceAll("<", "&lt;");
            param = param.replaceAll(">", "&gt;");
            param = param.replaceAll("&", "&amp;");
        }

        return param;
    }

    /**
     * 
     * @return
     */
    public abstract LinkedHashMap<String, String> generateExcelMap();

    public XSSFWorkbook getWorkbook() {
        return workbook;
    }

    protected LinkedHashMap<String, String> getExcelMap() {
        return excelMap;
    }

    protected void setExcelMap(LinkedHashMap<String, String> excelMap) {
        this.excelMap = excelMap;
    }
}
