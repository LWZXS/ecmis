package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class DocumentType implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
文档类型编号	docTypeId	int(10)	10		TRUE	FALSE	TRUE
文档类型名称	docTypeName	varchar(100)	100		FALSE	FALSE	TRUE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	private Integer docTypeId;
	private String docTypeName;
	
	private String docName;
	
	private Integer creationUser;
	private Integer modifuUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	
	private Integer parentTypeId;
	public List<DocumentType> children;
	
	public Integer levelId;

	private String statusName;
	private String parentDocTypeName;//上级名

	public String getParentDocTypeName() {
		return parentDocTypeName;
	}

	public void setParentDocTypeName(String parentDocTypeName) {
		this.parentDocTypeName = parentDocTypeName;
	}

	public Integer getLevelId() {
		return levelId;
	}
	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}
	public DocumentType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DocumentType(Integer docTypeId, String docTypeName,
			Integer creationUser, Integer modifuUser, Integer status,
			Date creationDate, Date modifyDate) {
		super();
		this.docTypeId = docTypeId;
		this.docTypeName = docTypeName;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
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

	public Integer getDocTypeId() {
		return docTypeId;
	}
	public void setDocTypeId(Integer docTypeId) {
		this.docTypeId = docTypeId;
	}
	public String getDocTypeName() {
		return docTypeName;
	}
	public void setDocTypeName(String docTypeName) {
		this.docTypeName = docTypeName;
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
	public List<DocumentType> getChildren() {
		return children;
	}
	public void setChildren(List<DocumentType> children) {
		this.children = children;
	}
	public Integer getParentTypeId() {
		return parentTypeId;
	}
	public void setParentTypeId(Integer parentTypeId) {
		this.parentTypeId = parentTypeId;
	}
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	
}
