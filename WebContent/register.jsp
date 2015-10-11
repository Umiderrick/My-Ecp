<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/user.css">
<link type="text/css" rel="stylesheet" href="css/register.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/openPop.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<!--网站注册页-->
<script type="text/javascript">
//注册页效果
$(function(){
	window.flag=true;
	//注册验证
	$(".meber_register_list_m").find("input").not(":checkbox").on({"blur":function(e){
		if(trim($(this).val())==""){
			$(this).next("div[^=div]").addClass("error").removeClass("info");	
			$(this).next("div[^=div]").text("不能为空");
			flag=false;
		}	
		}})
	$(".txtAdmin").on({"focus":admin_focus,"blur":admin_blur})
	//密码
	$(".txtPassword").on({"focus":password_focus,"blur":password_blur});
	//确认密码
	$(".input_register02").focus(function(){
		code_focus();	
	})
	})
	
	
</script>
<style>
.member_register_button .btn_zong.big span { letter-spacing:5px;}
.meber_register_list_m input{ line-height:20px; *line-height:16px;}
.btn_tybzc,.btn_tybzc:hover{width:322px; display:block; margin:0 auto;height:34px;line-height:34px; text-align:center;background: #a48169;color:#fff;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;font-family: "微软雅黑";font-size: 16px;font-weight:400; text-decoration:none;margin-top:20px;}
</style>
</head>


<body>
<div class="ui_header">
  <div class="ui_reg_header">
   <div class="w990">
        <div class="ui_reg_header_logo fl"> <a href="#"><img src="res/images/bg/header_logo.png"></a> </div>
        <div class="ui_reg_header_line fl"> <a href="#"><img src="res/images/bg/line.png"></a> </div>
        <div class="ui_header_text fl"> <a href="#">欢迎注册</a> </div>
   </div>
  </div>
  <div class="ui_header_bottom_bg"></div>
</div>
<!-- end 头部结束 --> 
<div class="w990 regist_box">
	<div class="regist_left">
		<div class="member_register fn-clear">
				<div class="member_register_top">
					<h3>用户注册</h3>
				</div>
	<form action="register" method="post">
		<table>
			<tr>
				<div class="meber_register_list_l">用户名</div>
				<div class="meber_register_list_m">
					<input type="text" class="input_register01 txtAdmin" name="username"/>
					<div class="divAdmin">&nbsp;</div>
				</div>
			</tr>
			<tr>
				<div class="meber_register_list_l">密码</div>
				<div class="meber_register_list_m">
					<input type="text" class="input_register01 txtAdmin" name="password"  />
					<div class="divAdmin">&nbsp;</div>
				</div>
			</tr>
			<tr>
				<div class="meber_register_list_l">用户类别
					<select name ="usertype">
        					<option>10-会员</option>     
        					<option>20-管理员</option>     	
 			     	</select>
 			     </div>
			</tr>
			<tr>
				<td><input type="submit" class="btn_zong big" value="提交"></td>
				<td><input type="reset" class="btn_zong big" value="清空"></td>
			</tr>
		</table>
	</form>
	</div>
	</div>
</div>

	
</div>
	
</body>
</html>