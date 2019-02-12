package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Company implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
公司编号	companyId	int(10)	10		TRUE	FALSE	TRUE
公司名称	companyName	varchar(50)	50		FALSE	FALSE	TRUE
地址	address	varchar(100)	100		FALSE	FALSE	FALSE
电话	telphone	varchar(16)	16		FALSE	FALSE	FALSE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer companyId;
	private String companyName;
	private String address;
	private String telphone;
	
	private Integer creationUser;
	private Integer modifyUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	private Integer companyTypeId;
	private String companyTypeName;
	private String statusName;
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName() {
		if(status!=null){
			if(status.equals(1)){
				this.statusName ="正常";
			}else if(status.equals(2)){
				this.statusName = "锁定";
			}else if(status.equals(3)){
				this.statusName = "删除";
			}
		}
	}
	public Integer getCompanyTypeId() {
		return companyTypeId;
	}

	public void setCompanyTypeId(Integer companyTypeId) {
		this.companyTypeId = companyTypeId;
	}

	private List<User> users;

	public String getCompanyTypeName() {
		return companyTypeName;
	}

	public void setCompanyTypeName(String companyTypeName) {
		this.companyTypeName = companyTypeName;
	}

	public Company() {
		super();
	}
	public Company(Integer companyId, String companyName, String address,
			String telphone, Integer creationUser, Integer modifyUser,
			Integer status, Date creationDate, Date modifyDate) {
		super();
		this.companyId = companyId;
		this.companyName = companyName;
		this.address = address;
		this.telphone = telphone;
		this.creationUser = creationUser;
		this.modifyUser = modifyUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public Integer getCreationUser() {
		return creationUser;
	}
	public void setCreationUser(Integer creationUser) {
		this.creationUser = creationUser;
	}
	public Integer getModifyUser() {
		return modifyUser;
	}
	public void setModifyUser(Integer modifuUser) {
		this.modifyUser = modifyUser;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
		setStatusName();
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
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
}
