<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/header.jsp"></c:import>
<div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
	<table id="dg" title="接收文档" style="width:100%;height:100%"
			data-options="rownumbers:true,loadMsg:'正在加载，请稍后......',fitColumns:true,singleSelect:true,pagination:true,striped:true,toolbar:'#tb',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'documentName',width:150,align:'left',resizable:true">文档名称</th>
				<th data-options="field:'docSource',width:150,align:'left'">来源</th>
				<th data-options="field:'creationUser',width:120,align:'left'">创建人</th>
				<th data-options="field:'creationDate',width:120,align:'center',resizable:true,sortable:true,order:'desc'">创建日期</th>
				<th data-options="field:'subjectTermName',width:120,align:'center'">主题词</th>
				<th data-options="field:'attachment',width:180,align:'left'">附件</th>
				<th data-options="field:'status',width:120,align:'center'">状态</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:2px 5px;">
		<form action="" id="searchFrm">
			开始时间: <input class="easyui-datebox" style="width:110px" name="startTime">
			结束时间: <input class="easyui-datebox" style="width:110px" name="endTime">
			状态: 
			<select class="easyui-combobox" panelHeight="auto" style="width:100px" name="docStatusId" id="docStatusId">
				<option value="">全部</option>
				<option value="1">新建</option>
				<option value="2">审核</option>
				<option value="3">会审</option>
				<option value="4">审批</option>
				<option value="5">归档</option>
				<option value="6">改版</option>
				<!-- <option value="7">草稿</option> -->
			</select>
			<a href="javascript:void(0)" id="searchBtn" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<span id='test'></span>
		</form>
	</div>
</div>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({
				url:'${pageContext.request.contextPath}/document/receive.json',
				queryParams: {
					rows:10,
					page:1
				},
			    onLoadSuccess:function(data){
			    	
			    	/* if(data.result){
			    		alert("请登录！");
			    	} */
			    },
			    onDblClickRow:function(rowIndex,rowData){
			    	window.location.href='${pageContext.request.contextPath}/document/recevie/'+rowData.documentId+'/receive';
			    },
				columns:[[
					{field:'documentName',title:'文档名称', width:260,align:'left',resizable:true},
					{field:'company',title:'来源', width:180,align:'left',resizable:true,
						formatter: function(value,row,index){
							if (row.company){
								return row.company.companyName;
							} else {
								return value;
							}
						}
					},
					{field:'creationUser',title:'创建人', width:60,align:'center',resizable:true,
						formatter: function(value,row,index){
							if (row.creator){
								return row.creator.userName;
							} else {
								return value;
							}
						}
					},
					{field:'creationDate',title:'创建日期', width:100,align:'center',resizable:true},
					{field:'subjectTermName',title:'主题词', width:150,align:'left',resizable:true},
					{field:'attachment',title:'附件', width:180,align:'left',resizable:true},
					{field:'documentStatus',title:'状态', width:50,align:'center',
						formatter: function(value,row,index){
							if (row.documentStatus){
								return row.documentStatus.docStatusName;
							} else {
								return value;
							}
						}
					}
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
					url:'${pageContext.request.contextPath}/document/list?'+s,
					queryParams: s
				});
			});		
		});
	</script>
<c:import url="../common/footer.jsp"></c:import>
