package com.ecmis.utils;

import java.io.File;

public class Constants {

	/**
	 * 85号版本说明：基本界面确定
	 */
	public static final String LOGIN_USER="loginUser";
	public static final String LOGIN_USER_ROLES="loginUserRoles";
	public static final String LOGIN_USER_PROJECTS="loginUserProjects";
	public static final String LOGIN_USER_PROJECT="loginUserProject";
	public static final String LOGIN_FAIL_COUNT="loginFailCount";
	public static final String COOKIE_LOGIN_NAME="ecmislgnm";
	public static final String COOKIE_PASSWORD="ecmislgpd";
	
	public static final String NOT_LOGIN_JSON="{\"result\":\"notLogin\"}";
	public static final String SUCCESS_JSON="{\"result\":\"success\"}";
	public static final String SUCCESS="success";
	
	public static final String NOT_LOGIN="notLogin";
	
	public static final String FILE_PATH="filePath";
	
	public static final int MAX_FILE_UPLOAD_SIZE=1024*1024*2;//普通
	public static final int MAX_DOC_FILE_UPLOAD_SIZE=1024*1024*5;//word文档
	public static final String FAIL_JSON = "{\"result\":\"fail\"}";
	public static final String FAIL = "fail";
	
	public static final int PAGE_INDEX=1;
	public static final int PAGE_SIZE=10;
	
	public static final String INNER_ATTACHMENT_PATH="statics" + File.separator +"file"+ File.separator + "innerAttachment";
	public static final String USER_ICON="statics" + File.separator +"file"+ File.separator + "user_icon";
	public static final String DOCUMENT_TYPE_PATH="statics" + File.separator +"file"+ File.separator + "word";
	//public static final String INNER_DOCUMENT_PATH="/ecmis/statics/file/";
	public static final String INNER_DOCUMENT_PATH=File.separator+"statics" + File.separator +"file"+ File.separator;
	
	
}
