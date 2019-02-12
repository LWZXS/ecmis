package com.ecmis.dao.externaldocument;

import com.ecmis.pojo.ExternalDocument;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ExternalDocumentMapper {

    int add(ExternalDocument externalDocument);

    /**
     * 普通分页  已发
     * @param documentName
     * @param status
     * @param creationUser
     * @param startDate
     * @param endDate
     * @param startRow
     * @param pageSize
     * @return
     */
    List<ExternalDocument> getByPage(@Param("documentName") String documentName,
                                     @Param("status") Integer status,
                                     @Param("creationUser") Integer creationUser,
                                     @Param("startDate") Date startDate,
                                     @Param("endDate") Date endDate,
                                     @Param("startRow") Integer startRow,
                                     @Param("pageSize") Integer pageSize);

    int count(@Param("documentName") String documentName,
                                     @Param("status") Integer status,
                                     @Param("creationUser") Integer creationUser,
                                     @Param("startDate") Date startDate,
                                     @Param("endDate") Date endDate);

    int audit(@Param("documentId")Integer documentId,
               @Param("auditId")Integer auditId,
               @Param("status")Integer status,
               @Param("auditor")Integer auditor);

    /**
     * 待审核,待归档,已办
     * @param documentName
     * @param status
     * @param auditCompany
     * @param startDate
     * @param endDate
     * @param startRow
     * @param pageSize
     * @return
     */
    List<ExternalDocument> getAuditByPage(@Param("documentName") String documentName,
                                     @Param("status") Integer status,
                                     @Param("auditCompany") Integer auditCompany,
                                     @Param("startDate") Date startDate,
                                     @Param("endDate") Date endDate,
                                     @Param("startRow") Integer startRow,
                                     @Param("pageSize") Integer pageSize);
    int getAuditCount(@Param("documentName") String documentName,
                                     @Param("status") Integer status,
                                     @Param("auditCompany") Integer auditCompany,
                                     @Param("startDate") Date startDate,
                                     @Param("endDate") Date endDate);
}
