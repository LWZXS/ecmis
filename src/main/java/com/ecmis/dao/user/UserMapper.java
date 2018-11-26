package com.ecmis.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.User;

public interface UserMapper {

	public User getLoginUser(@Param("loginName") String loginName, @Param("password") String password);
	
	public User getById(@Param("userId") Integer userId);
	
	public List<User> getAll();
	
	public int add(User user);
	
	public int delete(@Param("userId") Integer userId);
	
	public int update(User user);
	
	public List<User> getUsersByCompany(@Param("companyId") Integer companyId);
	
	public List<User> getUserByCondition(@Param("userName") String userName, @Param("status") Integer status, @Param("companyId") Integer companyId, @Param("startRow") Integer startRow, @Param("pageSize") Integer pageSize);
	
	public int getUserCountByCondition(@Param("userName") String userName, @Param("status") Integer status, @Param("companyId") Integer companyId);
	/**
	 * 查询某文档的分发人
	 * @param documentId
	 * @return
	 */
	public List<User> getPublishRange(@Param("documentId") Integer documentId);
	/**
	 * 查询某项目的会审人
	 * @param documentId
	 * @return
	 */
	public List<User> getJointTrial(@Param("documentId") Integer documentId);
	
}
