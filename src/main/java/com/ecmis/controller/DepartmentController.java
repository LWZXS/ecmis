package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Company;
import com.ecmis.pojo.Department;
import com.ecmis.service.DepartmentService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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
    public Object getDepartmentsAsEasyUITree(){
        List<Department> list = departmentService.findAll();
        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
        if(list!=null && list.size()>0){
            for (Department dept : list) {
                CommonTreeBean cb=new CommonTreeBean(dept.getDeptId(), dept.getDeptName(), "close", null);
                rootList.add(cb);
            }
        }else{
            //集合无数据，提示无数据
            CommonTreeBean root=new CommonTreeBean(0, "暂无数据", "open", null);
            rootList.add(root);
        }

        String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
                SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
                SerializerFeature.PrettyFormat);
        logger.debug(json);
        return json;
    }
}
