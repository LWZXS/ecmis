package com.ecmis.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class JsonUtil<T> {

	/**
	 * 把一个集合转换面JEasyUI的TreeJson
	 * @param list 
	 * @return JSON
	 */
	public String objects2Json(List<T> list,String rootName){
		
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		if(list!=null && list.size()>0){
			CommonTreeBean root=new CommonTreeBean(0, rootName, "open", null);
			List<CommonTreeBean> chirlds=new ArrayList<CommonTreeBean>();
			for (T t : list) {
				
			}
			
		}else{
			//集合无数据，提示无数据
			
		}
		
		
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		
		return json;
	}
	
	public static String list2PageJson(PageSupport pageSupport){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());
		
		String json=JSON.toJSONString(map,
				SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse,
				SerializerFeature.PrettyFormat);
		
		return json;
	}
	
}
