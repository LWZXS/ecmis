package com.ecmis.service;

import java.util.List;

import com.ecmis.pojo.PublishRange;

public interface PublishRangeService {

	public List<PublishRange> findPublishRangeByDocument(Integer documentId);
	
	public int add(PublishRange publishRange);
	
	public int addList(Integer documentId, Integer[] users);
	
	public int update(PublishRange publishRange);
	
	public int delete(Integer documentId, Integer userId);
}
