package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.user.UserMapper;
import com.ecmis.pojo.Document;
import com.ecmis.pojo.User;
import com.ecmis.service.UserService;
import com.ecmis.utils.PageSupport;

@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;
	
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
	public int add(User user) {
		return userMapper.add(user);
	}

	@Override
	public int delete(Integer userId) {
		return userMapper.delete(userId);
	}

	@Override
	public int update(User user) {
		return userMapper.update(user);
	}

	@Override
	public List<User> findUsersByCompany(Integer companyId) {
		return userMapper.getUsersByCompany(companyId);
	}

	@Override
	public PageSupport<User> findUserByCondition(String userName,
			Integer status, Integer companyId, Integer pageIndex,
			Integer pageSize) {
		// TODO Auto-generated method stub
		List<User> list = userMapper.getUserByCondition(userName, status, companyId, (pageIndex-1)*pageSize, pageSize);
		int totalCount = userMapper.getUserCountByCondition(userName, status, companyId);
		PageSupport<User> pageSupport=new PageSupport<User>();
		
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		
		pageSupport.setList(list);
		
		return pageSupport;
		
		
	}

	@Override
	public int findUserCountByCondition(String userName, Integer status,
			Integer companyId) {
		return userMapper.getUserCountByCondition(userName, status, companyId);
	}
	
	@Override
	public List<User> findJointTrial(Integer documentId) {
		return userMapper.getJointTrial(documentId);
	}
	
	@Override
	public List<User> findPublishRange(Integer documentId) {
		return userMapper.getPublishRange(documentId);
	}
}
