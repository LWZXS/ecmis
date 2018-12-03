package com.ecmis.service.impl;

import com.ecmis.dao.department.DepartmentMapper;
import com.ecmis.pojo.Department;
import com.ecmis.service.DepartmentService;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentMapper departmentMapper;
    @Override
    public int add(Department department) {
        return departmentMapper.add(department);
    }

    @Override
    public int delete(Integer deptId) {
        return departmentMapper.delete(deptId);
    }

    @Override
    public int update(Department department) {
        return departmentMapper.update(department);
    }

    @Override
    public Department findById(Integer deptId) {
        return departmentMapper.getById(deptId);
    }

    @Override
    public PageSupport<Department> findByDeptNameAndStatusAsPage(String deptName, Integer status, Integer pageIndex, Integer pageSize) {
        PageSupport<Department> pageSupport=new PageSupport<Department>();

        int totalCount = departmentMapper.count(deptName, status);

        pageSupport.setTotalCount(totalCount);
        pageSupport.setPageSize(pageSize);
        pageSupport.setCurrentPageNo(pageIndex);

        if (totalCount>0){
            List<Department> list = departmentMapper.getByDeptNameAndStatusAsPage(deptName, status, pageSupport.getStartRow(), pageSize);
            pageSupport.setList(list);
        }

        return pageSupport;
    }

    @Override
    public List<Department> findAll() {
        return departmentMapper.getAll();
    }
}
