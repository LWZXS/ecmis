package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.role.RoleMapper;
import com.ecmis.pojo.Role;
import com.ecmis.pojo.User;
import com.ecmis.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleMapper roleMapper;

	@Override
	public int add(Role role) {
		return roleMapper.add(role);
	}

	@Override
	public int delete(Integer roleId) {
		return roleMapper.delete(roleId);
	}

	@Override
	public int update(Role role) {
		return roleMapper.update(role);
	}

	@Override
	public Role findById(Integer roleId) {
		return roleMapper.getById(roleId);
	}

	@Override
	public List<Role> findAll() {
		return roleMapper.getAll();
	}

	@Override
	public List<Role> findByUser(Integer userId) {
		return roleMapper.getByUser(userId);
	}
	
	

}
