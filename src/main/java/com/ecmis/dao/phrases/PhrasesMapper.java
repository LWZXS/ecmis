package com.ecmis.dao.phrases;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Phrases;

public interface PhrasesMapper {

	public int add(Phrases phrases);
	
	public int delete(Integer phrasesId);
	
	public int update(Phrases phrases);
	
	public List<Phrases> getByCondition(@Param("userId") Integer userId);
}
