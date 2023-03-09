package com.flk.common.utility;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class UtilityHelper {
	/**
	 * 기능 : 유니코드 문자열을 한글 문자열로 변환한다. param str 유니코드 형식으로 된 문자열
	 * 
	 * @return String 한글 형식으로 변환된 문자열
	 */
	public String uniToKsc(String str) {
		String kscStr = null;
		try {
			if ((str == null) || (str.trim().length() == 0)) {
				kscStr = "";
			} else {
				kscStr = new String(str.getBytes("8859_1"), "KSC5601");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return kscStr;
	}

	/**
	 * 기능 : 한글 문자열을 유니코드 문자열로 변환한다. param str 한글 형식으로 변환된 문자열
	 * 
	 * @return String 유니코드 형식으로 된 문자열
	 */
	public String kscToUni(String str) {
		String uniStr = null;
		try {
			if ((str == null) || (str.trim().length() == 0)) {
				uniStr = "";
			} else {
				uniStr = new String(str.getBytes("8859_1"), "KSC5601");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return uniStr;
	}

	/**
	 * 기능 : 입력된 Object의 null여부를 체크한다. param obj null값을 체크할 Object
	 * 
	 * @return boolean 입력된 Object가 null 이면 true, 입력된 Object가 null 이 아니면 false,
	 */
	public boolean nullCheck(Object obj) {
		boolean nullStatus = false;
		if (obj == null) {
			nullStatus = true;
		} else {
			nullStatus = false;
		}

		return nullStatus;
	}

	/**
	 * 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 ""를 반환한다. param str null값을 체크할 문자열
	 * 
	 * @return String null 값이면 빈 space, null값이 아니면 원래 문자열을 반환한다.
	 */
	public String nullToSpace(String str) {

		try {
			if ((str == null) || (str.trim().length() == 0)) {
				str = "";
			} else {
				str = new String(str.getBytes("8859_1"), "UTF-8");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	/**
	 * 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 str1(초기값)을 반환한다.
	 * 
	 * @param str
	 * @param str1
	 * @return
	 */
	public String nullToSpace(String str, String str1) {
		try {
			if ((str == null) || (str.trim().length() == 0)) {
				str = str1;
			} else {
				str = new String(str.getBytes("8859_1"), "UTF-8");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	/**
	 * 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 ""를 반환한다. param str null값을 체크할 문자열
	 * 
	 * @return String null 값이면 빈 space, null값이 아니면 원래 문자열을 반환한다.
	 */
	public String nullToSpace1(String str) {
		if ((str == null) || (str.trim().length() == 0)) {
			str = "";
		}

		return str;
	}

	/**
	 * 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 str1(초기값)을 반환한다.
	 * 
	 * @param str
	 * @param str1
	 * @return
	 */
	public String nullToSpace1(String str, String str1) {
		if ((str == null) || (str.trim().length() == 0)) {
			str = str1;
		}

		return str;
	}

	/**
	 * 기능 : 입력된 문자열이 null값인지 체크해서 만약 null 값이면 "0"를 반환한다. param str null값을 체크할
	 * 문자열
	 * 
	 * @return String null 값이면 "0" 문자열을, null값이 아니면 원래 문자열을 반환한다.
	 */
	public String nullToZero(String str) {
		if (str == null) {
			return "0";
		} else {
			return str;
		}
	}

	/**
	 * 기능 : token으로 연결된 문자열을 flag를 기준으로 각각 분해하여 새로운 저장소에 담아 반환한다. 만약 입력되는 파라미터중
	 * null값이 있으면 null을 반환한다. param str flag로 연결된 문자열 param token flag(구분자) 기호
	 * 
	 * @return String[] 분리된 데이터 셋
	 */
	public String[] tokenToList(String str, String flag) {
		String[] list = null;
		if (str == null || flag == null) {
		} else {
			StringTokenizer token = new StringTokenizer(str, flag);
			list = new String[token.countTokens()];
			for (int i = 0; token.hasMoreTokens(); i++) {
				list[i] = token.nextToken().trim();
			}
		}

		return list;
	}

	/**
	 * 기능 : token으로 연결된 문자열을 flag를 기준으로 각각 분해하여 새로운 저장소에 담아 반환한다. 만약 입력되는 파라미터중
	 * null값이 있으면 null을 반환한다. param str flag로 연결된 문자열 param token flag(구분자) 기호,
	 * token이 null이거나 빈 스페이스일 경우 "-"를 기본값으로 한다. param options 빈 문자열로 분리된 문자열에 대한
	 * 처리여부 true : 빈 문자도 하나의 문자열로 처리하여 배열에 담는다. false : 빈 문자는 비어있는데이터로 간주한다.
	 * 
	 * @return String[] 분리된 데이터 셋
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String[] tokenToList(String str, String flag, boolean options) {
		String[] list = null;

		if (flag == null || flag.length() == 0) {
			flag = "-";
		}

		if (str == null) {
		} else {
			if (options) {
				Vector tempList = new Vector();
				int startIndex = -1;
				int endIndex = str.indexOf(flag);

				while (endIndex != -1) {
					tempList.add(str.substring(startIndex + 1, endIndex));
					startIndex = endIndex;
					endIndex = str.indexOf(flag, startIndex + 1);
				}
				if (str.lastIndexOf(flag) != -1) {
					tempList.add(str.substring(startIndex + 1, str.length()));
				}

				list = new String[tempList.size()];
				for (int i = 0; i < list.length; i++) {
					list[i] = (String) tempList.get(i);
				}
				if (list != null && list.length > 0) {
					list[list.length - 1] = str.substring(startIndex + 1, str.length());
				}
			} else {
				list = tokenToList(str, flag);
			}
		}

		return list;
	}

	/**
	 * 기능 : 문자열이 flag1으로 연결되어 있고, 그렇게 연결된 문자열들이 flag2로 다시 여러개 연결되어 있을 경우 flag2을
	 * 기준으로 분리한뒤, flag1으로 다시 각각의 문자열을 분리하여 배열에 담은 뒤 각각의 배열을 벡터에 담아 반환한다. 만약 입력되는
	 * 파라미터중 null값이 있으면 null을 반환한다. 예를 들면
	 * tokenToList("20020101,20020201,20020301*1,2,3", "*", ",") 이런 메소드가 호출 되었을
	 * 경우 우선 "*"을 기준으로 두개의 문자열로 분리하고, 각각 두개의 문자열을 ","로 분리하여 배열에 담은뒤 벡터에 두개의 배열을
	 * 담아 반환한다. param str 변환할 문자열 param flag1 큰 단위의 구분자 param flag2 작은 단위의 구분자
	 * 
	 * @return Vector 분리된 데이터 셋
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Vector tokenToList(String str, String flag1, String flag2) {
		Vector totalList = null;
		String[] smallList = null; // 첫번째 구분자를 분리하여 담는 배열
		if (str == null || flag1 == null || flag2 == null) {
		} else {
			totalList = new Vector();
			smallList = tokenToList(str, flag1);
			for (int i = 0; i < smallList.length; i++) {
				totalList.add(tokenToList(smallList[i], flag2));
			}
		}

		return totalList;
	}

	/**
	 * 기능 : 리스트 자료구조에 담겨져 있는 문자열을 입력된 flag로 연결하여 하나의 문자열로 반환한다. 만약 입력되는 파라미터중
	 * null값이 있으면 null을 반환한다. param arr 연결할 문자열이 들어있는 자료구조
	 * 
	 * @return String flag로 연결된 새로운 문자열
	 */
	public String listToToken(String[] arr, String flag) {
		String tokenStr = "";
		if (arr == null || flag == null) {
		} else {
			StringBuffer buffer = new StringBuffer();
			for (int i = 0; i < arr.length; i++)
				buffer.append((arr[i] == null ? "" : arr[i].trim()) + flag);
			tokenStr = buffer.toString().substring(0, buffer.length() - 1);
		}

		return tokenStr;
	}

	/**
	 * 기능 : Replace String str에서 rep에 해당하는 String을 tok로 replace
	 * 
	 * @param str
	 *            string
	 * @param rep
	 *            string
	 * @param tok
	 *            string
	 * @return 새로운 string
	 */
	public String getReplace(String str, String rep, String tok) {
		String retStr = "";

		if (str == null)
			return "";
		if (str.equals(""))
			return "";

		for (int i = 0, j = 0; (j = str.indexOf(rep, i)) > -1; i = j + rep.length()) {
			retStr += (str.substring(i, j) + tok);
		}
		return (str.indexOf(rep) == -1) ? str
				: retStr + str.substring(str.lastIndexOf(rep) + rep.length(), str.length());
	}

	/**
	 * 기능 : 입력된 문자열에서 특정문자열을 새로운 문자열로 변환하여 반환한다. 문자열 전체에 대해서 검색해서 변환 작업을 실행한다.
	 * param str 변경할 문자열 입력 데이터 param oldChar 변경 대상 문자열행 param newChar 변경할 새로운
	 * 문자열
	 * 
	 * @return String 변환된 문자열
	 */
	public String replace(String str, String oldStr, String newStr) {
		StringBuffer returnStr = new StringBuffer();
		if ((str != null) && (oldStr != null) && (newStr != null)) {
			int oldStrIndex = str.indexOf(oldStr);
			int oldStrLength = oldStr.length();

			while (oldStrIndex != -1) {
				returnStr.append(str.substring(0, oldStrIndex) + newStr);
				str = str.substring((oldStrIndex + oldStrLength), str.length());
				oldStrIndex = str.indexOf(oldStr);
			}
			returnStr.append(str);
		} else {
			returnStr = new StringBuffer((str == null) ? "" : str);
		}

		return returnStr.toString();
	}

	/**
	 * 기능 : 입력된 스트링 배열의 각 요소에 flag 기호를 붙인뒤, 배열의 순서대로 하나의 문자열로 연결하여 반환한다. (문자열을
	 * 붙일때 구분자는 ","를 사용한다.) SQL문의 WHERE 조건 중에서 IN 조건을 사용시 편리하다. param arr 변경할
	 * 스트링 배열 param flag 스트링에 붙일 기호
	 * 
	 * @return String 하나로 연결된 문자열
	 */
	public String addFlag(String arr[], String flag) {
		String newStr = "";
		if (arr == null || flag == null) {
		} else {
			try {
				for (int i = 0; i < arr.length; i++) {
					newStr += ", " + flag + arr[i] + flag;
				}
			} catch (Exception e) {
				newStr = "";
			}
		}

		return (newStr.length() > 2) ? newStr.substring(2, newStr.length()) : "";
	}

	/**
	 * 기능 : 입력된 스트링에 flag 기호를 붙여 반환한다. SQL문의 WHERE 조건 중에서 IN 조건을 사용시 편리하다.
	 * 
	 * @param str
	 *            변경할 문자열
	 * @param strFlag
	 *            문자열의 구분자
	 * @param flag
	 *            새로운 스트링에 붙일 기호
	 * @return String 새로 생성된 문자열
	 */
	public String addFlag(String str, String strFlag, String flag) {
		String newStr = "";
		int flaLength = 0;
		if (str == null || strFlag == null || flag == null) {
		} else {
			StringTokenizer token = new StringTokenizer(str, strFlag);
			flaLength = strFlag.length();
			try {
				while (token.hasMoreTokens()) {
					newStr += (strFlag + flag + token.nextToken() + flag);
				}
			} catch (Exception e) {
				newStr = "";
			}
		}

		return (newStr.length() > flaLength) ? newStr.substring(flaLength, newStr.length()) : "";
	}

	/**
	 * 기능 : 입력된 스트링에 flag 기호를 찾아 삭제한 후 문자열을 반환한다. param str 변경할 문자열 param flag
	 * 삭제할 기호
	 * 
	 * @return String 삭제된 문자열
	 */
	public String removeFlag(String str, String flag) {
		if (str == null || flag == null) {
		} else {
			try {
				int flagLength = flag.length();
				int findIndex = str.indexOf(flag);
				int fromIndex = 0;
				while (findIndex > -1) {
					str = str.substring(0, findIndex) + str.substring(findIndex + flagLength, str.length());
					fromIndex = findIndex;
					findIndex = str.indexOf(flag, fromIndex);
				}
			} catch (Exception e) {
				str = "";
			}
		}

		return str;
	}

	/**
	 * 기능 : 입력된 문자열의 오른쪽에 index의 길이만큼 문자열을 붙여 반환한다. param str 문자열 param index
	 * 문자열이 붙여진 후 최종 문자열의 길이 param addStr 추가하여 붙일 문자
	 * 
	 * @return String 추가된 문자열
	 */
	public String fillRigth(String str, int index, String addStr) {
		int gap = 0;
		if ((str != null) && (addStr != null) && (str.length() <= index)) {
			gap = index - str.length();

			for (int i = 0; i < gap; i++) {
				str = str + addStr;
			}
		}

		return str;
	}

	/**
	 * 기능 : 입력된 문자열의 왼쪽에 index의 길이만큼 문자열을 붙여 반환한다. param str 문자열 param index
	 * 문자열이 붙여진 후 최종 문자열의 길이 param addStr 추가하여 붙일 문자
	 * 
	 * @return String 추가된 문자열
	 */
	public String fillLeft(String str, int index, String addStr) {
		int gap = 0;
		if ((str != null) && (addStr != null) && (str.length() <= index)) {
			gap = index - str.length();

			for (int i = 0; i < gap; i++) {
				str = addStr + str;
			}
		}

		return str;
	}

	/**
	 * 텍스트의 길이를 체크한다. 한글처리시 자바에서는 유니코드로 처리하기 때문에 byte로 변환하여 체크한다. 2003.10.27.
	 * 하정연 추가
	 * 
	 * @param String
	 *            텍스트
	 * @param int
	 *            max length byte
	 * @return boolean
	 */
	public boolean chkStringLen(String sStr, int iLen) {

		byte[] bTemp;
		boolean rtnFlag = false;

		if (sStr == null || sStr.length() == 0) {
			rtnFlag = false;
		} else {
			bTemp = sStr.getBytes();

			if (iLen >= bTemp.length) {
				rtnFlag = true;
			}
		}
		return rtnFlag;
	}

	/**
	 * 스트링 문자를 아스키코드값으로 리턴한다.(글자 하나)
	 * 
	 * @param String
	 * @return String
	 */
	public String strToAscCode(String orgStr) {
		String codeStr = null; // 아스키코드값

		if (orgStr == null || orgStr.length() == 0) {
			codeStr = "";
		} else {
			codeStr = String.valueOf(orgStr.hashCode()).trim();
		}

		return codeStr;
	}

	/**
	 * 기능 : 일반전화 문자열을 분해하여 새로운 저장소에 담아 반환한다. param str 일반전화 문자열
	 * 
	 * @return String[] 분리된 데이터 셋
	 */
	public String[] telSplitList(String str) {
		String[] list = new String[3];
		if (str == null) {
		} else if (str.length() == 0) {
			list[0] = "";
			list[1] = "";
			list[2] = "";
		} else if (str.length() == 7 || str.length() == 8) {
			// 1588-0000 인경우
			list[0] = "";
			list[1] = str.substring(0, str.length() - 4);
			list[2] = str.substring(str.length() - 4, str.length());
		} else if (str.length() > 8) {
			if ("080".equals(str.substring(0, 3))) {
				// 080-000-0000 경우
				list[0] = str.substring(0, 3);
				list[1] = str.substring(list[0].length(), str.length() - 4);
				list[2] = str.substring(str.length() - 4, str.length());
			} else if ("0502".equals(str.substring(0, 4)) || "0503".equals(str.substring(0, 4))
					|| "0505".equals(str.substring(0, 4)) || "0506".equals(str.substring(0, 4))) {
				// 0505-0000-0000 등경우
				list[0] = str.substring(0, 4); // 앞자리가 무조건 4자리라고봄
				list[1] = str.substring(list[0].length(), str.length() - 4);
				list[2] = str.substring(str.length() - 4, str.length());
			} else {
				if ("02".equals(str.substring(0, 2))) {
					// 지역이 서울이면...
					list[0] = str.substring(0, 2);

					if (str.length() > 2) {
						list[1] = str.substring(list[0].length(), str.length() - 4);
						list[2] = str.substring(str.length() - 4, str.length());
					} else {
						list[1] = "";
						list[2] = "";
					}
				} else {
					list[0] = str.substring(0, 3);
					if (str.length() > 3) {
						list[1] = str.substring(list[0].length(), str.length() - 4);
						list[2] = str.substring(str.length() - 4, str.length());
					} else {
						list[1] = "";
						list[2] = "";
					}
				}
			}
		}
		return list;
	}

	/**
	 * 기능 : 인자로 받은 일반전화문자를 조합하여 반환 param str 처음 번호 param str 가운데 번호 param str
	 * 마지막 번호
	 * 
	 * @return String 조합된 일반전화 문자열
	 */
	public String telNoSplit(String num1, String num2, String num3) {
		String phone = "";
		if (num1 == null || num2 == null || num3 == null) {
		} else if ((num2 + num3).length() == 0) {
			phone = "";
		} else {
			phone = num1 + num2 + num3;
		}

		return phone;
	}

	/**
	 * 기능 : 전화번호를 하이픈붙여서 반환(예021231234 => 02-123-1234 ) param str -이 없는 전화번호
	 * 
	 * @return String 조합된 일반전화 문자열
	 */
	public String telNum(String str) {
		String tel = "";
		String[] list = new String[3];

		if (str == null) {
		} else {
			list = telSplitList(str);
			if (list[0].equals("") && list[1].equals("") && list[2].equals("")) {
				tel = "";
			} else if (list[0].length() == 0) {
				tel = list[1] + "-" + list[2];
			} else {
				tel = list[0] + "-" + list[1] + "-" + list[2];
			}
		}
		return tel;
	}

	/**
	 * Paging을 위한 HTML 코드를 얻는다. (전달되는 변수값이 많을때)
	 * 
	 * @param page
	 * @param scale
	 * @param total_records
	 * @param method
	 * @param keyword
	 * @param fileNM
	 * @param addField
	 * @param addValue
	 * @return trimmed string
	 */
	public String getUserPaging(int page, int max_line, int scale, int total_records, String fileNM, String[] addField,
			String[] addValue, String SITE_CODE) {
		int iStart, iEnd, go, totalpage;
		String pagingStr = "";

		totalpage = ((total_records - 1) / max_line) + 1;

		String iconPrevStart = "<img src=\"/images/" + SITE_CODE
				+ "/button/ic_arrow_first.gif\" alt=\"처음\" border=\"0\"/>";
		String iconPrev = "<img src=\"/images/" + SITE_CODE + "/button/ic_arrow_front.gif\" alt=\"이전\" border=\"0\"/>";
		String iconNext = "<img src=\"/images/" + SITE_CODE + "/button/ic_arrow_next.gif\" alt=\"다음\" border=\"0\"/>";
		String iconNextEnd = "<img src=\"/images/" + SITE_CODE + "/button/ic_arrow_end.gif\" alt=\"끝\" border=\"0\"/>";

		// 페이지 별로 바로 가기 만들기
		iStart = ((page - 1) / scale) * scale + 1;
		iEnd = (((page - 1) + scale) / scale) * scale;

		if (totalpage <= iEnd)
			iEnd = totalpage;

		pagingStr += "<FORM NAME='frmGoList' METHOD='post' ACTION='" + fileNM + "'>";
		pagingStr += "<INPUT TYPE='hidden' NAME='page'>";

		for (int i = 0; i < addField.length; i++)
			pagingStr += "<INPUT TYPE='hidden' NAME='" + addField[i] + "' VALUE='" + addValue[i] + "'>";

		pagingStr += "</FORM>";

		pagingStr += "<SCRIPT LANUGAGE='JavaScript'>";
		pagingStr += "function goPage(page) {";
		pagingStr += "  document.frmGoList.page.value = page;";
		pagingStr += "  document.frmGoList.submit();";
		pagingStr += "}</SCRIPT>";

		pagingStr += "<table width=100% height=40 cellpadding=0 cellspacing=0 border=0>";
		pagingStr += "<tr><td align=center style='padding-right:5px;padding-left:5px;'>";

		pagingStr += "<span>";
		pagingStr += "<a href='javascript:goPage(1);'>" + iconPrevStart + "</a>";
		// 이전 페이지 블럭으로
		if (page > scale)
			pagingStr += "<a href='javascript:goPage(" + (iStart - scale) + ");'>" + iconPrev + "</a></span>\n";
		else
			pagingStr += iconPrev + "</span>\n";

		for (go = iStart; go <= iEnd; go++) {

			if (go == page)
				pagingStr += "<span class='s_text_orange_b'>" + go + "</b>\n";
			else
				pagingStr += "<a href='javascript:goPage(" + go + ");' class='s_text'>" + go + "</a>\n";
		}

		pagingStr += "<span>";

		// 다음의 페이지 블럭으로
		if (totalpage > iEnd)
			pagingStr += "<a href='javascript:goPage(" + (iEnd + 1) + ");'>" + iconNext + "</a>";
		else
			pagingStr += iconNext + "";

		pagingStr += "<a href='javascript:goPage(" + totalpage + ");'>" + iconNextEnd + "</a>";
		pagingStr += "</span>";

		pagingStr += "</td>";
		pagingStr += "</tr>";
		pagingStr += "</table>";
		return pagingStr;
	}

	/**
	 * Paging을 위한 HTML 코드를 얻는다. (전달되는 변수값이 많을때)
	 * 
	 * @param page
	 * @param scale
	 * @param total_records
	 * @param method
	 * @param keyword
	 * @param fileNM
	 * @param addField
	 * @param addValue
	 * @return trimmed string
	 */
	public String getPaging(int page, int max_line, int scale, int total_records, String fileNM, String[] addField,
			String[] addValue) {
		int iStart, iEnd, go, totalpage;
		String pagingStr = "";
		String SITE_CODE = "konetic";

		totalpage = ((total_records - 1) / max_line) + 1;

		String iconPrevStart = "<img src=\"/images/" + SITE_CODE
				+ "/button/ic_arrow_first.gif\" alt=\"처음\" border=\"0\"/>";
		String iconPrev = "<img src=\"/images/" + SITE_CODE + "/button/ic_arrow_front.gif\" alt=\"이전\" border=\"0\"/>";
		String iconNext = "<img src=\"/images/" + SITE_CODE + "/button/ic_arrow_next.gif\" alt=\"다음\" border=\"0\"/>";
		String iconNextEnd = "<img src=\"/images/" + SITE_CODE + "/button/ic_arrow_end.gif\" alt=\"끝\" border=\"0\"/>";

		// 페이지 별로 바로 가기 만들기
		iStart = ((page - 1) / scale) * scale + 1;
		iEnd = (((page - 1) + scale) / scale) * scale;

		if (totalpage <= iEnd)
			iEnd = totalpage;

		pagingStr += "<FORM NAME='frmGoList' METHOD='post' ACTION='" + fileNM + "'>";
		pagingStr += "<INPUT TYPE='hidden' NAME='page'>";

		for (int i = 0; i < addField.length; i++)
			pagingStr += "<INPUT TYPE='hidden' NAME='" + addField[i] + "' VALUE='" + addValue[i] + "'>";

		pagingStr += "</FORM>";

		pagingStr += "<SCRIPT LANUGAGE='JavaScript'>";
		pagingStr += "function goPage(page) {";
		pagingStr += "  document.frmGoList.page.value = page;";
		pagingStr += "  document.frmGoList.submit();";
		pagingStr += "}</SCRIPT>";

		pagingStr += "<table width=100% height=40 cellpadding=0 cellspacing=0 border=0>";
		pagingStr += "<tr><td align=center style='padding-right:5px;padding-left:5px;'>";

		pagingStr += "<span>";
		pagingStr += "<a href='javascript:goPage(1);'>" + iconPrevStart + "</a>";
		// 이전 페이지 블럭으로
		if (page > scale)
			pagingStr += "<a href='javascript:goPage(" + (iStart - scale) + ");'>" + iconPrev + "</a></span>\n";
		else
			pagingStr += iconPrev + "</span>\n";

		for (go = iStart; go <= iEnd; go++) {

			if (go == page)
				pagingStr += "<span class='s_text_orange_b'>" + go + "</b>\n";
			else
				pagingStr += "<a href='javascript:goPage(" + go + ");' class='s_text'>" + go + "</a>\n";
		}

		pagingStr += "<span>";

		// 다음의 페이지 블럭으로
		if (totalpage > iEnd)
			pagingStr += "<a href='javascript:goPage(" + (iEnd + 1) + ");'>" + iconNext + "</a>";
		else
			pagingStr += iconNext + "";

		pagingStr += "<a href='javascript:goPage(" + totalpage + ");'>" + iconNextEnd + "</a>";
		pagingStr += "</span>\n";

		pagingStr += "</td>";
		pagingStr += "</tr>";
		pagingStr += "</table>";

		return pagingStr;
	}

	/**
	 * 답변할때 >표시하기
	 */
	public String replyForm(String s) {
		int i = s.length();
		StringBuffer stringbuffer = new StringBuffer(i + 500);
		for (int j = 0; j < i; j++)
			if (s.charAt(j) == '\n')
				stringbuffer.append("&gt;");
			else
				stringbuffer.append(s.charAt(j));

		return stringbuffer.toString();
	}

	/**
	 * String을 원하는 byte만큼 자른다
	 * 
	 * @param _str
	 *            원본 String
	 * @param _max
	 *            원하는 바이트수 자르고 싶은 바이트수
	 * @return
	 */
	public static String getSubStr(String _str, int _max, String tail) {
		int int_byte = 0;
		String returnStr = "";
		int total_byte = _str.getBytes().length;

		if (total_byte <= _max) {
			returnStr = _str;
		} else {
			for (int i = 0; i < _max; i++) {
				String temp = "";
				temp = "" + _str.charAt(i);
				int_byte = int_byte + temp.getBytes().length;

				if (int_byte <= _max) {
					returnStr = returnStr + temp;
				} else {
					break;
				}
			}
			returnStr += tail;
		}

		return returnStr;
	}

	/**
	 * JavaScript alert 창을 띄운후, 지정된 url로 이동한다.
	 * 
	 * @param msg
	 * @param url
	 * @return javascript alert string value
	 */
	public static String redirectMsg(String msg, String url) {
		return ("<script>alert('" + msg + "');window.location='" + url + "';</script>");
	}

	/**
	 * JavaScript alert 창을 띄운후, 지정된 url로 이동한다.
	 * 
	 * @param msg
	 * @param url
	 * @return javascript alert string value
	 */
	public static String MsgBox(String msg, String script, String url) {
		String Mscript = "<Script Language='JavaScript'>";
		if (!msg.equals(""))
			Mscript += "alert('" + msg + "');";
		if (!script.equals(""))
			Mscript += script;
		if (!url.equals(""))
			Mscript += "window.location.href='" + url + "';";
		Mscript += "</Script>";
		return (Mscript);
	}

	/**
	 * *************************************************************************
	 * **********************************************************
	 * CommonUtils.java
	 * *********************************************************
	 * *****************
	 * *********************************************************
	 */

	/**
	 * EUC-KR 를 8859-1로 변환
	 * 
	 * @param strText
	 *            바꿀려는 문자열
	 * @return 바뀐 문자열
	 */
	public static String convertEUC(String strText) {
		try {

			strText = nullCheck(strText);
			return new String(strText.getBytes("EUC-KR"), "8859_1");
		} catch (IOException e) {
			return strText;
		}
	}

	/**
	 * 8859-1 를 EUC-KR로 변환
	 * 
	 * @param strText
	 *            바꿀려는 문자열
	 * @return 바뀐 문자열
	 */
	public static String convertKOR(String strText) {
		try {
			strText = nullCheck(strText);
			return new String(strText.getBytes("8859_1"), "EUC-KR");
		} catch (IOException e) {
			return strText;
		}
	}

	/**
	 * 해당 항목이 선택되었을 경우 Selected를 지정하는 함수
	 * 
	 * @param strValue1
	 *            비교값 1
	 * @param strValue2
	 *            비교값 2
	 * @return "selected"
	 */
	public static String isSelected(String strValue1, String strValue2) {
		strValue1 = strValue1.trim();
		strValue2 = strValue2.trim();
		if (strValue1.equals(strValue2) == true) {
			return " selected";
		} else {
			return "";
		}
	}

	/**
	 * 해당 항목이 체크되었을 경우 checked를 지정하는 함수
	 * 
	 * @param strValue1
	 *            비교값 1
	 * @param strValue2
	 *            비교값 2
	 * @return "checked"
	 */
	public static String isChecked(String strValue1, String strValue2) {
		if (strValue1.equals(strValue2) == true) {
			return " checked";
		} else {
			return "";
		}
	}

	/**
	 * 널 객체가 넘어왔을때 널스트링을 리턴하는 함수
	 * 
	 * @param strValue
	 *            널체크를 할 문자열
	 * @return 널 체크가 된 스트링
	 */
	public static String nullCheck1(String str) {
		if ((str == null) || (str.trim().length() == 0)) {
			str = "";
		}

		return str;
	}

	/**
	 * 널 객체가 넘어왔을때 널스트링을 리턴하는 함수
	 * 
	 * @param strValue
	 *            널체크를 할 문자열
	 * @return 널 체크가 된 스트링
	 */
	public static String nullCheck(String strValue) {
		return nullCheck(strValue, "");
	}

	/**
	 * 특정 문자로 널 첵크를 한다.
	 * 
	 * @param strReturn
	 *            널체크를 할 문자열
	 * @param strValue
	 *            널일 경우 리턴할 문자열
	 * @return 널 체크가 된 스트링
	 */
	public static String nullCheck(String strReturn, String strValue) {
		if (isEmpty(strReturn))
			strReturn = strValue;

		// 실서버추가
		try {
			strReturn = new String(strReturn.getBytes("8859_1"), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return strReturn;
	}

	/**
	 * 문자열공백여부 체크한다
	 * 
	 * @param strValue
	 *            공백체크할 를 할 문자열
	 * @return boolean
	 */
	public static boolean isEmpty(String strValue) {
		if (strValue == null || strValue.toLowerCase().equals("null") || strValue.equals(""))
			return true;
		else
			return false;
	}

	/**
	 * 기본값이 intValue인 문자열을 정수형으로 변환
	 * 
	 * @param strValue
	 *            바꿀 문자열
	 * @param intValue
	 *            에러 발생시 리턴 시킬 정수
	 * @return int형
	 */
	public static int convertINT(String strValue, int intValue) {
		try {
			int i = Integer.parseInt(strValue);
			return i;
		} catch (Exception e) {
			return intValue;
		}
	}

	/**
	 * 기본값이 0인 문자열을 정수형으로 변환
	 * 
	 * @param strValue
	 *            바꿀 문자열
	 * @return int형
	 */

	public static int convertINT(String strValue) {
		return convertINT(strValue, 0);
	}

	/**
	 * 주어진 형식에 따른 날짜나 시간을 가져오는 함수
	 * 
	 * @param dateType
	 *            날짜형 타입
	 * @return 날짜
	 */
	private static String sysTime(String dateType) {
		java.util.Date date = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(dateType);
		return dateFormat.format(date);
	}

	/**
	 * 현재 날짜를 기본형으로 가져오는 함수 (YYYY-MM-DD)
	 * 
	 * @return 날짜
	 */
	public static String getTime() {
		return sysTime("yyyy-MM-dd");
	}

	/**
	 * 현재 날짜를 가져오는 함수 (사용자 정의 형태)
	 * 
	 * @param dateType
	 *            날짜형 타입
	 * @return 날짜
	 */
	public static String getTime(String dateType) {
		return sysTime(dateType);
	}

	/**
	 * String을 long형으로 변환할때 예외발생시 특정값으로 대체하는 함수
	 * 
	 * @param strValue
	 *            바꿀 문자열
	 * @param lngValue
	 *            에러 발생시 리턴 시킬 롱형
	 * @return long형
	 */
	public static long convertLNG(String strValue, long lngValue) {
		try {
			long lng = Long.parseLong(strValue);
			return lng;
		} catch (Exception e) {
			return lngValue;
		}
	}

	/**
	 * String을 long형으로 변환할때 예외발생시 0으로 대체하는 함수
	 * 
	 * @param strValue
	 *            바꿀 문자열
	 * @return long형
	 */
	public static long convertLNG(String strValue) {
		return convertLNG(strValue, 0);
	}

	/**
	 * String을 double형으로 변환할때 예외발생시 특정값으로 대체하는 함수
	 * 
	 * @param strValue
	 *            바꿀 문자열
	 * @param dblValue
	 *            에러 발생시 리턴 시킬 롱형
	 * @return double형
	 */
	public static double convertDBL(String strValue, double dblValue) {
		try {
			double dbl = Double.parseDouble(strValue);
			return dbl;
		} catch (Exception e) {
			return dblValue;
		}
	}

	/**
	 * String을 double형으로 변환할때 예외발생시 0으로 대체하는 함수
	 * 
	 * @param strValue
	 *            바꿀 문자열
	 * @return double형
	 */
	public static double convertDBL(String strValue) {
		return convertDBL(strValue, 0);
	}

	/**
	 * 문자열의 3자리마다 , 를 포함시키는 메서드
	 * 
	 * @param strValue
	 *            기본문자열
	 * @return ,가 포함된 문자열
	 */
	private static String addComma(String strValue) {
		String strRtn = "";
		try {
			DecimalFormat decFormat = new DecimalFormat("###,###");
			long lNumber = Long.parseLong(strValue);
			strRtn = decFormat.format(lNumber).toString();
		} catch (Exception e) {
		}
		return strRtn;
	}

	/**
	 * int Type 숫자에서 3자리마다 "," 표시하는 함수
	 * 
	 * @param intValue
	 *            기본 정수형
	 * @return ,가 포함된 문자열
	 */
	public static String makeComma(int intValue) {
		String strRtn = "0";
		try {
			strRtn = Integer.toString(intValue);
		} catch (Exception e) {
			strRtn = "0";
		}
		return addComma(strRtn);
	}

	/**
	 * long Type 숫자에서 3자리마다 "," 표시하는 함수
	 * 
	 * @param lngValue
	 *            기본 롱형
	 * @return ,가 포함된 문자열
	 */
	public static String makeComma(long lngValue) {
		String strRtn = "0";
		try {
			strRtn = Long.toString(lngValue);
		} catch (Exception e) {
			strRtn = "0";
		}
		return addComma(strRtn);
	}

	/**
	 * 문자열 에서 3자리마다 "," 표시하는 함수
	 * 
	 * @param strValue
	 *            기본 문자열
	 * @return ,가 포함된 문자열
	 */
	public static String makeComma(String strValue) {
		return addComma(strValue);
	}

	/**
	 * Method cropByte. 문자열 바이트수만큼 끊어주고, 생략표시하기
	 * 
	 * @param str
	 *            문자열
	 * @param i
	 *            바이트수
	 * @param trail
	 *            생략 문자열. 예) "..."
	 * @return String
	 */
	public static String getTokenLength(String str, int i, String trail) {
		if (isEmpty(str))
			return "";
		String tmp = str;
		int slen = 0, blen = 0;
		char c;
		try {
			if (tmp.getBytes("MS949").length > i) {
				while (blen + 1 < i) {
					c = tmp.charAt(slen);
					blen++;
					slen++;
					if (c > 127)
						blen++; // 2-byte character..
				}
				tmp = tmp.substring(0, slen) + trail;
			}
		} catch (java.io.UnsupportedEncodingException e) {
		}
		return tmp;
	}

	/**
	 * 주어진 문자열 특정길이 부터 <BR>
	 * TAG를 삽입한다.
	 * 
	 * @param strValue
	 *            기본 문자열
	 * @return <BR>
	 *         TAG가 포함된 문자열
	 */
	public static String convertBRTAG(String strValue) {
		String tempStr = "";
		for (int i = 0; i < strValue.length(); i++) {
			if (strValue.charAt(i) == '\n')
				tempStr = tempStr + "<BR>\n";
			tempStr = tempStr + strValue.substring(i, i + 1);
		}
		return tempStr;
	}

	/**
	 * 파라미터로 받은 클래스의 새로운 인스턴스를 생성한다.
	 * 
	 * @param className
	 * @return 객체
	 * @exception Exception
	 */
	public static Object createObject(String className) throws Exception {
		return createObject(Class.forName(className));
	}

	/**
	 * 파라미터로 받은 객체의 새로운 인스턴스를 생성한다.
	 * 
	 * @param classObject
	 * @return 객체
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public static Object createObject(Class classObject) throws Exception {
		return classObject.newInstance();
	}

	/**
	 * 파라미터로 받은 스트링 객체를 delim 으로 token 하여 배열로 반환 한다
	 * 
	 * @param strVal
	 * @param token
	 * @return String[]
	 */
	public static String[] getTokenToArray(String strVal, String delim) {
		StringTokenizer st = new StringTokenizer(strVal, delim);
		int cnt = 0;
		int i = 0;
		cnt = st.countTokens();
		String result[] = new String[cnt];

		while (st.hasMoreTokens()) {
			result[i++] = st.nextToken();
		}
		return result;
	}


	/** 숫자의 왼쪽 자리를 '0'으로 채운다. */
	public static String padLeftwithZero(int convert, int size) {
		Integer inTemp = new Integer(convert);
		String stTemp = new String();
		StringBuffer stReturn = new StringBuffer();

		stTemp = inTemp.toString();
		if (stTemp.length() < size)
			for (int i = 0; i < size - stTemp.length(); i++)
				stReturn.append("0");

		return (stReturn.append(stTemp).toString());
	}

	// 위 메소드 확장 , padding string을 지정한다. 왼쪽으로 패딩
	public static String padLeftwithZero(int convert, int size, String padString) {
		Integer inTemp = new Integer(convert);
		String stTemp = new String();
		StringBuffer stReturn = new StringBuffer();

		stTemp = inTemp.toString();
		if (stTemp.length() < size)
			for (int i = 0; i < size - stTemp.length(); i++)
				stReturn.append(padString);

		return (stReturn.append(stTemp).toString());
	}

	// 위 메소드 확장 , padding string을 지정한다. 오른쪽으로 패딩
	public static String padRightwithZero(int convert, int size, String padString) {
		Integer inTemp = new Integer(convert);
		String stTemp = new String();
		StringBuffer stReturn = new StringBuffer();

		stTemp = inTemp.toString();
		if (stTemp.length() < size)
			for (int i = 0; i < size - stTemp.length(); i++)
				stReturn.append(padString);

		return (stTemp + stReturn.toString());
	}

	// 소수점자리 연산
	public static float roundx(float src, int arg) {
		int temp = 10;
		float result = 0.0f;
		if (src == 0.0f) {
			return 0;
		}
		for (int i = 1; i < arg; i++) {
			temp *= temp;
		}
		if (arg == 0) {
			result = Math.round(src * arg);
		} else {
			result = Math.round(src * temp) / (temp * 1.0f);
		}
		return result;
	}

	/**
	 * 마지막 날짜 가져오기
	 * 
	 * @param nYear
	 * @param nMonth
	 * @return int
	 * @throws Exception
	 */
	public static int getLastDay(int nYear, int nMonth) throws Exception {
		int nResult = 0;
		if (nMonth == 1 || nMonth == 3 || nMonth == 5 || nMonth == 7 || nMonth == 8 || nMonth == 10 || nMonth == 12) {
			nResult = 31;
		} else if (nMonth == 4 || nMonth == 6 || nMonth == 9 || nMonth == 11) {
			nResult = 30;
		} else if (nMonth == 2) {
			if ((nYear % 4 == 0) && (nYear % 100 != 0 || nYear % 400 == 0)) {
				nResult = 29;
			} else {
				nResult = 28;
			}
		}
		return nResult;
	}

	/**
	 * xml decode
	 * 
	 * @param strText
	 * @return
	 */
	public static String GetDecodeText(String strText) {
		if (strText == null)
			return "";
		String strRet;

		try {
			strText = strText.replaceAll("_DPY_", "%");
			strRet = java.net.URLDecoder.decode(strText, "utf-8");
			strRet = strRet.replaceAll("&amp;", "&");
			strRet = strRet.replaceAll("&quot;", "\"");
			strRet = strRet.replaceAll("&lt;", "<");
			strRet = strRet.replaceAll("&gt;", ">");
		} catch (UnsupportedEncodingException e) {
			strRet = "";
		}
		return strRet;
	}

	/**
	 * xml incode
	 * 
	 * @param strText
	 * @return
	 */
	public static String GetEncodeText(String strText) {

		if (strText == null)
			return "";
		String strRet;

		try {
			strText = strText.replaceAll("%", "_DPY_");
			strRet = java.net.URLDecoder.decode(strText, "utf-8");
			strRet = strRet.replaceAll("&", "&amp;");
			strRet = strRet.replaceAll("\"", "&quot;");
			strRet = strRet.replaceAll("<", "&lt;");
			strRet = strRet.replaceAll(">", "&gt;");
		} catch (UnsupportedEncodingException e) {
			strRet = "";
		}
		return strRet;
	}

	/**
	 * 기능 : 입력된 쿠키명을 가지고 쿠키값을 반환한다. param request param cookie_name 쿠키명
	 * 
	 * @return String 쿠키값
	 */
	public String getCookieValue(HttpServletRequest request, String cookie_name) {
		String strRet = "";

		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(cookie_name)) {
					strRet = cookies[i].getValue();
					break;
				}
			}
		}

		return strRet;
	}

	/**
	 * 기능 : 입력된 쿠키명을 가지고 쿠키값을 반환한다. param request param cookie_name 쿠키명
	 * 
	 * @return String 쿠키값
	 */
	public String getSiteCode(HttpServletRequest request) {
		String strRet = "";

		// 지점 코드값을 세션에서 가져온다.
		String SITE_CODE = (String) request.getSession().getAttribute("SITE_CODE");
		SITE_CODE = nullCheck(SITE_CODE);

		String cook_site_code = "";
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("site_code")) {
					cook_site_code = cookies[i].getValue();
					break;
				}
			}
		}

		if ("".equals(SITE_CODE))
			strRet = cook_site_code;
		else
			strRet = SITE_CODE;

		return strRet;
	}

	public String addZero(String data, int zeroCnt) {
		String rtnStr = "";
		String temp = "";

		if (data != null && !data.equals("")) {
			for (int i = 0; i < zeroCnt; i++) {
				temp = rtnStr + data;

				if (temp.length() >= zeroCnt) {
					break;
				}
				rtnStr += "0";
			}
		}
		rtnStr = temp;

		return rtnStr;
	}

}