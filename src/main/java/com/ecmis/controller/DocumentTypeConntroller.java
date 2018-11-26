package com.ecmis.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.DocumentType;
import com.ecmis.pojo.User;
import com.ecmis.service.DocumentTypeService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.Constants;
import com.ecmis.utils.StringUtils;

@Controller
@RequestMapping(value="/documentType")
public class DocumentTypeConntroller {

	private Logger logger=Logger.getLogger(DocumentTypeConntroller.class);
	@Resource
	private DocumentTypeService documentTypeService;
	
	@RequestMapping(value="/findAll")
	@ResponseBody
	public String findAll(@RequestParam(required=false)String param){
		List<DocumentType> list = null;
		if(StringUtils.isNullOrEmpty(param)){
			list=documentTypeService.findAll();
			
		}else if(StringUtils.isInt(param)){
			list=new ArrayList<DocumentType>();
			DocumentType documentType = documentTypeService.findById(StringUtils.str2Integer(param));
			list.add(documentType);
		}else{
			list=documentTypeService.findLikeName(param);
		}
		
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		CommonTreeBean root=new CommonTreeBean(0, "文件类型", "open", null);
		List<CommonTreeBean> level1CTBs=new ArrayList<CommonTreeBean>();
		if(list!=null && list.size()>0){
			for (DocumentType chirldTypeLevel1 : list) {
				//1级
				CommonTreeBean level1CTB=new CommonTreeBean(chirldTypeLevel1.getDocTypeId(), chirldTypeLevel1.getDocTypeName(), "open", null);
				Map<String,String> attributes=new HashMap<String, String>();
				attributes.put("parentId", chirldTypeLevel1.getParentTypeId()==null?"":chirldTypeLevel1.getParentTypeId()+"");
				attributes.put("docName", chirldTypeLevel1.getDocName());
				attributes.put("isParent", "true");
				level1CTB.setAttributes(attributes);
				if(chirldTypeLevel1.getChildren()!=null && chirldTypeLevel1.getChildren().size()>0){
					List<CommonTreeBean> level2CTBs=new ArrayList<CommonTreeBean>();
					for (DocumentType chirldTypeLevel2 : chirldTypeLevel1.getChildren()) {
						//2级
						CommonTreeBean level2CTB=new CommonTreeBean(chirldTypeLevel2.getDocTypeId(), chirldTypeLevel2.getDocTypeName(), "closed", null);
						Map<String,String> chirldAttributes=new HashMap<String, String>();
						chirldAttributes.put("parentId", chirldTypeLevel2.getParentTypeId()==null?"":chirldTypeLevel2.getParentTypeId()+"");
						chirldAttributes.put("docName", chirldTypeLevel2.getDocName());
						chirldAttributes.put("isParent", "true");
						level2CTB.setAttributes(chirldAttributes);
						if(chirldTypeLevel2.getChildren()!=null && chirldTypeLevel2.getChildren().size()>0){
							List<CommonTreeBean> level3CTBs=new ArrayList<CommonTreeBean>();
							for (DocumentType chirldTypeLevel3 : chirldTypeLevel2.getChildren()) {
								//3级
								CommonTreeBean level3CTB=new CommonTreeBean(chirldTypeLevel3.getDocTypeId(), chirldTypeLevel3.getDocTypeName(), "closed", null);
								//属性
								Map<String,String> chirldAttributes3=new HashMap<String, String>();
								chirldAttributes3.put("parentId", chirldTypeLevel3.getParentTypeId()==null?"":chirldTypeLevel3.getParentTypeId()+"");
								chirldAttributes3.put("docName", chirldTypeLevel3.getDocName());
								chirldAttributes3.put("isParent", "true");
								level3CTB.setAttributes(chirldAttributes3);
								
								level3CTBs.add(level3CTB);
								//4级
								List<CommonTreeBean> level4CTBs=new ArrayList<CommonTreeBean>();
								if(chirldTypeLevel3.getChildren()!=null && chirldTypeLevel3.getChildren().size()>0){
									
									for (DocumentType chirldTypeLevel4 : chirldTypeLevel3.getChildren()) {
										CommonTreeBean level4CTB=new CommonTreeBean(chirldTypeLevel4.getDocTypeId(), chirldTypeLevel4.getDocTypeName(), "close", null);
										Map<String,String> chirldAttributes4=new HashMap<String, String>();
										chirldAttributes4.put("docName", chirldTypeLevel4.getDocName());
										level4CTB.setAttributes(chirldAttributes4);
										level4CTBs.add(level4CTB);
									}
								}else{
									CommonTreeBean level4CTB=new CommonTreeBean(null, "无", "close", null);
									level4CTBs.add(level4CTB);
								}
								level3CTB.setChildren(level4CTBs);
							}
							level2CTB.setChildren(level3CTBs);
						}
						level2CTBs.add(level2CTB);
					}
					level1CTB.setChildren(level2CTBs);
				}
				level1CTBs.add(level1CTB);
			}
			
		}
		root.setChildren(level1CTBs);
		rootList.add(root);
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse,
				SerializerFeature.PrettyFormat);
		logger.debug(json);
		
		return json;
	}
	
	//确定使用哪一个Word文档，接收文件名
	@RequestMapping(value="/putWordPath")
	@ResponseBody
	public String putWordPath(@RequestParam(value="docName")String docName,HttpSession session){
		
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		if(user==null){
			return "{\"result\":\"notLogin\"}";
		}
		
		
		String path = session.getServletContext().getRealPath("/statics/file/word");
		
		String filePath=path+File.separator+docName;
		session.setAttribute("filePath", filePath);
		logger.debug("filePath:"+filePath);
		return "{\"result\":\"success\"}";
		
	}
	//确定使用哪一个Word文档，接收文件名
	@RequestMapping(value="/putModifyWordPath")
	@ResponseBody
	public String putModifyWordPath(@RequestParam(value="docName")String docName,
			@RequestParam(value="documentId")Integer documentId,
			@RequestParam(value="mainBody")String mainBody,
			@RequestParam(value="docTypeId")Integer docTypeId,
			@RequestParam(value="selectDocTypeId")Integer selectDocTypeId,
			HttpSession session,HttpServletRequest request){
		
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		if(user==null){
			return "{\"result\":\"notLogin\"}";
		}
		
		String path = null;
		String filePath=null;
		String fileUrl =null;
		//如果已经有这个文档了，直接使用
		if(mainBody!=null && !"".equals(mainBody) && docTypeId!=null && docTypeId.equals(selectDocTypeId)){
			//File.separator+"statics"+File.separator+"file"
			//使用卓正
			path=session.getServletContext().getRealPath(File.separator+"statics"+File.separator+"file");
			filePath=path+File.separator+mainBody;
			//使用weboffice
			fileUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/statics/file/"+mainBody;
		
		}else{
			//使用卓正
			path = session.getServletContext().getRealPath(File.separator+"statics"+File.separator+"file"+File.separator+"word");
			filePath=path+File.separator+docName;
			//使用weboffice
			fileUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/statics/file/word/"+docName;
		}
		//使用卓正
		session.setAttribute("filePath", filePath);
		//使用weboffice
		session.setAttribute("fileUrl", fileUrl);
		
		session.setAttribute("mainBody", mainBody);
		session.setAttribute("documentId", documentId);
		
		logger.debug("filePath:"+filePath);
		return "{\"result\":\"success\"}";
		
	}
	
	
	//确定使用哪一个Word文档，接收文件名   加载正文
	@RequestMapping(value="/putTodoWordPath")
	public String selectTodoWordPath(@RequestParam(value="mainBody")String mainBody,
			@RequestParam(value="opr")String opr,
			HttpSession session,HttpServletRequest request){
		
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		if(user==null){
			return "user/login.html?msg=请先登录";
		}
		
		String path = session.getServletContext().getRealPath(File.separator+"statics"+File.separator+"file");
		File file=new File(mainBody);
		String filePath=path+File.separator+file.getName();
		
		File checkFile=new File(filePath);
		if(checkFile.exists()){
			request.setAttribute("mainBody", mainBody);
			request.setAttribute("opr", opr);
			logger.debug("mainBody:-----------------------"+filePath);
			logger.debug("mainBody:-----------------------"+mainBody);
			//return "document/inner/todoword";
			if(opr.equals("read")){
				return "document/inner/viewmainbody";
			}else{
				return "document/inner/modifydoc";
			}
		}else{
			return "document/inner/notfile";
		}
		
	}
	//确定使用哪一个Word文档，接收文件名   加载正文
	@RequestMapping(value="/putModifyPath")
	public String selectModifyPath(@RequestParam(value="mainBody")String mainBody,
			@RequestParam(value="opr")String opr,
			HttpSession session,HttpServletRequest request){
		
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		if(user==null){
			return "user/login.html?msg=请先登录";
		}
		
		String path = session.getServletContext().getRealPath(File.separator+"statics"+File.separator+"file");
		File file=new File(mainBody);
		String filePath=path+File.separator+file.getName();
		
		//判断文件是否存在
		File checkFile=new File(filePath);
		if(checkFile.exists()){
			request.setAttribute("mainBody", mainBody);
			request.setAttribute("opr", opr);
			logger.debug("mainBody:-----------------------"+filePath);
			logger.debug("mainBody:-----------------------"+mainBody);
			//return "document/inner/todoword";
			return "document/inner/viewmainbody";
		}else{
			return "document/inner/notfile";
		}
		
	}
	
}
