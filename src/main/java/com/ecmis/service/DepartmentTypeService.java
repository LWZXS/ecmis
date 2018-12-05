package com.ecmis.service;

import com.ecmis.pojo.DepartmentType;
import com.ecmis.utils.PageSupport;

import java.util.List;

public interface DepartmentTypeService {


    public int add(DepartmentType departmentType);

    public int delete(Integer deptTypeId);

    public int update(DepartmentType departmentType);

    public DepartmentType findById(Integer deptTypeId);

    public PageSupport<DepartmentType> findByDeptTypeByNameAndStatusAsPage(String deptTypeName,
                                                                           Integer status,
                                                                           Integer pageIndex,
                                                                           Integer pageSize);

    public List<DepartmentType> findAll();

}
