package com.ecmis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ecmis.dao.company.CompanyMapper;
import com.ecmis.pojo.Company;
import com.ecmis.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Resource
	private CompanyMapper companyMapper;
	
	@Override
	public int add(Company company) {
		return companyMapper.add(company);
	}

	@Override
	public int delete(Integer companyId) {
		return companyMapper.delete(companyId);
	}

	@Override
	public int update(Company company) {
		return companyMapper.update(company);
	}

	@Override
	public Company findById(Integer companyId) {
		return companyMapper.getById(companyId);
	}

	@Override
	public List<Company> findAll() {
		return companyMapper.getAll();
	}

	public List<Company> findAllAndUsers(){
		return companyMapper.getAllAndUsers();
	}

	@Override
	public List<Company> findByType(Integer companyTypeId) {
		return companyMapper.getByType(companyTypeId);
	}
}
