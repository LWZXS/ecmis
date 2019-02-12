package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.exception.NotLoginException;
import com.ecmis.pojo.Company;
import com.ecmis.pojo.Project;
import com.ecmis.pojo.User;
import com.ecmis.service.CompanyService;
import com.ecmis.service.ProjectService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/project")
public class ProjectController {

	@Resource
	private ProjectService projectService;
	@Resource
	private CompanyService companyService;
	
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


	@RequestMapping(value = "/easyUiTree.json")
	@ResponseBody
	public Object getDepartmentsAsEasyUITree(HttpSession session){
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		Map<String,Object> map=new HashMap<>();
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		CommonTreeBean defaultBean=new CommonTreeBean(0, "请选择", "open", null);
		rootList.add(defaultBean);
		if (currentLoginUser==null){
			return JsonUtil.getJson(map);
		}
		List<Project> projectList = currentLoginUser.getProjects();
		if(projectList!=null && projectList.size()>0){
			for (Project project : projectList) {
				CommonTreeBean cb=new CommonTreeBean(project.getProjectId(), project.getProjectName(), "close", null);
				if (currentLoginUser.getProjectId()==project.getProjectId()){
					cb.setSelected(true);
				}
				rootList.add(cb);
			}
		}

		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
				SerializerFeature.PrettyFormat);
		return json;
	}

	@RequestMapping(value="/index.html")
	public String index(){
		return "admin/project/list";
		
	}
	
	@RequestMapping(value="/list.json")
	@ResponseBody
	public String find(@RequestParam(value="projectName",required=false)String projectName,
			@RequestParam(value="rows",required=false,defaultValue = "10")Integer rows,
			@RequestParam(value="page",required=false,defaultValue = "1")Integer page){
		PageSupport<Project> pageSupport = projectService.findByCondition(projectName, page, rows);
		
		String json = JsonUtil.list2PageJson(pageSupport);
		return json;
		
	}
	
	@RequestMapping(value="/add.html")
	public String add(){
		return "project/addproject";
		
	}

	@RequestMapping(value = "/addOrUpdate.json")
	@ResponseBody
	public String saveOrUpdate(Project project,@RequestParam(value = "companyId") Integer[] companyIds,HttpSession session){
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		Map<String ,Object> map=new HashMap<>();
		if (currentLoginUser==null){
			map.put("result",false);
			map.put("message","您还没有登录,或登录信息过期,请先登录!");
			return JsonUtil.getJson(map);
		}
		if (project.getStatus()==null){
			project.setStatus(1);
		}
		int count=0;
		if (project.getProjectId()==null){
			project.setCreationUser(currentLoginUser.getUserId());
			count=projectService.add(project,companyIds);
			if (count>0){
				map.put("result",true);
				map.put("message","增加项目成功!");
			}else {
				map.put("result",false);
				map.put("message","增加项目失败!");
			}
		}else {
			project.setModifyUser(currentLoginUser.getUserId());
			count=projectService.update(project);
			if (count>0){
				map.put("result",true);
				map.put("message","修改项目成功!");
			}else {
				map.put("result",false);
				map.put("message","修改项目失败!");
			}
		}
		return JsonUtil.getJson(map);
	}

	@RequestMapping(value = "/checkProjectName.json")
	@ResponseBody
	public String checkProjectName(@RequestParam(value = "projectName") String projectName){
		int count = projectService.findCheckProject(projectName);
		return "{\"result\":"+count+"}";
	}


	@RequestMapping(value = "/getProjectByCurrentUserCompany.json")
	@ResponseBody
	public String getProjectByCurrentUserCompany(HttpSession session){
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		if (currentLoginUser==null){
			throw new NotLoginException("您还没有登录,或登录信息过期,请先登录!");
		}
		Integer companyId = currentLoginUser.getCompanyId();
		Company company = companyService.findById(companyId);
		List<Project> projects = projectService.findProjectByCompany(company.getCompanyId(), company.getCompanyTypeId());
		return JsonUtil.getJson(projects);
	}

	@RequestMapping(value = "/getProjectByFlowType.json")
	@ResponseBody
	public String getProjectByFlowType(Integer flowTypeId,HttpSession session){
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		if (currentLoginUser==null){
			throw new NotLoginException("您还没有登录,或登录信息过期,请先登录!");
		}
		List<Project> list = projectService.findProjectByFlowTypeId(flowTypeId, currentLoginUser);
		return JsonUtil.getJson(list);
	}

	@ExceptionHandler({NotLoginException.class})
	public String handlerNotLogin(NotLoginException ex){
		Map<String ,Object> map=new HashMap<>();
		map.put("result",false);
		map.put("message",ex.getMessage());
		return JsonUtil.getJson(map);
	}

	@RequestMapping(value = "/jeasyui.html")
	public String jeasyui(){
		return "admin/project/jeasyui";
	}
}
