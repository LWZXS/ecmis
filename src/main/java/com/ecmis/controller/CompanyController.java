package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.Company;
import com.ecmis.pojo.User;
import com.ecmis.service.CompanyService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import com.ecmis.utils.PageSupport;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/company")
public class CompanyController {

	private Logger logger = Logger.getLogger(CompanyController.class);
	@Resource
	private CompanyService companyService;

	@RequestMapping(value = "/findAll4Select")
	@ResponseBody
	public String findAll() {
		List<Company> list = companyService.findAll();

		String json = objects2Json(list);

		return json;
	}

	/**
	 * 把一个集合转换面JEasyUI的Json
	 *
	 * @param list
	 * @return JSON
	 */
	public String objects2Json(List<Company> list) {

		List<CommonTreeBean> rootList = new ArrayList<CommonTreeBean>();

		CommonTreeBean defaultBean = new CommonTreeBean(0, "请选择", "open", null);
		rootList.add(defaultBean);
		if (list != null && list.size() > 0) {
			for (Company company : list) {
				CommonTreeBean cb = new CommonTreeBean(company.getCompanyId(), company.getCompanyName(), "close", null);
				rootList.add(cb);
			}
		}

		String json = JSON.toJSONString(rootList, SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteNullBooleanAsFalse,
				SerializerFeature.PrettyFormat);
		logger.debug(json);
		return json;
	}

	/**
	 * 把一个集合转换面JEasyUI的TreeJson
	 *
	 * @param list
	 * @return JSON
	 */
	public String objects2TreeJson(List<Company> list, String rootName) {

		List<CommonTreeBean> rootList = new ArrayList<CommonTreeBean>();
		CommonTreeBean defaultBean = new CommonTreeBean(0, "请选择", "open", null);
		rootList.add(defaultBean);
		if (list != null && list.size() > 0) {
			List<CommonTreeBean> chirlds = new ArrayList<CommonTreeBean>();
			for (Company company : list) {
				CommonTreeBean cb = new CommonTreeBean(company.getCompanyId(), company.getCompanyName(), "close", null);
				chirlds.add(cb);
			}
			CommonTreeBean root = new CommonTreeBean(0, rootName, "open", chirlds);
			rootList.add(root);
		}

		String json = JSON.toJSONString(rootList, SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty, SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty, SerializerFeature.WriteNullBooleanAsFalse,
				SerializerFeature.PrettyFormat);
		logger.debug(json);
		return json;
	}

	@RequestMapping(value = "/getByCompanyTypeId.json")
	@ResponseBody
	public String getByCompanyTypeId(@RequestParam("companyTypeId") Integer companyTypeId) {
		List<Company> companies = companyService.findByType(companyTypeId);
		return JsonUtil.getJson(companies);
	}

	@RequestMapping(value = "/list.json")
	@ResponseBody
	public String list(@RequestParam(value = "companyName", required = false) String companyName,
					   @RequestParam(value = "status", required = false) Integer status,
					   @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
					   @RequestParam(value = "rows", required = false, defaultValue = "10") Integer rows) {

		PageSupport<Company> pageSupport = companyService.findByPage(companyName, status, page, rows);
		return JsonUtil.list2PageJson(pageSupport);
	}


	@RequestMapping("/index.html")
	public String list() {
		return "admin/company/list";
	}


	@RequestMapping(value = "/add.json")
	@ResponseBody
	public String doAdd(Company company, HttpSession session) {
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		logger.debug("company:" + company);
		Map<String, Object> map = new HashMap<>();
		if (currentLoginUser == null) {
			map.put("result", true);
			map.put("message", "您还没有登录,或登录信息过期,请先登录!");
			return JsonUtil.getJson(map);
		}


		try {
			if (company.getCompanyId()!=null){
				//修改
				int update = companyService.update(company);
				if (update>0){
					map.put("result", true);
					map.put("message", "修改单位成功!");
				}else {
					map.put("result", false);
					map.put("message", "修改单位失败!");
				}

			}else {

				//增加
				int num = companyService.checkCompanyName(company.getCompanyName());
				if (num>0){
					map.put("result", false);
					map.put("message", "单位已存在!");
				}else {
					company.setCreationUser(currentLoginUser.getUserId());
					int count = companyService.add(company);
					if (count>0){
						map.put("result", true);
						map.put("message", "增加单位成功!");
					}else {
						map.put("result", false);
						map.put("message", "增加单位失败!");
					}
				}

			}

		} catch (Exception ex) {
			ex.printStackTrace();
			map.put("result", false);
			map.put("message", "操作出现异常,请联系管理员!");

		}
		return JsonUtil.getJson(map);

	}

	@RequestMapping(value = "/checkCompanyName.json")
	@ResponseBody
	public String checkCompanyName(@RequestParam(value = "companyName") String companyName){
		int num = companyService.checkCompanyName(companyName);
		Map<String, Object> map = new HashMap<>();
		if (num>0){
			map.put("result", false);
			map.put("message", "单位已存在!");
		}else {
			map.put("result", true);
			map.put("message", "单位可以使用!");
		}
		return JsonUtil.getJson(map);
	}

	@RequestMapping(value = "/updateStatus.json")
	@ResponseBody
	public String updateStatus(@RequestParam(value = "status") Integer status,@RequestParam(value = "companyId") Integer companyId,HttpSession session) {
		User currentLoginUser = (User) session.getAttribute(Constants.LOGIN_USER);
		Map<String, Object> map = new HashMap<>();
		if (currentLoginUser == null) {
			map.put("result", true);
			map.put("message", "您还没有登录,或登录信息过期,请先登录!");
			return JsonUtil.getJson(map);
		}
		int count = companyService.updateStatus(currentLoginUser.getUserId(), status, companyId);
		if (count>0) {
			map.put("result", true);
			map.put("message", "更新成功!");
		}else {
			map.put("result", true);
			map.put("message", "更新失败!");
		}
		return JsonUtil.getJson(map);
	}
}