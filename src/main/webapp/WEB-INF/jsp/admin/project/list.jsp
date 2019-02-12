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
<%--	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/jquery-ui.min.css" type="text/css"/>--%>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>

	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>

	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
	<%--<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery-ui.min.js"></script>--%>
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
<%--
		<a href="javascript:void(0)" id="delete" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete16'">删除</a>
--%>
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
		 style="width:680px;height:480px;padding:10px;"
		 data-options="buttons:'#add-project-buttons'">
		<div style="margin:20px 0;"></div>
		<div title="" style="width:640px;">
			<div style="padding:10px 60px 20px 60px">
				<form id="ff" method="post">
					<input name="projectId" value="" type="hidden" id="projectId"/>
                    <input id="enableCheckName" value="false" type="hidden">
					<table cellpadding="5">
						<tr>
							<td>项目名称:</td>
							<td><input class="easyui-textbox" style="width: 280px;" type="text" id="a_projectName"  name="projectName" data-options="required:true,missingMessage:'项目名称不能为空'"/><span id="projectNameMsg"></span></td>
						</tr>
						<tr>
							<td>参与单位:</td>
							<td >
								<input id="companyId" name="companyId" style="width: 280px;" data-options="required:true,missingMessage:'单位名不能为空',multiple:true"/>
							</td>
						</tr>


						<tr>
							<td><label for="a_status">状态:</label></td>
							<td>
								<select class="easyui-combobox" panelHeight="auto" style="width: 280px;" name="status" id="a_status">
									<option value="1" selected>正常</option>
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
	<div id="add-project-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add-project-dlg').dialog('close')">关闭</a>
	</div>
	<!-- 增加文档类型Dialog end-->
</div>
<script type="text/javascript">
    function fixWidth(percent){
        return document.body.clientWidth * percent ;//根据自身情况更改
    }
    var i=1;
    $(function(){
        //查看
		/*$("#add-company").click(function () {
			var $newTr = $(".company:first").clone();
            $("#company").after($newTr);
            $newTr.show();
        });*/

        /*加载公司--jeasyui*/
        $('#companyId').combobox({
            url: '${pageContext.request.contextPath}/company/findAll4Select',
            valueField: 'id',
            textField: 'text'
        });

        $("#sub-company").click(function () {
            $(this).parents("tr").remove();
        });
        //刷新
        $("#refresh").click(function () {
            $('#dg').datagrid('reload');
        });

        $("#add").click(function(){
            $('#add-project-dlg').dialog({
                title: '增加项目'

            });
            //$('#ff').form('clear');
            clearForm();
            $('#a_status').combobox("setValue",1);
            $("#opr").val("add");//增加
            $("#add-project-dlg").dialog("open");
            $("#enableCheckName").val("true");
            $('#a_projectName').textbox({
                onChange:function (newValue,oldValue) {
                    //alert(newValue+"===="+oldValue);
                    if ($("#enableCheckName").val()=="true"){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/project/checkProjectName.json",
                            type:"get",
                            data:{projectName:newValue},
                            dataType:"json",
                            success:function (data) {
                                if (data.result>0){
                                    $("#projectNameMsg").html("  项目名已存在!").css("color","red");
                                    $('#addSmt').linkbutton('disable')
                                }else {
                                    $("#projectNameMsg").html("  项目名可以使用").css("color","green");
                                    $('#addSmt').linkbutton('enable')
                                }
                            }
                        });
                    }
                }
            })
        });

        //修改
        $("#update").click(function () {

            var project=$('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            $("#opr").val("update");
            if (project){
                clearForm();//清空表单
                $('#add-project-dlg').dialog({
                    title: '修改项目'
                });
                //
                $("#add-project-dlg").dialog("open");
                //$('#a_docTypeId').textbox('textbox').attr('readonly',true);//只读
                $("#projectId").val(project.projectId);
                $('#a_projectName').textbox("setValue",project.projectName);
                $('#a_builderId').combobox("setValue",project.builder.companyId);
                $('#a_constructorId').combobox("setValue",project.constructor.companyId);
                $('#a_supervisorId').combobox("setValue",project.supervisor.companyId);

                $('#a_chiefInspectorId,#a_supervisionEngineerId,#a_clerkId').combobox({
                    url:'${pageContext.request.contextPath}/user/getUserByCompany.json?companyId='+project.supervisor.companyId,
                    valueField:'userId',
                    textField:'userName',
                    onSelect: function(company) {

                    }
                });
                $('#a_chiefInspectorId').combobox("setValue",project.chiefInspector.userId);
                $('#a_supervisionEngineerId').combobox("setValue",project.supervisionEngineer.userId);
                $('#a_clerkId').combobox("setValue",project.clerk.userId);

                $('#a_status').combobox("setValue",project.status);

                $("#enableCheckName").val("true");
                $('#a_projectName').textbox({
                    onChange:function (newValue,oldValue) {
                        //alert(newValue+"===="+oldValue);
                        //如果项目名与之前的相同不验证
                        if (newValue==project.projectName){
                            $("#projectNameMsg").html("").css("color","green");
                            $('#addSmt').linkbutton('enable')
                            return;
                        }
                        if ($("#enableCheckName").val()=="true"){
                            $.ajax({
                                url:"${pageContext.request.contextPath}/project/checkProjectName.json",
                                type:"get",
                                data:{projectName:newValue},
                                dataType:"json",
                                success:function (data) {
                                    if (data.result>0){
                                        $("#projectNameMsg").html("  项目名已存在!").css("color","red");
                                        $('#addSmt').linkbutton('disable')
                                    }else {
                                        $("#projectNameMsg").html("  项目名可以使用").css("color","green");
                                        $('#addSmt').linkbutton('enable')
                                    }
                                }
                            });
                        }
                    }
                })
            }
        });

        $("#addSmt").click(function(){
            //$.messager.progress();	// display the progress bar
            $('#ff').submit();
        });
        $('#ff').form({
            url:'${pageContext.request.contextPath}/project/addOrUpdate.json',
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
                    $('#add-project-dlg').dialog("close");
                    $('#dg').datagrid('reload');
                    //alert(data.message);
                }else{
                    alert(data.message);
                }
                //$.messager.progress('close');
            }
        });
        //加载建设方单位
        $('#a_builderId').combobox({
            url:'${pageContext.request.contextPath}/company/getByCompanyTypeId.json?companyTypeId=1',
            valueField:'companyId',
            textField:'companyName',
            onSelect: function(company) {

            }
        });
        //施工方单位
        $('#a_constructorId').combobox({
            url:'${pageContext.request.contextPath}/company/getByCompanyTypeId.json?companyTypeId=2',
            valueField:'companyId',
            textField:'companyName',
            onSelect: function(company) {

            }
        });
        //监理方单位
        $('#a_supervisorId').combobox({
            url:'${pageContext.request.contextPath}/company/getByCompanyTypeId.json?companyTypeId=3',
            valueField:'companyId',
            textField:'companyName',
            onSelect: function(company) {
                console.debug("gumy","select:company")
				//加载总监,监理工程师,文员 /getUserByCompany.json
                //总监
                $('#a_chiefInspectorId,#a_supervisionEngineerId,#a_clerkId').combobox({
                    url:'${pageContext.request.contextPath}/user/getUserByCompany.json?companyId='+company.companyId,
                    valueField:'userId',
                    textField:'userName',
                    onSelect: function(company) {

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
        $("#projectNameMsg").html("").css("color","green");
    }

</script>
</body>
</html>
