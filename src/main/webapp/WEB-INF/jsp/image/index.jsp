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
  
  		
  	</style>
  </head>
  
  <body>
    <div class="easyui-layout" style="width:100%;height:100%;">
		<div class="easyui-panel" style="padding:3px; margin-bottom: 5px;">
			<a href="document/inner.html" target="contentIframe" onclick="selectCurr(this);" class="easyui-linkbutton" option="innerFile" data-options="plain:true" style="margin:0 20px;">内部文档</a>|
			<a href="document/pigeonhole.html" target="contentIframe" onclick="selectCurr(this)" option="pigeonholeFile" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">归档文档</a>|
			<a href="document/system.html" target="contentIframe" onclick="selectCurr(this)" class="easyui-linkbutton" option="systemSet" data-options="plain:true" style="margin:0 20px;">系统设置</a>
		</div>
		<div style="overflow:auto; height: 100%; width: 100%">
			<iframe name="contentIframe" id="contentIframe" scrolling="yes" frameborder="0"  src="document/inner.html" style="width:100%;height:100%;"></iframe>
		</div>
	</div>
	
	<script type="text/javascript">
		function selectCurr(obj){
			$(obj).css('background','#B3D8FE').siblings().css('background','#fff');
		}
	</script>
  </body>
</html>
