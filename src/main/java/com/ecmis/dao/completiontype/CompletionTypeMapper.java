package com.ecmis.dao.completiontype;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.CompletionType;

public interface CompletionTypeMapper {


	public int add(CompletionType completionType);
	
	public int delete(@Param("completionTypeId") Integer completionTypeId);
	
	public int update(CompletionType completionType);
	
	public CompletionType getById(@Param("completionTypeId") Integer completionTypeId);
	
	public List<CompletionType> getAll();
}
