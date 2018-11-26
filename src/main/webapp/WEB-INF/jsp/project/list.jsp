<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>项目列表</title>
    
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
		*{
			margin: 0;
			padding: 0;
 			box-sizing:content-box;
			-moz-box-sizing:content-box; /* Firefox */
			-webkit-box-sizing:content-box; /* Safari */
			-ms-box-sizing:content-box; /* IE */
		}
 		
	</style>
	
	<script type="text/javascript">
		
	</script>
  </head>
  
  <body>
	<table id="dg" title="项目列表" style="width:100%;height: 80% "
			data-options="rownumbers:true,singleSelect:true,pagination:true,striped:true,toolbar:'#tb',method:'get'">
	</table>
	<div id="tb" style="padding:2px 5px;">
		<form action="" id="searchFrm">
			状态: 
			<select class="easyui-combobox" panelHeight="auto" style="width:100px" name="status" id="status">
				<option value="">全部</option>
				<option value="1">正常</option>
				<option value="2">锁定</option>
			</select>
			<br />
			<a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete16'">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-update'">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock16'">锁定</a>
		</form>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({
				url:'project/list.do',
				/* queryParams: {
					startTime:$('input[name=startTime]').val(),
					endTime:$('input[name=endTime]').val(),
					statusId:$('select[name=statusId]').val()
				}, */
			    onLoadSuccess:function(data){
			    	
			    	if(data.result){
			    		alert("请登录！");
			    	}
			    },
			    onDblClickRow:function(rowIndex,rowData){
			    	//alert(rowIndex+rowData.documentId);
			    	window.location.href='document/view/'+rowData.documentId;
			    },
			    /*
			    
			    <th data-options="field:'userName',width:150,align:'left',resizable:true">用户全名</th>
				<th data-options="field:'loginName',width:150,align:'left'">登录账号</th>
				<th data-options="field:'email',width:120,align:'left'">邮箱</th>
				<th data-options="field:'officeTel',width:120,align:'center',resizable:true,sortable:true,order:'desc'">办公电话</th>
				<th data-options="field:'phoneNum',width:120,align:'center'">手机号</th>
				<th data-options="field:'status',width:120,align:'center'">状态</th>
			    */
				columns:[[
					{field:'projectName',title:'项目名称', width:100,align:'left',resizable:true},
					{field:'builderId',title:'建设项目', width:100,align:'left',resizable:true},
					{field:'constructorId',title:'施工方', width:100,align:'left',resizable:true},
					{field:'supervisorId',title:'监理方', width:100,align:'left',resizable:true},
					{field:'chiefInspectorId',title:'总监', width:100,align:'left',resizable:true},
					{field:'deputyDirectorId',title:'副总监', width:100,align:'left',resizable:true},
					{field:'supervisionEngineerId',title:'监理工程师', width:100,align:'left',resizable:true},
					{field:'clerkId',title:'文员', width:100,align:'left',resizable:true},
					{field:'creationDate',title:'创建时间', width:120,align:'left',resizable:true}
				]]
			});
		
			/*
			pg.pagination({
				buttons:[
				 {
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
				} 
				]
			});	
			*/
			$("#searchBtn").click(function(){
				var params=$('#searchFrm').serializeArray();
				var s="";
				for(var i in params){
					s+=params[i].name+"=";
					s+=(params[i].value==""?"":params[i].value)+"&";
				}
				s=s.substring(0, s.length-1);
				
				$('#dg').datagrid({
					url:'document/list?'+s,
					queryParams: s
				});
			});		
		})
	</script>
  </body>
</html>	
