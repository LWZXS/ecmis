package com.ecmis.pojo;

import java.io.Serializable;

public class Phrases implements Serializable{

	private Integer phrasesId;
	private String phrasesVal;
	private Integer userId;
	private Integer status;
	
	public Integer getPhrasesId() {
		return phrasesId;
	}
	public void setPhrasesId(Integer phrasesId) {
		this.phrasesId = phrasesId;
	}
	public String getPhrasesVal() {
		return phrasesVal;
	}
	public void setPhrasesVal(String phrasesVal) {
		this.phrasesVal = phrasesVal;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Phrases(Integer phrasesId, String phrasesVal, Integer userId,
			Integer status) {
		super();
		this.phrasesId = phrasesId;
		this.phrasesVal = phrasesVal;
		this.userId = userId;
		this.status = status;
	}
	public Phrases() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
