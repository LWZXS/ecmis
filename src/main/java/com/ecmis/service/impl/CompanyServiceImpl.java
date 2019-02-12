package com.ecmis.service.impl;

import com.ecmis.dao.company.CompanyMapper;
import com.ecmis.pojo.Company;
import com.ecmis.service.CompanyService;
import com.ecmis.utils.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

	@Override
	public Company findByUser(Integer userId) {
		return companyMapper.getByUser(userId);
	}

	@Override
	public PageSupport<Company> findByPage(String companyName, Integer status, Integer pageIndex, Integer pageSize) {

		PageSupport<Company> pageSupport=new PageSupport<>();
		int totalCount = companyMapper.count(companyName, status);
		pageSupport.setTotalCount(totalCount);
		pageSupport.setPageSize(pageSize);
		pageSupport.setCurrentPageNo(pageIndex);
		if (totalCount>0){
			List<Company> list = companyMapper.getByPage(companyName, status, pageSupport.getStartRow(), pageSize);
			pageSupport.setList(list);
		}
		return pageSupport;
	}

	@Override
	public int count(String companyName, Integer status) {
		return companyMapper.count(companyName, status);
	}

	@Override
	public int checkCompanyName(String companyName) {
		return companyMapper.checkCompanyName(companyName);
	}

	@Override
	public int updateStatus(Integer modifyUser, Integer status, Integer companyId) {
		return companyMapper.updateStatus(modifyUser,status,companyId);
	}
}
