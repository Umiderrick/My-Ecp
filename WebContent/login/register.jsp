<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册</title>
<link href="../css/global.css" rel="stylesheet" type="text/css">
<link href="../css/user.css" rel="stylesheet" type="text/css">
<link href="../css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/openPop.js"></script>
<script type="text/javascript" src="../js/register.js"></script>
</head>
<body>
	<div class="ui_header">
		<div class="ui_reg_header">
			<div class="w990">
				<div class="ui_reg_header_line fl">
					<a href="#"><img src="../res/images/bg/line.png"></a>
				</div>
				<div class="ui_header_text fl">
					<a href="#">欢迎注册</a>
				</div>
			</div>
		</div>
		<div class="ui_header_bottom_bg"></div>
	</div>
	<div class="w990 regist_box">
		<div class="regist_left">
			<div class="member_register fn-clear">
				<div class="member_register_top">
					<h3>用户注册</h3>
				</div>
				<form action="register" method="post">
					<div class="member_register_rege">
						<div class="meber_register_list">
							<div class="meber_register_list_l">邮箱/用户名</div>
							<div class="meber_register_list_m">
								<input class="input_register01 txtAdmin" type="text"
									name="username">
								<div class="divAdmin">&nbsp;</div>
							</div>
						</div>
						<div class="meber_register_list">
							<div class="meber_register_list_l">设置密码</div>
							<div class="meber_register_list_m">
								<input class="input_register01 txtPassword" type="password"
									name="password">
								<div class="divPassword">&nbsp;</div>
							</div>
						</div>
						<div class="meber_register_list">
							<div class="meber_register_list_l">收货地址</div>
							<div class="meber_register_list_m">
								<input class="input_register01 txtPassword" type="text"
									name="address">
								<div class="divPassword">&nbsp;</div>
							</div>
						</div>
						<div class="meber_register_list">
							<div class="meber_register_list_l">联系电话</div>
							<div class="meber_register_list_m">
								<input class="input_register01 txtPassword" type="text"
									name="phone">
								<div class="divPassword">&nbsp;</div>
							</div>
						</div>
						<div class="meber_register_list">
							<div class="meber_register_list_l">
								用户类别 <select name="usertype">
									<option>10-会员</option>
									<option>20-管理员</option>
								</select>
							</div>
						</div>
						<div class="login_btn">
							<input type="submit" class="btn_zong big" value="提交"> <input
								type="reset" class="btn_zong big" value="清空">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>