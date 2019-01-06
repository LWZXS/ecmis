package com.ecmis.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.User;
import com.ecmis.utils.PageSupport;

public interface UserService {
	
	public User login(String loginName, String password);
	
	public User findById(Integer userId);
	
	public List<User> findAll();
	
	public int add(User user,Integer[] roleIds);
	
	public int delete(Integer userId);
	
	public int update(User user,Integer[] roleIds );

	public int findUserCountByDeptId(Integer deptId);

	public List<User> findUsersByCompany(Integer companyId);
	
	public PageSupport<User> findUserByCondition(String userName,
												 Integer companyId,
												 Integer deptId,
												 Integer roleId,
												 Integer status,
												 Integer pageIndex,
												 Integer pageSize);
	
	public int findUserCountByCondition(String userName, Integer companyId,
										Integer deptId,
										Integer roleId,
										Integer status);
	
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


	int findUserCountByRoleId(Integer roleId);

	int updateStatus( Integer modifyUser, Integer userId, Integer status);

	/**
	 * 删除用户,改变状态
	 * @param modifyUser 修改者
	 * @param userId 被删除者
	 * @return
	 */
	int delete(Integer modifyUser,Integer userId);

	int updateCurrentProject( Integer userId,Integer projectId);
}
