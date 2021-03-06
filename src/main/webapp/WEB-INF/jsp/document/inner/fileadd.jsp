<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新建文档</title>
    
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
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/localjs/doadd.js"></script>
	
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
		.filebtns a{
			width: 100px;
			padding: 8px;
			border: 1px #B3D8FE solid;
			border-radius: 2px;
		}
		.filebtns a:hover{
			background-color: #e8f1ff;
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
		*{
			box-sizing:border-box;
			-moz-box-sizing:border-box;   /*Firefox*/
			-webkit-box-sizing:border-box;  /*Ssfari*/
			-ms-box-sizing:border-box;

		}
		a:link{
			text-decoration: none;
			color:#333;

		}
		.LeftMenu li{
			list-style: none;

		}
		.LeftMenu li img,.LeftMenu li a{
			vertical-align: middle;
		}

		.LeftMenu li a{
			margin-left: 10px;
		}
		.LeftMenu li{
			margin: 0 auto;
			padding: 5px;
			border: 1px solid #fff;
			width: 120px;
			border-radius:5px;
			text-align: left;
		}
		.LeftMenu li:hover{
			border: 1px solid #95B8E7;
			border-radius:5px;
		}
	</style>
  </head>

  <body class="easyui-layout">
<%--  <div data-options="region:'north',title:'',split:false" style="height:44px; line-height: 42px" >
	  <a href="${pageContext.request.contextPath}/document/inner.html" target="contentIframe" onclick="selectCurr(this);" class="easyui-linkbutton" option="innerFile" data-options="plain:true" style="margin:0 20px;">内部文档</a>|
	  <a href="${pageContext.request.contextPath}/document/pigeonhole.html" target="contentIframe" onclick="selectCurr(this)" option="pigeonholeFile" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">归档文档</a>|
	  <a href="${pageContext.request.contextPath}/document/system.html" target="contentIframe" onclick="selectCurr(this)" class="easyui-linkbutton" option="systemSet" data-options="plain:true" style="margin:0 20px;">系统设置</a>
  </div>--%>
  <div data-options="region:'west',title:'发件管理',split:true" style="width:150px;">
	  <p style="padding:5px;margin:0;">请选择您要的操作:</p>
	  <ul class="LeftMenu">
		  <%--
          <c:if test="${not empty sessionScope.loginUserProject }">
              <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="document/add.html" target="innerIframe">新建文档</a></li>
          </c:if>
          --%>
		  <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_new.png"></img><a href="<%=request.getContextPath()%>/document/add.html">新建文档</a></li>
		  <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="<%=request.getContextPath()%>/document/index.html" >个人待办</a></li>

		  <%--
          <c:set var="isClerk" value="${elf:filterMenu(loginUser) }"></c:set>
          <c:if test="${isClerk }">
              <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="document/pending.html" target="innerIframe">待归档文件</a></li>
          </c:if>
          --%>
		  <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_todo.png"></img><a href="<%=request.getContextPath()%>/document/pending.html">待归档文件</a></li>
		  <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_draft.png"></img><a href="<%=request.getContextPath()%>/document/draft.html">草稿</a></li>
		  <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_issued.png"></img><a href="<%=request.getContextPath()%>/document/issued.html">已发文件</a></li>
		  <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_havetodo.png"></img><a href="<%=request.getContextPath()%>/document/havetodo.html">已办文件</a></li>
		  <li><img src="<%=request.getContextPath() %>/statics/css/icons/file_receive.png"></img><a href="<%=request.getContextPath()%>/document/receive.html">接收文档</a></li>
	  </ul>
  </div>
  <div data-options="region:'center',title:'新建文档'" style="padding:5px;background:#eee;">
		<span class="filebtns">
			<!-- <a href="javascript:void(0);" id="flow" class="easyui-linkbutton" datas="documentId:'',docStatusId:''" data-options="plain:true,iconCls:'icon-flow'">流程</a> -->
			<a href="javascript:void(0);" onclick="save(2);"  data-options="plain:true,iconCls:'icon-save'">保存待发</a>
			<a href="javascript:void(0);" onclick="save(1);"  data-options="plain:true,iconCls:'icon-save'">立即发送</a>
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
		<!-- <div id="subject-term-toolbar" style="padding:2px 0;">
			<table cellpadding="0" cellspacing="0" style="width:100%">
				<tr>
					<td style="padding-left:2px">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">Edit</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true">Help</a>
					</td>
					<td style="text-align:right;padding-right:2px">
						<input id="subjectTerm" class="easyui-searchbox" data-options="prompt:'Please input somthing'" style="width:150px"></input>
					</td>
				</tr>
			</table>
		</div> -->
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
			<!-- 
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#joint_trial-dlg').dialog('close');">关闭</a>
			 -->
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
			<!-- 
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#publish_range-dlg').dialog('close');">关闭</a>
		 -->
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
		
		<div id="file-tabs" class="easyui-tabs" data-options="fit:true,plain:true" style="margin-top:5px; border:none;">
			
			<div title="详细信息" style="padding:10px;">
				<div style="width: 100%; margin: 15px auto;" align="center" >
					<form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="${pageContext.request.contextPath}/document/add.do" enctype="multipart/form-data">
						<input type="hidden" name="status" value="1" id="status" />
						<input type="hidden" name="mainBody" value="" id="mainBody" />
						<input type="hidden" value="" id="mainBodyNum" />
						<input type="hidden" name="docStatusId" value="1" id="docStatusId" />
					<!-- 
			 	    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="document/add" enctype="multipart/form-data">
					 -->
				    <!--
			 		<form id="myFrm" method="post" action="document/add" enctype="multipart/form-data">
			 		 -->
				    	<table cellpadding="5" cellspacing="0" id="frmTb">
				    		<tr>
				    			<td>文件属地:</td>
				    			<td><input class="file-input" type="text" name="address"/></td>
				    			<td>文件来源:</td>
				    			<td>
				    				<!-- <input class="file-input" type="text" name="docSource"/> -->
				    				<!-- <input class="easyui-textbox" type="text" name="docSource" data-options="required:true"/> -->
									<select name="docSource" style="width: 198px;" id="docSource">
									</select>
								</td>
				    		</tr>
				    		<tr>
				    			<td>文件类型:</td>
				    			<td colspan="3">
				    				<input type="hidden" name="docTypeId" id="docTypeId">
				    				<input type="text" id="docTypeName" style="width: 498px;"/>
									<button id="typeBtnLoad">...</button>
									<!-- <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg').dialog('close')">Close</a> -->
				    				
				    			</td>
				    			<!-- <td>业务码:</td>
				    			<td><input class="file-input" type="text" name="serviceNo"/></td> -->
				    		</tr>
				    		<tr>
				    			<td>文件名称:</td>
				    			<td><input class="file-input" type="text" name="documentName"/></td>
				    			<td>是否跟踪:</td>
				    			<td>
									<select name="tailAfter"  style="width: 198px;">
										<option value="true">有</option>
										<option value="false">无</option>
									</select>
								</td>
				    		</tr>
				    		<tr>
				    			<td>主题词:</td>
				    			<td>
				    				<input type="hidden" name="subjectTermId" id="subjectTermId"/>
				    				<input class="file-input" id="subjectTermName" name="subjectTermName"/>
				    				<button id="subjectTermBtnLoad">...</button>
				    			</td>
				    			<td>重要程度:</td>
				    			<td>
									<select name="importanceDegree" style="width: 198px;">
										<option value="1">一般</option>
										<option value="2">紧急</option>
									</select>
								</td>
				    		</tr>
				    		<tr>
				    			<td>审核人:</td>
				    			<td>
									<input type="hidden" name="auditorId" id="auditorId">
				    				<input class="file-input" type="text" id="auditorName"/>
									<button id="auditorBtnLoad">...</button>
								</td>
				    			<td>原文编码:</td>
				    			<td><input class="file-input" name="originalCode"/></td>
				    		</tr>
				    		<tr>
				    			<td>会审:</td>
				    			<td colspan="3">
				    				<select multiple="multiple" style="display: none;" id="joint_trial_select" name="jointTrials">
				    				
				    				</select>
				    				<textarea style="resize: none;" class="easyui-textareabox" id="joint_trial_name" cols="75" rows="3"></textarea>
				    				<button id="joint_trialBtnLoad" class="areabtn">...</button>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>批准人:</td>
				    			<td colspan="3">
				    				<input type="hidden" name="approverId" id="approverId">
				    				<input class="file-input" id="approverName"/>
				    				<button id="approverBtnLoad">...</button>
				    			</td>
				    			<%--<td>创建日期:</td>
				    			<td>
				    				<input type="text" id="creationDate" name="creationDate" required="required">
				    			</td>--%>
				    		</tr>
				    		<tr>
				    			<td>分发范围:</td>
				    			<td colspan="3">
				    				<select style="display: none;" multiple="multiple" id="publish_range_select" name="publishRanges"></select>
				    				<textarea class="easyui-textareabox" id="publish_range_name" cols="75" rows="3"></textarea>
				    				<button id="publish_rangeBtnLoad" class="areabtn">...</button>
				    			</td>
				    		</tr>
				    		<tr>
				    			<td>附件:</td>
				    			<td colspan="3"><input type="file" class="easyui-inputbox" name="file"/></td>
				    		</tr>
				    		<!-- <tr>
				    			<td>Language:</td>
				    			<td>
				    				<select class="easyui-combobox" name="language">
				    					<option value="ar">Arabic</option>
										<option value="th">Thai</option>
										<option value="tr">Turkish</option>
									</select>
								</td>
				    		</tr> -->
				    	</table>
				   
				   <!--  <div style="text-align:center;padding:5px">
				    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
				    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
				    </div> -->
				    </form>
				   
				</div>
			</div>
			<!-- <div title="监理工作联系单" style="padding:10px; border: 1px solid black" >
				
			</div> -->
			
		</div>
		
  </div>
  <script type="text/javascript">
	  $(function () {
          /*加载公司--jeasyui*/
          $('#docSource').combobox({
              url: '${pageContext.request.contextPath}/company/getByCompanyTypeId.json?companyTypeId=1',
              valueField: 'companyId',
              textField: 'companyName'
          });

      })
  </script>
  </body>
</html>
