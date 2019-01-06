<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--左   西--%>
<div data-options="region:'west',title:'所属对象',split:true" style="width:260px;">
    <p style="padding:5px;margin:0;">请为角色或用户授权:</p>
    <ul class="roles" id="roles" data-options="method:'get',animate:true,lines:true">
        <%--角色--%>

    </ul>
    <ul class="users" id="users" data-options="method:'get',animate:true,lines:true">
        <%--用户--%>
    </ul>
</div>
<%--右 东--%>
<div data-options="region:'east',title:'操作',split:true" style="width:260px;">
    <a id="save" href="javascript:void(0);" style="width: 100px; margin: 10px;" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
    <a id="reset" href="javascript:void(0);" style="width: 100px; margin: 10px;" class="easyui-linkbutton" data-options="iconCls:'icon-reset'">重置</a>
    <h5 style="margin: 10px;">授权说明:</h5>
    <p style="text-indent: 2em;margin: 10px;">
        可以为一个角色授权多个可访问的资源,如果某个用户拥有该角色,则可以访问资源.<br/>
        也可以为一个用户授权多个可访问的资源,该资源只属特点的用户,与角色无关.<br/>
    </p>
</div>
<%--中 center--%>
<div data-options="region:'center',title:'选择可用的资源'" style="padding:5px;background:#eee;">
    <ul id="menuTree" class="easyui-tree" data-options="method:'get',animate:true,lines:true,checkbox:true"></ul>
</div>
<script type="text/javascript">

    //主人编号
    var masterId;
    //主人类型
    var masterType;
    $(function () {
        //保存
        $("#save").click(function () {
            if (masterId){
                var resources= $("#menuTree").tree('getChecked', ['checked','indeterminate']);
                var resourceIds=new Array();
                $.each(resources,function (index,resource) {
                    //var user=$("#users").tree("getSelected")
                    resourceIds.push(resource.id)
                })
                //console.debug("gumy:","user.id:"+user.id);
                //console.debug("gumy","masterId:"+masterId+"-masterType:"+masterType+"---"+resourceIds);
           
                $.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath}/privilege/update.json",
                    data:{"masterId":masterId,"masterType":masterType,"resourceIds":resourceIds.toString(),"resourceType":"menu"},
                    dataType:"json",
                    success:function (data) {
                        alert(data.message);
                        //console.debug("gumy",data)
                    }
                })
            }


        });

        //重置

        //加载角色tree
        $("#roles").tree({
            url:'${pageContext.request.contextPath}/role/easyUiTreeAsPrivilege.json',
            onClick:function(role){
                if (role){
                    if(role.attributes!=null && role.attributes.isParent==true){
                        //toggle
                        $("#roles").tree('toggle', role.target);
                        return;
                    }
                    //主人编号
                    masterId=role.id;
                    //主人类型
                    masterType="role";
                    //取消选择
                    $('#users').find('.tree-node-selected').removeClass('tree-node-selected');
                    //加载资源
                    loadPrivileges(role.id,"role");
                }
            }
        });
        //加载用户tree
        $("#users").tree({
            url:'${pageContext.request.contextPath}/user/easyUiTreeAsPrivilege.json',
            onClick:function(user){
                if (user){
                    if(user.attributes!=null && user.attributes.isParent==true){
                        //toggle
                        $("#users").tree('toggle', user.target);
                        return;
                    }
                    //主人编号
                    masterId=user.id;
                    //主人类型
                    masterType="user";
                    //取消选择
                    $('#roles').find('.tree-node-selected').removeClass('tree-node-selected');
                    //加载资源
                    loadPrivileges(user.id,"user");
                }
            }
        });


    })
    function loadPrivileges(masterId,masterType) {
        //加载左侧tree
        $("#menuTree").tree({
            url:'${pageContext.request.contextPath}/privilege/list.json?masterId='+masterId+'&masterType='+masterType,
            onClick:function(menu){
                //如果选中则不选中,反之选中
                if (menu.checked){
                    $("#menuTree").tree('uncheck',menu.target);
                }else {
                    $("#menuTree").tree('check',menu.target);
                }
            }
        });
    }
</script>
</body>
</html>
