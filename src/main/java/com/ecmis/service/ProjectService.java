package com.ecmis.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.ecmis.pojo.Project;
import com.ecmis.utils.PageSupport;

public interface ProjectService {

public int add(Project project);
	
	public int delete(Integer projectId);
	
	public int update(Project project);
	
	public Project findById(Integer projectId);
	
	public List<Project> findAll();
	
	public List<Project> findByUserId(Integer userId);
	
	public PageSupport<Project> findByCondition(String projectName, Integer pageIndex, Integer pageSize);
	
	public int findCountByCondition(String projectName);
}
