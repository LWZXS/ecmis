<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/localjs/flow.js"></script>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		.filebtns{
			position: absolute;
			top: 5px;
			right: 30px;
			z-index: 1;
		}
		body{
			height: 650px;
		
		}
		textarea{
			resize:none;
			width: 498px;
		}
		
		.areabtn{
			height: 44px;
			vertical-align: middle;
			margin-top: -38px;
		}
	</style>
  </head>
  
  <body class="main_body">
	<div class="easyui-panel" title="个人代办" style="width:100% ;  position: relative; height: 100%;">
		<span class="filebtns">
			<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存正文</a>
			<a href="javascript:void(0);" id="flow" class="easyui-linkbutton" datas="documentId:${doc.documentId },docStatusId:${doc.documentStatus.docStatusId }" data-options="plain:true,iconCls:'icon-flow'">流程</a>
			<a href="javascript:void(0);" onclick="save();" class="easyui-linkbutton" data-options="plain:true">处理</a>
		</span>
		<br />
		<div style="padding:10px; width: 800px; margin: 15px auto;" align="center">
			<div style="margin:20px 0;"></div>
				<table id="dg" title="Custom DataGrid Pager" style="width:700px;height:250px"
						data-options="rownumbers:true,fitColumns:true,fit:true,loadMsg:'正在加载，请稍后......',singleSelect:true,pagination:true,url:'datagrid_data1.json',toolbar:'#tb',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'itemid',width:80">Item ID</th>
							<th data-options="field:'productid',width:100">Product</th>
							<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
							<th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
							<th data-options="field:'attr1',width:240">Attribute</th>
							<th data-options="field:'status',width:60,align:'center'">Status</th>
						</tr>
					</thead>
				</table>
				<div id="tb" style="padding:2px 5px;">
					Date From: <input class="easyui-datebox" style="width:110px">
					To: <input class="easyui-datebox" style="width:110px">
					Language: 
					<select class="easyui-combobox" panelHeight="auto" style="width:100px">
						<option value="java">Java</option>
						<option value="c">C</option>
						<option value="basic">Basic</option>
						<option value="perl">Perl</option>
						<option value="python">Python</option>
					</select>
					<a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
				</div>
		</div>
		<!-- 流程Dialog  flow start -->
		<div id="flow-dlg" class="easyui-dialog" closed="true" title="流程" style="width:940px;height:400px;padding:10px;"
				data-options="buttons:'#flow-buttons'">
			<iframe name="flowIframe" id="flowIframe" scrolling="no" frameborder="0"  src="document/flow.html?docStatusId=${doc.documentStatus.docStatusId }" style="width:100%;height:100%;"></iframe>
		</div>
		<div id="flow-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#flow-dlg').dialog('close');">关闭</a>
		</div>
		<!-- 流程Dialog  flow end -->
	</div>
	<script type="text/javascript">
		$(function(){
			var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				buttons:[{
					iconCls:'icon-search',
					handler:function(){
						alert('search');
					}
				},{
					iconCls:'icon-add',
					handler:function(){
						alert('add');
					}
				},{
					iconCls:'icon-edit',
					handler:function(){
						alert('edit');
					}
				}]
			});			
		})
	</script>
  </body>
</html>
