<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
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
	<table id="dg" title="用户列表" style="width:100%;height: 80% "
			data-options="rownumbers:true,singleSelect:true,pagination:true,striped:true,toolbar:'#tb',method:'get'">
	</table>
	<div id="tb">
		<form action="" id="searchFrm">
			状态: 
			<select class="easyui-combobox" panelHeight="auto" style="width:100px" name="status" id="status">
				<option value="">全部</option>
				<option value="1">正常</option>
				<option value="2">锁定</option>
			</select>
			<br />
			<a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
			<a href="javascript:void(0)" id="addUser" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete16'">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-update'">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock16'">锁定</a>
		</form>
	</div>
	
	<div>
		<!-- 增加用户Dialog start-->
		<div id="adduser-dlg" class="easyui-dialog" closed="true" title="新增用户" 
			style="width:480px;height:480px;padding:10px;"
				data-options="buttons:'#adduser-buttons'">
			<div style="margin:20px 0;"></div>
			<div title="" style="width:440px;">
				<div style="padding:10px 60px 20px 60px">
			    <form id="ff" method="post" enctype="multipart/form-data">
			    	<table cellpadding="5">
			    		<tr>
			    			<td>用户名称:</td>
			    			<td><input class="easyui-textbox" type="text" name="userName" data-options="required:true,missingMessage:'用户名不能为空',invalidMessage:'输入格式不正确'"></input></td>
			    		</tr>
			    		<tr>
			    			<td>登录名称:</td>
			    			<td><input class="easyui-textbox" type="text" name="loginName" data-options="required:true,missingMessage:'登录名不能为空',invalidMessage:'输入格式不正确'"></input></td>
			    		</tr>
			    		<tr>
			    			<td>登录密码:</td>
			    			<td><input class="easyui-textbox" type="text" name="password" data-options="required:true,missingMessage:'密码不能为空',invalidMessage:'输入格式不正确'"></input></td>
			    		</tr>
			    		<tr>
			    			<td>确认密码:</td>
			    			<td><input class="easyui-textbox" type="text" name="rePassword" data-options="required:true,missingMessage:'确认密码不能为空',invalidMessage:'输入格式不正确'"></input></td>
			    		</tr>
			    		<tr>
			    			<td>手机号码:</td>
			    			<td><input class="easyui-textbox" type="text" name="phoneNum"></input></td>
			    		</tr>
			    		<tr>
			    			<td>办公电话:</td>
			    			<td><input class="easyui-textbox" type="text" name="officeTel"></input></td>
			    		</tr>
			    		<tr>
			    			<td>邮箱:</td>
			    			<td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email',missingMessage:'邮箱不能为空',invalidMessage:'邮箱格式不正确'"></input></td>
			    		</tr>
			    		<tr>
			    			<td>地址:</td>
			    			<td><input class="easyui-textbox" type="text" name="address"></input></td>
			    		</tr>
			    		<tr>
			    			<td>生日:</td>
			    			<td><input class="easyui-datebox" type="text" name="bronDate"/></td>
			    		</tr>
			    		<tr>
			    			<td>头像:</td>
			    			<td><input type="file" class="easyui-inputbox" name="file"/></td>
			    		</tr>
			    		<tr>
			    			<td>所属公司:</td>
			    			<td>
			    				<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'company/findAll4Select'" name="companyId" id="companyId">
			    				
			    				</select>
			    			</td>
			    		</tr>
			    	</table>
			    </form>
			    <div style="text-align:center;padding:5px">
			    	<a href="javascript:void(0)" class="easyui-linkbutton" id="addUserSmt">提交</a>
			    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm();">清除</a>
			    </div>
			    </div>
			</div>
		</div>
		<div id="adduser-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#adduser-dlg').dialog('close')">关闭</a>
		</div>
		<!-- 增加用户Dialog end-->
	</div>
	<script type="text/javascript">
		$(function(){
		
			$("#addUserSmt").click(function(){
				//$.messager.progress();	// display the progress bar
				$('#ff').submit();
			});
			$('#ff').form({
			    url:'user/add',
			    onSubmit: function(){
			    	var isValid = $(this).form('validate');
					if (!isValid){
						//$.messager.progress('close');	// hide progress bar while the form is invalid
					}
					return isValid;	// return false will stop the form submission
					// return false to prevent submit;
			    },
			    success:function(data){
			    	if(data=='success'){
			    		alert('增加用户成功');
			    		$("#adduser-dlg").dialog("close");
			    	}else{
			    		alert('增加用户失败,'+data);
			    	}
					//
					
					//$.messager.progress('close');	
			    }
			});
			
			//加载公司--jeasyui
			/* $('#companyId').combobox({
			    url:'company/findAll4Select',
			    valueField:'id',
			    textField:'text'
			}); */
		
			/* $.ajax({
				url:"company/findAll4Select",
				type:"get",
				dataType:"json",
				success:function(list){
					var $company=$("#companyId");
					for(var i =0;i<list.length;i++){
						$company.append("<option value='"+list[i].id+"'>"+list[i].text+"</option>");
					}
				}
			}); */
		
			$('#dg').datagrid({
				url:'user/list.do',
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
					{field:'userName',title:'用户全名', width:150,align:'left',resizable:true},
					{field:'loginName',title:'登录账号', width:150,align:'left',resizable:true},
					{field:'email',title:'邮箱', width:220,align:'left',resizable:true},
					{field:'officeTel',title:'办公电话', width:150,align:'center',resizable:true},
					{field:'phoneNum',title:'手机号', width:150,align:'left',resizable:true},
					{field:'statusName',title:'状态', width:80}
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
					url:'user/list.do?'+s
				});
			});	
			
			$("#addUser").click(function(){
				$("#adduser-dlg").dialog("open");
			});	
		});
		
		
		function clearForm(){
			$('#ff').form('clear');
		}
		
	</script>
  </body>
</html>	
