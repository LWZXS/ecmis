package com.ecmis.service;

import java.util.List;

import com.ecmis.pojo.Role;

public interface RoleService {

	public int add(Role role);
	
	public int delete(Integer roleId);
	
	public int update(Role role);
	
	public Role findById(Integer roleId);
	
	public List<Role> findAll();
	
	public List<Role> findByUser(Integer userId);
}
