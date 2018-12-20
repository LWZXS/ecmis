package com.ecmis.dao.user;

import java.util.List;
import java.util.Map;

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
	
	public List<User> getUserByCondition(@Param("userName") String userName,
										 @Param("companyId") Integer companyId,
										 @Param("deptId") Integer deptId,
										 @Param("roleId") Integer roleId,
										 @Param("status") Integer status,
										 @Param("startRow") Integer startRow,
										 @Param("pageSize") Integer pageSize);
	
	public int getUserCountByCondition(@Param("userName") String userName,
									   @Param("companyId") Integer companyId,
									   @Param("deptId") Integer deptId,
									   @Param("roleId") Integer roleId,
									   @Param("status") Integer status);
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


	int getUserCountByDeptId(Integer deptId);

	int getUserCountByRoleId(Integer roleId);

	int updateStatus(@Param("modifyUser") Integer modifyUser,
					 @Param("userId") Integer userId,
					 @Param("status") Integer status);

	int addRole(Map<String ,Object> params);

	int updateCurrentProject(@Param("userId") Integer userId,
							 @Param("projectId") Integer projectId);
}
