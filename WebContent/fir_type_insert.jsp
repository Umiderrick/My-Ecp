<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset =UTF-8">
<title>新增一级类别</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/login.css">
<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/register.js" type="text/javascript"></script>
<script type="text/javascript">
function submitMyForm(){
	var myForm =document.getElementById('Firtypeform');
	myForm.submit();
}
</script>
<style>
	.place_mid{margin:0 auto;width :500px;}
</style>
</head>

<body>
<div class="w990">
		<div class="place_mid">
			<div class="login_title">
				<h3>
					商品录入
				</h3>
			</div>
			<form id='Firtypeform' action="FirtypeinsServlet" method="post">
			<table>
					<div class="login_user_span">
					<span>
						商品大类编号
					</span>
					</div>
					<div class="login_pass_input">
						<input type="text" name ="firtypeid">
					</div>
					<div class="login_pass_span">
						<span>
							商品大类名称
						</span>
					</div>
					<div class="login_pass_input">
						<input type="text" name ="firtypename">
					</div>
				<div class="login_btn">
					<a class="btn_zong big" onclick="submitMyForm();">录入</a>
				</div>
			</table>
			</form>
		</div>	
</div>
</body>
</html>