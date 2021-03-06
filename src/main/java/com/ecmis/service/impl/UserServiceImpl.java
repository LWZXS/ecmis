package com.ecmis.service.impl;

import com.ecmis.dao.user.UserMapper;
import com.ecmis.pojo.User;
import com.ecmis.service.RoleService;
import com.ecmis.service.UserService;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;
	@Resource
	private RoleService roleService;
	
	@Override
	public User login(String loginName, String password) {
		return userMapper.getLoginUser(loginName, password);
	}

	@Override
	public User findById(Integer userId) {
		return userMapper.getById(userId);
	}

	@Override
	public List<User> findAll() {
		return userMapper.getAll();
	}

	@Override
	public int add(User user,Integer[]roleIds) {
		int count=userMapper.add(user);
		if (roleIds!=null&& roleIds.length>0){
			//增加角色insert into sys_user_role values(roleId,userId)
			Map<String,Object> params=new HashMap<>();
			params.put("roleIds",roleIds);
			params.put("userId",user.getUserId());
			count+=userMapper.addRole(params);
		}
		return count;
	}

	@Override
	public int delete(Integer userId) {
		return userMapper.delete(userId);
	}

	@Override
	public int update(User user,Integer[] roleIds ) {
		//删除现有的角色
		int count = userMapper.deleteUserRole(user.getUserId());
		//增加新角色
		Map<String,Object> map=new HashMap<>();
		map.put("userId",user.getUserId());
		map.put("roleIds",roleIds);
		count+=userMapper.addRole(map);
		//更新用户状态
		count+=userMapper.update(user);

		return count;
	}

	@Override
	public List<User> findUsersByCompany(Integer companyId) {
		return userMapper.getUsersByCompany(companyId);
	}

	@Override
	public PageSupport<User> findUserByCondition(String userName,
												 Integer companyId,
												 Integer deptId,
												 Integer roleId,
												 Integer status,
												 Integer pageIndex,
												 Integer pageSize) {
		int totalCount = userMapper.getUserCountByCondition(userName, companyId,deptId,roleId,status);
		PageSupport<User> pageSupport=new PageSupport<User>();
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		if (totalCount>0){
			List<User> list = userMapper.getUserByCondition(userName,companyId,deptId,roleId, status, pageSupport.getStartRow(), pageSize);
			/*if (list!=null){
				for (User user :list){
					List<Role> roles = roleService.findByUser(user.getUserId());
					user.setRoles(roles);
				}
			}*/
			pageSupport.setList(list);
		}
		return pageSupport;
	}

	@Override
	public int findUserCountByRoleId(Integer roleId) {
		return userMapper.getUserCountByRoleId(roleId);
	}

	@Override
	public int findUserCountByCondition(String userName, Integer companyId,
										Integer deptId,
										Integer roleId,
										Integer status) {
		return userMapper.getUserCountByCondition(userName, companyId, deptId,roleId,status);
	}

	@Override
	public int findUserCountByDeptId(Integer deptId) {
		return userMapper.getUserCountByDeptId(deptId);
	}

	@Override
	public List<User> findJointTrial(Integer documentId) {
		return userMapper.getJointTrial(documentId);
	}
	
	@Override
	public List<User> findPublishRange(Integer documentId) {
		return userMapper.getPublishRange(documentId);
	}

	@Override
	public int updateStatus(Integer modifyUser, Integer userId, Integer status) {
		return userMapper.updateStatus(modifyUser,userId,status);
	}

	@Override
	public int delete(Integer modifyUser, Integer userId) {
		return userMapper.updateStatus(modifyUser,userId,3);
	}

	@Override
	public int updateCurrentProject(Integer userId, Integer projectId) {
		return userMapper.updateCurrentProject(userId,projectId);
	}

	@Override
	public int updatePassword(Integer userId, String password) {
		return userMapper.updatePassword(userId,password);
	}
}
