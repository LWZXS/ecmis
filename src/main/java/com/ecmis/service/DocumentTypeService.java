package com.ecmis.service;

import java.util.List;


import com.ecmis.pojo.DocumentType;

public interface DocumentTypeService {

	public int add(DocumentType documentType);
	
	public int delete(Integer docTypeId);
	
	public int update(DocumentType documentType);
	
	public DocumentType findById(Integer docTypeId);
	
	public List<DocumentType> findAll();
	
	public List<DocumentType> findByParent(Integer parentTypeId);
	
	public List<DocumentType> findLikeName(String docTypeName);
}
