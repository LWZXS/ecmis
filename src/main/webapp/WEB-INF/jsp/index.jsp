<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>天安监理</title>
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/statics/css/images/logo32px.png">
    <link rel="apple-touch-icon" href="<%=request.getContextPath() %>/statics/css/images/images/logo57px.png">
    <link rel="apple-touch-icon" sizes="72x72"
          href="<%=request.getContextPath() %>/statics/css/images/images/logo72px.png">
    <link rel="apple-touch-icon" sizes="114x114"
          href="<%=request.getContextPath() %>/statics/css/images/images/logo114px.png">

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"/>
    <style type="text/css">
        .userInfo{
            width: 500px;
            position: absolute;
            bottom: 10px;
            left: 30%;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        var winHeight;
        var winWidth;
        $(function () {
            if (window.innerHeight) {
                winHeight = window.innerHeight;
                winWidth = window.innerWidth;
            } else if ((document.body) && (document.body.clientHeight)) {
                winHeight = document.body.clientHeight;
                winWidth = document.body.clientWidth;
            }
            //alert("winWidth:"+winWidth+"---winHeight:"+winHeight);
            $('#projects').combobox({
                onSelect: function(project){
                    //console.debug("gumy",project.id)
                    $.ajax({
                        url:"<%=request.getContextPath()%>/user/setCurrentProject.json",
                        data:{projectId:project.id},
                        dataType:"json",
                        success:function (data) {
                            if (data.result==false){
                                alert(data.message);
                            }
                        }
                    })
                }
            });

           /* $('#tt').tree({
                url:'/menu/findMenus.json'
            });*/
            $("#modifyPwd").click(function () {

                $("#modifyPwdFrm").form("clear");
                $("#modify-password-dlg").dialog("open");


            });

            //加载左侧tree
            $("#menuTree").tree({
                url:'${pageContext.request.contextPath}/menu/findMenus.json',
                onClick:function(node){
                    if (node){
                        if($('#tt').tabs('exists',node.text)){
                            $('#tt').tabs('select',node.text);
                        }else{
                            /* var text = node.text;
                            var id = node.id;
                            alert(node.attributes.url); */
                            //如果是一级菜单，且url为null，toggle操作
                            if(node.attributes.type=='parent' && node.attributes.url==null){
                                //toggle
                                $(this).tree('toggle', node.target);
                                return;
                            }
                            //增加tab
                            $('#tt').tabs('add',{
                                title: node.text,
                                content: '<div style="padding:5px;width:'+(winWidth-165)+'px; height:'+(winHeight-180)+'px; overflow: auto;">'
                                +'<iframe id="'+node.attributes.type+'Iframe" name="'+node.attributes.type+'Iframe" scrolling="no" frameborder="0"  src="'+node.attributes.url+'" style="width:100%;height:100%;"></iframe>'
                                +'</div>',
                                closable: true,
                                iconCls:'icon-'+node.attributes.icon
                            });

                        }
                    }
                }
            });

            $("#old_password").textbox({
               onChange:function (newValue,oldValue) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/checkPassword.json",
                        type:"get",
                        data:{password:newValue},
                        dataType:"json",
                        success:function (data) {
                            if (data.result){
                                $("#oldPasswordMsg").html("  密码正确!").css("color","green");
                                $('#modifyBtn').linkbutton('enable')
                                oldFlag=true;
                            }else {
                                $("#oldPasswordMsg").html("  旧密码不正确!").css("color","red");
                                $('#modifyBtn').linkbutton('disable')
                            }
                        }
                    });
                }
            })

            $("#password").textbox({
                onChange:function (newValue,oldValue) {
                    if (checkPasswordReg.test(newValue)){
                        $("#newPasswordMsg").html("  密码可用!").css("color","green");
                        $('#modifyBtn').linkbutton('disable')
                        newFlag=true;
                        if ($("#rePassword").val()!=""){
                            if ( newValue==$("#rePassword").val()){
                                $("#rePasswordMsg").html("  两次密码输入正确!").css("color","green");
                                $('#modifyBtn').linkbutton('enable');
                                reFlag=true;
                            }else{
                                $("#rePasswordMsg").html("  两次密码输入不一致!").css("color","red");
                                $('#modifyBtn').linkbutton('disable')
                                reFlag=true;
                            }
                        }

                    }else {
                        $("#newPasswordMsg").html("  请输入4-16位的密码!").css("color","red");
                        $('#modifyBtn').linkbutton('disable');
                        newFlag=false;
                    }
                }
            })
            $("#rePassword").textbox({
                onChange:function (newValue,oldValue) {
                    var password = $("#password").val();
                    if (password==newValue){
                        $("#rePasswordMsg").html("  两次密码输入正确!").css("color","green");
                        $('#modifyBtn').linkbutton('enable')
                        reFlag=true;
                    }else {
                        $("#rePasswordMsg").html("  两次密码输入不一致!").css("color","red");
                        $('#modifyBtn').linkbutton('disable')
                        reFlag=false;
                    }
                }
            })

            $("#modifyBtn").click(function(){
                //$.messager.progress();	// display the progress bar
                if (newFlag && oldFlag && reFlag){
                    $('#modifyPwdFrm').submit();
                }
            });
            $('#modifyPwdFrm').form({
                url:'${pageContext.request.contextPath}/user/updatePassword.json',
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
                        $('#modify-password-dlg').dialog("close");
                        //alert(data.message);
                    }else{
                        alert(data.message);
                    }
                    //$.messager.progress('close');
                }
            });
        });
        var checkPasswordReg=/^\w{4,16}$/;
        var oldFlag=false;
        var newFlag=false;
        var reFlag=false;
    </script>
</head>
<body>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
    <%--北--%>
    <div data-options="region:'north',title:'',split:true" style="height:100px;background-position:center; background-color: #B3D8FE;position: relative; background-image: url('<%= request.getContextPath()%>/statics/css/images/webwxgetmsgimg.jpg');overflow: hidden;">
        <!-- Top -->
        <span class="topbtns" style="float: right; padding: 5px; padding-right: 30px;">
				<a href="javascript:location.reload()" class="easyui-linkbutton"
                   data-options="plain:true,iconCls:'icon-reload-black'">刷新</a>
                <!-- <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-opinion-black'">意见反馈</a> -->
                <!-- <a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-key'">密码</a> -->
				<a href="javascript:void(0);" id="modifyPwd" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-password'">密码</a>
				<a href="user/logout.do" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-logout14'">注销</a>
			</span>
        <div class="userInfo">
				<span>
					<strong>当前用户:${sessionScope.loginUser.userName }</strong>
				</span>
            <span>
					<strong>角色:
						<c:forEach items="${sessionScope.loginUserRoles }" var="role">
                            ${role.roleName }&nbsp;
                        </c:forEach>
					</strong>
				</span>
            <span>
					<strong>当前项目:
						    <input id="projects" class="easyui-combobox" name="projectId"
                                   data-options="valueField:'id',textField:'text',url:'<%=request.getContextPath()%>/project/easyUiTree.json'">
					</strong>
				</span>
        </div>
    </div>
    <%--南--%>
    <div data-options="region:'south',title:'',split:false" style="height:36px;background-color: #E1E7F1;">
        <div align="center" style="line-height: 34px;">版权所有:广东天安工程监理有限公司</div>
    </div>
    <%--<div data-options="region:'east',title:'East',split:true" style="width:100px;"></div>--%>
    <%--西--%>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:150px;background-color: #E1E7F1;">
        <ul id="menuTree" class="easyui-tree" data-options="method:'get',animate:true,lines:true"></ul>
    </div>
    <%--中--%>
    <div data-options="region:'center',title:''">
        <div id="tt" class="easyui-tabs main_body" style="width:100%;height:100%;">
            <div id="home" title="我的首页" data-options="iconCls:'icon-home'" style="overflow: hidden;width:100%;height:100%;">
                <div>
                    <!-- <table class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
                        data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
                        <thead>
                            <tr>
                                <th data-options="field:'itemid',width:80">Item ID</th>
                                <th data-options="field:'productid',width:100">Product</th>
                                <th data-options="field:'listprice',width:80,align:'right'">List Price</th>
                                <th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
                                <th data-options="field:'attr1',width:250">Attribute</th>
                                <th data-options="field:'status',width:60,align:'center'">Status</th>
                            </tr>
                        </thead>
                    </table>
                    <br />
                    <table class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
                            data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
                        <thead>
                            <tr>
                                <th data-options="field:'itemid',width:80">Item ID</th>
                                <th data-options="field:'productid',width:100">Product</th>
                                <th data-options="field:'listprice',width:80,align:'right'">List Price</th>
                                <th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
                                <th data-options="field:'attr1',width:250">Attribute</th>
                                <th data-options="field:'status',width:60,align:'center'">Status</th>
                            </tr>
                        </thead>
                    </table> -->
                </div>
            </div>
        </div>
    </div>
        <!-- 增加部门Dialog start-->
        <div id="modify-password-dlg" class="easyui-dialog" closed="true" title="修改密码"
             style="width:480px;height:280px;padding:10px;"
             data-options="buttons:'#modify-password-buttons'">
            <div style="margin:20px 0;"></div>
            <div title="" style="width:440px;">
                <div style="padding:10px 20px 20px 60px">
                    <form id="modifyPwdFrm" method="post">
                        <input name="deptId" value="" type="hidden" id="deptId"/>
                        <table cellpadding="5">
                            <tr>
                                <td> 旧密码:</td>
                                <td><input class="easyui-textbox" type="password" id="old_password" name="oldPassword"
                                           data-options="required:true,missingMessage:'旧密码不能为空',invalidMessage:'输入格式不正确'"/>
                                    <span id="oldPasswordMsg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td> 新密码:</td>
                                <td><input class="easyui-textbox" type="password" id="password" name="newPassword"
                                           data-options="required:true,missingMessage:'新密码不能为空',invalidMessage:'输入格式不正确'"/>
                                    <span id="newPasswordMsg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td> 确认密码:</td>
                                <td><input class="easyui-textbox" type="password" id="rePassword" name="rePassword"
                                           data-options="required:true,missingMessage:'确认密码不能为空',invalidMessage:'输入格式不正确'"/>
                                    <span id="rePasswordMsg"></span>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <div style="text-align:center;padding:5px">
                        <a href="javascript:void(0)" style="width: 50px;" class="easyui-linkbutton" id="modifyBtn">提交</a>
                        <a href="javascript:void(0)" style="width: 50px;" class="easyui-linkbutton" onclick="clearForm();">清除</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="modify-password-buttons">
            <a href="javascript:void(0)" class="easyui-linkbutton"
               onclick="javascript:$('#modify-password-dlg').dialog('close')">关闭</a>
        </div>
        <!-- 增加部门Dialog end-->
</div>
</body>
</html>
