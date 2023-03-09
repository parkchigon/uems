package com.flk.attachfile.service;

import java.util.List;

import com.flk.attachfile.domain.AttachFile;
import com.flk.common.dataaccess.util.FlkMap;

public interface AttachFileService {

	/**
	 * 파일 데이터 삭제
	 * @param attachFile
	 * @throws Exception
	 */
	void removeAttachFile(AttachFile attachFile) throws Exception;

	/**
	 * 
	 * @param fileRefId
	 * @param fileGroup
	 * @throws Exception
	 */
	void removeAttachFileFileRefId(String fileRefId, String fileGroup) throws Exception;

	/**
	 * 파일 데이터 등록
	 * @param attachFile
	 * @throws Exception
	 */
	void addAttachFile(AttachFile attachFile) throws Exception;

	/**
	 * 
	 * @param fileRefId
	 * @param fileids
	 * @throws Exception
	 */
	@Deprecated //TODO 삭제 확인
	void attachFileExe(String fileRefId, String[] fileids) throws Exception;

	/**
	 * 
	 * @param fileRefId
	 * @param fileids
	 * @throws Exception
	 */
	void modifyAttachFileImageExe(String fileRefId, String[] fileids) throws Exception;
	
	/**
	 * 파일 데이터 목록
	 * @param attachFile
	 * @return List<FlkMap>
	 * @throws Exception
	 */
	List<FlkMap> searchAttachFileList(AttachFile attachFile) throws Exception;

	/**
	 * 파일 데이터 업데이트
	 * @param attachFile
	 * @throws Exception
	 */
	void modifyAttachFile(AttachFile attachFile) throws Exception;

	/**
	 * 파일 데이터 조회
	 * @param attachFile
	 * @return FlkMap
	 * @throws Exception
	 */
	FlkMap searchAttachFileView(AttachFile attachFile) throws Exception;

	/**
	 * 파일 다운 회수 업데이트
	 * @param attachFile
	 * @throws Exception
	 */
	void modifyAttachFileDownCnt(AttachFile attachFile) throws Exception;

	/**
	 * 파일 데이터 복사
	 * @param oldFileRefId
	 * @param newFileRefId
	 * @param regId
	 * @throws Exception
	 */
	void addAttachFileCopy(String oldFileRefId, String newFileRefId, String regId) throws Exception;
	
}