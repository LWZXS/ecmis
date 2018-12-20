package com.ecmis.dao.departmenttype;

import com.ecmis.pojo.DepartmentType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentTypeMapper {


	public int add(DepartmentType departmentType);

	public int delete(@Param("deptTypeId") Integer deptTypeId);

	public int update(DepartmentType departmentType);

	public DepartmentType getById(@Param("deptTypeId") Integer deptTypeId);

	public List<DepartmentType> getByDeptTypeByNameAndStatusAsPage(@Param("deptTypeName") String deptTypeName,
                                                         @Param("status") Integer status,
                                                         @Param("startRow") Integer startRow,
                                                         @Param("page") Integer page);
	public List<DepartmentType> getAll();

	public int count(@Param("deptTypeName") String deptTypeName, @Param("status") Integer status);


}
