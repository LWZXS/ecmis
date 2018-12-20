package com.ecmis.service.impl;

import com.ecmis.dao.department.DepartmentMapper;
import com.ecmis.exception.DeleteEntityException;
import com.ecmis.pojo.Department;
import com.ecmis.service.DepartmentService;
import com.ecmis.service.UserService;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentMapper departmentMapper;
    @Resource
    private UserService userService;
    @Override
    public int add(Department department) {
        return departmentMapper.add(department);
    }

    @Override
    public int delete(Integer userId,Integer deptId) {
        //判断有没有子部门
        if (departmentMapper.getCountByParentId(deptId)>0){
            throw new DeleteEntityException("删除失败,该部门包含子部门,请先删除子部门.");
        }
        //判断部门中是否有人员
        if (userService.findUserCountByDeptId(deptId)>0){
            throw new DeleteEntityException("删除失败,该部门包含员工,请先删除员工.");
        }
        //修该为删除状态
        return departmentMapper.updateStatus(userId,deptId,3);
    }

    @Override
    public int update(Department department) {
        return departmentMapper.update(department);
    }

    @Override
    public int updateStatus(Integer userId, Integer deptId, Integer status) {
        return departmentMapper.updateStatus(userId,deptId,status);
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

    @Override
    public int findSortNumberByParentId(Integer parentId) {
        return departmentMapper.getSortNumberByParentId(parentId);
    }

    @Override
    public List<Department> findByCompanyId(Integer companyId) {
        return departmentMapper.getByCompanyId(companyId);
    }
}
