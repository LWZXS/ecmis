package com.ecmis.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Company;
import com.ecmis.service.CompanyService;
import com.ecmis.utils.CommonTreeBean;

@Controller
@RequestMapping(value="/company")
public class CompanyController {

	private Logger logger=Logger.getLogger(CompanyController.class);
	@Resource
	private CompanyService companyService;
	
	@RequestMapping(value="/findAll4Select")
	@ResponseBody
	public String findAll(){
		List<Company> list = companyService.findAll();
		
		String json=objects2Json(list);
		
		return json;
	}
	
	/**
	 * 把一个集合转换面JEasyUI的Json
	 * @param list 
	 * @return JSON
	 */
	public String objects2Json(List<Company> list){
		
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();

		CommonTreeBean defaultBean=new CommonTreeBean(0, "请选择", "open", null);
		rootList.add(defaultBean);
		if(list!=null && list.size()>0){
			for (Company company : list) {
				CommonTreeBean cb=new CommonTreeBean(company.getCompanyId(), company.getCompanyName(), "close", null);
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
	
	/**
	 * 把一个集合转换面JEasyUI的TreeJson
	 * @param list 
	 * @return JSON
	 */
	public String objects2TreeJson(List<Company> list,String rootName){
		
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		CommonTreeBean defaultBean=new CommonTreeBean(0, "请选择", "open", null);
		rootList.add(defaultBean);
		if(list!=null && list.size()>0){
			List<CommonTreeBean> chirlds=new ArrayList<CommonTreeBean>();
			for (Company company : list) {
				CommonTreeBean cb=new CommonTreeBean(company.getCompanyId(), company.getCompanyName(), "close", null);
				chirlds.add(cb);
			}
			CommonTreeBean root=new CommonTreeBean(0, rootName, "open", chirlds);
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
