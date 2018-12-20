package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5647328763838982623L;
	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
userId	userId	int(10)	10		TRUE	FALSE	TRUE
userName	userName	varchar(50)	50		FALSE	FALSE	TRUE
loginName	loginName	varchar(16)	16		FALSE	FALSE	TRUE
password	password	varchar(16)	16		FALSE	FALSE	TRUE
phoneNum	phoneNum	varchar(11)	11		FALSE	FALSE	FALSE
email	email	varchar(50)	50		FALSE	FALSE	TRUE
icon	icon	varchar(200)	200		FALSE	FALSE	FALSE
address	address	varchar(200)	200		FALSE	FALSE	FALSE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
bronDate	bronDate	datetime			FALSE	FALSE	TRUE
	 */
	private Integer userId;
	private String userName;
	private String loginName;
	@JSONField(serialize=false)
	private String password;
	private String phoneNum;
	private String officeTel;
	private String email;
	private String icon;
	private String address;
	private Integer deptId;
	private Integer companyId;

	private String companyName;
	private String deptName;
	private String roleName;

	private Integer creationUser;
	private Integer modifuUser;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date modifyDate;
	@JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Date bronDate;
	private Integer status;
	private String statusName;
	private List<Role> roles;
	private List<Project> projects;
	
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public User(Integer userId, String userName, String loginName,
				String password, String phoneNum, String email, String icon,
				String address, Integer creationUser, Integer modifuUser,
				Integer status, Date creationDate, Date modifyDate, Date bronDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.loginName = loginName;
		this.password = password;
		this.phoneNum = phoneNum;
		this.email = email;
		this.icon = icon;
		this.address = address;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
		this.bronDate = bronDate;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getOfficeTel() {
		return officeTel;
	}
	public void setOfficeTel(String officeTel) {
		this.officeTel = officeTel;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Date getBronDate() {
		return bronDate;
	}
	public void setBronDate(Date bronDate) {
		this.bronDate = bronDate;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
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
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof User){
			User user=(User) obj;
			return user.userId.equals(this.userId);
		}
		return false;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", loginName=" + loginName + ", password=" + password
				+ ", phoneNum=" + phoneNum + ", officeTel=" + officeTel
				+ ", email=" + email + ", icon=" + icon + ", address="
				+ address + ", companyId=" + companyId + ", creationUser="
				+ creationUser + ", modifuUser=" + modifuUser
				+ ", creationDate=" + creationDate + ", modifyDate="
				+ modifyDate + ", bronDate=" + bronDate + ", status=" + status
				+ ", statusName=" + statusName + ", roles=" + roles
				+ ", projects=" + projects + "]";
	}
	
	
	
}
