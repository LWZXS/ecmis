package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class CompletionDirectory implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
目录编号	directoryId	int(10)	10		TRUE	FALSE	TRUE
目录名称	directoryName	varchar(50)	50		FALSE	FALSE	TRUE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer directoryId;
	private String directoryName;
	
	private Integer creationUser;
	private Integer modifuUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	@JSONField(format="yyyy-MM-dd")
	private Date bronDate;
	public CompletionDirectory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CompletionDirectory(Integer directoryId, String directoryName,
			Integer creationUser, Integer modifuUser, Integer status,
			Date creationDate, Date modifyDate, Date bronDate) {
		super();
		this.directoryId = directoryId;
		this.directoryName = directoryName;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
		this.bronDate = bronDate;
	}
	public Integer getDirectoryId() {
		return directoryId;
	}
	public void setDirectoryId(Integer directoryId) {
		this.directoryId = directoryId;
	}
	public String getDirectoryName() {
		return directoryName;
	}
	public void setDirectoryName(String directoryName) {
		this.directoryName = directoryName;
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
	public Date getBronDate() {
		return bronDate;
	}
	public void setBronDate(Date bronDate) {
		this.bronDate = bronDate;
	}
	
	
}
