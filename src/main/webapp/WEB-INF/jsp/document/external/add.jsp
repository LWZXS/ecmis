<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="common/header.jsp"></c:import>

<div data-options="region:'center',title:''" style="padding:0px 5px 5px;background:#e0ecff;">
    <div id="file-tabs" class="easyui-tabs" data-options="fit:true,plain:true" style="border:none;">
        <div style="padding:10px 60px 20px 60px" title="详细信息" align="center">
            <form id="ff" method="post" enctype="multipart/form-data">
                <table cellpadding="10" >
                    <tr>
                        <td>文件名称:</td>
                        <td><input class="easyui-textbox" type="text" style="width: 200px;" name="documentName" data-options="required:true,missingMessage:'请输入文件名称'"/></td>
                    </tr>
                    <tr>
                        <td>流程类型:</td>
                        <td>
                            <input id="flowTypeId" name="flowTypeId" style="width: 200px;" data-options="required:true,missingMessage:'请选择流程类型'"/>
                        </td>
                    </tr>
                    <tr>
                        <td>所属项目:</td>
                        <td>
                            <input id="projectId" name="projectId" style="width: 200px;" data-options="required:true,missingMessage:'请选择项目'"/>
                        </td>
                    </tr>
                    <tr>
                        <td>正文类型:</td>
                        <td>
                            <input name="docTypeId" id="docTypeId" type="hidden">
                            <input class="easyui-textbox" type="text" style="width: 200px;" id="a_docTypeId" readonly name="a_docTypeId" data-options="required:true,missingMessage:'请选择文档类型'"/>
                            <a href="javascript:void(0)" style="width: 80px; height: 22px;" class="easyui-linkbutton" id="selectDocType">选择</a>
                        </td>
                    </tr>

                    <tr>
                        <td>附件:</td>
                        <td>
                            <input class="easyui-filebox" style="width: 200px;" name="file" data-options="prompt:'请选择附件...'" style="width:212px">
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <a href="javascript:void(0)" id="addBtn" style="width: 80px;" class="easyui-linkbutton">提交</a>
                            <a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" onclick="clearForm()">清空</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <!-- 选择文件类型dialog start-->
    <div id="file-type-dlg" class="easyui-dialog" closed="true" title="文件类型选择" style="width:360px;height:400px;padding:10px;"
         data-options="iconCls:'icon-file',toolbar:'#file-type-toolbar',buttons:'#file-type-buttons'">
        <div class="easyui-panel" style="padding:5px">
            <ul class="easyui-tree" data-options="method:'get',animate:true,lines:true" id="typeTree"></ul>
        </div>
    </div>
    <div id="file-type-toolbar" style="padding:2px 0;">
        <table cellpadding="0" cellspacing="0" style="width:100%">
            <tr>
                <td style="text-align:left;padding-left:5px">
                    <input class="easyui-textbox" id="searchType" data-options="prompt:'请输入文件名文件、编码查询'" style="width:280px"/>
                </td>
                <td style="padding-left:2px">
                    <a href="javascript:void(0)" id="search-filetype" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="file-type-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:getSelectedType($('#typeTree'),$('#docTypeId'),$('#a_docTypeId'),$('#file-type-dlg'));">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#file-type-dlg').dialog('close')">关闭</a>
    </div>
    <!-- 选择文件类型dialog end-->

</div>
<script type="text/javascript">
    $(function () {
        //getProjectByCurrentUserCompany
        /*加载项目--jeasyui*/
        $('#projectId').combobox({
            url: '${pageContext.request.contextPath}/project/getProjectByCurrentUserCompany.json',
            valueField: 'projectId',
            textField: 'projectName'
        });
        $('#flowTypeId').combobox({
            url: '${pageContext.request.contextPath}/flowType/getAllFlowType.json',
            valueField: 'flowTypeId',
            textField: 'flowTypeName',
            onSelect:function (flowType) {
                //alert(flowType.flowTypeId);
                //加载可选择项目
                $('#projectId').combobox('clear');
                $('#projectId').combobox({
                    url: '${pageContext.request.contextPath}/project/getProjectByFlowType.json?flowTypeId='+flowType.flowTypeId,
                    valueField: 'projectId',
                    textField: 'projectName'
                });
            }
        });

        $("#search-filetype").click(function(){
            loadTree($("#typeTree"),"documentType/findAll?param="+$.trim($("#searchType").val()));
        });

        //文档类型
        $("#selectDocType").click(function(){
            $("#file-type-dlg").dialog("open");
            loadTree($("#typeTree"),"${pageContext.request.contextPath}/documentType/findAll?param="+$.trim($("#searchType").val()));
        });

        //提交表单
        $("#addBtn").click(function () {
            //$.messager.progress();	// display the progress bar
            $('#ff').submit();
        });
        //提交表单
        $('#ff').form({
            url: '${pageContext.request.contextPath}/document/external/add.json',
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
                    //$("#adddept-dlg").dialog("close");
                    //$('#dg').datagrid('reload');
                    //alert(data.message);
                    location.href="${pageContext.request.contextPath}/document/external/index.html";
                } else {
                    alert(data.message);
                }
                //$.messager.progress('close');
            }
        });

    })

    function submitForm(){
        //$('#ff').form('submit');
    }
    function clearForm(){
        $('#ff').form('clear');
    }

    //选择文档类型
    function getSelectedType(source,targetId,targetText,dialogObj){
        var node = source.tree('getSelected');
        if(node.attributes.isParent){
            alert("请选择子项！");
            return;
        }
        if (node){
            var text = node.text;
            var id = node.id;
            //赋值
            targetId.val(id);
            //targetText.removeAttr("readonly")
            targetText.textbox("setValue", node.text);
            //关闭dialog
            dialogObj.dialog('close');
            //向服务器发送一个请求
            $.ajax({
                url:'${pageContext.request.contextPath}/documentType/putWordPath',
                type:'get',
                data:'docName='+node.attributes.docName,
                dataType:'json',
                success:function(data){
                    if(data.result=='success'){
                        //增加一个tabs,用于显示正文
                        if($('#file-tabs').tabs('exists','正文')){
                            $('#file-tabs').tabs('select','正文');
                        }else{
                            //设置mainBody
                            /*var docName=node.attributes.docName;
                            var suffix=docName.subStr(docName.lastIndexOf("."));*/
                            /*var mainBody="";
                            if($("#mainBody").val()==""){
                                var rand=Math.floor(Math.random()*10000);
                                var today=new Date();
                                var todayStr=today.getFullYear()+""+(today.getMonth()+1)+""+today.getHours()+""+today.getMinutes()+""+today.getSeconds()+""+today.getMilliseconds();
                                mainBody=todayStr+rand;
                                $("#mainBody").val(mainBody+".doc");
                                $("#mainBodyNum").val(mainBody);
                            }else{
                                mainBody=$("#mainBodyNum").val();
                            }*/
                            $('#file-tabs').tabs('add',{
                                title: '正文',
                                content: '<iframe src="${pageContext.request.contextPath}/document/external/selectWord?docName='+node.attributes.docName+'" style="width:100%; height:900px"></iframe>',
                                closable: true,
                                iconCls:'icon-main-body'
                            });
                        }
                    }else if(data.result=='notLogin'){
                        alert("请先登录！");
                        top.location.href='user/login.html';
                    }
                }
            });
        }
    }

    //公共的方法
    function loadTree(treeUl,url,isLoad){
        if(!isLoad){
            treeUl.tree({
                url : url,//请求路径，id为根节点的id
                onLoadSuccess : function(node, data) {
                    var tree = $(this);
                    if (data) {
                        $(data).each(function(index, d) {
                            if (this.state == "closed") {
                                tree.tree("expandAll");
                            }
                        });
                    }
                }
            });
            return true;
        }
    }
</script>
</body>
</html>
