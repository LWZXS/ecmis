package com.ecmis.dao.subjectterm;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.SubjectTerm;


public interface SubjectTermMapper {

	
	public int add(SubjectTerm subjectTerm);
	
	public int delete(@Param("subjectTermId") Integer subjectTermId);
	
	public int update(SubjectTerm subjectTerm);
	
	public SubjectTerm getById(@Param("subjectTermId") Integer subjectTermId);
	
	public List<SubjectTerm> getAll();
	
}
