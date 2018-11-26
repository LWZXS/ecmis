package com.ecmis.service;


import com.ecmis.pojo.AuditRecord;
import com.ecmis.utils.PageSupport;

public interface AuditRecordService {

	public int add(AuditRecord auditRecord);
	
	public AuditRecord findById(Integer recordId);
	
	public PageSupport<AuditRecord> findByDocument(Integer documentId, int pageIndex, int pageSize);
}
