package com.ecmis.service.impl;

import com.ecmis.dao.project.ProjectMapper;
import com.ecmis.pojo.Company;
import com.ecmis.pojo.Project;
import com.ecmis.pojo.User;
import com.ecmis.service.CompanyService;
import com.ecmis.service.ProjectService;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper projectMapper;
	@Resource
	private CompanyService companyService;

	@Override
	public int add(Project project,Integer[] companyIds) {
		int count=projectMapper.add(project);
		count+=projectMapper.addProjectAndCompany(project.getProjectId(),companyIds);
		return count;
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

	@Override
	public int findCheckProject(String projectName) {
		return projectMapper.getCheckProject(projectName);
	}

	@Override
	public List<Project> findProjectByCompany(Integer companyId, Integer companyTypeId) {
		return projectMapper.getProjectByCompany(companyId);
	}

	@Override
	public List<Project> findProjectByFlowTypeId(Integer flowTypeId, User user) {
		//获取公司
		Company company = companyService.findByUser(user.getUserId());
		List<Project> projects =new ArrayList<>(0);
		switch (flowTypeId){
			case 1:
			case 2:
			case 4:
			case 5:
			case 6:
				//ABDEF流程发起人是施工单位,如果登录的用户是施工单位的查出这个单位的项目
				if (company.getCompanyTypeId()==2){
					projects = projectMapper.getProjectByCompany(company.getCompanyId());
				}
				break;
			case 3:
				//C流程发起人是建设单位,如果登录的用户是建设单位的查出这个单位的项目
				if (company.getCompanyTypeId()==1){
					projects = projectMapper.getProjectByCompany(company.getCompanyId());
				}
				break;
		}
		return projects;

	}
}
