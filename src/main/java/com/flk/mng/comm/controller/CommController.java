package com.flk.mng.comm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.utility.PageUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.comm.domain.Comm;
import com.flk.mng.comm.service.CommService;
import com.flk.system.code.service.CodeService;

@Controller
public class CommController {

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
	
	@Autowired
	private CommService commService;
	@Autowired
	private CodeService codeService;
	
	/**
	 * 통신관리 목록 조회
	 * @param request
	 * @param response
	 * @param comm
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/comm/commList.do")
	public String commListView(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("comm") Comm comm, ModelMap model) throws Exception {

		PageUtil pageutil = new PageUtil(request, comm.getCurrPage(), comm.getListSize());
		comm.setFirstIndex(pageutil.getFirstIndex());
		comm.setLastIndex(pageutil.getLastIndex());
		
		List<FlkMap> commList = commService.commList(comm);
		
		pageutil.setList(commList);
		comm.setPageutil(pageutil);
		model.addAttribute("resultList", commList);
		
		return "/uems/mng/comm/commList";
	
	}
	
	/**
	 * 통신관리 상세 조회
	 * @param request
	 * @param response
	 * @param comm
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/mng/comm/commDetail.do")
	public String commDetail(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("comm") Comm comm, ModelMap model) throws Exception {
		Comm commDetailView = new Comm();
		
		if(StringUtils.isNotBlank(comm.getSiteId())){
			FlkMap map = commService.commDetail(comm);
			if(map != null) {
				commDetailView = (Comm) MethodUtil.convertToOject(map, commDetailView);
			}
		}
		model.addAttribute("commDetail", commDetailView);
		
		model.addAttribute("bitDataCdId", codeService.searchCodeList(bitDataCdId));			// 데이터비트
		model.addAttribute("bitParityCdId", codeService.searchCodeList(bitParityCdId));		// 패리티비트
		model.addAttribute("bitStopCdId", codeService.searchCodeList(bitStopCdId));			// 스톱비트
		model.addAttribute("txCtrlCdId", codeService.searchCodeList(txCtrlCdId));			// Tx 흐름제어
		model.addAttribute("rxCtrlCdId", codeService.searchCodeList(rxCtrlCdId));			// Rx 흐름제어
		return "/uems/mng/comm/commDetail";

	}
}
