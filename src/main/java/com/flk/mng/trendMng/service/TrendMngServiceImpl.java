package com.flk.mng.trendMng.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.utility.LogUtil;
import com.flk.common.utility.StringUtils;
import com.flk.mng.trendMng.domain.TrendGroup;
import com.flk.mng.trendMng.mapper.TrendMngMapper;

@Service
public class TrendMngServiceImpl implements TrendMngService{
	
	@Autowired
	private TrendMngMapper trendMngMapper;
	
	private Logger logger = LogUtil.serviceLog;

	/**
	 * 트랜드 그룹 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<TrendGroup> selectTrendGroupList(TrendGroup trendGroup) throws Exception {
		return trendMngMapper.selectTrendGroupList(trendGroup);
	}

	/**
	 * 태그 타입 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<TrendGroup> selectTagList(TrendGroup trendGroup) throws Exception {
		return trendMngMapper.selectTagList(trendGroup);
	}

	/**
	 * 지점 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectSiteList(TrendGroup trendGroup) throws Exception {
		return trendMngMapper.selectSiteList(trendGroup);
	}

	/**
	 * 트랜드그룹에 따른 태그 리스트
	 * @param trendGroup
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<TrendGroup> selectTrendTagList(TrendGroup trendGroup) throws Exception {
		return trendMngMapper.selectTrendTagList(trendGroup);
	}

	/**
	 * 트랜드 그룹 설정 저장
	 * @param trendGroup
	 * @return
	 */
	@Override
	@Transactional
	public boolean insertTrendGroup(TrendGroup trendGroup) {
		Boolean result = true;
		try {
			
			List<String> addTagList = new ArrayList<String>(); //추가할 태그 리스트
			List<String> selectedTagList = trendGroup.getTrendTagList(); //view에서 추가한 태그 리스트
			List<String> selectedTrendList = trendGroup.getTrendGroupList(); //view에서 추가한 트랜드 리스트
			List<String> delTagList = new ArrayList<String>(); //삭제할 태그 리스트
			List<String> delTrendList = new ArrayList<String>(); //삭제할 트랜드 리스트
			
			List<TrendGroup> selectTrendGroupList = trendMngMapper.selectTrendGroupList(trendGroup);
			List<String> tgNameList = new ArrayList<String>();
			for(TrendGroup tgName : selectTrendGroupList){
				tgNameList.add(tgName.getTgName());
			}
			
			//트랜드 그룹 추가 및 삭제
			TrendGroup delObj = new TrendGroup();
			delObj.setSiteId(trendGroup.getSiteId());
			if(!StringUtils.isEmpty(selectedTrendList)){
				for(String trendGroupName : selectedTrendList){
					if(!tgNameList.contains(trendGroupName)){
						trendGroup.setTgName(trendGroupName);
						trendMngMapper.insertTrendGroup(trendGroup);
					}
				}
				
				for(TrendGroup trendGroupIds : selectTrendGroupList){
					if(!selectedTrendList.contains(trendGroupIds.getTgName())){
						delTrendList.add(trendGroupIds.getTgName());
					}
					if(delTrendList.size()>0){
						delObj.setTrendGroupList(delTrendList);
						deleteTrendGroup(delObj);
					}
				}
				
			}else{
				//해당 지점의 모든 트랜드 삭제
				deleteTrendGroup(delObj);
			}
			
			//트랜드 그룹 태그 추가 및 삭제
			List<TrendGroup> selectTrendTagList = new ArrayList<TrendGroup>();
			List<String> tagIdList = new ArrayList<String>();
			if(!StringUtils.isEmpty(trendGroup.getTgId())){//선택한 트랜드 그룹이 있을 경우
				//TrendGroup obj = new TrendGroup();
				//obj.setTgName(trendGroup.getTgId());
				selectTrendTagList = trendMngMapper.selectTrendTagList(trendGroup);//선택한 트랜드그룹에 따른 태그 리스트 
				for(TrendGroup tagId : selectTrendTagList){
					tagIdList.add(tagId.getTagId());
				}
				
				if(!StringUtils.isEmpty(selectedTagList)){
					//트랜드 그룹 태그 추가
					for(String tagId : selectedTagList){
						if(!tagIdList.contains(tagId)){
							addTagList.add(tagId);
						}
					}
					if(addTagList.size()>0){
						trendGroup.setTrendTagList(addTagList);
						trendMngMapper.insertTrendGroupTag(trendGroup);
					}
					//트랜드 그룹 태그 삭제
					for(TrendGroup tagIds : selectTrendTagList){
						if(!selectedTagList.contains(tagIds.getTagId())){
							delTagList.add(tagIds.getTagId());
						}
					}
					if(delTagList.size()>0){
						trendGroup.setTrendTagList(delTagList);
						trendMngMapper.deleteTrendGroupTag(trendGroup);
					}
				}else{
					//해당 트랜드그룹의 태그들 모두 삭제
					trendMngMapper.deleteTrendGroupTag(trendGroup);
				}
			}
			
		} catch (Exception e) {
			result = false;
			logger.error("addTrendGroup error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}
	
	//트랜드 그룹 삭제
	@Transactional
	public boolean deleteTrendGroup(TrendGroup trendGroup) {
		Boolean result = true;
		try {
			if(StringUtils.isEmpty(trendGroup.getTrendGroupList())){
				//해당 지점의 모든 트랜드그룹, 트랜드 태그 삭제
				trendMngMapper.deleteTrendGroupTag(trendGroup);
				trendMngMapper.deleteTrendGroup(trendGroup);
			}else{
				for(String tgId : trendGroup.getTrendGroupList()){
					trendMngMapper.deleteTrendGroupTag(trendGroup);
					trendGroup.setTgId(tgId);
					trendMngMapper.deleteTrendGroup(trendGroup);
				}
			}
		} catch (Exception e) {
			result = false;
			logger.error("deleteTrendGroup error", e);
			// rollback
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}

}
