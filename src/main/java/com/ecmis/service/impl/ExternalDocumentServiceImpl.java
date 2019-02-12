package com.ecmis.service.impl;

import com.ecmis.dao.externaldocument.ExternalDocumentMapper;
import com.ecmis.pojo.*;
import com.ecmis.service.*;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
public class ExternalDocumentServiceImpl implements ExternalDocumentService {

    @Resource
    private ExternalDocumentMapper externalDocumentMapper;
    @Resource
    private ProjectService projectService;

    @Resource
    private FlowTypeService flowTypeService;

    @Resource
    private CompanyService companyService;
    @Resource
    private UserService userService;

    @Resource
    private ExternalDocumentAuditService externalDocumentAuditService;
    @Override
    public int add(ExternalDocument externalDocument) {
        int count=0;
        Company company = companyService.findByUser(externalDocument.getCreationUser());
        //流程控制
        switch (externalDocument.getFlowTypeId()){
            case 1:
                //A类由实施工方发起
            case 2:
                //B
            case 4:
                //D
            case 5:
                //E
                ExternalDocumentAudit audit=new ExternalDocumentAudit();
                audit.setAuditCompany(company.getCompanyId());
                audit.setAuditType("company");
                audit.setDocumentId(externalDocument.getDocumentId());
                audit.setAuditor(company.getCompanyId());
                audit.setCreationUser(externalDocument.getCreationUser());
                externalDocumentAuditService.add(audit);//保存审核对象
                externalDocument.setAuditId(audit.getAuditId());
                count= externalDocumentMapper.add(externalDocument);//保存文档
                //更新文档编号
                externalDocumentAuditService.updateDocumentId(externalDocument.getDocumentId(),audit.getAuditId());
                break;
            case 3:

                break;
            case 6:

                break;

        }

        return count;
    }

    public int addFlow(ExternalDocument externalDocument){
        //获得项目
        Project project = projectService.findById(externalDocument.getProjectId());
        //流程类型
        FlowType flowType = flowTypeService.findById(externalDocument.getFlowTypeId());
        //当前用户
        User user = userService.findById(externalDocument.getCreationUser());
        //所在单位
        Company company = companyService.findById(user.getCompanyId());

        switch (flowType.getFlowTypeId()){
            case 1:
            //A类由实施工方发起
            case 2:
            //B
            case 4:
            //D
            case 5:
            //E
                ExternalDocumentAudit audit=new ExternalDocumentAudit();
                audit.setAuditCompany(company.getCompanyId());
                audit.setAuditType("company");
                audit.setDocumentId(externalDocument.getDocumentId());
                audit.setAuditor(company.getCompanyId());
                externalDocumentAuditService.add(audit);
                externalDocument.setAuditId(audit.getAuditId());
                break;
            case 3:

                break;
            case 6:

                break;

        }
        switch (company.getCompanyTypeId()){
            case 1:
                //建设单位
                break;

            case 2:
                //施工单位

                break;

            case 3:
                //监理单位

                break;

        }


        return 1;
    }

    @Override
    public PageSupport<ExternalDocument> findByPage(String documentName,Integer status,Integer creationUser, Date startDate, Date endDate, Integer pageIndex, Integer pageSize) {

        PageSupport<ExternalDocument> pageSupport =new PageSupport<>();
        int totalCount = externalDocumentMapper.count(documentName, status, creationUser,startDate, endDate);
        pageSupport.setTotalCount(totalCount);
        pageSupport.setPageSize(pageSize);
        pageSupport.setCurrentPageNo(pageIndex);
        if (totalCount>0){
            List<ExternalDocument> list = externalDocumentMapper.getByPage(documentName, status, creationUser,startDate, endDate, pageSupport.getStartRow(), pageSize);
            pageSupport.setList(list);
        }
        return pageSupport;
    }

    @Override
    public int audit(Integer documentId, Integer auditId, Integer status, Integer auditor) {
        return externalDocumentMapper.audit(documentId,auditId,status,auditor);
    }

    @Override
    public PageSupport<ExternalDocument> findAuditByPage(String documentName, Integer status, User currentLoginUser, Date startDate, Date endDate, Integer pageIndex, Integer pageSize) {
        PageSupport<ExternalDocument> pageSupport=new PageSupport<>();
        if (currentLoginUser==null){
            return pageSupport;
        }
        Company company = companyService.findById(currentLoginUser.getCompanyId());
        //总数量
        int totalCount = externalDocumentMapper.getAuditCount(documentName, status, currentLoginUser.getCompanyId(), startDate, endDate);
        pageSupport.setTotalCount(totalCount);
        pageSupport.setPageSize(pageSize);
        pageSupport.setCurrentPageNo(pageIndex);
        if (totalCount>0){
            List<ExternalDocument> list = externalDocumentMapper.getAuditByPage(documentName, status, currentLoginUser.getCompanyId(), startDate, endDate, pageSupport.getStartRow(), pageSize);
            pageSupport.setList(list);
        }
        return pageSupport;
    }
}
