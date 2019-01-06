<%--
  Created by IntelliJ IDEA.
  User: gumuyun
  Date: 2018/11/29
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <script language="javascript">
        var globalUserId = '00033466';
        var globalUserName = '广东天安金中直流';
        var globalOrganizationId = '24731';
        var globalOrganizationName = '广东天安工程监理有限公司';
        var webPath = '/web';
    </script>

    <script src="index_files/ESAPI_Standard_en_US.js"></script>
    <script src="index_files/ESAPI.js"></script>
    <script src="index_files/Base.js"></script>
    <script src="index_files/CISF-notified.js"></script>
    <style type="text/css">.humane,
    .humane-flatty {
        position: fixed;
        -moz-transition: all 0.4s ease-in-out;
        -webkit-transition: all 0.4s ease-in-out;
        -ms-transition: all 0.4s ease-in-out;
        -o-transition: all 0.4s ease-in-out;
        transition: all 0.4s ease-in-out;
        z-index: 100000;
        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100);
    }

    .humane,
    .humane-flatty {
        font-family: Helvetica Neue, Helvetica, san-serif;
        font-size: 16px;
        top: 0;
        left: 30%;
        opacity: 0;
        width: 40%;
        color: #be944d;
        padding: 25px 10px;
        text-align: center;
        background-color: #fcf8e3;
        -webkit-border-bottom-right-radius: 3px;
        -webkit-border-bottom-left-radius: 3px;
        -moz-border-bottom-right-radius: 3px;
        -moz-border-bottom-left-radius: 3px;
        border-bottom-right-radius: 3px;
        border-bottom-left-radius: 3px;
        -webkit-box-shadow: 0 1px 2px #faebcc;
        box-shadow: 0 1px 2px #faebcc;
        -moz-transform: translateY(-100px);
        -webkit-transform: translateY(-100px);
        -ms-transform: translateY(-100px);
        -o-transform: translateY(-100px);
        transform: translateY(-100px);
    }

    .humane p,
    .humane-flatty p,
    .humane ul,
    .humane-flatty ul {
        margin: 0;
        padding: 0;
    }

    .humane ul,
    .humane-flatty ul {
        list-style: none;
    }

    .humane-animate,
    .humane-flatty.humane-flatty-animate {
        opacity: 1;
        -moz-transform: translateY(0);
        -webkit-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    .humane-animate:hover,
    .humane-flatty.humane-flatty-animate:hover {
        opacity: 0.7;
    }

    .humane-js-animate,
    .humane-flatty.humane-flatty-js-animate {
        opacity: 1;
        -moz-transform: translateY(0);
        -webkit-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0);
    }

    .humane-js-animate:hover,
    .humane-flatty.humane-flatty-js-animate:hover {
        opacity: 0.7;
        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
    }
    </style>
    <script src="index_files/JavaScriptServlet"></script>

    <script language="javascript">
        org.owasp.esapi.ESAPI.initialize();
        var instance = $ESAPI.encoder();
    </script>


    <meta name="renderer" content="webkit">

    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <link rel="shortcut icon" href="http://10.121.180.109/web/top/workbench/base/img/logo.ico">
    <script type="text/javascript" src="index_files/jquery.js"></script>
    <script type="text/javascript" src="index_files/base.js"></script>
    <link rel="stylesheet" href="index_files/theme.css">
    <script type="text/javascript" src="index_files/require.js"></script>
    <script type="text/javascript" src="index_files/require_002.js"></script>
    <script type="text/javascript" src="index_files/engine.js"></script>
    <script type="text/javascript" src="index_files/util.js"></script>

    <!-- <title>首页-中国南方电网</title> -->
    <title>首页</title>
    <style type="text/css">
        ::-webkit-scrollbar {
            width: 9px;
            height: 9px;
            box-sizing: border-box
        }

        ::-webkit-scrollbar-button {
            width: 9px;
            height: 12px;
            background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAAUCAYAAADRA14pAAADr0lEQVRYR71Yy04iQRQtE10IRiSBOLbOUvZmfkIlLHXjI+jCDzAm8w8TJKxZyENdqEui8BPuDVtsHCNGQcFEWUzdSt/KtbqqqZ44U0kn1V2n69xz63W6x5h9iXFoNADe521dftnibJlt+7PCjdmycpzz9vbmmvCTk5PzvK0NuNvbWyNuYWEBcbbUX8obSvBgMDAKiUQiUrDLi0nNPC9eYqwFfyWvTvAPHsm1JhqHEl9dXbHV1VUJo4Lv7u6k4JOTE7a5uSlxc3Nz/0ww5VXjR15VMIjFoop2+v2+EAJisaDoaDQqR/j+/l7gjo+PJW5ra0vUZ2dnqWDko1zqM+fi4kL0RxOMMaytrUneXC4ncMhFYzg4OBA4KpiK1Yl2Xl9fXSqWip6ampLEDw8PbrVa9U2S7e1tlkwmdYIBC6J1CXfOz8/ljAHRNIbFxcXs0tJShb/rHB4eShxw0RgymczPVCr1CwWrRCOJeQesVqtJUevr61JwPp+XxHt7e6xYLErc/v6+OqVHJvrl5cWt1+u+BEIMNzc3UvDj46NbqYD2zwViaLfbWsGBU+vs7EwIASIow+GQYSA8e5K4UCgIHBBBeX9/Z+VyWdT5CAliJabApdTr9UR/VDTGQPeO5+dngUMuGgPiQu3S3W7XHR8fl2IxaHjWbDalYAhwYmJCNH98fEht8KzVaukEA8a4WQIvdgKiacJjsZicWZgYwJZKJZlwiGF6etq3hpWk+24dzKAOODMzI4lhrZs6I2t9FB+2+3ghcZjIIF4YCJiFUJA31AjbCrY8N/9aMH2RCrbhDSP4OydKBETZ4W09fn3jV8SAG/Dnv/kFFtS22PC2eGdWOJNg3fnos3iXl5ci6HQ6zTxryVRbeXp6KjAbGxvMYCt1XDQZgpdy0UbV0lI+ikNuk9NCLN21fU4LQXA2ersgbP+fXBZiwG05jqNzWUE7NLwueHVmBxrpLg3c4OwoJ9aR+6udFgvhsugA/DeHZ3JaWi+tOi1q9bxdkHU6nU8uCxwPlkQiEeSjTaKFw8M+1JGmDg+4EUddFsSA3KFGWGcAVlZWBId3zrGnpyff4Z/NZgUmHo+bBIc2Hgqv+Cy14Q61hlUDgNkEcs8AMPXwR8zOzo48/Olc5vWRaxh4qctCsdCPajzAcFBOrI8yHtpdWj2HG42G6G95eZl55yHDLyokOjo6EtXd3V1Gvqh061e3jAAnjAfloi/Tcxi4KR/FIXeYc9jmFwpw2PwGUgY58NaG1/rX0h9d1DUzJEP0JgAAAABJRU5ErkJggg==);
            background-color: transparent;
            background-repeat: no-repeat
        }

        ::-webkit-scrollbar-button:vertical:start {
            background-position: 0px 0px
        }

        ::-webkit-scrollbar-button:vertical:start:hover {
            background-position: -10px 0
        }

        ::-webkit-scrollbar-button:vertical:start:active {
            background-position: -20px 0
        }

        ::-webkit-scrollbar-button:vertical:end {
            background-position: -30px 0
        }

        ::-webkit-scrollbar-button:vertical:end:hover {
            background-position: -40px 0
        }

        ::-webkit-scrollbar-button:vertical:end:active {
            background-position: -50px 0
        }

        ::-webkit-scrollbar-button:horizontal:start {
            background-position: 0 -11px
        }

        ::-webkit-scrollbar-button:horizontal:start:hover {
            background-position: -10px -11px
        }

        ::-webkit-scrollbar-button:horizontal:start:active {
            background-position: -19px -11px
        }

        ::-webkit-scrollbar-button:horizontal:end {
            background-position: -30px -11px
        }

        ::-webkit-scrollbar-button:horizontal:end:hover {
            background-position: -40px -11px
        }

        ::-webkit-scrollbar-button:horizontal:end:active {
            background-position: -50px -11px
        }

        ::-webkit-scrollbar-track-piece {
            background-color: rgba(0, 0, 0, 0.15);
            -webkit-border-radius: 5px
        }

        ::-webkit-scrollbar-thumb {
            background-color: #E7E7E7;
            border: 1px solid rgba(0, 0, 0, 0.21);
            -webkit-border-radius: 5px
        }

        ::-webkit-scrollbar-thumb:hover {
            background-color: #F6F6F6;
            border: 1px solid rgba(0, 0, 0, 0.21)
        }

        ::-webkit-scrollbar-thumb:active {
            background: -webkit-gradient(linear, left top, left bottom, from(#e4e4e4), to(#f4f4f4))
        }

        ::-webkit-scrollbar-corner {
            background-color: #f1f1f1;
            -webkit-border-radius: 1px
        }
    </style>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="cui"
            src="index_files/module_002.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_"
            data-requiremodule="workbench/newplatform/static/js/task" src="index_files/task.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="toolbar"
            src="index_files/toolbar.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="popover-x"
            src="index_files/popover-x.js"></script>
    <link type="text/css" rel="stylesheet" href="index_files/comtop.css">
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_"
            data-requiremodule="component/topui/cui/js/comtop.ui.min" src="index_files/comtop.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="loginAction"
            src="index_files/LoginAction.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="json2"
            src="index_files/json2.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="underscore"
            src="index_files/module.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_"
            data-requiremodule="workbench/newplatform/static/js/drag" src="index_files/drag.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jqueryui"
            src="index_files/jquery-ui.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="cui.storage"
            src="index_files/cStorage.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="lazyload"
            src="index_files/lazyload.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_"
            data-requiremodule="/web/top/workbench/component/underscore/underscore-min.js"
            src="index_files/underscore-min.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="messenger"
            src="index_files/messenger.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="appCtr"
            src="index_files/newplatform.js"></script>
    <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_"
            data-requiremodule="workbench/dwr/interface/AppAction" src="index_files/AppAction.js"></script>
</head>
<body class="popover-x-body">


<script type="text/javascript">
    var ssoServerAddress = 'http://10.121.181.235';
    var zcServerAddress = 'http://10.121.180.109';
    var hasToDo = 'true';
    var loginType = '1';
    var logoutPageClose = "false";
    var orgId = '24731';
</script>
<link rel="stylesheet" class="mediaHack" href="index_files/navbar.css">
<!--[if lt IE 9]>
<script src="/web/top/workbench/newplatform/static/js/respond.src.js"></script>
<![endif]-->
<script type="text/javascript" src="index_files/banner.js"></script>
<div id="banner" class="container-fluid">
    <div class="row">
        <div class="navbar navbar-dark navbar-fixed-top">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="http://10.121.180.109/web/top/workbench/PlatFormAction/initPlatform.ac">
                    中国南方电网
                    <img class="logo" src="index_files/nav-logo_201f393.png" alt="中国南方电网">
                </a>
            </div>

            <div id="navbar" class="navbar-collapse collapse">
                <div class="title">

                </div>
                <ul class="nav navbar-nav">

                    <li>
                        <a href="http://10.121.180.109/web/top/workbench/PlatFormAction/initPlatform.ac">
                            <span class="icon icon-home"></span>
                            首页
                        </a>
                    </li>
                    <li>
                        <a href="http://10.121.180.109/web/top/workbench/app/MyApp.jsp">
                            <span class="icon icon-app"></span>
                            应用
                        </a>
                    </li>

                    <li>
                        <a href="http://10.121.180.109/web/top/workbench/querycenter/QueryCenter.jsp">
                            <span class="icon icon-search"></span>
                            查询
                        </a>
                    </li>
                    <li>
                        <a href="http://10.121.180.109/web/top/workbench/todo/TodoCenter.jsp">
                            <span class="icon icon-todo"></span>
                            待办
                            <span id="todoId" class="badge">0</span>

                        </a>
                    </li>
                    <li>
                        <a href="http://10.121.180.109/web/top/workbench/done/gotoDoneCenter.ac">
                            <span class="icon icon-done"></span>
                            已办
                        </a>
                    </li>


                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li id="aMessageId">
                        <a href="http://10.121.180.109/web/top/workbench/message/gotoMessageCenter.ac">
                            <span class="icon icon-message"></span>
                            <span id="messageId" class="badge">4</span>
                        </a>
                    </li>
                    <li>
                        <a href="http://10.121.180.109/web/top/workbench/personal/AccountSet.jsp">
                            <span class="icon icon-user"></span> </a>
                    </li>
                    <li id="nav-user-name" class="only-one-itme">
                        <a href="javascript:void(0)">广东天安金中直流</a>
                    </li>
                    <li class="verticale"></li>
                    <li>
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">帮助
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="http://10.121.180.109/web/top/workbench/PlatFormAction/NewVersionNav.ac">新功能介绍</a>
                            </li>
                            <li>
                                <a href="http://10.121.180.109/web/top/workbench/PlatFormAction/HistoryVersion.ac">历史版本</a>
                            </li>
                        </ul>
                    </li>
                    <li class="verticale"></li>
                    <li>
                        <a id="exit" href="javascript:void(0);">
                            退出
                        </a>
                    </li>
                    <li class="verticale"></li>
                    <li><a class="dropdown-toggle" data-toggle="dropdown">登录服务平台<b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="http://10.150.73.118:7001/BigCentralizationCenter/bin/ReqSearchView.html?userName=gdtazj.jl&amp;sysCode=0378-SC01-1304"
                                   target="_blank">安全生产(主网)</a></li>
                            <li>
                                <a href="http://10.150.73.118:7001/BigCentralizationCenter/bin/ReqSearchView.html?userName=gdtazj.jl&amp;sysCode=0378-SC01-1304-"
                                   target="_blank">安全生产(配网)</a></li>
                            <li>
                                <a href="http://10.150.73.118:7001/BigCentralizationCenter/bin/ReqSearchView.html?userName=gdtazj.jl&amp;sysCode=jjxm"
                                   target="_blank">基建项目管理</a></li>
                            <li>
                                <a href="http://10.150.73.118:7001/BigCentralizationCenter/bin/ReqSearchView.html?userName=gdtazj.jl&amp;sysCode=tzjh"
                                   target="_blank">投资计划管理</a></li>
                            <li>
                                <a href="http://10.150.73.118:7001/BigCentralizationCenter/bin/ReqSearchView.html?userName=gdtazj.jl&amp;sysCode=wzgl"
                                   target="_blank">物资管理</a></li>
                            <li>
                                <a href="http://10.150.73.118:7001/BigCentralizationCenter/bin/ReqSearchView.html?userName=gdtazj.jl&amp;sysCode=xmgl"
                                   target="_blank">项目管理</a></li>
                            <li>
                                <a href="http://10.150.73.118:7001/BigCentralizationCenter/bin/ReqSearchView.html?userName=gdtazj.jl&amp;sysCode=tytd"
                                   target="_blank">统一图档</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div><!-- 导航条 -->

<script type="text/javascript" src="index_files/LogAction.js"></script>
<script type="text/javascript">
    $('#navbar').on('click', 'li a', function (e) {
        var clickHref = e.currentTarget.href;
        if (e.currentTarget.innerText == 'Weblogic链接') {
            LogAction.logFuncByURL(window.location.href);
        }
    });
</script>
<div class="goto-top"></div><!-- 返回头部 -->
<div class="container-fluid">
    <div class="row">
        <div id="sidebar" class="task-wrap" role="navigation">
            <div class="task">
                <ul class="nav">

                    <li ishide="true"><a class="task-name cur" id="B1B70FC326DE4BC2AE4E547EE3E400E5" href="#"
                                         data-user-id="00033466" data-default="true" data-action="activeTask"
                                         data-task-name="常用桌面" data-darktheme="false" data-platformiconurl="default"
                                         data-template="03" data-task-index="0"><span
                            class="bg-icon-default"></span><strong title="常用桌面">常用桌面</strong></a></li>
                </ul>
            </div>
            <ul class="nav nav-add-task">
                <li>
                    <a href="#" class="add-task" data-action="addTask" title="点击添加桌面">
                        <span class="icon icon-plus"></span>
                        <span>添加</span>
                    </a>
                </li>
            </ul>
            <ul class="nav tools" id="tool-menu">
                <li>
                    <a href="#" data-action="addPortlet" class="add-portlet">
                        <span class="icon icon-cycle-plus"></span>
                        <span>添加微件</span>
                    </a>
                </li>
                <li>
                    <a href="#" data-action="editDesktop" class="add-desktop">
                        <span class="icon icon-edit-desktop"></span>
                        <span>编辑桌面</span>
                    </a>
                    <ul class="nav tools-menu" tabindex="-1">
                        <li style="display: none;"><a href="#" data-action="setDesktop" data-default="true">设置当前桌面</a>
                        </li>
                        <li><a href="#" data-action="resetDesktop">重置当前桌面</a></li>
                        <li style="display: none;"><a href="#" data-action="removeTask" data-default="true">删除当前桌面</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div><!-- 桌面导航条 -->
        <div id="page-wrapper">
            <div id="columns" class="column-wrap">
                <div id="default-wrapper" style="">
                    <div id="messageInfo" data-id="messageInfo">
                        <div class="msg-header">
                            <span class="close"></span>
                            <h4>您有新的消息
                                <span><a href="javascript:void(0)"
                                         data-url="/web/top/workbench/message/gotoMessageCenter.ac?tSession=1543489841431"
                                         data-mainframe="false" target="_blank">更多...</a></span>
                            </h4>
                        </div>
                        <div class="msg-body">
                            <div class="col-6 message ">
                                <div class="col-8">
                                    <p><a href="javascript:void(0)"
                                          data-url="%2Flcam%2Fproject%2Fepms%2Fcost%2Fserviceinvoice%2FPaymentInvoiceTab.jsp%3Factive_index%3D0%26invoicePaymentRelationId%3D010001201611150000104964%26processId%3DPS_InvoicePaymentAudit%26messageParam%3D%257B%2522searchCondition%2522%253A%2522FP010020161115101130071%2522%252C%2522taskNodeId%2522%253A%2522001186%2522%257D%26messageId%3D2ab498f1-18b2-42f9-bac9-bc93af94ad6c"
                                          data-appcode="" data-shownav="false"
                                          data-id="2ab498f1-18b2-42f9-bac9-bc93af94ad6c"
                                          data-mainframe="true" target="_blank"
                                          title="您的单据： FP010020161115101130071 被 郑军星回退了">您的单据:FP010020161115101130071 被
                                        郑军星回退了</a>
                                    </p>
                                </div>
                                <div class="col-4 text-right">
                                    <p>6-27</p>
                                </div>
                                <div class="col-8">
                                    <p><a href="javascript:void(0)"
                                          data-url="%2Flcam%2Fproject%2Fepms%2Fcost%2Fserviceinvoice%2FPaymentInvoiceTab.jsp%3Factive_index%3D0%26invoicePaymentRelationId%3D010001201611150000104965%26processId%3DPS_InvoicePaymentAudit%26messageParam%3D%257B%2522searchCondition%2522%253A%2522FP010020161115101130072%2522%252C%2522taskNodeId%2522%253A%2522001186%2522%257D%26messageId%3D33b5e1c5-ad37-4892-b2fd-b038238161b1"
                                          data-appcode="" data-shownav="false"
                                          data-id="33b5e1c5-ad37-4892-b2fd-b038238161b1"
                                          data-mainframe="true" target="_blank"
                                          title="您的单据： FP010020161115101130072 被 郑军星回退了">您的单据:FP010020161115101130072 被
                                        郑军星回退了</a></p></div>
                                <div class="col-4 text-right">
                                    <p>6-27</p>
                                </div>
                                <div class="col-8">
                                    <p><a href="javascript:void(0)"
                                          data-url="%2Flcam%2Fproject%2Fepms%2Fcost%2Fserviceconfirmation%2FConfirmationTab.jsp%3Factive_index%3D0%26serviceConfirmationId%3D010001201611150000029370%26processId%3DPS_SerConfirmAudit%26messageParam%3D%257B%2522searchCondition%2522%253A%2522%25E6%25BB%2587%25E8%25A5%25BF%25E5%258C%2597%25E8%2587%25B3%25E5%25B9%25BF%25E4%25B8%259C%25C2%25B1800kV%25E7%259B%25B4%25E6%25B5%2581%25E8%25BE%2593%25E7%2594%25B5%25E5%25B7%25A5%25E7%25A8%258B%25E7%259B%25B4%25E6%25B5%2581%25E7%25BA%25BF%25E8%25B7%25AF%25E3%2580%2581%25E6%258E%25A5%25E5%259C%25B0%25E6%259E%2581%25E7%25BA%25BF%25E8%25B7%25AF%25E5%258F%258A%25E6%258E%25A5%25E5%259C%25B0%25E6%259E%2581%25E5%25B7%25A5%25E7%25A8%258B%25E7%25AC%25AC11%25E6%25A0%2587%25E5%258C%2585%2522%252C%2522taskNodeId%2522%253A%2522000385%2522%257D%26messageId%3D68b60d50-12a6-4ca2-9dec-5c598d337125"
                                          data-appcode="" data-shownav="false"
                                          data-id="68b60d50-12a6-4ca2-9dec-5c598d337125"
                                          data-mainframe="true" target="_blank"
                                          title="您的单据： 滇西北至广东±800kV直流输电工程直流线路、接地极线路及接地极工程第11标包 被 郑丰回退了">您的单据：滇西北至广东±800kV直流输电工程直流线路、接地极线路及接地极工程第11标包
                                        被 郑丰回退了</a></p></div>
                                <div class="col-4 text-right"><p>6-25</p></div>
                            </div>
                            <div class="col-6 bulletin " data-path="/web">
                                <div class="col-8">
                                    <p>
                                        <a data-id="13E8731EE1A646138927CC6F6B3C6CF0"
                                           href="javascript:void 0" title="到货通知已变更成送货通知">到货通知已变更成送货通知</a>
                                    </p>
                                </div>
                                <div class="col-4 text-right"><p>7-16</p></div>
                                <div class="col-8">
                                    <p><a data-id="639960670A584C6081CBA273BC450D52"
                                          href="javascript:void 0"
                                          title="基建外网应用新域名发布通知">基建外网应用新域名发布通知</a>
                                    </p>
                                </div>
                                <div class="col-4 text-right">
                                    <p>6-14</p>
                                </div>
                                <div class="col-8"><p><a data-id="D4B230944D6742E09A51EE42FF6DD7AA"
                                                         href="javascript:void 0"
                                                         title="资产系统附件服务器停机通知">资产系统附件服务器停机通知</a></p></div>
                                <div class="col-4 text-right"><p>2017</p></div>
                            </div>
                        </div>
                    </div>
                    <div id="defaultWidget" data-id="defaultWidget" class="widget widget-normal">
                        <div class="widget-head">
                            <h3>关键指标<span></span></h3>
                            <a href="#" class="slide slide-up" title="点击收起/展开">收起/展开面板</a>
                            <div class="dropdown pull-right">
                                <a href="javascript:void(0)" class="dropdown-toggle more"  data-toggle="dropdown" title="关键指标设置">关键指标设置</a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="javascript:void(0)">暂无关键指标</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="widget-content">
                            <div class="widget-warn">未配置关键指标，请在微件管理模块添加或联系系统管理员处理。</div>
                        </div>
                    </div>
                    <div id="applications" data-id="applications" class="widget widget-normal ui-sortable">
                        <div class="widget-head"><h3>常用应用</h3>
                            <ul class="nav nav-tabs nav-lists"></ul>
                        </div>
                        <div class="widget-content tab-content">
                            <div class="tab-pane active">
                                <dl class="clearfix">
                                    <dd><a href="javascript:void(0)" data-url="/top/workbench/app/MyApp.jsp"
                                           data-mainframe="false"><img src="index_files/app-add.png">
                                        <div><p>添 加</p></div>
                                    </a></dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div id="backlog" data-id="backlog" class="widget widget-normal">
                        <div class="widget-head">
                            <ul class="nav nav-tabs nav-lists">
                                <li class="active"><a href="#todoTask" data-toggle="tab">待办任务</a></li>
                                <li><a data-href="#doneTask" href="#doneTask" data-toggle="tab">我的工单跟踪</a></li>
                            </ul>
                        </div>
                        <div class="widget-content tab-content">
                            <div id="todoTask" class="tab-pane active">
                                <div class="widget-warn">暂未查询到待办信息，请您稍后再试。</div>
                            </div>
                            <div id="doneTask" class="tab-pane">
                                <div class="widget-warn widget-loading"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="desktopB1B70FC326DE4BC2AE4E547EE3E400E5" class="column-full">
                    <ul class="column column2 clearfix">
                        <li class="widget widget-normal" data-id="06" editable="1" data-title="待办">
                            <div class="widget-head">
                                <h3>待办</h3>
                                <a href="#" class="widget-icon remove" title="点击删除">删除
                                </a><a href="#"
                                       class="widget-icon stick"
                                       title="点击置顶">置顶</a>
                                <a href="#" class="widget-icon move-down" title="点击下移">下移</a>
                                <a href="#" class="widget-icon move-up" title="点击上移">上移</a><a
                                    href="#" class="widget-icon reload" title="点击重新加载">重新加载</a>
                            </div>
                            <div class="edit-box" style="display: none; width: 1261px;">
                                <ul>
                                    <li class="item"><label>修改标题：</label><input value="待办" class="edit-input"></li>
                                </ul>
                            </div>
                        <li class="item" style="display: none"><label>可用颜色：</label>
                            <ul class="colors">
                                <li class="color-yellow" title="yellow"></li>
                                <li class="color-red" title="red"></li>
                                <li class="color-blue" title="blue"></li>
                                <li class="color-white" title="white"></li>
                                <li class="color-orange" title="orange"></li>
                                <li class="color-green" title="green"></li>
                                <li class="color-gray" title="gray"></li>
                                <li class="color-burlywood" title="burlywood"></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="widget-content">
                    <iframe class="widget-iframe" src="index_files/DesktopTodo.html" allowtransparency=""
                            aria-src="/web/top/workbench/todo/DesktopTodo.jsp?tSession=1543489841462" data-lzled="true"
                            frameborder="0"></iframe>
                </div>
                </li>


                </ul>
            </div>
        </div>
        <div class="task-portlet-tip" style="display: none;">当前工作台为空，是否<a href="#">添加微件</a>？</div>
        <div class="task-portlet-load-tip load-tip" style="display: none;">正在加载桌面，请稍候</div>
    </div><!-- 微件容器 -->
</div>
</div><!-- 主体内容 -->

<div id="taskDialog" class="task-dialog">
    <div class="desktop-form">
        <span style="color: red">*</span>桌面名称：<span id="txtTaskName" uitype="Input" maxlength="8" byte="false"></span>&nbsp;限8个字以内
    </div>
    <p>请选择要使用的桌面图标</p>
    <div>
        <ul class="desktop-icon"></ul>
    </div>
    <div class="desktop-template">
        <p>请选择要使用的模板</p>
        <div>
            <ul class="desktop-tpl"></ul>
        </div>
    </div>
</div>
<div id="portletDialog" class="portlet-dialog">
    <div class="class-list-wrap">
        <ul class="class-list">
        </ul>
    </div>
    <div class="portlet-list-wrap">
        <div class="portlet-list">
        </div>
    </div>
</div><!-- 新增桌面 -->

<script type="text/template" id="append-portlet-tmpl">
    <@ if(portletAry.length>0){@>
    <@ _.each(portletAry,function(portlet){ var title = portlet.selfName || portlet.portletName; @>
    <@ if(portlet.isCanvas == '1'){@>
    <li class="widget widget-canvas" data-id="<@= portlet.portletId @>" data-title="<@= title @>">
        <@ } else { @>
    <li class="widget widget-normal" data-id="<@= portlet.portletId @>" editable="<@= portlet.editAble @>"
        data-title="<@= title @>">
        <div class="widget-head">
            <h3><@= title @></h3>
        </div>
        <@ } @>
        <div class="widget-content">
            <iframe class="widget-iframe" onload="lazyloadIframe(this)" src="about:blank" frameborder="0"
                    allowTransparency
                    aria-src="<@= Workbench.formatUrl(portlet.portletUrl) + (portlet.isCanvas == '1' ? '#'+randomString(8) :'') @>"></iframe>
        </div>
    </li>
    <@ }) @>
    <@ } @>
</script>
<script type="text/template" id="portlet-tmpl">
    <@ if(portletAry.length>0){@>
    <@ _.each(portletAry,function(portlet){ var title = portlet.selfName || portlet.portletName; @>
    <@ if(portlet.isCanvas == '1'){@>
    <li class="widget widget-canvas" data-id="<@= portlet.portletId @>" data-title="<@= title @>">
        <@ } else { @>
    <li class="widget widget-normal" data-id="<@= portlet.portletId @>" editable="<@= portlet.editAble @>"
        data-title="<@= title @>">
        <div class="widget-head">
            <h3><@= title @></h3>
        </div>
        <@ } @>
        <div class="widget-content">
            <iframe class="widget-iframe" onload="lazyloadIframe(this)" src="about:blank" frameborder="0"
                    allowTransparency
                    aria-src="<@= Workbench.formatUrl(portlet.portletUrl) + (portlet.isCanvas == '1' ? '#'+randomString(8) :'') @>"></iframe>
        </div>
    </li>
    <@ }) @>
    <@ } @>
</script>
<script type="text/template" id="single-portlet-tmpl">
    <li class="widget widget-normal" data-id="<@= portlet.portletId @>" editable="<@= portlet.editAble @>"
        data-title="<@= portlet.portletName @>">
        <div class="widget-head">
            <h3><@= portlet.portletName @></h3>
        </div>
        <div class="widget-content">
            <iframe class="widget-iframe" frameborder="0" allowTransparency
                    src="<@= Workbench.formatUrl(portlet.portletUrl) @>"></iframe>
        </div>
    </li>
</script>

<script type="text/javascript" src="index_files/PlatFormAction.js"></script>
<script type="text/javascript">
    var workbenchData = {
        "listLeftPortlets": [],
        "listRightPortlets": [{
            "portletId": "06",
            "portletName": "待办",
            "selfName": "待办",
            "ptOrder": "0",
            "portletUrl": "/top/workbench/todo/DesktopTodo.jsp",
            "picAddress": "abc.png",
            "portletPosition": "1",
            "portletTag": "公共微件",
            "editAble": "1",
            "portletDescribe": null,
            "isCanvas": "0"
        }],
        "listPlatform": [{
            "platformId": "B1B70FC326DE4BC2AE4E547EE3E400E5",
            "userId": "00033466",
            "platformName": "常用桌面",
            "isDefaultPlatform": "1",
            "templateId": "03",
            "platformNumber": "0",
            "isLargePlatform": "0",
            "platformIconURL": null
        }],
        "intCurrentPlatformIndex": 0
    };
    $('#banner .navbar-dark').addClass('navbar-fixed-top');

    //唯一标识符算法
    function randomString(length) {
        var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'.split('');

        if (!length) {
            length = Math.floor(Math.random() * chars.length);
        }

        var str = '';
        for (var i = 0; i < length; i++) {
            str += chars[Math.floor(Math.random() * chars.length)];
        }
        return str;
    }

    require(["json2", "underscore", "cui", "workbench/newplatform/static/js/task", 'toolbar'], function (json2, _, cui, Task, Toolbar) {
        var data = workbenchData;
        if (data) {
            data.listLeftPortlets = [];

            var task = new Task({
                platformData: data,
                taskData: data.listPlatform,
                currentTaskIndex: data.intCurrentPlatformIndex
            });
            // 右下角工具块
            task.toolbar = Toolbar();
        }
    });
</script>


<div id="popover" class="popover popover-md popover-default has-footer">
    <div class="arrow"></div>
    <div class="popover-content">
        <div class="row clearfix">
            <div class="avatars col-xs-4"><img alt="avatars" class="img-circle" src="index_files/icon_photo.png"></div>
            <div class="info col-xs-8"><h4>广东天安金中直流</h4>
                <p>上次登录时间：</p>
                <p class="lastLoginDate">2018-11-29 18:10:58</p></div>
        </div>
    </div>
    <div class="popover-footer"><p class="company">监理单位</p>
        <p class="departments">广东天安工程监理有限公司</p></div>
</div>
<div class="popover-x-marker" style="display: none;"></div>
<ul class="ui-toolbar">
    <li class="goto-target"><a class="ui-toolbar-btn" href="javascript:void(0);" title="鼠标悬浮显示快速定位列表">快速定位</a>
        <div class="target-list-container">
            <ul class="goto-target-list">
                <li class="default-item" data-id="messageInfo"><a href="javascript:void(0);" title="您有新的消息">您有新的消息</a>
                </li>
                <li class="default-item" data-id="defaultWidget"><a href="javascript:void(0);" title="关键指标">关键指标</a>
                </li>
                <li class="default-item" data-id="applications"><a href="javascript:void(0);" title="常用应用">常用应用</a></li>
                <li class="default-item" data-id="backlog"><a href="javascript:void(0);"
                                                              title="待办任务/我的工单跟踪">待办任务/我的工单跟踪</a></li>
                <li data-id="06"><a href="javascript:void(0);" title="待办">待办</a></li>
            </ul>
        </div>
    </li>
    <li class="goto-top"><a class="ui-toolbar-btn" href="javascript:void(0);" title="点击回到顶部">回到顶部</a></li>
</ul>
<div style="display: none;"></div>
</body>
</html>