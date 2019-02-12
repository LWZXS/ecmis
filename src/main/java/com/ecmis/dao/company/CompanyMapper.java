package com.ecmis.dao.company;

import com.ecmis.pojo.Company;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CompanyMapper {


	public int add(Company company);
	
	public int delete(@Param("companyId") Integer companyId);
	
	public int update(Company company);
	
	public Company getById(@Param("companyId") Integer companyId);
	
	public List<Company> getAllAndUsers();
	
	public List<Company> getAll();

	List<Company> getByType(@Param("companyTypeId")Integer companyTypeId);

	Company getByUser(@Param("userId")Integer userId);

	List<Company> getByPage(@Param("companyName")String companyName,@Param("status")Integer status,@Param("startRow")Integer startRow,@Param("pageSize")Integer pageSize);
	int count(@Param("companyName")String companyName,@Param("status")Integer status);

	int checkCompanyName(@Param("companyName")String companyName);

	int updateStatus(@Param("modifyUser")Integer modifyUser,@Param("status")Integer status,@Param("companyId")Integer companyId);
}
