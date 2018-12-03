package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class DepartmentType {
    private Integer deptTypeId;
    private String deptTypeName;

    private Integer createUser;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date creationDate;
    private Integer modifyUser;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date modifyDate;
    private Integer status;

    public DepartmentType() {
    }

    public Integer getDeptTypeId() {
        return deptTypeId;
    }

    public void setDeptTypeId(Integer deptTypeId) {
        this.deptTypeId = deptTypeId;
    }

    public String getDeptTypeName() {
        return deptTypeName;
    }

    public void setDeptTypeName(String deptTypeName) {
        this.deptTypeName = deptTypeName;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "DepartmentType{" +
                "deptTypeId=" + deptTypeId +
                ", deptTypeName='" + deptTypeName + '\'' +
                ", createUser=" + createUser +
                ", creationDate=" + creationDate +
                ", modifyUser=" + modifyUser +
                ", modifyDate=" + modifyDate +
                ", status=" + status +
                '}';
    }
}
