package com.ecmis.dao.role;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Role;


public interface RoleMapper {

	
	public int add(Role role);
	
	public int delete(@Param("roleId") Integer roleId);
	
	public int update(Role role);
	
	public Role getById(@Param("roleId") Integer roleId);
	
	public List<Role> getAll();
	
	public List<Role> getByUser(@Param("userId") Integer userId);

	List<Role> getPageByRoleNameAndStatus(@Param("roleName") String roleName,
										  @Param("status") Integer status,
										  @Param("startRow") Integer startRow ,
										  @Param("pageSize") Integer pageSize);

	int count(@Param("roleName")String roleName,@Param("status")Integer status);

	int getMaxSortNumber();

	int updateStatus(@Param("userId")Integer userId,@Param("roleId")Integer roleId,@Param("status")Integer status);
}
