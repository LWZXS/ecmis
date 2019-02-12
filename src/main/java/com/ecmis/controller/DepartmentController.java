package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Department;
import com.ecmis.pojo.User;
import com.ecmis.service.DepartmentService;
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
@RequestMapping(value="/dept")
public class DepartmentController {
    private Logger logger=Logger.getLogger(DepartmentController.class);
    @Resource
    private DepartmentService departmentService;

    @RequestMapping(value = "/index.html")
    public String index(){
        return "admin/dept/list";
    }

    @RequestMapping("/list.json")
    @ResponseBody
    public Object list(@RequestParam(value="deptName",required=false)String deptName,
                       @RequestParam(value="status",required=false)Integer status,
                       @RequestParam(value="page",required=false,defaultValue = "1")Integer page,
                       @RequestParam(value="rows",required=false,defaultValue = "10")Integer rows){
        PageSupport<Department> pageSupport = departmentService.findByDeptNameAndStatusAsPage(deptName, status, page, rows);
        String json = JsonUtil.list2PageJson(pageSupport);
        return json;
    }

    @RequestMapping(value = "/easyUiTree.json")
    @ResponseBody
    public Object getDepartmentsAsEasyUITree(@RequestParam(value = "companyId",required = false) Integer companyId){
        List<Department> list = departmentService.findByCompanyId(companyId);
        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
       /* CommonTreeBean defaultBean=new CommonTreeBean(0, "请选择", "open", null);
        rootList.add(defaultBean);*/
        if(list!=null && list.size()>0){
            for (Department dept : list) {
                CommonTreeBean cb=new CommonTreeBean(dept.getDeptId(), dept.getDeptName(), "close", null);
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

    @RequestMapping(value = "/getSortNumber.json")
    @ResponseBody
    public Object getSortNumber(@RequestParam(value = "parentId") Integer parentId){
        Map<String ,Object> map=new HashMap<>();
        int sortNumber = departmentService.findSortNumberByParentId(parentId);
        map.put("sortNumber",sortNumber);

        String json=JSON.toJSONString(map,SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
                SerializerFeature.PrettyFormat);
        logger.debug(json);
        return json;
    }

    @RequestMapping(value = "/add.do")
    @ResponseBody
    public Object add(Department department, HttpSession session){
        User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
        logger.debug("部门:"+department);
        Map<String,Object> map=new HashMap<>();
        if (currentLoginUser==null){
            map.put("result",true);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return getJson(map);
        }
       /* if (department.getParentId()==null){
            map.put("result","false");
            map.put("message","请选择上级部门!");
            return getJson(map);
        }*/
        if (department.getCompanyId()==null){
            map.put("result",false);
            map.put("message","请选择所属公司!");
            return getJson(map);
        }
        if (department.getDeptTypeId()==null){
            map.put("result",false);
            map.put("message","请选择组织类型!");
            return getJson(map);
        }
        if (department.getStatus()==null || department.getStatus()==0){
            department.setStatus(1);
        }
        int count=0;
        if (department.getStatus()==null){
            department.setStatus(1);
        }
        if (department.getDeptId()==null){
            department.setCreateUser(currentLoginUser.getUserId());
            count = departmentService.add(department);
        }else {
            department.setModifyUser(currentLoginUser.getUserId());
            count = departmentService.update(department);
        }

        if (count>0){
            map.put("result",true);
            map.put("message","操作成功!");
        }else {
            map.put("result",false);
            map.put("message","操作失败!");
        }
        return getJson(map);
    }

    public String getJson(Object object){
        String json=JSON.toJSONString(object,SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
                SerializerFeature.PrettyFormat);
        logger.debug(json);
        return json;
    }


    /**
     * 删除
     * @param session
     * @param deptId
     * @return
     */
    @RequestMapping(value = "/delete.json")
    @ResponseBody
    public String delete(HttpSession session,@RequestParam(value = "deptId") Integer deptId){
        User user = (User) session.getAttribute(Constants.LOGIN_USER);
        Map<String ,Object> map=new HashMap<>();

        if (user==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return getJson(map);
        }
        try {
            int count = departmentService.delete(user.getUserId(), deptId);
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
        return getJson(map);

    }

    @RequestMapping(value = "/lock.json")
    @ResponseBody
    public Object lock(@RequestParam(value = "deptId") Integer deptId,HttpSession session){
        User user = (User) session.getAttribute(Constants.LOGIN_USER);

        Map<String ,Object> map=new HashMap<>();
        if (user==null){
            map.put("result",false);
            map.put("message","您还没有登录,或登录信息过期,请先登录!");
            return getJson(map);
        }
        try {
            int count = departmentService.updateStatus(user.getUserId(), deptId, 2);
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
        return getJson(map);
    }
}
