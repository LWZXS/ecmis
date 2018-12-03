package com.ecmis.dao.menu;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.MenuResource;

public interface MenuResourceMapper {

	
	/*public MenuResource getById(@Param("menuId")Integer menuId);
	
	public List<MenuResource> getAll();
	
	public int add(MenuResource menu);
	
	public int delete(@Param("menuId")Integer menuId);
	
	public int update(MenuResource menu);*/
	
	public List<MenuResource> getByParentMenu(@Param("parentMenuId") Integer parentMenuId);
	
	public List<MenuResource> getCurrentUserLevel1Menus(@Param("userId") Integer userId);

	public List<MenuResource> getAdminMenus();
}
