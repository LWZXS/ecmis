package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class ImageType implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
图片类型编号	imageTypeId	int(10)	10		TRUE	FALSE	TRUE
图片类型名称	imageTypeName	varchar(100)	100		FALSE	FALSE	TRUE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer imageTypeId;
	private String imageTypeName;
	
	private Integer creationUser;
	private Integer modifuUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	public ImageType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageType(Integer imageTypeId, String imageTypeName,
			Integer creationUser, Integer modifuUser, Integer status,
			Date creationDate, Date modifyDate) {
		super();
		this.imageTypeId = imageTypeId;
		this.imageTypeName = imageTypeName;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getImageTypeId() {
		return imageTypeId;
	}
	public void setImageTypeId(Integer imageTypeId) {
		this.imageTypeId = imageTypeId;
	}
	public String getImageTypeName() {
		return imageTypeName;
	}
	public void setImageTypeName(String imageTypeName) {
		this.imageTypeName = imageTypeName;
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
