<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset =UTF-8">
<title>录入评论</title>
<link type="text/css" rel="stylesheet" href="../css/global.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<script type="text/javascript">
	function submitremarkForm() {
		var myForm = document.getElementById('remarkform');
		myForm.submit();
	}
</script>
<style>
.place_mid {
	margin: 0 auto;
	width: 500px;
}
</style>
</head>
<body>
<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>评价录入</h3>
			</div>
			<div class ="login_reg">
			<form id='remarkform' action="RemarkServlet" method="post">
					<div class="login_pass_span">
						<span> 评价内容 </span>
					</div>
					<div class="login_pass_input">
						<input type="text" name="neirong">
					</div>
					<div class="login_pass_span">
						<span> 评价等级 </span>
					</div>
					<div class="login_pass_input">
						<select name="levels">
								<option>好</option>
								<option>中</option>
								<option>差</option>
						</select>
					</div>
					<div class="login_btn">
						<a class="btn_zong big" onclick="submitremarkForm();">录入</a>
					</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>