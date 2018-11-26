package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.project.ProjectMapper;
import com.ecmis.pojo.Project;
import com.ecmis.service.ProjectService;
import com.ecmis.utils.PageSupport;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper projectMapper;
	
	@Override
	public int add(Project project) {
		return projectMapper.add(project);
	}

	@Override
	public int delete(Integer projectId) {
		return projectMapper.delete(projectId);
	}

	@Override
	public int update(Project project) {
		return projectMapper.update(project);
	}

	@Override
	public Project findById(Integer projectId) {
		return projectMapper.getById(projectId);
	}

	@Override
	public List<Project> findAll() {
		return projectMapper.getAll();
	}

	@Override
	public List<Project> findByUserId(Integer userId) {
		return projectMapper.getByUserId(userId);
	}

	@Override
	public PageSupport<Project> findByCondition(String projectName,
			Integer pageIndex, Integer pageSize) {
		List<Project> list = projectMapper.getByCondition(projectName, (pageIndex-1)*pageSize, pageSize);
		
		int totalCount = projectMapper.getCountByCondition(projectName);
		
		PageSupport<Project> pageSupport=new PageSupport<Project>();
		
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}

	@Override
	public int findCountByCondition(String projectName) {
		return projectMapper.getCountByCondition(projectName);
	}

}
