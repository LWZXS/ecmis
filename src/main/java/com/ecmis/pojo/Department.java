package com.ecmis.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;
import java.util.List;

public class Department {
    private Integer deptId;
    private String deptName;

    private Integer parentId;
    private Integer deptTypeId;

    /**
     * 所属公司编号
     */
    private Integer companyId;
    private Integer createUser;
    @JSONField(format="yyyy-MM-dd")
    private Date creationDate;
    private Integer modifyUser;
    @JSONField(format="yyyy-MM-dd")
    private Date modifyDate;
    private Integer status;

    private Integer sortNumber;

    private String companyName;

    private String deptTypeName;
    private String parentDeptName;
    private String statusName;

    /**
     * 所属公司
     */
    private Company company;

    /**
     * 子部门集合
     */
    private List<Department> children;
    /**
     * 父级部门
     */
    private Department parentDept;

    /**
     * 组只机构类型
     */
    private String departmentTypeName;
    /**
     * 父级部门名称
     */
    private String parentName;
    private DepartmentType departmentType;



    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Department getParentDept() {
        return parentDept;
    }

    public void setParentDept(Department parentDept) {
        this.parentDept = parentDept;
    }

    public DepartmentType getDepartmentType() {
        return departmentType;
    }

    public void setDepartmentType(DepartmentType departmentType) {
        this.departmentType = departmentType;
    }

    public List<Department> getChildren() {
        return children;
    }

    public void setChildren(List<Department> children) {
        this.children = children;
    }

    public String getDepartmentTypeName() {
        return departmentTypeName;
    }

    public void setDepartmentTypeName(String departmentTypeName) {
        this.departmentTypeName = departmentTypeName;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public Department() {
    }
    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getDeptTypeId() {
        return deptTypeId;
    }

    public void setDeptTypeId(Integer deptTypeId) {
        this.deptTypeId = deptTypeId;
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
        setStatusName();
    }

    public Integer getSortNumber() {
        return sortNumber;
    }

    public void setSortNumber(Integer sortNumber) {
        this.sortNumber = sortNumber;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDeptTypeName() {
        return deptTypeName;
    }

    public void setDeptTypeName(String deptTypeName) {
        this.deptTypeName = deptTypeName;
    }

    public String getParentDeptName() {
        return parentDeptName;
    }

    public void setParentDeptName(String parentDeptName) {
        this.parentDeptName = parentDeptName;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName() {

        if (status==1){
            this.statusName ="正常";
        }else if (status==2){
            this.statusName ="锁定";
        }else if (status==3){
            this.statusName ="删除";
        }
    }

    @Override
    public String toString() {
        return "Department{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", parentId=" + parentId +
                ", deptTypeId=" + deptTypeId +
                ", createUser=" + createUser +
                ", creationDate=" + creationDate +
                ", modifyUser=" + modifyUser +
                ", modifyDate=" + modifyDate +
                ", status=" + status +
                ", departmentTypeName=" + departmentTypeName +
                '}';
    }
}
