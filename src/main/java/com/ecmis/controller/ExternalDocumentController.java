package com.ecmis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/document/external")
@Controller
public class ExternalDocumentController {

    /**
     * 外部文档 主页
     * @return
     */
    @RequestMapping(value = "/index.html")
    public String external(){
        return "document/external/index";
    }
    /**
     * 增加外部文档
     * @return
     */
    @RequestMapping(value = "/add.html")
    public String add(){
        return "document/external/add";
    }




}
