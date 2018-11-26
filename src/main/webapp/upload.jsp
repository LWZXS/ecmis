<%@page import="org.apache.log4j.Logger"%>
<%@page import="com.ecmis.utils.Constants"%>
<%@page import="java.io.File"%>
<%@page import="com.ecmis.office.upload.SmartUploadException"%>
<%@page import="com.ecmis.office.upload.SmartUpload"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="java.text.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.sql.*"%>
<%
	/*
	 FileOutputStream fileOut=new FileOutputStream("c:\\aab.txt"); 
	 DataInputStream din=new DataInputStream(request.getInputStream()); 
	 int formDataLength=request.getContentLength(); 
	 byte dataBytes[]=new byte[formDataLength];
	 //int num=din.skipBytes(10);
	 din.readFully(dataBytes,0,formDataLength);
	 fileOut.write(dataBytes); 
	 fileOut.close(); 
	 din.close(); 
	 */

	SmartUpload uploader = new SmartUpload();
	String msg = "";
	String flag = "";
	String flsid = "";
	String num = "";
	String fname = "";
	String oper = "";
	long filesize = 0;
	try {
			uploader.initialize(config, request, response);// 初始化上载器
			uploader.upload(); // 上载表单数据
			// 此时才能读取表单数据
			Enumeration<?> e = uploader.getRequest().getParameterNames();
			while (e.hasMoreElements()) { //遍历所有表单参数(不包括文件)
				String key = (String) e.nextElement();
				if ("num".equals(key)) {
					num = uploader.getRequest().getParameterValues(key)[0];
					System.out.println(num + "<br>");
				}
				if ("fname".equals(key)) {
					fname = uploader.getRequest().getParameterValues(key)[0];
					System.out.println(fname + "<br>");
				}
				if ("oper".equals(key)) {
					oper = uploader.getRequest().getParameterValues(key)[0];
					System.out.println(oper + "<br>");
				}
				if ("flsid".equals(key)) {
					flsid = uploader.getRequest().getParameterValues(key)[0];
					System.out.println(flsid + "<br>");
				}
				if ("flag".equals(key)) {
					flag = uploader.getRequest().getParameterValues(key)[0];
					System.out.println(flag + "<br>");
				}
			}
			String realPath = null;//session.getServletContext().getRealPath(File.separator+"statics"+File.separator+"file"+File.separator);
			//文档路径
			realPath=Constants.INNER_DOCUMENT_PATH;
			String mainBody = null;
			
			System.out.println("=============saveBody1:"+realPath);
			Logger logger=Logger.getLogger(this.getClass());
			logger.debug("========#############=====saveBody1:"+realPath);
			
			
			for (int i = 0; i < uploader.getFiles().getCount(); i++) {
				com.ecmis.office.upload.File myFile = uploader.getFiles()
						.getFile(i);
				if (!myFile.isMissing()) { //文件上传成功
					String fileName = realPath + myFile.getFileName();//new SimpleDateFormat("yyyyMMdd").format(new Date())+ (int) (Math.random() * 90+10)+"." + myFile.getFileExt();
					String fileExt = myFile.getFieldName();
					if (fileExt.equals("docfile") && (flag.equals("1") || flag.equals("11"))) {
						fileName = realPath+ flsid + ".doc";
						mainBody = flsid + ".doc";
						filesize = myFile.getSize();
					}
					if (fileExt.equals("docfile") && (flag.equals("2") || flag.equals("12"))) {
						fileName = realPath+ flsid + ".xls";
						mainBody = flsid + ".xls";
						filesize = myFile.getSize();
					}
					if (fileExt.equals("docfile") && (flag.equals("3") || flag.equals("13"))) {
						fileName = realPath+ flsid + ".ppt";
						mainBody = flsid + ".ppt";
						filesize = myFile.getSize();
					}
					//  out.println(fileName+"<br>");
					System.out.println(fileName);
					System.out.println("保存正文成功！");
					logger.debug("========#############=====保存正文成功:"+fileName);
					myFile.saveAs(fileName, SmartUpload.SAVE_VIRTUAL);
				} //上一行为提示信息
			}
			// msg="上传成功,共上传"+uploader.getFiles().getCount()+"个文件.";
		} catch (SmartUploadException e) {
			msg = e.getMessage(); //将出错信息以提示信息形式显示
			e.printStackTrace();
		} catch (ServletException e) {
			msg = e.getMessage();
			e.printStackTrace();
		} catch (IOException e) {
			msg = e.getMessage();
			e.printStackTrace();
		}
	//保存数据到数据库 ---要改

	/* 

	String DBDriver = "sun.jdbc.odbc.JdbcOdbcDriver"; 
	String rootpath=application.getRealPath("/");
	String ConnStr="jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+rootpath+"\\database\\weboffice.mdb";			
	
	//String ConnStr = "jdbc:odbc:webofficedsn";
	Connection conn = DriverManager.getConnection(ConnStr); 
	try 
	{
		Class.forName(DBDriver).newInstance();  
	} 
	catch(java.lang.ClassNotFoundException e)
	{ 
		System.err.println("Conn(): " + e.getMessage()); 
	}



	try
	{		
		String sql="";
		String id="";
		PreparedStatement ps = null;
		if (oper.equals("doedit") || oper.equals("edit"))
		{ 
			sql="Update dt_document set o_size=?,o_name=? where o_flsid='"+flsid+"'";
		 System.out.println(sql);
			ps = conn.prepareStatement(sql);
		 	ps.setString(1,Long.toString(filesize));	
			ps.setString(2,fname);	
			ps.executeUpdate();
			
		}	else
		{
	 
			sql="INSERT INTO dt_document(o_flsid,o_size,o_name,o_flag) VALUES(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1,flsid);
			ps.setString(2,Long.toString(filesize));	
			ps.setString(3,fname);
			ps.setString(4,flag);
			ps.executeUpdate();
			 
		}
	

	

	}catch(SQLException e)
	{ 
		System.err.println("Upload Query Errinfo: " + flsid + filesize +fname + e.getMessage()); 
	}
	
	conn.close(); */
%>