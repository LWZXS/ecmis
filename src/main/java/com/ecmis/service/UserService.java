package com.ecmis.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.User;
import com.ecmis.utils.PageSupport;

public interface UserService {
	
	public User login(String loginName, String password);
	
	public User findById(Integer userId);
	
	public List<User> findAll();
	
	public int add(User user);
	
	public int delete(Integer userId);
	
	public int update(User user);
	
	public List<User> findUsersByCompany(Integer companyId);
	
	public PageSupport<User> findUserByCondition(String userName, Integer status, Integer companyId, Integer pageIndex, Integer pageSize);
	
	public int findUserCountByCondition(String userName, Integer status, Integer companyId);
	
	/**
	 * 查询某文档的分发人
	 * @param documentId
	 * @return
	 */
	public List<User> findPublishRange(Integer documentId);
	/**
	 * 查询某项目的会审人
	 * @param documentId
	 * @return
	 */
	public List<User> findJointTrial(Integer documentId);
}
