package com.flk.batch.scheduler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.flk.batch.service.BatchTaskService;
import com.flk.common.utility.DateFormatUtils;

public class BatchTask {
	
	private static final Logger logger = LoggerFactory.getLogger(BatchTask.class);
	
	@Autowired
	private BatchTaskService batchTaskService;
	
	/**
	 * 초단기 실황조회 1시간 마다
	 * @throws Exception
	 */
	@Scheduled(fixedDelayString = "${scheduled.forecastGrib.fixedDelay}")
	public void getForecastGrib() throws Exception {
		logger.info("==================================[Batch Process Start]==================================");
		logger.info("[초단기실황조회 DB UPDATE] Process 시작 : " + DateFormatUtils.getMillisecondsTime());
		
		batchTaskService.getForecastGrib();
		
		logger.info("[초단기실황조회 DB UPDATE] Process 종료 : " + DateFormatUtils.getMillisecondsTime());
		logger.info("==================================[Batch Process End]==================================");
	}
	
	/**
	 * 동네예보(3시간간격 예보) 매일 05시
	 * 
	 * @throws Exception
	 */
	@Scheduled(cron = "${scheduled.forecastSpaceData.cron}")
	public void getForecastSpaceData() throws Exception {
		logger.info("==================================[Batch Process Start]==================================");
		logger.info("[동네예보 DB INSERT/UPDATE] Process 시작 : " + DateFormatUtils.getMillisecondsTime());
		
		batchTaskService.getForecastSpaceData();
		
		logger.info("[동네예보 DB INSERT/UPDATE] Process 종료 : " + DateFormatUtils.getMillisecondsTime());
		logger.info("==================================[Batch Process End]==================================");
	}

	/**
	 * 보고서 생성 매일 02시
	 * @throws Exception
	 */
	@Scheduled(cron = "${scheduled.report.create.cron}")
	public void createReport() throws Exception {
		logger.info("==================================[Batch Process Start]==================================");
		logger.info("[보고서 생성 & DB INSERT] Process 시작 : " + DateFormatUtils.getMillisecondsTime());

		batchTaskService.createReport();
		
		logger.info("[보고서 생성 & DB INSERT] Process 종료 : " + DateFormatUtils.getMillisecondsTime());
		logger.info("==================================[Batch Process End]==================================");
	}
	
	/**
	 * 상황일지 보고서 작성
	 * @throws Exception
	 */
	@Scheduled(cron = "${scheduled.dailyRecord.create.cron}")
	public void createDailyRecord() throws Exception {
		logger.info("==================================[Batch Process Start]==================================");
		logger.info("[상황일지 보고서 작성 & DB INSERT] Process 시작 : " + DateFormatUtils.getMillisecondsTime());
		
		batchTaskService.createDailyRecord();
		
		logger.info("[상황일지 보고서 작성 & DB INSERT] Process 종료 : " + DateFormatUtils.getMillisecondsTime());
		logger.info("==================================[Batch Process End]==================================");
	}
}
