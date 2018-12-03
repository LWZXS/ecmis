package com.ecmis.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Project;
import com.ecmis.pojo.Role;
import com.ecmis.pojo.User;
import com.ecmis.service.UserService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;
import com.ecmis.utils.RandomUtils;
import com.ecmis.utils.SecurityUtils;

@Controller
@RequestMapping(value="/user")
public class UserController {

	private Logger logger=Logger.getLogger(UserController.class);
	@Resource
	private UserService userService;
	
	//查询审核人，目前没有条件，查询所有人，转换JSON
	
	@RequestMapping("/findAuditor")
	@ResponseBody
	public String findAllByAuditorTree(){
		List<User> list = userService.findAll();
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		CommonTreeBean root=new CommonTreeBean(0, "用户列表", "open", null);
		Map<String,String> attri=new HashMap<String, String>();
		attri.put("isParent", "true");
		root.setAttributes(attri);
		List<CommonTreeBean> childs=new ArrayList<CommonTreeBean>();
		for (User user : list) {
			CommonTreeBean ele=new CommonTreeBean(user.getUserId(), user.getUserName(), "close", null);
			childs.add(ele);
		}
		root.setChildren(childs);
		rootList.add(root);
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		return json;
	}
	
	@RequestMapping("/findPublishRangeCheckedTree.json")
	@ResponseBody
	public String findByPublishRangeCheckedTree(@RequestParam(value="documentId")Integer documentId){
		//查询所有的用户
		List<User> list = userService.findAll();
		//查询当前文档分发的对象
		List<User> publishRangeUsers = userService.findPublishRange(documentId);
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		CommonTreeBean root=new CommonTreeBean(0, "用户列表", "open", null);
		Map<String,String> attri=new HashMap<String, String>();
		attri.put("isParent", "true");
		root.setAttributes(attri);
		List<CommonTreeBean> childs=new ArrayList<CommonTreeBean>();
		for (User user : list) {
			//分发中是否包含user
			boolean checked=publishRangeUsers.contains(user);
			CommonTreeBean ele =new CommonTreeBean(user.getUserId(), user.getUserName(), "close", checked, null, null);
			childs.add(ele);
		}
		root.setChildren(childs);
		rootList.add(root);
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		return json;
	}
	
	@RequestMapping("/findByJointTrialCheckedTree.json")
	@ResponseBody
	public String findByJointTrialCheckedTree(@RequestParam(value="documentId")Integer documentId){
		//查询所有的用户
		List<User> list = userService.findAll();
		//查询当前文档分发的对象
		List<User> jointTrialUsers = userService.findJointTrial(documentId);
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		CommonTreeBean root=new CommonTreeBean(0, "用户列表", "open", null);
		Map<String,String> attri=new HashMap<String, String>();
		attri.put("isParent", "true");
		root.setAttributes(attri);
		List<CommonTreeBean> childs=new ArrayList<CommonTreeBean>();
		for (User user : list) {
			//分发中是否包含user
			boolean checked=jointTrialUsers.contains(user);
			CommonTreeBean ele =new CommonTreeBean(user.getUserId(), user.getUserName(), "close", checked, null, null);
			childs.add(ele);
		}
		root.setChildren(childs);
		rootList.add(root);
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		//logger.debug(json);
		return json;
	}
	
	@RequestMapping(value="/login.html")
	public String login(@RequestParam(value="msg",required=false)String msg,Model model){
		
		model.addAttribute("msg", msg);
		return "user/login";
	}
	@RequestMapping(value="/login1.html")
	public String login1(@RequestParam(value="msg",required=false)String msg,Model model){
		model.addAttribute("msg", msg);
		return "pages/login";
	}
	@RequestMapping(value="/dologin.html")
	public String doLogin(@RequestParam(value="loginName")String loginName,
			@RequestParam(value="password")String password,
			@RequestParam(value="rememberPwd",required=false)boolean rememberPwd,
			HttpSession session,HttpServletRequest request,HttpServletResponse response){
		//System.out.println(rememberPwd);
		User user=null;
		Integer loginCount = (Integer) request.getServletContext().getAttribute(loginName);
		if(loginCount==null){
			loginCount=1;
		}
		if(loginCount!=5){
			//调用Service方法实现登录
			user = userService.login(loginName, password);
		}else{
			request.setAttribute("msg", "该用户今天禁止登录！");
			
			return "user/login";
		}
		
		if(user!=null){
			session.setAttribute(Constants.LOGIN_USER, user);
			if(rememberPwd){
				String passwordMd5 = SecurityUtils.md5Hex3(password);
				Cookie nameCookie=new Cookie(Constants.COOKIE_LOGIN_NAME, loginName);
				Cookie passCookie=new Cookie(Constants.COOKIE_PASSWORD, passwordMd5);
				
				response.addCookie(nameCookie);
				response.addCookie(passCookie);
			}
			//找出当前用户的角色
			List<Role> roles=user.getRoles();
			session.setAttribute(Constants.LOGIN_USER_ROLES, roles);
			//找出用户当前的项目
			//SELECT * FROM biz_project WHERE `chiefInspectorId`=8 OR `deputyDirectorId`=8 OR`clerkId`=8 OR `supervisionEngineerId`=8 AND STATUS=1 ORDER BY projectId
			List<Project> projects=user.getProjects();
			session.setAttribute(Constants.LOGIN_USER_PROJECTS, projects);
			if(projects!=null && projects.size()>0){
				session.setAttribute(Constants.LOGIN_USER_PROJECT, projects.get(0));
			}
			
			//response.sendRedirect(location)
			return "redirect:/main/index.html";
		}else{
			request.setAttribute("msg", "用户名或者密码无效,还有"+(5-loginCount)+"次机会,<br />输错超过5次,账号则被锁定一天!");
			loginCount++;
			request.getServletContext().setAttribute(loginName, loginCount);
			return "user/login";
		}
		
	}
	
	@RequestMapping(value="/index.html")
	public String index(){
		return "index";
		
	}
	@RequestMapping(value="/index1.html")
	public String index1(){
		return "redirect:/main/index.html";
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session,HttpServletRequest request){
		
		session.invalidate();
		request.setAttribute("msg", "注销成功！");
		//return "redirect:/user/login.html";
		return "user/login";
	}
	
	@RequestMapping("/list.html")
	public String list(HttpSession session){
		
		return "user/list";
	}
	
	@RequestMapping(value="/list.do")
	@ResponseBody
	public String findUser(@RequestParam(value="userName",required=false)String userName,
				@RequestParam(value="status",required=false)Integer status,
				@RequestParam(value="companyId",required=false)Integer companyId,
				@RequestParam(value="rows",required=false)Integer rows,
						   @RequestParam(value="page",required=false)Integer page
				){
		logger.debug("params:status"+status+"&companyId="+companyId+"&rows="+rows+"&page="+page);
		if(rows==null){
			rows=Constants.PAGE_SIZE;
		}
		if(page==null){
			page=Constants.PAGE_INDEX;
		}
		PageSupport<User> pageSupport = userService.findUserByCondition(userName, status, companyId, page, rows);
		
		String json = JsonUtil.list2PageJson(pageSupport);
		
		return json;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Object doAdd(User user,HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile attach){
		logger.debug("params:user="+user);
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		if (currentLoginUser == null) {
			return "登录超时,请重新登录!";
		}
		if (!attach.isEmpty()) {
			// 有文件上传
			String path = session.getServletContext().getRealPath(Constants.INNER_ATTACHMENT_PATH);
			String oldFileName = attach.getOriginalFilename();// 原文件名
			String prefix = FilenameUtils.getExtension(oldFileName);// 原文件后缀

			int filesize = Constants.MAX_FILE_UPLOAD_SIZE;
			if (attach.getSize() > filesize) {// 上传大小不得超过 500k
				// request.setAttribute("uploadFileError", " * 上传大小不得超过 2M");
				// return
				// "{\"result\":\"上传大小不得超过 "+(Constants.MAX_FILE_UPLOAD_SIZE/1024/1024)+"M\"}";
				return "上传大小不得超过 "
						+ (Constants.MAX_FILE_UPLOAD_SIZE / 1024 / 1024) + "M";
			} else if (prefix.equalsIgnoreCase("jpg")
					|| prefix.equalsIgnoreCase("jpge")
					|| prefix.equalsIgnoreCase("png")
					|| prefix.equalsIgnoreCase("gif")
					|| prefix.equalsIgnoreCase("bmp")) {
				String fileName = System.currentTimeMillis() + ""
						+ RandomUtils.getNextInt() + "." + prefix;

				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					// 保存
					attach.transferTo(targetFile);
					// 保存文件名
					user.setIcon(fileName);
				} catch (Exception e) {
					e.printStackTrace();
					return "上传图片失败！";
				}
			} else {
				// 上传图片格式不正确
				return "上传格式不正确，请上传图片";
			}
		}
		user.setCreationUser(currentLoginUser.getUserId());
		user.setStatus(1);
		int count = userService.add(user);
		if (count>0) {
			return "success";
		}
		return "请联系管理员";
	}
}
