package com.ecmis.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Document;
import com.ecmis.pojo.User;
import com.ecmis.utils.PageSupport;

public interface DocumentService {

	public int add(Document document, Integer[] jointTrials, Integer[] publishRanges, User currentUser);
	
	public int delete(Integer documentId);
	
	public int update(Document document, Integer[] jointTrials, Integer[] publishRanges, User user, String opr);
	
	public Document findById(Integer documentId);
	
	public List<Document> findAll(Integer status);
	/**
	 * 通过创建者查找
	 * @param creatorId
	 * @return
	 */
	public List<Document> findByCreator(Integer creatorId);
	
	/**
	 * 通过项目查找
	 * @param projectId
	 * @return
	 */
	public List<Document> findByProject(Integer projectId);
	
	/**
	 * 通过审核 查找
	 * @param auditorId
	 * @return
	 */
	public List<Document> findByAuditor(Integer auditorId);
	
	/**
	 * 批准人查找
	 * @param approverId
	 * @return
	 */
	public List<Document> findByApprover(Integer approverId);
	/**
	 * 查询当前登录的人的文档
	 * @return
	 */
	public List<Document> findByCurrentUser(Integer userId);
	
	/**
	 * 代办
	 * @param userId
	 * @param docStatusId
	 * @param startTime
	 * @param endTime
	 * @param startRow
	 * @param pageSize
	 * @return
	 */
	public PageSupport<Document> findByCondition(Integer userId, Integer docStatusId, Integer status,
                                                 Date startTime, Date endTime, Integer currentPageNo, Integer pageSize);
	
	/**
	 * 已办
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param currentPageNo
	 * @param pageSize
	 * @return
	 */
	public PageSupport<Document> findByHaveTodo(Integer userId, Integer docStatusId,
                                                Date startTime, Date endTime, Integer currentPageNo, Integer pageSize);
	
	/**
	 * 已发
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param currentPageNo
	 * @param pageSize
	 * @return
	 */
	public PageSupport<Document> findPublishRange(Integer userId, Integer docStatusId, Integer status,
                                                  Date startTime, Date endTime, Integer currentPageNo, Integer pageSize);
	/**
	 * 草稿
	 * @param userId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param currentPageNo
	 * @param pageSize
	 * @return
	 */
	public PageSupport<Document> findDraft(Integer userId, Integer status, Date startTime, Date endTime, Integer currentPageNo, Integer pageSize);
	
	public int auditing(Document document, Integer[] jointTrials, Integer[] publishRanges, User user, String phrasesVal);

	public int back(Integer documentId, Integer docStatusId, User currentUser, String phrasesVal);
	
	public int read(Integer documentId, Integer docStatusId, User currentUser, String phrasesVal);
	
	public int pending(Integer documentId, Integer docStatusId, User currentUser, String phrasesVal);

	/**
	 * 归档
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param documentName
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public PageSupport<Document> findPending(Integer docStatusId, Integer status, Date startTime, Date endTime,
                                             String documentName, Integer pageIndex, Integer pageSize, Integer userId);
	
	/**
	 * 已发  查询是本人发送出去的文档
	 * @param startTime
	 * @param endTime
	 * @param documentName
	 * @param pageIndex
	 * @param pageSize
	 * @param currentUser
	 * @return
	 */
	public PageSupport<Document> findIssued(Date startTime, Date endTime,
                                            String documentName, Integer docStatusId, Integer pageIndex, Integer pageSize, User currentUser);
	
	
	
}
