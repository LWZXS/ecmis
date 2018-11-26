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
    
    <title>文档详细</title>
    
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
					<!-- <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存正文</a> -->
					<a href="javascript:void(0);" id="dispose" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-handle'">处理</a>
					<a href="javascript:history.back();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'">返回</a>
				</span>
				
				<div id="tt" class="easyui-tabs" data-options="fit:true,plain:true" style="margin-top:5px; border:none;">
					
					<div title="基本信息" style="padding:10px;">
						<div style="width: 100%; margin: 0 auto;" align="center" >
							<form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="document/update.do" enctype="multipart/form-data">
								<textarea style="display: none" name="phrasesVal"></textarea>
								<input type="hidden" name="docStatusId" value="${doc.documentStatus.docStatusId }" />
								<input type="hidden" name="documentId" value="${doc.documentId }" />
								
								<input type="hidden" name="tailAfter" value="${doc.tailAfter }" />
								<input type="hidden" name="originalCode" value="${doc.originalCode }" />
								<input type="hidden" name="address" value="${doc.address }" />
								<input type="hidden" name="docSource" value="${doc.company.companyId }" />
								<input type="hidden" name=projectId value="${doc.projectId }" />
								<!-- 
						 	    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="document/add" enctype="multipart/form-data">
								 -->
							    <!--
						 		<form id="myFrm" method="post" action="document/add" enctype="multipart/form-data">
						 		 -->
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
						    				<input id="jointTrial_BtnLoad" class="areabtn" type="button" value="..."/>
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
						    				<input id="publish_rangeBtnLoad" class="areabtn" type="button" value="..." />
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
						    </form>
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
					<%-- 
					<div title="正文" style="padding:10px;height: 100%;width: 100%" >
						<iframe height="100%" width="100%" src="documentType/putTodoWordPath?mainBody=${doc.mainBody }"></iframe>
					</div>
					 --%>
				</div>
				
			</div>
		</div>
		<div data-options="region:'east',title:'处理菜单',split:true,collapsed:true" style="width:300px;">
		
			<div class="easyui-panel" style="padding:5px;border: none;">
				<c:choose>
					<c:when test="${doc.documentStatus.docStatusId eq 5 }">
						<c:choose>
							<c:when test="${opr eq 'read'}">
								<a href="javascript:void(0)" id="read" class="easyui-linkbutton" iconCls="icon-read">已阅</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" id="pending" class="easyui-linkbutton" iconCls="icon-pending">归档</a>
							</c:otherwise>
						</c:choose>
						<a href="javascript:void(0)" id="readMainBody" class="easyui-linkbutton" iconCls="icon-update">查看正文</a>
						<form id="readFrm" class="easyui-form" method="post" data-options="novalidate:true" action="document/read.do" enctype="multipart/form-data">
							<input type="hidden" name="documentId" value="${doc.documentId }" />
							<input type="hidden" name="docStatusId" value="${doc.documentStatus.docStatusId }" />
							<input type="hidden" name="opr" value="${opr }" />
							<p>
								<br />
								意见：
								<br /><br />
								<textarea id="phrasesVal" name="phrasesVal" rows="15" cols="40"></textarea>
							</p>
						</form>
					</c:when>
					<c:otherwise>
						<c:if test="${doc.documentStatus.docStatusId ne 2 }">
							<a href="javascript:void(0)" id="goBack" class="easyui-linkbutton" iconCls="icon-back">回退</a>
						</c:if>
						<a href="javascript:void(0)" id="back" class="easyui-linkbutton" iconCls="icon-back">回退发起人</a>
						<a href="javascript:void(0)" id="updateMainBody" class="easyui-linkbutton" iconCls="icon-update">查看正文</a>
						<div>
							<br />
							<hr />
							<br />
							<p>节点动作：
								<strong>${doc.documentStatus.docStatusName }</strong><br /><br />
								<input type="radio" id="agree" /><label for="agree">同意</label>&nbsp;&nbsp;<a href="javascript:void(0)" id="phrasesBtn" class="easyui-linkbutton" iconCls="icon-batch-update">常用词组</a>
							</p>
							<p>
								<br />
								意见：
								<br /><br />
								<textarea id="phrasesVal" rows="15" cols="40"></textarea>
							</p><br />
							<p align="center" style="display: none"><a href="javascript:void(0)" id="phrasesSave" class="easyui-linkbutton" iconCls="icon-save">继续并保存</a></p>
							
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<!-- 常用词组Dialog  phrases start -->
		<div id="phrases-dlg" class="easyui-dialog" closed="true" title="常用词组" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#phrases-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true" id="phrases_tree"></ul>
			</div>
		</div>
		<div id="phrases-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:getSelected($('#phrases_tree'),$('#phrasesVal'),$('#phrases-dlg'));">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#phrases-dlg').dialog('close');">关闭</a>
		
		</div>
		<!-- 常用词组Dialog  phrases end -->
		
		<!-- 分发范围 Dialog start    publish_range_name -->
		<div id="publish_range-dlg" class="easyui-dialog" closed="true" title="分发范围" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#publish_range-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true,checkbox:true" id="publish_range_tree"></ul>
			</div>
		</div>
		<div id="publish_range-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#publish_range-dlg').dialog('close');">确定</a>
			<!-- 
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#publish_range-dlg').dialog('close');">关闭</a>
		 -->
		</div>
		<!-- 分发范围Dialog end -->
		<!-- 会审Dialog start    joint_trial_name -->
		<div id="joint_trial-dlg" class="easyui-dialog" closed="true" title="会审" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#joint_trial-buttons'">
			<div class="easyui-panel" style="padding:5px">
				<ul class="easyui-tree" data-options="method:'get',animate:true,lines:true,checkbox:true" id="joint_trial_tree"></ul>
			</div>
		</div>
		<div id="joint_trial-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#joint_trial-dlg').dialog('close');">确定</a>
			<!-- 
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#joint_trial-dlg').dialog('close');">关闭</a>
		 -->
		</div>
		<!-- 会审Dialog end -->
		
		<!-- 回退Dialog  phrases start -->
		<div id="back-dlg" class="easyui-dialog" closed="true" title="回退创建人" style="width:360px;height:400px;padding:10px;"
				data-options="buttons:'#back-buttons'">
			<div class="easyui-panel" style="padding:5px" title="请输入回退原因">
				<form id="backFrm" class="easyui-form" method="post" data-options="novalidate:true" action="document/update.do">
					<input type="hidden" name="documentId" value="${doc.documentId }"/>
					<input type="hidden" name="docStatusId" id="back-docStatusId" value="${doc.documentStatus.docStatusId }"/>
					<input type="hidden" id="back-docStatusId1" value="${doc.documentStatus.docStatusId }"/>
					<textarea name="phrasesVal" rows="18" cols="49" id="backPhrasesVal"></textarea>
				</form>
			</div>
		</div>
		<div id="back-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:doBack();">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#back-dlg').dialog('close');">关闭</a>
		</div>
		<!-- 回退Dialog  phrases end -->
		
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
  	<script type="text/javascript">
  		var eastIsDisplay=false;
  		var publishRangeIsLoad=false;
		var jointTrial=false;
  		$(function(){
  			//选中会选
			$("#joint_trial_tree").tree({
				//选中时
				onCheck:function(node, checked){
					//alert(node.id+"---"+checked);
					if(checked){
						var separate="";
						if($("#joint_trial_select").get(0).length>0){
							separate="/";
						}
						$("#joint_trial_select").append($("<option value="+node.id+" selected='selected'>"+node.text+"</option>"));
						$("#joint_trial_name").val($("#joint_trial_name").val()+separate+node.text);
					}else{
						$("#joint_trial_select option[value="+node.id+"]").remove();
						var val=$("#joint_trial_name").val();
						if($("#joint_trial_name").val().indexOf(node.text)==0){
							if(val.length==node.text.length){
								val=val.replace(node.text,"");
							}else{
								val=val.replace(node.text+"/","");
							}
						}else{
							val=val.replace("/"+node.text,"");
						}
						$("#joint_trial_name").val(val);
					}
				}
			});
			
			$("#publish_range_tree").tree({
				onCheck:function(node, checked){
					if(checked){
						var separate="";
						if($("#publish_range_select").get(0).length>0){
							separate="/";
						}
						$("#publish_range_select").append($("<option value="+node.id+" selected='selected'>"+node.text+"</option>"));
						$("#publish_range_name").val($("#publish_range_name").val()+separate+node.text);
					}else{
						$("#publish_range_select option[value="+node.id+"]").remove();
						var val=$("#publish_range_name").val();
						if(val.indexOf(node.text)==0){
							if(val.length==node.text.length){
								val=val.replace(node.text,"");
							}else{
								val=val.replace(node.text+"/","");
							}
						}else{
							val=val.replace("/"+node.text,"");
						}
						$("#publish_range_name").val(val);
					}
				}
			});
  		
  			//加载分发
  			$("#publish_rangeBtnLoad").click(function(){
  				$("#publish_range-dlg").dialog("open");
  				if(!publishRangeIsLoad){
					publishRangeIsLoad=loadTree($("#publish_range_tree"),"user/findPublishRangeCheckedTree.json?documentId="+$("[name=documentId]").val(),false);
				}
  			
  			});
  			//加载会审
  			$("#jointTrial_BtnLoad").click(function(){
  				$("#joint_trial-dlg").dialog("open");
  				if(!jointTrial){
					jointTrial=loadTree($("#joint_trial_tree"),"user/findByJointTrialCheckedTree.json?documentId="+$("[name=documentId]").val(),false);
				}
  			});
  			//归档
  			$("#pending").click(function(){
  				$('#readFrm').form('submit', {
					    url:"document/pending.do",
					    onSubmit: function(){
					    	if($("#phrasesVal").val()==""){
					    		return confirm("是否确定不输入意见？");
					    	}
							return true;
					    },
					    success:function(data){
					    	//成功请求后的代码
					    	switch(data){
					    		case 'success':
					    			alert("归档成功");
									window.location.href="/ecmis/document/pending.html";
					    			break;
					    		case 'notLogin':
					    			alert("请先登录！");
					    			window.parent.parent.parent.location.href='/ecmis/user/login.html';
					    			break;
					    		default:
					    			alert(data);
					    	}
					    	
					    }
					});
  			
  			});
  			
  			//已阅
  			$("#read").click(function(){
  				//readFrm
  				$('#readFrm').form('submit', {
					    url:"document/read.do",
					    onSubmit: function(){
					    	if($("#phrasesVal").val()==""){
					    		return confirm("是否确定不输入意见？");
					    	}
							return true;
					    },
					    success:function(data){
					    	//成功请求后的代码
					    	switch(data){
					    		case 'success':
					    			alert("已阅成功");
									window.location.href="/ecmis/document/todo.html";
					    			break;
					    		case 'notLogin':
					    			alert("请先登录！");
					    			window.parent.parent.parent.location.href='/ecmis/user/login.html';
					    			break;
					    		default:
					    			alert(data);
					    	}
					    	
					    }
					});
  			
  			});
  			
  			//回退给发件人,条开Dialog
  			$("#back").click(function(){
  				//alert("back");
  				$("#back-dlg").dialog("open");
  				$("#back-docStatusId").val(8);
  				
  			});
  			
  			//回退上一个状态,打开Dialog
  			$("#goBack").click(function(){
  				//alert("back");
  				$("#back-dlg").dialog("open");
  				$("#back-docStatusId").val($("#back-docStatusId1").val()-1);
  				
  			});
  			
  			//提交审核
  			$("#phrasesSave").click(function(){
  				
  				var $phrasesVal= $("#phrasesVal");
				if($phrasesVal.val()==""){
					alert("请输入审批意见！");
				}else{
					//提交数据
					$("[name=phrasesVal]").val($phrasesVal.val());
					
					$('#ff').form('submit', {
					    url:"document/update.do",
					    onSubmit: function(){
					    	//验证
							//alert($("#docTypeId").val());
							/*
							name="address"
							
							name="docSource"
							id="docTypeId"
							name="serviceNo"
							name="documentName"
							id="subjectTermId"
							id="auditorId"
							name="originalCode"
							id="joint_trial_select"
							id="approverId"
							name="creationDate"
							id="publish_range_select"
												
							id=docTypeName
							id="subjectTermName"
							id="auditorName"
							id="approverName"
												
							*/
							//var flag= check($('#docTypeName')) & check($('[name="documentName"]')) & check($('#subjectTermName')) & check($('#docTypeName'));
							
							return true;
					    },
					    success:function(data){
					    	//成功请求后的代码
					    	switch(data){
					    		case 'success':
				    				alert("操作成功");
									window.location.href="/ecmis/document/todo.html";
					    			break;
					    		case 'notLogin':
					    			alert("请先登录！");
					    			window.parent.parent.parent.location.href='/ecmis/user/login.html';
					    			break;
					    		case 'notProject':
					    			alert("选择项目！");
					    			break;
					    		default:
					    			alert(data);
					    	}
					    	
					    }
					});
				}
  			
  			});
  		
  		
  			//修改正文    增加正文tabs
  			$("#updateMainBody").click(function(){
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
  		
			//展开处理Layout 		
  			$('#dispose').click(function(){
  				if(eastIsDisplay){
  					$('#cc').layout('collapse','east');
  					eastIsDisplay=false;
  				}else{
	  				//展开
		  			$('#cc').layout('expand','east');
  					eastIsDisplay=true;
  				}
  			});
  			
  			$("#agree").change(function(){
  				$("#phrasesSave").parent().show();
  			
  			});
  			
  			//显示常用词组
  			$("#phrasesBtn").click(function(){
  				$("#phrases-dlg").dialog("open");
  				$("#phrases_tree").tree({
					url : "phrases/list.json",//请求路径，id为根节点的id  
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
  			});
  			
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
  		});
  		
  		//获得Tree 的选中
  		function getSelected(source,targetText,dialogObj){
			var node = source.tree('getSelected');
			if (node){
				//赋值
				targetText.val(targetText.val()+node.text);
				//关闭dialog
				dialogObj.dialog('close');
			}else{
				alert('请选择!');
			}
		}
		
		/* function agree(){
			alert($("#agree").checked());
			if($("#agree").checked()){
			
				$("#phrasesSave").parent().show();
			}
		} */
		
		function check(obj){
			if(obj.val()==null || obj.val()==""){
				obj.addClass("textbox-invalid");
				return false;
			}
			obj.removeClass("textbox-invalid");
			return true;
		}
		
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
		
		//回退发件人
		function doBack(){
			$('#backFrm').form('submit', {
			    url:"document/back.do",
			    onSubmit: function(){
			    	if($("#backPhrasesVal").val()==""){
			    		alert("请输入原因！");
			    		return false;
			    	}
					return true;
			    },
			    success:function(data){
			    	//成功请求后的代码
			    	switch(data){
			    		case 'success':
			    			alert("退回成功");
							window.location.href="/ecmis/document/todo.html";
			    			break;
			    		case 'notLogin':
			    			alert("请先登录！");
			    			window.parent.parent.parent.location.href='/ecmis/user/login.html';
			    			break;
			    		default:
			    			alert(data);
			    	}
			    	
			    }
			});
		}
  	</script>
  </body>
</html>
