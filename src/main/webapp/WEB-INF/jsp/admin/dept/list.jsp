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

    <title>部门结构</title>
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
<table id="dg" title="部门列表" style="width:100%;height: 100%;"
       data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',singleSelect:true,checkOnSelect:true,fitColumns:true,pagination:true,striped:true,showFooter:true,fit:true,toolbar:'#tb',method:'get'">
</table>
<div id="tb">
    <form action="" id="searchFrm">
        <label for="deptName" style="margin-left: 5px;"></label>部门名称:<input style="height: 22px;" class="easyui-textbox"
                                                                            id="deptName" name="deptName" type="search"
                                                                            placeholder="部门名称...">
        状态:
        <select class="easyui-combobox" panelHeight="auto" style="width:100px" name="status" id="status">
            <option value="">全部</option>
            <option value="1">正常</option>
            <option value="2">锁定</option>
            <option value="3">删除</option>
        </select>
        <a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'icon-search1'">查询</a>
        <br/>
        <a href="javascript:void(0)" id="addDept" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'icon-add'">增加</a>
        <a href="javascript:void(0)" id="delete" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'icon-delete16'">删除</a>
        <a href="javascript:void(0)" id="update" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'icon-update'">修改</a>
        <a href="javascript:void(0)" id="lock" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'icon-lock16'">锁定</a>
        <a href="javascript:void(0)" id="refresh" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'icon-refresh'">刷新</a>
        <%--<a href="javascript:void(0)" id="view" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-view'">浏览</a>
        <a href="javascript:void(0)" id="export" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-export'">导出明细</a>
        <a href="javascript:void(0)" id="search" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search1'">高级查询</a>--%>

    </form>
</div>

<div>
    <!-- 增加部门Dialog start-->
    <div id="adddept-dlg" class="easyui-dialog" closed="true" title="新增部门"
         style="width:440px;height:380px;padding:10px;"
         data-options="buttons:'#adddept-buttons'">
        <div style="margin:20px 0;"></div>
        <div title="" style="width:400px;">
            <div style="padding:10px 60px 20px 60px">
                <form id="ff" method="post">
                    <input name="deptId" value="" type="hidden" id="deptId"/>
                    <table cellpadding="5">
                        <tr>
                            <td>部门名称:</td>
                            <td><input class="easyui-textbox" type="text" id="a_deptName" name="deptName"
                                       data-options="required:true,missingMessage:'部门名不能为空',invalidMessage:'输入格式不正确'"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="deptTypeId">组织类型:</label></td>
                            <td>
                                <%--<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'deptType/easyUiTree.json'" name="deptTypeId" id="deptTypeId">

                                </select>--%>
                                <input id="deptTypeId" name="deptTypeId" style="width: 132px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="parentId">上级部门:</label></td>
                            <td>
                                <%--<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'dept/easyUiTree.json'" name="parentId" id="parentId">

                                </select>--%>
                                <input id="parentId" name="parentId" style="width: 132px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="companyId">所属公司:</label></td>
                            <td>
                                <%--<select style="width: 132px;" class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'company/findAll4Select'" name="companyId" id="companyId">

                                </select>--%>
                                <input id="companyId" name="companyId" style="width: 132px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="sortNumber">排序:</label></td>
                            <td><input id="sortNumber" class="easyui-textbox" type="text" name="sortNumber"/></td>
                        </tr>
                        <tr>
                            <td><label for="a_status">锁定:</label></td>
                            <td>
                                <select class="easyui-combobox" panelHeight="auto" style="width:132px;" name="status"
                                        id="a_status">
                                    <option value="1">正常</option>
                                    <option value="2">锁定</option>
                                    <option value="3">删除</option>
                                </select>
                            </td>
                        </tr>

                    </table>
                </form>
                <div style="text-align:center;padding:5px">
                    <a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" id="addDeptSmt">提交</a>
                    <a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" onclick="clearForm();">清除</a>
                </div>
            </div>
        </div>
    </div>
    <div id="adddept-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton"
           onclick="javascript:$('#adddept-dlg').dialog('close')">关闭</a>
    </div>
    <!-- 增加部门Dialog end-->
</div>
<script type="text/javascript">
    $(function () {
        //获取浏览器显示区域的高度
        $(window).height();
        //获取浏览器显示区域的宽度
        $(window).width();

        //获取页面的文档高度
        $(document.body).height();
        //获取页面的文档宽度
        $(document.body).width();

        //获取滚动条到顶部的垂直高度
        $(document).scrollTop();
        //获取滚动条到左边的垂直宽度
        $(document).scrollLeft();


        //查看


        //刷新
        $("#refresh").click(function () {
            $('#dg').datagrid('reload');
        });
        //删除
        $("#delete").click(function () {
            //var row=$('#dg').datagrid('getChecked');//获得所有选中的checkbox,是一个数组
            var dept = $('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            if (dept && confirm("是否确定删除" + dept.deptName)) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/dept/delete.json",
                    type: "get",
                    data: {"deptId": dept.deptId},
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
            var dept = $('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。


            if (dept) {

                $('#adddept-dlg').dialog({
                    title: '修改部门'
                });
                //加载上级部门
                comboboxDept();
                $("#adddept-dlg").dialog("open");
                $("#deptId").val(dept.deptId);
                $("#a_deptName").textbox("setValue", dept.deptName);
                $('#deptTypeId').combobox('setValue', dept.deptTypeId);
                $('#parentId').combobox('setValue', dept.parentId);
                $('#companyId').combobox('setValue', dept.companyId);
                $("#sortNumber").textbox("setValue", dept.sortNumber);
                $('#a_status').combobox('setValue', dept.status);

            }
        });

        //锁定
        $("#lock").click(function () {
            var dept = $('#dg').datagrid('getSelected');//返回第一个选中的行或者 null。
            if (dept && confirm("是否确定锁定" + dept.deptName)) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/dept/lock.json",
                    type: "get",
                    data: {"deptId": dept.deptId},
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

        $("#addDeptSmt").click(function () {
            //$.messager.progress();	// display the progress bar
            $('#ff').submit();
        });
        $('#ff').form({
            url: '${pageContext.request.contextPath}/dept/add.do',
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
                if (data.result) {
                    $('#ff').form('clear');
                    $("#adddept-dlg").dialog("close");
                    $('#dg').datagrid('reload');
                    //alert(data.message);
                } else {
                    alert(data.message);
                }
                //$.messager.progress('close');
            }
        });

        /*加载公司--jeasyui*/
        $('#companyId').combobox({
            url: '${pageContext.request.contextPath}/company/findAll4Select',
            valueField: 'id',
            textField: 'text'
        });
        //组织
        $('#deptTypeId').combobox({
            url: '${pageContext.request.contextPath}/deptType/easyUiTree.json',
            valueField: 'id',
            textField: 'text'
        });

        /*$.ajax({
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
            url: '${pageContext.request.contextPath}/dept/list.json',
            /* queryParams: {
                startTime:$('input[name=startTime]').val(),
                endTime:$('input[name=endTime]').val(),
                statusId:$('select[name=statusId]').val()
            }, */
            onLoadSuccess: function (data) {

                if (data.result) {
                    alert("请登录！");
                }
            },
            onDblClickRow: function (rowIndex, rowData) {
                //双击做的事
                //alert(rowIndex+rowData.documentId);
                //window.location.href='dept/view/'+rowData.deptId;
            },
            columns: [[
                {field: 'ck', checkbox: true},
                {field: 'deptId', title: '部门编号', width: 10, align: 'center', resizable: true},
                {field: 'deptName', title: '部门名称', width: 40, align: 'left', resizable: true},
                {field: 'deptTypeName', title: '组织类型', width: 40, align: 'left', resizable: true},
                {field: 'parentDeptName', title: '上级部门', width: 20, align: 'left', resizable: true},
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
                url: '${pageContext.request.contextPath}/dept/list.json?' + s
            });
        });

        $("#addDept").click(function () {
            //加载上级部门
            comboboxDept();
            $('#adddept-dlg').dialog({
                title: '增加部门'
            });
            $('#ff').form('clear');
            $("#adddept-dlg").dialog("open");
            //$("#adddept-dlg").panel("move",{top:($(window).height()-380-250) * 0.5});



        });


    });

    function comboboxDept() {
        $('#parentId').combobox({
            url: '${pageContext.request.contextPath}/dept/easyUiTree.json',
            valueField: 'id',
            textField: 'text',
            onSelect: function (record) {
                //alert(record.id+""+record.text);
                $.ajax({
                    url: "${pageContext.request.contextPath}/dept/getSortNumber.json",
                    type: "get",
                    data: "parentId=" + record.id,
                    dataType: "json",
                    success: function (data) {
                        //alert(data.sortNumber)
                        //$("input[name=sortNumber]").val(data.sortNumber);
                        //$("#sortNumber").val(sortNumber);
                        $("#sortNumber").textbox("setValue", data.sortNumber);
                    }

                })

            }
        });
    }

    function clearForm() {
        $('#ff').form('clear');
    }

</script>
</body>
</html>	
