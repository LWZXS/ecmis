<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">

    <title>单位管理</title>
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
        * {
            margin: 0;
            padding: 0;
            box-sizing: content-box;
            -moz-box-sizing: content-box; /* Firefox */
            -webkit-box-sizing: content-box; /* Safari */
            -ms-box-sizing: content-box; /* IE */
        }

    </style>

</head>

<body>
<table id="dg" title="单位列表" style="width:100%;height: 100%;"
       data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',singleSelect:true,checkOnSelect:true,fitColumns:true,pagination:true,striped:true,showFooter:true,fit:true,toolbar:'#tb',method:'get'">
</table>
<div id="tb">
    <form action="" id="searchFrm">
        <label for="companyName" style="margin-left: 5px;">单位名称:</label>
        <input style="height: 22px;" class="easyui-textbox"  id="companyName" name="companyName" type="search" placeholder="单位名称...">
        状态:
        <select class="easyui-combobox" panelHeight="auto" style="width:100px" name="status" id="status">
            <option value="">全部</option>
            <option value="1">正常</option>
            <option value="2">锁定</option>
            <option value="3">删除</option>
        </select>
        <a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search1'">查询</a>
        <br/>
        <a href="javascript:void(0)" id="addDept" class="easyui-linkbutton"  data-options="plain:true,iconCls:'icon-add'">增加</a>
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
    <!-- 增加部门Dialog start-->
    <div id="add-company-dlg" class="easyui-dialog" closed="true" title="新增单位"
         style="width:440px;height:380px;padding:10px;"
         data-options="buttons:'#add-company-buttons'">
        <div style="margin:20px 0;"></div>
        <div title="" style="width:400px;">
            <div style="padding:10px 60px 20px 60px">
                <form id="ff" method="post">
                    <input name="companyId" value="" type="hidden" id="companyId"/>
                    <table cellpadding="5">
                        <tr>
                            <td>单位名称:</td>
                            <td><input class="easyui-textbox" type="text" id="a_companyName" name="companyName" style="width: 220px"
                                       data-options="required:true,missingMessage:'单位名不能为空',invalidMessage:'输入格式不正确'"/>
                            </td>
                        </tr>
                        <tr>
                            <td>单位类型:</td>
                            <td>
                                <input id="companyTypeId" name="companyTypeId" style="width: 220px;"data-options="required:true,missingMessage:'请选择单位类型',invalidMessage:'输入格式不正确'"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="a_status">锁定:</label></td>
                            <td>
                                <select class="easyui-combobox" panelHeight="auto" style="width:220px;" name="status"
                                        id="a_status">
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
    <div id="add-company-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton"
           onclick="javascript:$('#add-company-dlg').dialog('close')">关闭</a>
    </div>
    <!-- 增加Dialog end-->
</div>
<script type="text/javascript">
    $(function () {
        //查看

        /*加载公司类型--jeasyui*/
        $('#companyTypeId').combobox({
            url: '${pageContext.request.contextPath}/companyType/getAll.json',
            valueField: 'companyTypeId',
            textField: 'companyTypeName'
        });
        //刷新
        $("#refresh").click(function () {
            $('#dg').datagrid('reload');
        });
        //删除
        $("#delete").click(function () {
            //var row=$('#dg').datagrid('getChecked');//获得所有选中的checkbox,是一个数组
            var company = $('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            if (company && confirm("是否确定删除 " + company.companyName)) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/company/updateStatus.json",
                    type: "get",
                    data: {"companyId": company.companyId,"status":3},
                    dataType: "json",
                    success: function (data) {
                        if (data.result == true) {
                            $('#dg').datagrid('reload');
                        }
                        alert(data.message);
                    },
                    error: function () {
                        alert("操作出错!");
                    }
                });
            }
        });

        //修改
        $("#update").click(function () {
            var company = $('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            if (company) {
                $('#add-company-dlg').dialog({
                    title: '修改部门'
                });
                $("#add-company-dlg").dialog("open");
                $("#companyId").val(company.companyId);
                $("#a_companyName").textbox("setValue", company.companyName);
                $('#companyTypeId').combobox('setValue', company.companyTypeId);

                $('#a_status').combobox('setValue', company.status);

            }
        });

        //锁定
        $("#lock").click(function () {
            var company = $('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            if (company && confirm("是否确定锁定 " + company.companyName)) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/company/updateStatus.json",
                    type: "get",
                    data: {"companyId": company.companyId,"status":2},
                    dataType: "json",
                    success: function (data) {
                        if (data.result) {
                            $('#dg').datagrid('reload');
                        } else {
                            //不成功提示
                            alert(data.message);
                        }
                    }

                })
            }
        });

        $("#addSmt").click(function () {
            //$.messager.progress();	// display the progress bar
            $('#ff').submit();
        });
        $('#ff').form({
            url: '${pageContext.request.contextPath}/company/add.json',
            dataType: 'json',
            onSubmit: function () {
                var isValid = $(this).form('validate');
                if (!isValid) {
                    //$.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
                // return false to prevent submit;
            },
            success: function (data) {
                var data = eval('(' + data + ')'); // change the JSON string to javascript object
                if (data.result==true) {
                    $('#ff').form('clear');
                    $("#add-company-dlg").dialog("close");
                    $('#dg').datagrid('reload');
                    //alert(data.message);
                } else {
                    alert(data.message);
                }
                //$.messager.progress('close');
            }
        });


        $('#dg').datagrid({
            url: '${pageContext.request.contextPath}/company/list.json',
            /* queryParams: {
                startTime:$('input[name=startTime]').val(),
                endTime:$('input[name=endTime]').val(),
                statusId:$('select[name=statusId]').val()
            }, */
            onLoadSuccess: function (data) {

            },
            onDblClickRow: function (rowIndex, rowData) {
                //双击做的事
                //alert(rowIndex+rowData.documentId);
                //window.location.href='dept/view/'+rowData.deptId;
            },
            columns: [[
                {field: 'ck', checkbox: true},
                {field: 'companyId', title: '单位编号', width: 10, align: 'center', resizable: true},
                {field: 'companyName', title: '单位名称', width: 40, align: 'left', resizable: true},
                {field: 'companyTypeName', title: '单位类型', width: 40, align: 'left', resizable: true},
                {field: 'telphone', title: '电话', width: 20, align: 'left', resizable: true},
                {field: 'address', title: '地址', width: 20, align: 'left', resizable: true},
                {field: 'statusName', title: '状态', width: 10, align: 'center'}
            ]]
        });

        $("#searchBtn").click(function () {
            var params = $('#searchFrm').serializeArray();
            var s = "";
            for (var i in params) {
                s += params[i].name + "=";
                s += (params[i].value == "" ? "" : params[i].value) + "&";
            }
            s = s.substring(0, s.length - 1);
            $('#dg').datagrid({
                url: '${pageContext.request.contextPath}/company/list.json?' + s
            });
        });

        $("#addDept").click(function () {
            $('#add-company-dlg').dialog({
                title: '增加单位'
            });
            $('#ff').form('clear');
            $('#a_status').combobox('setValue',1);
            $("#add-company-dlg").dialog("open");
        });
    });

    function clearForm() {
        $('#ff').form('clear');
    }

</script>
</body>
</html>	
