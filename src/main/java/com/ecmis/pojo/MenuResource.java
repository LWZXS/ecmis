package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class MenuResource implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2743405770750509901L;
	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
menuId	menuId	int(10)	10		TRUE	FALSE	TRUE
parentMenu	parentMenu	int(10)	10		FALSE	TRUE	FALSE
menuName	menuName	varchar(50)	50		FALSE	FALSE	TRUE
url	url	varchar(200)	200		FALSE	FALSE	FALSE
icon	icon	varchar(200)	200		FALSE	FALSE	FALSE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer menuId;
	private String menuName;
	private Integer parentMenuId;
	private String url;
	private String icon;
	private String type;
	private Integer creationUser;
	private Integer modifyUser;
	private Integer status;
	private Integer levelId;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	
	public List<MenuResource> children;
	public MenuResource() {
		super();
	}

	public Integer getLevelId() {
		return levelId;
	}

	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}

	public MenuResource(Integer menuId, String menuName, Integer parentMenuId,
						String url, String icon, Integer creationUser, Integer modifyUser,
						Integer status, Date creationDate, Date modifyDate) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.parentMenuId = parentMenuId;
		this.url = url;
		this.icon = icon;
		this.creationUser = creationUser;
		this.modifyUser = modifyUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public Integer getParentMenuId() {
		return parentMenuId;
	}
	public void setParentMenuId(Integer parentMenuId) {
		this.parentMenuId = parentMenuId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
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
	public void setModifyUser(Integer modifyUser) {
		this.modifyUser = modifyUser;
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
	public List<MenuResource> getChildren() {
		return children;
	}
	public void setChildren(List<MenuResource> children) {
		this.children = children;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		MenuResource that = (MenuResource) o;
		return Objects.equals(menuId, that.menuId);
	}

	@Override
	public int hashCode() {

		return Objects.hash(menuId);
	}
}
