package com.ecmis.service;

import com.ecmis.pojo.Company;
import com.ecmis.utils.PageSupport;

import java.util.List;

public interface CompanyService {

	public int add(Company company);
	
	public int delete(Integer companyId);
	
	public int update(Company company);
	
	public Company findById(Integer companyId);
	
	public List<Company> findAll();
	
	public List<Company> findAllAndUsers();

	List<Company> findByType(Integer companyTypeId);

	Company findByUser(Integer userId);

	PageSupport<Company> findByPage(String companyName, Integer status, Integer pageIndex, Integer pageSize);

	int count(String companyName,Integer status);

	int checkCompanyName(String companyName);

	int updateStatus(Integer modifyUser, Integer status, Integer companyId);

}
