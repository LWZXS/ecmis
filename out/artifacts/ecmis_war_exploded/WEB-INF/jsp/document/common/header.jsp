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
        .filebtns{
            position: absolute;
            top: 5px;
            right: 30px;
            z-index: 1;
        }
        .areabtn{
            height: 44px;
            vertical-align: middle;
            margin-top: -38px;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>

</head>
<body class="easyui-layout">
<%--<div data-options="region:'north',title:'',split:false" style="height:44px; line-height: 42px" >
    <a href="${pageContext.request.contextPath}/document/inner.html" target="contentIframe" onclick="selectCurr(this);" class="easyui-linkbutton" option="innerFile" data-options="plain:true" style="margin:0 20px;">内部文档</a>|
    <a href="${pageContext.request.contextPath}/document/pigeonhole.html" target="contentIframe" onclick="selectCurr(this)" option="pigeonholeFile" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">归档文档</a>|
    <a href="${pageContext.request.contextPath}/document/system.html" target="contentIframe" onclick="selectCurr(this)" class="easyui-linkbutton" option="systemSet" data-options="plain:true" style="margin:0 20px;">系统设置</a>
</div>--%>
<div data-options="region:'west',title:'发件管理',split:true" style="width:150px;">
    <p style="padding:5px;margin:0;">请选择您要的操作:</p>
    <ul class="LeftMenu">
        <%--
        <c:if test="${not empty sessionScope.loginUserProject }">
            <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="document/add.html" target="innerIframe">新建文档</a></li>
        </c:if>
        --%>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="<%=request.getContextPath()%>/document/add.html">新建文档</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="<%=request.getContextPath()%>/document/index.html" >个人待办</a></li>

        <%--
        <c:set var="isClerk" value="${elf:filterMenu(loginUser) }"></c:set>
        <c:if test="${isClerk }">
            <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="document/pending.html" target="innerIframe">待归档文件</a></li>
        </c:if>
        --%>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="<%=request.getContextPath()%>/document/pending.html">待归档文件</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_draft.png"></img><a href="<%=request.getContextPath()%>/document/draft.html">草稿</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_issued.png"></img><a href="<%=request.getContextPath()%>/document/issued.html">已发文件</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_havetodo.png"></img><a href="<%=request.getContextPath()%>/document/havetodo.html">已办文件</a></li>
        <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_receive.png"></img><a href="<%=request.getContextPath()%>/document/receive.html">接收文档</a></li>
    </ul>
</div>
