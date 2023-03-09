 package com.flk.ems.build.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.domain.Constants;
import com.flk.common.utility.ExcelUtilRowhandler;
import com.flk.common.utility.LogUtil;
import com.flk.common.utility.StringUtils;
import com.flk.ems.alarm.domain.Alarm;
import com.flk.ems.build.domain.PlcComm;
import com.flk.ems.build.domain.SystemTemplate;
import com.flk.ems.build.service.BuildService;
import com.flk.ems.system.domain.RawData;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.domain.Tag;
import com.flk.ems.trend.service.TrendService;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.domain.SiteGroup;
import com.flk.mng.site.service.SiteGroupService;
import com.flk.mng.site.service.SiteService;
import com.flk.mng.user.domain.Mng;
import com.flk.system.code.service.CodeService;

/**
 * 구축
 *
 */
@Controller
public class BuildController {

	private Logger logger = LogUtil.serviceLog;
	
	@Value("#{code['plc.protocol.cdId']}")
	private String plcProtocolCdId;			// 프로토콜
	@Value("#{code['com.port.cdId']}")
	private String comPortCdId;				// 포트번호
	@Value("#{code['com.baud.cdId']}")
	private String comBaudCdId;				// 포트속도
	@Value("#{code['bit.data.cdId']}")
	private String bitDataCdId;				// 데이터비트
	@Value("#{code['bit.parity.cdId']}")
	private String bitParityCdId;			// 패리티비트
	@Value("#{code['bit.stop.cdId']}")
	private String bitStopCdId;				// 스톱비트
	@Value("#{code['tx.ctrl.cdId']}")
	private String txCtrlCdId;				// Tx 흐름제어
	@Value("#{code['rx.ctrl.cdId']}")
	private String rxCtrlCdId;				// Rx 흐름제어
	
	@Value("#{code['tag.kind.cdId']}")
	private String tagKindCdId;				// 태그 유형
	@Value("#{code['ai.unit.cdId']}")
	private String aiUnitCdId;				// AI 단위
	@Value("#{code['a.cutovervalue.cdId']}")
	private String aCutovervalueCd;			// 계산범위초과	
	@Value("#{code['ao.calcfilter.cdId']}")
	private String aoCalcfilterCdId;		// AO 계산필터
	@Value("#{code['ai.alarmtype.cdId']}")
	private String aiAlarmtypeCdId;			// AI 알람 경보 조건
	@Value("#{code['i.alarmpriority.cdId']}")
	private String iAlarmpriorityCdid;		// 알람 우선순위
	@Value("#{code['i.alarwav.cdId']}")
	private String iAlarmwavCdid;		// 경보 음성파일
	@Value("#{code['i.alarmimg.cdId']}")
	private String iAlarmimgCdid;		// 경보 그래픽파일
	
	@Autowired
	private SiteService siteService;
	
	@Autowired
	private BuildService buildService;

	@Autowired
	private SiteGroupService siteGroupService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private TrendService trendService;
	
	@Autowired
	private SqlSession sqlSession;

	
	/**
	 * 지점 관리
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/siteManage.do")
	public String searchSiteManage(HttpServletRequest request, HttpServletResponse response, ModelMap model, @ModelAttribute("plcComm") PlcComm plcComm) throws Exception {
		Site siteView = new Site();
		PlcComm plcCommView = new PlcComm(); 
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		
		if(siteInfo != null) {
			// 사이트 정보 조회
			siteView.setSiteId(siteInfo.getSiteId());
	        FlkMap map = siteService.searchSiteView(siteView);
	        if(map != null) {
	        	siteView = (Site) MethodUtil.convertToOject(map, siteView);
	        }
	        // PLC 통신설정 조회
	        plcCommView.setSiteCd(siteInfo.getSiteCd());
	        plcCommView = buildService.selectPlcCommView(plcCommView);
		}
		model.addAttribute("siteView", siteView);	// 지점정보
		model.addAttribute("plcCommView", plcCommView);	// PLC 통신설정 정보

		// 그룹 리스트		
		SiteGroup siteGroup = new SiteGroup(1, Constants.YES);
		List<FlkMap> groupAllList = siteGroupService.searchSiteGroupList(siteGroup);
		model.addAttribute("groupAllList", groupAllList);
		
		model.addAttribute("plcProtocolCdId", codeService.searchCodeList(plcProtocolCdId));	// 프로토콜
		model.addAttribute("comPortCdId", codeService.searchCodeList(comPortCdId));			// 포트번호
		model.addAttribute("comBaudCdId", codeService.searchCodeList(comBaudCdId));			// 포트속도
		model.addAttribute("bitDataCdId", codeService.searchCodeList(bitDataCdId));			// 데이터비트
		model.addAttribute("bitParityCdId", codeService.searchCodeList(bitParityCdId));		// 패리티비트
		model.addAttribute("bitStopCdId", codeService.searchCodeList(bitStopCdId));			// 스톱비트
		model.addAttribute("txCtrlCdId", codeService.searchCodeList(txCtrlCdId));			// Tx 흐름제어
		model.addAttribute("rxCtrlCdId", codeService.searchCodeList(rxCtrlCdId));			// Rx 흐름제어
		
		return "/ems/build/siteManage";
	}
	
	
	/**
	 * 지점관리 등록 및 수정
	 * 
	 * @param request
	 * @param response
	 * @param plcComm
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/siteManageRegistExe.do")
	public String addSite(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("plcComm") PlcComm plcComm, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		plcComm.setRegId(loginVo.getMngId());
		plcComm.setUpdateId(loginVo.getMngId());

		// 등록일 경우
		if(StringUtils.isBlank(plcComm.getSiteId())){
			Site site = new Site();
			site.setSiteCd(plcComm.getSiteCd());
			if(siteService.checkExistSiteCd(site)) {	// siteCd 중복체크
				buildService.insertSiteManage(plcComm, session);
				siteService.createSiteDbTable(plcComm.getSiteCd());
				//buildService.createSiteDbTable();
			} else {
				model.addAttribute("resultMsg", "fail.isExist.siteCd");
			}
		} else { // 수정일 경우
			buildService.updateSiteManage(plcComm, session);
			siteService.createSiteDbTable(plcComm.getSiteCd());
			//buildService.createSiteDbTable(plcComm.getSiteCd());
		}
		
		return "forward:/Relay.do?_forward_page=/ems/build/siteManage.do";
		
	}
	
	
	/**
	 * 태그 관리
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param plcComm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/tagManage.do")
	public String searchTagManage(HttpServletRequest request, HttpServletResponse response, ModelMap model, Tag tag) throws Exception {
		
		model.addAttribute("tagKindCdId", codeService.searchCodeList(tagKindCdId));					// 태그유형
		model.addAttribute("aiUnitCdId", codeService.searchCodeList(aiUnitCdId));					// AI 단위
		model.addAttribute("aCutovervalueCd", codeService.searchCodeList(aCutovervalueCd));			// 계산 범위 초과
		model.addAttribute("aoCalcfilterCdId", codeService.searchCodeList(aoCalcfilterCdId));		// AO 계산필터
		model.addAttribute("aiAlarmtypeCdId", codeService.searchCodeList(aiAlarmtypeCdId));			// AI 알람 경보 조건
		model.addAttribute("iAlarmpriorityCdid", codeService.searchCodeList(iAlarmpriorityCdid));	// 알람 우선순위
		model.addAttribute("iAlarmwavCdid", codeService.searchCodeList(iAlarmwavCdid));				// 경보 음성파일
		model.addAttribute("iAlarmimgCdid", codeService.searchCodeList(iAlarmimgCdid));				// 경보 그래픽파일
		
		return "/ems/build/tagManage";
	}
	
	
	/**
	 * 태그 리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/selectTagListAjax.do")
	@ResponseBody
	public Map<String, Object> selectTagListAjax(HttpServletRequest request, HttpServletResponse response, Tag tag) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = buildService.selectTagList(tag);
		return resultMap;
	}
	
	
	/**
	 * 태그 등록 및 수정
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/tagRegistExe.do")
	public String addTag(HttpServletRequest request, HttpServletResponse response, Tag tag, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		tag.setRegId(loginVo.getMngId());
		tag.setUpdateId(loginVo.getMngId());

		// 등록일 경우
		if(StringUtils.equals(tag.getRegistYn(), Constants.YES)){
			if(buildService.checkExistTagId(tag)) {	// tagId 중복체크
				buildService.insertTag(tag);
			} else {
				model.addAttribute("resultMsg", "fail.isExist.tagId");
			}
			
		} else { // 수정일 경우
			buildService.updateTag(tag);
		}
		return "forward:/Relay.do?_forward_page=/ems/build/tagManage.do";
	}
	
	
	/**
	 * 태그 삭제 
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/tagRemoveExe.do")
	public String deleteTag(HttpServletRequest request, HttpServletResponse response, Tag tag) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		tag.setRegId(loginVo.getMngId());
		buildService.deleteTag(tag);
		
		return "forward:/Relay.do?_forward_page=/ems/build/tagManage.do";
	}
	
	
	/**
	 * 태그 상세 조회
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/selectTagViewAjax.do")
	@ResponseBody
	public Map<String, Object> selectTagViewAjax(HttpServletRequest request, HttpServletResponse response, Tag tag) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = buildService.selectTagView(tag);
		return resultMap;
	}
	
	
	/**
	 * 태그리스트 엑셀 다운로드
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param tag
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/tagListExcelDownload.do")
	public void tagListExcelDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model, Tag tag) throws Exception {
		
		ExcelUtilRowhandler excelUtilRowhandler = new ExcelUtilRowhandler();
		
		LinkedHashMap<String, String> headerMap = new LinkedHashMap<String, String>();
		headerMap.put("siteCd", "지점코드");
		headerMap.put("tagId", "태그ID");
		headerMap.put("tagTypeCd", "태그종류");
		headerMap.put("tagTypeCdName", "태그종류명");
		headerMap.put("tagKindCd", "태그유형");
		headerMap.put("tagDesc", "태그설명");
		headerMap.put("tagConnTypeCd", "태그 연결종류");
		headerMap.put("iPlcscanAddress", "PC메모리주소");
		headerMap.put("iScanTime", "검색 시간");
		headerMap.put("aiMemtypeCd", "메모리종류 코드");
		headerMap.put("aiUnitCd", "단위 코드");
		headerMap.put("aiDisplayFormat", "표시형식");
		headerMap.put("aiCalcFilterCd", "계산필터 코드");
		headerMap.put("aConvertBase", "변환값 Base");
		headerMap.put("aConvertFull", "변환값 Full");
		headerMap.put("aConvertPlcbase", "변환값 PlcBase");
		headerMap.put("aConvertPlcfull", "변환값 PlcFull");
		headerMap.put("aiCalcScript", "계산 스크립트");
		headerMap.put("aCutoverValueCd", "계산범위 초과시 코드");
		headerMap.put("dOnDescription", "digital ON설명");
		headerMap.put("dOffDescription", "digital OFF설명");
		headerMap.put("iAlarmUseFlag", "경보사용여부");
		headerMap.put("aiAlarmHigh", "경보레벨 High");
		headerMap.put("aiAlarmLow", "경보레벨 Low");
		headerMap.put("aiAlarmTypeCd", "AI 경보조건 코드");
		headerMap.put("diAlarmTypeCd", "DI 경보조건 코드");
		headerMap.put("iAlarmImgCd", "경보이미지파일 코드");
		headerMap.put("iAlarmWavCd", "경보음성파일 코드");
		headerMap.put("aiAlarmProtectPercent", "과변화시 경보지연 (%변화시)");
		headerMap.put("aiAlarmProtectSecond", "과변화시 경보지연 (초간지연)");
		headerMap.put("iAlarmPriorityCd", "경보우선순위코드");
		headerMap.put("iDataSaveFlag", "통계저장여부");
		headerMap.put("iOutputUseFlag", "INPUT태그에서 출력으로 사용여부");
		headerMap.put("oPlcscanStation", "출력 PLC국번");
		headerMap.put("oPlcscanAddress", "출력 PLC메모리주소");
		headerMap.put("oPlcscanExtra1", "출력 PLC 추가정보1");
		headerMap.put("oPlcscanExtra2", "출력 PLC 추가정보2");
		headerMap.put("aoCalcFilterCd", "계산필터코드");
		headerMap.put("aoCalcScript", "AO 계산스크립트");
		headerMap.put("doRelayTypeCd", "릴레이종류");
		headerMap.put("doRelayPulseSec", "릴레이 펄스시간");
		headerMap.put("doDelayOnSec", "릴레이 ON지연시간");
		headerMap.put("doDelayOffSec", "릴레이 OFF지연시간");
		headerMap.put("useFlag", "사용여부");
		headerMap.put("regId", "등록 아이디");
		headerMap.put("regDate", "등록 일자");
		headerMap.put("updateId", "변경 아이디");
		headerMap.put("updateDate", "변경일자");
		
		excelUtilRowhandler.createXlsxDown("com.flk.ems.build.mapper.BuildMapper.selectTagList", tag, headerMap, response, "태그리스트" , sqlSession);
	}
	
	/**
	 * 태그 엑셀 업로드
	 * 
	 * @param request
	 * @param response
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/ems/build/tagListExcelUpload.do")
	public String tagListExcelUpload(HttpServletRequest request, HttpServletResponse response, Tag tag, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		tag.setRegId(loginVo.getMngId());
		tag.setUpdateId(loginVo.getMngId());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = buildService.uploadTagListExcel(tag);
		buildService.insertTagRegisterLog((Map<String, Object>) resultMap.get("paramMap"));
		
		model.addAllAttributes(resultMap);
		
		return "forward:/Relay.do?_forward_page=/ems/build/tagManage.do";
	}
	
	/**
	 * 계통도 선택 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/diagramSelect.do")
	public String selectDiagram(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate, ModelMap model) throws Exception {
		
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		systemTemplate.setSiteId(siteInfo.getSiteId());
		systemTemplate.setSubmenuId(Constants.SubMenu.SYS01);
		model.addAttribute("flowInfo", buildService.selectSystemSubmenuSite(systemTemplate));
		model.addAttribute("flowTypeList", buildService.selectTemplateList(systemTemplate));	// 계통도 패턴
		
		systemTemplate.setSubmenuId(Constants.SubMenu.SYS02);
		model.addAttribute("gridInfo", buildService.selectSystemSubmenuSite(systemTemplate));
		model.addAttribute("gridTypeList", buildService.selectTemplateList(systemTemplate));	// 그리드 패턴
		return "/ems/build/diagramSelect";
	}
	
	
	/**
	 * 계통도/그리드 타입 선택
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/templateRegistExe.do")
	public String addTemplate(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		systemTemplate.setRegId(loginVo.getMngId());
		buildService.insertSystemSubmenuSite(systemTemplate);
		
		return "forward:/Relay.do?_forward_page=/ems/build/diagramSelect.do";
	}
	
	
	/**
	 * 계통도 설정 (좌) 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/diagramSetL.do")
	public String diagramSetL(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate, ModelMap model) throws Exception {
		
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(siteInfo.getSiteId(), Constants.SubMenu.SYS01);	// 빙축열 탭 (좌측화면)
		
		// 좌측 계통도  css_path 조회
		String cssFilePath = buildService.selectSubMenuCss(systemTagMap);
		model.addAttribute("cssFilePath", cssFilePath);
		
		systemTemplate.setSiteId(siteInfo.getSiteId());
		systemTemplate.setSubmenuId(Constants.SubMenu.SYS01);	// 빙축열>계통도(좌)
		systemTemplate = buildService.selectTemplateInfo(systemTemplate);
		if(systemTemplate == null) {
			throw new Exception("templateInfo null");
		}
		
		model.addAttribute("templateInfo", systemTemplate);
		
		// 태그 리스트
		RawData rawData = new RawData();
		rawData.setSiteCd(siteInfo.getSiteCd());
		model.addAttribute("tagList", trendService.searchTagList(rawData));
		
		return "/ems/build/diagramSetL";
	}
	
	
	/**
	 * 계통도 설정 (좌/우) 설정
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/diagramSetRegistExe.do")
	public String addDiagramSetL(HttpServletRequest request, HttpServletResponse response, SystemTagMap systemTagMap) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		systemTagMap.setRegId(loginVo.getMngId());
		systemTagMap.setUpdateId(loginVo.getMngId());
		// 이전에 등록된 관련없는 template ID 삭제
		buildService.deleteOtherSystemTagMapping(systemTagMap);
		// 등록
		buildService.insertSystemTagMapping(systemTagMap);
		
		return "forward:/Relay.do?_forward_page="+systemTagMap.getRedirectUrl();
	}
	
	/**
	 * 태그 매핑 조회
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/selectTagMappingListAjax.do")
	@ResponseBody
	public Map<String, Object> selectTagMappingListAjax(HttpServletRequest request, HttpServletResponse response, SystemTagMap systemTagMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = buildService.selectSystemTagMapping(systemTagMap);
		return resultMap;
	}
	
	
	/**
	 * 계통도 설정 (우) 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/diagramSetR.do")
	public String diagramSetR(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate, ModelMap model) throws Exception {
		
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		
		systemTemplate.setSiteId(siteInfo.getSiteId());
		systemTemplate.setSubmenuId(Constants.SubMenu.SYS02);	// 빙축열>계통도(우)
		systemTemplate = buildService.selectTemplateInfo(systemTemplate);
		if(systemTemplate == null) {
			throw new Exception("templateInfo null");
		}
		model.addAttribute("templateInfo", systemTemplate);
		
		// 태그 리스트
		RawData rawData = new RawData();
		rawData.setSiteCd(siteInfo.getSiteCd());
		model.addAttribute("tagList", trendService.searchTagList(rawData));
		// 알람태그 리스트
		rawData.setiAlarmUseFlag(Constants.YES);
		model.addAttribute("alarmTagList", trendService.searchTagList(rawData));
		
		return "/ems/build/diagramSetR";
	}
	
	
	/**
	 * 설정메뉴 선택 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/settingSelect.do")
	public String settingSelect(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate, ModelMap model) throws Exception {
		
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		systemTemplate.setSiteId(siteInfo.getSiteId());
		systemTemplate.setSubmenuId(Constants.SubMenu.SYS01);	// 빙축열>계통도(좌)
		systemTemplate = buildService.selectTemplateInfo(systemTemplate);
		model.addAttribute("flowInfo", systemTemplate);
		
		systemTemplate.setSubmenuId(Constants.SubMenu.SYS03);	// 설정메뉴 템플릿
		model.addAttribute("templateInfo", buildService.selectSystemSubmenuSite(systemTemplate));
		
		model.addAttribute("settingTypeList", buildService.selectTemplateList(systemTemplate));	// 설정메뉴 패턴
		return "/ems/build/settingSelect";
	}
	
	
	/**
	 * 설정메뉴 타입 선택
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/settingRegistExe.do")
	public String addSettingTemplate(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		systemTemplate.setRegId(loginVo.getMngId());
		buildService.insertSystemSubmenuSite(systemTemplate);
		
		return "forward:/Relay.do?_forward_page=/ems/build/settingSelect.do";
	}
	
	
	/**
	 * 설정메뉴 설정 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/settingSet.do")
	public String settingSet(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate, ModelMap model) throws Exception {
		
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		systemTemplate.setSiteId(siteInfo.getSiteId());
		systemTemplate.setSubmenuId(Constants.SubMenu.SYS03);
		systemTemplate = buildService.selectTemplateInfo(systemTemplate);
		if(systemTemplate == null) {
			throw new Exception("templateInfo null");
		}
		model.addAttribute("templateInfo", systemTemplate);
		
		// 태그 리스트
		RawData rawData = new RawData();
		rawData.setSiteCd(siteInfo.getSiteCd());
		model.addAttribute("tagList", trendService.searchTagList(rawData));
		
		return "/ems/build/settingSet";
	}
	
	
	/**
	 * 설정메뉴 설정
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/settingSetRegistExe.do")
	public String addSettingSet(HttpServletRequest request, HttpServletResponse response, SystemTagMap systemTagMap) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		systemTagMap.setRegId(loginVo.getMngId());
		systemTagMap.setUpdateId(loginVo.getMngId());
		buildService.insertSystemTagMapping(systemTagMap);
		
		return "forward:/Relay.do?_forward_page=/ems/build/settingSet.do";
	}
	
	
	
	/**
	 * 기타설비 선택 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/etcSelect.do")
	public String etcSelect(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate, ModelMap model) throws Exception {
		
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		systemTemplate.setSiteId(siteInfo.getSiteId());
		systemTemplate.setEtcSubmenuYn(Constants.YES);
		model.addAttribute("etcTypeList", buildService.selectTemplateList(systemTemplate));				// 기타설비 썸네일이미지
		return "/ems/build/etcSelect";
	}
	
	
	/**
	 * 기타설비 선택
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/etcRegistExe.do")
	public String addEtcTemplate(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		systemTemplate.setRegId(loginVo.getMngId());
		buildService.insertSystemSubmenuSite(systemTemplate);
		
		return "forward:/Relay.do?_forward_page=/ems/build/etcSelect.do";
	}
	
	
	/**
	 * 사이트 별 기타설비 리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/build/selectSystemSubmenuSiteListAjax.do")
	@ResponseBody
	public Map<String, Object> selectSystemSubmenuSiteListAjax(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = buildService.selectSystemSubmenuSiteList(systemTemplate);
		return resultMap;
	}
	
	
	/**
	 * 기타설비 설정 화면
	 * 
	 * @param request
	 * @param response
	 * @param systemTemplate
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ems/build/etcSet.do")
	public String etcSet(HttpServletRequest request, HttpServletResponse response, SystemTemplate systemTemplate, ModelMap model) throws Exception {
		
		Mng siteInfo = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		systemTemplate.setSiteId(siteInfo.getSiteId());
		systemTemplate.setEtcSubmenuYn(Constants.YES);
		model.addAttribute("etcTypeList", buildService.selectTemplateList(systemTemplate));		// 기타설비 썸네일이미지
		model.addAttribute("rightSetYn", systemTemplate.getRightSetYn());						// 우측설정여부
		
		if(StringUtils.isBlank(systemTemplate.getSubmenuId())) {
			Map<String, Object> etcMap = buildService.selectSystemSubmenuSiteList(systemTemplate);
			List<FlkMap> etcList = (List<FlkMap>) etcMap.get("etcList");
			systemTemplate.setSubmenuId((String) etcList.get(0).get("submenuId"));	// 빙축열>계통도(좌)
		}
		
		systemTemplate = buildService.selectTemplateInfo(systemTemplate);
		if(systemTemplate == null) {
			throw new Exception("templateInfo null");
		}
		model.addAttribute("templateInfo", systemTemplate);
		
		// 열량 css_path
		model.addAttribute("cssFilePath", systemTemplate.getCssFilePath());
		
		// 태그 리스트
		RawData rawData = new RawData();
		rawData.setSiteCd(siteInfo.getSiteCd());
		model.addAttribute("tagList", trendService.searchTagList(rawData));
		rawData.setiAlarmUseFlag(Constants.YES);
		model.addAttribute("alarmTagList", trendService.searchTagList(rawData));
		
		return "/ems/build/etcSet";
	}
	
	
	/**
	 * 기타설비 설정
	 * 
	 * @param request
	 * @param response
	 * @param systemTagMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ems/build/etcSetRegistExe.do")
	public String addEtcSet(HttpServletRequest request, HttpServletResponse response, SystemTagMap systemTagMap) throws Exception {
		HttpSession session = request.getSession();
		Mng loginVo = (Mng) session.getAttribute(AuthDefine.AUTH_SESSION_VO);
		systemTagMap.setRegId(loginVo.getMngId());
		systemTagMap.setUpdateId(loginVo.getMngId());
		buildService.insertSystemTagMapping(systemTagMap);
		
		return "forward:/Relay.do?_forward_page=/ems/build/etcSet.do";
	}
}
