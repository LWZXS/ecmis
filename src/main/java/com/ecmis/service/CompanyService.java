package com.ecmis.service;

import java.util.List;

import com.ecmis.pojo.Company;

public interface CompanyService {

	public int add(Company company);
	
	public int delete(Integer companyId);
	
	public int update(Company company);
	
	public Company findById(Integer companyId);
	
	public List<Company> findAll();
	
	public List<Company> findAllAndUsers();
}
