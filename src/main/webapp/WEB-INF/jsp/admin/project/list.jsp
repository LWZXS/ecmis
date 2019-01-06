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

	<title>文档类型管理</title>
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
<table id="dg" title="项目列表" style="width:100%;height: 100% "
	   data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',singleSelect:true,checkOnSelect:true,fitColumns:true,pagination:true,striped:true,showFooter:true,fit:true,toolbar:'#tb',method:'get'">
</table>
<div id="tb">
	<form action="" id="searchFrm">
		<label for="projectName" style="margin-left: 5px;"></label>项目名称:<input style="height: 22px;" class="easyui-textbox" id="projectName" name="projectName" type="search" placeholder="项目名称..." >
		<a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search1'">查询</a>
		<br />
		<a href="javascript:void(0)" id="add" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">增加</a>
		<a href="javascript:void(0)" id="delete" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete16'">删除</a>
		<a href="javascript:void(0)" id="update" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-update'">修改</a>
		<a href="javascript:void(0)" id="refresh" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
		<%--<a href="javascript:void(0)" id="lock" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lock16'">锁定</a>--%>
		<%--<a href="javascript:void(0)" id="view" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-view'">浏览</a>
        <a href="javascript:void(0)" id="export" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-export'">导出明细</a>
        <a href="javascript:void(0)" id="search" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search1'">高级查询</a>--%>

	</form>
</div>

<div>
	<!-- 增加文档类型Dialog start-->
	<div id="add-project-dlg" class="easyui-dialog" closed="true" title="增加项目"
		 style="width:600px;height:380px;padding:10px;"
		 data-options="buttons:'#add-project-buttons'">
		<div style="margin:20px 0;"></div>
		<div title="" style="width:560px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="ff" method="post" enctype="multipart/form-data" >
					<input name="opr" value="add" type="hidden" id="opr"/>
					<table cellpadding="5">
						<tr>
							<td>编号:</td>
							<td><input class="easyui-textbox"  style="width: 220px;" type="number" id="a_docTypeId"  name="docTypeId" data-options="required:true,missingMessage:'编号不能为空',invalidMessage:'输入格式不正确'"/><span id="maxChildId"></span></td>
						</tr>
						<tr>
							<td>文档类型名称:</td>
							<td><input class="easyui-textbox" style="width: 220px;" type="text" id="a_docTypeName"  name="docTypeName" data-options="required:true,missingMessage:'文档类型名称不能为空'"/></td>
						</tr>
						<tr>
							<td><label for="a_parentTypeId">上级类型:</label></td>
							<td>
								<%--<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'dept/easyUiTree.json'" name="parentId" id="parentId">

                                </select>--%>
								<input id="a_parentTypeId" name="parentTypeId" style="width: 220px;"/>
							</td>
						</tr>

						<tr>
							<td><label for="a_status">状态:</label></td>
							<td>
								<select class="easyui-combobox" panelHeight="auto" style="width: 220px;" name="status" id="a_status">
									<option value="1" selected>正常</option>
									<option value="2">锁定</option>
									<option value="3">删除</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>文档模板:</td>
							<td width="212px" align="left">
								<%--<input type="file" id="a_id" class="easyui-inputbox" name="file"/>--%>
								<input class="easyui-filebox" id="file" name="file" data-options="prompt:'请选择文档...'" style="width: 220px;">
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
	<div id="add-project-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add-project-dlg').dialog('close')">关闭</a>
	</div>
	<!-- 增加文档类型Dialog end-->
</div>
<script type="text/javascript">
    function fixWidth(percent){
        return document.body.clientWidth * percent ;//根据自身情况更改
    }
    $(function(){
        //查看


        //刷新
        $("#refresh").click(function () {
            $('#dg').datagrid('reload');
        });

        $("#add").click(function(){
            $('#add-project-dlg').dialog({
                title: '增加项目'
            });
            $('#ff').form('clear');
            $("#opr").val("add");//增加
            $("#add-project-dlg").dialog("open");
        });

        //修改
        $("#update").click(function () {
            var documentType=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            $("#opr").val("update");
            if (documentType){
                $('#add-project-dlg').dialog({
                    title: '修改项目'
                });
                //
                $("#add-project-dlg").dialog("open");
                $('#a_docTypeId').textbox("setValue",documentType.docTypeId);
                $('#a_docTypeId').textbox('textbox').attr('readonly',true);//只读
                $('#a_docTypeName').textbox("setValue",documentType.docTypeName);


                /*   var parentDocTypeId;
                   var parentDocTypeName;
                   $('#a_parentTypeId').combobox({
                       onSelect:function (documentType) {
                           parentDocTypeId=documentType.parentTypeId;
                           parentDocTypeName=documentType.docTypeName;

                       }
                   });
                   $('#a_parentTypeId').combobox("setValue",documentType.parentTypeId);
                   $('#a_parentTypeId').combobox("loadData",[{
                       "docTypeId":parentDocTypeId,
                       "docTypeName":parentDocTypeName
                   }]);
*/
                $('#a_parentTypeId').combobox("setValue",documentType.parentTypeId);
                $('#a_parentTypeId').combobox("disable");
                $('#a_status').combobox("setValue",documentType.status);

                //$('#a_docTypeId').textbox('disable');
                //$('#addSmt').linkbutton('enable')
            }
        });

        //删除
        $("#delete").click(function () {
            //var row=$('#dg').datagrid('getChecked');//获得所有选中的checkbox,是一个数组
            var documentType=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            var msg="是否确定删除 ["+documentType.docTypeName+"] ";
            if (documentType.levelId!=4){
                msg+="及其子文档类型???";
            }
            if (documentType && confirm(msg)){
                $.ajax({
                    url:"${pageContext.request.contextPath}/documentType/updateStatus.json",
                    type:"get",
                    data:{"docTypeId":documentType.docTypeId,"status":3},
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
        //锁定
        $("#lock").click(function () {
            var documentType=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            var msg="是否确定锁定 ["+documentType.docTypeName+"] ";
            if (documentType.levelId!=4){
                msg+="及其子文档类型???";
            }
            if (documentType && confirm(msg)){
                $.ajax({
                    url:"${pageContext.request.contextPath}/documentType/updateStatus.json",
                    type:"get",
                    data:{"docTypeId":documentType.docTypeId,"status":2},
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

        $('#a_docTypeId').textbox({
            onChange:function (newValue,oldValue) {
                //alert(newValue+"===="+oldValue);
                if ($("#opr").val()=='add') {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/documentType/checkId.json",
                        type:"get",
                        data:{docTypeId:newValue},
                        dataType:"json",
                        success:function (data) {
                            if (data.result){
                                $("#maxChildId").html("  当前编号已存在!").css("color","red");
                                $('#addSmt').linkbutton('disable')
                            }else {
                                $("#maxChildId").html("编号可以使用").css("color","green");
                                $('#addSmt').linkbutton('enable')
                            }
                        }
                    });
                }
            }
        })

        $("#addSmt").click(function(){
            //$.messager.progress();	// display the progress bar
            $('#ff').submit();
        });
        $('#ff').form({
            url:'${pageContext.request.contextPath}/documentType/add.json',
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
                //alert(data);
                var data = eval('(' + data + ')'); // change the JSON string to javascript object
                if(data.result){
                    $('#ff').form('clear');
                    $('#add-documentType-dlg').dialog("close");
                    $('#dg').datagrid('reload');
                    //alert(data.message);
                }else{
                    alert(data.message);
                }
                //$.messager.progress('close');
            }
        });
        $('#a_parentTypeId').combobox({
            url:'${pageContext.request.contextPath}/documentType/getParents.json',
            valueField:'docTypeId',
            textField:'docTypeName',
            onSelect: function(documentType) {
                //当选中则给levelId赋值,值为选中的levelId+1
                //alert(documentType.levelId);
                $("#levelId").val(documentType.levelId+1);
                if(documentType.levelId==3){
                    $('#file').filebox('enable')//启用文件域
                }else{
                    $('#file').filebox('disable')
                }
                $.ajax({
                    url:"${pageContext.request.contextPath}/documentType/findChildMaxId.json",
                    type:"get",
                    data:{docTypeId:documentType.docTypeId},
                    dataType:"json",
                    success:function (data) {
                        $("#maxChildId").html("  当前分类末编号:"+data.childMaxId).css("color","green");;
                    }
                });
            }
        });
        $('#dg').datagrid({
            url:'${pageContext.request.contextPath}/project/list.json',
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
                {field:'projectId',title:'编号', width:10,align:'center',resizable:true},
                {field:'projectName',title:'项目名称', width:35,align:'left',resizable:true},
                {field:'builderName',title:'建设方单位', width:35,align:'left',resizable:true},
                {field:'constructor',title:'施工方单位', width:35,align:'left',resizable:true,
                    formatter: function(constructor,project,index){
                    	if (constructor){
                            return constructor.companyName;
                        } else {
                    	    return "";
						}
                    }},
                {field:'supervisorName',title:'监理方单位', width:35,align:'left',resizable:true},
                {field:'chiefInspectorName',title:'项目总监', width:10,align:'center',resizable:true},
                {field:'supervisionEngineerName',title:'监理工程师', width:15,align:'center',resizable:true},
                {field:'clerkName',title:'项目文员', width:10,align:'center',resizable:true},
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
                url:'${pageContext.request.contextPath}/project/list.json?'+s
            });
        });




    });

    function clearForm(){
        $('#ff').form('clear');
        $('#addSmt').linkbutton('enable')
        $("#maxChildId").html("").css("color","green");
    }

</script>
</body>
</html>
