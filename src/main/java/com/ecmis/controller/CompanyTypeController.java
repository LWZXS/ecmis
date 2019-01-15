package com.ecmis.controller;

import com.ecmis.pojo.CompanyType;
import com.ecmis.service.CompanyTypeService;
import com.ecmis.utils.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value="/companyType")
public class CompanyTypeController {

	@Resource
	private CompanyTypeService companyTypeService;
	@RequestMapping(value = "/getAll.json")
	public String getAll(){
		List<CompanyType> companyTypes = companyTypeService.findAll();
		String json = JsonUtil.getJson(companyTypes);
		return json;
	}
}
