package com.ecmis.service;

import com.ecmis.pojo.ExternalDocument;
import com.ecmis.pojo.User;
import com.ecmis.utils.PageSupport;

import java.util.Date;

public interface ExternalDocumentService {

    int add(ExternalDocument externalDocument);

    PageSupport<ExternalDocument> findByPage(String documentName,
                                             Integer status,
                                             Integer creationUser,
                                             Date startDate,
                                             Date endDate,
                                             Integer pageIndex,
                                             Integer pageSize);

    /*int findCount(String documentName,
              Integer status,
              Date startDate,
              Date endDate);*/

    int audit(Integer documentId,
              Integer auditId,
              Integer status,
              Integer auditor);

    PageSupport<ExternalDocument> findAuditByPage(String documentName, Integer status,
                                                  User currentLoginUser, Date startDate,
                                                  Date endDate, Integer pageIndex,
                                                  Integer pageSize);
}
