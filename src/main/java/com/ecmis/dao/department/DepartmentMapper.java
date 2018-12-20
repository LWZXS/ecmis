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

	public List<Department> getByCompanyId(@Param("companyId")Integer companyId);
	public int count(@Param("deptName")String deptName, @Param("status")Integer status);

	/**
	 * 增加时获得排序号填入表单
	 * @param parentId
	 * @return
	 */
	public int getSortNumberByParentId(Integer parentId);

	/**
	 * 获得子部门数量
	 * @param parentId
	 * @return
	 */
	int getCountByParentId(Integer parentId);

	/**
	 * 更新状态
	 * @param userId
	 * @param deptId
	 * @return
	 */
	int updateStatus(@Param("userId")Integer userId,@Param("deptId")Integer deptId,@Param("status")Integer status);
}
