<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'projectFileMgr.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>
	
  	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/projectfile.css" type="text/css"></link>
  
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
	
  </head>
  
  <body>

  <table id="dg" title="项目列表" style="width:100%;height: 100%; "
		 data-options="rownumbers:true,singleSelect:true,pagination:true,striped:true,toolbar:'#tb',method:'get'">
  </table>
  <div id="tb" style="padding:2px 2px;">
	  <form action="" id="searchFrm">
		  状态:
		  <select class="easyui-combobox" panelHeight="auto" style="width:100px" name="status" id="status">
			  <option value="">全部</option>
			  <option value="1">正常</option>
			  <option value="2">锁定</option>
		  </select>
		  <a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		  <br />
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
              onLoadSuccess:function(data){
                  if(data.result){
                      alert("请登录！");
                  }
              },
              onDblClickRow:function(rowIndex,rowData){
                  //alert(rowIndex+rowData.documentId);
                  //window.location.href='document/view/'+rowData.documentId;
              },
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
     <%--<div class="easyui-layout" style="width:100%;height:100%;">
		<div region="west" split="true" title="项目管理" style="width:200px;" data-options="plain:true,iconCls:'icon-file'">
			<p style="padding:5px;margin:0;">请选择您要的操作:</p>
			<ul class="LeftMenu">
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="project/add.html" target="innerIframe">新建项目</a></li>
				<li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="project/list.html" target="innerIframe">项目列表</a></li>
			</ul>
		</div>
		<div id="content" region="center" title="&nbsp;项目管理" style="width: 100%;">
			<iframe name="innerIframe" id="innerIframe" scrolling="yes" frameborder="0"  src="project/list.html" style="width:100%;height:100%;"></iframe>
		</div>
	</div>--%>
  </body>
</html>
