package com.flk._config.project;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.flk.common.utility.StringUtils;

import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrServiceImpl;
import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

@Configuration
@PropertySource("classpath:/config/common/idgen.properties")
public class ContextIdGen {

	@Autowired
	private Environment env;
	
	private static String USE_BIG_DECIMALS = "true";
	
	/**
	 * 공통 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl commIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.commStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.commId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.commId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.commId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.commId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.commId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.commId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 공통 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl commStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.commId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.commId.cipers"), "16")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.commId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
	/**
	 * 첨부파일 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl fileIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.fileStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.fileId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.fileId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.fileId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.fileId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.fileId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.fileId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 첨부파일 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl fileStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.fileId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.fileId.cipers"), "15")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.fileId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
	/**
	 * 관리자 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl mngIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.mngStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.mngId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.mngId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.mngId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.mngId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.mngId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.mngId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 관리자 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl mngStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.mngId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.mngId.cipers"), "16")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.mngId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
	/**
	 * 메뉴 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl menuIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.menuStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.menuId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.menuId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.menuId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.menuId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.menuId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.menuId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 메뉴 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl menuStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.menuId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.menuId.cipers"), "16")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.menuId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
	/**
	 * 프로그램 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl programIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.programStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.programId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.programId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.programId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.programId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.programId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.programId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 프로그램 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl programStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.programId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.programId.cipers"), "16")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.programId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
	/**
	 * 그룹 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl rolegrpIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.rolegrpStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.rolegrpId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.rolegrpId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.rolegrpId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.rolegrpId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.rolegrpId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.rolegrpId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 그룹 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl rolegrpStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.rolegrpId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.rolegrpId.cipers"), "16")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.rolegrpId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
	/**
	 * 코드 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl codeIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.codeIdStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.codeId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.codeId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.codeId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.codeId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.codeId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.codeId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 코드 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl codeIdStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.codeId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.codeId.cipers"), "16")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.codeId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
	
	/**
	 * 작업이력 ID Generation  Config
	 * @param dataSource
	 * @param egovIdGnrStrategyImpl
	 * @return
	 */
	@Bean(destroyMethod="destroy")
	public EgovTableIdGnrServiceImpl workIdGnrService(DataSource dataSource) {
		EgovTableIdGnrServiceImpl egovTableIdGnrServiceImpl = new EgovTableIdGnrServiceImpl();
		egovTableIdGnrServiceImpl.setDataSource(dataSource);
		egovTableIdGnrServiceImpl.setStrategy(this.workIdStrategy());
		egovTableIdGnrServiceImpl.setBlockSize(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.workId.blockSize"),"1")));
		egovTableIdGnrServiceImpl.setTable(env.getProperty("idgen.workId.table"));
		egovTableIdGnrServiceImpl.setNextIdFieldName(env.getProperty("idgen.workId.nextIdFieldName"));
		egovTableIdGnrServiceImpl.setTableNameFieldName(env.getProperty("idgen.workId.tableNameFieldName"));
		egovTableIdGnrServiceImpl.setTableName(env.getProperty("idgen.workId.tableName"));
		egovTableIdGnrServiceImpl.setUseBigDecimals(USE_BIG_DECIMALS.equals(env.getProperty("idgen.workId.useBigDecimals")));
		return egovTableIdGnrServiceImpl; 
	}
	
	/**
	 * 작업이력 ID Generation  Config
	 * @return
	 */
	@Bean
	public EgovIdGnrStrategyImpl workIdStrategy() {
		EgovIdGnrStrategyImpl egovIdGnrStrategyImpl = new EgovIdGnrStrategyImpl();
		egovIdGnrStrategyImpl.setPrefix(env.getProperty("idgen.workId.prefix"));
		egovIdGnrStrategyImpl.setCipers(Integer.parseInt(StringUtils.defaultString(env.getProperty("idgen.workId.cipers"), "15")));
		egovIdGnrStrategyImpl.setFillChar(StringUtils.defaultString(env.getProperty("idgen.workId.fillChar"), "0").charAt(0));
		return egovIdGnrStrategyImpl;
	}
	
}
