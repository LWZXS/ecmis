<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>已发文档</title>
	<jsp:include page="/WEB-INF/jsp/title.jsp"></jsp:include>
	
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
		}
		
	</style>
	
	<script type="text/javascript">
		
	</script>
  </head>
  
  <body>
	<table id="dg" title="已发文档" style="width:100%;height:100%"
			data-options="rownumbers:true,loadMsg:'正在加载,请稍后......',fitColumns:true,beforePageText:'第',afterPageText:'页 共{pages}',displayMsg:'显示{from}到{to}共{total}条记录',singleSelect:true,pagination:true,striped:true,toolbar:'#tb',method:'get'">
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
		<form action="document/pending.json" id="issuedFrm">
			<input name="docStatusId" type="hidden">
			开始时间: <input class="easyui-datebox" style="width:110px" name="startTime">
			结束时间: <input class="easyui-datebox" style="width:110px" name="endTime">
			文档名称: <input class="easyui-textbox" style="width:100px" name="docName">
			文档状态: <input id="cc" style="width:100px" class="easyui-combobox" name="docStaId">
			<!-- <select class="easyui-combobox" name="docStatusId" id="docStatusId" style="width:110px" >
				
			</select> -->
			<a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search">查询</a>
		</form>
	</div>
	
	
	<script type="text/javascript">
		$(function(){
			//使用前端框架
			$('#cc').combobox({
			    url:'documentStatus/docStatusList.json',
			    valueField:'id',
			    textField:'text'
			});
		
			//加载可选状态,使用的是编码方式
		/* 	$.ajax({
				url:"documentStatus/list",
				dataType:"json",
				success:function(list){
					var dataList=new Array();
					dataList.push({"value": "","text":"请选择"});
					$.each(list, function(index, docStatus){ 
						var docStatus={"value": docStatus.docStatusId,"text":docStatus.docStatusName};
						dataList.push(docStatus);
				  	});
				  	
				  	$("#docStatusId").combobox("loadData",dataList);
				}
			}); */
		
			$("#searchBtn").click(function(){
				$("input[name=docStatusId]").val(isNaN($("input[name=docStaId]").val())?"":$("input[name=docStaId]").val());
				var params=$("#issuedFrm").serialize();
				alert(params);
				$('#dg').datagrid({
					url:'document/issued.json?'+params
				});
			});
		
			//加载数据
			$('#dg').datagrid({
				url:'document/issued.json',
				queryParams: {
					docStatusId:$("input[name=docStatusId]").val(),
					docName:$("input[name=documentName]").val()
				},
			    onLoadSuccess:function(data){
			    	
			    	
			    },
			    onDblClickRow:function(rowIndex,rowData){
			    	window.location.href='/ecmis/document/issued/'+rowData.documentId+'/issued';
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
			
		})
	</script>
  </body>
</html>	
