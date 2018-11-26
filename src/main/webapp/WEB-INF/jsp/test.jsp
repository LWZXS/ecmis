<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div title="监理工作联系单" style="padding:10px; border: 1px solid black" >
			
				<div style="width: 100%; margin: 15px auto 100px;" align="center">
					<form action="" id="ff2" class="easyui-form" >
					<table cellpadding="0" cellspacing="0" border="1" width="660px;" height="650px;">
						<tr class="singlet">
							<td colspan="4"><h1 style="font-size: 30px;" align="center">监理工作联系单</h1></td>
							
						</tr>
						<tr class="singlet">
							<td>需回复<input type="checkbox" /></td>
							<td colspan="2">不需回复<input type="checkbox" /></td>
							<td>编号:</td>
							
						</tr>
						<tr class="singlet">
							<td>工程名称</td>
							<td><input value=""  /></td>
							<td>合同编号</td>
							<td><input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">致：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">主题：<input value=""  /></td>
							
						</tr>
						<tr class="multiple">
							<td colspan="4">内容：<textarea cols="80" rows="8"></textarea></td>
							
						</tr>
						<tr class="multiple">
							<td colspan="4">要求：<textarea cols="80" rows="8"></textarea></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">附图：<input type="file" /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">项目监理机构：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">总监理师/副总监理师：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">专业监理工程师：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">日期：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">填报说明</td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">本表一式<input value=""  />份，由项目监理机构填写，抄送相关单位</td>
							
						</tr>
						
						
					</table>
					</form>
				</div>
			
			</div>
			<div title="73工程联系单" style="padding:10px; border: 1px solid black" >
			
				<div style="width: 100%; margin: 15px auto 100px;" align="center">
					<form action="" id="ff3" class="easyui-form" >
					<table cellpadding="0" cellspacing="0" border="1" width="660px;" height="650px;">
						<tr class="singlet">
							<td colspan="4"><h1 style="font-size: 30px;" align="center">广西钦州电厂二期扩建工程<br/>工 程 联 系 单</h1></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="2">工程名：<input type="text" /></td>
							<td colspan="2">文件编号：<input type="text" /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">提出单位(部门)：<input value="" /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">主送：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="2">抄送：<input value=""  /></td>
							<td colspan="2">抄报：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="4">主题：<input value=""  /></td>
							
						</tr>
						<tr class="singlet">
							<td colspan="2">性质：<input value=""  /></td>
							<td colspan="2">
								需回复<input value="" type="checkbox" />
								不需回复<input value="" type="checkbox" />
								急<input value="" type="checkbox" />
								一般<input value="" type="checkbox" />
							
							</td>
							
						</tr>
						<tr class="multiple">
							<td colspan="4">内容：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;
							<textarea cols="180" rows="8"></textarea></td>
							
						</tr>
						<tr class="singlet">
							<td>经办人：<input type="text" /></td>
							<td colspan="2">签发：<input type="text" /></td>
							<td>日期：<input type="text" /></td>
							
						</tr>
						<tr class="multiple">
							<td colspan="4">相关单位(部门)意见：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<textarea cols="80" rows="8"></textarea></td>
							
						</tr>
						<tr class="singlet">
							<td>经办人：<input type="text" /></td>
							<td colspan="2">签发：<input type="text" /></td>
							<td>日期：<input type="text" /></td>
							
						</tr>
						<tr class="multiple">
							<td colspan="4">相关单位意见(无需相关单位或部门核签时，此栏填"无")：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<textarea cols="80" rows="8"></textarea></td>
							
						</tr>
						<tr class="singlet">
							<td>经办人：<input type="text" /></td>
							<td colspan="2">签发：<input type="text" /></td>
							<td>日期：<input type="text" /></td>
							
						</tr>
						<tr class="multiple">
							<td colspan="4">相关单位意见(无需相关单位或部门核签时，此栏填"无")：<textarea cols="80" rows="8"></textarea></td>
							
						</tr>
						<tr class="singlet">
							<td>经办人：<input type="text" /></td>
							<td colspan="2">签发：<input type="text" /></td>
							<td>日期：<input type="text" /></td>
							
						</tr>
						
						<tr class="singlet">
							<td colspan="4">本表一式5份，建设单位，监理单位各保存一份，施工单位保存三份</td>
						</tr>
						
					</table>
					</form>
				</div>
			
			</div>
  </body>
</html>
