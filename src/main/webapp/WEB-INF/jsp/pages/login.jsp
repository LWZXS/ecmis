<%--
  Created by IntelliJ IDEA.
  User: gumuyun
  Date: 2018/11/29
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>

    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/wangsheng.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/base64.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/statics/pages/css/login.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/statics/pages/css/password3.css" charset="utf-8">
    <link href="<%=request.getContextPath() %>/statics/pages/css/wrap.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath() %>/statics/pages/css/content.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath() %>/statics/pages/css/icon.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath() %>/statics/pages/css/easyui.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath() %>/statics/pages/css/zTreeStyle.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/statics/pages/css/password3.css" charset="utf-8"/>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/statics/pages/js/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/statics/pages/js/jquery.cryption.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/statics/pages/js/control2.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/statics/pages/js/seBase64Login.js"></script>


    <script type="text/javascript">
        var flug = '项目管理系统';
        var phoneSwitchCheck = "false";
    </script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/statics/pages/js/jquery.mailAutoComplete-3.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/jquery.ztree.all-3.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/pages/js/easyloader.js"></script>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="edge">
    <script type="text/javascript">
        var mykey = null;
        $(function () {
            mykey = $.rsa.getKeyPair($("#pubexp").val(), "", $("#pubmod").val())
            $("#username0").mailAutoComplete();
            function immediately() {
                var element = document.getElementById("mytext");
                if ("\v" == "v") {//判断IE
                    element.onpropertychange = webChange;
                } else {//非IE
                    element.addEventListener("input", webChange, false);
                }
                function webChange() {
                    if (element.value) {
                        document.getElementById("test").innerHTML = element.value
                    }
                    ;
                }
            }
        });

        function changeUserName(val) {
            if (val.indexOf("@", 0) != -1) {
                $("#username0").mailAutoComplete('display', true);
            } else {
                $("#username0").mailAutoComplete('display', false);
            }
        }
    </script>
    <title>项目管理系统</title>
</head>
<body onload="javascript:clearCookies();">
<div class="login_box">
    <div class="logo">
        <div class="logo-filed-login-page-title">
            项目管理系统
        </div>
    </div>
    <div class="center_box">
        <div class="inputbox">
            <div class="cardlogin">

            </div>
            <form id="fm1"
                  action="${pageContext.request.contextPath}/user/dologin.html"
                  method="post">
                <li class="userfield" style="margin-top:65px;">
                    &nbsp;&nbsp;用户名:&nbsp;&nbsp;<input id="loginName" type="text" pattern="[0-9a-zA-Z]{4,16}" required placeholder="请输入4-16位英文和数字" name="loginName" style="width: 138px;"/>
                </li>
                <li class="passwordfield">
                    &nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input id="password" type="password" pattern="[0-9a-zA-Z]{4,16}" required placeholder="请输入4-16位英文和数字" name="password" style="width: 138px;"/>
                </li>
                <li class="login">
                    <input style="background:url(<%=request.getContextPath() %>/statics/pages/images/6_24.png);width:199px;height:29px;"
                           type="submit"
                           value=""/>
                </li>
                <li style="margin-top:5px;" id="nameMsg">
                    ${msg }
                </li>
            </form>
        </div>
    </div>

</div>
<div class="login_info">
    <hr class="hr_class"/>
    Copyright&copy;2017 天安监理公司版权所有
</div>
</body>
</html>
