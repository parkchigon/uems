package com.flk.ems.alarm.service;

import java.math.BigInteger;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.DateFormatUtils;
import com.flk.ems.alarm.domain.Alarm;
import com.flk.ems.alarm.mapper.AlarmMapper;
import com.flk.ems.system.service.EmsMainServiceImpl;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class AlarmServiceImpl implements AlarmService {

	private static final Logger logger = LoggerFactory.getLogger(EmsMainServiceImpl.class);
	
	@Autowired
	private AlarmMapper alarmMapper;
	
	@Autowired
	private SiteMapper siteMapper;
	
	/**
	 * 푸터 > 경보 알람 조회
	 */
	@Override
	public Alarm selectAlarmFooter(Alarm alarm) throws Exception {
		return alarmMapper.selectAlarmFooter(alarm);
	}

	/**
	 * 경보 리스트 조 회
	 */
	@Override
	public List<FlkMap> selectAlarmList(Alarm alarm) throws Exception {
		return alarmMapper.selectAlarmList(alarm);
	}

	/**
	 * 경보 리스트 상태별 카운트
	 */
	@Override
	public Alarm selectAlarmCountForStatus(Alarm alarm) throws Exception {
		return alarmMapper.selectAlarmCountForStatus(alarm);
	}
	
	/**
	 * 경보리스트 상태값 변경
	 */
	@Override
	public void updateAlarmStatusCd(Alarm alarm) throws Exception{
		alarmMapper.updateAlarmStatusCd(alarm);
	}
	
	 @Value("#{comm['controller.req.ip']}")
	 private String controlIp;
	
	/**
	 * 태그 value 세팅
	 * 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map<String, Object> updateAlarmValue(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// TBL_SITE 정보 조회 (지점IP 정보 필요)
		Site site = new Site();
 		site.setSiteCd((String) paramMap.get("siteCd"));
		FlkMap siteInfo = siteMapper.selectSiteView(site);
		String siteIp = (String) siteInfo.get("siteIp");
		String schPort = null;
	    if(paramMap.get("controlPlace").equals("0")){
	    	schPort = "20123";
	    	siteIp = controlIp;
	    }else if(paramMap.get("controlPlace").equals("1")){
	    	schPort = "8888"; 
	    }
		// 헤더 세팅
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		// 파라미터 세팅
		JSONObject paramObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		List<Map<String, Object>> tagList = (List<Map<String, Object>>) paramMap.get("tagList"); 
		for(Map<String, Object> map : tagList) {
			if(StringUtils.isBlank((String) map.get("tagId"))) {
	    		throw new Exception("PLC Controller tagId null");
	    	}
			
			JSONObject obj = new JSONObject();
			obj.put("tag_id", map.get("tagId"));
			obj.put("alarm_status_cd", map.get("alramStatusCd"));
			obj.put("prev_alarm_status_cd", map.get("prevAlarmStatusCd"));
			
			jsonArr.add(obj);
		}
		paramObj.put("site_cd", paramMap.get("siteCd"));
		paramObj.put("control_place", paramMap.get("controlPlace"));
		paramObj.put("request", jsonArr);
		
		logger.info("request1 ===> " + JSONObject.fromObject(paramObj));
	    HttpEntity entity= new HttpEntity(paramObj, headers);
    	
	    try {
	    	RestTemplate restTemplate = new RestTemplate(getClientHttpRequestFactory());
	    	logger.info("response12 ===>");
	    	HttpEntity<String> restResponse = restTemplate.exchange("https://"+siteIp+":"+schPort+"/alarmupdate", HttpMethod.POST, entity, String.class);
	    	logger.info("response2 ===> " + restResponse.getBody());
	    	
	    	JSONObject body = JSONObject.fromObject(restResponse.getBody());
	    	JSONArray response = body.getJSONArray("response");
	    	List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
	    	
	    	if(response.size() < 1 ) {
	    		throw new Exception("PLC Controller response null");
	    	}
	    	
	    	for(int i=0; i<response.size(); i++) {
	    		JSONObject resObj = response.getJSONObject(i);
	    		for(int j=0; j<jsonArr.size(); j++) {
	    			JSONObject reqObj = jsonArr.getJSONObject(j);
	    			if(StringUtils.equals(resObj.getString("tag_id"), reqObj.getString("tag_id"))) {
	    				Map<String, Object> tagMap = new HashMap<String, Object>();
	    				tagMap.put("tagId", reqObj.getString("tag_id"));
	    				tagMap.put("successFlag", resObj.getString("status"));
	    				
	    				resultList.add(tagMap);
	    				break;
	    			}
	    		}
	    	}
	    	
	    	
	    	paramMap.put("alramStatusCd", paramMap.get("alramStatusCd"));
	    	paramMap.put("alarmIdList", paramMap.get("alarmIdList"));
	    	paramMap.put("tagList", resultList);
	    	
	    	
	    	alarmMapper.updatesAlarmStatusCd(paramMap);
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
			resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
			resultMap.put("resultList", resultList);

	    } catch (Exception e) {
			logger.error("##### PLC Controller 처리 중 에러 발생");
			logger.error(e.getMessage(), e);
			throw new Exception("PLC Controller ERROR");
	    }
		
		return resultMap;
	}
	
	/**
	 * restTemplate 설정
	 * @return
	 * @throws KeyStoreException 
	 * @throws NoSuchAlgorithmException 
	 * @throws KeyManagementException 
	 */
	private ClientHttpRequestFactory getClientHttpRequestFactory() throws NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
		
	    SSLContextBuilder builder = new SSLContextBuilder();
	    builder.loadTrustMaterial(null, new TrustSelfSignedStrategy());
	    SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(builder.build(), SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
	    CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
	    
	    HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
		requestFactory.setHttpClient(httpclient);
	    int timeout = 10000;
	    requestFactory.setConnectTimeout(timeout);
	    requestFactory.setReadTimeout(timeout);
	    
	    return requestFactory;
	}
}
