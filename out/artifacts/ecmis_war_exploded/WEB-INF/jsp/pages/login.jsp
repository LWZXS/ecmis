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
        var flug = '超高压输电公司';
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
    <script type="text/javascript">
        var baseJS = "http://10.121.181.132:80/isc_sso";
    </script>
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
    <title>超高压输电公司</title>
</head>
<body onload="javascript:clearCookies();">
<div class="login_box">
    <div class="logo">
        <div class="logo-filed-text">
            V2.0.5.01
        </div>
        <div class="logo-filed-login-page-title">
            超高压输电公司
        </div>
    </div>
    <div class="center_box">
        <div class="inputbox">
            <div class="cardlogin">
                <a href="javascript:void(0);" onclick="jumpToPKI()">证书登录</a>&nbsp;&nbsp;&nbsp;
                <span id="showhide">
	            		<a href="javascript:void(0);" onclick="jumpToPhone()">手机登录</a>&nbsp;&nbsp;&nbsp;
	            	</span>
            </div>
            <form id="fm1"
                  action="<%=request.getContextPath() %>/statics/pages/login?service=http%3A%2F%2F10.121.180.109%2Fweb%2FinitLogin.ac%3BJSESSIONIDMINI%3Dj2RDY0KTJXp0nPkL62vNrRYlqM3h10vFFQ24LGvnFmJLbBFF13MS%211531774829&amp;domainAuthSupport=true"
                  method="post">
                <input type="hidden" id="checkRepRandomNum" name="checkRepRandomNum" value="8052722240862323"/>
                <input id="authModeSerial" name="authModeSerial" value="basic:isc" type="hidden"/>
                <!-- <li class="userfield" style="margin-top:65px;">
                    <input id="department"  type="hidden"  />
                    <img src="images/51_16.png" style="margin-left:5px;border:0px;vertical-align:middle;"/>
                        <input id="username" name="username" class="login_input1" tabindex="1" style="vertical-align:middle;width:170px;font-size:13px;" oninput="changeUserName(this.value);" accesskey="n" type="text" value="" maxlength="100" autocomplete="false"/>
                </li> -->
                <li class="userfield" style="margin-top:65px;">
                    <input id="department" type="hidden"/>
                    <img src="<%=request.getContextPath() %>/statics/pages/images/51_16.png" style="margin-left:5px;border:0px;vertical-align:middle;"/>


                    <input id="username0" name="username0" class="login_input1" tabindex="1"
                           style="vertical-align:middle;width:170px;font-size:13px;"
                           oninput="changeUserName(this.value);" accesskey="n" type="text" value="" maxlength="100"
                           autocomplete="false"/>
                    <input type="hidden" id="username" name="username" value=""/>

                </li>
                <!-- <li class="passwordfield">
                    <img src="images/54_21.png" style="margin-left:5px;border:0px;vertical-align:middle;"/>

                    <input id="cipher" name="cipher" class="login_input1" tabindex="2" onkeydown="javascript:butOnClick();" style="vertical-align:middle;width:168px;font-size:13px;" accesskey="p" type="password" value="" maxlength="60" autocomplete="false"/>
                </li> -->
                <li class="passwordfield">
                    <img src="<%=request.getContextPath() %>/statics/pages/images/54_21.png" style="margin-left:5px;border:0px;vertical-align:middle;"/>

                    <input id="cipher0" name="cipher0" class="login_input1" tabindex="2"
                           onkeydown="javascript:butOnClick();"
                           style="vertical-align:middle;width:168px;font-size:13px;" accesskey="p" type="password"
                           value="" maxlength="60" autocomplete="false"/>
                    <input type="hidden" id="cipher" name="cipher" value=""/>
                </li>
                <li class="login">
                    <input style="background:url(<%=request.getContextPath() %>/statics/pages/images/6_24.png);width:199px;height:29px;"
                           type="button"
                           id="submi"
                           name="Submit"
                           value=""
                           onclick="doSubmit();"/>

                </li>
                <li style="margin-top:5px;" id="nameMsg">
                </li>

                <input type="hidden" name="lt" value="LT-584158-TwkRmkOROYStVASi6M9TNDHahOuGQ2"/>
                <input type="hidden" name="execution" value="e2s1"/>
                <input type="hidden" name="_eventId" value="submit"/>
            </form>

            <div class="cardlogin1">
                <a href="javascript:void(0);" onclick="resetPassWord()">找回密码</a>&nbsp;&nbsp;&nbsp;
                <!--自助注册功能暂不上线-->
                <!--<a href="javascript:;" id="userReg">自助注册</a>&nbsp;&nbsp;&nbsp;-->
                <a>自助注册</a>&nbsp;&nbsp;&nbsp;
            </div>
            <input type="hidden" id="portalUri" name="portalUri" value="http://10.121.181.235:80/isc-portal/"/>
        </div>
    </div>

</div>
<div class="login_info">
    <hr class="hr_class"/>
    Copyright&copy;2017 中国南方电网公司版权所有
</div>


<!--用户自助注册-->
<div id="pw_options" class="easyui-window" title="自助注册"
     data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,resizable:false,inline:true"
     style="width: 800px; height: 700px; padding: 10px;display: none;">
    <div class="w_box_1_c_u">
        <table class="tdl" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr align="left">
                <td width="120" align="right">
                    <label>提示：</label>
                </td>
                <td><font color="#a52a2a">*</font>为必填项(密码为8~20个字符，必须包含英文字符大小写、数字、特殊符号)！</td>
            </tr>
            <tr align="left">
                <td width="120" align="right">
                    <label><font color="#a52a2a">*</font>所属单位：</label>
                </td>
                <td align="left">
                    <input style="width:304px; height: 20px;" type="text" id="institute"/>
                </td>
            </tr>
            <tr align="left">
                <td width="120" align="right">
                    <label><font color="#a52a2a">*</font>用户姓名：</label>
                </td>
                <td align="left">
                    <input width="50%" style="width:300px; height: 20px;" type="text" id="customername"/>
                </td>
            </tr>
            <tr align="left">
                <td width="120" align="right">
                    <label><font color="#a52a2a">*</font>身份证号：</label>
                </td>

                <td align="left">
                    <input style="width:300px; height: 20px;" type="text" id="idCard"/>
                </td>

            </tr>
            <tr align="left">
                <td width="120" align="right">
                    <label><font color="#a52a2a">*</font>用户账号：</label>
                </td>
                <td align="left">
                    <input id="account" style="width:300px; height: 20px;" type="text"
                           onmouseover="destoryToolTip(this)"/>&nbsp;&nbsp;&nbsp;
                    <input type="button" id="validAccount"
                           style="width: 110px;height:30px;line-height: 30px;vertical-align: middle;
                                   background-image: url(<%=request.getContextPath() %>/statics/pages/images/button_ground.png);"
                           value="点击生成账号"/>
                </td>
            </tr>

            <tr align="left">
                <td width="120" align="right">
                    <label><font color="#a52a2a">*</font>用户密码：</label>
                </td>
                <td align="left">
                    <input style="width:300px; height: 20px;" type="password" id="pwd"/>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr align="left">
                <td width="120" align="right"><label><font color="#a52a2a">*</font>确认密码：</label></td>
                <td align="left">
                    <input style="width:300px; height: 20px;" type="password" id="repeatPwd"/>&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr align="left">
                <td width="120" align="right">
                    <label><font color="#a52a2a">*</font>手机号码：</label>
                </td>
                <td align="left">
                    <input id="telphone" style="width:300px; height: 20px;" type="text"
                           onmouseover="destoryToolTip(this)"/>&nbsp;&nbsp;&nbsp;
                    <input type="button" id="validPhone"
                           style="width: 110px;height:30px;vertical-align:middle;line-height: 30px;
                                   background-image: url(<%=request.getContextPath() %>/statics/pages/images/button_ground.png);"
                           value="点击获取验证码"/>
                </td>
            </tr>
            <tr align="left">
                <td width="120" align="right"><label><font color="#a52a2a">*</font>验证码：</label></td>

                <td align="left">
                    <input id="phoneCode" style="width:300px; height: 20px;" type="text" onkeydown="validNum(this)"
                           onmouseover="destoryToolTip(this)"/>
                </td>
            </tr>


            <tr align="left">
                <td width="120" align="right"><label>电子邮箱：</label></td>

                <td align="left"><input style="width:300px; height: 20px;" type="text" id="email"/></td>

            </tr>

            <tr align="left">
                <td width="120" align="right"><label>备注信息：</label></td>

                <td align="left">
                    <textarea style="width: 500px;height: 120px;" id="attention">用户在[自助注册]界面新建了一个姓名为[xxx]账号为[xxx]的用户,其所属单位名称为[xxx],请及时处理!</textarea>
                </td>

            </tr>

            <tr align="left">
                <td width="120" align="right"></td>
                <td align="left" style="width: 350px;"><input type="checkbox" id="condition"/>&nbsp;&nbsp;&nbsp;同意 <a
                        style="color: #00bbee">"中国南方电网有限责任公司4A平台指导意见"</a>和 <a style="color: #00bbee">"用户需知"</a></td>
            </tr>
        </table>
        <div>
            <input type="button" id="registerSubmit"
                   value="注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册"
                   style="width: 120px; height: 30px;margin-left: 100px;background-image: url(<%=request.getContextPath() %>/statics/pages/images/button_ground.png);color: #EFF5FF"/>
            <input type="button" id="cancel" value="取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消"
                   style="width: 120px; height: 30px;margin-left: 250px;color: #EFF5FF;background-image: url(<%=request.getContextPath() %>/statics/pages/images/button_ground.png);"/>
        </div>
    </div>
</div>

<input id="pubmod" type="hidden"
       value="00a767ca54db607dc96e5d69c60bf16f3878139ae4ecb4101912da759eaa6ee963aee8efc78a22fe413674480e1dc2168ab36f0153ac8b575e44b3f8fc0621958717ba1aef7a0b977f46a54044e71add31cb5e5534996de016c9a3600de424f6dbd6d0b9d335c26ca3083c53f21f37903cf576ca7fd1ea82f37fe0f1f4c884b3bb"/>
<input id="pubexp" type="hidden" value="010001"/>

</body>
</html>
