<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>流程显示页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		*{
			margin: 0 ;
			padding: 0;
			font-size: 14px;
		}
		#flow{
			position: relative;
		}
		#flow>div{
			border: 2px solid red;
			float: left;
			position: absolute;
			top: 145px;
			display: none;
		}
		#new{
			left: 105px;
			width: 90px;
			height: 50px;
		}
		#audit{
			left: 200px;
			width: 62px;
			height: 50px;
		}
		#joint_trial{
			left: 270px;
			width: 62px;
			height: 50px;
		}
		#approver{
			left: 440px;
			width: 62px;
			height: 50px;
		}
		#publish{
			left: 516px;
			width: 90px;
			height: 50px;
		}
		#repostory{
			left: 625px;
			width: 90px;
			height: 50px;
		}
		#change{
			left: 720px;
			width: 58px;
			height: 50px;
		}
		#end{
			left: 775px;
			width: 90px;
			height: 50px;
		}
		
	</style>
	<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//alert($("#docStatusId").val());
			switch($("#docStatusId").val()){
				case "1":
				$("#new").show();
				break;
				case "2":
				$("#audit").show();
				break;
				case "3":
				$("#joint_trial").show();
				break;
				case "4":
				$("#approver").show();
				break;
				case "5":
				$("#publish").show();
				break;
				case "6":
				$("#change").show();
				break;
				case "9":
				$("#repostory").show();
				break;
				case "10":
				$("#end").show();
				break;
				
			
			}
		
		
		});
		
		
	
	
	</script>
  </head>
  
  <body>
    <div id="flow">
    	<img src="<%=request.getContextPath() %>/statics/images/flowback.png"/>
    	<div id="new"></div>
    	<div id="audit"></div>
    	<div id="joint_trial"></div>
    	<div id="approver"></div>
    	<div id="publish"></div>
    	<div id="repostory"></div>
    	<div id="change"></div>
    	<div id="end"></div>
    </div>
    <input id="docStatusId" value="${docStatusId }" type="hidden">
  </body>
</html>
