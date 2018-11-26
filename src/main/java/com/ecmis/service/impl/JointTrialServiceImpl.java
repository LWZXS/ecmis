package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.jointtrial.JointTrialMapper;
import com.ecmis.pojo.JointTrial;
import com.ecmis.service.JointTrialService;

@Service
public class JointTrialServiceImpl implements JointTrialService {

	@Resource
	private JointTrialMapper jointTrialMapper;
	
	@Override
	public List<JointTrial> findJointTrialByDocument(Integer documentId) {
		return jointTrialMapper.getJointTrialByDocument(documentId);
	}

	@Override
	public int add(JointTrial jointTrial) {
		return jointTrialMapper.add(jointTrial);
	}

	@Override
	public int addList(Integer documentId, Integer[] users) {
		
		return jointTrialMapper.addList(documentId, users);
	}

	@Override
	public int update(JointTrial jointTrial) {
		return jointTrialMapper.update(jointTrial);
	}

	@Override
	public int delete(Integer documentId,Integer userId) {
		return jointTrialMapper.delete(documentId,userId);
	}

}
