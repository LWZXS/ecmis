package com.ecmis.dao.privilege;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Privilege;


public interface PrivilegeMapper {

	
	/*public int add(Privilege privilege);
	
	public int delete(@Param("privilegeId") Integer privilegeId);
	
	public int update(Privilege privilege);
	
	public Privilege getById(@Param("privilegeId") Integer privilegeId);
	
	public List<Privilege> getAll();*/

	int grantPrivilege(@Param("creationUser")Integer creationUser,
					   @Param("masterId")Integer masterId,
						@Param("masterType")String masterType,
						@Param("resourceIds")Integer[] resourceIds,
						@Param("resourceType")String resourceType);

	int revokeFromMaster(@Param("modifuUser")Integer modifyUser,
						@Param("masterId")Integer masterId,
					   @Param("masterType")String masterType);
	
}
