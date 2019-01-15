<%@page import="com.ecmis.pojo.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改页面</title>
    
    <link rel="shortcut icon" href="/public/css/images/logo32px.png">
	<link rel="apple-touch-icon" href="/public/css/images/images/logo57px.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/public/css/images/images/logo72px.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/public/css/images/images/logo114px.png">
    
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
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/localjs/modifyFile.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/localjs/flow.js"></script>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		.filebtns{
			position: absolute;
			top: 5px;
			right: 30px;
			z-index: 1;
		}
		body{
			height: 100%;
		
		}
		textarea{
			resize:none;
			width: 498px;
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
		#ff2 input{
			border: none;
			border-bottom: 1px black solid;
		}
		#ff2 textarea{
			border: none;
			border-bottom: 1px black solid;
		}
		#ff3 input{
			border: none;
			border-bottom: 1px black solid;
		}
		#ff3 textarea{
			border: none;
			border-bottom: 1px black solid;
		}
		#ff2 table tr td,#ff3 table tr td{
			padding-left: 10px;
		}
		#frmTb tr td{
			padding: 10px;
		}
	</style>
  </head>
  
  <body class="main_body">
	<div class="easyui-panel" style="width:100% ;  position: relative; height: 100%;">
		<span class="filebtns">
			<a href="javascript:void(0);" id="flow" class="easyui-linkbutton" datas="documentId:${doc.documentId },docStatusId:${doc.documentStatus.docStatusId }" data-options="plain:true,iconCls:'icon-flow'">流程</a>
			<!-- <a href="javascript:void(0);" onclick="save(2);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存待发</a> -->
			<a href="javascript:void(0);" onclick="save(1);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">立即发送</a>
			<a href="javascript:history.back();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'">返回</a>
		</span>
		<!-- 选择文件类型dialog start-->
	 	<div id="file-type" class="easyui-dialog" closed="true" title="文件类型选择" style="width:360px;height:400px;padding:10px;"
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
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:getSelectedType($('#typeTree'),$('#docTypeId'),$('#docTypeName'),$('#file-type'));">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#file-type').dialog('close')">关闭</a>
		</div>
		<!-- 选择文件类型dialog end-->
		
		<!-- 主题词dialog start-->
	 	<div id="subject-term" class="easyui-dialog" closed="true" title="主题词" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#subject-term-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true" id="subjectTermTree"></ul>
			</div>
		</div>
		<div id="subject-term-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:getSelected($('#subjectTermTree'),$('#subjectTermId'),$('#subjectTermName'),$('#subject-term'));">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#subject-term').dialog('close')">关闭</a>
		</div>
		<!-- 选择主题词dialog end-->
		
		<!-- 审核人Dialog start-->
		<div id="auditor-dlg" class="easyui-dialog" closed="true" title="审核人" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#auditor-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true" id="auditorTree"></ul>
			</div>
		</div>
		<div id="auditor-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:getSelected($('#auditorTree'),$('#auditorId'),$('#auditorName'),$('#auditor-dlg'));">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#auditor-dlg').dialog('close')">关闭</a>
		</div>
		
		<!-- 审核人Dialog end-->
		<!-- 会审Dialog start    joint_trial_name -->
		<div id="joint_trial-dlg" class="easyui-dialog" closed="true" title="会审" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#joint_trial-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true,checkbox:true" id="joint_trial_tree"></ul>
			</div>
		</div>
		<div id="joint_trial-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#joint_trial-dlg').dialog('close');">确定</a>
		</div>
		<!-- 会审Dialog end -->
		
		<!-- 分发范围 Dialog start    publish_range_name -->
		<div id="publish_range-dlg" class="easyui-dialog" closed="true" title="分发范围" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#publish_range-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true,checkbox:true" id="publish_range_tree"></ul>
			</div>
		</div>
		<div id="publish_range-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#publish_range-dlg').dialog('close');">确定</a>
		</div>
		<!-- 分发范围Dialog end -->
		
		<!-- 批准人Dialog  approver start -->
		<div id="approver-dlg" class="easyui-dialog" closed="true" title="批准人" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#approver-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true" id="approver_tree"></ul>
			</div>
		</div>
		<div id="approver-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:getSelected($('#approver_tree'),$('#approverId'),$('#approverName'),$('#approver-dlg'));">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#approver-dlg').dialog('close');">关闭</a>
		
		</div>
		
		<!-- 批准人Dialog  approver end -->
		
		<!-- 流程Dialog  flow start -->
		<div id="flow-dlg" class="easyui-dialog" closed="true" title="流程" style="width:940px;height:400px;padding:10px;"
				data-options="buttons:'#flow-buttons'">
			<iframe name="flowIframe" id="flowIframe" scrolling="no" frameborder="0"  src="document/flow.html?docStatusId=${doc.documentStatus.docStatusId }" style="width:100%;height:100%;"></iframe>
		</div>
		<div id="flow-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#flow-dlg').dialog('close');">关闭</a>
		</div>
		<!-- 流程Dialog  flow end -->
		
		<div id="file-tabs" class="easyui-tabs" data-options="fit:true,plain:true" style="margin-top:5px; border:none;">
			
			<div title="详细信息" style="padding:10px;">
				<div style="width: 100%; margin: 15px auto;" align="center" >
					<form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="document/modify.do" enctype="multipart/form-data">
						<input type="hidden" name="opr" value="${opr }"/>
						<input type="hidden" name="status" value="1" id="status" />
						<input type="hidden" name="documentId" value="${doc.documentId }" id="documentId" />
						<input type="hidden" id="currentDocTypeId" value="${doc.docType.docTypeId }">
						<input type="hidden" value="${doc.mainBody }" id="mainBody" name="mainBody" />
						<input type="hidden" value="" id="mainBodyNum" />
						<input type="hidden" value="" id="newMainBody" name="newMainBody"/>
						<input type="hidden" value="" id="newMainBodyNum" />
				    	<table cellpadding="5" cellspacing="0" id="frmTb">
				    		<tr>
				    			<td>文件属地:</td>
				    			<td><input class="file-input" type="text" name="address" value="${doc.address }" /></td>
				    			<td>文件来源:</td>
				    			<td>
									<select name=docSource style="width: 198px;" id="docSource">
										<option value="">请选择...</option>
										<c:if test="${not empty companys }">
											<c:forEach items="${companys }" var="company">
												<option value="${company.companyId }"
													<c:if test="${company.companyId eq doc.company.companyId }">
														selected="selected"
													</c:if>
												>${company.companyName }</option>
											</c:forEach>
										</c:if>
									</select>
								</td>
				    		</tr>
				    		<!-- 
				    		Document [documentId=2, 
				    		documentName=文州2,
				    		 docCode=null, 
				    		 docStatusId=null, 
				    		 docTypeId=null, 
				    		 subjectTermId=保护, 
				    		 tailAfter=true,
				    		  importanceDegree=1, 
				    		  originalCode=文州2, 
				    		  description=AND bj.status=1, 
				    		  attachment=null, 
				    		  projectId=1, 
				    		  scanningCopy=null, 
				    		  contract=null, 
				    		  mainBody=201381512872389999documenttype17.doc, 
				    		  address=文州2,
				    		   docSource=null, 
				    		   creationUser=null, 
				    		   modifuUser=8, 
				    		   status=1, 
				    		   creationDate=Fri Nov 10 00:00:00 CST 2017, 
				    		   modifyDate=Fri Dec 15 15:47:56 CST 2017, 
				    		   auditorId=7, 
				    		   approverId=10]
				    		 -->
				    		<tr>
				    			<td>文件类型:</td>
				    			<td colspan="3">
				    				<input type="hidden" name="docTypeId" id="docTypeId" value="${doc.docType.docTypeId }">
				    				<input class="" style="width: 498px;" type="text" id="docTypeName" value="${doc.docType.docTypeName }"/>
									<input id="typeBtnLoad" value="..." type="button">
									<!-- <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('close')">Close</a> -->
				    				
				    			</td>
				    			<%-- <td>业务码:</td>
				    			<td><input class="file-input" type="text" name="serviceNo" value="${doc.docCode }"/></td> --%>
				    		</tr>
				    		<tr>
				    			<td>文件名称:</td>
				    			<td><input class="file-input" type="text" name="documentName" value="${doc.documentName }"/></td>
				    			<td>是否跟踪:</td>
				    			<td>
									<select name="tailAfter" style="width: 198px;">
										<option value="true"
											<c:if test="${doc.tailAfter eq true }">
												 selected="selected"
											</c:if>
										>有</option>
										<option value="false"
											<c:if test="${doc.tailAfter eq false }">
												 selected="selected"
											</c:if>
										>无</option>
									</select>
								</td>
				    		</tr>
				    		<tr>
				    			<td>主题词:</td>
				    			<td>
				    				<input type="hidden" name="subjectTermId" id="subjectTermId" value="${doc.subjectTermName }"/>
				    				<input class="file-input" id="subjectTermName" name="subjectTermName" value="${doc.subjectTermName }"/>
				    				<input type="button" id="subjectTermBtnLoad" value="...">
				    			</td>
				    			<td>重要程度:</td>
				    			<td>
									<select name="importanceDegree" style="width: 198px;">
										<option value="1"
											<c:if test="${doc.importanceDegree eq 1 }">
												 selected="selected"
											</c:if>
										>一般</option>
										<option value="2"
											<c:if test="${doc.importanceDegree eq 2 }">
												 selected="selected"
											</c:if>
										>紧急</option>
									</select>
								</td>
				    		</tr>
				    		<tr>
				    			<td>审核人:</td>
				    			<td>
									<input type="hidden" name="auditorId" id="auditorId" value="${doc.auditor.userId }">
				    				<input class="file-input" type="text" id="auditorName" value="${doc.auditor.userName }"/>
									<input type="button" id="auditorBtnLoad" value="...">
								</td>
				    			<td>原文编码:</td>
				    			<td><input class="file-input" name="originalCode" value="${doc.originalCode }"/></td>
				    		</tr>
				    		<tr>
				    			<td>会审:</td>
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
				    				<input id="jointTrial_BtnLoad" class="areabtn" type="button" value="..."/>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>批准人:</td>
				    			<td colspan="3">
				    				<input type="hidden" name="approverId" id="approverId" value="${doc.approver.userId }">
				    				<input class="file-input" id="approverName" value="${doc.approver.userName }"/>
				    				<input type="button" id="approverBtnLoad" value="...">
				    			</td>
				    			<%--<td>修改日期:</td>
				    			<td>
				    				<input type="text" id="creationDate" name="modifyDate" >
				    			</td>--%>
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
				    				<input id="publish_rangeBtnLoad" class="areabtn" type="button" value="..." />
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>附件:</td>
								<c:choose>
									<c:when test="${not empty doc.attachment }">
						    			<%-- <td><a href="<%= request.getContextPath()%>/statics/file/${doc.attachment }">附件</a></td> --%>
						    			<td colspan="3">
						    				<a href="document/download?fileName=${doc.attachment }">${doc.attachment }</a><br />
						    				替换：<input type="file" class="easyui-inputbox" name="file"/>
						    			</td>
									
									</c:when>
									<c:otherwise>
						    			<td colspan="3"><input type="file" class="easyui-inputbox" name="file"/></td>
									</c:otherwise>
								</c:choose>
				    		</tr>
				    	</table>
				   
				    </form>
				   <div class="audit-record" title="他人意见" style="padding:10px; width: 90%">
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
				
			</div>
		<%--	<!-- 流程Dialog  flow start -->
			<div id="flow-dlg" class="easyui-dialog" closed="true" title="流程" style="width:940px;height:400px;padding:10px;"
					data-options="buttons:'#flow-buttons'">
				<iframe name="flowIframe" id="flowIframe" scrolling="no" frameborder="0"  src="document/flow.html?docStatusId=${doc.documentStatus.docStatusId }" style="width:100%;height:100%;"></iframe>
			</div>
			<div id="flow-buttons">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#flow-dlg').dialog('close');">关闭</a>
			</div>
			<!-- 流程Dialog  flow end -->--%>
		</div>
		
		<script type="text/javascript">
			$(function(){
				$('#dg').datagrid({
					url:'${pageContext.request.contextPath}/auditRecord/findByDocument.json',
					queryParams: {
						rows:10,
						page:1,
						documentId:${doc.documentId}
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

				/*加载公司--jeasyui*/
				$('#docSource').combobox({
					url: '${pageContext.request.contextPath}/company/getByCompanyTypeId.json?companyTypeId=1',
					valueField: 'companyId',
					textField: 'companyName'
				});
                $('#docSource').combobox("setValue",${doc.docSource});
			
			})
			
		</script>
  </body>
</html>
