package com.ecmis.service;

import com.ecmis.pojo.Project;
import com.ecmis.pojo.User;
import com.ecmis.utils.PageSupport;

import java.util.List;

public interface ProjectService {

	int add(Project project,Integer[] companyIds);
	
	public int delete(Integer projectId);
	
	public int update(Project project);
	
	public Project findById(Integer projectId);
	
	public List<Project> findAll();
	
	public List<Project> findByUserId(Integer userId);
	
	public PageSupport<Project> findByCondition(String projectName, Integer pageIndex, Integer pageSize);
	
	public int findCountByCondition(String projectName);

	int findCheckProject(String projectName);

	List<Project> findProjectByCompany(Integer companyId,Integer companyTypeId);

	List<Project> findProjectByFlowTypeId(Integer flowTypeId,User user);


}
