package com.ecmis.controller;

import com.ecmis.pojo.FlowType;
import com.ecmis.service.FlowTypeService;
import com.ecmis.utils.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/flowType")
public class FlowTypeController {

    @Resource
    private FlowTypeService flowTypeService;

    @RequestMapping(value = "/getAllFlowType.json")
    @ResponseBody
    public String getAll(){
        List<FlowType> list = flowTypeService.findAll();
        return JsonUtil.getJson(list);
    }
}
