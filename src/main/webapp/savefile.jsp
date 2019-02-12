%@ page language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.*" pageEncoding="utf-8"%>
<%
FileSaver fs=new FileSaver(request,response);
String id=request.getParameter("id");
fs.saveToFile(request.getSession().getServletContext().getRealPath("/statics/file")+"/"+fs.getFileName());
fs.close();
%>

