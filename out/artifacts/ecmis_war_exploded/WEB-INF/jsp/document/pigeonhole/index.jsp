<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>归档文档</title>
    
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
	
  	<style type="text/css">
  		a:link{
  			text-decoration: none;
  			color:#333;
  			
  		}
  		
  	</style>
  </head>
  
  <body>
    <div id="main" class="easyui-layout" style="width:100%;height:100%;">
		<div id="west_panel" region="west" split="true" title="文件类型" style="width:200px; overflow: auto;" data-options="plain:true,iconCls:'icon-file'">
			<p style="padding:5px;margin-left: 10px;">请选择文件类型:</p>
			<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true" id="typeTree" style="margin-left: 10px;"></ul>
		</div>
		<div id="content_panel" region="center" title="归档文档" style="padding:5px; width: 100%">
			<div style="overflow:auto; width: 100%; height: 100%;">
				<!-- <iframe name="pigeonholeframe" id="pigeonholeframe" scrolling="yes" frameborder="0"  src="user/login.html" style="width:100%;height:100%;"></iframe> -->
				<table id="dg" title="" style="width:100%;height: 100%"
						data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',fitColumns:true,singleSelect:true,pagination:true,striped:true,toolbar:'#tb',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'documentName',width:150,align:'left',resizable:true">文档名称</th>
							<th data-options="field:'docSource',width:150,align:'left'">来源</th>
							<th data-options="field:'creationUser',width:120,align:'left'">创建人</th>
							<th data-options="field:'creationDate',width:120,align:'center',resizable:true,sortable:true,order:'desc'">创建日期</th>
							<th data-options="field:'subjectTermName',width:120,align:'center'">主题词</th>
							<th data-options="field:'attachment',width:180,align:'left'">附件</th>
							<th data-options="field:'status',width:120,align:'center'">状态</th>
						</tr>
					</thead>
				</table>
				<div id="tb" style="padding:2px 5px;">
					<form action="document/pended.json" id="s_pendedFrm">
						<input type="hidden" name="docStatusId" value="9">
						<input type="hidden" name="status" value="1">
						<input type="hidden" name="docTypeId" id="docTypeId" value="">
						开始时间: <input class="easyui-datebox" style="width:110px" name="startTime">
						结束时间: <input class="easyui-datebox" style="width:110px" name="endTime">
						文档名称: <input class="easyui-textbox" style="width:110px" name="documentName">
						<a href="javascript:void(0)" id="deleteBtn" class="easyui-linkbutton" iconCls="icon-search">删除</a>
						<a href="javascript:void(0)" id="s" class="easyui-linkbutton" iconCls="icon-search">导出</a>
						<a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search">查询</a>
					</form>
				</div>
			
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function(){
			//加载文档类型
			$("#typeTree").tree({
				url : "documentType/findAll",//请求路径，id为根节点的id  
				onLoadSuccess : function(node, data) {
					var tree = $(this);
					if (data) {
						$(data).each(function(index, d) {
							if (this.state == "closed") {
								tree.tree("expandAll");
							}
						});
					}
				},
				onClick:function(node){
					/*
					id：节点的 id
					text：节点的文字
					checked：节点是否被选中
					attributes：节点自定义属性
					target：被点击目标的 DOM 对象
					*/
					if(node.id && !node.attributes.isParent){
						//alert(node.id);
						$("#docTypeId").val(node.id);
						$("#dg").datagrid({
							url:'document/pended.json?'+$("#pendedFrm").serialize()
							/* ,queryParams: $("#pendingFrm").serializeArray() */
						});
					}
				}
			});
			
			$("#searchBtn").click(function(){
				//alert($("#pendingFrm").serialize());
				$('#dg').datagrid({
					url:'document/pended.json?'+$("#pendedFrm").serialize()
					/* ,queryParams: $("#pendingFrm").serializeArray() */
				});
			});
		
			//加载数据
			$('#dg').datagrid({
				/* resize:{   
			        height:dgHeight
			    }, */
				url:'document/pending.json',
				queryParams: {
					docStatusId:$("input[name=docStatusId]").val(),
					status:$("input[name=status]").val()
				},
			    onLoadSuccess:function(data){
			    	
			    },
			    onDblClickRow:function(rowIndex,rowData){
			    	window.location.href='document/view/'+rowData.documentId+'/pending';
			    },
				columns:[[
					{field:'documentName',title:'文档名称', width:260,align:'left',resizable:true},
					{field:'company',title:'来源', width:180,align:'left',resizable:true,
						formatter: function(value,row,index){
							if (row.company){
								return row.company.companyName;
							} else {
								return value;
							}
						}
					},
					{field:'creationUser',title:'创建人', width:60,align:'center',resizable:true,
						formatter: function(value,row,index){
							if (row.creator){
								return row.creator.userName;
							} else {
								return value;
							}
						}
					},
					{field:'creationDate',title:'创建日期', width:100,align:'center',resizable:true},
					{field:'subjectTermName',title:'主题词', width:150,align:'left',resizable:true},
					{field:'attachment',title:'附件', width:180,align:'left',resizable:true},
					{field:'documentStatus',title:'状态', width:50,align:'center',
						formatter: function(value,row,index){
							if (row.documentStatus){
								return row.documentStatus.docStatusName;
							} else {
								return value;
							}
						}
					}
				]]
			});
			
		});
		
		function searchPended(){
			//提交表单
			//关闭dialog
			$('#search-dlg').dialog('close');
		}
	</script>
  </body>
</html>
