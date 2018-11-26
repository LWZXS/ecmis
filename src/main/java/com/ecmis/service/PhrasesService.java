package com.ecmis.service;

import java.util.List;

import com.ecmis.pojo.Phrases;

public interface PhrasesService {

	public int add(Phrases phrases);
	
	public int delete(Integer phrasesId);
	
	public int update(Phrases phrases);
	
	public List<Phrases> findByCondition(Integer userId);
}
