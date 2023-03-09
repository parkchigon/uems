package com.flk.system.code.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.reflect.MethodUtils;

import com.flk.common.domain.CeWebConstants;
import com.flk.common.domain.Tree;

public class CodeTree extends Code implements Tree {

	private static final long serialVersionUID = 1L;

	private final Map<String, Boolean> state = new HashMap<String, Boolean>();
	
	public CodeTree() {}
	
	public CodeTree(Code code) {
		setCodeId(StringUtils.defaultIfEmpty(code.getCodeId(), ""));
		setCodeName(StringUtils.defaultIfEmpty(code.getCodeName(), ""));
		setCodeContent(StringUtils.defaultIfEmpty(code.getCodeContent(), ""));
		setParentCodeId(StringUtils.defaultIfEmpty(code.getParentCodeId(), ""));
		setSortNum(StringUtils.defaultIfEmpty(code.getSortNum(), "0"));
		setUseYn(StringUtils.defaultIfEmpty(code.getUseYn(), "N"));
		setSystemCodeYn(StringUtils.defaultIfEmpty(code.getSystemCodeYn(), "N"));
	}
	
	public <T extends Map<String, ? extends Object>> CodeTree(T map) {
		
		for ( String key : map.keySet() ) {
			try {
				MethodUtils.invokeMethod(this, "set" + StringUtils.capitalize(key), ObjectUtils.defaultIfNull(map.get(key), "").toString());
			} catch (Exception e) {
			}
		}
		
		setSortNum(StringUtils.defaultIfEmpty(getSortNum(), "0"));
		setUseYn(StringUtils.defaultIfEmpty(getUseYn(), "N"));
		setSystemCodeYn(StringUtils.defaultIfEmpty(getSystemCodeYn(), "N"));
		
	}
	
	@Override
	public String getId() {
		return getCodeId();
	}
	
	@Override
	public void setId(String id) {
		setCodeId(id);
	}
	
	@Override
	public String getParent() {
		String parentcdId = getParentCodeId();
		return CeWebConstants.TOP_CODE_ID.equals(parentcdId) ? "#" : parentcdId;
	}
	
	@Override
	public void setParent(String parentId) {
		setParentCodeId(parentId);
	}
	
	@Override
	public String getText() {
		return getCodeName();
	}
	
	@Override
	public void setText(String text) {
		setCodeName(text);
	}
	
	@Override
	public Map<String, Boolean> getState() {
		if ( CeWebConstants.TOP_CODE_ID.equals(getParentCodeId()) ) {
			state.put("opened", true);
		}
		return state;
	}
	
	public void setCodeIds(String strCodeIds) {
		super.setCodeIds(
			new ArrayList<String>(
				Arrays.asList( StringUtils.split(strCodeIds, ",") )
			)
		);
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}
