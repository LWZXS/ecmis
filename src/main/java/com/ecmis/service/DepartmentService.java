package com.ecmis.service;

import com.ecmis.pojo.Department;
import com.ecmis.pojo.User;
import com.ecmis.utils.PageSupport;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentService {

    public int add(Department department);

    public int delete(@Param("deptId") Integer deptId);

    public int update(Department department);

    public Department findById(@Param("deptId") Integer deptId);

    public PageSupport<Department> findByDeptNameAndStatusAsPage(String deptName,Integer status,Integer pageIndex,Integer pageSize);

    public List<Department> findAll();
}
