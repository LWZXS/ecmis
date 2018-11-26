package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Image implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
图像id	imageId	int(10)	10		TRUE	FALSE	TRUE
图片类型编号	imageTypeId	int(10)	10		FALSE	TRUE	FALSE
图像Code	imageCode	varchar(100)	100		FALSE	FALSE	FALSE
说明	description	varchar(1000)	1000		FALSE	FALSE	FALSE
拍照单位	photoCompanyId	varchar(50)	50		FALSE	FALSE	FALSE
拍照部门	photoDept	varchar(30)	30		FALSE	FALSE	FALSE
拍照人	photoAuthor	varchar(20)	20		FALSE	FALSE	FALSE
备注	remark	varchar(1000)	1000		FALSE	FALSE	FALSE
图片路径	url	varchar(100)	100		FALSE	FALSE	TRUE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	
	private Integer imageId;
	private Integer imageTypeId;
	private String imageCode;
	private String description;
	private Integer photoCompanyId;
	private String photoDept;
	private String photoAuthor;
	private String remark;
	private String url;
	
	private Integer creationUser;
	private Integer modifuUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	public Image() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Image(Integer imageId, Integer imageTypeId, String imageCode,
			String description, Integer photoCompanyId, String photoDept,
			String photoAuthor, String remark, String url,
			Integer creationUser, Integer modifuUser, Integer status,
			Date creationDate, Date modifyDate) {
		super();
		this.imageId = imageId;
		this.imageTypeId = imageTypeId;
		this.imageCode = imageCode;
		this.description = description;
		this.photoCompanyId = photoCompanyId;
		this.photoDept = photoDept;
		this.photoAuthor = photoAuthor;
		this.remark = remark;
		this.url = url;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getImageId() {
		return imageId;
	}
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	public Integer getImageTypeId() {
		return imageTypeId;
	}
	public void setImageTypeId(Integer imageTypeId) {
		this.imageTypeId = imageTypeId;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getPhotoCompanyId() {
		return photoCompanyId;
	}
	public void setPhotoCompanyId(Integer photoCompanyId) {
		this.photoCompanyId = photoCompanyId;
	}
	public String getPhotoDept() {
		return photoDept;
	}
	public void setPhotoDept(String photoDept) {
		this.photoDept = photoDept;
	}
	public String getPhotoAuthor() {
		return photoAuthor;
	}
	public void setPhotoAuthor(String photoAuthor) {
		this.photoAuthor = photoAuthor;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
