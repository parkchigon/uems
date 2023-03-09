package com.flk.ems.schedule.service;

import java.util.List;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.flk.batch.mapper.BatchTaskMapper;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.utility.StringUtils;
import com.flk.ems.schedule.domain.ScheduleRecord;
import com.flk.ems.schedule.mapper.ScheduleRecordMapper;
import com.flk.mng.report.domain.DailyRecord;
import com.flk.mng.report.mapper.ReportMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;

@Service
public class ScheduleRecordServiceImpl implements ScheduleRecordService{

	private static final Logger logger = LoggerFactory.getLogger(ScheduleRecordServiceImpl.class);
	
	@Autowired
	private ScheduleRecordMapper scheduleRecordMapper;
	
	

	@Override
	public List<FlkMap> searchDriveList(Site site) throws Exception {
		return scheduleRecordMapper.selectDriveList(site);
	}

	@Override
	public List<FlkMap> searchTagList(Site site) throws Exception {
		return scheduleRecordMapper.selectTagList(site);
	}
	
	@Override
	public List<FlkMap> searchSiId(ScheduleRecord scheduleRecord) throws Exception {
		return scheduleRecordMapper.selectSiIdList(scheduleRecord);
	}

	@Override
	public List<FlkMap> selectScheduleRecordList(ScheduleRecord scheduleRecord) throws Exception {
		return scheduleRecordMapper.selectScheduleRecordList(scheduleRecord);
	}

	/**
	 * 스케줄관리 > 스케줄 관리 저장
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional
	public int addScheduleRecord(ScheduleRecord scheduleRecord) throws Exception {
		
		int result = 1;
		try {
			
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for(int i = 0 ; i < 8 ; i++){
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					temp.append((rnd.nextInt(10)));
					break;

				}
			}
			// 테이블 KEY값
			scheduleRecord.setSiId(scheduleRecord.getSiteCd()+temp);
			// 운전종료 제어태그ID는 필수입력
			scheduleRecord.setTagId02(scheduleRecord.getTagId01());
			// 운전시작 제어값은 1.0으로 필수입력
			scheduleRecord.setTagValue01(1.0);
			// 운전종료 제어값은 0.0으로 필수입력
			scheduleRecord.setTagValue02(0.0);
			// 태그 제어 후 제어적용확인시간 (디폴트로 10초)
			scheduleRecord.setDelayTime(10);
			
			// 운전시작시간
			if (scheduleRecord.getTagTime01()!=null && !scheduleRecord.getTagTime01().isEmpty()) {
				scheduleRecord.setTagTime01(scheduleRecord.getTagTime01().replace(":", ""));
			} else {
				scheduleRecord.setTagTime01(null);
			}
			
			// 운전종료시간
			if (scheduleRecord.getTagTime02()!=null && !scheduleRecord.getTagTime02().isEmpty()) {
				scheduleRecord.setTagTime02(scheduleRecord.getTagTime02().replace(":", ""));
			} else {
				scheduleRecord.setTagTime02(null);	// 스케줄 종료시작 제어값으 0
			}
			
			scheduleRecordMapper.insertScheduleRecord(scheduleRecord);
			scheduleRecordMapper.insertScheduleHistoryRecord(scheduleRecord);
			
		} catch (Exception e) {
			result = 0;
			logger.error("insertScheduleRecord error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}
	
	/**
	 * 스케줄관리 > 스케줄 관리 수정
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional
	public int editScheduleRecord(ScheduleRecord scheduleRecord) throws Exception {
		
		int result = 1;
		try {
			
			// 운전시작시간
			if (scheduleRecord.getTagTime01()!=null && !scheduleRecord.getTagTime01().isEmpty()) {
				scheduleRecord.setTagTime01(scheduleRecord.getTagTime01().replace(":", ""));
			} else {
				scheduleRecord.setTagId01(null);
			}
			
			// 운전종료시간
			if (scheduleRecord.getTagTime02()!=null && !scheduleRecord.getTagTime02().isEmpty()) {
				scheduleRecord.setTagTime02(scheduleRecord.getTagTime02().replace(":", ""));
			} else {
				scheduleRecord.setTagTime02(null);	// 스케줄 종료시작 제어값으 0
			}
			
			scheduleRecordMapper.updateScheduleRecord(scheduleRecord);
			scheduleRecordMapper.updateScheduleHistoryRecord(scheduleRecord);
			
		} catch (Exception e) {
			result = 0;
			logger.error("updateScheduleRecord error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}

	/**
	 * 스케줄관리 > 스케줄 관리 삭제
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional
	public int deleteScheduleRecord(ScheduleRecord scheduleRecord) throws Exception {
		
		int result = 1;
		try {
			
			scheduleRecordMapper.deleteScheduleRecord(scheduleRecord);
			scheduleRecordMapper.deleteScheduleHistoryRecord(scheduleRecord);
			
		} catch (Exception e) {
			result = 0;
			logger.error("deleteScheduleRecord error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}

	
	/**
	 * 스케줄 관리 휴점일 리스트
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */	
	@Override
	public List<FlkMap> selectScheduleOutdayList(ScheduleRecord scheduleRecord) throws Exception {
		return scheduleRecordMapper.selectScheduleOutdayList(scheduleRecord);
	}
	
	/**
	 * 스케줄 관리 휴점일 저장
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@Override
	public int addScheduleOutday(ScheduleRecord scheduleRecord) throws Exception {
		int result = 1;
		try {
		
				scheduleRecordMapper.insertScheduleOutday(scheduleRecord);
				scheduleRecordMapper.insertScheduleOutdayHistory(scheduleRecord);
		} catch (Exception e) {
			result = 0;
			logger.error("addScheduleOutday error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}

	/**
	 * 스케줄 관리 휴점일 삭제
	 * @param scheduleRecord
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional
	public int scheduleOutdayDeleteAjax(ScheduleRecord scheduleRecord) throws Exception {
		
		int result = 1;
		try {
			
			scheduleRecordMapper.deleteScheduleOutday(scheduleRecord);
			scheduleRecordMapper.deleteScheduleOutdayHistory(scheduleRecord);
			
		} catch (Exception e) {
			result = 0;
			logger.error("deleteScheduleOutday error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}
}
