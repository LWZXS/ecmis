package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

/**
 * 待办记录
 */
public class AuditRecord implements Serializable{

	private Integer recordId;
	private Integer documentId;
	private Integer userId;
	private String phrases;
	private Integer docStatusId;
	
	@JSONField(format="yyyy/MM/dd HH:mm:ss")
	private Date creationDate;
	private String opration;
	private String oprationUser;
	private String description;
	
	
	public String getOprationUser() {
		return oprationUser;
	}
	public void setOprationUser(String oprationUser) {
		this.oprationUser = oprationUser;
	}
	public String getOpration() {
		return opration;
	}
	public void setOpration(String opration) {
		this.opration = opration;
	}
	public Integer getRecordId() {
		return recordId;
	}
	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}
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
	public String getPhrases() {
		return phrases;
	}
	public void setPhrases(String phrases) {
		this.phrases = phrases;
	}
	public Integer getDocStatusId() {
		return docStatusId;
	}
	public void setDocStatusId(Integer docStatusId) {
		this.docStatusId = docStatusId;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public AuditRecord() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuditRecord(Integer recordId, Integer documentId, Integer userId,
			String phrases, Integer docStatusId, Date creationDate) {
		super();
		this.recordId = recordId;
		this.documentId = documentId;
		this.userId = userId;
		this.phrases = phrases;
		this.docStatusId = docStatusId;
		this.creationDate = creationDate;
	}
	public AuditRecord(Integer documentId, Integer userId, String phrases,
			Integer docStatusId, Date creationDate) {
		super();
		this.documentId = documentId;
		this.userId = userId;
		this.phrases = phrases;
		this.docStatusId = docStatusId;
		this.creationDate = creationDate;
	}
	public AuditRecord(Integer documentId, Integer userId,
			String phrases, Integer docStatusId, Date creationDate,
			String opration,String oprationUser) {
		super();
		this.documentId = documentId;
		this.userId = userId;
		this.phrases = phrases;
		this.docStatusId = docStatusId;
		this.creationDate = creationDate;
		this.opration = opration;
		this.oprationUser=oprationUser;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public AuditRecord(Integer documentId, Integer userId, String phrases,
			Integer docStatusId, Date creationDate, String opration,
			String oprationUser, String description) {
		super();
		this.documentId = documentId;
		this.userId = userId;
		this.phrases = phrases;
		this.docStatusId = docStatusId;
		this.creationDate = creationDate;
		this.opration = opration;
		this.oprationUser = oprationUser;
		this.description = description;
	}
	
	
	
}
