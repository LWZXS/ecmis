package com.ecmis.service.impl;

import com.ecmis.dao.menu.MenuResourceMapper;
import com.ecmis.pojo.MenuResource;
import com.ecmis.service.MenuService;
import com.ecmis.utils.CommonTreeBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
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
		/*if (menus!=null && menus.size()>0){
			for (MenuResource menuResource:menus){
				List<MenuResource> children = menuMapper.getCurrentUserLevel2Menus(userId, menuResource.getMenuId());
				menuResource.setChildren(children);
			}
		}*/
		//return menus;

		return setChildMenu(menus);
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
		return menuMapper.getMenusByMaster(masterId,masterType,null);
	}


	public List<CommonTreeBean> findTreeBean(Integer masterId, String masterType){
		List<CommonTreeBean> rootList=new ArrayList<CommonTreeBean>();//根节点
		List<CommonTreeBean> level1=new ArrayList<CommonTreeBean>();//1级
		List<CommonTreeBean> level2=new ArrayList<CommonTreeBean>();//2级
		List<CommonTreeBean> level3=new ArrayList<CommonTreeBean>();//3级

		List<MenuResource> menus=menuMapper.getAll();

		//一级菜单
		if (menus!=null){
			for(MenuResource menu:menus){
				//当前主人有的菜单
				List<MenuResource> level1MenusList = menuMapper.getMenusByMaster(masterId, masterType,1);
				if ("parent".equals(menu.getType())){
					//二级
					List<MenuResource> level2Menus = menuMapper.getByParentMenu(menu.getMenuId());
					menu.setChildren(level2Menus);


					if (menu.getChildren()!=null){
						for (MenuResource childMenu:menu.getChildren()){
							if ("parent".equals(childMenu.getType())){
								//三级
								List<MenuResource> level3Menus = menuMapper.getByParentMenu(childMenu.getMenuId());



								childMenu.setChildren(level3Menus);
							}
						}


					}
				}
			}
		}

		return rootList;
	}
	@Override
	public List<MenuResource> findCurrentUserMenus(Integer userId) {
		//获得1级菜单
		List<MenuResource> levelOneMenus = menuMapper.getCurrentUserMenus(userId, null);
		if (levelOneMenus!=null && levelOneMenus.size()>0){
			for (MenuResource menu:levelOneMenus){
				//查二级
				if ("parent".equals(menu.getType())){
					List<MenuResource> levelTowMenus = menuMapper.getCurrentUserMenus(userId, menu.getMenuId());
					menu.setChildren(levelTowMenus);
					if (levelTowMenus!=null && levelTowMenus.size()>0){
						for (MenuResource levelTowMenu:levelOneMenus){
							//查三级
							if ("parent".equals(levelTowMenu.getType())){
								List<MenuResource> levelThreeMenus = menuMapper.getCurrentUserMenus(userId, levelTowMenu.getMenuId());
								levelTowMenu.setChildren(levelThreeMenus);
								if (levelThreeMenus!=null){
									for (MenuResource levelThreeMenu:levelThreeMenus){
										if ("parent".equals(levelThreeMenu.getType())){
											List<MenuResource> levelForMenus = menuMapper.getCurrentUserMenus(userId, levelThreeMenu.getMenuId());
											levelThreeMenu.setChildren(levelForMenus);
										}
										List<MenuResource> levelForMenus = menuMapper.getCurrentUserMenus(userId, levelTowMenu.getMenuId());
									}
								}
							}
						}
					}
				}
			}
		}
		//返回1级菜单
		return levelOneMenus;
	}

	@Override
	public List<MenuResource> findMenusByRole(Integer roleId) {
		return menuMapper.getMenusByRole(roleId);

	}

}
