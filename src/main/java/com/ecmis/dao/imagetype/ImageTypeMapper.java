package com.ecmis.dao.imagetype;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.ImageType;


public interface ImageTypeMapper {

	
	public int add(ImageType imageType);
	
	public int delete(@Param("imageTypeId") Integer imageTypeId);
	
	public int update(ImageType imageType);
	
	public ImageType getById(@Param("imageTypeId") Integer imageTypeId);
	
	public List<ImageType> getAll();
	
}
