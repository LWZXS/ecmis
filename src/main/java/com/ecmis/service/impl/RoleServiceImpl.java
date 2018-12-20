package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.ecmis.service.UserService;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import com.ecmis.dao.role.RoleMapper;
import com.ecmis.pojo.Role;
import com.ecmis.pojo.User;
import com.ecmis.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Resource
	private UserService userService;

	@Resource
	private RoleMapper roleMapper;

	@Override
	public int add(Role role) {
		return roleMapper.add(role);
	}


	@Override
	public int delete(Integer userId,Integer roleId) {

		//判断该角色是否有人
		int userCountByRoleId = userService.findUserCountByRoleId(roleId);
		if (userCountByRoleId>0){
			throw new RuntimeException("该角色已分配给用户,不能删除!");
		}
		return roleMapper.updateStatus(userId,roleId,3);
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

	@Override
	public PageSupport<Role> findByDeptNameAndStatusAsPage(String roleName, Integer status, Integer pageIndex, Integer pageSize) {
		PageSupport<Role> pageSupport=new PageSupport<Role>();

		int totalCount = roleMapper.count(roleName, status);
		pageSupport.setTotalCount(totalCount);;
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);

		if (totalCount>0){
			List<Role> roles = roleMapper.getPageByRoleNameAndStatus(roleName, status, pageSupport.getStartRow(), pageSize);
			pageSupport.setList(roles);
		}
		return pageSupport;
	}

	@Override
	public int findMaxSortNumber() {
		return roleMapper.getMaxSortNumber();
	}

	@Override
	public int count(String roleName, Integer status) {
		return roleMapper.count(roleName,status);
	}


	@Override
	public int updateStatus(Integer userId, Integer roleId, Integer status) {
		int userCountByRoleId = userService.findUserCountByRoleId(roleId);
		if (userCountByRoleId>0){
			throw new RuntimeException("该角色已分配给用户,不能锁定!");
		}
		return roleMapper.updateStatus(userId,roleId,status);
	}
}
