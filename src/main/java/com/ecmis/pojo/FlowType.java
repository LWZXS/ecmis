package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class FlowType {
    /*
     flowTypeId INT(10) AUTO_INCREMENT PRIMARY KEY,
    flowTypeName VARCHAR(500) NOT NULL,
    STATUS INT(1) DEFAULT 1 NOT NULL,
    creationUser INT(10) NOT NULL,
    creationDate DATE,
    modifyUser INT(10) NOT NULL,
    modifyDate DATE
     */
    private Integer flowTypeId;
    private String flowTypeName;
    private Integer status;
    private Integer creationUser;
    @JSONField(format = "yyyy-MM-dd")
    private Date creationDate;
    private Integer modifyUser;
    @JSONField(format = "yyyy-MM-dd")
    private Date modifyDate;

    public Integer getFlowTypeId() {
        return flowTypeId;
    }

    public void setFlowTypeId(Integer flowTypeId) {
        this.flowTypeId = flowTypeId;
    }

    public String getFlowTypeName() {
        return flowTypeName;
    }

    public void setFlowTypeName(String flowTypeName) {
        this.flowTypeName = flowTypeName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
        return "FlowType{" +
                "flowTypeId=" + flowTypeId +
                ", flowTypeName='" + flowTypeName + '\'' +
                ", status=" + status +
                ", creationUser=" + creationUser +
                ", creationDate=" + creationDate +
                ", modifyUser=" + modifyUser +
                ", modifyDate=" + modifyDate +
                '}';
    }
}
