<%@page import="com.ecmis.utils.Constants"%>
<%@page import="com.ecmis.pojo.User"%>
<%@page import="com.ecmis.utils.RandomUtils"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User user=(User)session.getAttribute(Constants.LOGIN_USER);
	String currentDocTypeId=request.getParameter("currentDocTypeId");
	
	String filePath=(String)session.getAttribute(Constants.FILE_PATH);
	//poCtrl1.addCustomToolButton("保存", "saveMainBody()", 1);//添加自定义工具栏按钮
	//poCtrl1.setSaveFilePage("savefile.jsp?docName="+(RandomUtils.getNextInt()+""+System.currentTimeMillis())+docName);//如要保存文件，此行必须
	//打开文件
	FileInputStream in = new FileInputStream(new File(filePath)); 
	/* 	
	String templatePath = "D:\\word\\template.doc";
	 */
	//把range范围内的${reportDate}替换为当前的日期
	String outPath=session.getServletContext().getRealPath("/statics/file/temp");
	int rd=RandomUtils.getNextInt();
	File file=new File(outPath+"/"+rd+".doc");
	file.getParentFile().mkdirs();
	OutputStream os = new FileOutputStream(file);
	//把doc输出到输出流中
	os.flush();
	os.close();
	in.close();
	%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改正文</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src=" jquery.min.js"></script>
    <script type="text/javascript" src=" pageoffice.js" id="po_js_main"></script>
	<script type="text/javascript">
	
	</script>
  </head>
  
  <body>
    <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    <a href='javascript:POBrowser.openWindow("word.jsp","width=800px;height=800px;")'>${param.docName }</a> 
  </body>
</html>
