package com.ecmis.dao.documenttype;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.DocumentType;

public interface DocumentTypeMapper {
	
	public int add(DocumentType documentType);
	
	public int delete(@Param("docTypeId") Integer docTypeId);
	
	public int update(DocumentType documentType);
	
	public DocumentType getById(@Param("docTypeId") Integer docTypeId);
	
	public List<DocumentType> getAll();
	
	public List<DocumentType> getByParent(@Param("parentTypeId") Integer parentTypeId);
	
	public List<DocumentType> getLikeName(@Param("docTypeName") String docTypeName);
	
}
