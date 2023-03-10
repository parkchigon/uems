package com.flk._config.mybatis;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import net.sf.log4jdbc.Log4jdbcProxyDataSource;
import net.sf.log4jdbc.tools.Log4JdbcCustomFormatter;
import net.sf.log4jdbc.tools.LoggingType;

@Configuration
@PropertySource("classpath:/config/${spring.profiles.active}/jdbc.properties")
@MapperScan(basePackages="com.flk.**.mapper", annotationClass=Repository.class)
@EnableTransactionManagement
public class ContextDataSource {

	@Autowired
	private Environment env;
	
	/**
	 * 
	 * @return dataSource
	 */
    @Bean
    public DataSource dataSource() {
        BasicDataSource dataSource = new BasicDataSource();     
        dataSource.setDriverClassName(env.getProperty("Globals.DriverClassName"));
        dataSource.setUrl(env.getProperty("Globals.Url"));
        dataSource.setUsername(env.getProperty("Globals.UserName"));
        dataSource.setPassword(env.getProperty("Globals.Password"));
        dataSource.setValidationQuery(env.getProperty("Globals.ValidationQuery"));
        
        //dev,stg,product ??????????????? ?????? dataSoure??? return ?????? ???
        //system ????????? ?????? ????????? local??????????????? ???????????? ???
        //dev,stg,product ??????????????? 56~62???????????? ????????????, 54????????? ??????????????? ???
        //return dataSource
        
        Log4jdbcProxyDataSource logRemix = new Log4jdbcProxyDataSource(dataSource);
    	Log4JdbcCustomFormatter formatter = new Log4JdbcCustomFormatter();
    	formatter.setLoggingType(LoggingType.MULTI_LINE);
    	formatter.setSqlPrefix("SQL           :\n		");
    	logRemix.setLogFormatter(formatter);
    	
        return logRemix;
    }
  

    /**
     * 
     * @param dataSource
     * @return DataSourceTransactionManager
     */
    @Bean
    public DataSourceTransactionManager txManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     * 
     * @return SqlSessionFactoryBean
     * @throws Exception
     */
    @Bean
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new RefreshableSqlSessionFactoryBean();
        // ?????? ????????? ?????? ?????? ????????? ???????????? ????????? ?????? ?????? ????????? ?????? ?????? ??????????????? ??????. ?????? ????????? ?????? ??????
        //SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:/mybatis/config/mybatis.configuration.xml"));
        sessionFactory.setMapperLocations(this.resolveMapperLocations());
        return sessionFactory;
    }
    
    /**
     * 
     * @param sqlSessionFactory
     * @return SqlSessionTemplate
     * @throws Exception
     */
    @Bean(destroyMethod = "clearCache")
    public SqlSessionTemplate dataSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
    
    /**
     * set multiple mapperLocation
     * @return
     */
    private Resource[] resolveMapperLocations() {
    	String dbType = env.getProperty("Globals.DbType");
        String[] mapperLocations = {
        		"classpath:/mybatis/mapper/"+dbType+"/**Mapper.xml"
        		, "classpath:/mybatis/mapper/common/"+dbType+"/**Mapper.xml"
        };
        
		ResourcePatternResolver resourceResolver = new PathMatchingResourcePatternResolver();
		List<Resource> resources = new ArrayList<Resource>();
		
		for (String mapperLocation : mapperLocations) {
			try {
				Resource[] mappers = resourceResolver.getResources(mapperLocation);
				resources.addAll(Arrays.asList(mappers));
			} catch (IOException e) {
				// ignore
			}
		}
		
		return resources.toArray(new Resource[resources.size()]);
		
	}
    
}
