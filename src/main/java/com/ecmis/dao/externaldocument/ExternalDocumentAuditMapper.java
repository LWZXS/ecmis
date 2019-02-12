package com.ecmis.dao.externaldocument;

import com.ecmis.pojo.ExternalDocumentAudit;
import org.apache.ibatis.annotations.Param;

public interface ExternalDocumentAuditMapper {
    int add(ExternalDocumentAudit externalDocumentAudit);

    int updateStatus();

    int updateDocumentId(@Param("documentId") Integer documentId,@Param("auditId") Integer auditId);
}
