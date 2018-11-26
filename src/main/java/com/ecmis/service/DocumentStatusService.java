package com.ecmis.service;

import java.util.List;

import com.ecmis.pojo.DocumentStatus;

public interface DocumentStatusService {

	public int add(DocumentStatus documentStatus);
	
	public int delete(Integer documentStatusId);
	
	public int update(DocumentStatus documentStatus);
	
	public DocumentStatus getById(Integer documentStatusId);
	
	public List<DocumentStatus> getAll(Integer status);
}
