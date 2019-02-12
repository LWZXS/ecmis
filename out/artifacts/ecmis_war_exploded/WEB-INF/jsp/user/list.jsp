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
		#ff table td{
			height: 36px;
			line-height: 36px;
		}

	</style>
	
  </head>
  
  <body>
	<table id="dg" title="用户列表" style="width:100%;height: 100% "
		   data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',singleSelect:true,checkOnSelect:true,fitColumns:true,pagination:true,striped:true,showFooter:true,fit:true,toolbar:'#tb',method:'get'">
	</table>
	<div id="tb">
		<form action="" id="searchFrm">
            <input type="hidden" id="s_pageIndex" name="pageIndex" value="${pageIndex}">
            <input type="hidden" id="s_pageSize" name="pageSize" value="${pageSize}">
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
			<input style="height: 22px;" class="easyui-textbox" id="userName" name="userName" type="search" placeholder="用户名称..." >
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
			style="width:660px;height:400px;padding:10px;"
				data-options="buttons:'#adduser-buttons'">
			<div title="" style="width:600px;">
				<div>
			    <form id="ff" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userId" value="" id="userId">
			    	<table cellpadding="5">
			    		<tr >
			    			<td width="132px" align="center"><label for="a_userName">用户名称:</label></td>
			    			<td><input class="easyui-textbox" id="a_userName" type="text" name="userName" data-options="required:true,missingMessage:'用户名不能为空',invalidMessage:'输入格式不正确'"/></td>
							<td width="132px" align="center">登录名称</td>
							<td><input class="easyui-textbox" id="a_loginName" type="text" name="loginName" data-options="required:true,missingMessage:'登录名不能为空',invalidMessage:'输入格式不正确'"/></td>
						</tr>
			    		<tr>
			    			<td width="132px" align="center"><label for="a_password">登录密码:</label></td>
			    			<td><input class="easyui-textbox" id="a_password" type="password" name="password" data-options="required:true,missingMessage:'密码不能为空',invalidMessage:'输入格式不正确'"/></td>
							<td width="132px" align="center"><label for="a_rePassword">确认密码:</label></td>
							<td><input class="easyui-textbox" id="a_rePassword" type="password" name="rePassword" data-options="required:true,missingMessage:'确认密码不能为空',invalidMessage:'输入格式不正确'"/></td>
						</tr>
			    		<tr>
			    			<td width="132px" align="center"><label for="a_phoneNum">手机号码:</label></td>
			    			<td><input class="easyui-textbox" id="a_phoneNum" type="text" name="phoneNum"/></td>
							<td width="132px" align="center"><label for="a_officeTel">办公电话:</label></td>
							<td><input class="easyui-textbox" id="a_officeTel" type="text" name="officeTel"/></td>
						</tr>
						<tr>
							<td width="132px" align="center"><label for="a_email">邮箱:</label></td>
							<td><input class="easyui-textbox" id="a_email" type="text" name="email" data-options="required:true,validType:'email',missingMessage:'邮箱不能为空',invalidMessage:'邮箱格式不正确'"></input></td>
							<td width="132px" align="center"><label for="a_address">地址:</label></td>
							<td><input class="easyui-textbox" id="a_address" type="text" name="address"></input></td>
						</tr>
						<tr>
							<td width="132px" align="center"><label for="a_bronDate">生日:</label></td>
							<td><input class="easyui-datebox" id="a_bronDate" type="text" name="bronDate" data-options="required:true,missingMessage:'生日不能为空',invalidMessage:'输入格式不正确'"/></td>
							<td width="132px" align="center">头像:</td>
							<td width="212px" align="center">
								<%--<input type="file" id="a_id" class="easyui-inputbox" name="file"/>--%>
								<input class="easyui-filebox" name="file" data-options="prompt:'请选择图片...'" style="width:212px">
							</td>
						</tr>
						<tr>
							<td width="132px" align="center"><label for="companyId">所属公司:</label></td>
							<td>
								<input id="companyId" name="companyId" style="width: 132px;" data-options="required:true,missingMessage:'所属公司不能为空'"/>
							</td>
							<td width="132px" align="center"><label for="deptId">所属部门:</label></td>
							<td>
								<input style="width: 132px;" name="deptId" id="deptId" data-options="required:true,missingMessage:'所属部门不能为空'"/>
							</td>
						</tr>
						<tr>
							<td width="132px" align="center"><label for="roleId">所属角色:</label></td>
							<td>
								<input style="width: 132px;" name="roleIds" id="roleId" data-options="required:true,missingMessage:'所属角色不能为空',multiple:true"/>
							</td>
							<td width="132px" align="center"><label for="a_status">状态:</label></td>
							<td>
								<select style="width: 132px;" class="easyui-combobox"  name="status" id="a_status">
									<option value="1" selected>正常</option>
									<option value="2">锁定</option>
								</select>
							</td>
						</tr>
						<tr>
							<td  width="264px" align="center" colspan="4">
								<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 80px" id="addUserSmt">提交</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:void(0)" class="easyui-linkbutton" style="width: 80px" onclick="clearForm();">清除</a>
							</td>

						</tr>
			    	</table>
			    </form>
			    </div>
			</div>
		</div>
		<%--关闭按扭--%>
		<%--<div id="adduser-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#adduser-dlg').dialog('close')">关闭</a>
		</div>--%>
		<!-- 增加用户Dialog end-->
        <!--查看用户Dialog-->
        <div id="view-user-dlg" class="easyui-dialog" closed="true" title="用户信息"
             style="width:360px;height:430px;padding:10px;"
             data-options="buttons:'#view-user-buttons'">
            <table cellpadding="5">
                <tr>
                    <td width="132px" align="center">头像:</td>
                    <td width="132px" align="center" id="icon"></td>
                </tr>
                <tr >
                    <td width="132px" align="center"><label for="v_userName">用户名称:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_userName" type="text" name="userName" /></td>
                </tr>
                <tr>
                    <td width="132px" align="center">登录名称</td>
                    <td><input class="easyui-textbox" readonly id="v_loginName" type="text" name="loginName"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="v_phoneNum">手机号码:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_phoneNum" type="text" name="phoneNum"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="v_officeTel">办公电话:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_officeTel" type="text" name="officeTel"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="v_email">邮箱:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_email" type="text" name="email"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="v_address">地址:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_address" type="text" name="address"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="v_bronDate">生日:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_bronDate" type="text" name="bronDate"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="v_company">所属公司:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_company" type="text" name="address"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="v_dept">所属部门:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_dept" type="text" name="address"/></td>
                </tr>
                <tr>
                    <td width="132px" align="center"><label for="a_address">所属角色:</label></td>
                    <td><input class="easyui-textbox" readonly id="v_role" type="text" name="address"/></td>
                </tr>
            </table>
        </div>
        <div id="view-user-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#view-user-dlg').dialog('close')">关闭</a>
        </div>
	</div>
	<script type="text/javascript">
		$(function(){

		    //加载查询角色
			$("#s_roleId").combobox({
                url:'${pageContext.request.contextPath}/role/easyUiTree.json',
                valueField:'id',
                textField:'text'
            });
		    //加载查询部门
			$("#s_deptId").combobox({
                url:'${pageContext.request.contextPath}/dept/easyUiTree.json',
                valueField:'id',
                textField:'text'
            });
            /*加载公司--jeasyui*/
            $('#s_companyId').combobox({
                url:'${pageContext.request.contextPath}/company/findAll4Select',
                valueField:'id',
                textField:'text'
            });

		    //加载角色
			$("#roleId").combobox({
                url:'${pageContext.request.contextPath}/role/easyUiTree.json',
                valueField:'id',
                textField:'text'
            });
		    //加载部门
			$("#deptId").combobox({
                url:'${pageContext.request.contextPath}/dept/easyUiTree.json',
                valueField:'id',
                textField:'text'
            });
            /*加载公司--jeasyui*/
            $('#companyId').combobox({
                url:'${pageContext.request.contextPath}/company/findAll4Select',
                valueField:'id',
                textField:'text'
            });

			//加载部门
            $('#companyId').combobox({
                onSelect: function(company){
                    //加载查询部门
                    $("#deptId").combobox({
                        url:'${pageContext.request.contextPath}/dept/easyUiTree.json?companyId='+company.id,
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
                        url:"${pageContext.request.contextPath}/user/delete.json",
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
                        url:"${pageContext.request.contextPath}/user/lock.json",
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
					$("#userId").val(user.userId);

                    $("#companyId").combobox('setValue', user.companyId);
                    $("#deptId").combobox('setValue', user.deptId);
                    $('#a_status').combobox('setValue', user.status);
                    console.debug("gumy",user.roles.length);
                    if(user.roles.length>0){
                        var roleIds=new Array();
                        $.each(user.roles,function (index,role) {
                            roleIds.push(role.roleId)
							console.debug("gumy",role.roleId);
                        })
                        $("#roleId").combobox('setValues', roleIds);
                    }
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
			    url:'${pageContext.request.contextPath}/user/add',
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
                    }else {
                        alert(data.message);
                    }
					//
					
					//$.messager.progress('close');	
			    }
			});

			$('#dg').datagrid({
				url:'${pageContext.request.contextPath}/user/list.json',
			    onLoadSuccess:function(data){
                    var pageSize=$('#dg').datagrid('options').pageSize;
                    var pageNumber=$('#dg').datagrid('options').pageNumber;
                    $("#s_pageIndex").val(pageNumber)
                    $("#s_pageSize").val(pageSize)
			    	if(data.result){
			    		alert("请登录！");
			    	}
			    },
			    onDblClickRow:function(rowIndex,user){

                    $("#v_userName").textbox("setValue",user.userName);
                    $("#v_loginName").textbox("setValue", user.loginName);
                    $("#v_phoneNum").textbox("setValue", user.phoneNum);
                    $("#v_address").textbox("setValue", user.address);
                    $("#v_officeTel").textbox("setValue", user.officeTel);
                    $("#v_email").textbox("setValue", user.email);
                    $("#v_bronDate").textbox("setValue", user.bronDate);
                    $("#v_userId").textbox("setValue", user.userId);
                    $("#v_company").textbox('setValue', user.companyName);
                    $("#v_dept").textbox('setValue', user.deptName);
                    var roleNames="";
                    $.each(user.roles,function (index,role) {
						roleNames+=role.roleName+" ";
                    })
                    $("#v_role").textbox('setValue', roleNames);
                    if (user.icon){
                        var $img=$("<img src='${pageContext.request.contextPath}/statics/file/user_icon/"+user.icon+"' alt='' width='80px'/>")
                        $("#icon").empty().append($img);
                    }else {
                        $("#icon").empty().append('暂无图片');
                    }
                    $('#view-user-dlg').dialog('open');
                },
				columns:[[
                    {field:'ck', checkbox:true },
					{field:'userName',title:'用户全名', width:10,align:'left',resizable:true},
					{field:'loginName',title:'登录账号', width:20,align:'left',resizable:true},
					{field:'email',title:'邮箱', width:25,align:'left',resizable:true},
					{field:'companyName',title:'公司', width:25,align:'left',resizable:true},
					{field:'deptName',title:'部门', width:25,align:'left',resizable:true},
					{field:'roles',title:'角色', width:25,align:'left',resizable:true,
						formatter: function(value,user,index){
                            if (user.roles.length>0){
                                var roleNames="";
                                $.each(user.roles,function (i,role) {
									roleNames+=role.roleName+" "
                                });
                                return roleNames;
                            } else {
                                return value;
                            }
                        }},
					{field:'officeTel',title:'办公电话', width:20,align:'center',resizable:true},
					{field:'phoneNum',title:'手机号', width:20,align:'left',resizable:true},
					{field:'statusName',title:'状态', width:10,align:'center'}
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
					url:'${pageContext.request.contextPath}/user/list.json?'+s
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
