package com.ecmis.dao.completiondirectory;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.CompletionDirectory;

public interface CompletionDirectoryMapper {

	public int add(CompletionDirectory completionDirectory);
	
	public int delete(@Param("completionDirectoryId") Integer completionDirectoryId);
	
	public int update(CompletionDirectory company);
	
	public CompletionDirectory getById(@Param("completionDirectoryId") Integer completionDirectoryId);
	
	public List<CompletionDirectory> getAll();
}
