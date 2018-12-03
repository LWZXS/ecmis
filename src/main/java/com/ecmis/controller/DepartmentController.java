package com.ecmis.controller;

import com.ecmis.pojo.Department;
import com.ecmis.service.DepartmentService;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping(value="/dept")
public class DepartmentController {

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
}
