package com.ecmis.service;

import com.ecmis.pojo.ExternalDocumentAudit;

public interface ExternalDocumentAuditService {

    int add(ExternalDocumentAudit externalDocumentAudit);

    int updateDocumentId(Integer documentId, Integer auditId);
}
