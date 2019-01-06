package com.ecmis.service;

import java.util.List;


import com.ecmis.pojo.DocumentType;
import com.ecmis.utils.PageSupport;
import org.apache.ibatis.annotations.Param;

public interface DocumentTypeService {

	public int add(DocumentType documentType);
	
	public int delete(Integer docTypeId);
	
	public int update(DocumentType documentType);
	
	public DocumentType findById(Integer docTypeId);
	
	public List<DocumentType> findAll();
	
	public List<DocumentType> findByParent(Integer parentTypeId);
	
	public List<DocumentType> findLikeName(String docTypeName);

	PageSupport<DocumentType> findPageByNameAndStatus(String docTypeName, Integer status,Integer levelId,
													  Integer pageIndex, Integer pageSize);
	int count( String docTypeName,Integer status);

	/**
	 * 可以做为父级的
	 * @return
	 */
	List<DocumentType> findParents();

	/**
	 * 最大子编号
	 * @param docTypeId
	 * @return
	 */
	int findChildMaxId(Integer docTypeId);

	/**
	 * 检查编号
	 * @param docTypeId
	 * @return
	 */
	int checkId(Integer docTypeId);

	/**
	 * 更新状态
	 * @param status
	 * @param docTypeId
	 * @param updateBy
	 * @return
	 */
	int updateStatus(Integer status,Integer docTypeId, Integer updateBy);

}
