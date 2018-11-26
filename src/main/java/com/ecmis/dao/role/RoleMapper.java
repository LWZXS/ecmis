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
	
}
