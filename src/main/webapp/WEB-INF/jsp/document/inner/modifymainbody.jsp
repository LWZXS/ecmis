<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


	request.setCharacterEncoding("UTF-8");
	String strHeight = "100%";
	String strTitlebar = "1";
	String strToolbar = "1";
	String strHost = request.getServerName();
	String strURL = request.getRequestURI();
	strURL = strURL.substring(0, strURL.lastIndexOf("/") + 1);
	String strDefaultRoot = "http://" + strHost + strURL;
	String strOpenUrl = "http://" + strHost + strURL + "writefile.jsp";
	String strPdfSaveUrl = "http://" + strHost + strURL + "pdf.jsp";
	String strHTMLSaveUrl = "http://" + strHost + strURL + "html.jsp";
	String strppFileSaveUrl = "http://" + strHost + strURL+ "ppfile.jsp";
	strURL = "http://" + strHost + strURL + "uploadedit.jsp";
	String office = request.getParameter("office");
	String strflsid = request.getParameter("flsid");
	String strnum = request.getParameter("num");
	String strfname = request.getParameter("fname");
	String strfcreator = request.getParameter("fcreator");
	String tselect = request.getParameter("tselect");
	String strflag = request.getParameter("flag");
	String stroper = request.getParameter("oper");
	//要打开的文件名
	String docName = request.getParameter("docName");
	//要保存的文件名
	String mainBody = request.getParameter("mainBody");
	//office类型
	String type = request.getParameter("type");

	String strJsScript = "";

	String loadfun = "";
	if (office == "wps") {
		loadfun = "WebOpen('1');";
	} else {
		loadfun = "WebOpen('');";
	}

	String strid = request.getParameter("id");
	String crrtime = mainBody;
	
	if (stroper.compareTo("new") == 0) {
		strflsid = crrtime;
		/*
		switch(Integer.parseInt(strflag))	 
		{ 
			case 2:
			strflsid = strflsid+".xls";
			break;
			case 3:
			strflsid = strflsid+".ppt";
			break;
			default:
			strflsid = strflsid+".doc";
				
		}
		 */
		strURL = strURL + "?oper=new&flsid=" + strflsid;
		strnum = crrtime;
		stroper = "addnew";
		if (tselect != null && tselect.compareTo("0") == 0&& tselect != "") {
			strJsScript = strJsScript+ "<script language=javascript>flag='0';</script>";
			//	out.println( "<script language=javascript>flag='0';</script>");
			strOpenUrl = strOpenUrl + "?oper=new&id=" + tselect;
		} else {
			if (strflag != "") {
				//out.println(  "<script language=javascript>flag='"+strflag+"';</script>");
				strJsScript = strJsScript+ "<script language=javascript>flag='"	+ strflag + "';</script>";
			}
		}

		if (strfname == null || strfname == "") {
			strfname = crrtime;
		}
		if (strnum == "" || strnum == null)
			strnum = crrtime;

	}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
   <title>新增内部文档-正文</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript">
		var strRoot;
		var strOpenUrl;
		var strURL;
		var autoSave=1;
		var pfile='<%=strflsid%>'; 
		var flag='<%=strflag%>';
		strOpenUrl = '<%=strOpenUrl%>';
		strURL='<%=strURL%>';
		strRoot = '<%=strDefaultRoot%>';
		var strPdfSaveUrl='<%=strPdfSaveUrl%>';
		var strHTMLSaveUrl='<%=strHTMLSaveUrl%>';
		var strppFileSaveUrl='<%=strppFileSaveUrl%>';
	</script>
	<%=strJsScript%>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/webofficecss/style.css" type="text/css"></link>
  
 	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/webofficejs/weboffice.js"></script>
 </head>
  
  <body>
	<form action="WebDocEdit.jsp?oper=<%=stroper%>" name="frm" method="post" onsubmit="return WebSave()">
		<input type="hidden" value="<%=strflag%>" name="flag">
		<input type="hidden" name="oper" value=<%=stroper%> id="oper">
		<input type="hidden" name="flsid" value="<%=strflsid%>" />
		
		<input type="hidden" value="<%=mainBody %>" id="mainBody" name="mainBody"> 
		<input type="hidden" value="" id="field1" name="field1"> 
		<input type="hidden" value="" id="field2" name="field2"> 
		<input type="hidden" value="" id="field3" name="field3"> 
		<input type="hidden" value="" id="field4" name="field4"> 
		<input type="hidden" value="<%="http://" + request.getServerName() + request.getRequestURI() + "?" + request.getQueryString()%>" id=field5 name=field5> 
		<input type="hidden" value="<%=strDefaultRoot%>" id="field6" name="field6">
		<!-- 文件编号： -->
		<input type="hidden" class="text" name="num" value="<%=strnum%>">
		<!-- 文件名： -->
		<input type="hidden" class="text" style="width:280" name="fname" value="<%=strfname%>">
	    <input type="button" class="button" value="立即保存" style="width:80" onclick="WebHttpSave();">
	    <input type="button" class="button" value="页面视图" onclick="document.all.WebOffice.ShowView(3);">
		<input type="button" class="button" value="打印预览" onclick="document.all.WebOffice.ShowView(4);">
	    <input type=button class="button" value="桌面全屏" class="button" onclick="document.all.WebOffice.MenuBars=1;document.all.WebOffice.FullScreenType=1;document.all.WebOffice.WebFullScreen();">
	    <div style="height: 8px;"></div>
		<%-- 
	    <input type=button class="button" value="禁止文件菜单(不能新建、打开、保存等)" onclick="alert('此功能可以将控件文件菜单里的菜单项无效！');document.all.WebOffice.SetMenuDisplay(0);">
		<input type="button" class="button" value="打开" onclick="document.all.WebOffice.WebUrl('http://localhost<%=request.getContextPath() %>/jsp/temp/document6002.doc','Word.Document');"><br>
		
		<input type=button class="button" value="打开方式一" onclick="var a=document.all.WebOffice.WebLoadFile('http://localhost<%=request.getContextPath() %>/jsp/temp/document6002.doc',null);"><br>
		<input type=button class="button" value="打开方式二" onclick="var a=document.all.WebOffice.WebLoadFile('http://localhost<%=request.getContextPath() %>/jsp/temp/document6002.doc','Word.Document');"><br>
		<input type=button class="button" value="打开方式三" onclick="document.all.WebOffice.WebOpen('http://localhost<%=request.getContextPath() %>/jsp/temp/document6002.doc');"><br> --%>
		<script type="text/javascript" src="<%=request.getContextPath() %>/statics/webofficejs/webofficeocx.js" charset="utf-8"></script>
		<div id="divinfo" style="display:none;">
			<iframe style="position:absolute;left:300px;top:250px;background-color:transparent;" id=webifrm src="about:blank" width="580" height="19" scrolling="no" frameborder="0"></iframe>
			<div style="position:absolute;left:300px;top:250px;background-color:red;color:white;display:none;" id=webinfo>
				正在处理请求和上传数据，为确保成功，请先不要执行其它操作， 请您稍等 。。。
			</div>
		</div>
	</form>
	<script type="text/javascript">
		window.onload=function(){
			document.all.WebOffice.WebUrl('<%=basePath%>statics/file/word/<%=docName %>','Word.Document');
			//document.all.WebOffice.SetMenuDisplay(0);
		}
	</script>
  </body>
</html>
