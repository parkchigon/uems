package com.flk.system.menu.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.reflect.MethodUtils;

import com.flk.common.domain.CeWebConstants;
import com.flk.common.domain.Tree;

/**
 * 메뉴 트리 도메인
 *
 */
public class MenuTree extends Menu implements Tree {
	
	private static final long serialVersionUID = 1L;
	
	private final Map<String, Boolean> state = new HashMap<String, Boolean>();
	
	// Default Constructor
	public MenuTree() {}
	
	public <T extends Menu> MenuTree(T menu) {
		setMenuId(StringUtils.defaultIfEmpty(menu.getMenuId(), ""));
		setMenuName(StringUtils.defaultIfEmpty(menu.getMenuName(), ""));
		setParentmenuId(StringUtils.defaultIfEmpty(menu.getParentmenuId(), ""));
		setMenuDepth(StringUtils.defaultIfEmpty(menu.getMenuDepth(), "1"));
		setSortNum(StringUtils.defaultIfEmpty(menu.getSortNum(), "0"));
		setUseYn(StringUtils.defaultIfEmpty(menu.getUseYn(), "N"));
		setLoginUrl(StringUtils.defaultIfEmpty(menu.getLoginUrl(), ""));
	}
	
	public <T extends Map<String, ? extends Object>> MenuTree(T map) {
		for ( String key : map.keySet() ) {
			try {
				MethodUtils.invokeMethod(this, "set" + StringUtils.capitalize(key), ObjectUtils.defaultIfNull(map.get(key), "").toString());
			} catch (Exception e) {
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
	
	public void setMenuIds(String strMenuIds) {
		super.setMenuIds(
			new ArrayList<String>(
				Arrays.asList( StringUtils.split(strMenuIds, ",") )
			)
		);
	}
	
	@Override
	public Map<String, Boolean> getState() {
		if ( CeWebConstants.TOP_MENU_ID.equals(getParentmenuId()) ) {
			state.put("opened", true);
		}
		return state;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
