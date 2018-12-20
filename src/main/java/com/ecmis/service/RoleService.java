package com.ecmis.service;

import java.util.List;

import com.ecmis.pojo.Role;
import com.ecmis.utils.PageSupport;

public interface RoleService {

	public int add(Role role);
	
	public int delete(Integer userId,Integer roleId);
	
	public int update(Role role);
	public int updateStatus(Integer userId,Integer roleId,Integer status);

	public Role findById(Integer roleId);
	
	public List<Role> findAll();
	
	public List<Role> findByUser(Integer userId);

	int findMaxSortNumber();

	int count(String roleName, Integer status);

	PageSupport<Role> findByDeptNameAndStatusAsPage(String roleName,Integer status,Integer pageIndex,Integer pageSize);
}
