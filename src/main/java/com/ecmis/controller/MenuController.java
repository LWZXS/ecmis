package com.ecmis.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ecmis.pojo.MenuResource;
import com.ecmis.pojo.Role;
import com.ecmis.pojo.User;
import com.ecmis.service.MenuService;
import com.ecmis.utils.CommonTreeBean;
import com.ecmis.utils.Constants;
import com.ecmis.utils.JsonUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/menu")
public class MenuController {
	private Logger logger=Logger.getLogger(MenuController.class);
	@Resource
	private MenuService menuService;
	
	@RequestMapping(value="/findMenus.json")
	@ResponseBody
	public String findCurrentLoginUserMenus(HttpSession session){
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		List<MenuResource> menus =null;
		List<Role> roles= user.getRoles();
		if (roles.contains(new Role(1))){
			menus=menuService.findAdminLevel1Menus();
			logger.debug("get admin menus");
		}else {
			menus = menuService.findCurrentUserLevel1Menus(user.getUserId());
		}

		return getMenuTree(menus);
/*
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		for (MenuResource menu : menus) {
			CommonTreeBean tree=new CommonTreeBean(menu.getMenuId(), menu.getMenuName(), "close", null);
			Map<String,Object> treeAttri=new HashMap<String, Object>();
			treeAttri.put("url", menu.getUrl());
			treeAttri.put("icon", menu.getIcon());
			treeAttri.put("type", menu.getType());

			if (menu.getType().equals("parent")){
				treeAttri.put("isParent","true");
			}
			tree.setAttributes(treeAttri);
			if(menu.getChildren()!=null){
				List<CommonTreeBean> children=new ArrayList<CommonTreeBean>();
				for (MenuResource childMenu : menu.getChildren()) {
					CommonTreeBean childTree=new CommonTreeBean(childMenu.getMenuId(), childMenu.getMenuName(), "close", null);
					
					Map<String,Object> attributes=new HashMap<String, Object>();
					attributes.put("url", childMenu.getUrl());
					attributes.put("icon", childMenu.getIcon());
					attributes.put("type", childMenu.getType());
					if (menu.getType().equals("parent")){
						treeAttri.put("isParent","true");
						if (childMenu.getChildren()!=null && childMenu.getChildren().size()>0){
							List<CommonTreeBean> level3MenusTree=new ArrayList<CommonTreeBean>();
							for (MenuResource level3Menu : childMenu.getChildren()) {
								CommonTreeBean level3MenuTree = new CommonTreeBean(level3Menu.getMenuId(), level3Menu.getMenuName(), "close", null);
								Map<String,Object> attributesLevel3=new HashMap<String, Object>();
								attributesLevel3.put("url", level3Menu.getUrl());
								attributesLevel3.put("icon", level3Menu.getIcon());
								attributesLevel3.put("type", level3Menu.getType());
								level3MenuTree.setAttributes(attributesLevel3);
								level3MenusTree.add(level3MenuTree);
							}
							childTree.setChildren(level3MenusTree);
						}
					}
					childTree.setAttributes(attributes);
					children.add(childTree);
				}
				tree.setChildren(children);
			}
			rootList.add(tree);
		}
		
		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		logger.debug(json);
		return json;
		*//*if(user!=null){
			
		}*/
		
	}

	public String getMenuTree(List<MenuResource> menus){
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();
		for (MenuResource menu : menus) {
			CommonTreeBean tree=new CommonTreeBean(menu.getMenuId(), menu.getMenuName(), "close", null);
			Map<String,Object> treeAttri=new HashMap<String, Object>();
			treeAttri.put("url", menu.getUrl());
			treeAttri.put("icon", menu.getIcon());
			treeAttri.put("type", menu.getType());

			if (menu.getType().equals("parent")){
				treeAttri.put("isParent","true");
			}
			tree.setAttributes(treeAttri);
			if(menu.getChildren()!=null){
				List<CommonTreeBean> children=new ArrayList<CommonTreeBean>();
				for (MenuResource childMenu : menu.getChildren()) {
					CommonTreeBean childTree=new CommonTreeBean(childMenu.getMenuId(), childMenu.getMenuName(), "close", null);

					Map<String,Object> attributes=new HashMap<String, Object>();
					attributes.put("url", childMenu.getUrl());
					attributes.put("icon", childMenu.getIcon());
					attributes.put("type", childMenu.getType());
					if (menu.getType().equals("parent")){
						treeAttri.put("isParent","true");
						if (childMenu.getChildren()!=null && childMenu.getChildren().size()>0){
							List<CommonTreeBean> level3MenusTree=new ArrayList<CommonTreeBean>();
							for (MenuResource level3Menu : childMenu.getChildren()) {
								CommonTreeBean level3MenuTree = new CommonTreeBean(level3Menu.getMenuId(), level3Menu.getMenuName(), "close", null);
								Map<String,Object> attributesLevel3=new HashMap<String, Object>();
								attributesLevel3.put("url", level3Menu.getUrl());
								attributesLevel3.put("icon", level3Menu.getIcon());
								attributesLevel3.put("type", level3Menu.getType());
								level3MenuTree.setAttributes(attributesLevel3);
								level3MenusTree.add(level3MenuTree);
							}
							childTree.setChildren(level3MenusTree);
						}
					}
					childTree.setAttributes(attributes);
					children.add(childTree);
				}
				tree.setChildren(children);
			}
			rootList.add(tree);
		}

		String json=JSON.toJSONString(rootList,SerializerFeature.DisableCircularReferenceDetect,
				SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,SerializerFeature.WriteNullBooleanAsFalse);
		return json;
	}

	@RequestMapping(value = "/currentUserMenus.json")
	@ResponseBody
	public String getCurrentUserMenus(HttpSession session){
		User user = (User) session.getAttribute(Constants.LOGIN_USER);
		Map<String ,Object> map=new HashMap<>();
		if (user==null){
			map.put("result",false);
			map.put("message","您还没有登录,或登录信息过期,请先登录!");
			return JsonUtil.getJson(map);
		}
		List<MenuResource> currentUserMenus =null;
		if (user.getRoles().contains(new Role(1))){
			currentUserMenus=menuService.findAdminLevel1Menus();
			logger.debug("get admin menus");
		}else {
			currentUserMenus = menuService.findCurrentUserMenus(user.getUserId());
		}

		return getMenuTree(currentUserMenus);
	}
}
