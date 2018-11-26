package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.auditrecord.AuditRecordMapper;
import com.ecmis.pojo.AuditRecord;
import com.ecmis.service.AuditRecordService;
import com.ecmis.utils.PageSupport;

@Service
public class AuditRecordServiceImpl implements AuditRecordService {

	@Resource
	private AuditRecordMapper auditRecordMapper;
	
	@Override
	public int add(AuditRecord auditRecord) {
		return auditRecordMapper.add(auditRecord);
	}

	@Override
	public PageSupport<AuditRecord> findByDocument(Integer documentId,int pageIndex,int pageSize) {
		
		PageSupport<AuditRecord> pageSupport=new PageSupport<AuditRecord>();
		
		int totalCount = auditRecordMapper.getCountByDocument(documentId);
		
		List<AuditRecord> list = auditRecordMapper.getByDocument(documentId,(pageIndex-1)*pageSize,pageSize);
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}
	
	@Override
	public AuditRecord findById(Integer recordId) {
		return auditRecordMapper.getById(recordId);
	}
}
