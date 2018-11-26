package com.ecmis.dao.image;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Image;


public interface ImageMapper {

	
	public int add(Image image);
	
	public int delete(@Param("buttonId") Integer imageId);
	
	public int update(Image image);
	
	public Image getById(@Param("buttonId") Integer imageId);
	
	public List<Image> getAll();
	
}
