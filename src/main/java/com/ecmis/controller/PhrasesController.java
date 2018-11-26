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
import com.ecmis.pojo.Phrases;
import com.ecmis.service.PhrasesService;
import com.ecmis.utils.CommonTreeBean;

@Controller
@RequestMapping(value="/phrases")
public class PhrasesController {

	private Logger logger=Logger.getLogger(PhrasesController.class);
	@Resource
	private PhrasesService phrasesService;
	
	@RequestMapping(value="/list.json")
	@ResponseBody
	public String list(){
		
		List<Phrases> list = phrasesService.findByCondition(null);
		
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		CommonTreeBean root=new CommonTreeBean(0, "常用词语", "open", null);
		List<CommonTreeBean> chirlds=new ArrayList<CommonTreeBean>();
		if(list!=null && list.size()>0){
			for (Phrases phrases : list) {
				CommonTreeBean chirld=new CommonTreeBean(phrases.getPhrasesId(), phrases.getPhrasesVal(), "close", null);
				chirlds.add(chirld);
			}
		}
		root.setChildren(chirlds);
		rootList.add(root);
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		
		return json;
	}
	
}
