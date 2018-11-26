package com.ecmis.dao.completionfiling;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.CompletionFiling;

public interface CompletionFilingMapper {


	public int add(CompletionFiling completionFiling);
	
	public int delete(@Param("completionFilingId") Integer completionFilingId);
	
	public int update(CompletionFiling completionFiling);
	
	public CompletionFiling getById(@Param("completionFilingId") Integer completionFilingId);
	
	public List<CompletionFiling> getAll();
}
