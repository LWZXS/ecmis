package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.documentstatus.DocumentStatusMapper;
import com.ecmis.pojo.DocumentStatus;
import com.ecmis.service.DocumentStatusService;

@Service
public class DocumentStatusServiceImpl implements DocumentStatusService {

	@Resource
	private DocumentStatusMapper documentStatusMapper;
	
	public int add(DocumentStatus documentStatus) {
		return documentStatusMapper.add(documentStatus);
	}

	public int delete(Integer documentStatusId) {
		return documentStatusMapper.delete(documentStatusId);
	}

	public int update(DocumentStatus documentStatus) {
		return documentStatusMapper.update(documentStatus);
	}

	public DocumentStatus getById(Integer documentStatusId) {
		return documentStatusMapper.getById(documentStatusId);
	}

	public List<DocumentStatus> getAll(Integer status) {
		return documentStatusMapper.getAll(status);
	}

}
