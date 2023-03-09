package com.flk.ems.alarm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;
import com.flk.ems.alarm.domain.Alarm;
import com.flk.ems.alarm.service.AlarmService;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.service.EmsMainService;
import com.flk.mng.user.domain.Mng;

/**
 * 경보
 *
 */
@Controller
public class AlarmController {

	@Autowired
	private EmsMainService emsMainService;
	
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping(value = "/ems/alarm/alarmList.do")
	public String searchAlarmList(HttpServletRequest request, HttpServletResponse response, ModelMap model, Alarm alarm) throws Exception {
		
		Mng site = (Mng) request.getSession().getAttribute( "SITE_INFO" );
		SystemTagMap systemTagMap = new SystemTagMap(site.getSiteId(), Constants.SubMenu.SYS02);	// 빙축열 탭 (우측화면)

		// 우측 그리드 서브메뉴정보 조회
		systemTagMap.setMenuListYn(Constants.NO);	
		List<FlkMap> subMenulist = emsMainService.selectSubMenuList(systemTagMap);
		model.addAttribute("subMenulist", subMenulist);
		
		// 태그 매핑 리스트 
		List<FlkMap> tagMapList = emsMainService.selectTagMapping(systemTagMap);
		model.addAttribute("tagMapList", tagMapList);

		// 경보리스트 조회
		PageUtil pageutil = new PageUtil(request, alarm.getCurrPage(), alarm.getListSize());
		alarm.setFirstIndex(pageutil.getFirstIndex());
		alarm.setLastIndex(pageutil.getLastIndex());
		alarm.setSiteCd(site.getSiteCd());
		List<FlkMap> alarmList = alarmService.selectAlarmList(alarm);
		
		pageutil.setList(alarmList);
		alarm.setPageutil(pageutil);
		alarm.setCurrPage(String.valueOf(pageutil.getCurrPage()));
		model.addAttribute("alarmList", alarmList);
		
		// 상태별 카운트 조회
		Alarm countList = alarmService.selectAlarmCountForStatus(alarm);
		model.addAttribute("countList", countList);
		
		
		return "/ems/alarm/alarmList";
	}
	
	
	/**
	 * 푸터 > 경보 알람 조회
	 * 
	 * @param request
	 * @param response
	 * @param alarm
	 * @return	
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/alarm/selectAlarmFooterAjax.do")
	@ResponseBody
	public Map<String, Object> selectAlarmFooterAjax(HttpServletRequest request, HttpServletResponse response, Alarm alarm) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		alarm = alarmService.selectAlarmFooter(alarm);
		resultMap.put("alarmInfo", alarm);
		
		return resultMap;
	}
	
	
	/**
	 * 경보리스트 상태값 변경
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param alarm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/alarm/updateAlarmStatusCd.do")
	public String updateAlarmStatusCd(HttpServletRequest request, HttpServletResponse response, ModelMap model, Alarm alarm) throws Exception {
		
		if(alarm.getAlarmId() != null && alarm.getAlarmId() != ""){
			alarmService.updateAlarmStatusCd(alarm);
		}else{
			String[] arrIdx = alarm.getAlarmIdArr().toString().split(",");
			
			for (int i=0; i<arrIdx.length; i++) {
				String alarmId = arrIdx[i];
				alarm.setAlarmId(alarmId);
				alarmService.updateAlarmStatusCd(alarm);
			}
		}
		//alarmService.updateAlarmStatusCd(alarm);
		
		return "redirect:/ems/alarm/alarmList.do";
	}
	
	/**
	 * 경보리스트 상태값 변경
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @param alarm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ems/alarm/updateAlarmValueAjax.do")
	public Map<String, Object> updateAlarmValueAjax(HttpServletRequest request, HttpServletResponse response, @RequestBody Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Mng mng = (Mng) request.getSession().getAttribute( AuthDefine.AUTH_SESSION_VO );
		paramMap.put("mngId", mng.getMngId());
		
		// 제어 요청 위치 (0:현장 1:통합)
		if(StringUtils.equals(mng.getRoleId(), Constants.ROL_0000000000000001) || StringUtils.equals(mng.getRoleId(), Constants.ROL_0000000000000002)) {
			paramMap.put("controlPlace", "0");		// 현장시스템 > 구축자, 사용자 권한일 경우
		} else { 	
			paramMap.put("controlPlace", "1");		// 통합시스템 > 운영자, 최고관리자일 경우
		}
		resultMap = alarmService.updateAlarmValue(paramMap);
		
		return resultMap;
	}
}
