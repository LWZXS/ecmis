package com.ecmis.dao.auditrecord;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.AuditRecord;

public interface AuditRecordMapper {

	public int add(AuditRecord auditRecord);
	
	public AuditRecord getById(@Param("recordId") Integer recordId);
	
	public List<AuditRecord> getByDocument(@Param("documentId") Integer documentId, @Param("startRow") int startRow, @Param("pageSize") int pageSize);

	public int getCountByDocument(@Param("documentId") Integer documentId);
}
