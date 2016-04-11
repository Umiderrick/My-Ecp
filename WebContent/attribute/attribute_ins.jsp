<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset =UTF-8">
<title>新增属性</title>
<link type="text/css" rel="stylesheet" href="../css/global.css">
<link type="text/css" rel="stylesheet" href="../css/login.css">
<script type="text/javascript">
	function submitMyForm() {
		var myForm = document.getElementById('attform');
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
				<h3>属性录入</h3>
			</div>
			<div class="login_reg">
			<form id='attform' action="AttributeinsServlet" method="post">
					<div class="login_pass_span">
						<span> 属性编号 </span>
					</div>
					<div class="login_pass_input">
						<input type="text" name="attid">
					</div>
					<div class="login_pass_span">
						<span> 属性名称 </span>
					</div>
					<div class="login_pass_input">
						<input type="text" name="attname">
					</div>
					<div class="login_btn">
						<a class="btn_zong big" onclick="submitMyForm();">录入</a>
					</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>