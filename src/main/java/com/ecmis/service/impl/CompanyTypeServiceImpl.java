package com.ecmis.service.impl;

import com.ecmis.dao.companytype.CompanyTypeMapper;
import com.ecmis.pojo.CompanyType;
import com.ecmis.service.CompanyTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CompanyTypeServiceImpl implements CompanyTypeService {

	@Resource
	private CompanyTypeMapper companyTypeMapper;
	@Override
	public List<CompanyType> findAll() {
		return companyTypeMapper.getAll();
	}
}
