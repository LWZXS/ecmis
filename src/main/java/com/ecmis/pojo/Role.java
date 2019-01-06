package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import com.alibaba.fastjson.annotation.JSONField;

public class Role implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1795101245549192070L;
	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
roleId	roleId	int(10)	10		TRUE	FALSE	TRUE
roleName	roleName	varchar(50)	50		FALSE	FALSE	TRUE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer roleId;
	private String roleName;
	private Integer creationUser;
	private Integer modifuUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;

	private String creationUserName;
	private String statusName;

	private Integer sortNumber;

	public Integer getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public String getCreationUserName() {
		return creationUserName;
	}

	public void setCreationUserName(String creationUserName) {
		this.creationUserName = creationUserName;
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

	public Role(Integer roleId) {
		super();
		this.roleId = roleId;
	}
	public Role() {
		super();
	}
	public Role(Integer roleId, String roleName, Integer creationUser,
			Integer modifuUser, Integer status, Date creationDate,
			Date modifyDate) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
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

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Role role = (Role) o;
		return Objects.equals(roleId, role.roleId);
	}

	@Override
	public int hashCode() {

		return Objects.hash(roleId);
	}
}
