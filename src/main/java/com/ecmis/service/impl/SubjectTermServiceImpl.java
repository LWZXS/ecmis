package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.subjectterm.SubjectTermMapper;
import com.ecmis.pojo.SubjectTerm;
import com.ecmis.service.SubjectTermService;

@Service
public class SubjectTermServiceImpl implements SubjectTermService {

	@Resource
	private SubjectTermMapper subjectTermMapper;
	
	@Override
	public int add(SubjectTerm subjectTerm) {
		return subjectTermMapper.add(subjectTerm);
	}

	@Override
	public int delete(Integer subjectTermId) {
		return subjectTermMapper.delete(subjectTermId);
	}

	@Override
	public int update(SubjectTerm subjectTerm) {
		return subjectTermMapper.update(subjectTerm);
	}

	@Override
	public SubjectTerm findById(Integer subjectTermId) {
		return subjectTermMapper.getById(subjectTermId);
	}

	@Override
	public List<SubjectTerm> findAll() {
		return subjectTermMapper.getAll();
	}

}
