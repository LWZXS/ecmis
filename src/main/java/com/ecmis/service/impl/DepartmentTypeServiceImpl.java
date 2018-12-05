package com.ecmis.service.impl;

import com.ecmis.dao.department.DepartmentMapper;
import com.ecmis.dao.departmenttype.DepartmentTypeMapper;
import com.ecmis.pojo.DepartmentType;
import com.ecmis.service.DepartmentTypeService;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("departmentTypeService")
public class DepartmentTypeServiceImpl implements DepartmentTypeService {

    @Resource
    private DepartmentTypeMapper departmentTypeMapper;
    @Override
    public int add(DepartmentType departmentType) {
        return departmentTypeMapper.add(departmentType);
    }

    @Override
    public int delete(Integer deptTypeId) {
        return departmentTypeMapper.delete(deptTypeId);
    }

    @Override
    public int update(DepartmentType departmentType) {
        return departmentTypeMapper.update(departmentType);
    }

    @Override
    public DepartmentType findById(Integer deptTypeId) {
        return departmentTypeMapper.getById(deptTypeId);
    }

    @Override
    public PageSupport<DepartmentType> findByDeptTypeByNameAndStatusAsPage(String deptTypeName, Integer status, Integer pageIndex, Integer pageSize) {

        int totalCount = departmentTypeMapper.count(deptTypeName, status);
        PageSupport<DepartmentType> pageSupport=new PageSupport<DepartmentType>();
        pageSupport.setTotalCount(totalCount);
        pageSupport.setPageSize(pageSize);
        pageSupport.setCurrentPageNo(pageIndex);
        if (totalCount>0){
            List<DepartmentType> list = departmentTypeMapper.getByDeptTypeByNameAndStatusAsPage(deptTypeName, status, pageSupport.getStartRow(), pageSize);
            pageSupport.setList(list);
        }
        return pageSupport;
    }

    @Override
    public List<DepartmentType> findAll() {
        return departmentTypeMapper.getAll();
    }

}
