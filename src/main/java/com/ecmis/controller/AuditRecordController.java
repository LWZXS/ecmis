package com.ecmis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.AuditRecord;
import com.ecmis.service.AuditRecordService;
import com.ecmis.utils.Constants;
import com.ecmis.utils.PageSupport;

@Controller
@RequestMapping(value="/auditRecord")
public class AuditRecordController {

	private Logger logger=Logger.getLogger(AuditRecordController.class);
	
	@Resource
	private AuditRecordService auditRecordService;
	
	@RequestMapping(value="/findByDocument.json")
	@ResponseBody
	public String findByDocument(@RequestParam(value = "documentId", required = true)Integer documentId, 
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "page", required = false) Integer page){
		if (rows == null) {
			rows = Constants.PAGE_SIZE;
		}
		if (page == null) {
			page = Constants.PAGE_INDEX;
		}
		
		PageSupport<AuditRecord> pageSupport = auditRecordService.findByDocument(documentId, page, rows);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());
		
		String json=JSON.toJSONString(map,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		
		return json;
	}
}
