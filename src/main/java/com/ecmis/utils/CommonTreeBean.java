package com.ecmis.utils;

import java.util.List;
import java.util.Map;

public class CommonTreeBean {

	private Integer id;
	private String text;
	private String state;
	private boolean checked;
	
	
	private Map<String,String> attributes;
	private List<CommonTreeBean> children;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<CommonTreeBean> getChildren() {
		return children;
	}
	public void setChildren(List<CommonTreeBean> children) {
		this.children = children;
	}
	public CommonTreeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommonTreeBean(Integer id, String text, String state,
			List<CommonTreeBean> children) {
		super();
		this.id = id;
		this.text = text;
		this.state = state;
		this.children = children;
	}
	public Map<String, String> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
	public CommonTreeBean(Integer id, String text, String state,
			boolean checked, Map<String, String> attributes,
			List<CommonTreeBean> children) {
		super();
		this.id = id;
		this.text = text;
		this.state = state;
		this.checked = checked;
		this.attributes = attributes;
		this.children = children;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
}
