package com.flk.mng.user.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.user.domain.Mng;

@Repository
public interface MngMapper {

	/**
	 * 유저 등록
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	public boolean insertMng(Mng mng);
	
	/**
	 * 유저 수정
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	public boolean updateMng(Mng mng);
	
	/**
	 * 유저 리스트
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	public List<FlkMap> selectMngList(Mng mng);
	
	/**
	 * 유저 기본정보 조회
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	public FlkMap selectMngView(Mng mng);	
	
	/**
	 * 유저 리스트 전체 카운트
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	public int selectMngListTotalCnt(Mng mng);

	/**
	 * 유저 정보 조회
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	public FlkMap selectMngViewByLogin(Mng mng);
	
	/**
	 * 유저 로그인 패스워드 체크
	 * 
	 * @param mng		관리자VO
	 * @return
	 */
	public int selectMngLoginPasswordCheck(Mng mng);

	/**
	 * 유저 삭제
	 * 
	 * @param mng
	 */
	public void deleteMng(Mng mng);

	/**
	 * 유저 지점 매핑 등록
	 * 
	 * @param mng
	 */
	public void insertMngSiteList(Map<String, Object> param);

	/**
	 * 유저 지점 매핑 삭제
	 * 
	 * @param mng
	 */
	public void deleteMngSite(Mng mng);

	/**
	 * 유저 지점 매핑 리스트
	 * 
	 * @param mng
	 * @return
	 */
	public List<Mng> selectMngSiteList(Mng mng);

	/**
	 * 하위 유저 사용여부 업데이트
	 * 
	 * @param param
	 */
	public void updateAllMngUseFlag(Map<String, Object> param);

	/**
	 * 유저 사이트 매핑 등록
	 * 
	 * @param mng
	 */
	public void insertMngSite(Mng mng);
	
}
