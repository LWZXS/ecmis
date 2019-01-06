<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'projectFileMgr.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>
	
  	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/projectfile.css" type="text/css"></link>
  
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
	
  	
  	<style type="text/css">
  		a:link{
  			text-decoration: none;
  			color:#333;
  			
  		}
  		
  		.LeftMenu li img,.LeftMenu li a{
  			vertical-align: middle;
  		}
  		
  		.LeftMenu li a{
  			margin-left: 10px;
  		}
  		.LeftMenu li{
  			margin: 0 auto;
  			padding: 5px;
  			border: 1px solid #fff;
  			width: 120px;
  			border-radius:5px;
  			text-align: left;
  		}
  		
  		
  		.LeftMenu li:hover{
  			border: 1px solid #95B8E7;
  			border-radius:5px;
  		}
  	</style>

  
  </head>
  
  <body class="main_body">
    <div class="easyui-layout" style="width:100%;height:100%;">
		<div region="west" split="true" title="发件管理" style="width:200px;" data-options="plain:true,iconCls:'icon-file'">
			<p style="padding:5px;margin:0;">请选择您要的操作:</p>
			<ul class="LeftMenu">
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="document/add.html" target="contentIframe">新建文档</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="document/todo.html" target="contentIframe">个人待办</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="document/pending.html" target="contentIframe">待归档文件</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_draft.png"></img><a href="document/draft.html" target="contentIframe">草稿</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_issued.png"></img><a href="document/issued.html" target="contentIframe">已发文件</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_havetodo.png"></img><a href="document/havetodo.html" target="contentIframe">已办文件</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_receive.png"></img><a href="document/receive.html" target="contentIframe">接收文档</a></li>
			</ul>
		</div>
		<div id="content" region="center" title="&nbsp;内部文档" style="width: 100%;">
			<iframe name="contentIframe" id="contentIframe" scrolling="yes" frameborder="0"  src="document/todo.html" style="width:100%;height:100%;"></iframe>
		</div>
	</div>
  </body>
</html>
