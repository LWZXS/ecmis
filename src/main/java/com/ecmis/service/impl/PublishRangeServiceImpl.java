package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.publishrange.PublishRangeMapper;
import com.ecmis.pojo.PublishRange;
import com.ecmis.service.PublishRangeService;

@Service
public class PublishRangeServiceImpl implements PublishRangeService {

	@Resource
	private PublishRangeMapper publishRangeMapper;
	
	@Override
	public List<PublishRange> findPublishRangeByDocument(Integer documentId) {
		return publishRangeMapper.getPublishRangeByDocument(documentId);
	}

	@Override
	public int add(PublishRange publishRange) {
		return publishRangeMapper.add(publishRange);
	}

	@Override
	public int addList(Integer documentId, Integer[] users) {
		return publishRangeMapper.addList(documentId, users);
	}

	@Override
	public int update(PublishRange publishRange) {
		return publishRangeMapper.update(publishRange);
	}

	@Override
	public int delete(Integer documentId, Integer userId) {
		return publishRangeMapper.delete(documentId, userId);
	}

}
