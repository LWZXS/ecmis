package com.ecmis.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecmis.pojo.Project;
import com.ecmis.pojo.User;
import com.ecmis.service.ProjectService;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;

@Controller
@RequestMapping(value="/project")
public class ProjectController {

	@Resource
	private ProjectService projectService;
	
	@RequestMapping(value="/selectProject")
	@ResponseBody
	public String selectCurrentProject(@RequestParam(value="projectId")Integer projectId,HttpSession session){
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		
		if(projectId==null || projectId==0){
			session.removeAttribute(Constants.LOGIN_USER_PROJECT);
			return Constants.SUCCESS_JSON;
		}
		
		if(user==null){
			//return "redirect:user/login.html";
			return Constants.NOT_LOGIN_JSON;
		}
		List<Project> projects = (List<Project>) session.getAttribute(Constants.LOGIN_USER_PROJECTS);
		if(projects!=null){
			for (Project project : projects) {
				if(project.getProjectId().equals(projectId)){
					session.setAttribute(Constants.LOGIN_USER_PROJECT, project);
					return Constants.SUCCESS_JSON;
				}
			}
		}
		return Constants.FAIL_JSON;
	}
	
	@RequestMapping(value="/index")
	public String index(){
		return "project/index";
		
	}
	
	@RequestMapping(value="/list.html")
	public String list(){
		return "project/list";
		
	}
	@RequestMapping(value="/list.do")
	@ResponseBody
	public String find(@RequestParam(value="projectName",required=false)String projectName,
			@RequestParam(value="rows",required=false)Integer rows,
			@RequestParam(value="page",required=false)Integer page){
		if(rows==null){
			rows=Constants.PAGE_SIZE;
		}
		if(page==null){
			page=Constants.PAGE_INDEX;
		}
		PageSupport<Project> pageSupport = projectService.findByCondition(projectName, page, rows);
		
		String json = JsonUtil.list2PageJson(pageSupport);
		return json;
		
	}
	
	@RequestMapping(value="/add.html")
	public String add(){
		return "project/addproject";
		
	}
}
