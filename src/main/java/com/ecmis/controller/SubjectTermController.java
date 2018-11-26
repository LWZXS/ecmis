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
import com.ecmis.pojo.SubjectTerm;
import com.ecmis.service.SubjectTermService;
import com.ecmis.utils.CommonTreeBean;

@Controller
@RequestMapping(value="/subjectTerm")
public class SubjectTermController {
	private Logger logger=Logger.getLogger(SubjectTermController.class);
	@Resource
	private SubjectTermService subjectTermService;

	@RequestMapping(value="/findAll")
	@ResponseBody
	public String findAll(){
		//调用Service查询
		List<SubjectTerm> list = subjectTermService.findAll();
		//tree根集合
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		//节点集合
		List<CommonTreeBean> tree=new ArrayList<CommonTreeBean>();
		//转换
		if(list!=null && list.size()>0){
			for (SubjectTerm subjectTerm : list) {
				CommonTreeBean bean=new CommonTreeBean(subjectTerm.getSubjectTermId(), subjectTerm.getSubjectTermName(), "close", null);
				tree.add(bean);
			}
				
		}
		//json根
		CommonTreeBean root=new CommonTreeBean(0, "主题词", "open", tree);
		rootList.add(root);
		
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		
		return json;
	}
	
}
