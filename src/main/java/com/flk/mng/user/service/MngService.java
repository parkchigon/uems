package com.flk.mng.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.user.domain.Mng;

public interface MngService {

	/**
	 * 유저 등록
	 * 
	 * @param mng	관리자VO
	 * @return
	 * @throws Exception
	 */
	void addMng(Mng mng) throws Exception;
	
	/**
	 * 유저 수정
	 * 
	 * @param mng	관리자VO
	 * @return
	 * @throws Exception
	 */
	void modifyMng(Mng mng) throws Exception;
	
	/**
	 * 유저 리스트
	 * 
	 * @param mng	관리자VO
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> searchMngList(Mng mng) throws Exception;
	
	/**
	 * 유저 기본정보 조회
	 * 
	 * @param mng	관리자VO
	 * @return
	 * @throws Exception
	 */
	FlkMap searchMngView(Mng mng) throws Exception;	

	/**
	 * 유저 리스트 전체 카운트
	 * 
	 * @param mng	관리자VO
	 * @return
	 * @throws Exception
	 */
	int searchMngListTotalCnt(Mng mng) throws Exception;
	
	/**
	 * 로그인처리
	 *  
	 * @param request	HttpServletRequest
	 * @param mng		관리자VO
	 * @return
	 * @throws Exception
	 */
	int searchMngViewByLogin(HttpSession session, Mng mng) throws Exception;
	
	/**
	 * 유저 아이디 중복체크
	 * 
	 * @param mng		관리자VO
	 * @return
	 * @throws Exception
	 */
	FlkMap checkLoginId(Mng mng) throws Exception;	
	
	/**
	 * 유저 로그인 패스워드 체크
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	int searchMngLoginPasswordCheck(Mng mng) throws Exception;

	/**
	 * 유저 삭제
	 * 
	 * @param mng
	 * @throws Exception
	 */
	void removeMng(Mng mng) throws Exception;

	/**
	 * 유저 지점 리스트
	 * 
	 * @param mng
	 * @return
	 * @throws Exception
	 */
	List<Mng> searchMngSiteList(Mng mng) throws Exception;
	
	/**
	 * 유저 지점 삭제
	 * 
	 * @param mng
	 * @throws Exception
	 */
	void deleteMngSite(Mng mng) throws Exception;
}
