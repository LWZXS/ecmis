<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta charset="UTF-8">
    <base href="<%=basePath%>">
    
    <title>角色管理</title>
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
	<table id="dg" title="角色列表" style="width:100%;height: 100%;"
		   data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',singleSelect:true,checkOnSelect:true,fitColumns:true,pagination:true,striped:true,showFooter:true,fit:true,toolbar:'#tb',method:'get'">
	</table>
	<div id="tb">
		<form action="" id="searchFrm">
            <label for="roleName" style="margin-left: 5px;"></label>角色名称:<input style="height: 22px;" class="easyui-textbox" id="roleName" name="roleName" type="search" placeholder="角色名称..." >
			状态:
			<select class="easyui-combobox" panelHeight="auto" style="width:100px" name="status" id="status">
				<option value="">全部</option>
				<option value="1">正常</option>
				<option value="2">锁定</option>
				<option value="3">删除</option>
			</select>
            <a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search1'">查询</a>
            <br />
			<a href="javascript:void(0)" id="add" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
			<a href="javascript:void(0)" id="delete" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete16'">删除</a>
			<a href="javascript:void(0)" id="update" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-update'">修改</a>
			<a href="javascript:void(0)" id="lock" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock16'">锁定</a>
			<a href="javascript:void(0)" id="refresh" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
			<%--<a href="javascript:void(0)" id="view" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-view'">浏览</a>
			<a href="javascript:void(0)" id="export" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-export'">导出明细</a>
			<a href="javascript:void(0)" id="search" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search1'">高级查询</a>--%>

		</form>
	</div>
	
	<div>
		<!-- 增加角色Dialog start-->
		<div id="add-dlg" class="easyui-dialog" closed="true" title="新增角色"
			style="width:440px;height:380px;padding:10px;"
				data-options="buttons:'#add-buttons'">
			<div style="margin:20px 0;"></div>
			<div title="" style="width:400px;">
				<div style="padding:10px 60px 20px 60px">
			    <form id="ff" method="post">
					<input name="roleId" value="" type="hidden" id="roleId"/>
			    	<table cellpadding="5">
			    		<tr>
			    			<td>角色名称:</td>
			    			<td><input class="easyui-textbox" type="text" id="a_roleName"  name="roleName" data-options="required:true,missingMessage:'角色名不能为空',invalidMessage:'输入格式不正确'"/></td>
			    		</tr>
                        <tr>
                            <td><label for="sortNumber">排序:</label></td>
                            <td><input id="sortNumber" class="easyui-textbox" type="text" name="sortNumber" /></td>
                        </tr>
						<tr>
							<td><label for="a_status">锁定:</label></td>
							<td>
                                <select class="easyui-combobox" panelHeight="auto" style="width:132px;" name="status" id="a_status">
                                    <option value="1">正常</option>
                                    <option value="2">锁定</option>
                                    <option value="3">删除</option>
                                </select>
                            </td>
						</tr>

			    	</table>
			    </form>
			    <div style="text-align:center;padding:5px">
			    	<a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" id="addSmt">提交</a>
			    	<a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" onclick="clearForm();">清除</a>
			    </div>
			    </div>
			</div>
		</div>
		<div id="add-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add-dlg').dialog('close')">关闭</a>
		</div>
		<!-- 增加角色Dialog end-->
	</div>
	<script type="text/javascript">
		$(function(){

		    //查看



		    //刷新
            $("#refresh").click(function () {
                $('#dg').datagrid('reload');
            });
            //删除
            $("#delete").click(function () {
                //var row=$('#dg').datagrid('getChecked');//获得所有选中的checkbox,是一个数组
				var role=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
                if (role && role.roleName=="系统管理员") {
                    alert("系统管理员不允许删除!");
                    return;
                }
               	if (role && confirm("是否确定删除"+role.roleName)){
               	    $.ajax({
						url:"${pageContext.request.contextPath}/role/delete.json",
						type:"get",
						data:{"roleId":role.roleId},
						dataType:"json",
						success:function (data) {
							if (data.result==true){
                                $('#dg').datagrid('reload');
							}
							alert(data.message);
                        },
						error:function () {
							alert("操作出错!");
                        }
					});
				}
            });

            //修改
            $("#update").click(function () {
                var role=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
                if (role){

                    if (role.roleName=="系统管理员"){
                        alert("系统管理员不允许修改!");
                        return;
                    }
                    $('#add-dlg').dialog({
                        title: '修改角色'
                    });

                    $("#add-dlg").dialog("open");
					$("#roleId").val(role.roleId);
                    $("#a_roleName").textbox("setValue", role.roleName);
					$('#sortNumber').textbox('setValue', role.sortNumber);
					$('#a_status').combobox('setValue', role.status);


                }
            });

            //锁定
			$("#lock").click(function () {
                var role=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
                if (role && role.roleName=="系统管理员") {
                    alert("系统管理员不允许锁定!");
                    return;
                }
                if (role.status==2){
                    alert(role.roleName+"已是锁定状态!");
                    return;
                }else if (role.status==3){
                    if (!confirm(role.roleName+"为是删除状态,是否改锁定状态?")){
                        return;
                    }
                } else if (!role || role.status!=1 || !confirm("是否确定锁定"+role.roleName)){
                    return;
                }
                $.ajax({
                    url:"${pageContext.request.contextPath}/role/lock.json",
                    type:"get",
                    data:{"roleId":role.roleId},
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
            });

			$("#addSmt").click(function(){
				//$.messager.progress();	// display the progress bar
				$('#ff').submit();
			});
			$('#ff').form({
			    url:'${pageContext.request.contextPath}/role/add.json',
                dataType : 'json',
			    onSubmit: function(){
			    	var isValid = $(this).form('validate');
					if (!isValid){
						//$.messager.progress('close');	// hide progress bar while the form is invalid
					}
					return isValid;	// return false will stop the form submission
					// return false to prevent submit;
			    },
			    success:function(data){
                    var data = eval('(' + data + ')'); // change the JSON string to javascript object
                    //alert(data.result+"");
					if(data.result=="true"){
                        $('#ff').form('clear');
                        $("#add-dlg").dialog("close");
                        $('#dg').datagrid('reload');
                        //alert(data.message);
                    }else{
                        alert(data.message);
			    	}
					//$.messager.progress('close');
			    }
			});


		
			$('#dg').datagrid({
				url:'${pageContext.request.contextPath}/role/list.json',
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
			        //双击做的事
			    	//alert(rowIndex+rowData.documentId);
			    	//window.location.href='dept/view/'+rowData.deptId;
			    },
				columns:[[
					{field:'ck', checkbox:true },
					{field:'roleId',title:'角色编号', width:10,align:'center',resizable:true},
					{field:'roleName',title:'角色名称', width:40,align:'left',resizable:true},
					{field:'creationUserName',title:'创建者', width:30,align:'left',resizable:true},
					{field:'creationDate',title:'创建时间', width:30,align:'left',resizable:true},
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
					url:'${pageContext.request.contextPath}/role/list.json?'+s
				});
			});	
			
			$("#add").click(function(){
                $('#add-dlg').dialog({
                    title: '增加角色'
                });
                $('#ff').form('clear');
                //设置排序的值
                $.ajax({
                    url:"${pageContext.request.contextPath}/role/getMaxSortNumber.json",
                    dataType:"json",
                    success:function (data) {
                        console.debug("gumy",data.maxSortNumber)
                        $("#sortNumber").textbox("setValue", eval(data.maxSortNumber+1));
                    }
                });
				$("#add-dlg").dialog("open");
			});


		});


		
		function clearForm(){
			$('#ff').form('clear');
		}
		
	</script>
  </body>
</html>	
