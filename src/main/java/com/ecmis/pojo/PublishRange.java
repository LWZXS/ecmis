package com.ecmis.pojo;

public class PublishRange {

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
	public PublishRange() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PublishRange(Integer documentId, Integer userId, Integer status) {
		super();
		this.documentId = documentId;
		this.userId = userId;
		this.status = status;
	}
	public PublishRange(Integer documentId, Integer userId) {
		super();
		this.documentId = documentId;
		this.userId = userId;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof PublishRange){
			PublishRange pr=(PublishRange) obj;
			if(pr.documentId.equals(this.documentId) && pr.userId.equals(this.userId)){
				return true;
			}
		}
		return false;
	}
	
	
}
