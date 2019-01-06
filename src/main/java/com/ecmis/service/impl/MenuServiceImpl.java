package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.menu.MenuResourceMapper;
import com.ecmis.pojo.MenuResource;
import com.ecmis.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService {
	@Resource
	private MenuResourceMapper menuMapper;
	/*
	@Override
	public int add(MenuResource menu) {
		//return menuMapper.add(menu);
	}

	@Override
	public int delete(Integer menuId) {
		//return menuMapper.delete(menuId);
	}

	@Override
	public int update(MenuResource menu) {
		//return menuMapper.update(menu);
	}

//	@Override
*///	public MenuResource findById(Integer menuId) {
//		//return menuMapper.getById(menuId);
//	}
//
//	@Override
//	public List<MenuResource> findAll() {
//		//return menuMapper.getAll();
//	}

	@Override
	public List<MenuResource> findByParentMenu(Integer parentMenuId) {
		return menuMapper.getByParentMenu(parentMenuId);
	}

	@Override
	public List<MenuResource> findCurrentUserLevel1Menus(Integer userId) {
		List<MenuResource> menus = menuMapper.getCurrentUserLevel1Menus(userId);
		if (menus!=null && menus.size()>0){
			for (MenuResource menuResource:menus){
				List<MenuResource> children = menuMapper.getCurrentUserLevel2Menus(userId, menuResource.getMenuId());
				menuResource.setChildren(children);
			}
		}
		return menus;
	}
	@Override
	public List<MenuResource> findAdminLevel1Menus() {
		List<MenuResource> adminMenus = menuMapper.getAdminMenus();

		return setChildMenu(adminMenus);
	}

	//递归查子菜单
	public List<MenuResource> setChildMenu(List<MenuResource> menuResources){
		if (menuResources!=null){
			for(MenuResource menu:menuResources){
				if ("parent".equals(menu.getType())){
					menu.setChildren(menuMapper.getByParentMenu(menu.getMenuId()));
					if (menu.getChildren()!=null){
						for (MenuResource childMenu:menu.getChildren()){
							if ("parent".equals(childMenu.getType())){
								childMenu.setChildren(menuMapper.getByParentMenu(childMenu.getMenuId()));
							}
						}
					}
				}
			}
		}
		return menuResources;
	}

	@Override
	public List<MenuResource> findMenusByMaster(Integer masterId, String masterType) {
		return menuMapper.getMenusByMaster(masterId,masterType);
	}
}
