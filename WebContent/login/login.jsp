<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/global.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/register.js"></script>
<script>
function myReload() {  
    document.getElementById("CreateCheckCode").src = document.getElementById("CreateCheckCode").src + "?nocache=" + new Date().getTime();  
} 
</script>
<title>登陆页面</title>
</head>
<body>
	<div class="ui_header">
		<div class="ui_header_top"></div>
		<div class="ui_reg_header">
			<div class="w990">
				<div class="ui_reg_header_line fl">
					<a><img src="../res/images/bg/line.png"></a>
				</div>
				<div class="ui_header_text fl">
					<a>欢迎登录</a>
				</div>
			</div>
		</div>
	</div>
	<div class="w990">
		<div class="login">
			<div class="login_content">
				<div class="login_title">
					<h3>用户登录</h3>
				</div>

				<div class="login_reg">
					<form id='MyForm' action="login" method="post">
						<div class="login_user_span">
							<span>用户名</span>
						</div>
						<div class="login_user_input">
							<input class="username" type="text" name="username">
						</div>
						<div class="login_pass_span">
							<span> 密码 </span>
						</div>
						<div class="login_pass_input">
							<input class="password" type="password" name="password">
						</div>
						<div class="login_pass_span">
							<span> 验证码 </span>
						</div>
						<div class="login_pass_input">
						<input name="checkCode" type="text" id="checkCode" title="验证码区分大小写"  size="8"  maxlength="4" />  
						</div>
            			<img src="PictureCheckCode" id="CreateCheckCode" align="middle">  
           				 <a href="" onclick="myReload()"> 看不清,换一个</a>
						<div class="login_btn">
							<input type="submit" class="btn_zong big" value="登录"> <input
								type="reset" class="btn_zong big" value="重置">
						</div>
						<a class="btn_zong big" href="register.jsp">注册</a>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>