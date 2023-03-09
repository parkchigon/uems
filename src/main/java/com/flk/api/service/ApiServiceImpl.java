package com.flk.api.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.api.domain.File;
import com.flk.api.domain.Login;
import com.flk.api.mapper.ApiMapper;
import com.flk.common.domain.Constants;
import com.flk.common.domain.UploadFile;
import com.flk.common.enums.ErrorCodeEnum;
import com.flk.common.exception.BizExceptionProperties;
import com.flk.common.utility.AESCipher;
import com.flk.common.utility.FileUtil;
import com.flk.common.utility.SecurityUtils;
import com.flk.common.utility.StringUtils;

@Service
public class ApiServiceImpl implements ApiService{

	private static final Logger logger = LoggerFactory.getLogger(ApiServiceImpl.class);
	
    @Autowired
    private ApiMapper apiMapper;
	
    @Value("#{config['maintenance.file.path']}")
	private String filePath;
    
    /**
	 * 아이디/비밀번호 체크
	 * 
	 * @param mng
	 * @return
	 * @throws Exception
	 */
    @Override
	public Map<String, Object> getLoginCheck(Login login) throws Exception{
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	// 필수값 미입력
    	if(StringUtils.isBlank(login.getLoginId()) || StringUtils.isBlank(login.getLoginPassword())) {
    		throw new BizExceptionProperties(ErrorCodeEnum.NOT_PARAMETER.getCode());
    	}
    	
    	try {
    		// 비밀번호 복호화 AES128
    		String password = AESCipher.decrypt(login.getLoginPassword());
    		
    		Login vo = new Login();
    		vo.setLoginId(login.getLoginId());
    		vo = apiMapper.getLoginCheck(vo);
    		if(vo == null) {
    			throw new BizExceptionProperties(ErrorCodeEnum.LOGIN_ERR_INVALID_ID_PASSWORD.getCode());
    		}
    		
    		// 비밀번호 SHA-256 암호화
    		String encryptPassword = SecurityUtils.encryptPassword(password, vo.getMngId());
    		vo.setLoginPassword(encryptPassword);
    		
        	Login loginVO = apiMapper.getLoginCheck(vo);
        	
        	if(loginVO != null){
    			//최고권리자 권한체크
    			if(StringUtils.equals(Constants.ROL_0000000000000003, loginVO.getRoleId())){
    				loginVO.setMainUrl(Constants.MOBILE_MAIN_URL);
    				resultMap.put(Constants.RESULT_DATA, loginVO);
    			}else{
    				throw new BizExceptionProperties(ErrorCodeEnum.NOT_ADMIN_ROLE.getCode());
    			}
    		}else{
    			throw new BizExceptionProperties(ErrorCodeEnum.LOGIN_ERR_INVALID_ID_PASSWORD.getCode());
    		}
    	} catch (NumberFormatException nfe) {
    		throw new BizExceptionProperties(ErrorCodeEnum.LOGIN_ERR_INVALID_ID_PASSWORD.getCode());
    	} catch (BizExceptionProperties e) {
    		throw new BizExceptionProperties(e.getCode());
		} catch (Exception e) {
    		throw new BizExceptionProperties(ErrorCodeEnum.FAIL.getCode());
		}
    	
    	return resultMap;
    }
    
	/**
	 * 파일업로드
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
    @Override
    @Transactional
    public Map<String, Object> uploadFile(File file) throws Exception {
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	// 필수값 미입력
    	if(StringUtils.isBlank(file.getMngId()) || StringUtils.isBlank(file.getSiteId())  || StringUtils.isBlank(file.getChkMonth())
    			 || StringUtils.isBlank(file.getMsId()) || StringUtils.isBlank(file.getMsqId()) || StringUtils.isBlank(file.getSubFacilityId())) {
    		throw new BizExceptionProperties(ErrorCodeEnum.NOT_PARAMETER.getCode());
    	}
    	if(file.getUploadFile1() == null){
    		throw new BizExceptionProperties(ErrorCodeEnum.NOT_PARAMETER.getCode());
    	}
    	
    	String chkFilePath = filePath + file.getChkMonth() + "/";
    	
    	try {
    		file.setFilePath(chkFilePath);
    		file.setUseFlag(Constants.YES);
    		file.setUpdateId(file.getMngId());
			file.setRegId(file.getMngId());
    		
        	int realCnt = 1;
        	int successCnt = 0;
        	UploadFile uploadFile = FileUtil.saveMultipartImage(file.getUploadFile1(), chkFilePath);
    		file.setFileName(uploadFile.getStoreFileName() + "." + uploadFile.getStoreFileExtention());
    		file.setUpdateId(file.getMngId());
    		file.setRegId(file.getMngId());
    		//파일등록
    		successCnt = apiMapper.uploadFile(file);
    		if(file.getUploadFile2() != null){
    			UploadFile uploadFile2 = FileUtil.saveMultipartImage(file.getUploadFile2(), chkFilePath);
    			file.setFileName(uploadFile2.getStoreFileName() + "." + uploadFile2.getStoreFileExtention());
    			//파일등록
    			realCnt += 1;
    			successCnt += apiMapper.uploadFile(file);
    		}
    		if(file.getUploadFile3() != null){
    			UploadFile uploadFile3 = FileUtil.saveMultipartImage(file.getUploadFile3(), chkFilePath);
    			file.setFileName(uploadFile3.getStoreFileName() + "." + uploadFile3.getStoreFileExtention());
    			//파일등록
    			realCnt += 1;
    			successCnt += apiMapper.uploadFile(file);
    		}
    		if(file.getUploadFile4() != null){
    			UploadFile uploadFile4 = FileUtil.saveMultipartImage(file.getUploadFile4(), chkFilePath);
    			file.setFileName(uploadFile4.getStoreFileName() + "." + uploadFile4.getStoreFileExtention());
    			//파일등록
    			realCnt += 1;
    			successCnt += apiMapper.uploadFile(file);
    		}
    		if(file.getUploadFile5() != null){
    			UploadFile uploadFile5 = FileUtil.saveMultipartImage(file.getUploadFile5(), chkFilePath);
    			file.setFileName(uploadFile5.getStoreFileName() + "." + uploadFile5.getStoreFileExtention());
    			//파일등록
    			realCnt += 1;
    			successCnt = apiMapper.uploadFile(file);
    		}
    		if(successCnt < 1 || realCnt != successCnt){
    			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
    			throw new BizExceptionProperties(ErrorCodeEnum.FAIL.getCode());
    		}
    	} catch (Exception e) {
    		resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
    		throw new BizExceptionProperties(ErrorCodeEnum.FAIL.getCode());
		}

    	return resultMap;
    }

    /**
     * 장비 이미지 조회
     */
	@Override
	public java.io.File maintenanceImage(String chkMonth, String fileName, String fileExt) throws Exception  {
		java.io.File file = new java.io.File(filePath + chkMonth + "/" + fileName + "." + fileExt);
		
		
		if(!file.exists()) {
			logger.error("Email Image File Not Found");
			logger.error("FileName = " + fileName + ", FileExtension = " + fileExt);

			//기본이미지로
			java.io.File dFile = new java.io.File(this.getClass().getClassLoader().getResource("").getPath()+Constants.DEFAULT_404_IMAGE);
			return dFile;
		}
		return file;
	}

}
