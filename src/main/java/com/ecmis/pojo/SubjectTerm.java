package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class SubjectTerm implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
主题编号	subjectTermId	int(10)	10		TRUE	FALSE	TRUE
主题名称	subjectTermName	varchar(100)	100		FALSE	FALSE	FALSE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer subjectTermId;
	private String subjectTermName;
	
	private Integer creationUser;
	private Integer modifuUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	public SubjectTerm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SubjectTerm(Integer subjectTermId, String subjectTermName,
			Integer creationUser, Integer modifuUser, Integer status,
			Date creationDate, Date modifyDate) {
		super();
		this.subjectTermId = subjectTermId;
		this.subjectTermName = subjectTermName;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getSubjectTermId() {
		return subjectTermId;
	}
	public void setSubjectTermId(Integer subjectTermId) {
		this.subjectTermId = subjectTermId;
	}
	public String getSubjectTermName() {
		return subjectTermName;
	}
	public void setSubjectTermName(String subjectTermName) {
		this.subjectTermName = subjectTermName;
	}
	public Integer getCreationUser() {
		return creationUser;
	}
	public void setCreationUser(Integer creationUser) {
		this.creationUser = creationUser;
	}
	public Integer getModifuUser() {
		return modifuUser;
	}
	public void setModifuUser(Integer modifuUser) {
		this.modifuUser = modifuUser;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	
}
