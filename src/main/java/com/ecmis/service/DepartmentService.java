package com.ecmis.service;

import com.ecmis.pojo.Department;
import com.ecmis.pojo.User;
import com.ecmis.utils.PageSupport;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentService {

    public int add(Department department);

    public int delete(Integer userId,Integer deptId);
    public int updateStatus(Integer userId,Integer deptId,Integer status);

    public int update(Department department);

    public Department findById( Integer deptId);

    public PageSupport<Department> findByDeptNameAndStatusAsPage(String deptName,Integer status,Integer pageIndex,Integer pageSize);

    public List<Department> findAll();
    List<Department> findByCompanyId(Integer companyId);
    int findSortNumberByParentId(Integer parentId);
}
