package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

public class CompletionFiling implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
案卷号	filingId	int(10)	10		TRUE	FALSE	TRUE
目录编号	directoryId	int(10)	10		FALSE	TRUE	FALSE
分类编号	typeId	int(10)	10		FALSE	TRUE	FALSE
案卷名	filingName	varchar(100)	100		FALSE	FALSE	TRUE
有效期	indate	int(4)	4		FALSE	FALSE	FALSE
保密级别	secrecyLevel	int(2)	2		FALSE	FALSE	TRUE
互见号	anotherNum	varchar(100)	100		FALSE	FALSE	FALSE
份数	copiesNum	int(3)	3		FALSE	FALSE	FALSE
起始日期	startDate	datetime			FALSE	FALSE	FALSE
结束日期	endDate	datetime			FALSE	FALSE	FALSE
备注	remark	varchar(1000)	1000		FALSE	FALSE	FALSE
立卷单位	filingCompany	int(10)	10		FALSE	FALSE	FALSE
移交单位	turnCompany	int(10)	10		FALSE	FALSE	FALSE
立卷人	filingUser	int(10)	10		FALSE	FALSE	FALSE
检查人	checkUser	int(10)	10		FALSE	FALSE	FALSE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer filingId;
	private String filingName;
	private Integer directoryId;
	private Integer typeId;
	private Integer indate;
	private Integer secrecyLevel;
	private String anotherNum;
	private Integer copiesNum;
	@JSONField(format="yyyy-MM-dd")
	private Date startDate;
	@JSONField(format="yyyy-MM-dd")
	private Date endDate;
	private String remark;
	
	private Integer filingCompany;
	private Integer turnCompany;
	private Integer checkUser;
	
	private Integer creationUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	@JSONField(format="yyyy-MM-dd")
	private Date bronDate;
	private Integer modifyUser;

	public Integer getFilingId() {
		return filingId;
	}

	public void setFilingId(Integer filingId) {
		this.filingId = filingId;
	}

	public String getFilingName() {
		return filingName;
	}

	public void setFilingName(String filingName) {
		this.filingName = filingName;
	}

	public Integer getDirectoryId() {
		return directoryId;
	}

	public void setDirectoryId(Integer directoryId) {
		this.directoryId = directoryId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getIndate() {
		return indate;
	}

	public void setIndate(Integer indate) {
		this.indate = indate;
	}

	public Integer getSecrecyLevel() {
		return secrecyLevel;
	}

	public void setSecrecyLevel(Integer secrecyLevel) {
		this.secrecyLevel = secrecyLevel;
	}

	public String getAnotherNum() {
		return anotherNum;
	}

	public void setAnotherNum(String anotherNum) {
		this.anotherNum = anotherNum;
	}

	public Integer getCopiesNum() {
		return copiesNum;
	}

	public void setCopiesNum(Integer copiesNum) {
		this.copiesNum = copiesNum;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getFilingCompany() {
		return filingCompany;
	}

	public void setFilingCompany(Integer filingCompany) {
		this.filingCompany = filingCompany;
	}

	public Integer getTurnCompany() {
		return turnCompany;
	}

	public void setTurnCompany(Integer turnCompany) {
		this.turnCompany = turnCompany;
	}

	public Integer getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(Integer checkUser) {
		this.checkUser = checkUser;
	}

	public Integer getCreationUser() {
		return creationUser;
	}

	public void setCreationUser(Integer creationUser) {
		this.creationUser = creationUser;
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

	public Integer getModifyUser() {
		return modifyUser;
	}

	public void setModifyUser(Integer modifyUser) {
		this.modifyUser = modifyUser;
	}
}
