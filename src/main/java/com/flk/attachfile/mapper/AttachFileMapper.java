package com.flk.attachfile.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.attachfile.domain.AttachFile;
import com.flk.common.dataaccess.util.FlkMap;

/**
 * 
 * 파일 첨부 맵퍼
 *
 */
@Repository
public interface AttachFileMapper {

	/**
	 * 파일 데이터 등록
	 * @param attachFile
	 */
	public void insertAttachFile(AttachFile attachFile);

	/**
	 * 파일 데이터 업데이트
	 * @param attachFile
	 */
	public void updateAttachFile(AttachFile attachFile);

	/**
	 * 파일 데이터 삭제
	 * @param attachFile
	 */
	public void deleteAttachFile(AttachFile attachFile);

	/**
	 * FileRefId 데이터 업데이트
	 * @param attachFile
	 */
	public void updateAttachFileFileRefId(AttachFile attachFile);

	/**
	 * 파일 데이터 목록 조회
	 * @param attachFile
	 * @return List<FlkMap>
	 */
	public List<FlkMap> selectAttachFileList(AttachFile attachFile);

	/**
	 * 파일 데이터 조회
	 * @param attachFile
	 * @return FlkMap
	 */
	public FlkMap selectAttachFileView(AttachFile attachFile);

	/**
	 * 파일 다운 횟수 업데이트
	 * @param attachFile
	 */
	public void updateAttachFileDownCnt(AttachFile attachFile);

	/**
	 * 파일 데이터 조회해서 저장
	 * @param attachFile
	 */
	public void insertAttachFileCopy(AttachFile attachFile);

}
