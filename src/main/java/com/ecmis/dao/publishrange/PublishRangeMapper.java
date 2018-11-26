package com.ecmis.dao.publishrange;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.PublishRange;

public interface PublishRangeMapper {


	public List<PublishRange> getPublishRangeByDocument(@Param("documentId") Integer documentId);
	
	public int add(PublishRange publishRange);
	
	public int addList(@Param("documentId") Integer documentId, @Param("users") Integer[] users);
	
	public int update(PublishRange publishRange);
	
	public int delete(@Param("documentId") Integer documentId, @Param("userId") Integer userId);
}
