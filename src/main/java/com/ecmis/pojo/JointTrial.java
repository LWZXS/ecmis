package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;

public class JointTrial implements Serializable{

	private Integer documentId;
	private Integer userId;
	private Integer status;
	public Integer getDocumentId() {
		return documentId;
	}
	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
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
	public JointTrial() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JointTrial(Integer documentId, Integer userId, Integer status) {
		super();
		this.documentId = documentId;
		this.userId = userId;
		this.status = status;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof JointTrial){
			JointTrial jt=(JointTrial) obj;
			if(jt.documentId.equals(this.documentId) && jt.userId.equals(this.userId)){
				return true;
			}
		}
		return false;
	}
	
	
	
	
}
