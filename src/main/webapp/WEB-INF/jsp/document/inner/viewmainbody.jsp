<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String docName=(String)request.getAttribute("mainBody");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示正文</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/webofficecss/style.css" type="text/css"></link>
  
 	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/webofficejs/weboffice.js"></script>
 	
 	<%--可能为阅读或修改 --%>
 	
 	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/webofficejs/webofficeocx.js" charset="utf-8"></script>
    <script type="text/javascript">
		window.onload=function(){
			//document.all.WebOffice.WebUrl('http://localhost<%=request.getContextPath() %>/statics/file/<%=docName %>','Word.Document');
			//document.all.WebOffice.SetMenuDisplay(0);
			var a=document.all.WebOffice.WebLoadFile('<%=basePath%>statics/file/<%=docName %>',null);
		}
	</script>
  </head>
  
  <body>
  </body>
</html>
