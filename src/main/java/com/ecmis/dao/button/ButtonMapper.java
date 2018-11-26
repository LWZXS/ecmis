package com.ecmis.dao.button;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Button;


public interface ButtonMapper {

	
	public int add(Button button);
	
	public int delete(@Param("buttonId") Integer buttonId);
	
	public int update(Button button);
	
	public Button getById(@Param("buttonId") Integer buttonId);
	
	public List<Button> getAll();
	
	public List<Button> getByMenuId(@Param("menuId") Integer menuId);
}
