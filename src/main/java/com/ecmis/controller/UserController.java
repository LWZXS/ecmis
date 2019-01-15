package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Project;
import com.ecmis.pojo.Role;
import com.ecmis.pojo.User;
import com.ecmis.service.UserService;
import com.ecmis.utils.*;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    private Logger logger = Logger.getLogger(UserController.class);
    @Resource
    private UserService userService;

    //查询审核人，目前没有条件，查询所有人，转换JSON

    @RequestMapping("/findAuditor")
    @ResponseBody
    public String findAllByAuditorTree() {
        List<User> list = userService.findAll();
        List<CommonTreeBean> rootList = new ArrayList<CommonTreeBean>();
        CommonTreeBean root = new CommonTreeBean(0, "用户列表", "open", null);
        Map<String, Object> attri = new HashMap<String, Object>();
        attri.put("isParent", "true");
        root.setAttributes(attri);
        List<CommonTreeBean> childs = new ArrayList<CommonTreeBean>();
        for (User user : list) {
            CommonTreeBean ele = new CommonTreeBean(user.getUserId(), user.getUserName(), "close", null);
            childs.add(ele);
        }
        root.setChildren(childs);
        rootList.add(root);
        String json = JSON.toJSONString(rootList, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteNullBooleanAsFalse);
        logger.debug(json);
        return json;
    }

    @RequestMapping("/findPublishRangeCheckedTree.json")
    @ResponseBody
    public String findByPublishRangeCheckedTree(@RequestParam(value = "documentId") Integer documentId) {
        //查询所有的用户
        List<User> list = userService.findAll();
        //查询当前文档分发的对象
        List<User> publishRangeUsers = userService.findPublishRange(documentId);
        List<CommonTreeBean> rootList = new ArrayList<CommonTreeBean>();
        CommonTreeBean root = new CommonTreeBean(0, "用户列表", "open", null);
        Map<String, Object> attri = new HashMap<String, Object>();
        attri.put("isParent", "true");
        root.setAttributes(attri);
        List<CommonTreeBean> childs = new ArrayList<CommonTreeBean>();
        for (User user : list) {
            //分发中是否包含user
            boolean checked = publishRangeUsers.contains(user);
            CommonTreeBean ele = new CommonTreeBean(user.getUserId(), user.getUserName(), "close", checked, null, null);
            childs.add(ele);
        }
        root.setChildren(childs);
        rootList.add(root);
        String json = JSON.toJSONString(rootList, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteNullBooleanAsFalse);
        logger.debug(json);
        return json;
    }

    @RequestMapping("/findByJointTrialCheckedTree.json")
    @ResponseBody
    public String findByJointTrialCheckedTree(@RequestParam(value = "documentId") Integer documentId) {
        //查询所有的用户
        List<User> list = userService.findAll();
        //查询当前文档分发的对象
        List<User> jointTrialUsers = userService.findJointTrial(documentId);
        List<CommonTreeBean> rootList = new ArrayList<CommonTreeBean>();
        CommonTreeBean root = new CommonTreeBean(0, "用户列表", "open", null);
        Map<String, Object> attri = new HashMap<String, Object>();
        attri.put("isParent", "true");
        root.setAttributes(attri);
        List<CommonTreeBean> childs = new ArrayList<CommonTreeBean>();
        for (User user : list) {
            //分发中是否包含user
            boolean checked = jointTrialUsers.contains(user);
            CommonTreeBean ele = new CommonTreeBean(user.getUserId(), user.getUserName(), "close", checked, null, null);
            childs.add(ele);
        }
        root.setChildren(childs);
        rootList.add(root);
        String json = JSON.toJSONString(rootList, SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteNullBooleanAsFalse);
        //logger.debug(json);
        return json;
    }

    @RequestMapping(value = "/login.html")
    public String login(@RequestParam(value = "msg", required = false) String msg, Model model) {

        model.addAttribute("msg", msg);
        return "user/login";
    }

    @RequestMapping(value = "/login1.html")
    public String login1(@RequestParam(value = "msg", required = false) String msg, Model model) {
        model.addAttribute("msg", msg);
        return "pages/login";
    }

    @RequestMapping(value = "/dologin.html")
    public String doLogin(@RequestParam(value = "loginName") String loginName,
                          @RequestParam(value = "password") String password,
                          @RequestParam(value = "rememberPwd", required = false) boolean rememberPwd,
                          HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        //System.out.println(rememberPwd);
        User user = null;
        Integer loginCount = (Integer) request.getServletContext().getAttribute(loginName);
        if (loginCount == null) {
            loginCount = 1;
        }
        if (loginCount != 5) {
            //调用Service方法实现登录
            user = userService.login(loginName, password);
        } else {
            request.setAttribute("msg", "该用户今天禁止登录！");

            return "user/login";
        }

        if (user != null) {
            session.setAttribute(Constants.LOGIN_USER, user);
            if (rememberPwd) {
                String passwordMd5 = SecurityUtils.md5Hex3(password);
                Cookie nameCookie = new Cookie(Constants.COOKIE_LOGIN_NAME, loginName);
                Cookie passCookie = new Cookie(Constants.COOKIE_PASSWORD, passwordMd5);

                response.addCookie(nameCookie);
                response.addCookie(passCookie);
            }
            //找出当前用户的角色
            List<Role> roles = user.getRoles();
            session.setAttribute(Constants.LOGIN_USER_ROLES, roles);
            //找出用户当前的项目
            //SELECT * FROM biz_project WHERE `chiefInspectorId`=8 OR `deputyDirectorId`=8 OR`clerkId`=8 OR `supervisionEngineerId`=8 AND STATUS=1 ORDER BY projectId
            List<Project> projects = user.getProjects();
            session.setAttribute(Constants.LOGIN_USER_PROJECTS, projects);
            if (projects != null && projects.size() > 0) {
                session.setAttribute(Constants.LOGIN_USER_PROJECT, projects.get(0));
            }

            //response.sendRedirect(location)
            return "redirect:/main/index.html";
        } else {
            request.setAttribute("msg", "用户名或者密码无效,还有" + (5 - loginCount) + "次机会,<br />输错超过5次,账号则被锁定一天!");
            loginCount++;
            request.getServletContext().setAttribute(loginName, loginCount);
            return "user/login";
        }

    }

    @RequestMapping(value = "/index.html")
    public String index() {
        return "index";

    }

    @RequestMapping(value = "/index1.html")
    public String index1() {
        return "redirect:/main/index.html";

    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session, HttpServletRequest request) {

        session.invalidate();
        request.setAttribute("msg", "注销成功！");
        //return "redirect:/user/login.html";
        return "user/login";
    }

    @RequestMapping("/list.html")
    public String list(@RequestParam(value = "pageIndex",required = false,defaultValue = "1") Integer pageIndex,
                       @RequestParam(value = "pageSize",required = false,defaultValue = "10") Integer pageSize,Model model) {

        model.addAttribute("pageIndex",pageIndex);
        model.addAttribute("pageSize",pageSize);
        return "user/list";
    }

    @RequestMapping(value = "/list.json")
    @ResponseBody
    public String findUser(@RequestParam(value = "userName", required = false) String userName,
                           @RequestParam(value = "companyId", required = false) Integer companyId,
                           @RequestParam(value = "deptId", required = false) Integer deptId,
                           @RequestParam(value = "roleId", required = false) Integer roleId,
                           @RequestParam(value = "status", required = false) Integer status,
                           @RequestParam(value = "rows", required = false) Integer rows,
                           @RequestParam(value = "page", required = false) Integer page
    ) {
        if (rows == null) {
            rows = Constants.PAGE_SIZE;
        }
        if (page == null) {
            page = Constants.PAGE_INDEX;
        }
        PageSupport<User> pageSupport = userService.findUserByCondition(userName,companyId,deptId,roleId,status, page, rows);

        String json = JsonUtil.list2PageJson(pageSupport);

        return json;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object doAdd(User user,Integer[] roleIds ,HttpSession session,
                        @RequestParam(value = "file", required = false) MultipartFile attach) {
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String,Object> map=new HashMap<>();
        if (currentLoginUser == null) {
            map.put("result",false);
            map.put("message","登录超时,请重新登录!");
            return JsonUtil.getJson(map);
        }
        if (attach!=null &&!attach.isEmpty()) {
            // 有文件上传
            String path = session.getServletContext().getRealPath(Constants.USER_ICON);
            String oldFileName = attach.getOriginalFilename();// 原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);// 原文件后缀

            int fileSize = Constants.MAX_FILE_UPLOAD_SIZE;
            if (attach.getSize() > fileSize) {// 上传大小不得超过 500k
                // request.setAttribute("uploadFileError", " * 上传大小不得超过 2M");
                // return
                // "{\"result\":\"上传大小不得超过 "+(Constants.MAX_FILE_UPLOAD_SIZE/1024/1024)+"M\"}";
                map.put("result",false);
                map.put("message","上传大小不得超过 "+ (Constants.MAX_FILE_UPLOAD_SIZE / 1024 / 1024) + "M");
                return JsonUtil.getJson(map);
                //return "上传大小不得超过 "  + (Constants.MAX_FILE_UPLOAD_SIZE / 1024 / 1024) + "M";
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
                    map.put("result",false);
                    map.put("message","上传图片失败");
                    return JsonUtil.getJson(map);
                    //return "上传图片失败！";
                }
            } else {
                // 上传图片格式不正确
                map.put("result",false);
                map.put("message","上传格式不正确，请上传图片.");
                return JsonUtil.getJson(map);
                //return "上传格式不正确，请上传图片";
            }
        }

        int count =0;
        if (user.getUserId()!=null){
            user.setModifuUser(currentLoginUser.getUserId());
            count = userService.update(user,roleIds);
            map.put("message","修改用户成功!");
        }else {
            user.setCreationUser(currentLoginUser.getUserId());
            user.setStatus(1);
            count = userService.add(user,roleIds);
            map.put("message","增加用户成功!");
        }
        if (count > 0) {
            map.put("result",true);
            return JsonUtil.getJson(map);
            //return "success";
        }
        map.put("result",false);
        map.put("message","增加用户出现异常,请联系管理员");
        return JsonUtil.getJson(map);
       // return "请联系管理员";
    }

    @RequestMapping(value = "/lock.json")
    @ResponseBody
    public String lock(@RequestParam(value = "userId") Integer userId,HttpSession session){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String ,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }

        try {
            int count = userService.updateStatus(currentLoginUser.getUserId(), userId, 2);
            if (count>0){
                map.put("result",true);
                map.put("message","锁定成功!");
            }else {
                map.put("result",false);
                map.put("message","锁定失败!");
            }
        }catch (Exception ex){
            map.put("result",false);
            map.put("message",ex.getMessage());
        }
        return JsonUtil.getJson(map);
    }

    @RequestMapping(value = "/delete.json")
    @ResponseBody
    public String delete(@RequestParam(value = "userId") Integer userId,HttpSession session){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String ,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }
        try {
            int count = userService.delete(currentLoginUser.getUserId(), userId);
            if (count>0){
                map.put("result",true);
                map.put("message","删除成功!");
            }else {
                map.put("result",false);
                map.put("message","删除失败!");
            }
        }catch (Exception ex){
            map.put("result",false);
            map.put("message",ex.getMessage());
        }
        return JsonUtil.getJson(map);

    }

    @RequestMapping(value = "/setCurrentProject.json")
    @ResponseBody
    public String setCurrentProject(HttpSession session,@RequestParam("projectId") Integer projectId){

        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String ,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }
        int count = userService.updateCurrentProject(currentLoginUser.getUserId(), projectId);
        if (count>0){
            map.put("result",true);
            map.put("message","已成功修改黙认项目!");
        }else {
            map.put("result",true);
            map.put("message","修改黙认项目失败!");
        }
        return JsonUtil.getJson(map);
    }

    @RequestMapping(value = "/easyUiTree.json")
    @ResponseBody
    public Object getAllRoles(){
        List<User> list = userService.findAll();
        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();

        //集合无数据，提示无数据
        CommonTreeBean defaultBean=new CommonTreeBean(0, "请选择", "open", null);
        rootList.add(defaultBean);
        if(list!=null && list.size()>0){
            for (User user : list) {
                CommonTreeBean cb=new CommonTreeBean(user.getUserId(), user.getUserName(), "close", null);
                rootList.add(cb);
            }
        }

        String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
                SerializerFeature.PrettyFormat);
        logger.debug(json);
        return json;
    }

    @RequestMapping(value = "/easyUiTreeAsPrivilege.json")
    @ResponseBody
    public Object getAllRolesAsPrivilege(){
        List<User> list = userService.findAll();
        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();

        //集合无数据，提示无数据
        CommonTreeBean defaultBean=new CommonTreeBean(0, "用户列表", "open", null);
        Map<String,Object> attributesLevel1=new HashMap<String, Object>();
        attributesLevel1.put("isParent",true);
        rootList.add(defaultBean);
        List<CommonTreeBean> childList=new ArrayList<CommonTreeBean>();
        defaultBean.setChildren(childList);
        defaultBean.setAttributes(attributesLevel1);
        //rootList.add(defaultBean);
        if(list!=null && list.size()>0){
            for (User user : list) {
                if ("系统管理员".equals(user.getUserName())){
                    continue;
                }
                CommonTreeBean cb=new CommonTreeBean(user.getUserId(), user.getUserName(), "close", null);
                childList.add(cb);
            }
        }

        String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
                SerializerFeature.PrettyFormat);
        logger.debug(json);
        return json;
    }

    @RequestMapping(value = "/getUserByCompany.json")
    @ResponseBody
    public String getUserByCompany(@RequestParam(value = "companyId") Integer companyId){
        List<User> userList = userService.findUsersByCompany(companyId);
        String json = JsonUtil.getJson(userList);
        return json;
    }

    @RequestMapping(value = "/checkPassword.json")
    @ResponseBody
    public String checkPassword(HttpSession session,@RequestParam(value = "password") String password){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String ,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }
        if (currentLoginUser.getPassword().equals(password)){
            map.put("result",true);
        }else {
            map.put("result",false);
        }
        return JsonUtil.getJson(map);
    }

    @RequestMapping(value = "/updatePassword.json")
    @ResponseBody
    public String updatePassword(HttpSession session,
                                 @RequestParam(value = "oldPassword") String oldPassword,
                                 @RequestParam(value = "newPassword")String newPassword){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String ,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }
        if (!currentLoginUser.getPassword().equals(oldPassword)){
            map.put("result",false);
            map.put("message","旧密码不正确!");
            return JsonUtil.getJson(map);
        }
        int count = userService.updatePassword(currentLoginUser.getUserId(), newPassword);
        if (count>0){
            map.put("result",true);
            map.put("message","修改密码成功!");
            currentLoginUser.setPassword(newPassword);
        }else {
            map.put("result",false);
            map.put("message","修改密码失败!");
        }

        return JsonUtil.getJson(map);
    }

    //commit by 2019-1-15
}
