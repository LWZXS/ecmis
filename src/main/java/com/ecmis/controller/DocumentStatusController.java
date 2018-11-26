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
import com.ecmis.pojo.DocumentStatus;
import com.ecmis.service.DocumentStatusService;
import com.ecmis.utils.CommonComboboxBean;

@Controller
@RequestMapping(value="/documentStatus")
public class DocumentStatusController {
	private Logger logger=Logger.getLogger(DocumentStatusController.class);
	@Resource
	private DocumentStatusService documentStatusService;
	
	@RequestMapping(value="/list")
	@ResponseBody
	public String list(){
		//查询所有状态
		List<DocumentStatus> list = documentStatusService.getAll(1);
		String json=JSON.toJSONString(list,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		return json;
	}
	@RequestMapping(value="/docStatusList.json")
	@ResponseBody
	public String findAll(){
		//查询所有状态
		List<DocumentStatus> list = documentStatusService.getAll(1);
		
		List<CommonComboboxBean> comBoboxList=new ArrayList<CommonComboboxBean>();
		
		CommonComboboxBean defaultEle=new CommonComboboxBean("全部", "全部",true);
		comBoboxList.add(defaultEle);
		for (DocumentStatus documentStatus : list) {
			CommonComboboxBean ccbb=new CommonComboboxBean(documentStatus.getDocStatusId(), documentStatus.getDocStatusName());
			comBoboxList.add(ccbb);
		}
		
		String json=JSON.toJSONString(comBoboxList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		return json;
	}
	
}
