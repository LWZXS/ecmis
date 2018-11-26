package com.ecmis.dao.jointtrial;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.JointTrial;

public interface JointTrialMapper {

	public List<JointTrial> getJointTrialByDocument(@Param("documentId") Integer documentId);
	
	public int add(JointTrial jointTrial);
	
	public int addList(@Param("documentId") Integer documentId, @Param("users") Integer[] users);
	
	public int update(JointTrial jointTrial);
	
	public int delete(@Param("documentId") Integer documentId, @Param("userId") Integer userId);
}
