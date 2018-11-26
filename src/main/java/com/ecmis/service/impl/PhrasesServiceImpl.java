package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.phrases.PhrasesMapper;
import com.ecmis.pojo.Phrases;
import com.ecmis.service.PhrasesService;

@Service
public class PhrasesServiceImpl implements PhrasesService {

	@Resource
	private PhrasesMapper phrasesMapper;
	
	public int add(Phrases phrases) {
		return phrasesMapper.add(phrases);
	}

	public int delete(Integer phrasesId) {
		return phrasesMapper.delete(phrasesId);
	}

	public int update(Phrases phrases) {
		return phrasesMapper.update(phrases);
	}

	public List<Phrases> findByCondition(Integer userId) {
		return phrasesMapper.getByCondition(userId);
	}

}
