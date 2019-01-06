<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'indexcontent.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="statics/localcss/common.css" type="text/css"></link>
	
	<script type="text/javascript" src="statics/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="statics/js/jquery.easyui.min.js"></script>

  </head>
  
  <body>
  	<div class="easyui-panel content" >
  	
	    This is my JSP page. <br>
  	</div>
  </body>
</html>
