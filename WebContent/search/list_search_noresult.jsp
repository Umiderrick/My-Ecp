<%@ page language="java"
	import="java.util.*,pb.db.*,pb.firsttype.*,pb.secondtype.*,pb.thirdtype.*,pb.attribute.*,pb.attributeg.*"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>搜索无结果页面</title>
<link href="../css/global.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/pshow.css" type="text/css" />
<link href="css/user.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/user_menu_list.js"></script>
<script type="text/javascript" src="../js/openPop.js"></script>
<script type="text/javascript" src="../js/toggleMenu.js"></script>
<script type="text/javascript" src="../js/banner_slide.js"></script>
<script type="text/javascript" src="../js/magni.js"></script>
<script type="text/javascript" src="../js/img_scroll.js"></script>
<script type="text/javascript" src="../js/header.js"></script>
<script type="text/javascript">
	$(function() {
		toggleMenu(".all_products", ".second_menu", ".third_menu");
		_scroll(5, ".last_view_con", false, false);

	})

	$(function() {
		$(".openP").click(function() {//打开层
			openPop({
				cover_layer : ".cover_layer",
				list_qr_pop : ".themes_alert"
			});
		});
		$(".web_win_close").click(function() {//关闭层
			closePop(".themes_alert", ".cover_layer")
		})
	});
	$(function() {
		toggleMenu(".all_products", ".second_menu", ".third_menu");
		_scroll(5, ".last_view_con", false, false);
		if("<%=session.getAttribute("userName")%>" == "null") {
			$("#welcom").show();
			$("#welcoml").hide();
		} else {
			$("#welcoml").show();
			$("#welcom").hide();
		}

	})
</script>
<style>
.search_noresult {
	padding-bottom: 60px;
}

.search_noresult h3 {
	background: url(../res/images/icon/cart_order_tip_bg.png) 100px -397px
		no-repeat;
	font-size: 24px;
	color: #ff8800;
	font-family: "微软雅黑";
	padding: 18px 0 50px 180px;
	font-weight: normal;
	border-bottom: 1px solid #e3e3e3;
	width: 780px;
	margin: 25px auto;
}

.search_noresult p {
	padding-left: 800px;
	color: #333;
	padding-bottom: 4px;
}

.input_search185 {
	width: 185px;
	height: 25px;
	line-height: 25px;
	border: 1px solid #e6e2e1;
	padding-left: 3px;
	margin-right: 10px;
}
</style>
</head>
<body>
	<div class="ui_header">
		<div class="ui_header_top">
			<div class="w1200">
				<div id="welcoml" class="welcome">
					<span>您好！</span>
					<%=session.getAttribute("userName")%>
					<span> 请尽情的购买</span>
				</div>
				<div id="welcom" class="welcome">
					<span>您好！</span> <span><a href="../login/login.jsp"><b>请登录</b></a></span>
				</div>
			</div>
		</div>
		<div class="ui_header_logo">
			<div class="ui_header_logo_bg">
				<div class="w1200">
					<div class="ui_header_logo_pic">
						<a href="#"><img src="../res/images/bg/logo.png" /></a>
					</div>
					<div class="ui_header_logo_search">
						<div class="serch_box">
							<input type="text" placeholder="请输入关键字" />
							<button>搜索</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ui_header_nav">
			<div class="w1200">
				<ul class="first_menu">
					<li><a href="../index.jsp">首页</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="search_noresult">
		<h3>很抱歉，没有找到相关的商品！</h3>
		<p>1、看看输入的文字是否有误</p>
		<p >2、调整关键字</p>
	</div>
</body>
</html>

