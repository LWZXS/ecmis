package com.ecmis.dao.project;

import com.ecmis.pojo.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ProjectMapper {

	
	public int add(Project project);
	
	public int delete(@Param("projectId") Integer projectId);
	
	public int update(Project project);
	
	public Project getById(@Param("projectId") Integer projectId);
	
	public List<Project> getAll();
	
	public List<Project> getByUserId(@Param("userId") Integer userId);
	
	public List<Project> getByCondition(@Param("projectName") String projectName, @Param("startRow") Integer startRow, @Param("pageSize") Integer pageSize);
	public List<Project> getByCondition1(@Param("projectName") String projectName, @Param("startRow") Integer startRow, @Param("pageSize") Integer pageSize);

	public int getCountByCondition(@Param("projectName") String projectName);

	int getCheckProject(@Param("projectName") String projectName);
}
