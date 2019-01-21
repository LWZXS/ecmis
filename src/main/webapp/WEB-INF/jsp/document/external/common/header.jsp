<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>外部文档</title>
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
        a:link{
            text-decoration: none;
            color:#333;

        }
        .LeftMenu li{
            list-style: none;

        }
        .LeftMenu li img,.LeftMenu li a{
            vertical-align: middle;
        }

        .LeftMenu li a{
            margin-left: 10px;
        }
        .LeftMenu li{
            margin: 0 auto;
            padding: 5px;
            border: 1px solid #fff;
            width: 120px;
            border-radius:5px;
            text-align: left;
        }
        .LeftMenu li:hover{
            border: 1px solid #95B8E7;
            border-radius:5px;
        }
        #ff table tr{
            height: 36px;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>

</head>
<body class="easyui-layout">
<div data-options="region:'west',title:'文档管理',split:true" style="width:150px;">
    <p style="padding:5px;margin:0;">请选择您要的操作:</p>
    <ul class="LeftMenu">
        <%--
        <c:if test="${not empty sessionScope.loginUserProject }">
            <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="document/add.html" target="innerIframe">新建文档</a></li>
        </c:if>
        --%>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="<%=request.getContextPath()%>/document/external/add.html">新建文档</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="<%=request.getContextPath()%>/document/external/index.html" >待审核列表</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="<%=request.getContextPath()%>/document/external/pending.html">待归档列表</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_issued.png"></img><a href="<%=request.getContextPath()%>/document/external/issued.html">已发文件</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_havetodo.png"></img><a href="<%=request.getContextPath()%>/document/external/havetodo.html">已办文件</a></li>
    </ul>
</div>
