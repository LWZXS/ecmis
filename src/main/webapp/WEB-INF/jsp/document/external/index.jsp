<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="common/header.jsp"></c:import>
<%--外部文档--%>
    <div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
        <table id="dg" title="文档列表" style="width:100%;height:100%;"
               data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',singleSelect:true,fitColumns:true,pagination:true,striped:true,showFooter:true,fit:true,toolbar:'#tb',method:'get'">
            <thead>

            </thead>
        </table>
        <div id="tb" style="padding:2px 5px;">
            <form action="" id="searchFrm">
                开始时间: <input class="easyui-datebox" style="width:110px" name="startDate">
                结束时间: <input class="easyui-datebox" style="width:110px" name="endDate">
                文档名称: <input style="height: 22px;" class="easyui-textbox" id="documentName" name="documentName" type="search"
                       placeholder="文档名称...">
                状态:
                <select class="easyui-combobox" panelHeight="auto" style="width:100px" name="docStatusId" id="docStatusId">
                    <option value="">请选择</option>
                    <option value="2">审核</option>
                    <option value="5">归档</option>
                </select>
                <a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search">查询</a>
                <span id='test'></span>
            </form>
        </div>
        <script type="text/javascript">
            $(function(){
                $('#dg').datagrid({
                    url:'${pageContext.request.contextPath}/document/external/list.json',
                    queryParams: {
                        rows:10,
                        page:1,
                        docStatusId:-1
                    },
                    onLoadSuccess:function(data){

                        /* if(data.result){
                            alert("请登录！");
                        } */
                    },
                    onDblClickRow:function(rowIndex,rowData){
                        window.location.href='${pageContext.request.contextPath}/document/view/'+rowData.documentId+'/list';
                    },
                    columns:[[
                        {field:'documentName',title:'文档名称', width:120,align:'left',resizable:true},
                        {field:'company',title:'施工方公司', width:120,align:'left',resizable:true
                          /*  ,
                            formatter: function(value,row,index){
                                if (row.company){
                                    return row.company.companyName;
                                } else {
                                    return value;
                                }
                            }*/
                        },
                        {field:'creationUser',title:'创建人', width:60,align:'center',resizable:true},
                        {field:'creationDate',title:'创建日期', width:80,align:'center',resizable:true},
                        {field:'attachment',title:'附件', width:220,align:'left',resizable:true},
                        {field:'status',title:'状态', width:50,align:'center'}
                    ]]
                });

                $("#searchBtn").click(function(){
                    var params=$('#searchFrm').serializeArray();
                    var s="";
                    for(var i in params){
                        s+=params[i].name+"=";
                        s+=(params[i].value==""?"":params[i].value)+"&";
                    }
                    s=s.substring(0, s.length-1);

                    $('#dg').datagrid({
                        url:'${pageContext.request.contextPath}/document/external/list.json?'+s,
                        queryParams: s
                    });
                });
            });
        </script>
    </div>
<c:import url="common/footer.jsp"></c:import>
