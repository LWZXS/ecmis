package com.ecmis.dao.department;

import com.ecmis.pojo.Company;
import com.ecmis.pojo.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {


	public int add(Department department);

	public int delete(@Param("deptId") Integer deptId);

	public int update(Department department);

	public Department getById(@Param("deptId") Integer deptId);

	public List<Department> getByDeptNameAndStatusAsPage(@Param("deptName")String deptName,
														 @Param("status")Integer status,
														 @Param("startRow")Integer startRow,
														 @Param("page")Integer page);
	public List<Department> getAll();

	public int count(@Param("deptName")String deptName, @Param("status")Integer status);
}
