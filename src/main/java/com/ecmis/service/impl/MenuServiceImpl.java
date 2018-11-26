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
		return menuMapper.getCurrentUserLevel1Menus(userId);
	}

}
