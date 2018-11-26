package com.ecmis.dao.document;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Document;

public interface DocumentMapper {

	public int add(Document document);
	
	public int delete(@Param("documentId") Integer documentId);
	
	public int update(Document document);
	/**
	 * 归档
	 * @param documentId
	 * @param docStatusId
	 * @return
	 */
	public int updatePending(@Param("documentId") Integer documentId, @Param("docStatusId") Integer docStatusId);
	
	public Document getById(@Param("documentId") Integer documentId);
	
	public List<Document> getAll(@Param("status") Integer status);
	/**
	 * 通过创建者查找
	 * @param creatorId
	 * @return
	 */
	public List<Document> getByCreator(@Param("creationUser") Integer creatorId);
	
	/**
	 * 通过项目查找
	 * @param projectId
	 * @return
	 */
	public List<Document> getByProject(@Param("projectId") Integer projectId);
	
	/**
	 * 通过审核 查找
	 * @param auditorId
	 * @return
	 */
	public List<Document> getByAuditor(@Param("auditorId") Integer auditorId);
	
	/**
	 * 批准人查找
	 * @param approverId
	 * @return
	 */
	public List<Document> getByApprover(@Param("approverId") Integer approverId);
	/**
	 * 查询当前登录的人的文档
	 * @return
	 * 
	 * select * from biz_document where 
	 */
	public List<Document> getByCurrentUser(@Param("userId") Integer userId);
	
	/**
	 * 增加会审
	 * @param documentId
	 * @param userId
	 * @return
	 */
	public int addJointTrials(@Param("documentId") Integer documentId, @Param("userId") Integer userId);
	/**
	 * 分发对象
	 * @param documentId
	 * @param userId
	 * @return
	 */
	public int addPublishRanges(@Param("documentId") Integer documentId, @Param("userId") Integer userId);

	/**
	 * 用户代办
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param startRow
	 * @param pageSize
	 * @return
	 */
	public List<Document> getByCondition(@Param("userId") Integer userId,
                                         @Param("docStatusId") Integer docStatusId,
                                         @Param("status") Integer status,
                                         @Param("startTime") Date startTime,
                                         @Param("endTime") Date endTime,
                                         @Param("startRow") Integer startRow,
                                         @Param("pageSize") Integer pageSize);
	/**
	 * 用户待办总数
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getCountByCondition(@Param("userId") Integer userId,
                                   @Param("docStatusId") Integer docStatusId,
                                   @Param("status") Integer status,
                                   @Param("startTime") Date startTime,
                                   @Param("endTime") Date endTime);
	
	/**
	 * 已办数量
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getCountByHaveTodo(@Param("userId") Integer userId,
                                  @Param("docStatusId") Integer docStatusId,
                                  @Param("startTime") Date startTime,
                                  @Param("endTime") Date endTime);
	/**
	 * 已办
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param startRow
	 * @param pageSize
	 * @return
	 */
	public List<Document> getByHaveTodo(@Param("userId") Integer userId,
                                        @Param("docStatusId") Integer docStatusId,
                                        @Param("startTime") Date startTime,
                                        @Param("endTime") Date endTime,
                                        @Param("startRow") Integer startRow,
                                        @Param("pageSize") Integer pageSize);
	//SELECT * FROM biz_document bd,biz_publish_range bp WHERE bp.`documentId`=bd.`documentId` AND bp.`userId`=8
	/**
	 * 获得分发范围
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param startRow
	 * @param pageSize
	 * @return
	 */
	public List<Document> getPublishRange(@Param("userId") Integer userId,
                                          @Param("docStatusId") Integer docStatusId,
                                          @Param("status") Integer status,
                                          @Param("startTime") Date startTime,
                                          @Param("endTime") Date endTime,
                                          @Param("startRow") Integer startRow,
                                          @Param("pageSize") Integer pageSize);
	/**
	 * 获得分以范围总数
	 * @param userId
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getCountByPublishRange(@Param("userId") Integer userId,
                                      @Param("docStatusId") Integer docStatusId,
                                      @Param("status") Integer status,
                                      @Param("startTime") Date startTime,
                                      @Param("endTime") Date endTime);
	/**
	 * 获得草稿
	 * @param userId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param startRow
	 * @param pageSize
	 * @return
	 */
	public List<Document> getDraft(@Param("userId") Integer userId,
                                   @Param("status") Integer status,
                                   @Param("startTime") Date startTime,
                                   @Param("endTime") Date endTime,
                                   @Param("startRow") Integer startRow,
                                   @Param("pageSize") Integer pageSize);
	/**
	 * 获得草稿总数
	 * @param userId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getCountDraft(@Param("userId") Integer userId,
                             @Param("status") Integer status,
                             @Param("startTime") Date startTime,
                             @Param("endTime") Date endTime);
	
	public int getAuditingCount(@Param("documentId") Integer documentId, @Param("status") Integer status);
	
	public int auditing(Document document);
	
	public int back(@Param("documentId") Integer documentId, @Param("docStatusId") Integer docStatusId, @Param("modifyUser") Integer modifyUser);

	/**
	 * 归档、草稿
	 * @param docStatusId
	 * @param status
	 * @param startTime
	 * @param endTime
	 * @param documentName
	 * @param startRow
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public List<Document> getPending(@Param("docStatusId") Integer docStatusId,
                                     @Param("status") Integer status,
                                     @Param("startTime") Date startTime,
                                     @Param("endTime") Date endTime,
                                     @Param("documentName") String documentName,
                                     @Param("startRow") Integer startRow,
                                     @Param("pageSize") Integer pageSize,
                                     @Param("userId") Integer userId);
	
	public int getPendingCount(@Param("docStatusId") Integer docStatusId,
                               @Param("status") Integer status,
                               @Param("startTime") Date startTime,
                               @Param("endTime") Date endTime,
                               @Param("documentName") String documentName,
                               @Param("userId") Integer userId);
	
	/**
	 * 已发 
	 * @param startTime
	 * @param endTime
	 * @param documentName
	 * @param docStatusId
	 * @param startRow
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public List<Document> getIssued(@Param("startTime") Date startTime,
                                    @Param("endTime") Date endTime,
                                    @Param("documentName") String documentName,
                                    @Param("docStatusId") Integer docStatusId,
                                    @Param("startRow") Integer startRow,
                                    @Param("pageSize") Integer pageSize,
                                    @Param("userId") Integer userId);
	
	public int getIssuedCount(@Param("startTime") Date startTime,
                              @Param("endTime") Date endTime,
                              @Param("documentName") String documentName,
                              @Param("docStatusId") Integer docStatusId,
                              @Param("userId") Integer userId);
}
