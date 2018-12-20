<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="elf" uri="/ELMenu" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>内部文档-首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
	
  	
  	<style type="text/css">
  		*{
			box-sizing:border-box;
			-moz-box-sizing:border-box;   /*Firefox*/
			-webkit-box-sizing:border-box;  /*Ssfari*/
			-ms-box-sizing:border-box;
		
		}
  		a:link{
  			text-decoration: none;
  			color:#333;
  			
  		}
  		.LeftMenu li{
  			list-style: none;
  		
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
  
  <body>
    <div class="easyui-layout" style="width:100%;height:100%;" id="main">
		<div id="west_panel" region="west" split="true" title="发件管理" style="width:150px; height: 100%" data-options="plain:true,iconCls:'icon-file'">
			<p style="padding:5px;margin:0;">请选择您要的操作:</p>
			<ul class="LeftMenu">
				<%-- 
				<c:if test="${not empty sessionScope.loginUserProject }">
					<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="document/add.html" target="innerIframe">新建文档</a></li>
				</c:if> 
				--%>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="document/add.html" target="innerIframe">新建文档</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="document/todo.html" target="innerIframe">个人待办</a></li>
				
				<%--
				<c:set var="isClerk" value="${elf:filterMenu(loginUser) }"></c:set>
				<c:if test="${isClerk }">
					<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="document/pending.html" target="innerIframe">待归档文件</a></li>
				</c:if> 
				--%>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="document/pending.html" target="innerIframe">待归档文件</a></li>
				
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_draft.png"></img><a href="document/draft.html" target="innerIframe">草稿</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_issued.png"></img><a href="document/issued.html" target="innerIframe">已发文件</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_havetodo.png"></img><a href="document/havetodo.html" target="innerIframe">已办文件</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_receive.png"></img><a href="document/receive.html" target="innerIframe">接收文档</a></li>
			</ul>
		</div>
		<div id="content_panel" region="center" title="" style="width: 100%; height: 100%;">
			<iframe name="innerIframe" id="innerIframe" scrolling="no" frameborder="0"  src="document/todo.html" style="width:100%;height:100%;"></iframe>
		</div>
	</div>
  </body>
  <script type="text/javascript">
		var winHeight;
		var winWidth;
		if (window.innerHeight){
			winHeight = window.innerHeight;
			winWidth = window.innerWidth;
			
		}else if ((document.body) && (document.body.clientHeight)){
			winHeight = document.body.clientHeight;
			winWidth = document.body.clientWidth;
			
		}
		
		//alert("winWidth:"+winWidth+"---------winHeight"+winHeight);
		$(function(){
			$("#west_panel").css("height",winHeight-67);
			$("#content_panel").css("height",winHeight-67);
			$("#main").css("height",winHeight-20);
		});
	</script>
</html>
