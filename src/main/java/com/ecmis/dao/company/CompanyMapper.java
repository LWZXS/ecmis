package com.ecmis.dao.company;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ecmis.pojo.Company;

public interface CompanyMapper {


	public int add(Company company);
	
	public int delete(@Param("companyId") Integer companyId);
	
	public int update(Company company);
	
	public Company getById(@Param("companyId") Integer companyId);
	
	public List<Company> getAllAndUsers();
	
	public List<Company> getAll();

	List<Company> getByType(@Param("companyTypeId")Integer companyTypeId);
}
