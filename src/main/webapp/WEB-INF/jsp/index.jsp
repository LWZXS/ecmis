<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>天安监理</title>
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/statics/css/images/logo32px.png">
	<link rel="apple-touch-icon" href="<%=request.getContextPath() %>/statics/css/images/images/logo57px.png">
	<link rel="apple-touch-icon" sizes="72x72" href="<%=request.getContextPath() %>/statics/css/images/images/logo72px.png">
	<link rel="apple-touch-icon" sizes="114x114" href="<%=request.getContextPath() %>/statics/css/images/images/logo114px.png">
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"></link>
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/statics/localcss/common.css" type="text/css"></link>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
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
			$("#rightContent").css("height",winHeight>800?(winHeight-230)+"px":"550px");
			$("#tt,.main_body").css("width",winWidth>1366?(winWidth-200)+"px":"1160px");
			
			$(window).resize(function() {
				$("#rightContent").css("height",winHeight>800?(winHeight-230)+"px":"550px");
				$("#tt,.main_body").css("width",winWidth>1366?(winWidth-200)+"px":"1160px");
				
			});
			
  			$(".tabs li a.tabs-inner").click(function(){
  				//$("#indexIframe").attr("src","<%=request.getContextPath() %>/index.jsp");
  				var target=$(this).children().first().html();
  				switch(target){
  					case "工程文件管理":
	  					$("#fileIframe").show().siblings().hide();
	  					break;
  					case "影像资料管理":
	  					$("#imageIframe").show().siblings().hide();
	  					break;
  					case "竣工资料管理":
	  					$("#completionIframe").show().siblings().hide();
	  					break;
  					default:
	  					$("#indexIframe").show().siblings().hide();
	  					break;
  				}
  				//$("#"+target).show().siblings().hide();
  				//alert($(this).children().first().html());
  			});
  			
  			
  		});
  	
		function addPanel(obj,type,title){
			$("#"+type+"Iframe").show().siblings().hide();
			if($('#tt').tabs('exists',title)){
				$('#tt').tabs('select',title);
			}else{
				if(type=="file"){
					$('#tt').tabs('add',{
						title: title,
						content: '<div id='+type+' style="padding:10px"><div class="easyui-panel" style="padding:5px;"><a href="document/index.html" target="fileIframe" onclick="includePage(this);" class="easyui-linkbutton" option="innerFile" data-options="plain:true" style="margin:0 20px;">内部文档</a>|<a href="javascript:void(0)" target="fileIframe" onclick="includePage(this)" option="pigeonholeFile" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">归档文档</a>|<a href="javascript:void(0)" target="fileIframe" onclick="includePage(this)" class="easyui-linkbutton" option="systemSet" data-options="plain:true" style="margin:0 20px;">系统设置</a></div></div>',
						closable: true,
						iconCls:'icon-'+type
					});
/* 					$('#tt').tabs('add',{
						title: title,
						content: '<div id='+type+' style="padding:10px"><div class="easyui-panel" style="padding:5px;"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">内部文档</a>|<a href="javascript:void(0)" onclick="includePage('pigeonhole')" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">归档文档</a>|<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">系统设置</a></div></div>',
						closable: true,
						iconCls:'icon-'+type
					}); */
				}else if(type=="image"){
					$('#tt').tabs('add',{
						title: title,
						content: '<div id='+type+' style="padding:10px"><div class="easyui-panel" style="padding:5px;"><a href="javascript:void(0)"  target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">临时影像库</a>|<a href="javascript:void(0)" target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">正式影像库</a>|<a href="javascript:void(0)" target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">网站显示库</a>|<a href="#" target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">类型管理</a></div></div>',
						closable: true,
						iconCls:'icon-'+type
					});
				}else if(type="completion"){
					$('#tt').tabs('add',{
						title: title,
						content: '<div id='+type+' style="padding:10px"><div class="easyui-panel" style="padding:5px;"><a href="javascript:void(0)" target="completionframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">竣工资料管理</a>|<a href="javascript:void(0)" target="completionframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">目录号管理</a>|<a href="javascript:void(0)" target="completionframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">档案管理</a></div></div>',
						closable: true,
						iconCls:'icon-'+type
					});
				}
			}
			
			
		}
		
		function includePage(obj){
			$(obj).css("background","gray").siblings().css("background","#fff");
			//alert($(obj).attr("target"));
			var target=$(obj).attr("target");
			$("#"+target).show().siblings().hide();
		}
		
	</script>
  	
  </head>
  
  <body style="padding: 10px; margin: 0 auto;" class="main_body">
	<div id="tt" class="easyui-tabs main_body" style="width:100%;height:90px;">
		<div id="home" title="我的首页" data-options="iconCls:'icon-home'" style="padding:10px;overflow: hidden;">
			<div class="easyui-panel" style="padding:5px;width:100%;height:100%; ">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;" onclick="addPanel(this,'file','工程文件管理');">工程文件管理</a>
				<!-- <li class="btn_list"><button class="btn" onclick="addPanel(this,'system','系统设置');">系统设置</button></li> -->
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;" onclick="addPanel(this,'image','影像资料管理');">影像资料管理</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;" onclick="addPanel(this,'completion','竣工资料管理');">竣工资料管理</a>
			</div>
		</div>
		<div id="file" title="工程文件管理" data-options="iconCls:'icon-file'" style="padding:10px;overflow: hidden;">
			<div class="easyui-panel" style="padding:5px;">
				<a href="document/inner.html" target="fileIframe" onclick="includePage(this);" class="easyui-linkbutton" option="innerFile" data-options="plain:true" style="margin:0 20px;">内部文档</a>|
				<a href="document/pigeonhole.html" target="fileIframe" onclick="includePage(this)" option="pigeonholeFile" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">归档文档</a>|
				<a href="document/system.html" target="fileIframe" onclick="includePage(this)" class="easyui-linkbutton" option="systemSet" data-options="plain:true" style="margin:0 20px;">系统设置</a>
			</div>
		</div>
		<div id="image" title="影像资料管理" data-options="iconCls:'icon-image'" style="padding:10px;overflow: hidden;">
			<div class="easyui-panel" style="padding:5px;">
				<a href="javascript:void(0)"  target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">临时影像库</a>|
				<a href="javascript:void(0)" target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">正式影像库</a>|
				<a href="javascript:void(0)" target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">网站显示库</a>|
				<a href="#" target="imageIframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">类型管理</a>
			</div>
		</div>
		<div id="completion" title="竣工资料管理" data-options="iconCls:'icon-completion'" style="padding:10px;overflow: hidden;">
			<div class="easyui-panel" style="padding:5px;">
				<a href="javascript:void(0)" target="completionframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">竣工资料管理</a>|
				<a href="javascript:void(0)" target="completionframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">目录号管理</a>|
				<a href="javascript:void(0)" target="completionframe" onclick="includePage(this);" class="easyui-linkbutton" data-options="plain:true" style="margin:0 20px;">档案管理</a>
			</div>
		</div>
	</div>
	<div class="separate"></div>
	<div style="overflow:auto; height: 100%; width: 100%;" id="rightContent">
		<iframe id="indexIframe" name="indexIframe" scrolling="yes" frameborder="0"  src="<%=request.getContextPath() %>/index.jsp" style="width:100%;height:100%;"></iframe>
		<iframe id="fileIframe" name="fileIframe" scrolling="yes" frameborder="0"  src="<%=request.getContextPath() %>/document/inner.html" style="width:100%;height:100%;display: none;"></iframe>
		<iframe id="imageIframe" name="imageIframe" scrolling="yes" frameborder="0"  src="<%=request.getContextPath() %>/index.jsp" style="width:100%;height:100%;display: none;"></iframe>
		<iframe id="completionIframe" name="completionframe" scrolling="yes" frameborder="0"  src="<%=request.getContextPath() %>/index.jsp" style="width:100%;height:100%;display: none;"></iframe>
	</div>
	<footer class="main_body"></footer>
  </body>
</html>
