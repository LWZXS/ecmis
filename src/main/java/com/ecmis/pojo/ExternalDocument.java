package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class ExternalDocument {

    /*documentId INT(10) AUTO_INCREMENT PRIMARY KEY,
    documentName VARCHAR(500) NOT NULL,
    docTypeId INT(10) NOT NULL,
    projectId INT(10) NOT NULL,
    attachment VARCHAR(500) ,
    mainBody VARCHAR(500) ,
    auditId INT(10) NOT NULL,
    creationUser INT(10) NOT NULL,
    creationDate DATE,
    modifyUser INT(10) NOT NULL,
    modifyDate DATE*/
    /**
     * 外部文档编号
     */
    private Integer documentId;
    /**
     * 外部文档名称
     */
    private String documentName;
    /**
     * 正文类型
     */
    private Integer docTypeId;
    /**
     * 所属项目
     */
    private Integer projectId;
    /**
     * 附件
     */
    private String attachment;
    /**
     * 正文
     */
    private String mainBody;
    /**
     * 审核表主键,审核操作后改一个人,也有可能是角色
     */
    private Integer auditId;//审核
    /**
     * 流程类型
     */
    private Integer flowTypeId;//流程类型
    /**
     * 创建人
     */
    private Integer creationUser;
    @JSONField(format = "yyyy-MM-dd")
    private Date creationDate;
    private Integer modifyUser;
    @JSONField(format = "yyyy-MM-dd")
    private Date modifyDate;

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

    public Integer getDocTypeId() {
        return docTypeId;
    }

    public void setDocTypeId(Integer docTypeId) {
        this.docTypeId = docTypeId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getMainBody() {
        return mainBody;
    }

    public void setMainBody(String mainBody) {
        this.mainBody = mainBody;
    }

    public Integer getAuditId() {
        return auditId;
    }

    public void setAuditId(Integer auditId) {
        this.auditId = auditId;
    }

    public Integer getFlowTypeId() {
        return flowTypeId;
    }

    public void setFlowTypeId(Integer flowTypeId) {
        this.flowTypeId = flowTypeId;
    }

    public Integer getCreationUser() {
        return creationUser;
    }

    public void setCreationUser(Integer creationUser) {
        this.creationUser = creationUser;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Integer getModifyUser() {
        return modifyUser;
    }

    public void setModifyUser(Integer modifyUser) {
        this.modifyUser = modifyUser;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public String toString() {
        return "ExternalDocument{" +
                "documentId=" + documentId +
                ", documentName='" + documentName + '\'' +
                ", docTypeId=" + docTypeId +
                ", projectId=" + projectId +
                ", attachment='" + attachment + '\'' +
                ", mainBody='" + mainBody + '\'' +
                ", auditId=" + auditId +
                ", flowTypeId=" + flowTypeId +
                ", creationUser=" + creationUser +
                ", creationDate=" + creationDate +
                ", modifyUser=" + modifyUser +
                ", modifyDate=" + modifyDate +
                '}';
    }
}
