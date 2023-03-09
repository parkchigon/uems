package com.flk.system.role.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.reflect.MethodUtils;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.flk.common.domain.CeWebConstants;
import com.flk.common.domain.Tree;

/**
 * 권한 트리 도메인
 *
 */
public class RoleTree extends Role implements Tree, Serializable {

	private static final long serialVersionUID = 1L;
	
	private final Map<String, Boolean> state = new HashMap<String, Boolean>();

	private String menuName;
	private String roleYn;
	private String leafYn;
	
	private List<String> programIds;
	
	// Default Constructor
	public RoleTree() {}
	
	public <T extends Role> RoleTree(T role) {
		setMenuId(StringUtils.defaultIfEmpty(role.getMenuId(), ""));
		setParentmenuId(StringUtils.defaultIfEmpty(role.getParentmenuId(), ""));
		setSortNum(StringUtils.defaultIfEmpty(role.getSortNum(), "0"));
		setUseYn(StringUtils.defaultIfEmpty(role.getUseYn(), "N"));
	}
	
	public <T extends Map<String, ? extends Object>> RoleTree(T map) {

		for ( String key : map.keySet() ) {
			try {
				MethodUtils.invokeMethod(this, "set" + StringUtils.capitalize(key), ObjectUtils.defaultIfNull(map.get(key), "").toString());
			} catch (Exception e) {
				// setter가 없으면 무시됨.
			}
		}
	}
	
	@Override
	public String getId() {
		return getMenuId();
	}
	
	@Override
	public void setId(String id) {
		setMenuId(id);
	}
	
	@Override
	public String getParent() {
		String parentmenuId = getParentmenuId();
		return CeWebConstants.TOP_MENU_ID.equals(parentmenuId) ? "#" : parentmenuId;
	}
	
	@Override
	public void setParent(String parentId) {
		setParentmenuId(parentId);
	}
	
	@Override
	public String getText() {
		return getMenuName();
	}
	
	@Override
	public void setText(String text) {
		setMenuName(text);
	}
	
	@Override
	public void setUseYn(String yn) {
		super.setUseYn(yn);
	}

	@Override
	public Map<String, Boolean> getState() {
		if ( CeWebConstants.TOP_MENU_ID.equals(getParentmenuId()) ) {
			state.put("opened", true);
		}
		
		// 권한이 있는 메뉴의 최하위 메뉴에만 체크 표시를 하기 위해
		if ( "Y".equals(getRoleYn()) ) { 			// Role에 포함된 경우
			if ( "Y".equals(getLeafYn()) ) { 		// 최하위 메뉴인 경우
				state.put("checked", true);
			} else { 								// 최하위 메뉴가 아닌 경우
				state.put("opened", true);
			}
		}
		
		return state;
	}
	
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getRoleYn() {
		return roleYn;
	}

	public void setRoleYn(String roleYn) {
		this.roleYn = roleYn;
	}

	public String getLeafYn() {
		return leafYn;
	}

	public void setLeafYn(String leafYn) {
		this.leafYn = leafYn;
	}
	
	@JsonProperty
	public void setMenuIds(String strMenuIds) {
		super.setMenuIds(new ArrayList<String>(Arrays.asList( StringUtils.split(strMenuIds, ",") )));
	}
	
	public List<String> getProgramIds() {
		return programIds;
	}
	
	public void setProgramIds(String strProgramIds) {
		this.programIds = Arrays.asList( StringUtils.split(strProgramIds, ",") );
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
