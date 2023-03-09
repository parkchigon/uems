package com.flk.mng.miniDiagram.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.domain.Constants;
import com.flk.common.utility.StringUtils;
import com.flk.mng.equipment.domain.CTower;
import com.flk.mng.miniDiagram.domain.MiniDiagram;
import com.flk.mng.miniDiagram.mapper.MiniDiagramMapper;


/**
 * 관리 ( 미니계통도 관리 )
 */
@Service
public class MiniDiagramServiceImpl implements MiniDiagramService {
	
	@Autowired
	private MiniDiagramMapper miniDiagramMapper;
	
	/**
	 * 미니 계통도 관리 조회
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchMiniDiagram(MiniDiagram miniDiagram) throws Exception {
		miniDiagram.setLastIndex(1);
		return miniDiagramMapper.selectMiniDiagramList(miniDiagram);
	}

	/**
	 * 미니 계통도 컴퍼넌트 조회
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> searchComponentNameList(MiniDiagram miniDiagram) throws Exception {
		if ( StringUtils.isEmpty(miniDiagram.getTemplateId()) ) {
			miniDiagram.setTemplateId(Constants.TocSystem.TEMPLATE_A);
		}
		
		List<FlkMap> selectComponentNameList = miniDiagramMapper.selectComponentNameList(miniDiagram);
		Map<String, String> componentGroup = new LinkedHashMap<String, String>();
		for ( FlkMap mini : selectComponentNameList ) {
			componentGroup.put(String.valueOf(mini.get("groupId")), String.valueOf(mini.get("groupName")));
			miniDiagram.setThumbnailFilePath(String.valueOf(mini.get("thumnailFilePath")));
		}
		miniDiagram.setComponentGroup(componentGroup);
		
		return selectComponentNameList;
	}

	/**
	 * 태그 리스트 조회
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FlkMap> selectTagList(MiniDiagram miniDiagram) throws Exception {
		return miniDiagramMapper.selectTagList(miniDiagram);
	}

	/**
	 * 미니계통도 태그 매핑
	 * @return
	 * @throws Exception
	 */
	@Override
	@Transactional
	public void insertMiniDiagramTagMapping(MiniDiagram miniDiagram) throws Exception {
		if(! StringUtils.isEmpty(miniDiagram.getMappingList())){ 
			// 미니계통도 기존 태그 삭제
			miniDiagramMapper.deleteMiniDiagramTagMapping(miniDiagram);
			for(MiniDiagram mini : miniDiagram.getMappingList()){
				mini.setSiteId(miniDiagram.getSiteId());
				mini.setTemplateId(miniDiagram.getTemplateId());
				mini.setSetFlag(Constants.YES);
				mini.setRegId(miniDiagram.getRegId());
				mini.setUpdateId(miniDiagram.getUpdateId());
			}
			// 미니계통도 태그 매핑
			miniDiagramMapper.insertMiniDiagramTagMapping(miniDiagram);
			// 미니계통도 매핑 사이트 정보 업데이트
			miniDiagramMapper.insertMiniDiagramSystemSite(miniDiagram);
		}
	}

	/**
	 * 태그 매핑 조회
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, Object> selectSystemTagMapping(MiniDiagram miniDiagram) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<FlkMap> tagMappingList = miniDiagramMapper.selectSystemTagMapping(miniDiagram);
		resultMap.put("tagMappingList", tagMappingList);
		return resultMap;
	}
	
}
