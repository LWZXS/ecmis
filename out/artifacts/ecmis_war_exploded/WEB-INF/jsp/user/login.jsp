<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>

	<jsp:include page="/WEB-INF/jsp/title.jsp"></jsp:include>	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 文档模式  -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
			font-size: 12px;
		}
		body {
			background-color: #E8EBF0;
		}
		
		.content{
			width: 940px;
			height: 600px;
			margin: auto auto;
			background-color: #fff;
		}
		
		.content .title{
			margin-left: 20px;
		}
		.content .title .login2new{
			margin-left: 210px;
		}
		.content .bg_img{
			width: 600px;
			margin: 0 auto;
		}
		
		.content .loginBar .login_left{
			margin-left: 20px;
		}
		.loginBar>div{
			float: left;
		}
		
		.content .loginBar .login_right{
			margin-top: 14px;
			margin-left:40px;
			background-color: #F2F5F8;
			width: 450px;
			height: 180px;
			
		}
		.content .loginBar .login_right>div{
			float: left;
		}
		.input{
			background-color: #FAFFBD;
			height: 27px;
			width: 220px;
		}
		.content .loginBar .login_right>div tr{
			margin: 5px 0px
		}
		.rememberPwd input,.rememberPwd label{
			vertical-align: middle;
		}
		#rememberPwd{
			margin-top: 2px;
		}
		footer{
			width:210px;
			margin: 0 auto;
			line-height: 28px;
		}
		.clear{
			display: block;
			content: '';
			clear: both;
			
		}
		
		
	</style>
	
	
  <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>
  <script type="text/javascript">
  	var win;
  	function getParent(win){
  		if(win.parent){
  			win=win.parent;
  			return getParent();
  		}
  		
  	}
  	
  	
  	$(function(){
  		var winHeight;
  		if (window.innerHeight){
			winHeight = window.innerHeight;
  		}else if ((document.body) && (document.body.clientHeight)){
			winHeight = document.body.clientHeight;
  		}
  		
  		//alert(winHeight); 
  		$(".content").css("margin-top",winHeight>600?(winHeight-600)/2+"px":"0px");
  		
  		$("#submit").click(function(){
  			var loginNameEle=document.getElementById("loginName");
  			var loginPwdEle=document.getElementById("loginPwd");
  			if(loginNameEle.validity.valueMissing){
  				loginNameEle.setCustomValidity("用户名不能为空!");
  			}else if(loginNameEle.validity.patternMismatch){
  				loginNameEle.setCustomValidity("请输入4-16位英文和数字组合!");
  			}else{
  				loginNameEle.setCustomValidity("");
  			}
  			
  			if(loginPwdEle.validity.valueMissing){
  				loginPwdEle.setCustomValidity("密码不能为空!");
  			}else if(loginPwdEle.validity.patternMismatch){
  				loginPwdEle.setCustomValidity("请输入4-16位英文和数字组合!");
  			}else{
  				loginPwdEle.setCustomValidity("");
  			}
  		});
  	
  	});
  	
  	window.onresize=function(){
  		var winHeight;
  		if (window.innerHeight){
			winHeight = window.innerHeight;
  		}else if ((document.body) && (document.body.clientHeight)){
			winHeight = document.body.clientHeight;
  		}
  		//alert(winHeight); 
  		$(".content").css("margin-top",winHeight>600?(winHeight-600)/2+"px":"0px");
  	
  	};
  	
  
	
  </script>
  </head>
  
  <body>
    <div class="content">
    	<div class="title">
    		<img src="<%=request.getContextPath() %>/statics/css/loginimages/logo.jpg"/>
    		<img class="login2new" src="<%=request.getContextPath() %>/statics/css/loginimages/logo2new.jpg" width="246px"/>
    	</div>
    	<div class="bg_img">
    		<img src="<%=request.getContextPath() %>/statics/css/loginimages/big_logo.png"/>
    	</div>
    	<div class="loginBar">
    	
    		<div class="login_left">
    			<img src="<%=request.getContextPath() %>/statics/css/loginimages/lodingtips.png"/>
    		</div>
    		<div class="login_right">
	    		<div>
	    			<img src="<%=request.getContextPath() %>/statics/css/loginimages/login_left.png"/>
	    		</div>
    			<div>
    				<form action="user/dologin.html" id="loginFrm" method="post">
	    				<table cellpadding="0" cellspacing="10">
	    					<tr>
	    						<td>
	    							<label for="loginName">用户名：</label>
	    						</td>
	    						<td>
	    							<input class="input" id="loginName" name="loginName" value="${param.loginName }" pattern="[0-9a-zA-Z]{4,16}" required placeholder="请输入4-16位英文和数字" />
	    						</td>
	    					</tr>
	    					<tr>
	    						<td>
	    							<label for="loginPwd">密码：</label>
	    						</td>
	    						<td>
	    							<input class="input" id="loginPwd" type="password" name="password" value="${param.password }" pattern="[0-9a-zA-Z]{4,16}" required placeholder="请输入4-16位英文和数字" />
	    						</td>
	    					</tr>
	    					<tr>
	    						<td colspan="2">
	    							<span id="msg" style="color: red;">${msg }</span>
	    						</td>
	    					</tr>
	    					<tr>
	    						<td>
	    							
	    						</td>
	    						<td class="rememberPwd">
	    							<input type="checkbox" name="rememberPwd" value="true" id="rememberPwd" />&nbsp;&nbsp;<label for="rememberPwd">记住密码</label>
	    						</td>
	    					</tr>
	    					<tr>
	    						
	    						<td colspan="2" align="center">
	    							<input id="submit" type="image" src="<%=request.getContextPath() %>/statics/css/loginimages/landing_dl.png" />
	    							&nbsp;&nbsp;
	    							<img src="<%=request.getContextPath() %>/statics/css/loginimages/landing_collection.png" />
	    						</td>
	    					
	    					</tr>
	    				</table>
    				</form>
    			</div>
    		</div>
    	</div>
    	<footer class="clear">
    		版权所有：广东天安工程监理有限公司
    	</footer>
    </div>
	
  </body>
</html>
