<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人待办</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>

    <style type="text/css">
        *{
            box-sizing:border-box;
            -moz-box-sizing:border-box;   /*Firefox*/
            -webkit-box-sizing:border-box;  /*Ssfari*/
            -ms-box-sizing:border-box;

        }

    </style>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>

</head>
<body class="easyui-layout">
<div data-options="region:'west',title:'所属对象',split:true" style="width:150px;">
    <p style="padding:5px;margin:0;">请为角色或用户授权:</p>
    <ul class="roles" id="roles">
        <%--角色--%>


    </ul>
    <ul class="users" id="users">
        <%--用户--%>


    </ul>

</div>
