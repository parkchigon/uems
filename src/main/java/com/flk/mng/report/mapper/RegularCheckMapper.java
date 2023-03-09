package com.flk.mng.report.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.flk.api.domain.File;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.report.domain.Maintenance;

@Repository
public interface RegularCheckMapper {

	/**
	 * 장비리스트조회
	 * @param report
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectFacilityList(Maintenance maintenance) throws Exception;
	
	/**
	 * 점검항목 테이블 키값 조회
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	Maintenance selectMsId(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 대항목 리스트 조회
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectFacilityQueList(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 상세항목 리스트 조회
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	List<FlkMap> selectFacilityAnsList(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 > QUE 삭제항목 이전데이터 update
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	int deleteQueList(Maintenance maintenance) throws Exception;

	/**
	 * 장비점검 > ANS 수정항목 이전데이터 update
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void updateAnsList(Maintenance maintenance) throws Exception;

	/**
	 * 장비점검 > ANS 수정항목 이전데이터 update(필수항목 '기타' sort no 수정)
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void updateAnsEtcSortNo(Maintenance maintenance) throws Exception;	
	
	/**
	 * 장비점검 > QUE 삭제항목 이전데이터 update 후 ANSWER 테이블 업데이트
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void deleteQueAnsList(Maintenance maintenance) throws Exception;
	/**
	 * 장비점검 > QUE 삭제항목 이전데이터 update 후 ANSWER 테이블 업데이트
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void deleteAnsList(Maintenance maintenance) throws Exception;

	/**
	 * 장비점검 > QUE 수정항목 이전데이터 update
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void updateQueList(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 > QUE 신규추가항목 신규데이터 insert
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void insertQueList(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 > QUE 신규추가항목 에 따른 상세항목 default 데이터 insert
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void insertAnsDefaultEtc(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 > ANS 신규추가항목 신규데이터 insert
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void insertAnsList(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 > 정렬순서 update
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void updateQueSortNo(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 > 상세항목 정렬순서 update
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void updateAnsSortNo(Maintenance maintenance) throws Exception;
	
	/**
	 * 장비점검 > 대항목QUE 재등록에 대한 > ANS테이블 msq_id 업데이트
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	void updateAnsMsqId(Maintenance maintenance) throws Exception;

	/**
	 * 장비별 점검 완료 리스트 조회
	 * @param maintenance
	 * @return
	 */
	List<Maintenance> selectMaintenanceChk(Maintenance maintenance);

	/**
	 * 점검완료 리스트
	 * @param maintenance
	 * @return
	 */
	List<Maintenance> selectFinishFacilityList(Maintenance maintenance);
	
	/**
	 * 정기점검 사진 리스트 조회
	 * @param maintenance
	 * @return
	 */
	List<Maintenance> selectFileQueList(Maintenance maintenance);

	/**
	 * 정기점검 장비 상태 리스트
	 * @param maintenance
	 * @return
	 */
	List<FlkMap> selectFacilityStatusList(Maintenance maintenance);
	
	/**
	 * 정기점검 목록관리 리스트
	 * @param maintenance
	 * @return
	 */
	List<FlkMap> selectFacilityCheckCmpltList(Maintenance maintenance);
	
	/**
	 * 이미지리스트 조회
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<Maintenance> selectPhotoList(Maintenance maintenance) throws Exception;
	
	/**
	 * 이미지리스트 사용여부 .N
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public void deletePhotoList(Maintenance maintenance) throws Exception;
	
	/**
	 * 이미지리스트 실데이터 삭제
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public void realDeletePhotoList(Maintenance maintenance) throws Exception;
	
	/**
	 * 이미지 임시저장
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public int uploadImg(File file) throws Exception;
	
	/**
	 * 임시저장 이미지 사용여부 업데이트
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public void updateImgUseYn(Maintenance maintenance) throws Exception;
	
	/**
	 * 임시저장 이미지 사용여부 업데이트
	 * @param maintenance
	 * @return
	 * @throws Exception
	 */
	public List<Maintenance> selectNoUseImg(Maintenance maintenance) throws Exception;
}
