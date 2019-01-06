package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import com.ecmis.dao.documenttype.DocumentTypeMapper;
import com.ecmis.pojo.DocumentType;
import com.ecmis.service.DocumentTypeService;

@Service
public class DocumentTypeServiceImpl implements DocumentTypeService {

	@Resource
	private DocumentTypeMapper documentTypeMapper;
	@Override
	public int add(DocumentType documentType) {
		return documentTypeMapper.add(documentType);
	}

	@Override
	public int delete(Integer documentTypeId) {
		return documentTypeMapper.delete(documentTypeId);
	}

	@Override
	public int update(DocumentType documentType) {
		return documentTypeMapper.update(documentType);
	}

	@Override
	public DocumentType findById(Integer documentTypeId) {
		return documentTypeMapper.getById(documentTypeId);
	}

	@Override
	public List<DocumentType> findAll() {
		List<DocumentType> list = documentTypeMapper.getAll();
		for (DocumentType documentType : list) {
			findChilds(documentType);
		}
		
		return list;
	}

	public void findChilds(DocumentType documentType){
		if(documentType.getLevelId()!=4){
			List<DocumentType> childs = findByParent(documentType.getDocTypeId());
			documentType.setChildren(childs);
			if(childs!=null){
				for (DocumentType documentType2 : childs) {
					findChilds(documentType2);
				}
			}
		}
	}
	
	
	@Override
	public List<DocumentType> findByParent(Integer parentTypeId) {
		return documentTypeMapper.getByParent(parentTypeId);
	}

	@Override
	public List<DocumentType> findLikeName(String docTypeName) {
		List<DocumentType> list = documentTypeMapper.getLikeName(docTypeName);
		
		for (DocumentType documentType : list) {
			findChilds(documentType);
		}
		return list;
	}

	@Override
	public PageSupport<DocumentType> findPageByNameAndStatus(String docTypeName, Integer status,Integer levelId, Integer pageIndex, Integer pageSize) {
		PageSupport<DocumentType> pageSupport=new PageSupport<>();

		int totalCount = documentTypeMapper.count(docTypeName, status,levelId);
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		if (totalCount>0){
			List<DocumentType> list = documentTypeMapper.getPageByNameAndStatus(docTypeName, status,levelId, pageSupport.getStartRow(), pageSize);
			pageSupport.setList(list);
		}
		return pageSupport;
	}

	@Override
	public int count(String docTypeName, Integer status) {
		return 0;
	}

	@Override
	public List<DocumentType> findParents() {
		return documentTypeMapper.getParents();
	}

	@Override
	public int findChildMaxId(Integer docTypeId) {
		return documentTypeMapper.getChildMaxId(docTypeId);
	}

	@Override
	public int checkId(Integer docTypeId) {
		return documentTypeMapper.checkId(docTypeId);
	}

	@Override
	public int updateStatus(Integer status, Integer docTypeId, Integer updateBy) {
		List<Integer> childDocTypeIds = documentTypeMapper.getChildDocTypeIds(docTypeId);
		int count = documentTypeMapper.updateStatus(status, childDocTypeIds, updateBy);
		return count;
	}
}
