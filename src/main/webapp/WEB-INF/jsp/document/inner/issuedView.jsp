<%@page import="com.ecmis.pojo.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>已发文档详细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/localjs/flow.js"></script>
	<style type="text/css">
	
		*{
			box-sizing:border-box;
			-moz-box-sizing:border-box;   /*Firefox*/
			-webkit-box-sizing:border-box;  /*Ssfari*/
			-ms-box-sizing:border-box;
		
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
		.singlet{
			height: 24px;
		}
		.multiple{
			height: 98px;
		}
		
	</style>

  </head>
  
  <body>
	<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'center'" style="background:#eee;">
		    <div class="easyui-panel" style="width:100% ;  position: relative; height: 100%;" id="content">
				<span class="filebtns">
					<a href="javascript:void(0);" id="flow" class="easyui-linkbutton" datas="documentId:${doc.documentId },docStatusId:${doc.documentStatus.docStatusId }" data-options="plain:true,iconCls:'icon-flow'">流程</a>
					<a href="javascript:void(0);" id="readMainBody" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-look'">查看正文</a>
					<a href="javascript:history.back();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'">返回</a>
				</span>
				
				<div id="tt" class="easyui-tabs" data-options="fit:true,plain:true" style="margin-top:5px; border:none;">
					
					<div title="基本信息" style="padding:10px;">
						<div style="width: 100%; margin: 0 auto;" align="center" >
						    	<table cellpadding="5" cellspacing="10">
						    		<tr>
						    			<td>文件名称:</td>
						    			<td><input class="file-input" type="text" name="documentName" value="${doc.documentName }" style="width: 198px;"/></td>
						    			<td>主题词:</td>
						    			<td>
											<input name="subjectTermName" value="${doc.subjectTermName }" style="width: 198px;"/>
										</td>
						    		</tr>
						    		<tr>
						    			<td>文件类型:</td>
						    			<td>
						    				<input type="hidden" name="docTypeId" id="docTypeId" value="${doc.docType.docTypeId }">
						    				<input class="file-input" type="text" readonly id="docTypeName" value="${doc.docType.docTypeName }" style="width: 198px;"/>
											<!-- <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('close')">Close</a> -->
						    			</td>
						    			<td>重要程度:</td>
						    			<td>
											<select name="importanceDegree" style="width: 198px;">
												<option value="1"
													<c:if test="${doc.importanceDegree==1 }">
														selected="selected"
													</c:if>
												>一般</option>
												
												<option value="2"
													<c:if test="${doc.importanceDegree==2 }">
														selected="selected"
													</c:if>
												>紧急</option>
											</select>
										</td>
						    		</tr>
						    		<tr>
						    			<td>主送:</td>
						    			<td colspan="3">
						    				<!-- jointTrial -->
						    				<select name="jointTrials" id="joint_trial_select" multiple="multiple" style="display: none">
						    					<c:if test="${doc.jointTrial !=null && doc.jointTrial.size()>0 }">
						    						<c:forEach items="${doc.jointTrial }" var="user">
						    							<option value="${user.userId }" selected="selected">${user.userName }</option>
						    						</c:forEach>
						    					</c:if>
						    				</select>
						    				<textarea id="joint_trial_name" class="easyui-textareabox" cols="75" rows="3"><c:if test="${doc.jointTrial !=null && doc.jointTrial.size()>0 }"><c:forEach items="${doc.jointTrial }" var="user" varStatus="i">${user.userName }<c:if test="${i.count!=doc.jointTrial.size() }">/</c:if></c:forEach></c:if></textarea>
						    			</td>
						    		</tr>
						    		<tr>
						    			<td>分发范围:</td>
						    			<td colspan="3">
						    				<select style="display: none;" multiple="multiple" id="publish_range_select" name="publishRanges">
						    					<c:if test="${doc.publishRange !=null && doc.publishRange.size()>0 }">
						    						<c:forEach items="${doc.publishRange }" var="user">
						    							<option value="${user.userId }" selected="selected">${user.userName }</option>
						    						</c:forEach>
						    					</c:if>
						    				</select>
						    				<textarea class="easyui-textareabox" id="publish_range_name" cols="75" rows="3"><c:if test="${doc.publishRange !=null && doc.publishRange.size()>0 }"><c:forEach items="${doc.publishRange }" var="user" varStatus="i">${user.userName }<c:if test="${i.count!=doc.publishRange.size() }">/</c:if></c:forEach></c:if></textarea>
						    			</td>
						    		</tr>
						    		<tr>
						    			<td>备注:</td>
						    			<td colspan="3">
						    				<textarea class="easyui-textareabox" id="description" name="description" cols="75" rows="3">${doc.description }</textarea>
						    			</td>
						    		</tr>
						    		<tr>
						    			<td>附件:</td>
										<c:choose>
											<c:when test="${not empty doc.attachment }">
								    			<%-- <td><a href="<%= request.getContextPath()%>/statics/file/${doc.attachment }">附件</a></td> --%>
								    			<td colspan="3"><a href="document/download?fileName=${doc.attachment }">${doc.attachment }</a></td>
											</c:when>
											<c:otherwise>
								    			<td colspan="3">无</td>
											</c:otherwise>
										</c:choose>
						    		
						    		</tr>
						    		<tr>
						    			<td>扫描件:</td>
						    			<td colspan="3"><input type="file" class="easyui-inputbox" name="file"/></td>
						    		</tr>
						    	</table>
							<div class="audit-record" title="他人意见" style="padding:10px; width: 100%">
								<table id="dg" title="他人意见" style="width:100%;height:250px"
										data-options="rownumbers:true,singleSelect:true,pagination:true,striped:true,method:'get'">
									<thead>
										<tr>
											<th data-options="field:'oprationUser',width:60,align:'center'">姓名</th>
											<th data-options="field:'phrases',width:280">意见</th>
											<th data-options="field:'opration',width:60,align:'center'">操作</th>
											<th data-options="field:'creationDate',width:180,align:'center'">时间</th>
											<th data-options="field:'description',width:180,align:'center'">备注</th>
										</tr>
									</thead>
								</table>
								<br/>
								<br/>
								<br/>
							</div>
						</div>
					</div>
					<%-- <div title="正文" style="padding:10px;height: 100%;width: 100%" >
						<iframe height="100%" width="100%" src="documentType/putTodoWordPath?mainBody=${doc.mainBody }"></iframe>
					</div> --%>
				</div>
				
			</div>
			<!-- 流程Dialog  flow start -->
			<div id="flow-dlg" class="easyui-dialog" closed="true" title="流程" style="width:940px;height:400px;padding:10px;"
					data-options="buttons:'#flow-buttons'">
				<iframe name="flowIframe" id="flowIframe" scrolling="no" frameborder="0"  src="document/flow.html?docStatusId=${doc.documentStatus.docStatusId }" style="width:100%;height:100%;"></iframe>
			</div>
			<div id="flow-buttons">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#flow-dlg').dialog('close');">关闭</a>
			</div>
			<!-- 流程Dialog  flow end -->
		</div>
		
	</div>
  	<script type="text/javascript">
  		
		//审核记录
		$('#dg').datagrid({
			url:'auditRecord/findByDocument.json',
			queryParams: {
				rows:10,
				page:1,
				documentId:<%=((Document)request.getAttribute("doc")).getDocumentId() %>
			},
		    onLoadSuccess:function(data){
		    	//alert("ok");
		    },
		    onDblClickRow:function(rowIndex,rowData){
		    	
		    }/* ,
			columns:[[
				{field:'oprationUser',title:'姓名', width:80,align:'center',resizable:true},
				{field:'phrases',title:'意见', width:180,align:'left',resizable:true},
				{field:'opration',title:'操作', width:80,align:'center',resizable:true},
				{field:'creationDate',title:'时间', width:180,align:'left',resizable:true}
			]] */
		});
		
		$("#back").click(function(){
			history.back();
		});
		
		//修改正文    增加正文tabs
  			$("#readMainBody").click(function(){
  				if($('#tt').tabs('exists','正文')){
					$('#tt').tabs('select','正文');
				}else{
					//增加tab
					$('#tt').tabs('add',{
						title: '正文',
						content: '<div style="padding:5px;width:100%;height:100%;">'
									+'<iframe height="100%" width="100%" src="documentType/putTodoWordPath?mainBody=${doc.mainBody }&opr=read"></iframe>'
								+'</div>',
						closable: true,
						iconCls:'icon-main-body'
					});
				}
  			});
  	</script>
  </body>
</html>
