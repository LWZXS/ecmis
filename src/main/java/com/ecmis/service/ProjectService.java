package com.ecmis.service;

import com.ecmis.pojo.Project;
import com.ecmis.utils.PageSupport;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectService {

public int add(Project project);
	
	public int delete(Integer projectId);
	
	public int update(Project project);
	
	public Project findById(Integer projectId);
	
	public List<Project> findAll();
	
	public List<Project> findByUserId(Integer userId);
	
	public PageSupport<Project> findByCondition(String projectName, Integer pageIndex, Integer pageSize);
	
	public int findCountByCondition(String projectName);

	int findCheckProject(@Param("projectName") String projectName);
}
