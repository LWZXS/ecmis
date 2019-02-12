package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class ExternalDocumentAudit {
    /*
       auditId INT(10) AUTO_INCREMENT PRIMARY KEY,
   auditor INT(10) NOT NULL,
   auditType VARCHAR(20) NOT NULL,
   auditCompany INT(10) NOT NULL,
   documentId INT(10) NOT NULL,
   STATUS INT(10) NOT NULL
     */
    private Integer auditId;
    private Integer auditor;
    private String auditType;
    private Integer auditCompany;
    private Integer documentId;
    private Integer status;
    private Integer creationUser;
    @JSONField(format = "yyyy-MM-dd")
    private Date creationDate;
    private Integer modifyUser;
    @JSONField(format = "yyyy-MM-dd")
    private Date modifyDate;

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

    public Integer getAuditId() {
        return auditId;
    }

    public void setAuditId(Integer auditId) {
        this.auditId = auditId;
    }

    public Integer getAuditor() {
        return auditor;
    }

    public void setAuditor(Integer auditor) {
        this.auditor = auditor;
    }

    public String getAuditType() {
        return auditType;
    }

    public void setAuditType(String auditType) {
        this.auditType = auditType;
    }

    public Integer getAuditCompany() {
        return auditCompany;
    }

    public void setAuditCompany(Integer auditCompany) {
        this.auditCompany = auditCompany;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ExternalDocumentAudit{" +
                "auditId=" + auditId +
                ", auditor=" + auditor +
                ", auditType=" + auditType +
                ", auditCompany=" + auditCompany +
                ", documentId=" + documentId +
                ", status=" + status +
                '}';
    }
}
