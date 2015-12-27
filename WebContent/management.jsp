<%@ page language="java"  pageEncoding="UTF-8"%>
<html>
<head>
<meta content="text/html;charset =UTF-8" http-equiv="Content-Type">
<title>管理页面</title>
<link type="text/css" rel="stylesheet" href="css/global.css">
<link type="text/css" rel="stylesheet" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/toggleMenu.js" type="text/javascript"></script>
<script src="js/header.js" type="text/javascript"></script>
<script src="js/banner_slide.js" type="text/javascript"></script>
<script src="js/img_scroll.js" type="text/javascript"></script>
<script src="js/magni.js" type="text/javascript"></script>
<style>
dl {
    margin-bottom: 0;
    margin-top: 0;
}
.ui_header_logo .ui_header_logo_bg {
    background: rgba(0, 0, 0, 0) url("../res/images/bg/header_search.png") no-repeat scroll left center;
    margin: 0 auto;
    padding-bottom: 0;
    padding-top: 13px;
    width: 1200px;
}
</style>
</head>
<body>
	<div class="ui_header_nav">
		<div class="w1200">
			<ul class="first_menu">
				<li class="all_products"> <a class="hove" href="#">管理员界面</a>
					<ul class="second_menu">
						<li>
						<dl >
								<dt><a href="fir_type.jsp">类别管理界面</a></dt>
						</dl>
						</li>
						<li>
						<dl>
								<dt><a href="attribute.jsp">属性管理界面</a></dt>
						</dl>
						</li>
						<li>
						<dl>
								<dt><a href="item.jsp">商品管理界面</a></dt>
						</dl>
						</li>
						<li>
						<dl>
								<dt><a href="Salorderm.jsp">订单管理界面</a></dt>
						</dl>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>