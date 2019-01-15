package com.ecmis.pojo;

import java.util.Date;

public class CompanyType {
    private Integer companyTypeId;// INT(10) PRIMARY KEY AUTO_INCREMENT,
    private String companyTypeName; //VARCHAR(50) NOT NULL,
    private Integer creationUser;//` INT(10) NOT NULL,
    private Integer modifyUser;//` INT(10) DEFAULT NULL,
    private Date creationDate;//` DATETIME NOT NULL,
    private Date modifyDate;//` DATETIME DEFAULT NULL,
    private Integer status;//` INT(1) DEFAULT 1 NOT NULL

    public CompanyType() {
    }

    public CompanyType(Integer companyTypeId, String companyTypeName, Integer creationUser, Integer modifyUser, Date creationDate, Date modifyDate, Integer status) {
        this.companyTypeId = companyTypeId;
        this.companyTypeName = companyTypeName;
        this.creationUser = creationUser;
        this.modifyUser = modifyUser;
        this.creationDate = creationDate;
        this.modifyDate = modifyDate;
        this.status = status;
    }

    public Integer getCompanyTypeId() {
        return companyTypeId;
    }

    public void setCompanyTypeId(Integer companyTypeId) {
        this.companyTypeId = companyTypeId;
    }

    public String getCompanyTypeName() {
        return companyTypeName;
    }

    public void setCompanyTypeName(String companyTypeName) {
        this.companyTypeName = companyTypeName;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
