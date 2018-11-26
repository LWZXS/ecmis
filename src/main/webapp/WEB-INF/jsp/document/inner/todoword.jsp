<%@page import="com.ecmis.utils.Constants"%>
<%@page import="com.ecmis.pojo.User"%>
<%@page import="com.ecmis.utils.RandomUtils"%>
<%@page import="org.apache.poi.hwpf.usermodel.Range"%>
<%@page import="org.apache.poi.hwpf.HWPFDocument"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.zhuozhengsoft.pageoffice.*" %>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User user=(User)session.getAttribute(Constants.LOGIN_USER);
	
	String filePath=(String)session.getAttribute("mainBody");
	String opr=(String)session.getAttribute("opr");
	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须
	//poCtrl1.addCustomToolButton("保存", "saveMainBody()", 1);//添加自定义工具栏按钮
	//poCtrl1.setSaveFilePage("savefile.jsp?docName="+(RandomUtils.getNextInt()+""+System.currentTimeMillis())+docName);//如要保存文件，此行必须
	if(opr.equals("update")){
		poCtrl1.setSaveFilePage(request.getContextPath()+"/document/saveTodoBody?filePath="+filePath);//如要保存文件，此行必须
	}
	poCtrl1.webOpen(filePath, OpenModeType.docNormalEdit, user.getUserName());
	%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>代办正文</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>
	<script type="text/javascript">
	
	</script>
  </head>
  
  <body>
    <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    <a href='javascript:POBrowser.openWindow("word.jsp","width=800px;height=800px;")'>${param.docName }</a> 
  </body>
  <%session.removeAttribute("mainBody"); %>
</html>
