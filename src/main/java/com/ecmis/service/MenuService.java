package com.ecmis.service;

import com.ecmis.pojo.MenuResource;

import java.util.List;

public interface MenuService {
	
	/*public int add(MenuResource menu);
	
	public int delete(Integer menuId);
	
	public int update(MenuResource menu);
	
	public MenuResource findById(Integer menuId);
	
	public List<MenuResource> findAll();*/
	
	public List<MenuResource> findByParentMenu(Integer parentMenuId);
	
	public List<MenuResource> findCurrentUserLevel1Menus(Integer userId);

	public List<MenuResource> findAdminLevel1Menus();


	List<MenuResource> findCurrentUserMenus(Integer userId);

	List<MenuResource> findMenusByRole(Integer roleId);


	List<MenuResource> findMenusByMaster(Integer masterId, String masterType);


}
