package com.ecmis.service;

import java.util.List;


import com.ecmis.pojo.MenuResource;

public interface MenuService {
	
	/*public int add(MenuResource menu);
	
	public int delete(Integer menuId);
	
	public int update(MenuResource menu);
	
	public MenuResource findById(Integer menuId);
	
	public List<MenuResource> findAll();*/
	
	public List<MenuResource> findByParentMenu(Integer parentMenuId);
	
	public List<MenuResource> findCurrentUserLevel1Menus(Integer userId);
}
