<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="common/header.jsp"></c:import>

<div data-options="region:'center',title:''" style="padding:0px 5px 5px;background:#e0ecff;">
    <div id="file-tabs" class="easyui-tabs" data-options="fit:true,plain:true" style="border:none;">
        <div style="padding:10px 60px 20px 60px" title="详细信息" align="center">
            <form id="ff" method="post">
                <table cellpadding="10" >
                    <tr>
                        <td>文件名称:</td>
                        <td><input class="easyui-textbox" type="text" name="documentName" data-options="required:true,missingMessage:'文件名称不能为空'"/></td>
                    </tr>
                    <tr>
                        <td>所属项目:</td>
                        <td><input class="easyui-textbox" type="text" name="projectId" data-options="required:true"/></td>
                    </tr>
                    <tr>
                        <td>文件类型:</td>
                        <td>
                            <input class="easyui-textbox" type="text" readonly name="docTypeId" data-options="required:true"/>
                            <a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" id="selectDocType">选择</a>
                        </td>
                    </tr>
                    <tr>
                        <td>附件:</td>
                        <td>
                            <input class="easyui-filebox" name="file" data-options="prompt:'请选择附件...'" style="width:212px">
                        </td>
                    </tr>
                    <%--<tr>
                        <td>Language:</td>
                        <td>
                            <select class="easyui-combobox" name="language">

                            </select>
                        </td>
                    </tr>--%>
                    <tr align="center">
                        <td colspan="2">
                            <a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" onclick="submitForm()">提交</a>
                            <a href="javascript:void(0)" style="width: 80px;" class="easyui-linkbutton" onclick="clearForm()">清空</a>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {


    })

    function submitForm(){
        //$('#ff').form('submit');
    }
    function clearForm(){
        $('#ff').form('clear');
    }
</script>
</body>
</html>
