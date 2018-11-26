package com.ecmis.utils;

public class CommonComboboxBean {

	private Object id;
	private String text;
	private Boolean selected;
	public Object getId() {
		return id;
	}
	public void setId(Object id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Boolean getSelected() {
		return selected;
	}
	public void setSelected(Boolean selected) {
		this.selected = selected;
	}
	public CommonComboboxBean() {
		super();
	}
	public CommonComboboxBean(Object id, String text, Boolean selected) {
		super();
		this.id = id;
		this.text = text;
		this.selected = selected;
	}
	public CommonComboboxBean(Object id, String text) {
		super();
		this.id = id;
		this.text = text;
	}
	
}
