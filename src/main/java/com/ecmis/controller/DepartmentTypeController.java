package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Department;
import com.ecmis.pojo.DepartmentType;
import com.ecmis.service.DepartmentTypeService;
import com.ecmis.utils.CommonTreeBean;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/deptType")
public class DepartmentTypeController {
    private Logger logger=Logger.getLogger(DepartmentTypeController.class);
    @Resource
    private DepartmentTypeService departmentTypeService;

    @RequestMapping(value = "/easyUiTree.json")
    @ResponseBody
    public String getListByEasyUiTree(){
        List<DepartmentType> list = departmentTypeService.findAll();

        List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
        CommonTreeBean defaultBean=new CommonTreeBean(0, "请选择", "open", null);
        rootList.add(defaultBean);
        if(list!=null && list.size()>0){
            for (DepartmentType deptType : list) {
                CommonTreeBean cb=new CommonTreeBean(deptType.getDeptTypeId(), deptType.getDeptTypeName(), "close", null);
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
}
