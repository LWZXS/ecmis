package com.ecmis.service;

import java.util.List;


import com.ecmis.pojo.SubjectTerm;

public interface SubjectTermService {

	public int add(SubjectTerm subjectTerm);
	
	public int delete(Integer subjectTermId);
	
	public int update(SubjectTerm subjectTerm);
	
	public SubjectTerm findById(Integer subjectTermId);
	
	public List<SubjectTerm> findAll();
	
}
