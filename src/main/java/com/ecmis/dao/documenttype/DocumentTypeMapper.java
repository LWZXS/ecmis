package com.ecmis.dao.documenttype;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.DocumentType;

public interface DocumentTypeMapper {
	
	public int add(DocumentType documentType);
	
	public int delete(@Param("docTypeId") Integer docTypeId);
	
	public int update(DocumentType documentType);
	
	public DocumentType getById(@Param("docTypeId") Integer docTypeId);
	
	public List<DocumentType> getAll();
	
	public List<DocumentType> getByParent(@Param("parentTypeId") Integer parentTypeId);
	
	public List<DocumentType> getLikeName(@Param("docTypeName") String docTypeName);


	List<DocumentType> getPageByNameAndStatus(@Param("docTypeName") String docTypeName,
											  @Param("status")Integer status,
											  @Param("levelId")Integer levelId,
											  @Param("startRow")Integer startRow,
											  @Param("pageSize")Integer pageSize);
	int count(@Param("docTypeName") String docTypeName,
			  @Param("status")Integer status, @Param("levelId")Integer levelId);

	List<DocumentType> getParents();

	int getChildMaxId(@Param("docTypeId") Integer docTypeId);

	int checkId(@Param("docTypeId") Integer docTypeId);

	int updateStatus(@Param("status") Integer status,@Param("docTypeIds") List<Integer> docTypeIds,@Param("updateBy") Integer updateBy);

	List<Integer> getChildDocTypeIds(@Param("docTypeId")Integer docTypeId);
}
