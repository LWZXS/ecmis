package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Document implements Serializable{
	
	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
文档编号	internalDocId	int(10)	10		TRUE	FALSE	TRUE
文件编码	docCode	varchar(100)	100		FALSE	FALSE	FALSE
文档状态编号	docStatusId	int(10)	10		FALSE	TRUE	FALSE
文档类型编号	docTypeId	int(10)	10		FALSE	TRUE	FALSE
主题编号	subjectTermId	int(10)	10		FALSE	TRUE	FALSE
文件名称	documentName	varchar(100)	100		FALSE	FALSE	TRUE
跟踪	tailAfter	boolean			FALSE	FALSE	FALSE
重要程度	importanceDegree	int(1)	1		FALSE	FALSE	FALSE
原文编码	originalCode	varchar(100)	100		FALSE	FALSE	FALSE
备注	description	varchar(1000)	1000		FALSE	FALSE	FALSE
附件	attachment	varchar(100)	100		FALSE	FALSE	FALSE
工程编号	projectId	int(10)	10		FALSE	FALSE	FALSE
扫描件	scanningCopy	varchar(100)	100		FALSE	FALSE	FALSE
合同依据	contract	varchar(100)	100		FALSE	FALSE	FALSE
正文	mainBody	text			FALSE	FALSE	FALSE
文件属地	address	varchar(100)	100		FALSE	FALSE	FALSE
文件来源	docSource	varchar(100)	100		FALSE	FALSE	TRUE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	//会审jointTrials
	//分发范围publishRanges
	
	/**
	 * 文件编号
	 */
	private Integer documentId;
	/**
	 * 文件名称
	 */
	private String documentName;
	private String docCode;
	private Integer docStatusId;
	/**
	 * 文件类型
	 */
	private Integer docTypeId;
	private DocumentType docType;
	/**
	 * 主题词
	 */
	private String subjectTermName;
	/**
	 * 是否跟踪
	 */
	private boolean tailAfter;
	/**
	 * 重要程度
	 */
	private Integer importanceDegree;
	/**
	 * 原文编码
	 */
	private String originalCode;
	private String description;
	/**
	 * 附件  --正文？
	 */
	private String attachment;
	
	private Integer projectId;
	private String scanningCopy;
	private String contract;
	private String mainBody;
	/**
	 * 文件属地
	 */
	private String address;
	/**
	 * 文件来源
	 */
	private String docSource;
	
	private Integer creationUser;
	private Integer modifuUser;
	private Integer status;
	
	/**
	 * 创建日期
	 */
	@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	/**
	 * 审核人
	 */
	private Integer auditorId;//审核人
	private User auditor;
	
	/**
	 * 批准人
	 */
	private Integer approverId;//批准人
	private User approver;
	
	//关联
	private DocumentStatus documentStatus;
	private User creator;
	private SubjectTerm subjectTerm;
	private Company company;
	private DocumentType documentType;
	
	/**
	 * 分发范围
	 */
	private List<User> publishRange;
	/**
	 * 会审人
	 */
	private List<User> jointTrial;
	
	/**
	 * 审核记录
	 */
	public List<AuditRecord> auditRecords;
	public Document() {
		super();
	}
	public Document(Integer documentId, String documentName, String docCode,
			Integer docStatusId, Integer docTypeId, String subjectTermName,
			boolean tailAfter, Integer importanceDegree, String originalCode,
			String description, String attachment, Integer projectId,
			String scanningCopy, String contract, String mainBody,
			String address, String docSource, Integer creationUser,
			Integer modifuUser, Integer status, Date creationDate,
			Date modifyDate) {
		super();
		this.documentId = documentId;
		this.documentName = documentName;
		this.docCode = docCode;
		this.docStatusId = docStatusId;
		this.docTypeId = docTypeId;
		this.subjectTermName = subjectTermName;
		this.tailAfter = tailAfter;
		this.importanceDegree = importanceDegree;
		this.originalCode = originalCode;
		this.description = description;
		this.attachment = attachment;
		this.projectId = projectId;
		this.scanningCopy = scanningCopy;
		this.contract = contract;
		this.mainBody = mainBody;
		this.address = address;
		this.docSource = docSource;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getDocumentId() {
		return documentId;
	}
	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
	}
	public String getDocumentName() {
		return documentName;
	}
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}
	public String getDocCode() {
		return docCode;
	}
	public void setDocCode(String docCode) {
		this.docCode = docCode;
	}
	public Integer getDocStatusId() {
		return docStatusId;
	}
	public void setDocStatusId(Integer docStatusId) {
		this.docStatusId = docStatusId;
	}
	public Integer getDocTypeId() {
		return docTypeId;
	}
	public void setDocTypeId(Integer docTypeId) {
		this.docTypeId = docTypeId;
	}
	public String getSubjectTermName() {
		return subjectTermName;
	}
	public void setSubjectTermName(String subjectTermName) {
		this.subjectTermName = subjectTermName;
	}
	public boolean isTailAfter() {
		return tailAfter;
	}
	public void setTailAfter(boolean tailAfter) {
		this.tailAfter = tailAfter;
	}
	public Integer getImportanceDegree() {
		return importanceDegree;
	}
	public void setImportanceDegree(Integer importanceDegree) {
		this.importanceDegree = importanceDegree;
	}
	public String getOriginalCode() {
		return originalCode;
	}
	public void setOriginalCode(String originalCode) {
		this.originalCode = originalCode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public String getScanningCopy() {
		return scanningCopy;
	}
	public void setScanningCopy(String scanningCopy) {
		this.scanningCopy = scanningCopy;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public String getMainBody() {
		return mainBody;
	}
	public void setMainBody(String mainBody) {
		this.mainBody = mainBody;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDocSource() {
		return docSource;
	}
	public void setDocSource(String docSource) {
		this.docSource = docSource;
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
	public Integer getAuditorId() {
		return auditorId;
	}
	public void setAuditorId(Integer auditorId) {
		this.auditorId = auditorId;
	}
	public Integer getApproverId() {
		return approverId;
	}
	public void setApproverId(Integer approverId) {
		this.approverId = approverId;
	}
	@Override
	public String toString() {
		return "Document [documentId=" + documentId + ", documentName="
				+ documentName + ", docCode=" + docCode + ", docStatusId="
				+ docStatusId + ", docTypeId=" + docTypeId + ", subjectTermId="
				+ subjectTermName + ", tailAfter=" + tailAfter
				+ ", importanceDegree=" + importanceDegree + ", originalCode="
				+ originalCode + ", description=" + description
				+ ", attachment=" + attachment + ", projectId=" + projectId
				+ ", scanningCopy=" + scanningCopy + ", contract=" + contract
				+ ", mainBody=" + mainBody + ", address=" + address
				+ ", docSource=" + docSource + ", creationUser=" + creationUser
				+ ", modifuUser=" + modifuUser + ", status=" + status
				+ ", creationDate=" + creationDate + ", modifyDate="
				+ modifyDate + ", auditorId=" + auditorId + ", approverId="
				+ approverId + "]";
	}
	public DocumentStatus getDocumentStatus() {
		return documentStatus;
	}
	public void setDocumentStatus(DocumentStatus documentStatus) {
		this.documentStatus = documentStatus;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public SubjectTerm getSubjectTerm() {
		return subjectTerm;
	}
	public void setSubjectTerm(SubjectTerm subjectTerm) {
		this.subjectTerm = subjectTerm;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public DocumentType getDocumentType() {
		return documentType;
	}
	public void setDocumentType(DocumentType documentType) {
		this.documentType = documentType;
	}
	public DocumentType getDocType() {
		return docType;
	}
	public void setDocType(DocumentType docType) {
		this.docType = docType;
	}
	public User getAuditor() {
		return auditor;
	}
	public void setAuditor(User auditor) {
		this.auditor = auditor;
	}
	public User getApprover() {
		return approver;
	}
	public void setApprover(User approver) {
		this.approver = approver;
	}
	public List<User> getPublishRange() {
		return publishRange;
	}
	public void setPublishRange(List<User> publishRange) {
		this.publishRange = publishRange;
	}
	public List<User> getJointTrial() {
		return jointTrial;
	}
	public void setJointTrial(List<User> jointTrial) {
		this.jointTrial = jointTrial;
	}
	public List<AuditRecord> getAuditRecords() {
		return auditRecords;
	}
	public void setAuditRecords(List<AuditRecord> auditRecords) {
		this.auditRecords = auditRecords;
	}
	
	
	
}
