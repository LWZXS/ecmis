package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Company;
import com.ecmis.pojo.Document;
import com.ecmis.pojo.Project;
import com.ecmis.pojo.User;
import com.ecmis.service.CompanyService;
import com.ecmis.service.DocumentService;
import com.ecmis.utils.Constants;
import com.ecmis.utils.PageSupport;
import com.ecmis.utils.RandomUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * 文档
 */
@Controller
@RequestMapping(value = "/document")
public class DocumentController {
	private Logger logger = Logger.getLogger(DocumentController.class);
	@Resource
	private DocumentService documentService;

	@Resource
	private CompanyService companyService;

	/**
	 * 主页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index.html")
	public String index() {
		return "document/inner/index";
	}

	/**
	 * 内部文档主页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/inner.html")
	public String innerIndex() {
		return "document/inner/index";

	}

	/**
	 * 草稿
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/draft.html")
	public String draft(HttpServletRequest request) {
		// request.setAttribute("status", 2);
		return "document/inner/draft";
	}

	/**
	 * 待归档
	 * 待归档文件
	 * @return
	 */
	@RequestMapping(value = "/pending.html")
	public String pending() {
		return "document/inner/pending";

	}

	/**
	 * 已发文件
	 * @return
	 */
	@RequestMapping(value = "/issued.html")
	public String issued() {
		return "document/inner/issued";

	}

	/**
	 * 已办
	 * @return
	 */
	@RequestMapping(value = "/havetodo.html")
	public String haveToto() {
		return "document/inner/haveTodo";

	}

	/**
	 * 接收文档
	 * @return
	 */
	@RequestMapping(value = "/receive.html")
	public String receive() {
		return "document/inner/receive";

	}

	/**
	 * 归档文档
	 * @return
	 */
	@RequestMapping(value = "/pigeonhole/index.html")
	public String pigeonholeIndex() {
		return "document/pigeonhole/index";

	}

	@RequestMapping(value = "/system.html")
	public String systemIndex() {
		return "document/system/index";

	}

	@RequestMapping(value = "/add.html")
	public String add() {

		return "document/inner/fileadd";
	}

	/**
	 * 代办
	 * 
	 * @return
	 */
	@RequestMapping(value = "/todo.html")
	public String todo(HttpSession session, HttpServletRequest request) {
		// 把个人代办的查询
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		request.removeAttribute("status");
		if (user == null) {
			return "redirect:/user/login.html?msg=P	lease_Login!";
		}

		return "document/inner/index";
	}

	/**
	 * 通过Id查询文档 Rest风格
	 * 
	 * @param documentId
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/view/{documentId}/{opr}")
	public String findById(
			@PathVariable(value = "documentId") Integer documentId,
			@PathVariable(value = "opr") String opr,
			Model model) {
		Document document = documentService.findById(documentId);
		model.addAttribute("doc", document);
		model.addAttribute("opr", opr);
		logger.debug("document:" + document);
		logger.debug("opr:" + opr);
		
		if(document.getDocumentStatus().getDocStatusId()==8 || document.getDocumentStatus().getDocStatusId()==1){
			List<Company> companys = companyService.findAll();
			model.addAttribute("companys", companys);
			return "document/inner/modifyFile";
		}
		return "document/inner/documentDetail";
	}
	
	@RequestMapping(value = "/issued/{documentId}/{opr}")
	public String viewIssued(
			@PathVariable(value = "documentId") Integer documentId,
			@PathVariable(value = "opr") String opr,
			Model model) {
		Document document = documentService.findById(documentId);
		model.addAttribute("doc", document);
		model.addAttribute("opr", opr);
		logger.debug("document:" + document);
		
		return "document/inner/issuedView";
	}
	@RequestMapping(value = "/recevie/{documentId}/{opr}")
	public String viewRecevie(
			@PathVariable(value = "documentId") Integer documentId,
			@PathVariable(value = "opr") String opr,
			Model model) {
		Document document = documentService.findById(documentId);
		model.addAttribute("doc", document);
		model.addAttribute("opr", opr);
		logger.debug("document:" + document);
		
		return "document/inner/recevieView";
	}
	@RequestMapping(value = "/haveTodo/{documentId}/{opr}")
	public String haveTodoRecevie(
			@PathVariable(value = "documentId") Integer documentId,
			@PathVariable(value = "opr") String opr,
			Model model) {
		Document document = documentService.findById(documentId);
		model.addAttribute("doc", document);
		model.addAttribute("opr", opr);
		logger.debug("document:" + document);
		
		return "document/inner/haveTodoView";
	}
	
	/**
	 * 保存文档
	 * 
	 * @param document
	 * @param jointTrials
	 * @param publishRanges
	 * @param resp
	 * @param request
	 * @param session
	 * @param attach
	 * @return
	 */
	@RequestMapping(value = "/add.do")
	@ResponseBody
	public String doAdd(Document document,
			@RequestParam(value = "jointTrials",required=false) Integer[] jointTrials,
			@RequestParam(value = "publishRanges",required=false) Integer[] publishRanges,
			HttpServletResponse resp, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile attach) {
		User currentLoginUser = (User) session .getAttribute(Constants.LOGIN_USER);

		logger.debug(document);
		if (currentLoginUser == null) {
			return "notLogin";
		}
		Project currentLoginProject = (Project) session
				.getAttribute(Constants.LOGIN_USER_PROJECT);
		if (currentLoginProject == null) {
			return "notProject";
		}
		// System.out.println(document);
		// resp.sendRedirect(location)
		if (!attach.isEmpty()) {
			// 有文件上传
			String path = request
					.getSession()
					.getServletContext()
					.getRealPath(Constants.INNER_ATTACHMENT_PATH);
			String oldFileName = attach.getOriginalFilename();// 原文件名
			String prefix = FilenameUtils.getExtension(oldFileName);// 原文件后缀

			int filesize = Constants.MAX_FILE_UPLOAD_SIZE;
			if (attach.getSize() > filesize) {// 上传大小不得超过 500k
				// request.setAttribute("uploadFileError", " * 上传大小不得超过 2M");
				// return
				// "{\"result\":\"上传大小不得超过 "+(Constants.MAX_FILE_UPLOAD_SIZE/1024/1024)+"M\"}";
				return "上传大小不得超过 "
						+ (Constants.MAX_FILE_UPLOAD_SIZE / 1024 / 1024) + "M";
			} else if (prefix.equalsIgnoreCase("doc")
					|| prefix.equalsIgnoreCase("docx")) {
				String fileName = System.currentTimeMillis() + ""
						+ RandomUtils.getNextInt() + "." + prefix;

				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {

					// 保存
					attach.transferTo(targetFile);
					// 保存文件名
					document.setAttachment(fileName);

				} catch (Exception e) {
					e.printStackTrace();
					// request.setAttribute("uploadFileError", " * 上传失败！");
					// return "{\"result\":\"上传失败！\"}";
					return "上传失败！";
				}
				// idPicPath = path+File.separator+fileName;
			} else {
				// 上传图片格式不正确
				// request.setAttribute("uploadFileError",
				// " * 上传格式不正确，请上传doc或docx文件");
				// return "{\"result\":\"上传格式不正确，请上传doc或docx文件\"}";
				return "上传格式不正确，请上传doc或docx文件";
			}
		}
		// 保存
		document.setCreationUser(currentLoginUser.getUserId());
		//document.setDocStatusId(1);
		// document.setStatus(1);
		document.setProjectId(currentLoginProject.getProjectId());

		int count = documentService.add(document, jointTrials, publishRanges,currentLoginUser);
		if (count > 0) {
			return "success";
		} else {
			return "fail";
		}
		// return "{\"result\":\"success\"}";
		// return "redirect:/document/todo.html";
		// return "test";
	}
	
	@RequestMapping(value = "/modify.do")
	@ResponseBody
	public String doModify(Document document,
			@RequestParam(value = "jointTrials",required=false) Integer[] jointTrials,
			@RequestParam(value = "publishRanges",required=false) Integer[] publishRanges,
			@RequestParam(value = "opr",required=false) String opr,
			HttpServletResponse resp, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile attach) {
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		
		
		
		logger.debug(request.getParameter("serviceNo"));
		
		logger.debug(document);
		if (currentLoginUser == null) {
			return "notLogin";
		}
		Project currentLoginProject = (Project) session
				.getAttribute(Constants.LOGIN_USER_PROJECT);
		if (currentLoginProject == null) {
			return "notProject";
		}
		String mainBody = (String) session.getAttribute("mainBody");
		/*
		if(mainBody==null){
			return "noMainBody";
		}*/
		
		// System.out.println(document);
		// resp.sendRedirect(location)
		if (!attach.isEmpty()) {
			// 有文件上传
			String path = request
					.getSession()
					.getServletContext()
					.getRealPath(Constants.INNER_ATTACHMENT_PATH);
			String oldFileName = attach.getOriginalFilename();// 原文件名
			String prefix = FilenameUtils.getExtension(oldFileName);// 原文件后缀
			
			int filesize = Constants.MAX_FILE_UPLOAD_SIZE;
			if (attach.getSize() > filesize) {// 上传大小不得超过 500k
				// request.setAttribute("uploadFileError", " * 上传大小不得超过 2M");
				// return
				// "{\"result\":\"上传大小不得超过 "+(Constants.MAX_FILE_UPLOAD_SIZE/1024/1024)+"M\"}";
				return "上传大小不得超过 "
				+ (Constants.MAX_FILE_UPLOAD_SIZE / 1024 / 1024) + "M";
			} else if (prefix.equalsIgnoreCase("doc")
					|| prefix.equalsIgnoreCase("docx")) {
				String fileName = System.currentTimeMillis() + ""
						+ RandomUtils.getNextInt() + "." + prefix;
				
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					
					// 保存
					attach.transferTo(targetFile);
					// 保存文件名
					document.setAttachment(fileName);
					
				} catch (Exception e) {
					e.printStackTrace();
					// request.setAttribute("uploadFileError", " * 上传失败！");
					// return "{\"result\":\"上传失败！\"}";
					return "上传失败！";
				}
				// idPicPath = path+File.separator+fileName;
			} else {
				// 上传图片格式不正确
				// request.setAttribute("uploadFileError",
				// " * 上传格式不正确，请上传doc或docx文件");
				// return "{\"result\":\"上传格式不正确，请上传doc或docx文件\"}";
				return "上传格式不正确，请上传doc或docx文件";
			}
		}
		// 保存原文编码
		//document.setCreationUser(currentLoginUser.getUserId());
		document.setDocStatusId(2);
		// document.setStatus(1);
		document.setProjectId(currentLoginProject.getProjectId());
		logger.debug(mainBody + "..................");
		//document.setMainBody(mainBody);
		
		document.setModifuUser(currentLoginUser.getUserId());
		document.setModifyDate(new Date());
		
		
		int count = 0;
		try {
			count = documentService.update(document, jointTrials, publishRanges,currentLoginUser,opr);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "错误--"+e.getMessage();
		}
		
		if (count > 0) {
			session.removeAttribute("mainBody");
			return "success";
		} else {
			return "fail";
		}
		// return "{\"result\":\"success\"}";
		// return "redirect:/document/todo.html";
		// return "test";
	}

	
	
	
	@RequestMapping(value = "/update.do")
	@ResponseBody
	public String doUpdate(Document document,
			@RequestParam(value = "jointTrials",required=false) Integer[] jointTrials,
			@RequestParam(value = "publishRanges",required=false) Integer[] publishRanges,
			@RequestParam(value = "phrasesVal") String phrasesVal,
			HttpServletResponse resp, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile attach) {
		
		//审核更新document对象
		/*
		 * 需修改的
		 * 文档名称
		 * 主题词
		 * 主送
		 * 分发人
		 * 备注
		 * 扫描件
		 * 修改人
		 * 修改日期
		 * 文档状态跟据情况做相应的修改
		 * 
		 * 审核意见
		 * 
		 * 
		 */
		
		User currentLoginUser = (User) session
				.getAttribute(Constants.LOGIN_USER);

		logger.debug(document);
		if (currentLoginUser == null) {
			return "notLogin";
		}
		
		if (!attach.isEmpty()) {
			// 有文件上传
			String path = request
					.getSession()
					.getServletContext()
					.getRealPath("statics" + File.separator + "file"+ File.separator +"scanningCopy");
			String oldFileName = attach.getOriginalFilename();// 原文件名
			String prefix = FilenameUtils.getExtension(oldFileName);// 原文件后缀

			int filesize = Constants.MAX_FILE_UPLOAD_SIZE;
			if (attach.getSize() > filesize) {// 上传大小不得超过 500k
				// request.setAttribute("uploadFileError", " * 上传大小不得超过 2M");
				// return
				// "{\"result\":\"上传大小不得超过 "+(Constants.MAX_FILE_UPLOAD_SIZE/1024/1024)+"M\"}";
				return "上传大小不得超过 "
						+ (Constants.MAX_FILE_UPLOAD_SIZE / 1024 / 1024) + "M";
			} else if (prefix.equalsIgnoreCase("bmp") || prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("jpge") || prefix.equalsIgnoreCase("png") || prefix.equalsIgnoreCase("gif")) {
				String fileName = System.currentTimeMillis() + "" + RandomUtils.getNextInt() + "." + prefix;
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					// 保存
					attach.transferTo(targetFile);
					// 保存文件名
					document.setScanningCopy(fileName);
				} catch (Exception e) {
					e.printStackTrace();
					return "上传失败！";
				}
			} else {
				return "上传格式不正确，请上传doc或docx文件";
			}
		}
		// 保存
		document.setModifuUser(currentLoginUser.getUserId());
		document.setModifyDate(new Date());

		int count = documentService.auditing(document, jointTrials, publishRanges, currentLoginUser, phrasesVal);
		if (count > 0) {
			session.removeAttribute("mainBody");
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/list")
	@ResponseBody
	public String list(
			@RequestParam(value = "startTime", required = false) Date startTime,
			@RequestParam(value = "endTime", required = false) Date endTime,
			@RequestParam(value = "docStatusId", required = false) Integer docStatusId,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "status", required = false) Integer status,
			HttpSession session) {
		logger.debug("startTime:" + startTime);
		logger.debug("endTime:" + endTime);
		logger.debug("docStatusId:" + docStatusId);
		logger.debug("rows:" + rows);
		logger.debug("page:" + page);
		User user = (User) session.getAttribute(Constants.LOGIN_USER);

		PageSupport<Document> pageSupport = documentService.findByCondition(
				user.getUserId(), docStatusId, status == null ? 1 : 2,
				startTime, endTime, page, rows);
		// 封装Map

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());

		String json = JSON.toJSONString(map,
				SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);

		return json;

	}

	
	
	/**
	 * 草稿
	 * @param startTime
	 * @param endTime
	 * @param rows
	 * @param page
	 * @param status
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/draft.json")
	@ResponseBody
	public String draft(
			@RequestParam(value = "startTime", required = false) Date startTime,
			@RequestParam(value = "endTime", required = false) Date endTime,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "status", required = false) Integer status,
			HttpSession session) {
		logger.debug("startTime:" + startTime);
		logger.debug("endTime:" + endTime);
		logger.debug("rows:" + rows);
		logger.debug("page:" + page);
		User user = (User) session.getAttribute(Constants.LOGIN_USER);

		if (rows == null) {
			rows = Constants.PAGE_SIZE;
		}
		if (page == null) {
			page = Constants.PAGE_INDEX;
		}

		PageSupport<Document> pageSupport = documentService.findDraft(
				user.getUserId(), status == null ? 1 : 2, startTime, endTime,
				page, rows);
		// 封装Map

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());

		String json = JSON.toJSONString(map,
				SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);

		return json;

	}

	/**
	 * 已办
	 * @param startTime
	 * @param endTime
	 * @param docStatusId
	 * @param rows
	 * @param page
	 * @param status
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/havetodo.json")
	@ResponseBody
	public String haveTodo(
			@RequestParam(value = "startTime", required = false) Date startTime,
			@RequestParam(value = "endTime", required = false) Date endTime,
			@RequestParam(value = "docStatusId", required = false) Integer docStatusId,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "status", required = false) Integer status,
			HttpSession session) {
		if (rows == null) {
			rows = Constants.PAGE_SIZE;
		}
		if (page == null) {
			page = Constants.PAGE_INDEX;
		}
		logger.debug("startTime:" + startTime);
		logger.debug("endTime:" + endTime);
		logger.debug("docStatusId:" + docStatusId);
		logger.debug("rows:" + rows);
		logger.debug("page:" + page);
		User user = (User) session.getAttribute(Constants.LOGIN_USER);

		PageSupport<Document> pageSupport = documentService.findByHaveTodo(
				user.getUserId(), docStatusId,
				startTime, startTime, page, rows);
		// 封装Map

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());

		String json = JSON.toJSONString(map,
				SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);

		return json;

	}

	
	/**
	 * 接收
	 * @param startTime
	 * @param endTime
	 * @param docStatusId
	 * @param rows
	 * @param page
	 * @param status
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/receive.json")
	@ResponseBody
	public String receive(
			@RequestParam(value = "startTime", required = false) Date startTime,
			@RequestParam(value = "endTime", required = false) Date endTime,
			@RequestParam(value = "docStatusId", required = false) Integer docStatusId,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "status", required = false) Integer status,
			HttpSession session) {
		if (rows == null) {
			rows = Constants.PAGE_SIZE;
		}
		if (page == null) {
			page = Constants.PAGE_INDEX;
		}
		if (docStatusId == null) {
			docStatusId = 5;
		}
		logger.debug("startTime:" + startTime);
		logger.debug("endTime:" + endTime);
		logger.debug("docStatusId:" + docStatusId);
		logger.debug("rows:" + rows);
		logger.debug("page:" + page);
		User user = (User) session.getAttribute(Constants.LOGIN_USER);

		PageSupport<Document> pageSupport = documentService.findPublishRange(
				user.getUserId(), docStatusId, status == null ? 1 : 2,
				startTime, endTime, page, rows);
		// 封装Map

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());

		String json = JSON.toJSONString(map,
				SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);

		return json;

	}
	@RequestMapping(value = "/issued.json")
	@ResponseBody
	public String issued(
			@RequestParam(value = "startTime", required = false) Date startTime,
			@RequestParam(value = "endTime", required = false) Date endTime,
			@RequestParam(value = "docStatusId", required = false) Integer docStatusId,
			@RequestParam(value = "docName", required = false) String documentName,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "page", required = false) Integer page,
			HttpSession session) {
		
		if (rows == null) {
			rows = Constants.PAGE_SIZE;
		}
		if (page == null) {
			page = Constants.PAGE_INDEX;
		}
		logger.debug("startTime:" + startTime);
		logger.debug("endTime:" + endTime);
		logger.debug("docStatusId:" + docStatusId);
		logger.debug("rows:" + rows);
		logger.debug("page:" + page);
		logger.debug("documentName:" + documentName);
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		
		PageSupport<Document> pageSupport = documentService.findIssued(startTime, endTime, documentName, docStatusId, page, rows, user);
		// 封装Map
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());
		
		String json = JSON.toJSONString(map,
				SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		
		return json;
		
	}

	/**
	 * 增加时选择文档
	 * @return
	 */
	@RequestMapping(value = "/selectWord")
	public String selectDocType(@RequestParam(value="oper",required=true)String oper,
			@RequestParam(value="flag",required=false)String flag,
			@RequestParam(value="docName",required=true)String docName,
			@RequestParam(value="mainBody",required=true)String mainBody,
			@RequestParam(value="type",required=false)String type,
			Model model) {
		if(docName.endsWith(".doc") || docName.endsWith(".docx")){
			flag="1";
			type="Word.Document";
		}else if(docName.endsWith(".xls") || docName.endsWith(".xlsx")){
			flag="2";
			type="Excel.Sheet";
		}else if(docName.endsWith(".ppt") || docName.endsWith(".pptx")){
			flag="3";
			type="PowerPoint.Show";
		}
		model.addAttribute("oper", "new");
		model.addAttribute("flag", flag);
		model.addAttribute("docName", docName);
		model.addAttribute("type", type);
		model.addAttribute("mainBody", mainBody);
		
		return "document/inner/fileadddoc";
	}

	
	/**
	 * 修改时选择文档
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/selectModifyWord")
	public String selectModifyDocType(@RequestParam(value="oper",required=true)String oper,
			@RequestParam(value="flag",required=false)String flag,
			@RequestParam(value="docName",required=true)String docName,
			@RequestParam(value="mainBody",required=true)String mainBody,
			@RequestParam(value="type",required=false)String type,
			@RequestParam(value="currentDocTypeId")Integer currentDocTypeId,
			Model model){
		model.addAttribute("currentDocTypeId", currentDocTypeId);
		
		if(docName.endsWith(".doc") || docName.endsWith(".docx")){
			flag="1";
			type="Word.Document";
		}else if(docName.endsWith(".xls") || docName.endsWith(".xlsx")){
			flag="2";
			type="Excel.Sheet";
		}else if(docName.endsWith(".ppt") || docName.endsWith(".pptx")){
			flag="3";
			type="PowerPoint.Show";
		}
		model.addAttribute("oper", "new");
		model.addAttribute("flag", flag);
		model.addAttribute("docName", docName);
		model.addAttribute("type", type);
		model.addAttribute("mainBody", mainBody);
		//使用卓正
		//return "document/inner/modifyword";
		//使用weboffice
		return "document/inner/modifydoc";
		
	}
	/**
	 * 新建时保存 正文
	 * 卓正Office
	 * @param request
	 * @param response
	 * @param session
	 * @return

	@RequestMapping(value = "/saveBody", method = RequestMethod.POST)
	public String saveBody(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		FileSaver fs = new FileSaver(request, response);
		String docName = request.getParameter("docName");
		Object mainBodyAttr = session.getAttribute("mainBody");
		String mainBody = null;
		if (mainBodyAttr == null) {
			mainBody = (RandomUtils.getNextInt() + "" + System
					.currentTimeMillis()) + docName;
			session.setAttribute("mainBody", mainBody);
		} else {
			mainBody = (String) session.getAttribute("mainBody");
		}

		logger.debug("docName:" + docName);
		logger.debug("mainBody:" + mainBody);
		//获得文件名
		File file=new File(mainBody);
		
		fs.saveToFile(request.getSession().getServletContext()
				.getRealPath(File.separator+"statics"+File.separator+"file")
				+ File.separator + file.getName());
		fs.close();
		// session.removeAttribute("mainBody");

		return null;
	}
	 */
	/**
	 * 修改，审批时保存  正文
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @return

	@RequestMapping(value = "/saveTodoBody", method = RequestMethod.POST)
	public String saveTodoBody(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		FileSaver fs = new FileSaver(request, response);
		String filePath = request.getParameter("filePath");

		logger.debug("filePath:" + filePath);

		fs.saveToFile(filePath);

		fs.close();

		return null;
	}
	 */

	/**
	 * 文件下载
	 * 
	 * @Description:
	 * @param fileName
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/download")
	public String downloadFile(@RequestParam("fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) {
		if (fileName != null) {
			String realPath = request.getServletContext().getRealPath(Constants.INNER_ATTACHMENT_PATH);
			File file = new File(realPath, fileName);
			if (file.exists()) {
				response.setContentType("application/force-download");// 设置强制下载不打开
				response.addHeader("Content-Disposition",
						"attachment;fileName=" + fileName);// 设置文件名
				byte[] buffer = new byte[1024];
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				try {
					fis = new FileInputStream(file);
					bis = new BufferedInputStream(fis);
					OutputStream os = response.getOutputStream();
					int i = bis.read(buffer);
					while (i != -1) {
						os.write(buffer, 0, i);
						i = bis.read(buffer);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (bis != null) {
							bis.close();
						}
						if (fis != null) {
							fis.close();
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return null;
	}

	// selectWord 未实现
	// @RequestMapping(value="/selectWord")
	// public @ResponseBody ModelAndView dwxx(String docName,HttpServletRequest
	// request,HttpSession session) {
	//
	// User user=(User)session.getAttribute(Constants.LOGIN_USER);
	// logger.info("执行bianji信息界面！！！          ");
	//
	// String filePath=(String)session.getAttribute(Constants.FILE_PATH);
	// System.out.print(filePath);// 查看filePath 的值
	//
	//
	// PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	// poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须
	// poCtrl1.setSaveFilePage("/saveBody");//如要保存文件，此行必须
	// poCtrl1.addCustomToolButton("保存", "saveMainBody()", 1);//添加自定义工具栏按钮
	//
	// //更改文件内容
	// String
	// outPath=session.getServletContext().getRealPath("/statics/file/temp");
	//
	// int rd=RandomUtils.getNextInt();
	// try {
	// //打开文件
	// FileInputStream in = new FileInputStream(new File(filePath));
	// /*
	// String templatePath = "D:\\word\\template.doc";
	// */
	// HWPFDocument doc = new HWPFDocument(in);
	// Range range = doc.getRange();
	// //把range范围内的${reportDate}替换为当前的日期
	// range.replaceText("${reportDate}", new
	// SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	// File file=new File(outPath+"/"+rd+".doc");
	// file.getParentFile().mkdirs();
	// OutputStream os = new FileOutputStream(file);
	// //把doc输出到输出流中
	// doc.write(os);
	// os.flush();
	// os.close();
	// in.close();
	//
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	//
	//
	//
	//
	//
	//
	// poCtrl1.setCaption(docName);//设置文档标题名称
	// //
	// poCtrl1.setTheme(ThemeType.Office2010);//poCtrl为PageOfficeCtrl对象，ThemeType为枚举类型
	//
	// //防止多个用户同时打开一个文档，设置并发控制
	// //poCtrl1.setTimeSlice(20);
	// //poCtrl1.webOpen("filePath",OpenModeType.docRevisionOnly,"打开文档的当前用户");
	//
	// //打开文件
	// poCtrl1.webOpen(outPath+"/"+rd+".doc", OpenModeType.docNormalEdit,
	// user.getUserName());
	// poCtrl1.setTagId("PageOfficeCtrl1"); //此行必须
	// ModelAndView modelandview = new ModelAndView();
	// modelandview.setViewName("bjxx");
	// modelandview.addObject(poCtrl1);
	//
	// return modelandview;
	// }

	@RequestMapping(value="/back.do")
	@ResponseBody
	public String back(@RequestParam(value="documentId")Integer documentId,
			@RequestParam(value="docStatusId")Integer docStatusId,
			@RequestParam(value="phrasesVal")String phrasesVal,
			HttpSession session){
		User  currentUser= (User) session.getAttribute(Constants.LOGIN_USER);
		try {
			//notLogin
			if(currentUser==null){
				return "notLogin";
			}
			if(documentService.back(documentId,docStatusId, currentUser, phrasesVal)>0){
				return "success";
			}
			return "error";
		} catch (Exception e) {
			
			e.printStackTrace();
			return e.getMessage();
		}
	}
	/**
	 * 已阅读操作
	 * @param documentId
	 * @param docStatusId
	 * @param phrasesVal
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/read.do")
	@ResponseBody
	public String read(@RequestParam(value="documentId")Integer documentId,
			@RequestParam(value="docStatusId")Integer docStatusId,
			@RequestParam(value="phrasesVal")String phrasesVal,
			@RequestParam(value="opr")String opr,
			HttpSession session){
		User  currentUser= (User) session.getAttribute(Constants.LOGIN_USER);
		try {
			//notLogin
			if(currentUser==null){
				return "notLogin";
			}
			if(documentService.read(documentId,docStatusId, currentUser, phrasesVal)>0){
				return "success";
			}
			return "error";
		} catch (Exception e) {
			
			e.printStackTrace();
			return e.getMessage();
		}
	}
	@RequestMapping(value="/pending.do")
	@ResponseBody
	public String pending(@RequestParam(value="documentId")Integer documentId,
			@RequestParam(value="docStatusId")Integer docStatusId,
			@RequestParam(value="phrasesVal")String phrasesVal,
			@RequestParam(value="opr")String opr,
			HttpSession session){
		User  currentUser= (User) session.getAttribute(Constants.LOGIN_USER);
		try {
			//notLogin
			if(currentUser==null){
				return "notLogin";
			}
			if("pending".equals(opr)){
				docStatusId=9;
			}
			if(documentService.pending(documentId,docStatusId, currentUser, phrasesVal)>0){
				return "success";
			}
			return "error";
		} catch (Exception e) {
			
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@RequestMapping(value="/pending.json")
	@ResponseBody
	public String findPending(@RequestParam(value = "startTime", required = false) Date startTime,
		@RequestParam(value = "endTime", required = false) Date endTime,
		@RequestParam(value = "rows", required = false) Integer rows,
		@RequestParam(value = "page", required = false) Integer page,
		@RequestParam(value = "docStatusId", required = false) Integer docStatusId,
		@RequestParam(value = "status", required = false) Integer status,
		@RequestParam(value = "documentName", required = false) String documentName,
		HttpSession session){
		Integer userId=null;
		if(status!=null && status==2){
			User currentUser=(User) session.getAttribute(Constants.LOGIN_USER);
			userId=currentUser.getUserId();
		}
		
		PageSupport<Document> pageSupport = documentService.findPending(docStatusId, status, startTime, endTime, documentName, page, rows, userId);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pageSupport.getTotalCount());
		map.put("rows", pageSupport.getList());

		String json = JSON.toJSONString(map,
				SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);

		return json;
	}
	@RequestMapping(value="/flow.html")
	public String flow(@RequestParam(value="docStatusId",required=false)String docStatusId,Model model){
		model.addAttribute("docStatusId", docStatusId);
		logger.debug("flow---docStatusId:"+docStatusId);
		return "document/inner/flow";
	}
	
	@RequestMapping(value="/pended.json")
	@ResponseBody
	public String pended(@RequestParam(value = "startCreateTime", required = false) String startCreateTime,
			@RequestParam(value = "endCreateTime", required = false) String endCreateTime,
			@RequestParam(value = "startPendedTime", required = false) String startPendedTime,
			@RequestParam(value = "endPendedTime", required = false) String endPendedTime,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "docStatusId", required = false) Integer docStatusId,
			@RequestParam(value = "docTypeId", required = false) Integer docTypeId,
			@RequestParam(value = "status", required = false) Integer status,
			@RequestParam(value = "documentName", required = false) String documentName,
			HttpSession session){

		User currentUser=(User) session.getAttribute(Constants.LOGIN_USER);
		
		
		return null;
	}
	
}
