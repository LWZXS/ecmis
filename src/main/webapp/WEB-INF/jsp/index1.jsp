<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>天安监理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	
	<jsp:include page="/WEB-INF/jsp/title.jsp"></jsp:include>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
 	<style type="text/css">
 		*{
			box-sizing:border-box;
			-moz-box-sizing:border-box;   /*Firefox*/
			-webkit-box-sizing:border-box;  /*Ssfari*/
			-ms-box-sizing:border-box;
		
		}
 	
 		body{
 			margin: 0 auto;
 		}
 		#tt div{
 			box-sizing:border-box;
			-moz-box-sizing:border-box; /* Firefox */
			-webkit-box-sizing:border-box; /* Safari */
			-ms-box-sizing:border-box; /* IE */
 		}
 		#home div{
 			box-sizing:content-box;
			-moz-box-sizing:content-box; /* Firefox */
			-webkit-box-sizing:content-box; /* Safari */
			-ms-box-sizing:content-box; /* IE */
 		}
 		
 		#home > div {
			float: left; 
			margin: 5px 15px 10px 5px;
		}
		
		.userInfo{
			width: 500px;
			position: absolute;
			bottom: 10px;
			left: 40%;
		}
 	</style>
 	
 	<script type="text/javascript">
 		$(function(){
 		
 			var winHeight;
			var winWidth;
			if (window.innerHeight){
				winHeight = window.innerHeight;
				winWidth = window.innerWidth;
			}else if ((document.body) && (document.body.clientHeight)){
				winHeight = document.body.clientHeight;
				winWidth = document.body.clientWidth;
			}
			
			//alert(winHeight);
			//alert(winWidth);
 			//tt的宽度
 			//$("#tt").parent().css("width",(winWidth-181)+"px");
 			//$("#tt").parent().css("height",(winHeight-130)+"px");
 			$("#currProject").change(function(){
 			
 				//alert($('#currProject').val());
 				$.ajax({
 					url:'project/selectProject',
 					data:'projectId='+$('#currProject').val(),
 					success:function(data){
 						if(data.result=='notLogin'){
 							window.href='user/login.html?msg=请先登录后再选择项目！';
 						}
 					},
 					error:function(){
 						alert('失败');
 					}
 				
 				});
 			});
 			
 			//加载左侧tree
 			$("#menuTree").tree({
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
                                content: '<div style="padding:5px;width:'+(winWidth-150)+'px; height:'+(winHeight-143)+'px; overflow: auto;">'
                                +'<iframe id="'+node.attributes.type+'Iframe" name="'+node.attributes.type+'Iframe" scrolling="no" frameborder="0"  src="'+node.attributes.url+'" style="width:100%;height:100%;"></iframe>'
                                +'</div>',
                                closable: true,
                                iconCls:'icon-'+node.attributes.icon
                            });
	 					
	 					}
					}
 				}
 			});
 		});
 	</script>
</head>
  
  <body style="overflow: hidden;">
    <div class="easyui-layout" style="width:100%; height: 100%;">
		<div data-options="region:'north'" id="north" style="height:80px;background-position:center; background-color: #B3D8FE;position: relative; background-image: url('<%= request.getContextPath()%>/statics/css/images/webwxgetmsgimg.jpg');overflow: hidden;">
			<!-- Top -->
			<span class="topbtns" style="float: right; padding: 5px; padding-right: 30px;">
				<a href="javascript:location.reload()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload-black'">刷新</a>
				<!-- <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-opinion-black'">意见反馈</a> -->
				<!-- <a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-key'">密码</a> -->
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
						
						<select id="currProject" classs="easyui-combobox">
							<option value="">请选择</option>
							<c:forEach items="${sessionScope.loginUserProjects }" var="project">
								<option value="${project.projectId }"
									<c:if test="${sessionScope.loginUserProject.projectId==project.projectId }">
										selected="selected"
									</c:if>
								>${project.projectName }</option>
							</c:forEach>
						</select>
					</strong>
				</span>
			</div>
		</div>
		<div data-options="region:'south',split:true" style="height:35px;background-color: rgb(95,153,217);">
			<!-- buttom -->
			<p align="center" style="padding: 5px;">版权所有:广东天安工程监理有限公司</p>
		</div>
		<!-- <div data-options="region:'east',split:true" title="East" style="width:200px;"></div> -->
		<div data-options="region:'west',split:true" title="导航菜单" style="width:150px;background-color: #E1E7F1">
			<!-- left -->
			<div class="easyui-panel" style="padding:5px;background-color: #E1E7F1;border: none;">
				<ul id="menuTree" class="easyui-tree" data-options="url:'menu/findMenus.json',method:'get',animate:true,lines:true"></ul>
			</div>
			
		</div>
		<div data-options="region:'center',fit:true">
			<!-- right -->
			<div id="tt" class="easyui-tabs main_body" style="width:100%;height:100%;">
				<div id="home" title="我的首页" data-options="iconCls:'icon-home'" style="overflow: auto;width:100%;height:100%;">
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
	</div>

  </body>
</html>
