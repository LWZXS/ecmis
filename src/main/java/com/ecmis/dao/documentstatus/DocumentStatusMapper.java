package com.ecmis.dao.documentstatus;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.DocumentStatus;

public interface DocumentStatusMapper {
	
	public int add(DocumentStatus documentStatus);
	
	public int delete(@Param("docStatusId") Integer documentStatusId);
	
	public int update(DocumentStatus documentStatus);
	
	public DocumentStatus getById(@Param("docStatusId") Integer documentStatusId);
	
	public List<DocumentStatus> getAll(@Param("status") Integer status);
	
}
