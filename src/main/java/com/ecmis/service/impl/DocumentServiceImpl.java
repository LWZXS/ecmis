package com.ecmis.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.document.DocumentMapper;
import com.ecmis.pojo.AuditRecord;
import com.ecmis.pojo.Document;
import com.ecmis.pojo.JointTrial;
import com.ecmis.pojo.PublishRange;
import com.ecmis.pojo.User;
import com.ecmis.service.AuditRecordService;
import com.ecmis.service.DocumentService;
import com.ecmis.service.JointTrialService;
import com.ecmis.service.PublishRangeService;
import com.ecmis.utils.Constants;
import com.ecmis.utils.PageSupport;

/**
 * 文档业务
 * @author gumuyun
 *
 */
@Service
public class DocumentServiceImpl implements DocumentService {

	@Resource
	private DocumentMapper documentMapper;
	
	@Resource
	private JointTrialService jointTrialService;
	
	@Resource
	private PublishRangeService publishRangeService;
	
	@Resource
	private AuditRecordService auditRecordService;
	
	public int add(Document document, Integer[] jointTrials,
			Integer[] publishRanges,User currentUser) {
		int count = documentMapper.add(document);
		//会审
		if(jointTrials!=null && jointTrials.length>0){
			jointTrialService.addList(document.getDocumentId(), jointTrials);
		}
		//分发
		if(publishRanges!=null && publishRanges.length>0){
			for (Integer userId : publishRanges) {
				documentMapper.addPublishRanges(document.getDocumentId(), userId);
			}
		}
		
		String phrases=document.getStatus()==1?"发起":"草稿";
		String opration="新建";
		
		AuditRecord auditRecord=new AuditRecord(document.getDocumentId(), document.getCreationUser(), phrases, 1, new Date(),opration,currentUser.getUserName(),null);
		count+=auditRecordService.add(auditRecord);
		
		return count;
	}

	public int delete(Integer documentId) {
		return documentMapper.delete(documentId);
	}

	public int update(Document document,Integer[] jointTrials, Integer[] publishRanges,User currentUser,String opr) {
		
		//更新biz_joint_trial 删除documentId相关后，再新增
		jointTrialService.delete(document.getDocumentId(), null);
		if(jointTrials!=null && jointTrials.length>0){
			jointTrialService.addList(document.getDocumentId(), jointTrials);
			
		}
		
		//更新biz_publish_range 删除documentId相关后，再新增
		publishRangeService.delete(document.getDocumentId(), null);
		if(publishRanges!=null && publishRanges.length>0){
			publishRangeService.addList(document.getDocumentId(), publishRanges);
		}
		
		String phrases="退回后修改";
		String opration="修改";
		if("draft".equals(opr)){
			phrases="发起";
			opration="新建";
			document.setStatus(1);
		}
		
		//增加biz_audit_record
		AuditRecord auditRecord=new AuditRecord(document.getDocumentId(), currentUser.getUserId(), phrases, 8, new Date(),opration,currentUser.getUserName(),currentUser.getUserName()+opration+"操作");
		auditRecordService.add(auditRecord);
		
		//更新document
		return documentMapper.update(document);
	}

	public Document findById(Integer documentId) {
		return documentMapper.getById(documentId);
	}

	public List<Document> findAll(Integer status) {
		return documentMapper.getAll(status);
	}

	public List<Document> findByCreator(Integer creatorId) {
		return documentMapper.getByCreator(creatorId);
	}

	public List<Document> findByProject(Integer projectId) {
		return documentMapper.getByProject(projectId);
	}

	public List<Document> findByAuditor(Integer auditorId) {
		return documentMapper.getByAuditor(auditorId);
	}

	public List<Document> findByApprover(Integer approverId) {
		return documentMapper.getByApprover(approverId);
	}

	public List<Document> findByCurrentUser(Integer userId) {
		return documentMapper.getByCurrentUser(userId);
	}

	public PageSupport<Document> findByCondition(Integer userId, Integer docStatusId,Integer status,
			Date startTime, Date endTime, Integer currentPageNo, Integer pageSize) {
		List<Document> list = documentMapper.getByCondition(userId, docStatusId,status, startTime, endTime, (currentPageNo-1)*pageSize, pageSize);
		
		PageSupport<Document> pageSupport=new PageSupport<Document>();
		//总记录数
		int totalCount = documentMapper.getCountByCondition(userId, docStatusId,status, startTime, endTime);
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(currentPageNo);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}
	public PageSupport<Document> findByHaveTodo(Integer userId,Integer docStatusId,
			Date startTime, Date endTime, Integer currentPageNo, Integer pageSize) {
		List<Document> list = documentMapper.getByHaveTodo(userId,docStatusId, startTime, endTime, (currentPageNo-1)*pageSize, pageSize);
		
		PageSupport<Document> pageSupport=new PageSupport<Document>();
		//总记录数
		int totalCount = documentMapper.getCountByHaveTodo(userId, docStatusId, startTime, endTime);
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(currentPageNo);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}
	
	//获得分发范围
	public PageSupport<Document> findPublishRange(Integer userId,
			Integer docStatusId, Integer status, Date startTime, Date endTime,
			Integer currentPageNo, Integer pageSize) {
		
		List<Document> list = documentMapper.getPublishRange(userId,docStatusId,status, startTime, endTime, (currentPageNo-1)*pageSize, pageSize);
		
		PageSupport<Document> pageSupport=new PageSupport<Document>();
		//总记录数
		int totalCount = documentMapper.getCountByPublishRange(userId, docStatusId,status, startTime, endTime);
		//总记录数
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(currentPageNo);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}
	
	public PageSupport<Document> findDraft(Integer userId, Integer status,
			Date startTime, Date endTime,Integer currentPageNo,Integer pageSize) {
		
		List<Document> list = documentMapper.getDraft(userId, status, startTime, endTime, (currentPageNo-1)*pageSize, pageSize);
		
		PageSupport<Document> pageSupport=new PageSupport<Document>();
		//总记录数
		int totalCount = documentMapper.getCountDraft(userId, status, startTime, endTime);
		//总记录数
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(currentPageNo);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}
	
	/**
	 * 审核
	 */
	public int auditing(Document document, Integer[] jointTrialsUsers,
			Integer[] publishRangeUsers,User user, String phrasesVal) {
		//操作类型，保存到记录表
		String opration=null;
		//保存会审人,如果已有，侧不需增加   先查出现有的会审
		//该文档的会审
		List<JointTrial> jointTrialList = jointTrialService.findJointTrialByDocument(document.getDocumentId());
		//判断现在选中的会审人是否有人
		String recordDescription=null;
		if(jointTrialsUsers!=null && jointTrialsUsers.length>0){
			//要增加的人
			List<Integer> insertJointTrialsUsers=new ArrayList<Integer>();
			
			if(jointTrialList!=null && jointTrialList.size()>0){
				for (int i = 0; i < jointTrialsUsers.length; i++) {
					boolean isExits=false;
					//查看有没有新会审人
					for (JointTrial jointTrial : jointTrialList) {
						if(jointTrialsUsers[i].equals(jointTrial.getUserId())){
							isExits=true;
							break;
						}
					}
					if(!isExits){
						insertJointTrialsUsers.add(jointTrialsUsers[i]);
					}
					
					//查看有没有减会审人
					JointTrial jt=new JointTrial(document.getDocumentId(), jointTrialsUsers[i], null);
					//要删除的人
					if(!jointTrialList.contains(jt)){
						//删除
						
						jointTrialService.delete(document.getDocumentId(), jointTrialsUsers[i]);
					}
					
				}
			}
			//如果有新人增加新人
			if(insertJointTrialsUsers.size()>0){
				//增加 
				Integer[] userIds=new Integer[insertJointTrialsUsers.size()];
				for (int j = 0; j < insertJointTrialsUsers.size(); j++) {
					userIds[j]=insertJointTrialsUsers.get(j);
				}
				jointTrialService.addList(document.getDocumentId(),userIds);
			}
			//改状态，docStatusId
			int jointTrialsCount =0;
			switch(document.getDocStatusId()){
				case 2:
					//如果docStatusId==2   表示审核人审核  状态变为3 如果会审人数为0，直接变为批准状态
					jointTrialsCount = documentMapper.getAuditingCount(document.getDocumentId(), null);
					if(jointTrialsCount==0){
						document.setDocStatusId(4);
					}else{
						document.setDocStatusId(3);
					}
					opration="审批";
					recordDescription=user.getUserName()+"完成审批操作";
					break;
				case 3:
					//如果docStatusId==3   表示会审，需要所有会审人都要会审完后 状态改为4（批准）
					jointTrialsCount = documentMapper.getAuditingCount(document.getDocumentId(), null);
					if(jointTrialsCount==0){
						document.setDocStatusId(4);
					}else{
						int actualJointTrialsCount = documentMapper.getAuditingCount(document.getDocumentId(), 2);
						if(jointTrialsCount==actualJointTrialsCount+1){
							document.setDocStatusId(4);
						}
					}
					opration="会审";
					recordDescription=user.getUserName()+"完成会审操作";
					if(document.getDocStatusId()==4){
						recordDescription=recordDescription+",会审人全部通过";
					}
					break;
				case 4:
					//如果docStatusId==4   表示要批准 ，状态变为5归档分发
					document.setDocStatusId(5);
					opration="批准";
					recordDescription=user.getUserName()+"完成批准操作";
					break;
			}
			
		}else{
			//如果没有选中人，把该文档所有的会审人全删除
			jointTrialService.delete(document.getDocumentId(), null);
			switch (document.getDocStatusId()) {
			case 2:
				document.setDocStatusId(4);
				opration="审批";
				recordDescription=user.getUserName()+"完成审批操作";
				break;
			case 3:
				document.setDocStatusId(4);
				opration="会审";
				recordDescription=user.getUserName()+"完成会审操作";
				break;
			
			case 4:
				
				document.setDocStatusId(5);
				opration="批准";
				recordDescription=user.getUserName()+"完成批准操作";
				break;

			}
		}
		
		
		//修改分发人
		//1.查看本文档的分发人
		//2.与现在传来的参数比较，如果现在的多，增加加多的，如果少，去掉多余的
		//
		//
		//
		//
		//1.查看本文档的分发人
		List<PublishRange> publishRangeList = publishRangeService.findPublishRangeByDocument(document.getDocumentId());
		if(publishRangeUsers!=null && publishRangeUsers.length>0){
			//要增加的人
			List<Integer> insertPublishRangeUsers=new ArrayList<Integer>();
			
			if(publishRangeList!=null && publishRangeList.size()>0){
				for (int i = 0; i < publishRangeUsers.length; i++) {
					boolean isExits=false;
					//查看有没有新分发人
					for (PublishRange publishRange : publishRangeList) {
						if(publishRangeUsers[i].equals(publishRange.getUserId())){
							isExits=true;
							break;
						}
					}
					if(!isExits){
						insertPublishRangeUsers.add(publishRangeUsers[i]);
					}
					
					//查看有没有减分发人
					PublishRange pr=new PublishRange(document.getDocumentId(), publishRangeUsers[i], null);
					//要删除的人
					if(!publishRangeList.contains(pr)){
						//删除
						publishRangeService.delete(document.getDocumentId(), publishRangeUsers[i]);
					}
					
				}
			}
			//如果有新人增加新人
			if(insertPublishRangeUsers.size()>0){
				//增加 
				Integer[] userIds=new Integer[insertPublishRangeUsers.size()];
				for (int j = 0; j < insertPublishRangeUsers.size(); j++) {
					userIds[j]=insertPublishRangeUsers.get(j);
				}
				publishRangeService.addList(document.getDocumentId(),userIds);
			}
		}else{
			//删除
			publishRangeService.delete(document.getDocumentId(), null);
			
		}
		
		//保存审批记录
		AuditRecord auditRecord=new AuditRecord(document.getDocumentId(), user.getUserId(), phrasesVal, document.getDocStatusId(), new Date(),opration,user.getUserName(),recordDescription);
		auditRecordService.add(auditRecord);
		//修改审核表状态
		JointTrial jointTrial=new JointTrial(document.getDocumentId(), user.getUserId(), 2);
		jointTrialService.update(jointTrial);
		//修改当前document
		return documentMapper.auditing(document);
	}
	
	public int back(Integer documentId,Integer docStatusId, User currentUser, String phrasesVal) {
		// TODO Auto-generated method stub
		//保存记录
		AuditRecord auditRecord=new AuditRecord(documentId, currentUser.getUserId(), phrasesVal, docStatusId, new Date(),"退回",currentUser.getUserName(),docStatusId==8?"回退发起人":"回退操作");
		auditRecordService.add(auditRecord);
		
		return documentMapper.back(documentId,docStatusId, currentUser.getUserId());
	}
	
	public int read(Integer documentId, Integer docStatusId, User currentUser,
			String phrasesVal) {
		//已阅，1、修改分发状态    1未查看     2已阅       
		int count=0;
		count+=publishRangeService.update(new PublishRange(documentId, currentUser.getUserId(),2));
		//2.保存记录
		AuditRecord auditRecord=new AuditRecord(documentId, currentUser.getUserId(), phrasesVal, docStatusId, new Date(),"阅读",currentUser.getUserName(),currentUser.getUserName()+"阅读");
		count+=auditRecordService.add(auditRecord);
		return count;
	}
	public int pending(Integer documentId, Integer docStatusId, User currentUser,
			String phrasesVal) {
		//已阅，1、修改分发状态
		int count=0;
		//count+=publishRangeService.update(new PublishRange(documentId, currentUser.getUserId(),2));
		//2.保存记录
		AuditRecord auditRecord=new AuditRecord(documentId, currentUser.getUserId(), phrasesVal, docStatusId, new Date(),"归档",currentUser.getUserName(),currentUser.getUserName()+"执行归档");
		count+=auditRecordService.add(auditRecord);
		//更新状态
		count+=documentMapper.updatePending(documentId, docStatusId);
		return count;
	}
	
	public PageSupport<Document> findPending(Integer docStatusId,
			Integer status, Date startTime, Date endTime, String documentName,
			Integer pageIndex, Integer pageSize,Integer userId) {
		if(docStatusId==null){
			docStatusId=5;
		}
		if(status==null){
			docStatusId=1;
		}
		if(pageIndex==null){
			pageIndex=Constants.PAGE_INDEX;
		}
		if(pageSize==null){
			pageSize=Constants.PAGE_SIZE;
		}
		
		//总记录数
		int totalCount = documentMapper.getPendingCount(docStatusId, status, startTime, endTime, documentName,userId);
		//记录
		List<Document> list = documentMapper.getPending(docStatusId, status, startTime, endTime, documentName, (pageIndex-1)*pageSize, pageSize,userId);
		
		PageSupport<Document> pageSupport=new PageSupport<Document>();
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}
	
	public PageSupport<Document> findIssued(Date startTime, Date endTime,
			String documentName, Integer docStatusId, Integer pageIndex,
			Integer pageSize, User currentUser) {
		//总记录数
		int totalCount = documentMapper.getIssuedCount(startTime, endTime, documentName, docStatusId, currentUser.getUserId());
		//记录
		List<Document> list = documentMapper.getIssued(startTime, endTime, documentName, docStatusId, (pageIndex-1)*pageSize, pageSize, currentUser.getUserId());
		
		PageSupport<Document> pageSupport=new PageSupport<Document>();
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		
		pageSupport.setList(list);
		
		return pageSupport;
	}
	
	public void test(){
		
	}
}
