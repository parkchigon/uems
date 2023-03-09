package com.flk.ems.build.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.flk.common.dataaccess.util.CamelUtil;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.ExcelUtil;
import com.flk.ems.build.domain.FixInfo;
import com.flk.ems.build.domain.PlcComm;
import com.flk.ems.build.domain.SystemTemplate;
import com.flk.ems.build.mapper.BuildMapper;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.domain.Tag;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;
import com.flk.mng.user.domain.Mng;
import com.flk.mng.user.mapper.MngMapper;
import com.flk.system.code.domain.Code;

@PropertySource("classpath:/config/common/message.properties")
@Service
public class BuildServiceImpl implements BuildService {

	private static final Logger logger = LoggerFactory.getLogger(BuildServiceImpl.class);
	
	@Autowired
	private Environment env;
	
	@Autowired
	private BuildMapper buildMapper;

	@Autowired
	private SiteMapper siteMapper;
	
	@Autowired
	private MngMapper mngMapper;	
	
	/**
	 * 지점관리 등록
	 */
	@Override
	@Transactional
	public void insertSiteManage(PlcComm plcComm, HttpSession session) throws Exception {
		
		// 1. 사이트 등록 TBL_SITE
		Site site = new Site();
		site.setSiteCd(plcComm.getSiteCd());
		site.setSiteName(plcComm.getSiteName());
		site.setSgId(plcComm.getSgId());
		site.setSiteIp(plcComm.getSiteIp());
		site.setUseFlag(Constants.YES);
		site.setRegId(plcComm.getRegId());
		site.setUpdateId(plcComm.getUpdateId());
		siteMapper.insertSite(site);	
		
		// 2. 사이트 매핑 등록 TBL_MNG_SITE
		Map<String, Object> param = new HashMap<String, Object>();
		List<Map<String, Object>> siteList = new ArrayList<Map<String, Object>>();
		Map<String, Object> siteMap = new HashMap<String, Object>();
		siteMap.put("mngId", plcComm.getRegId());
		siteMap.put("siteId", site.getSiteId());
		siteMap.put("regId", plcComm.getRegId());
		siteMap.put("updateId", plcComm.getUpdateId());
		siteMap.put("arrayNo", 1);
		siteList.add(siteMap);
		param.put("siteList", siteList);
		mngMapper.insertMngSiteList(param);	
		
		// 3. PLC 통신설정 등록
		plcComm.setUseFlag(Constants.YES);
		buildMapper.insertPlcComm(plcComm);
		
		// 4. TBL_FIX_INFO 추가
		FixInfo fixInfo = new FixInfo(Constants.FIX02, Constants.NO);
		fixInfo.setUpdateId(plcComm.getRegId());
		buildMapper.insertFixInfo(fixInfo);
		
		// 5. SITE_INFO 세션 추가
		List<Mng> list = new ArrayList<Mng>();
		Mng vo = new Mng();
		vo.setMngId(plcComm.getRegId());
		list = mngMapper.selectMngSiteList(vo);
		session.setAttribute("SITE_INFO", list.get(0));
	}

	/**
	 * 지점관리 수정
	 */
	@Override
	@Transactional
	public void updateSiteManage(PlcComm plcComm, HttpSession session) throws Exception {
		
		// 1. 사이트 등록 TBL_SITE
		Site site = new Site();
		site.setSiteId(plcComm.getSiteId());
		site.setSiteCd(plcComm.getSiteCd());
		site.setSiteName(plcComm.getSiteName());
		site.setSgId(plcComm.getSgId());
		site.setUseFlag(Constants.YES);
		site.setSiteIp(plcComm.getSiteIp());
		site.setUpdateId(plcComm.getUpdateId());
		siteMapper.updateSite(site);	
		
		// 2. PLC 통신설정 수정
		buildMapper.updatePlcComm(plcComm);
		
		// 3. TBL_FIX_INFO 추가
		FixInfo fixInfo = new FixInfo(Constants.FIX02, Constants.NO);
		fixInfo.setUpdateId(plcComm.getRegId());
		buildMapper.insertFixInfo(fixInfo);
		
		// 4. SITE_INFO 세션 추가
		List<Mng> list = new ArrayList<Mng>();
		Mng vo = new Mng();
		vo.setMngId(plcComm.getRegId());
		list = mngMapper.selectMngSiteList(vo);
		session.setAttribute("SITE_INFO", list.get(0));
	}

	/**
	 * 지점관리 조회
	 */
	@Override
	public PlcComm selectPlcCommView(PlcComm plcCommView) throws Exception {
		return buildMapper.selectPlcCommView(plcCommView);
	}
	
	/**
	 * 태그 리스트 조회
	 */
	@Override
	public Map<String, Object> selectTagList(Tag tag) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = buildMapper.selectTagList(tag);
		resultMap.put("tagList", list);
		
		return resultMap;
	}

	/**
	 * 태그 등록
	 */
	@Override
	@Transactional
	public void insertTag(Tag tag) throws Exception {
		
		// 1. 태그 등록
		buildMapper.insertTag(tag);
		
		// 2. 태그 이력 등록
		buildMapper.insertTagHistory(tag);
		
		// 3. TBL_FIX_INFO 추가
		FixInfo fixInfo = new FixInfo(Constants.FIX03, Constants.NO);
		fixInfo.setUpdateId(tag.getRegId());
		buildMapper.insertFixInfo(fixInfo);
	}

	/**
	 * 태그 수정
	 */
	@Override
	@Transactional
	public void updateTag(Tag tag) throws Exception {
		
		// 1. 태그 수정
		buildMapper.updateTag(tag);
		
		// 2. 태그 이력 등록
		buildMapper.insertTagHistory(tag);
		
		// 3. TBL_FIX_INFO 추가
		FixInfo fixInfo = new FixInfo(Constants.FIX03, Constants.NO);
		fixInfo.setUpdateId(tag.getRegId());
		buildMapper.insertFixInfo(fixInfo);
	}
	

	/**
	 * 태그ID 중복체크
	 */
	@Override
	public boolean checkExistTagId(Tag tag) throws Exception {
		boolean result = true;
		if(buildMapper.selectTagId(tag) > 0) {
			result = false; 
		}
		return result;
	}

	/**
	 * 태그 삭제
	 */
	@Override
	@Transactional
	public void deleteTag(Tag tag) throws Exception {
		for(String tagId : tag.getTagIdArr()) {
			tag.setTagId(tagId);
			buildMapper.insertTagHistory(tag);
			buildMapper.deleteTag(tag);
		}
		
		// TBL_FIX_INFO 추가
		FixInfo fixInfo = new FixInfo(Constants.FIX03, Constants.NO);
		fixInfo.setUpdateId(tag.getRegId());
		buildMapper.insertFixInfo(fixInfo);
	}

	/**
	 * 태그 정보 조회
	 */
	@Override
	public Map<String, Object> selectTagView(Tag tag) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Tag tagInfo = buildMapper.selectTagView(tag);
		resultMap.put("tagInfo", tagInfo);
		
		return resultMap;
	}


	/**
	 * 태그 엑셀 업로드
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public Map<String, Object> uploadTagListExcel(Tag tag) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Map<String, Object>> tagList = new ArrayList<Map<String, Object>>();
		boolean checkYn = true;
		
		// 코드 관련 데이터 조회
		List<Code> codeList = buildMapper.tagCodeList();

		// Excel 시트명
		String[] sheetArray = {Constants.EXCEL_SHEET.TAG_AI, Constants.EXCEL_SHEET.TAG_AO, Constants.EXCEL_SHEET.TAG_DI, Constants.EXCEL_SHEET.TAG_DO};
		for(String sheetName : sheetArray) {
			// 1. 시트 별로 excel read
			List<Map<String, String>> excelList = ExcelUtil.readExcel(tag.getUploadFile(), sheetName);
			if ( CollectionUtils.isNotEmpty(excelList) ) {
				// 2. 태그 코드값 세팅
				resultMap = new HashMap<String, Object>();
				resultMap = setCodeValue(excelList, codeList, tag, sheetName);
				if(StringUtils.equals((String) resultMap.get(Constants.RESULT_CODE), Constants.SUCCESS)) {
					// 등록할 태그 리스트 추가
					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("tagList");
					tagList.addAll(list);
					paramMap.put(sheetName.substring(4, 6).toLowerCase()+"Count", list.size());
				} else {
					checkYn = false;
					break;
				}
			}
		}

		paramMap.put("regId", tag.getRegId());
		paramMap.put("updateId", tag.getUpdateId());
		paramMap.put("tagList", tagList);
		paramMap.put("siteCd", tag.getSiteCd());
		
		// 태그 일괄등록 DB처리
		if(checkYn) {
			if(tagList.size() > 0) {
				try {
					// 3. 태그 삭제
					buildMapper.deleteTag(tag);
					
					// 4. 태그 INSERT
					// 4.1 태그 등록
					buildMapper.insertTagList(paramMap);
					
					// 4.2 태그 이력 등록
					buildMapper.insertTagHistoryList(paramMap);
					
					// 4.3 TBL_FIX_INFO 추가
					FixInfo fixInfo = new FixInfo(Constants.FIX03, Constants.NO);
					fixInfo.setUpdateId(tag.getRegId());
					buildMapper.insertFixInfo(fixInfo);
					
					paramMap.put("successFlag", Constants.YES);
					resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
					resultMap.put(Constants.RESULT_FREE_MSG, "태그 "+tagList.size() + " 개 추가되었습니다.");
					
				} catch(Exception e) {
					logger.error("##### 구축 > 태그관리 엑셀 업로드 중 에러 발생");
					logger.error(e.getMessage(), e);
					paramMap.put("successFlag", Constants.NO);
					paramMap.put("failMsg", e.getCause().getMessage());
					resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
					resultMap.put(Constants.RESULT_FREE_MSG, e.getCause().getMessage());
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				} 
			}
			
		} else {
			paramMap.put("successFlag", Constants.NO);
			paramMap.put("failMsg", env.getProperty((String) resultMap.get(Constants.RESULT_MSG)));
		}
		
		resultMap.put("paramMap", paramMap);
		return resultMap;
	}

	
	/**
	 * 태그 코드값 세팅
	 * 
	 * @param excelList
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private Map<String, Object> setCodeValue(List<Map<String, String>> excelList, List<Code> codeList, Tag tag, String sheetName) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> paramList = new ArrayList<Map<String, Object>>();
		
		for (Map<String, String> map : excelList ) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			
			if(StringUtils.isNotBlank((String) map.get("site_cd"))) {
				// site_cd 가 일치하지 않을 경우 fail
		    	if(!StringUtils.equals(tag.getSiteCd(), map.get("site_cd"))) {
		    		resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
		    		resultMap.put(Constants.RESULT_MSG, "fail.invalid.siteCd");
		    		return resultMap;
		    	}
		    	
		    	// sheetName 과  tag_type_cd 가 일치하지 않을 경우 fail
		    	if(!StringUtils.equals(sheetName.substring(4,6), map.get("tag_type_cd"))) {
		    		resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
		    		resultMap.put(Constants.RESULT_MSG, "fail.invalid.tagTypeCd");
		    		return resultMap;
		    	}
		    	
				for (String key : map.keySet()){
			    	String value = map.get(key);
			        if(!StringUtils.equals(key, "site_cd") && StringUtils.endsWith(key, "_cd")) {
			        	for(Code code : codeList) {
			        		// 부모코드가 일치하고 codeName 이 동일할 경우 코드 value 세팅
			        		if(StringUtils.equals(code.getParentCodeUseName(), StringUtils.substringBeforeLast(key, "_cd").toUpperCase())
			        				&& StringUtils.equals(code.getCodeName(), (String) map.get(key))) {
			        			value = code.getCodeUseName();
			        			break;
			        		}
			        	}
			        }
			        paramMap.put(CamelUtil.convert2CamelCase((String) key), value);
			    }
			    paramList.add(paramMap);
			}
		}
		
		resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
		resultMap.put("tagList", paramList);
		return resultMap;
		
	}
	

	/**
	 * 태그 업로드 이력 등록
	 */
	@Override
	public void insertTagRegisterLog(Map<String, Object> paramMap) throws Exception {
		buildMapper.insertTagRegisterLog(paramMap);
	}


	/**
	 * 템플릿 패턴 리스트
	 */
	@Override
	public List<FlkMap> selectTemplateList(SystemTemplate systemTemplate) throws Exception {
		return buildMapper.selectTemplateList(systemTemplate);
	}

	/**
	 * 템플릿 등록
	 */
	@Override
	@Transactional
	public void insertSystemSubmenuSite(SystemTemplate systemTemplate) throws Exception {
		
		// 기타설비일 경우에는 리스트로 템플릿 저장
		if(StringUtils.equals(systemTemplate.getEtcSubmenuYn(), Constants.YES)) {
			for(SystemTemplate vo : systemTemplate.getTemplateList()) {
				systemTemplate.setSubmenuId(vo.getSubmenuId());
				systemTemplate.setTemplateId(vo.getTemplateId());
				systemTemplate.setApplyFlag(Constants.NO);
				
				// 선택하지않은 기타설비 삭제
				if(StringUtils.equals(vo.getDeleteYn(), Constants.YES)) {
					buildMapper.deleteSystemSubmenuSite(systemTemplate);
					
					SystemTagMap systemTagMap = new SystemTagMap(systemTemplate.getSiteId(), vo.getSubmenuId());
					systemTagMap.setTemplateId(vo.getTemplateId());
					buildMapper.deleteSystemTagMapping(systemTagMap);
					
				} else {
					// 기존 template_id 조회
					SystemTemplate currSystemTemplate = buildMapper.selectSystemSubmenuSite(systemTemplate);
					
					// 기존 template_id 와 변경할 template_id 가 다를 경우에는 기존 mappin태그 g 삭제
					if(currSystemTemplate != null) {
						if(!StringUtils.equals(systemTemplate.getTemplateId(), currSystemTemplate.getTemplateId())) {
							SystemTagMap systemTagMap = new SystemTagMap(systemTemplate.getSiteId(), vo.getSubmenuId());
							systemTagMap.setTemplateId(vo.getTemplateId());
							buildMapper.deleteSystemTagMapping(systemTagMap);
						}
					}
					buildMapper.insertSystemSubmenuSite(systemTemplate);
				}
			}
			
		} else {
			// 기존 template_id 조회
			SystemTemplate currSystemTemplate = buildMapper.selectSystemSubmenuSite(systemTemplate);

			// 기존 template_id 와 변경할 template_id 가 다를 경우에는 기존 mapping tag 삭제
			if(currSystemTemplate != null) {
				if(!StringUtils.equals(systemTemplate.getTemplateId(), currSystemTemplate.getTemplateId())) {
					SystemTagMap systemTagMap = new SystemTagMap(systemTemplate.getSiteId(), systemTemplate.getSubmenuId());
					systemTagMap.setTemplateId(systemTemplate.getTemplateId());
					buildMapper.deleteSystemTagMapping(systemTagMap);
				}
			}
						
			systemTemplate.setApplyFlag(Constants.NO);
			buildMapper.insertSystemSubmenuSite(systemTemplate);
		}
		
	}

	/**
	 * 사이트 별 템플릿
	 */
	@Override
	public SystemTemplate selectSystemSubmenuSite(SystemTemplate systemTemplate) throws Exception {
		return buildMapper.selectSystemSubmenuSite(systemTemplate);
	}

	/**
	 * 템플릿 정보 조회
	 */
	@Override
	public SystemTemplate selectTemplateInfo(SystemTemplate systemTemplate) throws Exception {
		return buildMapper.selectTemplateInfo(systemTemplate);
	}

	/**
	 * 서브메뉴 css_path 조회
	 */
	@Override
	public String selectSubMenuCss(SystemTagMap systemTagMap) throws Exception {
		return buildMapper.selectSubMenuCss(systemTagMap);
	}
	
	/**
	 * 타 Template ID 태그 매핑 삭제
	 */
	@Override
	public void deleteOtherSystemTagMapping(SystemTagMap systemTagMap) throws Exception {
		buildMapper.deleteOtherSystemTagMapping(systemTagMap);
	}

	/**
	 * 태그 매핑 등록
	 */
	@Override
	@Transactional
	public void insertSystemTagMapping(SystemTagMap systemTagMap) throws Exception {
		
		// 1. 컴포넌트 리스트 조회
		SystemTemplate systemTemplate = new SystemTemplate(systemTagMap.getSubmenuId(), systemTagMap.getTemplateId());
		List<FlkMap> componentList = buildMapper.selectSystemTemplateComponent(systemTemplate);
		
		// 2. tbl_system_tag_mapping 등록
		for(SystemTagMap vo : systemTagMap.getTagList()) {
			systemTagMap.setComponentId(vo.getComponentId());
			systemTagMap.setSetFlag(Constants.YES);
			
			if(StringUtils.isNotBlank(vo.getTagId())) {
				systemTagMap.setTagId(vo.getTagId());
				
				for(FlkMap flkMap : componentList) {
					if(StringUtils.equals(vo.getComponentId(), (String) flkMap.get("componentId"))) {
						systemTagMap.setGroupId((String) flkMap.get("groupId"));
						if(StringUtils.isBlank(vo.getDisplayName())) {
							systemTagMap.setDisplayName((String) flkMap.get("componentName"));
						} else {
							systemTagMap.setDisplayName(vo.getDisplayName());
						}
						buildMapper.insertSystemTagMapping(systemTagMap);
						break;
					}
				}
			} else {
				buildMapper.deleteSystemTagMapping(systemTagMap);
			}
		}
		
		if(componentList.size() > 0) {
			// 3. tbl_system_submenu_site apply_flag Y 수정
			systemTemplate.setSiteId(systemTagMap.getSiteId());
			systemTemplate.setApplyFlag(Constants.YES);
			buildMapper.updateSystemSubmenuSite(systemTemplate);
		}
	}

	/**
	 * 태그 매핑 조회
	 */
	@Override
	public Map<String, Object> selectSystemTagMapping(SystemTagMap systemTagMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<FlkMap> tagMappingList = buildMapper.selectSystemTagMapping(systemTagMap);
		resultMap.put("tagMappingList", tagMappingList);
		return resultMap;
	}
	
	/**
	 * 사이트 별 기타설비 리스트 조회
	 */
	@Override
	public Map<String, Object> selectSystemSubmenuSiteList(SystemTemplate systemTemplate) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<FlkMap> etcList = buildMapper.selectSystemSubmenuSiteList(systemTemplate);
		resultMap.put("etcList", etcList);
		return resultMap;
	}
}
