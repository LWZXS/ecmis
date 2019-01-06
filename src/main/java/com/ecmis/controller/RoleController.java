package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Department;
import com.ecmis.pojo.Role;
import com.ecmis.pojo.User;
import com.ecmis.service.RoleService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/role")
public class RoleController {
    private Logger logger=Logger.getLogger(RoleController.class);
    @Resource
    private RoleService roleService;

    @RequestMapping("/index.html")
    public String index(){
        return "admin/role/list";
    }

    @RequestMapping("/list.json")
    @ResponseBody
    public Object list(@RequestParam(value="roleName",required=false)String roleName,
                       @RequestParam(value="status",required=false)Integer status,
                       @RequestParam(value="page",required=false,defaultValue = "1")Integer page,
                       @RequestParam(value="rows",required=false,defaultValue = "10")Integer rows){
        //PageSupport<Department> pageSupport = roleService.findByDeptNameAndStatusAsPage(deptName, status, page, rows);
        PageSupport<Role> pageSupport = roleService.findByDeptNameAndStatusAsPage(roleName, status, page, rows);
        String json = JsonUtil.list2PageJson(pageSupport);
        return json;
    }

    @RequestMapping(value = "/add.json")
    @ResponseBody
    public Object add(Role role, HttpSession session){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        logger.debug("role:"+role);
        Map<String,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result","false");
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }
        if (role==null || role.getRoleName()==null || "".equals(role.getRoleName())){
            map.put("result","false");
            map.put("message","角色名不能为空!");
            return JsonUtil.getJson(map);
        }


        if (role.getStatus()==null|| role.getStatus()==0){
            role.setStatus(1);
        }
        int count =0;
        String msg="增加角色";
        if (role.getRoleId()!=null && role.getRoleId()!=0){
            role.setModifuUser(currentLoginUser.getUserId());
            count=roleService.update(role);
            msg="修改角色";
        }else {
            if (roleService.count(role.getRoleName(),null)>0){
                map.put("result","false");
                map.put("message","角色名已经存在!");
                return JsonUtil.getJson(map);
            }
            role.setCreationUser(currentLoginUser.getUserId());
            count= roleService.add(role);
        }
        if (count>0){
            map.put("result","true");
            map.put("message",msg+"成功!");
        }else {
            map.put("result","false");
            map.put("message",msg+"失败!");
        }
        return JsonUtil.getJson(map);
    }

    @ResponseBody
    @RequestMapping(value = "/getMaxSortNumber.json")
    public Object getMaxSortNumber(){
        int maxSortNumber = roleService.findMaxSortNumber();
        Map<String,Object> map=new HashMap<>();
        map.put("maxSortNumber",maxSortNumber);
        return JsonUtil.getJson(map);
    }

    /**
     * 删除
     * @param session
     * @param roleId
     * @return
     */
    @RequestMapping(value = "/delete.json")
    @ResponseBody
    public String delete(HttpSession session,@RequestParam(value = "roleId") Integer roleId){
        User user = (User) session.getAttribute(Constants.LOGIN_USER);

        Map<String ,Object> map=new HashMap<>();

        if (user==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }
        try {
            int count = roleService.delete(user.getUserId(), roleId);
            if (count>0){
                //成功
                map.put("result",true);
                map.put("message","删除成功!");

            }else {
                map.put("result",false);
                map.put("message","删除失败!");
            }
        }catch (Exception e){
            map.put("result",false);
            map.put("message",e.getMessage());
        }
        return JsonUtil.getJson(map);

    }



    @RequestMapping(value = "/lock.json")
    @ResponseBody
    public Object lock(@RequestParam(value = "roleId") Integer roleId,HttpSession session){
        User user = (User) session.getAttribute(Constants.LOGIN_USER);

        Map<String ,Object> map=new HashMap<>();
        if (user==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return JsonUtil.getJson(map);
        }

        try {
            int count = roleService.updateStatus(user.getUserId(), roleId, 2);
            if (count>0){
                map.put("result",true);
                map.put("message","锁定成功!");
            }else {
                map.put("result",false);
                map.put("message","锁定失败!");
            }
        }catch (Exception e){
            map.put("result",false);
            map.put("message",e.getMessage());
        }
        return JsonUtil.getJson(map);
    }

    @RequestMapping(value = "/easyUiTree.json")
    @ResponseBody
    public Object getAllRoles(){
        List<Role> list = roleService.findAll();
        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();

        //集合无数据，提示无数据
        CommonTreeBean defaultBean=new CommonTreeBean(0, "请选择", "open", null);
        rootList.add(defaultBean);
        if(list!=null && list.size()>0){
            for (Role role : list) {
                CommonTreeBean cb=new CommonTreeBean(role.getRoleId(), role.getRoleName(), "close", null);
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
        List<Role> list = roleService.findAll();
        //根节点
        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();

        //杆
        CommonTreeBean defaultBean=new CommonTreeBean(0, "角色列表", "open", null);
        Map<String,Object> attributesLevel1=new HashMap<String, Object>();
        attributesLevel1.put("isParent",true);
        rootList.add(defaultBean);
        List<CommonTreeBean> childList=new ArrayList<CommonTreeBean>();
        defaultBean.setChildren(childList);
        defaultBean.setAttributes(attributesLevel1);
        //rootList.add(defaultBean);
        if(list!=null && list.size()>0){
            for (Role role : list) {
                if ("系统管理员".equals(role.getRoleName())){
                    continue;
                }
                //枝
                CommonTreeBean cb=new CommonTreeBean(role.getRoleId(), role.getRoleName(), "close", null);
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
}
