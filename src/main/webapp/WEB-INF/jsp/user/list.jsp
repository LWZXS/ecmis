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
	
  </head>
  
  <body>
	<table id="dg" title="用户列表" style="width:100%;height: 100% "
			data-options="rownumbers:true,singleSelect:true,pagination:true,striped:true,toolbar:'#tb',method:'get',loadMsg:'正在加载,请稍后...',checkOnSelect:true">
	</table>
	<div id="tb">
		<form action="" id="searchFrm">
			<label for="s_companyId" style="margin-left: 5px;">公司:</label>
			<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text'" name="companyId" id="s_companyId">
				<option value="">请选择</option>
			</select>
			<label for="s_deptId" style="margin-left: 5px;">部门:</label>
			<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text'" name="deptId" id="s_deptId">
				<option value="">请选择</option>
			</select>
			<label for="s_roleId" style="margin-left: 5px;">角色:</label>
			<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text'" name="roleId" id="s_roleId">
				<option value="">请选择</option>
			</select>
			<label for="userName" style="margin-left: 5px;">用户名称:</label>
			<input style="height: 18px;" class="easyui-textbox" id="userName" name="userName" type="search" placeholder="用户名称..." >
			<label for="s_status" style="margin-left: 5px;">状态:</label>
			<select class="easyui-combobox" panelHeight="auto" style="width:100px" name="status" id="s_status">
				<option value="">全部</option>
				<option value="1">正常</option>
				<option value="2">锁定</option>
				<option value="3">删除</option>
			</select>
			<a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
			<a href="javascript:void(0)" id="clear" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-clear'">清除</a>
			<br />
			<a href="javascript:void(0)" id="addUser" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
			<a href="javascript:void(0)" id="update" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-update'">修改</a>
			<a href="javascript:void(0)" id="lock" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock16'">锁定</a>
			<a href="javascript:void(0)" id="delete" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete16'">删除</a>
			<a href="javascript:void(0)" id="refresh" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
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
					<input type="hidden" name="userId" value="" id="userId">
			    	<table cellpadding="5">
			    		<tr>
			    			<td>用户名称:</td>
			    			<td><input class="easyui-textbox" id="a_userName" type="text" name="userName" data-options="required:true,missingMessage:'用户名不能为空',invalidMessage:'输入格式不正确'"/></td>
			    		</tr>
			    		<tr>
			    			<td>登录名称:</td>
			    			<td><input class="easyui-textbox" id="a_loginName" readonly type="text" name="loginName" data-options="required:true,missingMessage:'登录名不能为空',invalidMessage:'输入格式不正确'"/></td>
			    		</tr>
			    		<tr>
			    			<td>登录密码:</td>
			    			<td><input class="easyui-textbox" id="a_password" type="text" name="password" data-options="required:true,missingMessage:'密码不能为空',invalidMessage:'输入格式不正确'"/></td>
			    		</tr>
			    		<tr>
			    			<td>确认密码:</td>
			    			<td><input class="easyui-textbox" id="a_rePassword" type="text" name="rePassword" data-options="required:true,missingMessage:'确认密码不能为空',invalidMessage:'输入格式不正确'"/></td>
			    		</tr>
			    		<tr>
			    			<td>手机号码:</td>
			    			<td><input class="easyui-textbox" id="a_phoneNum" type="text" name="phoneNum"/></td>
			    		</tr>
			    		<tr>
			    			<td>办公电话:</td>
			    			<td><input class="easyui-textbox" id="a_officeTel" type="text" name="officeTel"/></td>
			    		</tr>
			    		<tr>
			    			<td>邮箱:</td>
			    			<td><input class="easyui-textbox" id="a_email" type="text" name="email" data-options="required:true,validType:'email',missingMessage:'邮箱不能为空',invalidMessage:'邮箱格式不正确'"></input></td>
			    		</tr>
			    		<tr>
			    			<td>地址:</td>
			    			<td><input class="easyui-textbox" id="a_address" type="text" name="address"></input></td>
			    		</tr>
			    		<tr>
			    			<td>生日:</td>
			    			<td><input class="easyui-datebox" id="a_bronDate" type="text" name="bronDate"/></td>
			    		</tr>
			    		<tr>
			    			<td>头像:</td>
			    			<td><input type="file" id="a_id" class="easyui-inputbox" name="file"/></td>
			    		</tr>
			    		<tr>
			    			<td>所属公司:</td>
			    			<td>
			    				<select style="width: 132px;" class="easyui-combobox" data-options="required:true,missingMessage:'所属公司不能为空',valueField:'id',textField:'text',url:'company/findAll4Select'" name="companyId" id="companyId">
			    					<option value="">请选择</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>所属部门:</td>
			    			<td>
			    				<select style="width: 132px;" class="easyui-combobox" data-options="required:true,missingMessage:'所属部门不能为空',valueField:'id',textField:'text',url:'dept/easyUiTree.json'" name="deptId" id="deptId">
									<option value="">请选择</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>所属角色:</td>
			    			<td>
			    				<select style="width: 132px;" class="easyui-combobox" data-options="required:true,missingMessage:'所属角色不能为空',valueField:'id',textField:'text',multiple:true,url:'role/easyUiTree.json'" name="roleIds" id="roleId">
									<option value="">请选择</option>
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

		    //加载查询角色
			$("#s_roleId").combobox({
                url:'role/easyUiTree.json',
                valueField:'id',
                textField:'text'
            });
		    //加载查询部门
			$("#s_deptId").combobox({
                url:'dept/easyUiTree.json',
                valueField:'id',
                textField:'text'
            });
            /*加载公司--jeasyui*/
            $('#s_companyId').combobox({
                url:'company/findAll4Select',
                valueField:'id',
                textField:'text'
            });

            $('#companyId').combobox({
                onSelect: function(company){
                    //加载查询部门
                    $("#deptId").combobox({
                        url:'dept/easyUiTree.json?companyId='+company.id,
                        valueField:'id',
                        textField:'text'
                    });
                }
            });

            //删除
			$("#delete").click(function () {
                var user=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
                if (user && confirm("是否确定删除"+user.userName)){
                    $.ajax({
                        url:"user/delete.json",
                        type:"get",
                        data:{"userId":user.userId},
                        dataType:"json",
                        success:function (data) {
                            if (data.result){
                                $('#dg').datagrid('reload');
                            }else {
                                //不成功提示
                                alert(data.message);
                            }
                        }

                    })
                }
            });

            //锁定
			$("#lock").click(function () {
                var user=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
                if (user && confirm("是否确定锁定"+user.userName)){
                    $.ajax({
                        url:"user/lock.json",
                        type:"get",
                        data:{"userId":user.userId},
                        dataType:"json",
                        success:function (data) {
                            if (data.result){
                                $('#dg').datagrid('reload');
                            }else {
                                //不成功提示
                                alert(data.message);
                            }
                        }

                    })
                }
            });
            //刷新
			$("#refresh").click(function () {
                $('#dg').datagrid('reload');
            });
			//修改
            $("#update").click(function(){


                var user=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
				if (user){

				   /* $.each(user,function (index,obj) {
						console.debug("user--",index+":"+obj)
                    })*/
                    $('#adduser-dlg').dialog({
                        title: '修改用户'
                    });

                    $("#adduser-dlg").dialog("open");
					$("#a_userName").textbox("setValue", user.userName);
					$("#a_loginName").textbox("setValue", user.loginName);
					$("#a_phoneNum").textbox("setValue", user.phoneNum);
					$("#a_address").textbox("setValue", user.address);
					$("#a_officeTel").textbox("setValue", user.officeTel);
					$("#a_email").textbox("setValue", user.email);
					$("#a_bronDate").textbox("setValue", user.bronDate);
					$("#userId").textbox("setValue", user.userId);
                    $("#companyId").combobox('setValue', user.companyId);
                    $("#deptId").combobox('setValue', user.deptId);
                    $("#roleId").combobox('setValue', user.roleName);

				}
            });
			//增加
            $("#addUser").click(function(){
                $('#adduser-dlg').dialog({
                    title: '增加用户'
                });
                $('#ff').form('clear');
                $("#adduser-dlg").dialog("open");
            });

            //提交
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
                    var data = eval('(' + data + ')');
                    if(data.result){
			    		$("#adduser-dlg").dialog("close");
                        $('#dg').datagrid('reload');
                    }
					alert(data.message);
					//
					
					//$.messager.progress('close');	
			    }
			});

		
			$('#dg').datagrid({
				url:'user/list.json',
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
                    {field:'ck', checkbox:true },
					{field:'userName',title:'用户全名', width:80,align:'left',resizable:true},
					{field:'loginName',title:'登录账号', width:120,align:'left',resizable:true},
					{field:'email',title:'邮箱', width:150,align:'left',resizable:true},
					{field:'companyName',title:'公司', width:150,align:'left',resizable:true},
					{field:'deptName',title:'部门', width:180,align:'left',resizable:true},
					{field:'roleName',title:'角色', width:150,align:'left',resizable:true},
					{field:'officeTel',title:'办公电话', width:120,align:'center',resizable:true},
					{field:'phoneNum',title:'手机号', width:120,align:'left',resizable:true},
					{field:'statusName',title:'状态', width:50}
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
					url:'user/list.json?'+s
				});
			});	
			$("#clear").click(function () {
                $('#searchFrm').form('clear');
            });


		});
		
		
		function clearForm(){
			$('#ff').form('clear');
		}
		
	</script>
  </body>
</html>	
