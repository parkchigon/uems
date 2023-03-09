package com.flk.ems.system.service;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.DateFormatUtils;
import com.flk.ems.system.domain.RawData;
import com.flk.ems.system.domain.SystemTagMap;
import com.flk.ems.system.mapper.EmsMainMapper;
import com.flk.mng.site.domain.Site;
import com.flk.mng.site.mapper.SiteMapper;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class EmsMainServiceImpl implements EmsMainService{

	private static final Logger logger = LoggerFactory.getLogger(EmsMainServiceImpl.class);
	
	@Autowired
	private EmsMainMapper emsMainMapper;
	
	@Autowired
	private SiteMapper siteMapper;
	
	/**
	 * 실시간 태그 값 조회
	 */
	@Override
	public List<FlkMap> selectTagValue(RawData rawData) throws Exception {
		return emsMainMapper.selectTagValue(rawData);
	}
	
	/**
	 * 실시간 태그 값 조회
	 */
	@Override
	public List<FlkMap> selectGeyngbuValue(RawData rawData) throws Exception {
		return emsMainMapper.selectGeyngbuValue(rawData);
	}

	/**
	 * 태그 매핑 조회
	 */
	@Override
	public List<FlkMap> selectTagMapping(SystemTagMap systemTagMap) throws Exception {
		return emsMainMapper.selectTagMapping(systemTagMap);
	}

	/**
	 * 서브메뉴 리스트 조회
	 */
	@Override
	public List<FlkMap> selectSubMenuList(SystemTagMap systemTagMap) throws Exception {
		return emsMainMapper.selectSubMenuList(systemTagMap);
	}


	/**
	 * 실시간 알람 조회
	 */
	@Override
	public List<FlkMap> selectAlarmStatus(RawData rawData) throws Exception {
		return emsMainMapper.selectAlarmStatus(rawData);
	}
	

	@Override
	public Map<String, Object> updateAlarmReset(RawData rawData) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		rawData.setTagValue(Constants.CODE.ALARM_STATUS04);
		
		if(emsMainMapper.updateAlarmReset(rawData) > 0) {
			resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
			resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
		} else {
			resultMap.put(Constants.RESULT_CODE, Constants.NOT_UPDATE);
			resultMap.put(Constants.RESULT_MSG, Constants.NOT_UPDATE_MSG);
		}
		return resultMap;
	}
	
	
	/**
	 * 태그 value 세팅
	 * 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Map<String, Object> updateTagValue(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// TBL_SITE 정보 조회 (지점IP 정보 필요)
		Site site = new Site();
		site.setSiteCd((String) paramMap.get("siteCd"));
		FlkMap siteInfo = siteMapper.selectSiteView(site);
		String siteIp = (String) siteInfo.get("siteIp");
		
		// 헤더 세팅
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		// 파라미터 세팅
		JSONObject paramObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		BigInteger currDate =  new BigInteger(DateFormatUtils.getMillisecondsTime());
		List<Map<String, Object>> tagList = (List<Map<String, Object>>) paramMap.get("tagList"); 
		for(Map<String, Object> map : tagList) {
			if(StringUtils.isBlank((String) map.get("tagId"))) {
	    		throw new Exception("PLC Controller tagId null");
	    	}
			
			JSONObject obj = new JSONObject();
			obj.put("tag_id", map.get("tagId"));
			obj.put("control_value", map.get("value"));
			obj.put("identity_cd", (String) paramMap.get("siteCd") + String.valueOf(currDate).substring(4, 17));
			
			jsonArr.add(obj);
			currDate = currDate.add(BigInteger.ONE);
		}
		paramObj.put("control_place", paramMap.get("controlPlace"));
		paramObj.put("plc_index", paramMap.get("plcNo"));
		paramObj.put("request", jsonArr);
		
		logger.info("request ===> " + JSONObject.fromObject(paramObj));
	    HttpEntity entity= new HttpEntity(paramObj, headers);
	    
	    try {
	    	RestTemplate restTemplate = new RestTemplate(getClientHttpRequestFactory());
	    	HttpEntity<String> restResponse = restTemplate.exchange("https://"+siteIp+":8888", HttpMethod.POST, entity, String.class);
	    	logger.info("response ===> " + restResponse.getBody());
	    	
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
	    			if(StringUtils.equals(resObj.getString("identity_cd"), reqObj.getString("identity_cd"))) {
	    				Map<String, Object> tagMap = new HashMap<String, Object>();
	    				tagMap.put("identityCode", resObj.getString("identity_cd"));
	    				tagMap.put("tagId", reqObj.getString("tag_id"));
	    				tagMap.put("controlValue", reqObj.getString("control_value"));
	    				tagMap.put("successFlag", resObj.getString("status"));
	    				
	    				resultList.add(tagMap);
	    				break;
	    			}
	    		}
	    	}
	    	paramMap.put("tagList", resultList);
	    	
	    	// tbl_controller_history INSERT
	    	if(emsMainMapper.insertControlHistory(paramMap) > 0) {
				resultMap.put(Constants.RESULT_CODE, Constants.SUCCESS);
				resultMap.put(Constants.RESULT_MSG, Constants.SUCCESS_MSG);
			} else {
				resultMap.put(Constants.RESULT_CODE, Constants.ERROR);
				resultMap.put(Constants.RESULT_MSG, "tbl_controller_history INSERT ERROR");
			}
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
