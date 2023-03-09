package com.flk.mng.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.AuthDefine;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.dataaccess.util.MethodUtil;
import com.flk.common.domain.CeWebConstants;
import com.flk.common.domain.Constants;
import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.SecurityUtils;
import com.flk.mng.user.domain.Mng;
import com.flk.mng.user.mapper.MngMapper;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("mngService")
public class MngServiceImpl implements MngService {

	@Autowired
	private MngMapper mngMapper;
	
	@Resource(name = "mngIdGnrService")
	private EgovIdGnrService egovIdGnrService;	
	
    @Value("#{config['login.pwd.fail.cnt']}")
    private String loginPasswordFailCnt;
     
    @Value("#{config['login.session.timeout']}")
    private String loginSessionTimeout;    
    
    
    /**
     * 유저 등록
     */
	@Override
	@Transactional
	public void addMng(Mng mng) throws Exception {
		String mngId = egovIdGnrService.getNextStringId();
		String encryptPassword = SecurityUtils.encryptPassword(mng.getLoginPassword(), mngId);
        
		mng.setMngId(mngId);
		mng.setLoginPassword(encryptPassword);
		
		mngMapper.insertMng(mng);
		
		// 사용자일 경우에만 유저 사이트 등록
		if(StringUtils.equals(mng.getRoleId(), Constants.ROL_0000000000000002) && StringUtils.isNotBlank(mng.getSiteId())) {
			mng.setArrayNo("1");
			mngMapper.insertMngSite(mng);
		}
	}

	/**
	 * 유저 수정
	 */
	@Override
	public void modifyMng(Mng mng) throws Exception {
		mngMapper.updateMng(mng);	
	}

	/**
	 * 유저 리스트
	 */
	@Override
	public List<FlkMap> searchMngList(Mng mng) throws Exception {
		return mngMapper.selectMngList(mng);
	}

	/**
	 * 유저 리스트 전체 카운트
	 */
	@Override
	public int searchMngListTotalCnt(Mng mng) throws Exception {
		return mngMapper.selectMngListTotalCnt(mng);
	}

	/**
	 * 유저 기본정보 조회
	 */
	@Override
	public FlkMap searchMngView(Mng mng) throws Exception {
		return mngMapper.selectMngView(mng);
	}

	/**
	 * 로그인 처리
	 */
	@Override
	public int searchMngViewByLogin(HttpSession session, Mng mng) throws Exception {
		
		int resultCode = 0;
		// 패스워드 오류 횟수
		int pwdFailCnt = Integer.parseInt(loginPasswordFailCnt);
		// 세션타임아웃 
		int sessionTimeout = Integer.parseInt(loginSessionTimeout);
		
		FlkMap map =  mngMapper.selectMngViewByLogin(mng);
		if(map == null || map.isEmpty()){
			return CeWebConstants.ERROR_CODE_LOGIN_ID_PWD;// 2:ID/PWD가
			// 존재하지 않을 경우
		}
		
		Mng vo = new Mng();
		vo = (Mng) MethodUtil.convertToOject(map, vo);
		
		String encryptPassword = SecurityUtils.encryptPassword(mng.getLoginPassword(), vo.getMngId());
		vo.setLoginPassword(encryptPassword);
		
		if (mngMapper.selectMngLoginPasswordCheck(vo) > 0) {
			
			//if (vo.getPasswordFailCnt() == pwdFailCnt) {// 패스워드가 5번 틀렸을 경우
				// TN_MNG에서 use_yn -> N 변경 => 사용자 관리에서 사용으로 변경시
				//pwd_fail_cnt 초기화
				//vo.setUseYn("N");					
				//modifyMng(vo);
				//resultCode = CeWebConstants.ERROR_CODE_LOGIN_PWD_WORNG;// 3:ID만 존재하지만 패스워드가 5번 틀렸을 경우
			//} else {		 
				
				if (vo.getUseYn().equals("N")) { 
					resultCode = CeWebConstants.ERROR_CODE_LOGIN_PWD_ERROR; // 아이디가 사용 중지 일때
				} else {
					
					List<Mng> siteList = new ArrayList<Mng>();
					if(StringUtils.equals(vo.getRoleId(), Constants.ROL_0000000000000001)) {
						// 구축자일 경우 유저-지점 매핑여부 판단 필요 (매핑 하나만 가능) 단, 매핑 전일수 있음
						siteList = mngMapper.selectMngSiteList(vo);
						if(siteList != null) {
							if(siteList.size() > 1) {
								resultCode = CeWebConstants.ERROR_CODE_LOGIN_SITE_ERROR; // 구축자 권한 : 유저-지점 매핑 하나 이상일 경우
								return resultCode;
							} else {
								if(siteList.size() == 1) {
									session.setAttribute("SITE_INFO", siteList.get(0));
								}
							}
						}
						
					} else if(StringUtils.equals(vo.getRoleId(), Constants.ROL_0000000000000002)) {
						// 사용자(현장) 권한일 경우 유저-지점 매핑여부 판단 필요 (매핑 하나만 가능)
						siteList = mngMapper.selectMngSiteList(vo);
						if(siteList.size() != 1) {
							resultCode = CeWebConstants.ERROR_CODE_LOGIN_SITE_ERROR; // 사용자(현장)권한 : 유저-지점 매핑 없을 경우
							return resultCode;
						} else {
							session.setAttribute("SITE_INFO", siteList.get(0));
						}
					}
					
					// 세션생성
					session.setMaxInactiveInterval(60*60*sessionTimeout);//세션타임아웃
		            session.setAttribute(ServiceConfig.SESSION_KEY_USER_ID, vo.getMngId());
		            session.setAttribute(ServiceConfig.SESSION_KEY_USER_NAME, vo.getMngName());
		            session.setAttribute("ROLE_ID", vo.getRoleId());
		            session.setAttribute(AuthDefine.AUTH_SESSION_VO, vo);

					if (vo.getPasswordFailCnt() != 0) {
						// 패스워드 초기화
						vo.setPasswordFailCnt(0);
						modifyMng(vo);
					}
				}	
			//}
		}else{
			resultCode = CeWebConstants.ERROR_CODE_LOGIN_ID;// 1:ID만 존재할 경우
			//vo.setPasswordFailCnt(vo.getPasswordFailCnt() + 1);	 
			//modifyMng(vo);
		}
			
		return resultCode;
 
	}
	

	
	/**
	 * 유저 아이디 중복체크
	 */
	@Override
	public FlkMap checkLoginId(Mng mng) throws Exception {
		return mngMapper.selectMngViewByLogin(mng);
	}

	/**
	 * 유저 로그인 패스워드 체크
	 */
	public int searchMngLoginPasswordCheck(Mng mng) throws Exception {
		return mngMapper.selectMngLoginPasswordCheck(mng);
	}

	/**
	 * 유저 삭제
	 */
	@Override
	public void removeMng(Mng mng) throws Exception {
		mngMapper.deleteMng(mng);
	}

	/**
	 * 유저 지점 리스트
	 */
	@Override
	public List<Mng> searchMngSiteList(Mng mng) throws Exception {
		return mngMapper.selectMngSiteList(mng);
	}	
	
	/**
	 * 유저 지점 삭제
	 */
	@Override
	public void deleteMngSite(Mng mng) throws Exception {
		mngMapper.deleteMngSite(mng);
	}
}
