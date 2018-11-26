package com.ecmis.pojo;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Project implements Serializable{

	/*
	 * Name	Code	Data Type	Length	Precision	Primary	Foreign Key	Mandatory
项目编号	projectId	int(10)	10		TRUE	FALSE	TRUE
项目名称	projectName	varchar(100)	100		FALSE	FALSE	TRUE
施工方	constructorId	int(10)	10		FALSE	FALSE	TRUE
建设单位	builderId	int(10)	10		FALSE	FALSE	TRUE
监理方	supervisorId	int(10)	10		FALSE	FALSE	TRUE
总监	chiefInspectorId	int(10)	10		FALSE	FALSE	FALSE
副总监	deputyDirectorId	int(10)	10		FALSE	FALSE	FALSE
文员	clerkId	int(10)	10		FALSE	FALSE	FALSE
creationUser	creationUser	int(10)	10		FALSE	FALSE	TRUE
modifuUser	modifuUser	int(10)	10		FALSE	FALSE	FALSE
status	status	int(1)	1		FALSE	FALSE	TRUE
creationDate	creationDate	datetime			FALSE	FALSE	TRUE
modifyDate	modifyDate	datetime			FALSE	FALSE	FALSE
	 */
	/**
	 * 项目编号
	 */
	private Integer projectId;
	/**
	 * 项目名称
	 */
	private String projectName;
	/**
	 * 建设单位
	 */
	private Integer builderId;
	private Company builder;
	/**
	 * 施工方
	 */
	private Integer constructorId;
	private Company constructor;
	/**
	 * 监理方
	 */
	private Integer supervisorId;
	private Company supervisor;
	/**
	 * 总监
	 */
	private Integer chiefInspectorId;
	private User chiefInspector;
	/**
	 * 副总监
	 */
	private Integer deputyDirectorId;
	private User deputyDirector;
	/**
	 * 文员
	 */
	private Integer clerkId;
	private User clerk;
	/**
	 * 监理工程师
	 */
	private Integer supervisionEngineerId;
	private User supervisionEngineer;
	
	private Integer creationUser;
	private User creator;
	private Integer modifuUser;
	private Integer status;
	@JSONField(format="yyyy-MM-dd")
	private Date creationDate;
	@JSONField(format="yyyy-MM-dd")
	private Date modifyDate;
	public Project() {
		super();
	}
	public Project(Integer projectId, String projectName, Integer builderId,
			Integer constructorId, Integer supervisorId,
			Integer chiefInspectorId, Integer deputyDirectorId,
			Integer clerkId, Integer creationUser, Integer modifuUser,
			Integer status, Date creationDate, Date modifyDate) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.builderId = builderId;
		this.constructorId = constructorId;
		this.supervisorId = supervisorId;
		this.chiefInspectorId = chiefInspectorId;
		this.deputyDirectorId = deputyDirectorId;
		this.clerkId = clerkId;
		this.creationUser = creationUser;
		this.modifuUser = modifuUser;
		this.status = status;
		this.creationDate = creationDate;
		this.modifyDate = modifyDate;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Integer getBuilderId() {
		return builderId;
	}
	public void setBuilderId(Integer builderId) {
		this.builderId = builderId;
	}
	public Integer getConstructorId() {
		return constructorId;
	}
	public void setConstructorId(Integer constructorId) {
		this.constructorId = constructorId;
	}
	public Integer getSupervisorId() {
		return supervisorId;
	}
	public void setSupervisorId(Integer supervisorId) {
		this.supervisorId = supervisorId;
	}
	public Integer getChiefInspectorId() {
		return chiefInspectorId;
	}
	public void setChiefInspectorId(Integer chiefInspectorId) {
		this.chiefInspectorId = chiefInspectorId;
	}
	public Integer getDeputyDirectorId() {
		return deputyDirectorId;
	}
	public void setDeputyDirectorId(Integer deputyDirectorId) {
		this.deputyDirectorId = deputyDirectorId;
	}
	public Integer getClerkId() {
		return clerkId;
	}
	public void setClerkId(Integer clerkId) {
		this.clerkId = clerkId;
	}
	public Integer getCreationUser() {
		return creationUser;
	}
	public void setCreationUser(Integer creationUser) {
		this.creationUser = creationUser;
	}
	public Integer getModifuUser() {
		return modifuUser;
	}
	public void setModifuUser(Integer modifuUser) {
		this.modifuUser = modifuUser;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public Integer getSupervisionEngineerId() {
		return supervisionEngineerId;
	}
	public void setSupervisionEngineerId(Integer supervisionEngineerId) {
		this.supervisionEngineerId = supervisionEngineerId;
	}
	public Company getBuilder() {
		return builder;
	}
	public void setBuilder(Company builder) {
		this.builder = builder;
	}
	public Company getConstructor() {
		return constructor;
	}
	public void setConstructor(Company constructor) {
		this.constructor = constructor;
	}
	public Company getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(Company supervisor) {
		this.supervisor = supervisor;
	}
	public User getChiefInspector() {
		return chiefInspector;
	}
	public void setChiefInspector(User chiefInspector) {
		this.chiefInspector = chiefInspector;
	}
	public User getDeputyDirector() {
		return deputyDirector;
	}
	public void setDeputyDirector(User deputyDirector) {
		this.deputyDirector = deputyDirector;
	}
	public User getClerk() {
		return clerk;
	}
	public void setClerk(User clerk) {
		this.clerk = clerk;
	}
	public User getSupervisionEngineer() {
		return supervisionEngineer;
	}
	public void setSupervisionEngineer(User supervisionEngineer) {
		this.supervisionEngineer = supervisionEngineer;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	
	
}
