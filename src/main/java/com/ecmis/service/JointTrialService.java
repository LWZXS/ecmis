package com.ecmis.service;

import java.util.List;

import com.ecmis.pojo.JointTrial;

public interface JointTrialService {

	public List<JointTrial> findJointTrialByDocument(Integer documentId);
	
	public int add(JointTrial jointTrial);
	
	public int addList(Integer documentId, Integer[] users);
	
	public int update(JointTrial jointTrial);
	
	public int delete(Integer documentId, Integer userId);
}
