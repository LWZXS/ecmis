package com.ecmis.dao.menu;

import com.ecmis.pojo.MenuResource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuResourceMapper {

	
	/*public MenuResource getById(@Param("menuId")Integer menuId);
	
	public List<MenuResource> getAll();
	
	public int add(MenuResource menu);
	
	public int delete(@Param("menuId")Integer menuId);
	
	public int update(MenuResource menu);*/
	
	public List<MenuResource> getByParentMenu(@Param("parentMenuId") Integer parentMenuId);
	
	public List<MenuResource> getCurrentUserLevel1Menus(@Param("userId") Integer userId);
	public List<MenuResource> getCurrentUserLevel2Menus(@Param("userId") Integer userId,
														@Param("parentMenuId")Integer parentMenuId);

	List<MenuResource> getCurrentUserMenus(@Param("userId") Integer userId,@Param("parentMenuId") Integer parentMenuId);

	List<MenuResource> getMenusByRole(@Param("roleId") Integer roleId);
	List<MenuResource> getAdminMenus();
	List<MenuResource> getAll();
	List<MenuResource> getMenusByMaster(@Param("masterId")Integer masterId,@Param("masterType")String masterType,@Param("levelId")Integer levelId);


}
