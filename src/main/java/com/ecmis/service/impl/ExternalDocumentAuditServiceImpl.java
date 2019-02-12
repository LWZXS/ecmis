package com.ecmis.service.impl;

import com.ecmis.dao.externaldocument.ExternalDocumentAuditMapper;
import com.ecmis.pojo.ExternalDocumentAudit;
import com.ecmis.service.ExternalDocumentAuditService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ExternalDocumentAuditServiceImpl implements ExternalDocumentAuditService {

    @Resource
    private ExternalDocumentAuditMapper externalDocumentAuditMapper;
    @Override
    public int add(ExternalDocumentAudit externalDocumentAudit) {
        return externalDocumentAuditMapper.add(externalDocumentAudit);
    }

    @Override
    public int updateDocumentId(Integer documentId, Integer auditId) {
        return externalDocumentAuditMapper.updateDocumentId(documentId,auditId);
    }
}
