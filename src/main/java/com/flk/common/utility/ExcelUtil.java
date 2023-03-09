package com.flk.common.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;	

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.ObjectUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;


/**
 * 엑셀 유틸
 * @author devb
 *
 */
public class ExcelUtil {
	
	/** header */
	private static final int HEADER_CNT = 2;
    
	public static List<Map<String, String>> readExcel(MultipartFile uploadFile, String sheetName) throws Exception {

		String fileName = uploadFile.getOriginalFilename();
		String exe = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());

		if (!"xls".equalsIgnoreCase(exe) && !"xlsx".equalsIgnoreCase(exe)) {
			throw new FileNotFoundException();
		}
		
		Workbook workBook = WorkbookFactory.create(uploadFile.getInputStream());
		Sheet sheet = null;
		if(StringUtils.isBlank(sheetName)) {
			sheet = workBook.getSheetAt(0);
		} else {
			sheet = workBook.getSheet(sheetName);
		}
		
		return getExcelData(workBook, sheet);
	}
	

	private static List<Map<String, String>> getExcelData(Workbook workBook, Sheet sheet) throws Exception {

		Row row = null;
		Cell cell = null;
		
		int rows = sheet.getPhysicalNumberOfRows();

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		// 두번째 줄이 키 값(컬럼명)
		row = sheet.getRow(1);
		int cells = row.getPhysicalNumberOfCells();

		String[] colName = new String[cells];

		// 헤더 추출 (쿼리 시 키값으로 사용)
		for (int c = 0; c < cells; c++) {
			cell = row.getCell(c);
			colName[c] = cell.getStringCellValue();
		}

		for (int r = HEADER_CNT; r < rows; r++) {

			Map<String, String> rowMap = new HashMap<String, String>();
			row = sheet.getRow(r);

			for (int c = 0; c < cells; c++) {

				cell = row.getCell(c);
				if (cell == null) {
					continue;
				}

				switch (cell.getCellType()) {

				case Cell.CELL_TYPE_NUMERIC:
					if (DateUtil.isCellDateFormatted(cell)) {
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						if ("".equals(StringUtils.trim(sdf.format(cell.getDateCellValue())))) {
							rowMap.put(colName[c], null);
						} else {
							rowMap.put(colName[c], StringUtils.trim(sdf.format(cell.getDateCellValue())));
						}
					} else {
						rowMap.put(colName[c], String.valueOf(cell.getNumericCellValue()));
					}

					break;
				case Cell.CELL_TYPE_STRING:
					if ("".equals(StringUtils.trim(cell.getStringCellValue()))) {
						rowMap.put(colName[c], null);
					} else {
						rowMap.put(colName[c], StringUtils.trim(cell.getStringCellValue()));
					}

					break;
				case Cell.CELL_TYPE_FORMULA:
					if ("".equals(StringUtils.trim(cell.getCellFormula()))) {
						rowMap.put(colName[c], null);
					} else {
						rowMap.put(colName[c], StringUtils.trim(cell.getCellFormula()));
					}
					break;
				default:
					if ("".equals(StringUtils.trim(cell.getStringCellValue()))) {
						rowMap.put(colName[c], null);
					} else {
						rowMap.put(colName[c], StringUtils.trim(cell.getStringCellValue()));
					}
					break;
				}
			}

			list.add(rowMap);
		}

		return list;
	}

}
